# -*- coding: utf-8 -*-
"""Translate game_config/brave_challenge/floor.csv name/desc columns to English.

  python3 tools/scripts/sync_brave_challenge_floor_en.py [--dry-run]

The file is small and highly repetitive, so this script keeps the mapping
deterministic: stage labels are converted with a numeric template and the
chapter descriptions are translated via an exact phrase table.
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
FLOOR_CSV = ROOT / "game_config/brave_challenge/floor.csv"

CJK_RE = re.compile(r"[\u3400-\u9fff]")
NAME_RE = re.compile(r"^第(\d+)关$")

DESC_MAP: dict[str, str] = {
    "就决定是你了": "I choose you!",
    "欢迎来到研究基地": "Welcome to the Research Base",
    "暴风雪中会遇到什么呢": "What will you encounter in the blizzard?",
    "彩虹的彼端": "Beyond the Rainbow",
    "变身对战": "Transformation Battle",
    "皮卡丘之歌": "Pikachu's Song",
    "超梦，我就在这里": "Mewtwo, I'm Right Here",
    "来自异世界的勇者": "Hero from Another World",
    "迈向最强之路": "Road to the Strongest",
    "友谊象征：最初的精灵": "Symbol of Friendship: The First Pokemon",
    "最后的战斗": "The Final Battle",
    "幻之宝可梦集结": "Mythical Pokemon Gathering",
    "龙族集结": "Dragon Gathering",
    "斗战集结": "Battle Gathering",
}


def translate_name(value: str) -> str:
    match = NAME_RE.fullmatch(value)
    if match:
        return f"Stage {int(match.group(1))}"
    return value


def translate_desc(value: str) -> str:
    return DESC_MAP.get(value, value)


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    with FLOOR_CSV.open(encoding="utf-8-sig", newline="") as f:
        rows = list(csv.reader(f))

    ni = rows[0].index("name")
    di = rows[0].index("desc")
    updates = 0
    leaks: list[tuple[int, str, str]] = []

    for idx, row in enumerate(rows):
        if idx < 3 or len(row) <= max(ni, di):
            continue

        on, od = row[ni], row[di]
        nn = translate_name(on)
        nd = translate_desc(od)

        if nn != on or nd != od:
            updates += 1

        if CJK_RE.search(nn) or CJK_RE.search(nd):
            leaks.append((idx + 1, nn, nd))

        row[ni], row[di] = nn, nd

    print("rows touched:", updates)
    print("rows with remaining CJK:", len(leaks))
    for line_no, nn, nd in leaks[:20]:
        print(f"  L{line_no} name={nn[:40]!r} desc={nd[:80]!r}")

    if leaks:
        print("CSV not written: fix leaks first or extend DESC_MAP.")
        return

    if not args.dry_run:
        with FLOOR_CSV.open("w", encoding="utf-8-sig", newline="") as f:
            csv.writer(f).writerows(rows)
        print("wrote", FLOOR_CSV)


if __name__ == "__main__":
    main()
