#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/arms/arms.csv"
DEFAULT_DICTIONARY = ROOT / "GAME_DICTIONARY.md"

EMBLEM_OVERRIDES = {
    "普纹章": "Normal Emblem",
    "火纹章": "Fire Emblem",
    "水纹章": "Water Emblem",
    "草纹章": "Grass Emblem",
    "电纹章": "Electric Emblem",
    "冰纹章": "Ice Emblem",
    "斗纹章": "Fighting Emblem",
    "毒纹章": "Poison Emblem",
    "地纹章": "Ground Emblem",
    "飞纹章": "Flying Emblem",
    "超纹章": "Psychic Emblem",
    "虫纹章": "Bug Emblem",
    "岩纹章": "Rock Emblem",
    "鬼纹章": "Ghost Emblem",
    "龙纹章": "Dragon Emblem",
    "恶纹章": "Dark Emblem",
    "钢纹章": "Steel Emblem",
    "妖纹章": "Fairy Emblem",
}

SHORT_TYPE_ALIASES = {
    "普": "Normal",
    "火": "Fire",
    "水": "Water",
    "草": "Grass",
    "电": "Electric",
    "冰": "Ice",
    "斗": "Fighting",
    "毒": "Poison",
    "地": "Ground",
    "飞": "Flying",
    "超": "Psychic",
    "虫": "Bug",
    "岩": "Rock",
    "鬼": "Ghost",
    "龙": "Dragon",
    "恶": "Dark",
    "钢": "Steel",
    "妖": "Fairy",
}


def load_dictionary(path: Path) -> dict[str, str]:
    cn_to_en: dict[str, str] = {}

    for line in path.read_text(encoding="utf-8", errors="ignore").splitlines():
        if not line.startswith("|"):
            continue
        parts = [part.strip() for part in line.strip().strip("|").split("|")]
        if len(parts) < 3:
            continue
        if parts[0] in {"Gốc (CN)", ":---", "ID", "Keyword `【…】`"}:
            continue
        if parts[0].isdigit():
            if len(parts) >= 3 and parts[1] and parts[2] and parts[2] != "English":
                cn_to_en.setdefault(parts[1], parts[2])
        else:
            if parts[0] and parts[1] and parts[1] != "English":
                cn_to_en.setdefault(parts[0], parts[1])

    cn_to_en.update(SHORT_TYPE_ALIASES)
    return cn_to_en


def load_rows(path: Path, encoding: str) -> list[list[str]]:
    return list(csv.reader(path.read_bytes().decode(encoding).splitlines()))


def dump_rows(rows: list[list[str]]) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    return output.getvalue()


def translate_name(name: str, cn_to_en: dict[str, str]) -> str | None:
    if not any("\u4e00" <= ch <= "\u9fff" for ch in name):
        return name
    if name in EMBLEM_OVERRIDES:
        return EMBLEM_OVERRIDES[name]
    if name.endswith("纹章"):
        stem = name[:-2]
        if stem in cn_to_en:
            return f"{cn_to_en[stem]} Emblem"
    return None


def sync_file(target: Path, dictionary: Path, encoding: str, dry_run: bool) -> None:
    rows = load_rows(target, encoding)
    cn_to_en = load_dictionary(dictionary)

    header = rows[0]
    idx_id = header.index("变量名")
    idx_name = header.index("name")

    updated = 0
    unchanged = 0
    missing: list[tuple[str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        row_id = row[idx_id].strip()
        current_name = row[idx_name].strip()
        if not row_id or not current_name:
            continue

        english = translate_name(current_name, cn_to_en)
        if not english:
            if not any("\u4e00" <= ch <= "\u9fff" for ch in current_name):
                unchanged += 1
            else:
                missing.append((row_id, current_name))
            continue

        if row[idx_name] != english:
            row[idx_name] = english
            updated += 1
        else:
            unchanged += 1

    remaining_cjk = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        if any("\u4e00" <= ch <= "\u9fff" for ch in row[idx_name]):
            remaining_cjk.append((row[idx_id], row[idx_name]))

    print(f"updated name: {updated}")
    print(f"unchanged name: {unchanged}")
    print(f"missing mappings: {len(missing)}")
    for row_id, value in missing[:20]:
        print(f"  - row {row_id}: {value}")
    print(f"remaining CJK rows: {len(remaining_cjk)}")
    for row_id, value in remaining_cjk[:20]:
        print(f"  - row {row_id}: {value}")

    if dry_run:
        return

    target.write_bytes(dump_rows(rows).encode(encoding))


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync arms.csv names to English")
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET, help="Target CSV path")
    parser.add_argument("--dictionary", type=Path, default=DEFAULT_DICTIONARY, help="Dictionary markdown path")
    parser.add_argument("--encoding", default="gb18030", help="CSV encoding")
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.dictionary, args.encoding, args.dry_run)


if __name__ == "__main__":
    main()
