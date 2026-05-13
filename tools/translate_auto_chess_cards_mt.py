#!/usr/bin/env python3
"""Translate cards.csv: official Pokémon names + key_words brackets + MT for prose."""
from __future__ import annotations

import csv
import importlib.util
import re
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CARDS = ROOT / "game_config/auto_chess/cards.csv"
KEY_WORDS = ROOT / "game_config/auto_chess/key_words.csv"

CJK_RE = re.compile(r"[\u4e00-\u9fff]")
BRACKET_RE = re.compile(r"【[^】]+】")
COLS_MT = (5, 10, 19, 24)  # not name — names use dictionary


def _load_cards_en_module():
    path = ROOT / "tools" / "translate_auto_chess_cards_en.py"
    spec = importlib.util.spec_from_file_location("cards_en", path)
    if spec is None or spec.loader is None:
        raise RuntimeError("Cannot load cards_en helper")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def load_bracket_map() -> dict[str, str]:
    m: dict[str, str] = {}
    with open(KEY_WORDS, newline="", encoding="utf-8") as f:
        rows = list(csv.reader(f))
    for row in rows[3:]:
        if len(row) < 4:
            continue
        name, key = row[1].strip(), row[3].strip()
        if key.startswith("【") and name.startswith("【"):
            m[key] = name
    return m


def swap_brackets(s: str, bm: dict[str, str]) -> str:
    for cn, en in sorted(bm.items(), key=lambda x: -len(x[0])):
        s = s.replace(cn, en)
    return s


def shield_brackets(s: str) -> tuple[str, list[str]]:
    found: list[str] = []

    def repl(m: re.Match[str]) -> str:
        found.append(m.group(0))
        return f"⟦{len(found) - 1}⟧"

    return BRACKET_RE.sub(repl, s), found


def unshield(s: str, found: list[str]) -> str:
    for i, tok in enumerate(found):
        s = s.replace(f"⟦{i}⟧", tok)
    return s


def polish_prose(s: str) -> str:
    """Fix recurring MT artifacts for game UI."""
    s = re.sub(r"(?i)\belves\b", "Pokémon", s)
    s = re.sub(r"(?i)\belves'", "Pokémon'", s)
    s = re.sub(r"(?i)\belf\b", "Pokémon", s)
    s = re.sub(r"(?i)\bspirits\b", "Pokémon", s)
    s = re.sub(r"(?i)\bgoblins\b", "Pokémon", s)
    s = re.sub(r"(?i)\bgoblin\b", "Pokémon", s)
    s = re.sub(r"(?i)\bgenies\b", "Pokémon", s)
    s = re.sub(r"(?i)\bgenie\b", "Pokémon", s)
    s = re.sub(r"(?i)\bspirit\b", "Pokémon", s)
    s = re.sub(r"(?i)\bmonsters\b", "Pokémon", s)
    s = re.sub(r"(?i)\bmonster\b", "Pokémon", s)
    s = re.sub(r"(?i)\bgold coins\b", "gold", s)
    s = re.sub(r"(?i)\bcoins\b", "gold", s)
    s = re.sub(r"(?i)\blife points\b", "HP", s)
    s = re.sub(r"(?i)\bhealth points\b", "HP", s)
    s = re.sub(r"(?i)\bhit points\b", "HP", s)
    s = re.sub(r"(?i)\bpoints of skill damage\b", "skill damage", s)
    s = re.sub(r"(?i)\bskill damage points\b", "skill damage", s)
    s = re.sub(r"(?i)\battack points\b", "Attack", s)
    s = re.sub(r"(?i)\barmor value\b", "Armor", s)
    s = re.sub(r"(?i)\barmor points\b", "Armor", s)
    s = s.replace("【Stun】random", "【Stun】 random")
    s = s.replace("【Destroy】randomly", "【Destroy】 random")
    s = s.replace("(only effective outside combat)", "(only outside battle)")
    s = s.replace("except Bobo", "except Pidgey")
    s = s.replace("Select an Pokémon", "Select a Pokémon")
    s = s.replace("Select a grass Pokémon", "Select a Grass-type Pokémon")
    s = s.replace("Choose a grass Pokémon", "Choose a Grass-type Pokémon")
    s = re.sub(r"\s+", " ", s)
    s = re.sub(r"\s*,\s*", ", ", s)
    return s.strip()


def main() -> int:
    try:
        from deep_translator import GoogleTranslator
    except ImportError:
        print("Install: python3 -m venv .venv-trans && .venv-trans/bin/pip install deep-translator", file=sys.stderr)
        return 1

    cce = _load_cards_en_module()
    names = {**cce.load_pokemon_cn_en(), **cce.EXTRA_NAMES}

    tr = GoogleTranslator(source="zh-CN", target="en")
    bm = load_bracket_map()
    cache: dict[str, str] = {}

    def translate_cell(raw: str) -> str:
        if not raw:
            return raw
        if not CJK_RE.search(raw):
            return raw
        s = swap_brackets(raw, bm)
        shielded, tokens = shield_brackets(s)
        if not CJK_RE.search(shielded):
            return polish_prose(unshield(shielded, tokens))
        if shielded not in cache:
            time.sleep(0.1)
            try:
                cache[shielded] = tr.translate(shielded)
            except Exception as e:
                print(f"MT error: {e!r} text={shielded[:60]!r}", file=sys.stderr)
                cache[shielded] = shielded
        return polish_prose(unshield(cache[shielded], tokens))

    with open(CARDS, newline="", encoding="utf-8") as f:
        rows = list(csv.reader(f))

    out = rows[:3]
    for row in rows[3:]:
        if len(row) < 27:
            row += [""] * (27 - len(row))
        row = row[:27]
        row[1] = cce.translate_name(row[1], names)
        for ci in COLS_MT:
            row[ci] = translate_cell(row[ci])
        out.append(row)

    with open(CARDS, "w", newline="", encoding="utf-8") as f:
        csv.writer(f).writerows(out)

    print(f"Wrote {CARDS}; unique MT calls: {len(cache)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
