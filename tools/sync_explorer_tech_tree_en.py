#!/usr/bin/env python3
"""Sync explorer/tech_tree.csv text fields from the English Lua source."""

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

    for block in iter_top_level_blocks(text, "csv.explorer.tech_tree = {"):
        row_id = extract_int_field(block, "id")
        if not row_id:
            continue
        values: dict[str, str] = {}
        for field in ("name", "attrDesc", "attrAddDesc1", "attrAddDesc2"):
            value = extract_string_field(block, field)
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
    text_columns = ("name", "attrDesc", "attrAddDesc1", "attrAddDesc2")
    indexes = {column: header.index(column) for column in text_columns}

    stats = {
        "name_updates": 0,
        "attrDesc_updates": 0,
        "attrAddDesc1_updates": 0,
        "attrAddDesc2_updates": 0,
        "unchanged": 0,
    }
    missing_source: list[tuple[int, str]] = []
    unresolved: list[tuple[int, str, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue

        row_id = row[0]
        if not row_id:
            continue
        source_values = source_entries.get(row_id)
        if source_values is None:
            missing_source.append((line_number, row_id))
            if any(has_cjk(row[indexes[column]]) for column in text_columns if len(row) > indexes[column]):
                unresolved.append((line_number, row_id, row[indexes["name"]], row[indexes["attrDesc"]]))
            continue

        changed = False
        for column in text_columns:
            index = indexes[column]
            current = row[index]
            source_value = source_values.get(column)

            if source_value is None:
                continue
            if not args.force and current and not has_cjk(current):
                continue
            if current != source_value:
                row[index] = source_value
                stats[f"{column}_updates"] += 1
                changed = True

        if not changed:
            stats["unchanged"] += 1

        if any(has_cjk(row[indexes[column]]) for column in text_columns if len(row) > indexes[column]):
            unresolved.append((line_number, row_id, row[indexes["name"]], row[indexes["attrDesc"]]))

    print(f"encoding={encoding}")
    print(f"source_entries={len(source_entries)}")
    print(f"rows={sum(1 for row in rows[3:] if row and row[0])}")
    for key in ("name_updates", "attrDesc_updates", "attrAddDesc1_updates", "attrAddDesc2_updates", "unchanged"):
        print(f"{key}={stats[key]}")
    print(f"missing_source_rows={len(missing_source)}")
    print(f"remaining_cjk_rows={len(unresolved)}")
    for line_number, row_id in missing_source[:20]:
        print(f"missing_source line={line_number} id={row_id}")

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding=encoding) as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--source",
        type=Path,
        default=Path("game_origin_config/explorer/tech_tree.lua"),
    )
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/explorer/tech_tree.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--force", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
