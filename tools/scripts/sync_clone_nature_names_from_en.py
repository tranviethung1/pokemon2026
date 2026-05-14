# -*- coding: utf-8 -*-
"""Sync localized clone nature names from standardized English values.

Usage:
  python3 tools/scripts/sync_clone_nature_names_from_en.py [--dry-run]

Copies standardized English values into `name`, `name_tw`, `name_en`,
`name_vn`, and `name_kr` for `game_config/clone/nature.csv`.

The file is stored in `gb18030`, so this tool preserves that encoding.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
NATURE_CSV = ROOT / "game_config/clone/nature.csv"
ENCODING = "gb18030"

NAME_EN_FIX: dict[str, str] = {
    "Electic": "Electricity",
    "Fly": "Flying",
}


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    with NATURE_CSV.open("r", encoding=ENCODING, newline="") as f:
        rows = list(csv.reader(f))

    idx = {c: rows[0].index(c) for c in ["name", "name_tw", "name_en", "name_vn", "name_kr"]}
    updates = 0

    for row_no, row in enumerate(rows):
        if row_no < 3 or not any(row):
            continue
        raw_en = row[idx["name_en"]].strip()
        if not raw_en:
            continue
        en = NAME_EN_FIX.get(raw_en, raw_en)
        changed = False
        for col in ["name", "name_tw", "name_en", "name_vn", "name_kr"]:
            if row[idx[col]] != en:
                row[idx[col]] = en
                changed = True
        if changed:
            updates += 1

    print("rows touched:", updates)

    if not args.dry_run:
        with NATURE_CSV.open("w", encoding=ENCODING, newline="") as f:
            csv.writer(f).writerows(rows)
        print("wrote", NATURE_CSV)


if __name__ == "__main__":
    main()
