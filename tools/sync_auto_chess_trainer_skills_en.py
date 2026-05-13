#!/usr/bin/env python3
"""Translate auto_chess/trainer_skills.csv to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path

from deep_translator import GoogleTranslator


CJK_RE = re.compile(r"[\u3400-\u9fff]")
KEYWORD_RE = re.compile(r"【[^】]+】")
PROTECT_RE = re.compile(r"#HIDE#.*?#HIDE#|\$[^$]+\$|<[^>]*>")

MANUAL_MAP = {
    "主动：": "Active: ",
    "被动：": "Passive: ",
    "[解除伪装]": "[Lift Disguise]",
    "宝可梦": "Pokemon",
    "精灵": "Pokemon",
    "训练家": "Trainer",
    "护甲": "Armor",
    "生命": "HP",
    "攻击": "Attack",
    "，已使用": ", used ",
    "次": " times",
    "当前已失败": "Current failures: ",
    "已获得": "Obtained: ",
    "可获得": "Can obtain: ",
    "金币": " gold",
    "（已使用": "(used ",
    "）": ")",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def output_encoding(path: Path) -> str:
    return "utf-8-sig" if path.read_bytes().startswith(b"\xef\xbb\xbf") else "utf-8"


def load_keyword_map(path: Path) -> dict[str, str]:
    with path.open("r", encoding="utf-8-sig", newline="") as handle:
        rows = list(csv.reader(handle))
    header = rows[0]
    i_name = header.index("name")
    i_key = header.index("key")
    out: dict[str, str] = {}
    for row in rows[3:]:
        if not row:
            continue
        out[row[i_key]] = row[i_name]
    return out


def replace_keywords(text: str, keyword_map: dict[str, str]) -> str:
    def repl(match: re.Match[str]) -> str:
        token = match.group(0)
        return keyword_map.get(token, token)

    return KEYWORD_RE.sub(repl, text)


def protect_tokens(text: str) -> tuple[str, list[str]]:
    tokens: list[str] = []

    def repl(match: re.Match[str]) -> str:
        idx = len(tokens)
        tokens.append(match.group(0))
        return f"__TOKEN_{idx}__"

    return PROTECT_RE.sub(repl, text), tokens


def restore_tokens(text: str, tokens: list[str]) -> str:
    for idx, token in enumerate(tokens):
        text = text.replace(f"__TOKEN_{idx}__", token)
    return text


def apply_manual_map(text: str) -> str:
    for source, target in MANUAL_MAP.items():
        text = text.replace(source, target)
    return text


def translate_text(
    text: str,
    translator: GoogleTranslator,
    cache: dict[str, str],
    keyword_map: dict[str, str],
) -> str:
    if not text or not CJK_RE.search(text):
        return text
    if text in cache:
        return cache[text]

    replaced = replace_keywords(text, keyword_map)
    replaced = apply_manual_map(replaced)
    protected, tokens = protect_tokens(replaced)

    if CJK_RE.search(protected):
        translated = translator.translate(protected)
    else:
        translated = protected
    translated = restore_tokens(translated, tokens)
    translated = translated.replace("Pokémon", "Pokemon")
    translated = translated.replace("trainer", "Trainer")
    translated = translated.replace("elf", "Pokemon")
    cache[text] = translated
    return translated


def sync(args: argparse.Namespace) -> int:
    with args.target.open("r", encoding="utf-8-sig", newline="") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    i_name = header.index("name")
    i_desc = header.index("desc")

    keyword_map = load_keyword_map(args.keywords)
    translator = GoogleTranslator(source="zh-CN", target="en")
    cache: dict[str, str] = {}

    updates = 0
    for row in rows[3:]:
        if not row:
            continue
        old_name = row[i_name]
        old_desc = row[i_desc]
        new_name = translate_text(old_name, translator, cache, keyword_map)
        new_desc = translate_text(old_desc, translator, cache, keyword_map)
        if new_name != old_name:
            row[i_name] = new_name
            updates += 1
        if new_desc != old_desc:
            row[i_desc] = new_desc
            updates += 1

    remaining = []
    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue
        for col_name, col_idx in (("name", i_name), ("desc", i_desc)):
            value = row[col_idx]
            if CJK_RE.search(value):
                remaining.append((line_number, row[0], col_name, value))

    print(f"updates={updates}")
    print(f"remaining_cjk={len(remaining)}")
    for line_number, row_id, col_name, value in remaining[:40]:
        print(f"remaining line={line_number} id={row_id} column={col_name} value={value!r}")

    if remaining:
        return 1
    if args.dry_run:
        return 0

    encoding = output_encoding(args.target)
    lineterminator = detect_lineterminator(args.target)
    with args.target.open("w", encoding=encoding, newline="") as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)
    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", type=Path, default=Path("game_config/auto_chess/trainer_skills.csv"))
    parser.add_argument("--keywords", type=Path, default=Path("game_config/auto_chess/key_words.csv"))
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
