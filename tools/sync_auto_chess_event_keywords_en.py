#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/auto_chess/event.csv"
DEFAULT_KEYWORDS = ROOT / "game_config/auto_chess/key_words.csv"


def load_keyword_map(path: Path) -> dict[str, str]:
    rows = list(csv.reader(path.read_text(encoding="utf-8-sig").splitlines()))
    idx_name = rows[0].index("name")
    idx_key = rows[0].index("key")
    mapping: dict[str, str] = {}
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        key = row[idx_key].strip()
        name = row[idx_name].strip()
        if key and name:
            mapping[key] = name
    return mapping


def load_rows(path: Path) -> list[list[str]]:
    return list(csv.reader(path.read_text(encoding="utf-8-sig").splitlines()))


def dump_rows(rows: list[list[str]]) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    return output.getvalue()


def replace_keywords(text: str, mapping: dict[str, str]) -> str:
    for cn, en in mapping.items():
        text = text.replace(cn, en)
    return text


def sync_file(target: Path, keywords: Path, dry_run: bool) -> None:
    rows = load_rows(target)
    mapping = load_keyword_map(keywords)

    header = rows[0]
    idx_id = header.index("变量名")
    idx_card_effect = header.index("cardEffect")
    idx_keywords = header.index("keyWords")

    updated_card_effect = 0
    updated_keywords = 0

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        if idx_card_effect < len(row) and row[idx_card_effect]:
            replaced = replace_keywords(row[idx_card_effect], mapping)
            if replaced != row[idx_card_effect]:
                row[idx_card_effect] = replaced
                updated_card_effect += 1
        if idx_keywords < len(row) and row[idx_keywords]:
            replaced = replace_keywords(row[idx_keywords], mapping)
            if replaced != row[idx_keywords]:
                row[idx_keywords] = replaced
                updated_keywords += 1

    remaining = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        for idx, label in ((idx_card_effect, "cardEffect"), (idx_keywords, "keyWords")):
            if idx < len(row):
                value = row[idx]
                if any("\u4e00" <= ch <= "\u9fff" for ch in value):
                    remaining.append((row[idx_id], label, value))

    print(f"updated cardEffect: {updated_card_effect}")
    print(f"updated keyWords: {updated_keywords}")
    print(f"remaining CJK cells: {len(remaining)}")
    for row_id, label, value in remaining[:20]:
        print(f"  - row {row_id} {label}: {value}")

    if dry_run:
        return

    target.write_text(dump_rows(rows), encoding="utf-8-sig")


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync auto_chess event.csv keyword tokens to English")
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET, help="Target CSV path")
    parser.add_argument("--keywords", type=Path, default=DEFAULT_KEYWORDS, help="Keyword CSV path")
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.keywords, args.dry_run)


if __name__ == "__main__":
    main()
