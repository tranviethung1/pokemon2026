#!/usr/bin/env python3
"""Translate talk in cross/supremacy/event_lib.csv to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

TALK_MAP = {
    "<我是小智;目标是成为宝可梦大师;去吧，就决定是你了！>": "<I'm Ash;My goal is to become a Pokemon Master;Go, I choose you!>",
    "<不要气馁;再接再厉>": "<Don't be discouraged;Keep trying>",
    "<失败乃成功之母>": "<Failure is the mother of success>",
    "<表现不错;继续保持>": "<Nice performance;Keep it up>",
    "<加油;加油>": "<Let's go;Let's go>",
    "<打得不错;期待你总决赛的表现>": "<Well played;Looking forward to your performance in the grand final>",
    "<加油;冠军就是你了>": "<Keep it up;The championship is yours>",
    "<恭喜大获全胜,继续加油>": "<Congratulations on the big win,keep it up>",
    "<你的水平绝对不止白金;加油吧少年>": "<Your level is definitely beyond Platinum;Keep pushing, young trainer>",
    "<恭喜达到钻石段位;一点心意>": "<Congratulations on reaching Diamond rank;A little token of appreciation>",
    "<可喜可贺;最强王者在向你招手>": "<Congratulations;The strongest king is calling out to you>",
    "<你已经超越了全世界99.999%的训练师;太强了>": "<You've already surpassed 99.999% of trainers in the world;You're too strong>",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    talk_index = header.index("talk")
    updates = 0
    missing: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or len(row) <= talk_index:
            continue

        value = row[talk_index].strip()
        if not value:
            continue

        translated = TALK_MAP.get(value)
        if translated:
            if row[talk_index] != translated:
                row[talk_index] = translated
                updates += 1
        elif CJK_RE.search(value):
            missing.append((line_number, row[0], value))

    remaining = [
        (line_number, row[0], row[talk_index])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and len(row) > talk_index and CJK_RE.search(row[talk_index])
    ]

    print(f"rows={sum(1 for row in rows[3:] if row and row[0])}")
    print(f"talk_updates={updates}")
    print(f"missing_talk={len(missing)}")
    print(f"remaining_cjk_talk={len(remaining)}")
    for line_number, row_id, value in missing[:20]:
        print(f"missing line={line_number} id={row_id} talk={value!r}")

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
        default=Path("game_config/cross/supremacy/event_lib.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
