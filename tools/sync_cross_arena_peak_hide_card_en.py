#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


ID_TO_NAME = {
    "762": "Mega Mewtwo X",
    "763": "Mega Mewtwo Y",
    "1111": "Swinub",
    "1112": "Piloswine",
    "1113": "Mamoswine",
    "1141": "Delibird",
    "1261": "Lugia",
    "1941": "Latias",
    "1951": "Latios",
    "1961": "Kyogre",
    "1962": "Primal Kyogre",
    "1971": "Groudon",
    "1972": "Primal Groudon",
    "1982": "Mega Rayquaza",
    "2421": "Manaphy",
    "3241": "Kyurem",
    "3242": "White Kyurem",
    "3243": "Black Kyurem",
    "3601": "Xerneas",
    "3611": "Yveltal",
    "3632": "Mega Diancie",
    "3641": "Hoppa Confined",
    "3642": "Hoppa Unbound",
    "4103": "Dusk Mane",
    "4104": "Dawn Wings",
    "4631": "Zarude",
    "4682": "Calyrex Ice Rider",
    "4683": "Calyrex Shadow Rider",
    "5391": "Miraidon",
    "7051": "Shiny Mega Gardevoir",
    "7131": "Shiny Mega Abomasnow",
    "7181": "Zinnia's Mega Salamence",
    "7191": "Red Flash Mega Scizor",
    "7221": "Shiny Mega Aerodactyl",
}


def translate_file(path: Path, dry_run: bool) -> None:
    rows = list(csv.reader(path.read_text(encoding="utf-8-sig").splitlines()))
    header = rows[0]
    idx_id = header.index("变量名")
    idx_name = header.index("name")

    updated = 0
    missing: list[str] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        row_id = row[idx_id].strip()
        if not row_id:
            continue
        name = ID_TO_NAME.get(row_id)
        if name is None:
            missing.append(row_id)
            continue
        if row[idx_name] != name:
            row[idx_name] = name
            updated += 1

    remaining_cjk = []
    for row in rows[3:]:
        if row and len(row) > idx_name and any("\u4e00" <= ch <= "\u9fff" for ch in row[idx_name]):
            remaining_cjk.append((row[idx_id], row[idx_name]))

    print(f"updated name: {updated}")
    if missing:
        print("missing ids:")
        for row_id in missing:
            print(f"  - {row_id}")
    print(f"remaining CJK rows: {len(remaining_cjk)}")
    for row_id, value in remaining_cjk[:10]:
        print(f"  - {row_id}: {value}")

    if dry_run:
        return

    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    path.write_text(output.getvalue(), encoding="utf-8-sig")


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync cross arena peak hide_card.csv names to English")
    parser.add_argument(
        "--target",
        default="/home/hungtv/pokemon2026/game_config/cross/arena_peak/hide_card.csv",
        help="Target CSV path",
    )
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()
    translate_file(Path(args.target), args.dry_run)


if __name__ == "__main__":
    main()
