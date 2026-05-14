# -*- coding: utf-8 -*-
"""Sync clone nature names to standardized English across all locale columns.

Usage:
  python3 tools/scripts/sync_clone_nature_names_from_en.py [--dry-run]

This file lives in the legacy `gb18030` clone config set. The game config
already uses English names for other translated clone tables, so this tool
normalizes every localized name column to the same English value.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
NATURE_CSV = ROOT / "game_config/clone/nature.csv"
NAME_COLUMNS = ["name", "name_tw", "name_en", "name_vn", "name_kr"]

NAME_MAP: dict[str, str] = {
    "一般": "Normal",
    "Normal": "Normal",
    "火": "Fire",
    "Fire": "Fire",
    "水": "Water",
    "Water": "Water",
    "草": "Grass",
    "Grass": "Grass",
    "电": "Electric",
    "電": "Electric",
    "Electic": "Electric",
    "Electric": "Electric",
    "Electricity": "Electric",
    "冰": "Ice",
    "Ice": "Ice",
    "格斗": "Fighting",
    "格鬥": "Fighting",
    "Fighting": "Fighting",
    "毒": "Poison",
    "Poison": "Poison",
    "地面": "Ground",
    "Ground": "Ground",
    "飞行": "Flying",
    "飛行": "Flying",
    "Fly": "Flying",
    "Flying": "Flying",
    "超能": "Psychic",
    "Psychic": "Psychic",
    "虫": "Bug",
    "蟲": "Bug",
    "Bug": "Bug",
    "岩石": "Rock",
    "Rock": "Rock",
    "幽灵": "Ghost",
    "幽靈": "Ghost",
    "Ghost": "Ghost",
    "龙": "Dragon",
    "龍": "Dragon",
    "Dragon": "Dragon",
    "恶": "Dark",
    "惡": "Dark",
    "Dark": "Dark",
    "钢": "Steel",
    "鋼": "Steel",
    "Steel": "Steel",
    "妖精": "Fairy",
    "Fairy": "Fairy",
}


def detect_encoding(path: Path) -> str:
    raw = path.read_bytes()
    for encoding in ("utf-8-sig", "utf-8", "gb18030"):
        try:
            raw.decode(encoding)
            return encoding
        except UnicodeDecodeError:
            continue
    raise UnicodeDecodeError("unknown", raw, 0, 1, "unable to detect encoding")


def detect_lineterminator(path: Path) -> str:
    return "\r\n" if b"\r\n" in path.read_bytes() else "\n"


def resolve_english(row: list[str], indices: dict[str, int]) -> str | None:
    for column in NAME_COLUMNS:
        value = row[indices[column]].strip()
        if value:
            translated = NAME_MAP.get(value)
            if translated:
                return translated
    return None


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    encoding = detect_encoding(NATURE_CSV)
    lineterminator = detect_lineterminator(NATURE_CSV)

    with NATURE_CSV.open("r", encoding=encoding, newline="") as f:
        rows = list(csv.reader(f))

    idx = {column: rows[0].index(column) for column in NAME_COLUMNS}
    updates = 0
    unresolved: list[tuple[int, str, str]] = []

    for row_no, row in enumerate(rows):
        if row_no < 4 or not any(row):
            continue
        row_id = row[0].strip()
        if not row_id:
            continue
        en = resolve_english(row, idx)
        if not en:
            unresolved.append((row_no + 1, row_id, row[idx["name"]]))
            continue
        changed = False
        for column in NAME_COLUMNS:
            if row[idx[column]] != en:
                row[idx[column]] = en
                changed = True
        if changed:
            updates += 1

    print("encoding:", encoding)
    print("rows touched:", updates)
    print("unresolved rows:", len(unresolved))
    for line_no, row_id, value in unresolved[:20]:
        print(f"unresolved line={line_no} id={row_id} value={value!r}")

    if not args.dry_run:
        with NATURE_CSV.open("w", encoding=encoding, newline="") as f:
            csv.writer(f, lineterminator=lineterminator).writerows(rows)
        print("wrote", NATURE_CSV)


if __name__ == "__main__":
    main()
