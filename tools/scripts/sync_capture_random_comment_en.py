# -*- coding: utf-8 -*-
"""Translate `game_config/capture/random.csv` comment strings to English.

Usage:
  python3 tools/scripts/sync_capture_random_comment_en.py [--dry-run]

The file is stored in `gb18030`, so this tool preserves that encoding.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
RANDOM_CSV = ROOT / "game_config/capture/random.csv"
ENCODING = "gb18030"

COMMENT_EN: dict[str, str] = {
    "前150每次": "Every draw in the first 150 attempts",
    "第151~301次": "Draws 151-301",
    "300次以后每次": "Every draw after 300",
    "第12次-首个s": "12th draw - first S",
    "每10次b/a(5废弃-后续新增ID不能使用5)": "Every 10 draws: B/A (ID 5 deprecated; do not use for future entries)",
    "每20次必a(6废弃-后续新增ID不能使用6)": "Guaranteed A every 20 draws (ID 6 deprecated; do not use for future entries)",
    "每50次必s": "Guaranteed S every 50 draws",
}


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    with RANDOM_CSV.open("r", encoding=ENCODING, newline="") as f:
        rows = list(csv.reader(f))

    comment_i = rows[0].index("_comment")
    updates = 0

    for idx, row in enumerate(rows):
        if idx < 3 or not any(row):
            continue
        raw = row[comment_i].strip()
        if not raw:
            continue
        en = COMMENT_EN.get(raw, raw)
        if row[comment_i] != en:
            updates += 1
            row[comment_i] = en

    print("rows touched:", updates)

    if not args.dry_run:
        with RANDOM_CSV.open("w", encoding=ENCODING, newline="") as f:
            csv.writer(f).writerows(rows)
        print("wrote", RANDOM_CSV)


if __name__ == "__main__":
    main()
