#!/usr/bin/env python3
"""Translate cross/online_auto_chess/trainer.csv trainer display names to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_MAP = {
    "小智": "Ash",
    "小霞": "Misty",
    "拉普": "Rapp",
    "布尔美丽": "Plumeria",
    "露美旦": "Morgan",
    "梅雅利": "Meray",
    "三色堇": "Alexa",
    "紫罗兰": "Viola",
    "西子伊": "Marlon",
    "杜娟": "Roxanne",
    "阿克罗玛": "Colress",
    "亚莎": "Flannery",
    "修": "Hugh",
    "霍米加": "Roxie",
    "白露": "Bianca",
    "可尔妮": "Korrina",
    "兰昼妮": "Dana",
    "露夕华": "Evelyn",
    "兰妞夜": "Nita",
    "芦荟": "Lenora",
    "斗子": "Hilda",
    "小刚": "Brock",
    "大木博士": "Professor Oak",
    "芽衣": "Rosa",
    "弥莉丝": "Millis",
    "芙蓉": "Phoebe",
    "水莲": "Lana",
    "碧蓝": "Green",
    "碧珂": "Wicke",
    "达帕": "Tupp",
    "库库伊": "Kukui",
    "艾岚": "Alain",
    "朗日": "Elio",
    "美月": "Selene",
    "新手训练家": "Beginner Trainer",
    "训练机器人": "Training Robot",
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
    for line_number, row_id, value in remaining[:20]:
        print(f"remaining line={line_number} id={row_id} name={value!r}")

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
        default=Path("game_config/cross/online_auto_chess/trainer.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
