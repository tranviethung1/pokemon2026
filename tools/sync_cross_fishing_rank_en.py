#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/cross/fishing/rank.csv"
DEFAULT_DICTIONARY = ROOT / "GAME_DICTIONARY.md"


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

    return cn_to_en


def load_rows(path: Path, encoding: str) -> list[list[str]]:
    return list(csv.reader(path.read_bytes().decode(encoding).splitlines()))


def dump_rows(rows: list[list[str]]) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    return output.getvalue()


def sync_file(target: Path, dictionary: Path, encoding: str, dry_run: bool) -> None:
    rows = load_rows(target, encoding)
    cn_to_en = load_dictionary(dictionary)

    header = rows[0]
    idx_id = header.index("变量名")
    idx_note = header.index("_beizhu")

    updated = 0
    unchanged = 0
    missing: list[tuple[str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        note = row[idx_note].strip()
        if not row_id or not note:
            continue

        english = cn_to_en.get(note)
        if not english:
            if not any("\u4e00" <= ch <= "\u9fff" for ch in note):
                unchanged += 1
            else:
                missing.append((row_id, note))
            continue

        if row[idx_note] != english:
            row[idx_note] = english
            updated += 1
        else:
            unchanged += 1

    remaining_cjk = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        value = row[idx_note]
        if any("\u4e00" <= ch <= "\u9fff" for ch in value):
            remaining_cjk.append((row[idx_id], value))

    print(f"updated _beizhu: {updated}")
    print(f"unchanged _beizhu: {unchanged}")
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
    parser = argparse.ArgumentParser(description="Sync cross fishing rank.csv _beizhu to English")
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET, help="Target CSV path")
    parser.add_argument("--dictionary", type=Path, default=DEFAULT_DICTIONARY, help="Dictionary markdown path")
    parser.add_argument("--encoding", default="gb18030", help="CSV encoding")
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.dictionary, args.encoding, args.dry_run)


if __name__ == "__main__":
    main()
