#!/usr/bin/env python3
"""Sync fishing/fish.csv display fields from the English columns."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_EN_OVERRIDES = {
    "11": "Arrokuda",
    "204": "Arctovish",
}


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def detect_encoding(path: Path) -> str:
    data = path.read_bytes()
    if data.startswith(b"\xef\xbb\xbf"):
        return "utf-8-sig"
    for encoding in ("utf-8", "gb18030"):
        try:
            data.decode(encoding)
            return encoding
        except UnicodeDecodeError:
            continue
    raise SystemExit(f"unable to decode {path}")


def read_csv_rows(path: Path) -> tuple[list[list[str]], str]:
    encoding = detect_encoding(path)
    with path.open(encoding=encoding, newline="") as handle:
        return list(csv.reader(handle)), encoding


def sync(args: argparse.Namespace) -> int:
    rows, encoding = read_csv_rows(args.target)
    lineterminator = detect_lineterminator(args.target)

    if len(rows) < 3:
        raise SystemExit("target CSV must include metadata, default, and description rows")

    header = rows[0]
    name_index = header.index("name")
    name_en_index = header.index("name_en")
    desc_index = header.index("desc")
    desc_en_index = header.index("desc_en")

    stats = {
        "name_en_backfill": 0,
        "name_updates": 0,
        "desc_updates": 0,
        "unchanged": 0,
    }
    missing_name_en: list[tuple[int, str, str]] = []
    missing_desc_en: list[tuple[int, str, str]] = []
    unresolved: list[tuple[int, str, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or not row[0]:
            continue

        row_id = row[0]
        changed = False

        name_en = row[name_en_index].strip()
        if not name_en and row_id in NAME_EN_OVERRIDES:
            row[name_en_index] = NAME_EN_OVERRIDES[row_id]
            name_en = row[name_en_index]
            stats["name_en_backfill"] += 1
            changed = True

        if name_en:
            if row[name_index] != name_en:
                row[name_index] = name_en
                stats["name_updates"] += 1
                changed = True
        else:
            missing_name_en.append((line_number, row_id, row[name_index]))

        desc_en = row[desc_en_index].strip()
        if desc_en:
            if row[desc_index] != desc_en:
                row[desc_index] = desc_en
                stats["desc_updates"] += 1
                changed = True
        else:
            missing_desc_en.append((line_number, row_id, row[desc_index]))

        if not changed:
            stats["unchanged"] += 1

        if has_cjk(row[name_index]) or has_cjk(row[desc_index]):
            unresolved.append((line_number, row_id, row[name_index], row[desc_index]))

    print(f"encoding={encoding}")
    print(f"rows={sum(1 for row in rows[3:] if row and row[0])}")
    for key in ("name_en_backfill", "name_updates", "desc_updates", "unchanged"):
        print(f"{key}={stats[key]}")
    print(f"missing_name_en_rows={len(missing_name_en)}")
    print(f"missing_desc_en_rows={len(missing_desc_en)}")
    print(f"remaining_cjk_rows={len(unresolved)}")
    for line_number, row_id, value in missing_name_en[:20]:
        print(f"missing_name_en line={line_number} id={row_id} name={value!r}")
    for line_number, row_id, value in missing_desc_en[:20]:
        print(f"missing_desc_en line={line_number} id={row_id} desc={value[:80]!r}")

    if args.dry_run:
        return 0

    with args.target.open("w", encoding=encoding, newline="") as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/fishing/fish.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
