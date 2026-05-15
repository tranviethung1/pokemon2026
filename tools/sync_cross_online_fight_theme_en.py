#!/usr/bin/env python3
"""Translate desc_en in cross/online_fight/theme.csv."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

DESC_MAP = {
    "开局满怒气": "Start battle with full Rage.",
    "无限小技能": "Unlimited Basic Skills.",
    "快速回怒": "Fast Rage Recovery.",
    "自然属性克制加深": "Enhanced natural-type advantage.",
    "只能限制使用A卡及以下": "Restricted to A-rank cards and below only.",
    "只能限制使用S卡及以下": "Restricted to S-rank cards and below only.",
    "只能使用2张S卡": "Only 2 S-rank cards may be used.",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    idx_source = header.index("desc")
    idx_target = header.index("desc_en")

    updates = 0
    source_updates = 0
    missing: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or len(row) <= idx_target:
            continue

        source = row[idx_source].strip()
        translated = DESC_MAP.get(source)
        if translated:
            if row[idx_target] != translated:
                row[idx_target] = translated
                updates += 1
            if args.sync_source_column and row[idx_source] != row[idx_target]:
                row[idx_source] = row[idx_target]
                source_updates += 1
        elif source and CJK_RE.search(source):
            missing.append((line_number, row[0], source))

    remaining = [
        (line_number, row[0], row[idx_target])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and len(row) > idx_target and CJK_RE.search(row[idx_target])
    ]

    blanks = [
        (line_number, row[0])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and len(row) > idx_target and row[idx_source].strip() and not row[idx_target].strip()
    ]

    source_remaining = [
        (line_number, row[0], row[idx_source])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and len(row) > idx_source and CJK_RE.search(row[idx_source])
    ]

    print(f"rows={sum(1 for row in rows[3:] if row and row[0])}")
    print(f"desc_updates={source_updates}")
    print(f"desc_en_updates={updates}")
    print(f"missing_desc={len(missing)}")
    print(f"remaining_cjk_desc={len(source_remaining)}")
    print(f"blank_desc_en={len(blanks)}")
    print(f"remaining_cjk_desc_en={len(remaining)}")
    for line_number, row_id, value in missing[:20]:
        print(f"missing line={line_number} id={row_id} desc={value!r}")

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
        default=Path("game_config/cross/online_fight/theme.csv"),
    )
    parser.add_argument(
        "--sync-source-column",
        action="store_true",
        help="Also overwrite desc with desc_en for translated rows",
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
