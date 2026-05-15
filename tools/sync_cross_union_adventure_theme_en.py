#!/usr/bin/env python3
"""Translate cross/union_adventure/theme.csv theme names to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_MAP = {
    "开发主题": "Development Theme",
    "远古森林": "Ancient Forest",
    "倾雷之境": "Thunderfall Realm",
    "截虹之雨": "Rainbow-Sundering Rain",
    "燃烬焚灼": "Emberblaze Inferno",
    "终末凛冬": "Final Winter",
    "怨影冥灵": "Wraithshadow Nether",
    "雾隐迷航": "Mistbound Voyage",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    name_index = header.index("name")
    updates = 0
    missing: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue
        value = row[name_index]
        translated = NAME_MAP.get(value)
        if translated:
            if translated != value:
                row[name_index] = translated
                updates += 1
        elif CJK_RE.search(value):
            missing.append((line_number, row[0], value))

    remaining = [
        (line_number, row[0], row[name_index])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and CJK_RE.search(row[name_index])
    ]

    print(f"rows={sum(1 for row in rows[3:] if row)}")
    print(f"name_updates={updates}")
    print(f"missing_names={len(missing)}")
    print(f"remaining_cjk_names={len(remaining)}")
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
        default=Path("game_config/cross/union_adventure/theme.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
