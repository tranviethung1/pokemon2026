#!/usr/bin/env python3
"""Translate game_config/auto_chess/equip.csv name, cardEffect, and keyWords columns to English.

Card effect strings are looked up in tools/equip_card_effect_en.json (regenerate that file with
tools/_emit_equip_effect_json.py if Chinese cardEffect keys in equip.csv change).
"""

from __future__ import annotations

import argparse
import csv
import json
import re
from pathlib import Path

CJK_RE = re.compile(r"[\u3400-\u9fff]")

# Names not covered by buff EXACT_OVERRIDES (plain item names without buff suffixes).
EQUIP_NAME_EXTRA: dict[str, str] = {
    "吃剩的苹果": "Leftovers",
    "硬石头": "Hard Stone",
    "弹簧拳套": "Punching Glove",
    "月亮之笛": "Lunar Flute",
    "痛苦面具": "Mask of Pain",
    "白金宝珠": "Adamant Orb",
    "美丽鳞片": "Prism Scale",
    "可疑补丁": "Dubious Disc",
    "高能护腕": "Power Band",
}


def load_keyword_brackets(key_words_csv: Path) -> dict[str, str]:
    """Map Chinese 【token】 -> English 【token】 from key_words.csv (match key -> name)."""
    cn2en: dict[str, str] = {}
    with key_words_csv.open(newline="", encoding="utf-8-sig") as f:
        rows = list(csv.reader(f))
    for row in rows[3:]:
        if len(row) < 4:
            continue
        en, cn = row[1].strip(), row[3].strip()
        if not cn or not en:
            continue
        if CJK_RE.search(cn) and not CJK_RE.search(en):
            cn2en[cn] = en
    return cn2en


def swap_bracket_keywords(text: str, kw: dict[str, str]) -> str:
    if not text or not kw:
        return text
    out = text
    for cn in sorted(kw.keys(), key=len, reverse=True):
        if cn in out:
            out = out.replace(cn, kw[cn])
    return out


def translate_equip_name(name: str, buff_exact: dict[str, str], translate_name_fn, m: dict, keys: list[str]) -> str:
    if name in EQUIP_NAME_EXTRA:
        return EQUIP_NAME_EXTRA[name]
    if name in buff_exact:
        return buff_exact[name]
    return translate_name_fn(name, m, keys)


def main() -> int:
    from sync_buff_csv_en import EXACT_OVERRIDES as BUFF_EXACT
    from sync_buff_csv_en import merge_maps, translate_name

    ap = argparse.ArgumentParser()
    ap.add_argument("--target", type=Path, default=Path("game_config/auto_chess/equip.csv"))
    ap.add_argument("--dictionary", type=Path, default=Path("GAME_DICTIONARY.md"))
    ap.add_argument("--key-words", type=Path, default=Path("game_config/auto_chess/key_words.csv"))
    ap.add_argument("--effects-json", type=Path, default=Path("tools/equip_card_effect_en.json"))
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    m, keys = merge_maps(args.dictionary)
    kw_map = load_keyword_brackets(args.key_words)
    card_fx: dict[str, str] = json.loads(args.effects_json.read_text(encoding="utf-8"))

    csv.field_size_limit(10**7)
    with args.target.open(newline="", encoding="utf-8-sig") as f:
        rows = list(csv.reader(f))

    leftover: list[tuple[str, str, str]] = []
    for i, row in enumerate(rows):
        if i < 3 or len(row) < 17:
            continue
        rid = row[0]
        old_name, old_fx, old_kw = row[1], row[4], row[16]

        row[1] = translate_equip_name(old_name, BUFF_EXACT, translate_name, m, keys)
        row[4] = card_fx.get(old_fx, old_fx)
        row[4] = swap_bracket_keywords(row[4], kw_map)
        row[16] = swap_bracket_keywords(row[16], kw_map)

        for col, label in ((1, "name"), (4, "cardEffect"), (16, "keyWords")):
            if CJK_RE.search(row[col]):
                leftover.append((rid, label, row[col][:120]))

    print("rows", len(rows), "leftover", len(leftover))
    for rid, lab, snippet in leftover[:25]:
        print(rid, lab, snippet)
    if len(leftover) > 25:
        print("...")

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding="utf-8-sig") as f:
        csv.writer(f, quoting=csv.QUOTE_MINIMAL).writerows(rows)
    return 1 if leftover else 0


if __name__ == "__main__":
    raise SystemExit(main())
