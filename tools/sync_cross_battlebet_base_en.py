#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
import re
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/cross/battlebet/base.csv"
CJK_RE = re.compile(r"[\u3400-\u9fff]")

PHRASE_MAP = {
    "下一场激动人心的比赛即将开始了，让我们看看最后的胜利将会花落谁家呢？": (
        "The next thrilling match is about to begin. Let's see who will claim the final victory!"
    ),
    "二周年的陪伴，感谢有你~": (
        "Thank you for being with us through our second anniversary~"
    ),
    "本届赛事特邀了一群神秘嘉宾，他们会是谁呢？让我们拭目以待！": (
        "This tournament has invited a group of mysterious special guests. Who could they be? Let's wait and see!"
    ),
    "一场战斗的输赢并不重要，只要你能从中获得快乐，有所收获，那它就是一场精彩的战斗！": (
        "Winning or losing isn't what matters. As long as you find joy in it and gain something from it, it's a wonderful battle!"
    ),
    "只有内心火热，方可战胜天气之炎热": (
        "Only a burning spirit can overcome the scorching weather."
    ),
    "本届赛事没有天气影响，全凭精灵的实力定胜负！": (
        "There are no weather effects in this tournament. Victory will be decided solely by the strength of the Pokemon!"
    ),
}


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def load_rows(path: Path) -> list[list[str]]:
    return list(csv.reader(path.read_text(encoding="utf-8-sig").splitlines()))


def dump_rows(rows: list[list[str]], lineterminator: str) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator=lineterminator)
    writer.writerows(rows)
    return output.getvalue()


def translate_words(value: str) -> tuple[str, int, list[str]]:
    if not value or value == "<>":
        return value, 0, []

    if value.startswith("<") and value.endswith(">"):
        prefix = "<"
        suffix = ">"
        inner = value[1:-1]
    else:
        prefix = ""
        suffix = ""
        inner = value

    if not inner:
        return value, 0, []

    updated = 0
    missing: list[str] = []
    translated_parts: list[str] = []

    for part in inner.split(";"):
        mapped = PHRASE_MAP.get(part)
        if mapped is not None:
            translated_parts.append(mapped)
            if mapped != part:
                updated += 1
            continue
        translated_parts.append(part)
        if has_cjk(part):
            missing.append(part)

    return f"{prefix}{';'.join(translated_parts)}{suffix}", updated, missing


def sync_file(target: Path, dry_run: bool) -> int:
    lineterminator = detect_lineterminator(target)
    rows = load_rows(target)
    header = rows[0]
    words_index = header.index("words")
    id_index = header.index("变量名")

    updated_rows = 0
    updated_phrases = 0
    missing_rows: list[tuple[str, list[str]]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        translated, phrase_updates, missing = translate_words(row[words_index])
        if translated != row[words_index]:
            row[words_index] = translated
            updated_rows += 1
            updated_phrases += phrase_updates
        if missing:
            missing_rows.append((row[id_index], missing))

    remaining_cjk_rows: list[tuple[str, str]] = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        value = row[words_index]
        if has_cjk(value):
            remaining_cjk_rows.append((row[id_index], value))

    print(f"updated rows: {updated_rows}")
    print(f"updated phrases: {updated_phrases}")
    print(f"rows with missing mappings: {len(missing_rows)}")
    for row_id, phrases in missing_rows[:20]:
        print(f"  - row {row_id}: {' | '.join(phrases)}")
    print(f"remaining CJK rows: {len(remaining_cjk_rows)}")
    for row_id, value in remaining_cjk_rows[:20]:
        print(f"  - row {row_id}: {value}")

    if dry_run:
        return 0

    target.write_text(
        dump_rows(rows, lineterminator=lineterminator),
        encoding="utf-8-sig",
    )
    return 0


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Sync cross battlebet/contestbet base.csv words field to English"
    )
    parser.add_argument(
        "--target",
        type=Path,
        default=DEFAULT_TARGET,
        help="Target CSV path",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Report changes without writing",
    )
    args = parser.parse_args()
    raise SystemExit(sync_file(args.target, args.dry_run))


if __name__ == "__main__":
    main()
