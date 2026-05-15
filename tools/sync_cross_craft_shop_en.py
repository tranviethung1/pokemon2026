#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
import re
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/cross/craft/shop.csv"
DEFAULT_DICTIONARY = ROOT / "GAME_DICTIONARY.md"

PREFERRED_NAME_BY_ITEM_MAP = {
    "{15=2}": "EXP Potion",
    "{514=30}": "Gold",
    "{5000=40}": "Energy Potion",
    "{529=100}": "Runestone Essence",
    "{992=1}": "Purple Sigil Choice Box",
    "{993=1}": "Orange Sigil Choice Box",
    "{973=1}": "Red Sigil Choice Box",
    "{21971=1}": "Groudon",
    "{2208=1}": "Viola",
}


def load_dictionary(path: Path) -> tuple[dict[str, str], dict[str, str]]:
    id_to_en: dict[str, str] = {}
    cn_to_en: dict[str, str] = {}

    for line in path.read_text(encoding="utf-8", errors="ignore").splitlines():
        if not line.startswith("|"):
            continue

        parts = [part.strip() for part in line.strip().strip("|").split("|")]
        if len(parts) < 3:
            continue

        if parts[0] in {"Gốc (CN)", ":---", "ID", "Keyword `【…】`"}:
            continue

        if parts[0].isdigit():
            if len(parts) >= 3 and parts[1] and parts[2] and parts[2] != "English":
                id_to_en[parts[0]] = parts[2]
                cn_to_en.setdefault(parts[1], parts[2])
        else:
            if parts[0] and parts[1] and parts[1] != "English":
                cn_to_en.setdefault(parts[0], parts[1])

    return id_to_en, cn_to_en


def load_rows(path: Path, encoding: str) -> list[list[str]]:
    return list(csv.reader(path.read_bytes().decode(encoding).splitlines()))


def dump_rows(rows: list[list[str]]) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    return output.getvalue()


def parse_item_id(item_map: str) -> str | None:
    match = re.search(r"\{(\d+)=", item_map)
    return match.group(1) if match else None


def sync_file(target: Path, dictionary: Path, encoding: str, dry_run: bool) -> None:
    rows = load_rows(target, encoding)
    id_to_en, cn_to_en = load_dictionary(dictionary)

    header = rows[0]
    idx_id = header.index("变量名")
    idx_note = header.index("_beizhu")
    idx_item = header.index("itemMap")

    updated = 0
    unchanged = 0
    missing: list[tuple[str, str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        note = row[idx_note].strip()
        item_map = row[idx_item].strip()
        if not note:
            continue

        item_id = parse_item_id(item_map)
        english = (
            PREFERRED_NAME_BY_ITEM_MAP.get(item_map)
            or cn_to_en.get(note)
            or (id_to_en.get(item_id) if item_id else None)
        )
        if not english:
            if not any("\u4e00" <= ch <= "\u9fff" for ch in note):
                unchanged += 1
                continue
            missing.append((row_id, note, item_map))
            continue

        if row[idx_note] != english:
            row[idx_note] = english
            updated += 1
        else:
            unchanged += 1

    remaining_cjk = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        value = row[idx_note]
        if any("\u4e00" <= ch <= "\u9fff" for ch in value):
            remaining_cjk.append((row[idx_id], value))

    print(f"updated _beizhu: {updated}")
    print(f"unchanged _beizhu: {unchanged}")
    print(f"missing mappings: {len(missing)}")
    for row_id, note, item_map in missing[:20]:
        print(f"  - row {row_id}: {note} | {item_map}")
    print(f"remaining CJK rows: {len(remaining_cjk)}")
    for row_id, value in remaining_cjk[:20]:
        print(f"  - row {row_id}: {value}")

    if dry_run:
        return

    target.write_bytes(dump_rows(rows).encode(encoding))


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync cross craft shop.csv _beizhu to English")
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET, help="Target CSV path")
    parser.add_argument("--dictionary", type=Path, default=DEFAULT_DICTIONARY, help="Dictionary markdown path")
    parser.add_argument("--encoding", default="gb18030", help="CSV encoding")
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.dictionary, args.encoding, args.dry_run)


if __name__ == "__main__":
    main()
