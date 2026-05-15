#!/usr/bin/env python3
"""Fill English name/desc columns for cross hunting supply.csv."""

from __future__ import annotations

import argparse
import csv
import re
from collections import Counter
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
TARGET = ROOT / "game_config/cross/hunting/supply.csv"
ENCODING = "gb18030"
CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_MAP = {
    "治疗单体": "Healing single unit",
    "治疗全体": "All ally healing",
    "复活单体": "Resurrection single unit",
}

DESC_MAP = {
    "恢复指定单位100%血量": "Restore 100% HP to the selected unit.",
    "恢复己方全部单位30%血量": "Restore 30% HP to all allied units.",
    "复活一个已死亡的角色": "Revive one fallen unit.",
}


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def sync(target: Path, dry_run: bool) -> int:
    lineterminator = detect_lineterminator(target)
    with target.open("r", encoding=ENCODING, newline="") as handle:
        rows = list(csv.reader(handle))

    if not rows:
        print("rows=0")
        return 0

    header = rows[0]
    name_idx = header.index("name")
    name_en_idx = header.index("name_en")
    desc_idx = header.index("desc")
    desc_en_idx = header.index("desc_en")
    id_idx = header.index("变量名")

    updates: Counter[str] = Counter()
    missing: list[tuple[str, str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        name_cn = row[name_idx].strip()
        desc_cn = row[desc_idx].strip()

        mapped_name = NAME_MAP.get(name_cn)
        mapped_desc = DESC_MAP.get(desc_cn)

        if mapped_name:
            if row[name_en_idx] != mapped_name:
                row[name_en_idx] = mapped_name
                updates["name_en"] += 1
        elif has_cjk(name_cn):
            missing.append((row[id_idx], "name", name_cn))

        if mapped_desc:
            if row[desc_en_idx] != mapped_desc:
                row[desc_en_idx] = mapped_desc
                updates["desc_en"] += 1
        elif has_cjk(desc_cn):
            missing.append((row[id_idx], "desc", desc_cn))

    remaining_bad: list[tuple[str, str, str]] = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        name_en = row[name_en_idx].strip()
        desc_en = row[desc_en_idx].strip()
        if not name_en or name_en == "404" or has_cjk(name_en):
            remaining_bad.append((row[id_idx], "name_en", name_en))
        if not desc_en or desc_en == "404" or has_cjk(desc_en):
            remaining_bad.append((row[id_idx], "desc_en", desc_en))

    print(f"rows={sum(1 for row in rows[3:] if row and any(cell.strip() for cell in row))}")
    print(f"name_en_updates={updates['name_en']}")
    print(f"desc_en_updates={updates['desc_en']}")
    print(f"missing_mappings={len(missing)}")
    for row_id, column, value in missing[:20]:
        print(f"missing row={row_id} column={column} value={value}")
    print(f"remaining_invalid_en={len(remaining_bad)}")
    for row_id, column, value in remaining_bad[:20]:
        print(f"remaining row={row_id} column={column} value={value!r}")

    if dry_run:
        return 0

    with target.open("w", encoding=ENCODING, newline="") as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", type=Path, default=TARGET)
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(**vars(parse_args())))
