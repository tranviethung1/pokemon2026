#!/usr/bin/env python3
"""Fill horse_race_card.csv translated name columns from GAME_DICTIONARY.md."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_TARGET = ROOT / "game_config" / "cross" / "horse_race" / "horse_race_card.csv"
DEFAULT_DICTIONARY = ROOT / "GAME_DICTIONARY.md"
CJK_RE = re.compile(r"[\u3400-\u9fff]")
QUESTION_RE = re.compile(r"^\?+(?::\s*\?+)?$")

# Keep these overrides local even if the shared dictionary regresses later.
OVERRIDE_BY_UNIT_ID: dict[str, tuple[str, str]] = {
    "151": ("Igglybuff", "Igglybuff"),
    "3431": ("Swirlix", "Swirlix"),
}


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value or ""))


def is_placeholder(value: str) -> bool:
    value = (value or "").strip()
    if not value:
        return True
    return value in {"404404", "404"} or bool(QUESTION_RE.fullmatch(value))


def detect_encoding(path: Path) -> str:
    data = path.read_bytes()
    for encoding in ("utf-8-sig", "utf-8", "gb18030"):
        try:
            data.decode(encoding)
            return encoding
        except UnicodeDecodeError:
            continue
    raise SystemExit(f"unable to decode {path}")


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def load_dictionary(path: Path) -> tuple[dict[str, str], dict[str, str], dict[str, str], dict[str, str]]:
    id_to_en: dict[str, str] = {}
    id_to_vi: dict[str, str] = {}
    cn_to_en: dict[str, str] = {}
    cn_to_vi: dict[str, str] = {}

    for raw_line in path.read_text(encoding="utf-8", errors="ignore").splitlines():
        if not raw_line.startswith("|"):
            continue
        parts = [part.strip() for part in raw_line.strip().strip("|").split("|")]
        if len(parts) < 4:
            continue

        row_id, cn_name, en_name, vi_name = parts[:4]
        if not row_id.isdigit():
            continue
        if not has_cjk(cn_name):
            continue
        if has_cjk(en_name) or not en_name:
            continue

        id_to_en[row_id] = en_name
        id_to_vi[row_id] = vi_name
        cn_to_en.setdefault(cn_name, en_name)
        cn_to_vi.setdefault(cn_name, vi_name)

    return id_to_en, id_to_vi, cn_to_en, cn_to_vi


def pick_names(
    unit_id: str,
    cn_name: str,
    current_en: str,
    current_vi: str,
    id_to_en: dict[str, str],
    id_to_vi: dict[str, str],
    cn_to_en: dict[str, str],
    cn_to_vi: dict[str, str],
) -> tuple[str, str]:
    override = OVERRIDE_BY_UNIT_ID.get(unit_id)
    if override:
        return override

    english = id_to_en.get(unit_id) or cn_to_en.get(cn_name) or current_en.strip()
    vietnamese = id_to_vi.get(unit_id) or cn_to_vi.get(cn_name) or current_vi.strip()

    if is_placeholder(english) or has_cjk(english):
        english = cn_to_en.get(cn_name) or english

    if is_placeholder(vietnamese) or has_cjk(vietnamese):
        vietnamese = english

    return english.strip(), vietnamese.strip()


def sync_file(
    target: Path,
    dictionary: Path,
    dry_run: bool,
    copy_name_en_to_name_cols: bool,
) -> int:
    encoding = detect_encoding(target)
    lineterminator = detect_lineterminator(target)
    id_to_en, id_to_vi, cn_to_en, cn_to_vi = load_dictionary(dictionary)

    with target.open(newline="", encoding=encoding) as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    unit_id_index = header.index("unitID")
    name_index = header.index("name")
    name_tw_index = header.index("name_tw")
    name_en_index = header.index("name_en")
    name_vn_index = header.index("name_vn")
    name_kr_index = header.index("name_kr")

    en_updates = 0
    vn_updates = 0
    name_updates = 0
    name_tw_updates = 0
    name_kr_updates = 0
    missing: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or len(row) <= name_vn_index:
            continue
        row_id = row[0].strip()
        if not row_id.isdigit():
            continue

        unit_id = row[unit_id_index].strip()
        cn_name = row[name_index].strip()
        current_en = row[name_en_index].strip()
        current_vi = row[name_vn_index].strip()

        english, vietnamese = pick_names(
            unit_id,
            cn_name,
            current_en,
            current_vi,
            id_to_en,
            id_to_vi,
            cn_to_en,
            cn_to_vi,
        )

        if not english:
            missing.append((line_number, unit_id, cn_name))
            continue

        if is_placeholder(current_en) or has_cjk(current_en):
            if row[name_en_index] != english:
                row[name_en_index] = english
                en_updates += 1

        if is_placeholder(current_vi) or has_cjk(current_vi):
            if row[name_vn_index] != vietnamese:
                row[name_vn_index] = vietnamese
                vn_updates += 1

        if copy_name_en_to_name_cols:
            english_for_copy = row[name_en_index].strip()
            if row[name_index] != english_for_copy:
                row[name_index] = english_for_copy
                name_updates += 1
            if row[name_tw_index] != english_for_copy:
                row[name_tw_index] = english_for_copy
                name_tw_updates += 1
            if row[name_kr_index] != english_for_copy:
                row[name_kr_index] = english_for_copy
                name_kr_updates += 1

    remaining_cjk: list[tuple[int, str, str, str, str]] = []
    remaining_placeholder: list[tuple[int, str, str, str, str]] = []
    for line_number, row in enumerate(rows[3:], start=4):
        if not row or len(row) <= name_vn_index:
            continue
        row_id = row[0].strip()
        if not row_id.isdigit():
            continue
        unit_id = row[unit_id_index].strip()
        en_value = row[name_en_index].strip()
        vi_value = row[name_vn_index].strip()
        cn_name = row[name_index].strip()
        if has_cjk(en_value) or has_cjk(vi_value):
            remaining_cjk.append((line_number, row_id, unit_id, en_value, vi_value))
        if is_placeholder(en_value) or is_placeholder(vi_value):
            remaining_placeholder.append((line_number, row_id, unit_id, en_value, vi_value))
        if not en_value:
            missing.append((line_number, unit_id, cn_name))

    print(f"encoding={encoding}")
    print(f"rows={sum(1 for row in rows[3:] if row and row[0].strip().isdigit())}")
    print(f"name_en_updates={en_updates}")
    print(f"name_vn_updates={vn_updates}")
    print(f"name_updates={name_updates}")
    print(f"name_tw_updates={name_tw_updates}")
    print(f"name_kr_updates={name_kr_updates}")
    print(f"missing_rows={len(missing)}")
    for line_number, unit_id, cn_name in missing[:20]:
        print(f"missing line={line_number} unitID={unit_id} name={cn_name!r}")
    print(f"remaining_cjk_rows={len(remaining_cjk)}")
    for line_number, row_id, unit_id, en_value, vi_value in remaining_cjk[:20]:
        print(
            f"remaining_cjk line={line_number} row={row_id} unitID={unit_id} "
            f"name_en={en_value!r} name_vn={vi_value!r}"
        )
    print(f"remaining_placeholder_rows={len(remaining_placeholder)}")
    for line_number, row_id, unit_id, en_value, vi_value in remaining_placeholder[:20]:
        print(
            f"remaining_placeholder line={line_number} row={row_id} unitID={unit_id} "
            f"name_en={en_value!r} name_vn={vi_value!r}"
        )

    if dry_run:
        return 0

    with target.open("w", newline="", encoding=encoding) as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET)
    parser.add_argument("--dictionary", type=Path, default=DEFAULT_DICTIONARY)
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument(
        "--copy-name-en-to-name-cols",
        action="store_true",
        help="Copy name_en into name, name_tw, and name_kr.",
    )
    args = parser.parse_args()
    return sync_file(
        args.target,
        args.dictionary,
        args.dry_run,
        args.copy_name_en_to_name_cols,
    )


if __name__ == "__main__":
    raise SystemExit(main())
