#!/usr/bin/env python3
"""Translate cross/supremacy/grade.csv stage names to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

STAGE_NAME_MAP = {
    "王者级": "King",
    "大师级": "Master",
    "钻石Ⅰ": "Diamond I",
    "钻石Ⅱ": "Diamond II",
    "钻石Ⅲ": "Diamond III",
    "钻石Ⅳ": "Diamond IV",
    "铂金Ⅰ": "Platinum I",
    "铂金Ⅱ": "Platinum II",
    "铂金Ⅲ": "Platinum III",
    "铂金Ⅳ": "Platinum IV",
    "黄金Ⅰ": "Gold I",
    "黄金Ⅱ": "Gold II",
    "黄金Ⅲ": "Gold III",
    "白银Ⅰ": "Silver I",
    "白银Ⅱ": "Silver II",
    "白银Ⅲ": "Silver III",
    "青铜Ⅰ": "Bronze I",
    "青铜Ⅱ": "Bronze II",
    "青铜Ⅲ": "Bronze III",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    name_index = header.index("stageName")
    updates = 0
    missing: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue
        value = row[name_index]
        translated = STAGE_NAME_MAP.get(value)
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
    print(f"stageName_updates={updates}")
    print(f"missing_stage_names={len(missing)}")
    print(f"remaining_cjk_stage_names={len(remaining)}")
    for line_number, row_id, value in missing[:20]:
        print(f"missing line={line_number} id={row_id} stageName={value!r}")

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
        default=Path("game_config/cross/supremacy/grade.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
