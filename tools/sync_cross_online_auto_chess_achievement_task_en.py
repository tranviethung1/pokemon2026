#!/usr/bin/env python3
"""Translate desc in cross/online_auto_chess/achievement_task.csv to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

TYPE_NAME_MAP = {
    "普": "Normal-type",
    "火": "Fire-type",
    "水": "Water-type",
    "草": "Grass-type",
}

EXACT_DESC_MAP = {
    "单次对敌方训练家造成至少25点伤害": "Deal at least 25 damage to an opposing Trainer in a single hit.",
    "在不使用主动技能的情况下获得1次第1名": "Take 1st place once without using any active skills.",
    "单局游戏内，在回合中战胜对手至少4次": "In a single match, defeat opponents at least 4 times during rounds.",
    "在每个回合都获胜的情况下获得第1名": "Take 1st place while winning every round.",
    "在回合中失败5次以上但是获得对局胜利": "Win a match after losing at least 5 rounds.",
    "单局游戏内，精灵任一属性超过1000": "In a single match, have any Pokemon stat exceed 1000.",
    "准备阶段，单个精灵攻击和生命均在1000及以上": "During the preparation phase, have a single Pokemon with both Attack and HP at 1000 or higher.",
    "单局游戏内，精灵单次造成1000点及以上伤害": "In a single match, have a Pokemon deal 1000 or more damage in one hit.",
    "单局游戏内，将精灵升至4星6次及以上": "In a single match, raise Pokemon to 4★ at least 6 times.",
    "在剩余至少20个金币的情况下失败1次": "Lose once while still having at least 20 Coins remaining.",
    "单局游戏内，累计花费100金币": "Spend 100 Coins in a single match.",
    "获得1次第1名": "Take 1st place once.",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def count_phrase(value: str, singular: str, plural: str) -> str:
    count = int(value)
    return f"{count} {singular if count == 1 else plural}"


def time_phrase(value: str) -> str:
    count = int(value)
    if count == 1:
        return "once"
    if count == 2:
        return "twice"
    return f"{count} times"


def translate_desc(text: str) -> str:
    text = text.strip()
    if not text:
        return ""

    if text in EXACT_DESC_MAP:
        return EXACT_DESC_MAP[text]

    if match := re.fullmatch(r"累计胜利(\d+)次（前3名）", text):
        wins = count_phrase(match.group(1), "win", "wins")
        return f"Earn {wins} in total (top 3)."

    if match := re.fullmatch(r"使用(\d+)种不同训练家各获得1场胜利（前3名）", text):
        trainer_count = match.group(1)
        return f"Win once with each of {trainer_count} different Trainers (top 3)."

    if match := re.fullmatch(r"使用(\d+)种不同训练家各获得1次第1名", text):
        trainer_count = match.group(1)
        return f"Take 1st place once with each of {trainer_count} different Trainers."

    if match := re.fullmatch(r"使用任一训练家累计获得(\d+)场胜利（前3名）", text):
        wins = count_phrase(match.group(1), "win", "wins")
        return f"Earn {wins} in total (top 3) with any one Trainer."

    if match := re.fullmatch(r"使用(\d+)只([普火水草])系精灵的阵容赢得(\d+)场胜利", text):
        lineup_size, nature, wins = match.groups()
        type_name = TYPE_NAME_MAP[nature]
        return f"Win {count_phrase(wins, 'match', 'matches')} with a lineup of {lineup_size} {type_name} Pokemon."

    if match := re.fullmatch(r"使用(\d+)只(\d+)星及以上精灵的阵容赢得(\d+)场胜利", text):
        lineup_size, star, wins = match.groups()
        return f"Win {count_phrase(wins, 'match', 'matches')} with a lineup of {lineup_size} Pokemon at {star}★ or above."

    if match := re.fullmatch(r"使用(\d+)只(\d+)星精灵的阵容赢得(\d+)场胜利", text):
        lineup_size, star, wins = match.groups()
        return f"Win {count_phrase(wins, 'match', 'matches')} with a lineup of {lineup_size} {star}★ Pokemon."

    if match := re.fullmatch(r"使用带有(\d+)只及以上(\d+)星精灵的阵容赢得(\d+)场胜利", text):
        min_count, star, wins = match.groups()
        return f"Win {count_phrase(wins, 'match', 'matches')} with a lineup containing at least {min_count} {star}★ Pokemon."

    if match := re.fullmatch(r"在训练家至少有(\d+)血的情况下赢得(\d+)场胜利", text):
        hp, wins = match.groups()
        return f"Win {count_phrase(wins, 'match', 'matches')} while your Trainer has at least {hp} HP."

    if match := re.fullmatch(r"在训练家仅剩(\d+)血的情况下赢得(\d+)场胜利", text):
        hp, wins = match.groups()
        return f"Win {count_phrase(wins, 'match', 'matches')} while your Trainer has only {hp} HP left."

    if match := re.fullmatch(r"在训练家至少有(\d+)血的情况下获得第1名", text):
        hp = match.group(1)
        return f"Take 1st place while your Trainer has at least {hp} HP."

    if match := re.fullmatch(r"在训练家仅剩(\d+)血的情况下获得第1名", text):
        hp = match.group(1)
        return f"Take 1st place while your Trainer has only {hp} HP left."

    if match := re.fullmatch(r"赛季结算时，达到排行榜前(\d+)名", text):
        limit = match.group(1)
        return f"At the end of the season, place in the top {limit} on the leaderboard."

    if match := re.fullmatch(r"累计(\d+)次在赛季结算时达到排行榜前(\d+)名", text):
        times, limit = match.groups()
        return f"At the end of the season, place in the top {limit} on the leaderboard {times} times in total."

    if match := re.fullmatch(r"连续(\d+)次在赛季结算时达到排行榜前(\d+)名", text):
        times, limit = match.groups()
        return f"At the end of the season, place in the top {limit} on the leaderboard {time_phrase(times)} in a row."

    if match := re.fullmatch(r"累计打出(\d+)张([普火水草])系精灵卡", text):
        count, nature = match.groups()
        type_name = TYPE_NAME_MAP[nature]
        return f"Play {count_phrase(count, f'{type_name} Pokemon card', f'{type_name} Pokemon cards')} in total."

    if match := re.fullmatch(r"累计打出(\d+)张装备卡", text):
        count = match.group(1)
        return f"Play {count_phrase(count, 'equipment card', 'equipment cards')} in total."

    if match := re.fullmatch(r"累计打出(\d+)张事件卡", text):
        count = match.group(1)
        return f"Play {count_phrase(count, 'event card', 'event cards')} in total."

    if match := re.fullmatch(r"累计进行(\d+)场游戏", text):
        count = match.group(1)
        return f"Play {count_phrase(count, 'match', 'matches')} in total."

    if match := re.fullmatch(r"连续获得(\d+)次胜利（前3名）", text):
        count = match.group(1)
        return f"Earn {count_phrase(count, 'win', 'wins')} in a row (top 3)."

    if match := re.fullmatch(r"主动使用(\d+)次训练家技能", text):
        count = match.group(1)
        return f"Actively use Trainer skills {count_phrase(count, 'time', 'times')}."

    if match := re.fullmatch(r"从商店购买(\d+)张牌", text):
        count = match.group(1)
        return f"Buy {count_phrase(count, 'card', 'cards')} from the shop."

    if match := re.fullmatch(r"累计花费(\d+)金币", text):
        count = match.group(1)
        return f"Spend {count} Coins in total."

    if match := re.fullmatch(r"累计对敌方训练家造成(\d+)点伤害", text):
        count = match.group(1)
        return f"Deal {count} damage to opposing Trainers in total."

    if match := re.fullmatch(r"累计在回合中战胜对手(\d+)次", text):
        count = match.group(1)
        return f"Defeat opponents {count_phrase(count, 'time', 'times')} during rounds in total."

    if match := re.fullmatch(r"累计将精灵升星(\d+)次", text):
        count = match.group(1)
        return f"Promote Pokemon {count_phrase(count, 'time', 'times')} in total."

    if match := re.fullmatch(r"累计消灭(\d+)个敌方精灵", text):
        count = match.group(1)
        return f"Defeat {count} opposing Pokemon in total."

    return ""


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    desc_index = header.index("desc")

    updates = 0
    missing: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or len(row) <= desc_index:
            continue

        value = row[desc_index]
        translated = translate_desc(value)
        if translated:
            if translated != value:
                row[desc_index] = translated
                updates += 1
        elif CJK_RE.search(value):
            missing.append((line_number, row[0], value))

    remaining = [
        (line_number, row[0], row[desc_index])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and len(row) > desc_index and CJK_RE.search(row[desc_index])
    ]

    print(f"rows={sum(1 for row in rows[3:] if row and row[0])}")
    print(f"desc_updates={updates}")
    print(f"missing_desc={len(missing)}")
    print(f"remaining_cjk_desc={len(remaining)}")
    for line_number, row_id, value in missing[:20]:
        print(f"missing line={line_number} id={row_id} desc={value!r}")
    for line_number, row_id, value in remaining[:20]:
        print(f"remaining line={line_number} id={row_id} desc={value!r}")

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
        default=Path("game_config/cross/online_auto_chess/achievement_task.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
