# -*- coding: utf-8 -*-
"""Sync localized capture sprite fields from English source columns.

Usage:
  python3 tools/scripts/sync_capture_sprite_fields_from_en.py [--dry-run]

Copies `name_en` into `name`, `name_tw`, `name_vn`, and `name_kr`, and
translates chapter notes in `_beizhu` from `章节N` to `Chapter N`.

The file is stored in `gb18030`, so this tool preserves that encoding.
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SPRITE_CSV = ROOT / "game_config/capture/sprite.csv"
ENCODING = "gb18030"
CHAPTER_RE = re.compile(r"^章节(\d+)$")


def translate_note(raw: str) -> str:
    m = CHAPTER_RE.fullmatch(raw.strip())
    if m:
        return f"Chapter {int(m.group(1))}"
    return raw


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    with SPRITE_CSV.open("r", encoding=ENCODING, newline="") as f:
        rows = list(csv.reader(f))

    idx = {c: rows[0].index(c) for c in ["name", "name_tw", "name_en", "name_vn", "name_kr", "_beizhu"]}
    updates = 0

    for row_no, row in enumerate(rows):
        if row_no < 3 or not any(row):
            continue
        en = row[idx["name_en"]].strip()
        note = row[idx["_beizhu"]].strip()
        next_note = translate_note(note) if note else note

        changed = False
        if en:
            for col in ["name", "name_tw", "name_vn", "name_kr"]:
                if row[idx[col]] != en:
                    row[idx[col]] = en
                    changed = True
        if note != next_note:
            row[idx["_beizhu"]] = next_note
            changed = True

        if changed:
            updates += 1

    print("rows touched:", updates)

    if not args.dry_run:
        with SPRITE_CSV.open("w", encoding=ENCODING, newline="") as f:
            csv.writer(f).writerows(rows)
        print("wrote", SPRITE_CSV)


if __name__ == "__main__":
    main()
