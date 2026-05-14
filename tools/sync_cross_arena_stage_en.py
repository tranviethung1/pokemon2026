#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


TARGET_COLUMNS = ("stageName", "stageName_tw", "stageName_vn", "stageName_kr")
SOURCE_COLUMN = "stageName_en"
PLACEHOLDER_VALUES = {"", "44404", "???", "??I", "??II", "??III", "???I", "???II", "???III", "???IV", "????I", "????II", "????III", "????IV"}


def load_rows(path: Path, encoding: str) -> list[list[str]]:
    text = path.read_bytes().decode(encoding)
    return list(csv.reader(text.splitlines()))


def dump_rows(rows: list[list[str]]) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    return output.getvalue()


def sync_file(path: Path, encoding: str, dry_run: bool) -> None:
    rows = load_rows(path, encoding)
    header = rows[0]
    idx_id = header.index("变量名")
    idx_source = header.index(SOURCE_COLUMN)
    target_indexes = {column: header.index(column) for column in TARGET_COLUMNS}

    updated_by_column = {column: 0 for column in TARGET_COLUMNS}
    unchanged_by_column = {column: 0 for column in TARGET_COLUMNS}
    missing_source: list[str] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        source_name = row[idx_source].strip()
        if not row_id:
            continue

        if not source_name:
            missing_source.append(row_id)
            continue

        for column, idx_target in target_indexes.items():
            if row[idx_target] != source_name:
                row[idx_target] = source_name
                updated_by_column[column] += 1
            else:
                unchanged_by_column[column] += 1

    for column, idx_target in target_indexes.items():
        remaining_placeholders = []
        remaining_cjk = []
        for row in rows[3:]:
            if not row or not any(cell.strip() for cell in row):
                continue
            value = row[idx_target].strip()
            if value in PLACEHOLDER_VALUES:
                remaining_placeholders.append((row[idx_id], value))
            if any("\u4e00" <= ch <= "\u9fff" for ch in value):
                remaining_cjk.append((row[idx_id], value))

        print(f"{column}: updated={updated_by_column[column]}, unchanged={unchanged_by_column[column]}")
        print(f"{column}: remaining placeholders={len(remaining_placeholders)}")
        for row_id, value in remaining_placeholders[:10]:
            print(f"  - {row_id}: {value}")
        print(f"{column}: remaining CJK rows={len(remaining_cjk)}")
        for row_id, value in remaining_cjk[:10]:
            print(f"  - {row_id}: {value}")

    print(f"missing source rows: {len(missing_source)}")
    for row_id in missing_source[:10]:
        print(f"  - {row_id}")

    if dry_run:
        return

    path.write_bytes(dump_rows(rows).encode(encoding))


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Sync cross arena stage name columns to English"
    )
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/cross/arena/stage.csv"),
        help="Target CSV path",
    )
    parser.add_argument(
        "--encoding",
        default="gb18030",
        help="CSV encoding used for reading and writing",
    )
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.encoding, args.dry_run)


if __name__ == "__main__":
    main()
