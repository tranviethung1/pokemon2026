#!/usr/bin/env python3
"""Sync English achievement title/desc from a Lua config into a CSV file."""

from __future__ import annotations

import argparse
import csv
import json
import re
import sys
from pathlib import Path


TRACKED_FIELDS = {"id", "targetType2", "point", "title", "title_en", "desc", "desc_en"}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Sync title/desc in achievement_task.csv from title_en/desc_en "
            "inside achievement_task.lua using id + targetType2 + point."
        )
    )
    parser.add_argument("--lua-source", required=True, type=Path, help="Path to achievement_task.lua")
    parser.add_argument("--csv-target", required=True, type=Path, help="Path to achievement_task.csv")
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Show what would change without writing the CSV file.",
    )
    return parser.parse_args()


def normalize_key_part(value: object) -> str:
    text = str(value).strip()

    if not text:
        return ""
    if re.fullmatch(r"-?\d+\.0+", text):
        return text.split(".", 1)[0]

    return text


def decode_lua_string(raw: str) -> str:
    try:
        return json.loads(raw)
    except json.JSONDecodeError:
        inner = raw[1:-1]
        replacements = {
            r"\\": "\\",
            r"\"": "\"",
            r"\n": "\n",
            r"\r": "\r",
            r"\t": "\t",
        }
        for old, new in replacements.items():
            inner = inner.replace(old, new)
        return inner


def parse_lua_scalar(raw: str) -> object:
    value = raw.rstrip(",").strip()

    if not value:
        return ""
    if value.startswith('"') and value.endswith('"'):
        return decode_lua_string(value)
    if value in {"true", "false"}:
        return value == "true"
    if re.fullmatch(r"-?\d+", value):
        return int(value)
    if re.fullmatch(r"-?\d+\.\d+", value):
        number = float(value)
        return int(number) if number.is_integer() else number

    return value


def parse_lua_records(lua_path: Path) -> dict[tuple[str, str, str], dict[str, str]]:
    lines = lua_path.read_text(encoding="utf-8").splitlines()
    records: dict[tuple[str, str, str], dict[str, str]] = {}
    in_table = False
    current_depth = 0
    current_fields: dict[str, object] | None = None
    current_id: str | None = None

    for line in lines:
        if not in_table:
            if "csv.achievement.achievement_task" in line and "{" in line:
                in_table = True
            continue

        if current_fields is None:
            start_match = re.match(r"^\s*\[(\d+)\]\s*=\s*\{$", line)
            if start_match:
                current_id = start_match.group(1)
                current_fields = {}
                current_depth = 1
            elif line.strip() == "}":
                break
            continue

        if current_depth == 1:
            field_match = re.match(r"^\s*(\w+)\s*=\s*(.+?)(?:,)?\s*$", line)
            if field_match:
                field_name = field_match.group(1)
                field_value = field_match.group(2)
                if field_name in TRACKED_FIELDS and field_value != "{":
                    current_fields[field_name] = parse_lua_scalar(field_value)

        current_depth += line.count("{") - line.count("}")

        if current_depth == 0:
            record_id = normalize_key_part(current_fields.get("id", current_id or ""))
            target_type2 = normalize_key_part(current_fields.get("targetType2", ""))
            point = normalize_key_part(current_fields.get("point", ""))
            title = str(current_fields.get("title_en") or current_fields.get("title") or "")
            desc = str(current_fields.get("desc_en") or current_fields.get("desc") or "")
            key = (record_id, target_type2, point)
            records[key] = {
                "id": record_id,
                "targetType2": target_type2,
                "point": point,
                "title": title,
                "desc": desc,
            }
            current_fields = None
            current_id = None

    return records


def sync_csv(csv_path: Path, source_records: dict[tuple[str, str, str], dict[str, str]], dry_run: bool) -> int:
    with csv_path.open("r", encoding="utf-8-sig", newline="") as handle:
        rows = list(csv.reader(handle))

    if len(rows) < 4:
        print(f"CSV file looks too short: {csv_path}", file=sys.stderr)
        return 1

    headers = rows[0]
    required_columns = {"targetType2", "point", "title", "desc"}
    missing_columns = required_columns.difference(headers)
    if missing_columns:
        print(f"Missing CSV columns: {', '.join(sorted(missing_columns))}", file=sys.stderr)
        return 1

    id_idx = 0
    target_type2_idx = headers.index("targetType2")
    point_idx = headers.index("point")
    title_idx = headers.index("title")
    desc_idx = headers.index("desc")

    matched_rows = 0
    title_updates = 0
    desc_updates = 0
    missing_source_keys: list[tuple[str, str, str]] = []
    missing_title_rows: list[tuple[str, str, str]] = []
    missing_desc_rows: list[tuple[str, str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        key = (
            normalize_key_part(row[id_idx]),
            normalize_key_part(row[target_type2_idx]),
            normalize_key_part(row[point_idx]),
        )
        source = source_records.get(key)

        if source is None:
            missing_source_keys.append(key)
            continue

        matched_rows += 1
        source_title = source["title"]
        source_desc = source["desc"]

        if source_title:
            if row[title_idx] != source_title:
                row[title_idx] = source_title
                title_updates += 1
        else:
            missing_title_rows.append(key)

        if source_desc:
            if row[desc_idx] != source_desc:
                row[desc_idx] = source_desc
                desc_updates += 1
        else:
            missing_desc_rows.append(key)

    if not dry_run:
        with csv_path.open("w", encoding="utf-8-sig", newline="") as handle:
            writer = csv.writer(handle, lineterminator="\n")
            writer.writerows(rows)

    mode = "Dry run" if dry_run else "Updated"
    print(f"{mode}: {csv_path}")
    print(f"Matched rows: {matched_rows}")
    print(f"Title updates: {title_updates}")
    print(f"Desc updates: {desc_updates}")
    print(f"Missing source rows: {len(missing_source_keys)}")
    print(f"Missing source title: {len(missing_title_rows)}")
    print(f"Missing source desc: {len(missing_desc_rows)}")

    if missing_source_keys:
        preview = ", ".join("/".join(key) for key in missing_source_keys[:10])
        print(f"Missing source preview: {preview}")
    if missing_title_rows:
        preview = ", ".join("/".join(key) for key in missing_title_rows[:10])
        print(f"Missing title preview: {preview}")
    if missing_desc_rows:
        preview = ", ".join("/".join(key) for key in missing_desc_rows[:10])
        print(f"Missing desc preview: {preview}")

    return 0


def main() -> int:
    args = parse_args()
    source_records = parse_lua_records(args.lua_source)

    if not source_records:
        print(f"No achievement records parsed from {args.lua_source}", file=sys.stderr)
        return 1

    return sync_csv(args.csv_target, source_records, args.dry_run)


if __name__ == "__main__":
    raise SystemExit(main())
