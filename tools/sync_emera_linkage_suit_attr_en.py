#!/usr/bin/env python3
"""Translate emera/linkage_suit_attr.csv name column to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_MAP = {
    "坚守·初": "Steadfast - Initiate",
    "格挡·凡": "Guard - Common",
    "韧性·精": "Tenacity - Refined",
    "不屈·辉": "Unyielding - Radiant",
    "反制·极": "Counter - Apex",
    "猛击·初": "Heavy Strike - Initiate",
    "连攻·凡": "Chain Attack - Common",
    "破甲·精": "Armor Shred - Refined",
    "狂战·辉": "Berserk - Radiant",
    "绝杀·极": "Execution - Apex",
    "迅捷·初": "Swiftness - Initiate",
    "活力·凡": "Vitality - Common",
    "专注·精": "Focus - Refined",
    "潜能·辉": "Potential - Radiant",
    "同心·极": "Unity - Apex",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    if len(rows) < 3:
        raise SystemExit("target CSV must include metadata, default, and description rows")

    header = rows[0]
    name_index = header.index("name")

    updates = 0
    unchanged = 0
    missing: list[tuple[int, str, str]] = []
    unresolved: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue

        current = row[name_index]
        if not args.force and current and not CJK_RE.search(current):
            unchanged += 1
            continue

        translated = NAME_MAP.get(current)
        if translated:
            if row[name_index] != translated:
                row[name_index] = translated
                updates += 1
            else:
                unchanged += 1
        else:
            missing.append((line_number, row[0], current))

        if CJK_RE.search(row[name_index]):
            unresolved.append((line_number, row[0], row[name_index]))

    print(f"rows={sum(1 for row in rows[3:] if row)}")
    print(f"name_updates={updates}")
    print(f"unchanged={unchanged}")
    print(f"missing_names={len(missing)}")
    print(f"remaining_cjk_names={len(unresolved)}")
    for line_number, row_id, value in missing[:20]:
        print(f"missing line={line_number} id={row_id} name={value!r}")

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding="utf-8-sig") as handle:
        writer = csv.writer(handle, lineterminator=detect_lineterminator(args.target))
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/emera/linkage_suit_attr.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--force", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
