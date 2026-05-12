#!/usr/bin/env python3
"""Translate selected CSV columns using exact CN->EN mappings from GAME_DICTIONARY.md."""

from __future__ import annotations

import argparse
import csv
import re
import sys
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Translate selected CSV columns using exact CN->EN mappings extracted "
            "from GAME_DICTIONARY.md."
        )
    )
    parser.add_argument("--csv-target", required=True, type=Path, help="Path to the target CSV file")
    parser.add_argument("--dictionary", required=True, type=Path, help="Path to GAME_DICTIONARY.md")
    parser.add_argument("--columns", nargs="+", required=True, help="CSV columns to translate")
    parser.add_argument("--dry-run", action="store_true", help="Show what would change without writing")
    return parser.parse_args()


def parse_markdown_row(line: str) -> list[str]:
    return [cell.strip() for cell in line.strip().strip("|").split("|")]


def is_separator_row(cells: list[str]) -> bool:
    for cell in cells:
        stripped = cell.replace(":", "").replace("-", "").strip()
        if stripped:
            return False
    return True


def parse_dictionary(dictionary_path: Path) -> dict[str, str]:
    mapping: dict[str, str] = {}
    cn_index: int | None = None
    en_index: int | None = None

    for line in dictionary_path.read_text(encoding="utf-8").splitlines():
        if not line.startswith("|"):
            cn_index = None
            en_index = None
            continue

        cells = parse_markdown_row(line)

        if "Gốc (CN)" in cells and "English" in cells:
            cn_index = cells.index("Gốc (CN)")
            en_index = cells.index("English")
            continue

        if cn_index is None or en_index is None or is_separator_row(cells):
            continue

        if max(cn_index, en_index) >= len(cells):
            continue

        cn_value = cells[cn_index]
        en_value = cells[en_index]

        if cn_value and en_value:
            mapping.setdefault(cn_value, en_value)

    return mapping


def translate_csv(csv_path: Path, mapping: dict[str, str], columns: list[str], dry_run: bool) -> int:
    with csv_path.open("r", encoding="utf-8-sig", newline="") as handle:
        rows = list(csv.reader(handle))

    if len(rows) < 4:
        print(f"CSV file looks too short: {csv_path}", file=sys.stderr)
        return 1

    headers = rows[0]
    missing_columns = [column for column in columns if column not in headers]
    if missing_columns:
        print(f"Missing columns: {', '.join(missing_columns)}", file=sys.stderr)
        return 1

    column_indexes = {column: headers.index(column) for column in columns}
    updates = 0
    missing_terms: list[str] = []
    missing_seen: set[str] = set()

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        for column, index in column_indexes.items():
            value = row[index].strip()

            if not value or not CJK_RE.search(value):
                continue

            translated = mapping.get(value)
            if translated:
                if row[index] != translated:
                    row[index] = translated
                    updates += 1
            elif value not in missing_seen:
                missing_seen.add(value)
                missing_terms.append(value)

    remaining_cjk_rows = 0
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        if any(CJK_RE.search(row[index]) for index in column_indexes.values()):
            remaining_cjk_rows += 1

    if not dry_run:
        with csv_path.open("w", encoding="utf-8-sig", newline="") as handle:
            writer = csv.writer(handle, lineterminator="\n")
            writer.writerows(rows)

    mode = "Dry run" if dry_run else "Updated"
    print(f"{mode}: {csv_path}")
    print(f"Columns: {', '.join(columns)}")
    print(f"Exact dictionary updates: {updates}")
    print(f"Remaining CJK rows: {remaining_cjk_rows}")
    print(f"Missing exact terms: {len(missing_terms)}")

    if missing_terms:
        preview = ", ".join(missing_terms[:20])
        print(f"Missing terms preview: {preview}")

    return 0


def main() -> int:
    args = parse_args()
    mapping = parse_dictionary(args.dictionary)

    if not mapping:
        print(f"No CN->EN mappings parsed from {args.dictionary}", file=sys.stderr)
        return 1

    return translate_csv(args.csv_target, mapping, args.columns, args.dry_run)


if __name__ == "__main__":
    raise SystemExit(main())
