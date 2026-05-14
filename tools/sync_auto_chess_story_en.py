#!/usr/bin/env python3
"""Fill English story text in game_config/auto_chess/story.csv from tools/data/auto_chess_story_en.json."""

from __future__ import annotations

import argparse
import csv
import json
import re
from pathlib import Path

CJK_RE = re.compile(r"[\u3400-\u9fff]")

TEXT_FIELDS = frozenset(
    {
        "name",
        "desc",
        "choiceDesc1",
        "choiceDesc2",
        "choiceDesc3",
        "choiceDesc4",
        "choice1After",
        "choice2After",
        "choice3After",
        "choice4After",
    }
)


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--target",
        type=Path,
        default=repo_root() / "game_config" / "auto_chess" / "story.csv",
    )
    parser.add_argument(
        "--translations",
        type=Path,
        default=Path(__file__).with_name("data") / "auto_chess_story_en.json",
    )
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    raw = json.loads(args.translations.read_text(encoding="utf-8"))
    by_id: dict[str, dict[str, str]] = raw["by_id"]

    lt = detect_lineterminator(args.target)
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    field_index = {name: header.index(name) for name in TEXT_FIELDS if name in header}

    updates = 0
    missing_ids: list[str] = []

    for row in rows[3:]:
        if not row or not row[0].strip().isdigit():
            continue
        rid = row[0].strip()
        if rid not in by_id:
            missing_ids.append(rid)
            continue
        tr = by_id[rid]
        for key, en in tr.items():
            if key not in field_index:
                continue
            i = field_index[key]
            while len(row) <= i:
                row.append("")
            if row[i] != en:
                row[i] = en
                updates += 1

    remaining: list[tuple[str, str, str]] = []
    for row in rows[3:]:
        if not row or not row[0].strip().isdigit():
            continue
        rid = row[0].strip()
        for key, i in field_index.items():
            v = row[i] if i < len(row) else ""
            if CJK_RE.search(v or ""):
                remaining.append((rid, key, v))

    print(f"translation_ids={len(by_id)}")
    print(f"cell_updates={updates}")
    print(f"missing_translation_ids={len(missing_ids)}")
    if missing_ids:
        print("missing:", ", ".join(missing_ids))
    print(f"remaining_cjk_cells={len(remaining)}")
    for rid, label, v in remaining[:30]:
        print(f"  id={rid} {label}={v!r}")

    if args.dry_run:
        return 0

    if missing_ids:
        return 1

    args.target.write_text("", encoding="utf-8")
    with args.target.open("w", newline="", encoding="utf-8-sig") as handle:
        writer = csv.writer(handle, lineterminator=lt)
        writer.writerows(rows)

    return 0 if not remaining else 2


if __name__ == "__main__":
    raise SystemExit(main())
