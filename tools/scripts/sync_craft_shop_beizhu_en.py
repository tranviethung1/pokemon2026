#!/usr/bin/env python3
"""Translate `game_config/craft/shop.csv` note labels to English.

Usage:
  python3 tools/scripts/sync_craft_shop_beizhu_en.py [--dry-run]
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
CSV_PATH = ROOT / "game_config/craft/shop.csv"
DICT_MD = ROOT / "GAME_DICTIONARY.md"

CJK_RE = re.compile(r"[\u3400-\u9fff]")
FRAG_SUFFIX = "碎片"
TOKEN_SUFFIX = "的信物"

EXACT_MAP: dict[str, str] = {
    "甘甜冰水": "Sweet Ice Water",
    "劲爽汽水": "Soda Pop",
    "美味之水": "Fresh Water",
    "哞哞鲜奶": "MooMoo Milk",
    "果汁牛奶": "Fruit Milk",
    "树果汁": "Berry Juice",
    "神奇胶囊": "Wonder Capsule",
    "潜力装置": "Potential Device",
    "初级好感度礼盒": "Basic Friendship Gift Box",
    "经验药水": "EXP Potion",
    "金币": "Gold",
    "能量药剂": "Energy Potion",
    "饰品觉醒随机箱子": "Accessory Awakening Random Box",
}


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def detect_lineterminator(path: Path) -> str:
    return "\r\n" if b"\r\n" in path.read_bytes() else "\n"


def split_markdown_row(line: str) -> list[str]:
    return [cell.strip() for cell in line.strip().strip("|").split("|")]


def load_dictionary(path: Path) -> dict[str, str]:
    mapping = dict(EXACT_MAP)
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


def translate_label(raw: str, dictionary: dict[str, str]) -> str | None:
    if raw in dictionary:
        return dictionary[raw]

    if raw.endswith(FRAG_SUFFIX):
        base = raw[: -len(FRAG_SUFFIX)]
        base_en = dictionary.get(base)
        if base_en:
            return f"{base_en} Shard"

    if raw.endswith(TOKEN_SUFFIX):
        base = raw[: -len(TOKEN_SUFFIX)]
        base_en = dictionary.get(base)
        if base_en:
            if base_en.endswith("s"):
                return f"{base_en}' Token"
            return f"{base_en}'s Token"

    return dictionary.get(raw)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    dictionary = load_dictionary(DICT_MD)
    lineterminator = detect_lineterminator(CSV_PATH)

    with CSV_PATH.open(encoding="utf-8-sig", newline="") as f:
        rows = list(csv.reader(f))

    note_index = rows[0].index("_beizhu")
    updates = 0
    unresolved: list[tuple[int, str, str]] = []
    leaks: list[tuple[int, str, str]] = []

    for row_no, row in enumerate(rows):
        if row_no < 3 or not any(row):
            continue
        row_id = row[0].strip()
        if not row_id:
            continue

        raw = row[note_index].strip()
        if not raw:
            continue

        translated = translate_label(raw, dictionary)
        if translated is None:
            unresolved.append((row_no + 1, row_id, raw))
            translated = raw
        elif translated != row[note_index]:
            row[note_index] = translated
            updates += 1

        if has_cjk(row[note_index]):
            leaks.append((row_no + 1, row_id, row[note_index]))

    print(f"updates={updates}")
    print(f"unresolved_rows={len(unresolved)}")
    for line_no, row_id, raw in unresolved[:20]:
        print(f"unresolved line={line_no} id={row_id} value={raw!r}")
    print(f"remaining_cjk_rows={len(leaks)}")
    for line_no, row_id, raw in leaks[:20]:
        print(f"remaining line={line_no} id={row_id} value={raw!r}")

    if unresolved or leaks:
        print("CSV not written: add remaining mappings first.")
        return 1

    if not args.dry_run:
        with CSV_PATH.open("w", encoding="utf-8-sig", newline="") as f:
            csv.writer(f, lineterminator=lineterminator).writerows(rows)
        print(f"wrote {CSV_PATH}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
