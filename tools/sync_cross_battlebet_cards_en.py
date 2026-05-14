#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/cross/battlebet/cards.csv"
DEFAULT_DICTIONARY = ROOT / "GAME_DICTIONARY.md"


def load_dictionary(path: Path) -> tuple[dict[str, str], dict[str, str]]:
    id_to_en: dict[str, str] = {}
    cn_to_en: dict[str, str] = {}

    for line in path.read_text(encoding="utf-8", errors="ignore").splitlines():
        if not line.startswith("|"):
            continue

        parts = [part.strip() for part in line.strip().strip("|").split("|")]
        if len(parts) < 4:
            continue

        first, second, english = parts[0], parts[1], parts[2]
        if not english or english == "English":
            continue

        if first.isdigit():
            id_to_en[first] = english
            if second:
                cn_to_en.setdefault(second, english)
        else:
            cn_to_en.setdefault(first, english)

    return id_to_en, cn_to_en


def load_rows(path: Path) -> list[list[str]]:
    return list(csv.reader(path.read_text(encoding="utf-8-sig").splitlines()))


def dump_rows(rows: list[list[str]]) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    return output.getvalue()


def sync_file(target: Path, dictionary: Path, dry_run: bool) -> None:
    rows = load_rows(target)
    id_to_en, cn_to_en = load_dictionary(dictionary)

    header = rows[0]
    idx_id = header.index("变量名")
    idx_desc = header.index("desc")
    idx_card = header.index("cardID")

    updated = 0
    unchanged = 0
    missing: list[tuple[str, str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        card_id = row[idx_card].strip()
        current_desc = row[idx_desc].strip()
        if not row_id:
            continue

        english = id_to_en.get(card_id) or cn_to_en.get(current_desc)
        if not english:
            missing.append((row_id, card_id, current_desc))
            continue

        if row[idx_desc] != english:
            row[idx_desc] = english
            updated += 1
        else:
            unchanged += 1

    remaining_cjk = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        value = row[idx_desc]
        if any("\u4e00" <= ch <= "\u9fff" for ch in value):
            remaining_cjk.append((row[idx_id], row[idx_card], value))

    print(f"updated desc: {updated}")
    print(f"unchanged desc: {unchanged}")
    print(f"missing mappings: {len(missing)}")
    for row_id, card_id, value in missing[:20]:
        print(f"  - row {row_id}, cardID {card_id}: {value}")
    print(f"remaining CJK rows: {len(remaining_cjk)}")
    for row_id, card_id, value in remaining_cjk[:20]:
        print(f"  - row {row_id}, cardID {card_id}: {value}")

    if dry_run:
        return

    target.write_text(dump_rows(rows), encoding="utf-8-sig")


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync cross battlebet cards.csv desc to English")
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET, help="Target CSV path")
    parser.add_argument(
        "--dictionary",
        type=Path,
        default=DEFAULT_DICTIONARY,
        help="Dictionary markdown path",
    )
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.dictionary, args.dry_run)


if __name__ == "__main__":
    main()
