#!/usr/bin/env python3
"""Fill English name/desc in game_config/auto_chess/trainer_skills.csv.

Bracket tokens 【CN】 are resolved from game_config/auto_chess/key_words.csv (key -> name)
with a small fallback map (e.g. GAME_DICTIONARY / manual). Output keeps 【English】 form.
"""

from __future__ import annotations

import argparse
import csv
import json
import re
from pathlib import Path

CJK_RE = re.compile(r"[\u3400-\u9fff]")


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def load_bracket_map(key_words: Path) -> dict[str, str]:
    """Map Chinese bracket token (【…】) -> English bracket token from key_words.csv."""
    out: dict[str, str] = {}
    with key_words.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))
    # Row 0: variable row with English column ids (name, key, ...); data starts row 3.
    header = rows[0]
    try:
        name_i = header.index("name")
        key_i = header.index("key")
    except ValueError as exc:
        raise SystemExit(f"key_words.csv missing name/key column: {exc}") from exc
    for row in rows[3:]:
        if len(row) <= max(name_i, key_i):
            continue
        cn = (row[key_i] or "").strip()
        en = (row[name_i] or "").strip()
        if cn.startswith("【") and cn.endswith("】") and en.startswith("【") and en.endswith("】"):
            out[cn] = en
    return out


def apply_bracket_map(text: str, bracket_map: dict[str, str]) -> str:
    for cn, en in sorted(bracket_map.items(), key=lambda kv: -len(kv[0])):
        text = text.replace(cn, en)
    return text


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--target",
        type=Path,
        default=repo_root() / "game_config" / "auto_chess" / "trainer_skills.csv",
    )
    parser.add_argument(
        "--key-words",
        type=Path,
        default=repo_root() / "game_config" / "auto_chess" / "key_words.csv",
    )
    parser.add_argument(
        "--translations",
        type=Path,
        default=Path(__file__).with_name("data") / "auto_chess_trainer_skills_en.json",
    )
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    bracket_map = load_bracket_map(args.key_words)
    # Tokens used in trainer text but missing from key_words.csv (see GAME_DICTIONARY.md, tools).
    bracket_map.setdefault("【怪蛋】", "【Odd Egg】")

    raw = json.loads(args.translations.read_text(encoding="utf-8"))
    translations: dict[str, tuple[str, str]] = {
        str(e["id"]): (e["name"], e["desc"]) for e in raw["rows"]
    }

    lt = detect_lineterminator(args.target)
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    name_i = header.index("name")
    desc_i = header.index("desc")

    updates = 0
    missing_ids: list[str] = []

    for row in rows[3:]:
        if not row or not row[0].strip().isdigit():
            continue
        rid = row[0].strip()
        if rid not in translations:
            missing_ids.append(rid)
            continue
        name_en, desc_en = translations[rid]
        name_en = apply_bracket_map(name_en, bracket_map)
        desc_en = apply_bracket_map(desc_en, bracket_map)
        if row[name_i] != name_en or row[desc_i] != desc_en:
            row[name_i] = name_en
            row[desc_i] = desc_en
            updates += 1

    remaining: list[tuple[str, str, str]] = []
    for row in rows[3:]:
        if not row:
            continue
        rid = row[0].strip()
        if not rid.isdigit():
            continue
        for col, label in ((name_i, "name"), (desc_i, "desc")):
            v = row[col] if col < len(row) else ""
            if CJK_RE.search(v or ""):
                remaining.append((rid, label, v))

    print(f"translation_rows={len(translations)}")
    print(f"cell_updates={updates}")
    print(f"missing_translation_ids={len(missing_ids)}")
    if missing_ids:
        print("missing:", ", ".join(missing_ids[:30]))
    print(f"remaining_cjk_cells={len(remaining)}")
    for rid, label, v in remaining[:25]:
        print(f"  id={rid} {label}={v!r}")

    if args.dry_run:
        return 0

    if missing_ids:
        return 1

    args.target.write_text("", encoding="utf-8")
    with args.target.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle, lineterminator=lt)
        writer.writerows(rows)

    return 0 if not remaining else 2


if __name__ == "__main__":
    raise SystemExit(main())
