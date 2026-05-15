#!/usr/bin/env python3
"""Sync gem/suit.csv suitName from suitName_en."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")


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
    suit_name_index = header.index("suitName")
    suit_name_en_index = header.index("suitName_en")

    updates = 0
    unchanged = 0
    missing_en: list[tuple[int, str, str]] = []
    unresolved: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or not row[0]:
            continue

        current = row[suit_name_index]
        english = row[suit_name_en_index].strip()

        if not english:
            missing_en.append((line_number, row[0], current))
            if has_cjk(current):
                unresolved.append((line_number, row[0], current))
            continue

        if row[suit_name_index] != english:
            row[suit_name_index] = english
            updates += 1
        else:
            unchanged += 1

        if has_cjk(row[suit_name_index]):
            unresolved.append((line_number, row[0], row[suit_name_index]))

    print(f"encoding={encoding}")
    print(f"rows={sum(1 for row in rows[3:] if row and row[0])}")
    print(f"suitName_updates={updates}")
    print(f"unchanged={unchanged}")
    print(f"missing_suitName_en_rows={len(missing_en)}")
    print(f"remaining_cjk_names={len(unresolved)}")
    for line_number, row_id, value in missing_en[:20]:
        print(f"missing_suitName_en line={line_number} id={row_id} suitName={value!r}")

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
        default=Path("game_config/gem/suit.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
