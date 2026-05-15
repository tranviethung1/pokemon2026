#!/usr/bin/env python3
"""Sync fishing/partner.csv display fields from the English Lua source."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def unescape_lua_string(value: str) -> str:
    replacements = {
        r"\"": '"',
        r"\n": "\n",
        r"\r": "\r",
        r"\t": "\t",
        r"\\": "\\",
    }
    for old, new in replacements.items():
        value = value.replace(old, new)
    return value.replace("\u00a0", " ")


def extract_string_field(block: str, field_name: str) -> str | None:
    match = re.search(
        rf"\n\s*{re.escape(field_name)}\s*=\s*\"((?:[^\"\\]|\\.)*)\"",
        block,
    )
    if not match:
        return None
    return unescape_lua_string(match.group(1))


def extract_int_field(block: str, field_name: str) -> str | None:
    match = re.search(rf"\n\s*{re.escape(field_name)}\s*=\s*(\d+)", block)
    if not match:
        return None
    return match.group(1)


def iter_top_level_blocks(text: str, marker: str):
    start = text.index(marker)
    index = text.index("{", start) + 1
    depth = 1
    in_string = False
    escaped = False
    block_start: int | None = None

    while index < len(text) and depth:
        char = text[index]
        if in_string:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = False
        else:
            if char == '"':
                in_string = True
            elif char == "{":
                if depth == 1:
                    block_start = index
                depth += 1
            elif char == "}":
                depth -= 1
                if depth == 1 and block_start is not None:
                    yield text[block_start : index + 1]
                    block_start = None
        index += 1


def load_source_entries(path: Path) -> dict[str, dict[str, str]]:
    entries: dict[str, dict[str, str]] = {}
    text = path.read_text(encoding="utf-8")

    for block in iter_top_level_blocks(text, "csv.fishing.partner = {"):
        row_id = extract_int_field(block, "id")
        if not row_id:
            continue
        values: dict[str, str] = {}
        for field, fallback in (("name_en", "name"), ("desc_en", "desc")):
            value = extract_string_field(block, field) or extract_string_field(block, fallback)
            if value is not None:
                values[field] = value
        entries[row_id] = values

    return entries


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def detect_encoding(path: Path) -> str:
    data = path.read_bytes()
    if data.startswith(b"\xef\xbb\xbf"):
        return "utf-8-sig"
    for encoding in ("utf-8", "gb18030"):
        try:
            data.decode(encoding)
            return encoding
        except UnicodeDecodeError:
            continue
    raise SystemExit(f"unable to decode {path}")


def read_csv_rows(path: Path) -> tuple[list[list[str]], str]:
    encoding = detect_encoding(path)
    with path.open(encoding=encoding, newline="") as handle:
        return list(csv.reader(handle)), encoding


def sync(args: argparse.Namespace) -> int:
    source_entries = load_source_entries(args.source)
    rows, encoding = read_csv_rows(args.target)
    lineterminator = detect_lineterminator(args.target)

    if len(rows) < 3:
        raise SystemExit("target CSV must include metadata, default, and description rows")

    header = rows[0]
    name_index = header.index("name")
    desc_index = header.index("desc")
    name_en_index = header.index("name_en")
    desc_en_index = header.index("desc_en")

    stats = {
        "name_updates": 0,
        "desc_updates": 0,
        "name_en_updates": 0,
        "desc_en_updates": 0,
        "unchanged": 0,
    }
    missing_source: list[tuple[int, str]] = []
    unresolved: list[tuple[int, str, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or not row[0]:
            continue

        row_id = row[0]
        source_values = source_entries.get(row_id)
        if source_values is None:
            missing_source.append((line_number, row_id))
            if has_cjk(row[name_index]) or has_cjk(row[desc_index]):
                unresolved.append((line_number, row_id, row[name_index], row[desc_index]))
            continue

        changed = False
        name_en = source_values.get("name_en")
        desc_en = source_values.get("desc_en")

        if name_en is not None:
            if row[name_en_index] != name_en:
                row[name_en_index] = name_en
                stats["name_en_updates"] += 1
                changed = True
            if row[name_index] != name_en:
                row[name_index] = name_en
                stats["name_updates"] += 1
                changed = True

        if desc_en is not None:
            if row[desc_en_index] != desc_en:
                row[desc_en_index] = desc_en
                stats["desc_en_updates"] += 1
                changed = True
            if row[desc_index] != desc_en:
                row[desc_index] = desc_en
                stats["desc_updates"] += 1
                changed = True

        if not changed:
            stats["unchanged"] += 1

        if has_cjk(row[name_index]) or has_cjk(row[desc_index]):
            unresolved.append((line_number, row_id, row[name_index], row[desc_index]))

    print(f"encoding={encoding}")
    print(f"source_entries={len(source_entries)}")
    print(f"rows={sum(1 for row in rows[3:] if row and row[0])}")
    for key in ("name_updates", "desc_updates", "name_en_updates", "desc_en_updates", "unchanged"):
        print(f"{key}={stats[key]}")
    print(f"missing_source_rows={len(missing_source)}")
    print(f"remaining_cjk_rows={len(unresolved)}")
    for line_number, row_id in missing_source[:20]:
        print(f"missing_source line={line_number} id={row_id}")

    if args.dry_run:
        return 0

    with args.target.open("w", encoding=encoding, newline="") as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--source",
        type=Path,
        default=Path("game_origin_config/fishing/partner.lua"),
    )
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/fishing/partner.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
