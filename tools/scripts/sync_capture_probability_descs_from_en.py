# -*- coding: utf-8 -*-
"""Copy English capture probability descriptions into all localized desc columns.

Usage:
  python3 tools/scripts/sync_capture_probability_descs_from_en.py [--dry-run]

The file is stored in `gb18030`, so this tool preserves that encoding.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PROB_CSV = ROOT / "game_config/capture/probability.csv"
ENCODING = "gb18030"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    with PROB_CSV.open("r", encoding=ENCODING, newline="") as f:
        rows = list(csv.reader(f))

    desc_i = rows[0].index("desc")
    desc_tw_i = rows[0].index("desc_tw")
    desc_en_i = rows[0].index("desc_en")
    desc_vn_i = rows[0].index("desc_vn")
    desc_kr_i = rows[0].index("desc_kr")

    updates = 0
    for idx, row in enumerate(rows):
        if idx < 3 or not any(row):
            continue
        en = row[desc_en_i].strip()
        if not en:
            continue
        if (
            row[desc_i] != en
            or row[desc_tw_i] != en
            or row[desc_vn_i] != en
            or row[desc_kr_i] != en
        ):
            updates += 1
            row[desc_i] = en
            row[desc_tw_i] = en
            row[desc_vn_i] = en
            row[desc_kr_i] = en

    print("rows touched:", updates)

    if not args.dry_run:
        with PROB_CSV.open("w", encoding=ENCODING, newline="") as f:
            csv.writer(f).writerows(rows)
        print("wrote", PROB_CSV)


if __name__ == "__main__":
    main()
