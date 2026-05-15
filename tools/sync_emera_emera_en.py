#!/usr/bin/env python3
"""Translate emera/emera.csv name column to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

SHAPE_MAP = {
    "谜三角": "Enigma Triangle",
    "滴晶": "Droplet Crystal",
    "混方": "Hybrid Square",
    "涡晶": "Vortex Crystal",
    "耀星": "Radiant Star",
    "菱晶": "Rhombic Crystal",
}

QUALITY_MAP = {
    "绿": "Green",
    "蓝": "Blue",
    "紫": "Purple",
    "橙": "Orange",
    "红": "Red",
    "钻彩": "Prismatic",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def translate_name(value: str) -> str | None:
    if "·" not in value:
        return None
    shape, quality = value.split("·", 1)
    if shape not in SHAPE_MAP or quality not in QUALITY_MAP:
        return None
    return f"{SHAPE_MAP[shape]} - {QUALITY_MAP[quality]}"


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

        translated = translate_name(current)
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
        default=Path("game_config/emera/emera.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--force", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
