# -*- coding: utf-8 -*-
"""Translate game_config/brave_challenge/cards.csv to English.

Usage:
  python3 tools/scripts/sync_brave_challenge_cards_en.py [--dry-run]

This sync focuses on the user-facing text columns in brave challenge cards:
`desc`, `unlockdesc1`, and `unlockdesc2`.
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path

from sync_brave_challenge_badge_en import STEM_EN, load_pokemon_cn_en
from sync_brave_challenge_floor_en import DESC_MAP as FLOOR_DESC_EN

ROOT = Path(__file__).resolve().parents[2]
CARDS_CSV = ROOT / "game_config/brave_challenge/cards.csv"
DICT_MD = ROOT / "GAME_DICTIONARY.md"

CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_ALIAS_EN: dict[str, str] = {
    "帕路奇": "Palkia",
}


def translate_species_name(raw: str, cn2en: dict[str, str]) -> str:
    s = raw.strip()
    if not s or not CJK_RE.search(s):
        return raw
    if s in NAME_ALIAS_EN:
        return NAME_ALIAS_EN[s]
    return cn2en.get(s, raw)


def translate_species_or_card_label(raw: str, cn2en: dict[str, str]) -> str:
    direct = translate_species_name(raw, cn2en)
    if direct != raw:
        return direct
    if raw.endswith("卡"):
        trimmed = raw[:-1]
        trimmed_en = translate_species_name(trimmed, cn2en)
        if trimmed_en != trimmed:
            return trimmed_en
    return raw


def translate_badge_name(raw: str) -> str:
    return STEM_EN.get(raw, raw)


def translate_desc(raw: str, cn2en: dict[str, str]) -> str:
    return translate_species_name(raw, cn2en)


def translate_unlockdesc1(raw: str, cn2en: dict[str, str]) -> str:
    if not raw or not CJK_RE.search(raw):
        return raw

    match = re.fullmatch(r"挑战完成【(.+?)】副本后极大概率解锁", raw)
    if match:
        stage_cn = match.group(1)
        stage_en = FLOOR_DESC_EN.get(stage_cn, stage_cn)
        return f'High chance to unlock after clearing the stage "{stage_en}".'

    match = re.fullmatch(r"挑战完成本期第(\d+)层副本后极大概率解锁", raw)
    if match:
        return f"High chance to unlock after clearing Stage {int(match.group(1))} of the current cycle."

    match = re.fullmatch(r"玩法周期内累计招募1次(.+?)后解锁", raw)
    if match:
        species_en = translate_species_or_card_label(match.group(1), cn2en)
        return f"Unlock after recruiting {species_en} once during the current cycle."

    match = re.fullmatch(r"玩法周期内累计认输(\d+)次后解锁", raw)
    if match:
        return f"Unlock after conceding {int(match.group(1))} times during the current cycle."

    match = re.fullmatch(r"获得徽章【(.+?)】后解锁", raw)
    if match:
        badge_en = translate_badge_name(match.group(1))
        return f'Unlock after obtaining the badge "{badge_en}".'

    return raw


def translate_unlockdesc2(raw: str, cn2en: dict[str, str]) -> str:
    if not raw or not CJK_RE.search(raw):
        return raw

    match = re.fullmatch(r"恭喜解锁(.+?)，你已经超过(\d+)%的玩家", raw)
    if match:
        species_en = translate_species_name(match.group(1), cn2en)
        return f"Congratulations on unlocking {species_en}. You have surpassed {int(match.group(2))}% of players."

    return raw


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    cn2en = load_pokemon_cn_en(DICT_MD)

    with CARDS_CSV.open(encoding="utf-8-sig", newline="") as f:
        rows = list(csv.reader(f))

    di = rows[0].index("desc")
    u1i = rows[0].index("unlockdesc1")
    u2i = rows[0].index("unlockdesc2")

    updates = 0
    leaks: list[tuple[int, str, str, str]] = []

    for idx, row in enumerate(rows):
        if idx < 3 or len(row) <= max(di, u1i, u2i):
            continue

        od, ou1, ou2 = row[di], row[u1i], row[u2i]
        nd = translate_desc(od, cn2en)
        nu1 = translate_unlockdesc1(ou1, cn2en)
        nu2 = translate_unlockdesc2(ou2, cn2en)

        if (nd, nu1, nu2) != (od, ou1, ou2):
            updates += 1

        if CJK_RE.search(nd) or CJK_RE.search(nu1) or CJK_RE.search(nu2):
            leaks.append((idx + 1, nd, nu1, nu2))

        row[di], row[u1i], row[u2i] = nd, nu1, nu2

    print("rows touched:", updates)
    print("rows with remaining CJK:", len(leaks))
    for line_no, nd, nu1, nu2 in leaks[:25]:
        print(f"  L{line_no} desc={nd[:40]!r} unlock1={nu1[:70]!r} unlock2={nu2[:70]!r}")

    if leaks:
        print("CSV not written: fix leaks first or extend the mappings/templates.")
        return

    if not args.dry_run:
        with CARDS_CSV.open("w", encoding="utf-8-sig", newline="") as f:
            csv.writer(f).writerows(rows)
        print("wrote", CARDS_CSV)


if __name__ == "__main__":
    main()
