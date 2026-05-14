# -*- coding: utf-8 -*-
"""Sync localized text fields in `game_config/chip` from existing English columns.

Usage:
  python3 tools/scripts/sync_chip_localized_fields.py [--dry-run]

This handles the files in `game_config/chip` that actually contain user-facing
text:
- `suits.csv`: copies `suitName_en` into `suitName`, `suitName_tw`,
  `suitName_vn`, and `suitName_kr`
- `chips.csv`: fills `name` from the translated suit name via `suitID`
- `libs.csv`: copies `attrsDesc_en` into `attrsDesc`, `attrsDesc_tw`,
  `attrsDesc_vn`, and `attrsDesc_kr`

All files use `gb18030`, so this tool preserves that encoding.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
CHIP_DIR = ROOT / "game_config/chip"
ENCODING = "gb18030"

SUITS_CSV = CHIP_DIR / "suits.csv"
CHIPS_CSV = CHIP_DIR / "chips.csv"
LIBS_CSV = CHIP_DIR / "libs.csv"


def load_rows(path: Path) -> list[list[str]]:
    with path.open("r", encoding=ENCODING, newline="") as f:
        return list(csv.reader(f))


def write_rows(path: Path, rows: list[list[str]]) -> None:
    with path.open("w", encoding=ENCODING, newline="") as f:
        csv.writer(f).writerows(rows)


def sync_suits(rows: list[list[str]]) -> tuple[list[list[str]], dict[str, str], int]:
    idx = {c: rows[0].index(c) for c in ["suitID", "suitName", "suitName_tw", "suitName_en", "suitName_vn", "suitName_kr"]}
    suit_en_by_id: dict[str, str] = {}
    updates = 0

    for row_no, row in enumerate(rows):
        if row_no < 3 or not any(row):
            continue
        suit_id = row[idx["suitID"]].strip()
        en = row[idx["suitName_en"]].strip()
        if not suit_id or not en:
            continue
        suit_en_by_id[suit_id] = en
        changed = False
        for col in ["suitName", "suitName_tw", "suitName_vn", "suitName_kr"]:
            if row[idx[col]] != en:
                row[idx[col]] = en
                changed = True
        if changed:
            updates += 1
    return rows, suit_en_by_id, updates


def sync_chips(rows: list[list[str]], suit_en_by_id: dict[str, str]) -> tuple[list[list[str]], int]:
    idx = {c: rows[0].index(c) for c in ["name", "suitID"]}
    updates = 0

    for row_no, row in enumerate(rows):
        if row_no < 3 or not any(row):
            continue
        suit_id = row[idx["suitID"]].strip()
        en = suit_en_by_id.get(suit_id)
        if not en:
            continue
        if row[idx["name"]] != en:
            row[idx["name"]] = en
            updates += 1
    return rows, updates


def sync_libs(rows: list[list[str]]) -> tuple[list[list[str]], int]:
    idx = {c: rows[0].index(c) for c in ["attrsDesc", "attrsDesc_tw", "attrsDesc_en", "attrsDesc_vn", "attrsDesc_kr"]}
    updates = 0

    for row_no, row in enumerate(rows):
        if row_no < 3 or not any(row):
            continue
        en = row[idx["attrsDesc_en"]].strip()
        if not en:
            continue
        changed = False
        for col in ["attrsDesc", "attrsDesc_tw", "attrsDesc_vn", "attrsDesc_kr"]:
            if row[idx[col]] != en:
                row[idx[col]] = en
                changed = True
        if changed:
            updates += 1
    return rows, updates


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    suits_rows = load_rows(SUITS_CSV)
    suits_rows, suit_en_by_id, suits_updates = sync_suits(suits_rows)

    chips_rows = load_rows(CHIPS_CSV)
    chips_rows, chips_updates = sync_chips(chips_rows, suit_en_by_id)

    libs_rows = load_rows(LIBS_CSV)
    libs_rows, libs_updates = sync_libs(libs_rows)

    print("suits rows touched:", suits_updates)
    print("chips rows touched:", chips_updates)
    print("libs rows touched:", libs_updates)
    print("total rows touched:", suits_updates + chips_updates + libs_updates)

    if not args.dry_run:
        write_rows(SUITS_CSV, suits_rows)
        write_rows(CHIPS_CSV, chips_rows)
        write_rows(LIBS_CSV, libs_rows)
        print("wrote", SUITS_CSV)
        print("wrote", CHIPS_CSV)
        print("wrote", LIBS_CSV)


if __name__ == "__main__":
    main()
