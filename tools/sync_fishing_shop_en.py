#!/usr/bin/env python3
"""Translate fishing/shop.csv _beizhu field to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

NOTE_OVERRIDES = {
    "培养代币": "Cultivation Token",
    "强化药剂": "Energy Potion",
    "5W金币": "50K Gold",
    "盖欧卡碎片": "Kyogre Shard",
    "晶石盒子": "Crystal Box",
    "形象兑换": "Appearance Exchange",
    "普通努力币": "Basic Effort Coin",
    "高级努力币": "Advanced Effort Coin",
    "携带道具蓝材料": "Blue Held Item Material",
    "蓝色潜能升级材料": "Blue Potential Upgrade Material",
    "紫色潜能升级材料": "Purple Potential Upgrade Material",
}


def load_dictionary(path: Path) -> dict[str, str]:
    mapping: dict[str, str] = {}
    source_index: int | None = None
    english_index: int | None = None

    for raw_line in path.read_text(encoding="utf-8").splitlines():
        if not raw_line.startswith("|"):
            source_index = None
            english_index = None
            continue

        cells = [cell.strip() for cell in raw_line.strip().strip("|").split("|")]
        if all(set(cell) <= {":", "-", " "} for cell in cells):
            continue

        if "English" in cells:
            english_index = cells.index("English")
            if "Gốc (CN)" in cells:
                source_index = cells.index("Gốc (CN)")
            elif "Gốc (CSV)" in cells:
                source_index = cells.index("Gốc (CSV)")
            elif english_index >= 2:
                source_index = english_index - 1
            else:
                source_index = 0
            continue

        if source_index is None or english_index is None:
            continue
        if max(source_index, english_index) >= len(cells):
            continue

        source = cells[source_index]
        english = cells[english_index]
        if source and english and not source.startswith(":"):
            mapping.setdefault(source, english)

    return mapping


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


def translate_note(value: str, dictionary: dict[str, str]) -> tuple[str | None, str | None]:
    if value in NOTE_OVERRIDES:
        return NOTE_OVERRIDES[value], "override"
    translated = dictionary.get(value)
    if translated and not CJK_RE.search(translated):
        return translated, "dictionary"
    return None, None


def sync(args: argparse.Namespace) -> int:
    dictionary = load_dictionary(args.dictionary)
    rows, encoding = read_csv_rows(args.target)
    lineterminator = detect_lineterminator(args.target)

    if len(rows) < 3:
        raise SystemExit("target CSV must include metadata, default, and description rows")

    note_index = rows[0].index("_beizhu")

    stats = {
        "override_updates": 0,
        "dictionary_updates": 0,
        "unchanged": 0,
    }
    missing: list[tuple[int, str, str]] = []
    unresolved: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or len(row) <= note_index:
            continue

        current = row[note_index].strip()
        if not current:
            continue

        if not args.force and not CJK_RE.search(current):
            stats["unchanged"] += 1
            continue

        translated, origin = translate_note(current, dictionary)
        if translated:
            if row[note_index] != translated:
                row[note_index] = translated
                stats[f"{origin}_updates"] += 1
            else:
                stats["unchanged"] += 1
        else:
            missing.append((line_number, row[0] if row[0] else "", current))

        if CJK_RE.search(row[note_index]):
            unresolved.append((line_number, row[0] if row[0] else "", row[note_index]))

    print(f"encoding={encoding}")
    print(f"rows_with_notes={sum(1 for row in rows[3:] if row and len(row) > note_index and row[note_index].strip())}")
    for key in ("override_updates", "dictionary_updates", "unchanged"):
        print(f"{key}={stats[key]}")
    print(f"missing_notes={len(missing)}")
    print(f"remaining_cjk_notes={len(unresolved)}")
    for line_number, row_id, value in missing[:20]:
        print(f"missing line={line_number} id={row_id} note={value!r}")

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
        default=Path("game_config/fishing/shop.csv"),
    )
    parser.add_argument(
        "--dictionary",
        type=Path,
        default=Path("GAME_DICTIONARY.md"),
    )
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--force", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
