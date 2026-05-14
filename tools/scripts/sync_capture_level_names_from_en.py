# -*- coding: utf-8 -*-
"""Copy English capture level names into all localized name columns.

Usage:
  python3 tools/scripts/sync_capture_level_names_from_en.py [--dry-run]

The file is stored in `gb18030`, so this tool preserves that encoding.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
LEVEL_CSV = ROOT / "game_config/capture/level.csv"
ENCODING = "gb18030"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    with LEVEL_CSV.open("r", encoding=ENCODING, newline="") as f:
        rows = list(csv.reader(f))

    name_i = rows[0].index("name")
    name_tw_i = rows[0].index("name_tw")
    name_en_i = rows[0].index("name_en")
    name_vn_i = rows[0].index("name_vn")
    name_kr_i = rows[0].index("name_kr")

    updates = 0
    for idx, row in enumerate(rows):
        if idx < 3 or not any(row):
            continue
        en = row[name_en_i].strip()
        if not en:
            continue
        if (
            row[name_i] != en
            or row[name_tw_i] != en
            or row[name_vn_i] != en
            or row[name_kr_i] != en
        ):
            updates += 1
            row[name_i] = en
            row[name_tw_i] = en
            row[name_vn_i] = en
            row[name_kr_i] = en

    print("rows touched:", updates)

    if not args.dry_run:
        with LEVEL_CSV.open("w", encoding=ENCODING, newline="") as f:
            csv.writer(f).writerows(rows)
        print("wrote", LEVEL_CSV)


if __name__ == "__main__":
    main()
