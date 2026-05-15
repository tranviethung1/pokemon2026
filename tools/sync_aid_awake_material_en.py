#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/aid/awake_material.csv"

NAME_MAP = {
    "妙蛙花觉醒结晶": "Venusaur Awakening Crystal",
    "妙蛙种子·Z觉醒碎片": "Bulbasaur Z-Awakening Fragment",
}

DESC_MAP = {
    "用于提升妙蛙种子的Z觉醒养成": "Used to advance Bulbasaur's Z-Awakening growth",
}


def load_rows(path: Path) -> list[list[str]]:
    return list(csv.reader(path.read_text(encoding="utf-8-sig").splitlines()))


def dump_rows(rows: list[list[str]]) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    return output.getvalue()


def sync_file(target: Path, dry_run: bool) -> None:
    rows = load_rows(target)
    header = rows[0]
    idx_id = header.index("变量名")
    idx_name = header.index("name")
    idx_desc = header.index("desc") if "desc" in header else None
    idx_desc1 = header.index("desc1") if "desc1" in header else None

    updated_name = 0
    unchanged_name = 0
    missing_name: list[tuple[str, str]] = []
    updated_desc = 0
    unchanged_desc = 0
    missing_desc: list[tuple[str, str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        current_name = row[idx_name].strip()
        if not row_id or not current_name:
            if not row_id:
                continue
        if current_name:
            english_name = NAME_MAP.get(current_name)
            if not english_name:
                if not any("\u4e00" <= ch <= "\u9fff" for ch in current_name):
                    unchanged_name += 1
                else:
                    missing_name.append((row_id, current_name))
            elif row[idx_name] != english_name:
                row[idx_name] = english_name
                updated_name += 1
            else:
                unchanged_name += 1

        for label, idx in (("desc", idx_desc), ("desc1", idx_desc1)):
            if idx is None or idx >= len(row):
                continue
            current_desc = row[idx].strip()
            if not current_desc:
                continue
            english_desc = DESC_MAP.get(current_desc)
            if not english_desc:
                if not any("\u4e00" <= ch <= "\u9fff" for ch in current_desc):
                    unchanged_desc += 1
                else:
                    missing_desc.append((row_id, label, current_desc))
            elif row[idx] != english_desc:
                row[idx] = english_desc
                updated_desc += 1
            else:
                unchanged_desc += 1

    remaining_cjk_name = []
    remaining_cjk_desc = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        if any("\u4e00" <= ch <= "\u9fff" for ch in row[idx_name]):
            remaining_cjk_name.append((row[idx_id], row[idx_name]))
        for idx in [idx_desc, idx_desc1]:
            if idx is not None and idx < len(row) and any("\u4e00" <= ch <= "\u9fff" for ch in row[idx]):
                remaining_cjk_desc.append((row[idx_id], row[idx]))

    print(f"updated name: {updated_name}")
    print(f"unchanged name: {unchanged_name}")
    print(f"missing name mappings: {len(missing_name)}")
    for row_id, value in missing_name[:20]:
        print(f"  - row {row_id}: {value}")
    print(f"remaining CJK name rows: {len(remaining_cjk_name)}")
    for row_id, value in remaining_cjk_name[:20]:
        print(f"  - row {row_id}: {value}")

    print(f"updated desc fields: {updated_desc}")
    print(f"unchanged desc fields: {unchanged_desc}")
    print(f"missing desc mappings: {len(missing_desc)}")
    for row_id, label, value in missing_desc[:20]:
        print(f"  - row {row_id} {label}: {value}")
    print(f"remaining CJK desc rows: {len(remaining_cjk_desc)}")
    for row_id, value in remaining_cjk_desc[:20]:
        print(f"  - row {row_id}: {value}")

    if dry_run:
        return

    target.write_text(dump_rows(rows), encoding="utf-8-sig")


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync aid awake_material/awake_meterial csv text to English")
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET, help="Target CSV path")
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.dry_run)


if __name__ == "__main__":
    main()
