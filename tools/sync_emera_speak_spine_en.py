#!/usr/bin/env python3
"""Translate emera/speak_spine.csv text column to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

TEXT_BY_ID = {
    "101": "Gold beneath the earth must be dug from the vein; a miser's gold must be unearthed from his soul.",
    "102": "Whoever wishes for help in times of misfortune should treat others with generosity in ordinary days.",
    "103": "If you love something too much, losing it will hurt all the more.",
    "104": "Greedy people always think their bowl is too small, so toss all your excess my way.",
    "105": "You've come again. The richer one gets, the more one feels money is never enough.",
    "106": "The abyss here reclaims souls along with everything else.",
    "201": "The rougher the seas, the pricier the fish.",
    "202": "If the sea held no risks, no treasure would be so plentiful. Trading three for one is no loss for you at all.",
    "203": "Never trust a Charizard that uses Water Gun.",
    "204": "A lie that keeps the peace beats a truth that stirs trouble, so this time I truly am taking a loss.",
    "205": "There is no deal under heaven more ruinous for me than this one, so what are you still hesitating for?",
    "206": "You ask why I still do business with you at a loss? Because I am kind.",
    "207": "At a glance, these three stones refuse to open. I am making quite the concession by agreeing to this trade with you.",
    "208": "Installment payments? Are you trying to bully an honest merchant?",
    "301": "A winter hearth is worth more than a red rose.",
    "302": "My home is already full of treasures. What business brings you to my humble shop?",
    "303": "Like you, the radiance of glazed gems cannot be hidden.",
    "304": "If you want roses, you must respect thorns. The proprietress talks business, not romance.",
    "305": "Lopunny's ears are not for sale. Do not touch them.",
    "306": "Your generous reputation has already spread across the city-states. I hope our relationship can rise to the next level.",
    "307": "With your strength, perhaps you could buy this shop along with its proprietress.",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    if len(rows) < 3:
        raise SystemExit("target CSV must include metadata, default, and description rows")

    header = rows[0]
    text_index = header.index("text")

    updates = 0
    unchanged = 0
    missing: list[tuple[int, str, str]] = []
    unresolved: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue

        row_id = row[0]
        current = row[text_index]

        if not args.force and current and not CJK_RE.search(current):
            unchanged += 1
            continue

        translated = TEXT_BY_ID.get(row_id)
        if translated:
            if row[text_index] != translated:
                row[text_index] = translated
                updates += 1
            else:
                unchanged += 1
        else:
            missing.append((line_number, row_id, current))

        if CJK_RE.search(row[text_index]):
            unresolved.append((line_number, row_id, row[text_index]))

    print(f"rows={sum(1 for row in rows[3:] if row)}")
    print(f"text_updates={updates}")
    print(f"unchanged={unchanged}")
    print(f"missing_texts={len(missing)}")
    print(f"remaining_cjk_texts={len(unresolved)}")
    for line_number, row_id, value in missing[:20]:
        print(f"missing line={line_number} id={row_id} text={value!r}")

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding="utf-8-sig") as handle:
        writer = csv.writer(handle, lineterminator=detect_lineterminator(args.target))
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/emera/speak_spine.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--force", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
