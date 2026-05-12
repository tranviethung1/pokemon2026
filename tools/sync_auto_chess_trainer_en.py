#!/usr/bin/env python3
"""Translate auto_chess/trainer.csv trainer display names to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_MAP = {
    "测试": "Test",
    "新手引导": "Beginner Guide",
    "大木博士": "Professor Oak",
    "野生宝可梦": "Wild Pokemon",
    "温和的训练家": "Gentle Trainer",
    "首领": "Boss",
    "调皮的训练家": "Mischievous Trainer",
    "强悍的训练家": "Tough Trainer",
    "森林的住民": "Forest Dweller",
    "PVP阵容测试专用": "PVP Lineup Test Only",
    "擂台比试": "Arena Match",
    "恶棍巢穴": "Rogue Hideout",
    "古老陵墓": "Ancient Tomb",
    "心灵控制": "Mind Control",
    "夏伯": "Blaine",
    "阿蜜": "Jasmine",
    "松叶": "Morty",
    "玛绣": "Valerie",
    "小菘": "Candice",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8") as handle:
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
    for line_number, row_id, value in remaining[:20]:
        print(f"remaining line={line_number} id={row_id} name={value!r}")

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle, lineterminator=detect_lineterminator(args.target))
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", type=Path, default=Path("game_config/auto_chess/trainer.csv"))
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
