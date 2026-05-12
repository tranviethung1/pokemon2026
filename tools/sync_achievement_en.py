#!/usr/bin/env python3
"""Sync English achievement category names from a Lua config into a CSV file."""

from __future__ import annotations

import argparse
import csv
import re
import sys
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Sync achievement.csv name column from achievement.lua using id."
    )
    parser.add_argument("--lua-source", required=True, type=Path, help="Path to achievement.lua")
    parser.add_argument("--csv-target", required=True, type=Path, help="Path to achievement.csv")
    parser.add_argument("--dry-run", action="store_true", help="Show what would change without writing.")
    return parser.parse_args()


def parse_lua_names(lua_path: Path) -> dict[str, str]:
    text = lua_path.read_text(encoding="utf-8")
    names: dict[str, str] = {}
    pattern = re.compile(
        r"\{\s*name\s*=\s*\"([^\"]*)\".*?name_en\s*=\s*\"([^\"]*)\".*?id\s*=\s*(\d+)",
        re.DOTALL,
    )

    for name, name_en, row_id in pattern.findall(text):
        names[row_id] = name_en or name

    return names


def sync_csv(csv_path: Path, lua_names: dict[str, str], dry_run: bool) -> int:
    with csv_path.open("r", encoding="utf-8-sig", newline="") as handle:
        rows = list(csv.reader(handle))

    if len(rows) < 4:
        print(f"CSV file looks too short: {csv_path}", file=sys.stderr)
        return 1

    headers = rows[0]
    if "name" not in headers:
        print("Missing CSV column: name", file=sys.stderr)
        return 1

    name_idx = headers.index("name")
    updates = 0
    missing_ids: list[str] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[0].strip()
        source_name = lua_names.get(row_id)
        if not source_name:
            missing_ids.append(row_id)
            continue

        if row[name_idx] != source_name:
            row[name_idx] = source_name
            updates += 1

    if not dry_run:
        with csv_path.open("w", encoding="utf-8-sig", newline="") as handle:
            writer = csv.writer(handle, lineterminator="\n")
            writer.writerows(rows)

    mode = "Dry run" if dry_run else "Updated"
    print(f"{mode}: {csv_path}")
    print(f"Name updates: {updates}")
    print(f"Missing ids: {len(missing_ids)}")
    if missing_ids:
        print(f"Missing id preview: {', '.join(missing_ids[:10])}")

    return 0


def main() -> int:
    args = parse_args()
    lua_names = parse_lua_names(args.lua_source)

    if not lua_names:
        print(f"No achievement names parsed from {args.lua_source}", file=sys.stderr)
        return 1

    return sync_csv(args.csv_target, lua_names, args.dry_run)


if __name__ == "__main__":
    raise SystemExit(main())
