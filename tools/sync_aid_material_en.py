#!/usr/bin/env python3
"""Translate aid/material.csv item names and descriptions to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

MANUAL_NAMES = {
    "六尾": "Vulpix",
    "美洛耶塔·歌声形态": "Meloetta (Aria Forme)",
    "雷电云·化身形态": "Thundurus (Incarnate Forme)",
    "土地云·化身形态": "Landorus (Incarnate Forme)",
    "龙卷云·化身形态": "Tornadus (Incarnate Forme)",
    "基格尔德·100%": "Zygarde 100%",
    "基格尔德·100％": "Zygarde 100%",
}


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def split_markdown_row(line: str) -> list[str]:
    return [cell.strip() for cell in line.strip().strip("|").split("|")]


def load_dictionary(path: Path) -> dict[str, str]:
    mapping = dict(MANUAL_NAMES)
    source_index: int | None = None
    english_index: int | None = None

    for line in path.read_text(encoding="utf-8").splitlines():
        if not line.startswith("|"):
            source_index = None
            english_index = None
            continue

        cells = split_markdown_row(line)
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


def strip_material_suffix(value: str) -> tuple[str, str | None]:
    for suffix, kind in (
        ("·助战精华", "essence"),
        ("·助战源晶", "source_crystal"),
    ):
        if value.endswith(suffix):
            return value[: -len(suffix)], kind
    return value, None


def translate_pokemon_name(raw_name: str, dictionary: dict[str, str]) -> str | None:
    normalized = raw_name.replace("％", "%")
    return dictionary.get(raw_name) or dictionary.get(normalized)


def translate_item_name(value: str, dictionary: dict[str, str]) -> str | None:
    raw_pokemon, kind = strip_material_suffix(value)
    pokemon = translate_pokemon_name(raw_pokemon, dictionary)
    if not pokemon:
        return None
    if kind == "essence":
        return f"{pokemon} Aid Essence"
    if kind == "source_crystal":
        return f"{pokemon} Aid Source Crystal"
    return pokemon


def translate_description(value: str, dictionary: dict[str, str]) -> str | None:
    match = re.fullmatch(r"用于突破(.+?)助战进阶的专属材料", value)
    if match:
        pokemon = translate_pokemon_name(match.group(1), dictionary)
        if pokemon:
            return f"Exclusive material used to advance {pokemon}'s Aid breakthrough"

    match = re.fullmatch(r"用于(.+?)助战觉醒的专属材料", value)
    if match:
        pokemon = translate_pokemon_name(match.group(1), dictionary)
        if pokemon:
            return f"Exclusive material used to awaken {pokemon}'s Aid"

    return None


def sync(args: argparse.Namespace) -> int:
    dictionary = load_dictionary(args.dictionary)
    lineterminator = detect_lineterminator(args.target)

    with args.target.open(newline="", encoding="utf-8") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    text_columns = {
        "name": header.index("name"),
        "desc1": header.index("desc1"),
        "desc": header.index("desc"),
    }

    updates = {column: 0 for column in text_columns}
    unresolved: list[tuple[int, str, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue

        row_id = row[0]
        name_idx = text_columns["name"]
        if args.force or has_cjk(row[name_idx]):
            translated_name = translate_item_name(row[name_idx], dictionary)
            if translated_name:
                row[name_idx] = translated_name
                updates["name"] += 1

        for column in ("desc1", "desc"):
            idx = text_columns[column]
            if args.force or has_cjk(row[idx]):
                translated_desc = translate_description(row[idx], dictionary)
                if translated_desc:
                    row[idx] = translated_desc
                    updates[column] += 1

        if any(has_cjk(row[idx]) for idx in text_columns.values()):
            unresolved.append((line_number, row_id, row[name_idx], row[text_columns["desc"]]))

    print(f"rows={sum(1 for row in rows[3:] if row)}")
    for column in ("name", "desc1", "desc"):
        print(f"{column}_updates={updates[column]}")
    print(f"remaining_cjk_rows={len(unresolved)}")
    for line_number, row_id, name, desc in unresolved[:30]:
        print(f"unresolved line={line_number} id={row_id} name={name!r} desc={desc!r}")

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", type=Path, default=Path("game_config/aid/material.csv"))
    parser.add_argument("--dictionary", type=Path, default=Path("GAME_DICTIONARY.md"))
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--force", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
