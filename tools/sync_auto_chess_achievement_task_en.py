#!/usr/bin/env python3
"""Apply English name/desc from tools/auto_chess_achievement_task_en.json to game_config/auto_chess/achievement_task.csv."""

from __future__ import annotations

import argparse
import csv
import json
import re
from pathlib import Path

CJK_RE = re.compile(r"[\u3400-\u9fff]")


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", type=Path, default=Path("tools/auto_chess_achievement_task_en.json"))
    ap.add_argument("--target", type=Path, default=Path("game_config/auto_chess/achievement_task.csv"))
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    data: dict[str, dict[str, str]] = json.loads(args.data.read_text(encoding="utf-8"))
    lt = detect_lineterminator(args.target)
    with args.target.open(newline="", encoding="utf-8-sig") as f:
        rows = list(csv.reader(f))

    if len(rows) < 4:
        raise SystemExit("expected at least 4 rows (headers + data)")
    header = rows[0]
    try:
        name_i = header.index("name")
        desc_i = header.index("desc")
    except ValueError as e:
        raise SystemExit("CSV must have name and desc columns") from e

    missing: list[str] = []
    leftover: list[tuple[str, str, str]] = []
    for row in rows[3:]:
        if not row or len(row) <= max(name_i, desc_i):
            continue
        tid = row[0]
        if tid not in data:
            missing.append(tid)
            continue
        row[name_i] = data[tid]["name"]
        row[desc_i] = data[tid]["desc"]
        for lab, col in (("name", name_i), ("desc", desc_i)):
            if CJK_RE.search(row[col]):
                leftover.append((tid, lab, row[col][:100]))

    print("json_entries", len(data), "missing_ids", len(missing), "cjk_leftover", len(leftover))
    if missing[:15]:
        print("missing sample:", missing[:15])
    for tid, lab, snip in leftover[:12]:
        print("cjk", tid, lab, repr(snip))

    if args.dry_run:
        return 1 if missing or leftover else 0

    if missing:
        raise SystemExit(f"refusing write: missing {len(missing)} ids in json")
    if leftover:
        raise SystemExit(f"refusing write: {len(leftover)} fields still contain CJK")

    with args.target.open("w", newline="", encoding="utf-8-sig") as f:
        csv.writer(f, lineterminator=lt).writerows(rows)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
