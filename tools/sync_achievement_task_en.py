#!/usr/bin/env python3
"""Sync achievement_task.csv title/desc fields from the English Lua source."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")
ENTRY_RE = re.compile(r"\n\t\[(\d+)\] = \{")

MANUAL_BY_ID = {
    "1092": ("Adamant Trainer", "Attain Trainer level 134"),
    "1093": ("Adamant Trainer", "Attain Trainer level 139"),
    "1094": ("Adamant Trainer", "Attain Trainer level 144"),
    "1095": ("Adamant Trainer", "Attain Trainer level 149"),
    "4125": ("Abyss Adventure Road", "Clear Abyss Adventure Road level 50"),
    "4126": ("Abyss Adventure Road", "Clear Abyss Adventure Road level 100"),
    "4081": ("Contract Dungeon", "Clear Contract Dungeon on any difficulty 100 times"),
    "4082": ("Contract Dungeon", "Clear Contract Dungeon on any difficulty 500 times"),
    "4083": ("Contract Dungeon", "Clear Contract Dungeon on any difficulty 1000 times"),
    "7028": ("Song of Ice and Fire", "Get White Kyurem for the first time"),
    "7029": ("Crimson Mask & Fire Fighter", "Get Masked Mega Blaziken for the first time"),
    "7030": ("Song of Ice and Lightning", "Get Black Kyurem for the first time"),
    "7031": ("Sunlight Spirals Across the Sky", "Get Dusk Mane for the first time"),
    "7032": ("Moonlight Splashes Across the Firmament", "Get Dawn Wings for the first time"),
    "8101": ("Card Beginner", "Challenge Card Adventure 20 times"),
    "8102": ("Card Veteran", "Challenge Card Adventure 50 times"),
    "8103": ("Card Mastery", "Challenge Card Adventure 100 times"),
    "8111": ("Card Apprentice", "Clear Card Adventure 15 times"),
    "8112": ("Card Master", "Clear Card Adventure 35 times"),
    "8113": ("Card King", "Clear Card Adventure 60 times"),
}


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


def extract_field(block: str, field_name: str) -> str | None:
    match = re.search(
        rf"\n\t\t{re.escape(field_name)} = \"((?:[^\"\\]|\\.)*)\"",
        block,
    )
    if not match:
        return None
    return unescape_lua_string(match.group(1))


def iter_lua_blocks(text: str):
    start = text.index("csv.achievement.achievement_task = {")
    text = text[start:]
    position = 0

    while True:
        match = ENTRY_RE.search(text, position)
        if not match:
            return

        entry_id = match.group(1)
        index = match.end()
        depth = 1
        in_string = False
        escaped = False

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
                    depth += 1
                elif char == "}":
                    depth -= 1
            index += 1

        yield entry_id, text[match.end() : index - 1]
        position = index


def load_source_entries(path: Path) -> dict[str, tuple[str | None, str | None]]:
    entries: dict[str, tuple[str | None, str | None]] = {}
    text = path.read_text(encoding="utf-8")

    for entry_id, block in iter_lua_blocks(text):
        title = extract_field(block, "title_en") or extract_field(block, "title")
        desc = extract_field(block, "desc_en") or extract_field(block, "desc")
        entries[entry_id] = (title, desc)

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


def choose_value(
    row_id: str,
    current: str,
    source_value: str | None,
    manual_value: str | None,
    dictionary: dict[str, str],
    *,
    force: bool,
) -> tuple[str, str | None]:
    if not force and not has_cjk(current):
        return current, None

    for origin, candidate in (
        ("source", source_value),
        ("manual", manual_value),
        ("dictionary", dictionary.get(current)),
    ):
        if candidate and not has_cjk(candidate):
            return candidate, origin

    return current, None


def sync(args: argparse.Namespace) -> int:
    source_entries = load_source_entries(args.source)
    dictionary = load_dictionary(args.dictionary)
    lineterminator = detect_lineterminator(args.target)

    with args.target.open(newline="", encoding="utf-8") as handle:
        rows = list(csv.reader(handle))

    if len(rows) < 3:
        raise SystemExit("target CSV must include metadata, default, and description rows")

    header = rows[0]
    try:
        title_index = header.index("title")
        desc_index = header.index("desc")
    except ValueError as exc:
        raise SystemExit("target CSV must contain title and desc columns") from exc

    stats = {
        "title_source": 0,
        "title_manual": 0,
        "title_dictionary": 0,
        "desc_source": 0,
        "desc_manual": 0,
        "desc_dictionary": 0,
        "unchanged": 0,
    }
    unresolved: list[tuple[int, str, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue
        row_id = row[0]
        source_title, source_desc = source_entries.get(row_id, (None, None))
        manual_title, manual_desc = MANUAL_BY_ID.get(row_id, (None, None))

        new_title, title_origin = choose_value(
            row_id,
            row[title_index],
            source_title,
            manual_title,
            dictionary,
            force=args.force,
        )
        new_desc, desc_origin = choose_value(
            row_id,
            row[desc_index],
            source_desc,
            manual_desc,
            dictionary,
            force=args.force,
        )

        if title_origin:
            stats[f"title_{title_origin}"] += 1
            row[title_index] = new_title
        if desc_origin:
            stats[f"desc_{desc_origin}"] += 1
            row[desc_index] = new_desc
        if not title_origin and not desc_origin:
            stats["unchanged"] += 1

        if has_cjk(row[title_index]) or has_cjk(row[desc_index]):
            unresolved.append((line_number, row_id, row[title_index], row[desc_index]))

    total_updates = sum(value for key, value in stats.items() if key != "unchanged")
    print(f"source_entries={len(source_entries)}")
    print(f"rows={sum(1 for row in rows[3:] if row)}")
    print(f"updates={total_updates}")
    for key in sorted(stats):
        print(f"{key}={stats[key]}")
    print(f"remaining_cjk_rows={len(unresolved)}")
    for line_number, row_id, title, desc in unresolved[:20]:
        print(f"unresolved line={line_number} id={row_id} title={title!r} desc={desc!r}")

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--source",
        type=Path,
        default=Path("game_origin_config/achievement/achievement_task.lua"),
    )
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/achievement/achievement_task.csv"),
    )
    parser.add_argument(
        "--dictionary",
        type=Path,
        default=Path("GAME_DICTIONARY.md"),
    )
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--force", action="store_true", help="overwrite existing English text")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
