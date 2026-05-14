# -*- coding: utf-8 -*-
"""Translate `game_config/clone/monster.csv` name remarks to English.

Usage:
  python3 tools/scripts/sync_clone_monster_names_en.py [--dry-run]

The file is stored in `gb18030`, so this tool preserves that encoding.
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path

from sync_brave_challenge_badge_en import load_pokemon_cn_en

ROOT = Path(__file__).resolve().parents[2]
MONSTER_CSV = ROOT / "game_config/clone/monster.csv"
DICT_MD = ROOT / "GAME_DICTIONARY.md"
ENCODING = "gb18030"
CJK_RE = re.compile(r"[\u3400-\u9fff]")

ALIASES: dict[str, str] = {
    "班吉拉斯": "Tyranitar",
    "骑拉帝纳·别种形态": "Giratina (Altered Forme)",
    "坚盾剑怪·盾牌形态": "Aegislash (Shield Forme)",
}


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    cn2en = load_pokemon_cn_en(DICT_MD)
    cn2en.update(ALIASES)

    with MONSTER_CSV.open("r", encoding=ENCODING, newline="") as f:
        rows = list(csv.reader(f))

    note_i = rows[0].index("_beizhu")
    updates = 0
    missing: list[tuple[int, str]] = []

    for idx, row in enumerate(rows):
        if idx < 3 or not any(row):
            continue
        raw = row[note_i].strip()
        if not raw:
            continue
        if not CJK_RE.search(raw):
            continue
        en = cn2en.get(raw)
        if not en:
            missing.append((idx + 1, raw))
            continue
        if row[note_i] != en:
            row[note_i] = en
            updates += 1

    print("rows touched:", updates)
    print("missing names:", len(missing))
    for line, raw in missing[:20]:
        print(f"  L{line} {raw}")

    if missing:
        print("CSV not written: add aliases or dictionary entries first.")
        return

    if not args.dry_run:
        with MONSTER_CSV.open("w", encoding=ENCODING, newline="") as f:
            csv.writer(f).writerows(rows)
        print("wrote", MONSTER_CSV)


if __name__ == "__main__":
    main()
