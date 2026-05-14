# -*- coding: utf-8 -*-
"""Translate `game_config/contract/activate_book.csv` target descriptions to English.

Usage:
  python3 tools/scripts/sync_contract_activate_book_en.py [--dry-run]
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path

from sync_brave_challenge_badge_en import load_pokemon_cn_en

ROOT = Path(__file__).resolve().parents[2]
CSV_PATH = ROOT / "game_config/contract/activate_book.csv"
DICT_MD = ROOT / "GAME_DICTIONARY.md"

ALIASES: dict[str, str] = {
    "原始固拉多": "Primal Groudon",
    "原始盖欧卡": "Primal Kyogre",
    "超级裂空座": "Mega Rayquaza",
    "凯路迪欧·觉悟": "Keldeo (Resolute Forme)",
    "基格尔德": "Zygarde",
    "大吾超级巨金怪": "Steven's Mega Metagross",
    "艾岚超级喷火龙x": "Alain's Mega Charizard X",
    "蕾冠王·黑马": "Calyrex - Shadow Rider",
    "蕾冠王·白马": "Calyrex - Ice Rider",
    "起源梦幻": "Origin Mew",
    "闪光超级耿鬼": "Shiny Mega Gengar",
    "闪光超级班基拉斯": "Shiny Mega Tyranitar",
    "闪光超级艾路雷朵": "Shiny Mega Gallade",
    "闪光超级沙奈朵": "Shiny Mega Gardevoir",
    "闪光超级路卡利欧": "Shiny Mega Lucario",
    "闪光超级暴雪王": "Shiny Mega Abomasnow",
    "闪光超级妙蛙花": "Shiny Mega Venusaur",
    "小智版甲贺忍蛙": "Ash-Greninja",
    "小智版皮卡丘": "Ash's Pikachu",
    "美洛耶塔": "Meloetta Aria Forme",
    "火雉鸡": "Torchic",
}

TYPE12_RE = re.compile(r"^(.+?)达到12星解锁$")
SERIES12_RE = re.compile(r"^(.+?)系列达到12星$")
OWN_RE = re.compile(r"^拥有(.+?)解锁$")
POST_GROWTH_RE = (
    "After growth is unlocked, "
)

EXACT_EN: dict[str, str] = {
    "养成开启后，竞技场累计胜利100次": "After growth is unlocked, achieve 100 total Arena victories.",
    "养成开启后，以太乐园累计通关10次": "After growth is unlocked, clear Aether Paradise 10 times in total.",
    "养成开启后，公会捐献50次": "After growth is unlocked, make 50 Guild donations.",
}


def translate_species(name: str, cn2en: dict[str, str]) -> str:
    return ALIASES.get(name) or cn2en.get(name) or name


def translate_desc(raw: str, cn2en: dict[str, str]) -> str:
    if not raw:
        return raw
    if raw in EXACT_EN:
        return EXACT_EN[raw]

    m = SERIES12_RE.fullmatch(raw)
    if m:
        species = translate_species(m.group(1), cn2en)
        return f"Unlock after the {species} series reaches 12 stars."

    m = TYPE12_RE.fullmatch(raw)
    if m:
        species = translate_species(m.group(1), cn2en)
        return f"Unlock after {species} reaches 12 stars."

    m = OWN_RE.fullmatch(raw)
    if m:
        species = translate_species(m.group(1), cn2en)
        return f"Unlock after obtaining {species}."

    return raw


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    cn2en = load_pokemon_cn_en(DICT_MD)

    with CSV_PATH.open(encoding="utf-8-sig", newline="") as f:
        rows = list(csv.reader(f))

    cols = [c for c in ["targetDesc1", "targetDesc2", "targetDesc3"] if c in rows[0]]
    idxs = [rows[0].index(c) for c in cols]
    updates = 0
    leaks: list[tuple[int, str]] = []

    for row_no, row in enumerate(rows):
        if row_no < 3 or not any(row):
            continue
        changed = False
        for i in idxs:
            raw = row[i].strip()
            new = translate_desc(raw, cn2en)
            if row[i] != new:
                row[i] = new
                changed = True
            if re.search(r"[\u3400-\u9fff]", row[i]):
                leaks.append((row_no + 1, row[i]))
        if changed:
            updates += 1

    print("rows touched:", updates)
    print("rows with remaining CJK:", len(leaks))
    for line, text in leaks[:20]:
        print(f"  L{line} {text}")

    if leaks:
        print("CSV not written: add aliases or template coverage first.")
        return

    if not args.dry_run:
        with CSV_PATH.open("w", encoding="utf-8-sig", newline="") as f:
            csv.writer(f).writerows(rows)
        print("wrote", CSV_PATH)


if __name__ == "__main__":
    main()
