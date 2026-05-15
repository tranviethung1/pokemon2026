#!/usr/bin/env python3
"""Sync dispatch_task/tasks.csv name and desc fields from the English Lua source."""

from __future__ import annotations

import argparse
import csv
import io
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


def load_source_entries(path: Path) -> dict[str, tuple[str | None, str | None]]:
    entries: dict[str, tuple[str | None, str | None]] = {}
    text = path.read_text(encoding="utf-8")

    for block in iter_top_level_blocks(text, "csv.dispatch_task.tasks = {"):
        row_id = extract_int_field(block, "id")
        if not row_id:
            continue
        name = extract_string_field(block, "name_en") or extract_string_field(block, "name")
        desc = extract_string_field(block, "desc_en") or extract_string_field(block, "desc")
        entries[row_id] = (name, desc)

    return entries


def load_dictionary(path: Path) -> dict[str, str]:
    mapping: dict[str, str] = {}
    source_index: int | None = None
    english_index: int | None = None

    for raw_line in path.read_text(encoding="utf-8").splitlines():
        if not raw_line.startswith("|"):
            source_index = None
            english_index = None
            continue

        cells = [cell.strip() for cell in raw_line.strip().strip("|").split("|")]
        if all(set(cell) <= {":", "-", " "} for cell in cells):
            continue

        if "English" in cells:
            english_index = cells.index("English")
            if "Gốc (CN)" in cells:
                source_index = cells.index("Gốc (CN)")
            elif "Gốc (CSV)" in cells:
                source_index = cells.index("Gốc (CSV)")
            elif english_index >= 2:
                source_index = english_index - 1
            else:
                source_index = 0
            continue

        if source_index is None or english_index is None:
            continue
        if max(source_index, english_index) >= len(cells):
            continue

        source = cells[source_index]
        english = cells[english_index]
        if source and english and not source.startswith(":"):
            mapping.setdefault(source, english)

    return mapping


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


def choose_value(
    current: str,
    source_value: str | None,
    dictionary: dict[str, str],
    *,
    force: bool,
) -> tuple[str, str | None]:
    if not force and current and not has_cjk(current):
        return current, None

    for origin, candidate in (
        ("source", source_value),
        ("dictionary", dictionary.get(current)),
    ):
        if candidate and not has_cjk(candidate):
            return candidate, origin

    return current, None


def sync(args: argparse.Namespace) -> int:
    source_entries = load_source_entries(args.source)
    dictionary = load_dictionary(args.dictionary)
    rows, encoding = read_csv_rows(args.target)
    lineterminator = detect_lineterminator(args.target)

    if len(rows) < 3:
        raise SystemExit("target CSV must include metadata, default, and description rows")

    header = rows[0]
    name_index = header.index("name")
    desc_index = header.index("desc")

    stats = {
        "name_source": 0,
        "name_dictionary": 0,
        "desc_source": 0,
        "desc_dictionary": 0,
        "unchanged": 0,
    }
    unresolved: list[tuple[int, str, str, str]] = []
    missing_source: list[tuple[int, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue

        row_id = row[0]
        if row_id not in source_entries:
            missing_source.append((line_number, row_id))
            continue

        source_name, source_desc = source_entries[row_id]
        changed = False

        new_name, name_origin = choose_value(
            row[name_index],
            source_name,
            dictionary,
            force=args.force,
        )
        new_desc, desc_origin = choose_value(
            row[desc_index],
            source_desc,
            dictionary,
            force=args.force,
        )

        if name_origin:
            row[name_index] = new_name
            stats[f"name_{name_origin}"] += 1
            changed = True
        if desc_origin:
            row[desc_index] = new_desc
            stats[f"desc_{desc_origin}"] += 1
            changed = True
        if not changed:
            stats["unchanged"] += 1

        if has_cjk(row[name_index]) or has_cjk(row[desc_index]):
            unresolved.append((line_number, row_id, row[name_index], row[desc_index]))

    total_updates = sum(value for key, value in stats.items() if key != "unchanged")
    print(f"encoding={encoding}")
    print(f"source_entries={len(source_entries)}")
    print(f"rows={sum(1 for row in rows[3:] if row)}")
    print(f"updates={total_updates}")
    for key in ("name_source", "name_dictionary", "desc_source", "desc_dictionary", "unchanged"):
        print(f"{key}={stats[key]}")
    print(f"missing_source_rows={len(missing_source)}")
    print(f"remaining_cjk_rows={len(unresolved)}")
    for line_number, row_id in missing_source[:20]:
        print(f"missing_source line={line_number} id={row_id}")
    for line_number, row_id, name, desc in unresolved[:20]:
        print(f"unresolved line={line_number} id={row_id} name={name!r} desc={desc!r}")

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
        default=Path("game_origin_config/dispatch_task/tasks.lua"),
    )
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/dispatch_task/tasks.csv"),
    )
    parser.add_argument(
        "--dictionary",
        type=Path,
        default=Path("GAME_DICTIONARY.md"),
    )
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--force", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
