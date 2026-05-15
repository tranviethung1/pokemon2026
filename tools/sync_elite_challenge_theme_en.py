#!/usr/bin/env python3
"""Translate elite_challenge/theme.csv name and desc fields to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_MAP = {
    "甘霖济世": "Life-Giving Rain",
    "锐不可当": "Unstoppable Edge",
    "驭势凌敌": "Seize the Momentum",
    "雷霆之怒": "Thunder's Wrath",
}

DESC_MAP = {
    (
        "上阵的%s系精灵治疗率和生命上限提升30%%\\n"
        "本期关卡内怪物的特性（随关卡提升）：\\n"
        "#L00000010#强击#L00000000#：最终伤害提升\\n"
        "#L00000010#毒素#L00000000#：每个大回合末对敌方全体造成1次毒元素伤害\\n"
        "#L00000010#激怒#L00000000#：受到伤害时提升双攻和暴击2回合\\n"
        "#L00000010#停滞#L00000000#：降低敌方所有单位速度和怒气回复速度"
    ): (
        "Fielding %s-type Pokemon increases Healing Rate and Max HP by 30%%\\n"
        "Monster traits in this season's stages (scale up with stage progression):\\n"
        "#L00000010#Heavy Strike#L00000000#: Final Damage increases\\n"
        "#L00000010#Toxin#L00000000#: At the end of each major round, deal 1 instance of Poison elemental damage to all enemies\\n"
        "#L00000010#Enrage#L00000000#: When taking damage, increase dual ATK and Crit Rate for 2 rounds\\n"
        "#L00000010#Stagnation#L00000000#: Reduces the Speed and Rage Recovery Speed of all enemy units"
    ),
    (
        "上阵的%s系精灵暴击率、暴击伤害和伤害加成提升30%%\\n"
        "本期关卡内怪物的特性（随关卡提升）：\\n"
        "#L00000010#硬甲#L00000000#：伤害减免提升\\n"
        "#L00000010#复苏#L00000000#：每个大回合回复生命上限比例的血量（生命值较低时触发）\\n"
        "#L00000010#坚固#L00000000#：伤害不可超过一定比例，受到的伤害超过该比例时，在接下来的2回合内造成伤害降低（冷却3回合）\\n"
        "#L00000010#枯萎#L00000000#：降低所有单位速度和双攻"
    ): (
        "Fielding %s-type Pokemon increases Crit Rate, Crit Damage, and Damage Bonus by 30%%\\n"
        "Monster traits in this season's stages (scale up with stage progression):\\n"
        "#L00000010#Hard Armor#L00000000#: Damage Reduction increases\\n"
        "#L00000010#Recovery#L00000000#: At the end of each major round, restores HP based on a percentage of Max HP (triggers when HP is low)\\n"
        "#L00000010#Fortified#L00000000#: Damage taken cannot exceed a certain percentage; if it does, damage dealt is reduced for the next 2 rounds (cooldown: 3 rounds)\\n"
        "#L00000010#Wither#L00000000#: Reduces the Speed and dual ATK of all units"
    ),
    (
        "上阵的%s系初始总数量不低于3人控制率提升25%%，对异常效果的单位伤害提升25%%；满足5人时每个大回合开始前有30%%概率对随机一个目标添加眩晕、睡眠、冰冻、沉默、混乱其中一种1回合\\n"
        "本期关卡内怪物的特性（随关卡提升）：\\n"
        "#L00000010#免控#L00000000#：免控率提升\\n"
        "#L00000010#异变#L00000000#：自身未处于控制状态下时伤害减免提升，且行动对主目标造成双攻加成的真实伤害\\n"
        "#L00000010#奋战#L00000000#：每次主动攻击后自身伤害提升2回合（可叠加，被控制时清除）\\n"
        "#L00000010#死战#L00000000#：暴击率和暴击伤害提高，受到控制期间内2回合内该效果失效"
    ): (
        "If at least 3 %s-type Pokemon are initially deployed, Control Rate increases by 25%% and damage dealt to targets affected by abnormal effects increases by 25%%; with 5 such Pokemon, before each major round starts there is a 30%% chance to inflict 1 random target with one of Stun, Sleep, Freeze, Silence, or Confusion for 1 round\\n"
        "Monster traits in this season's stages (scale up with stage progression):\\n"
        "#L00000010#Control Immunity#L00000000#: Control Immunity increases\\n"
        "#L00000010#Mutation#L00000000#: When not under control effects, Damage Reduction increases, and actions deal true damage to the main target based on dual ATK\\n"
        "#L00000010#Fight On#L00000000#: After each active attack, damage dealt increases for 2 rounds (stackable, cleared when controlled)\\n"
        "#L00000010#Last Stand#L00000000#: Crit Rate and Crit Damage increase, but this effect is disabled for 2 rounds while under control effects"
    ),
    (
        "上阵的%s系精灵怒气恢复速度和必杀技伤害提升40%%\\n"
        "本期关卡内怪物的特性（随关卡提升）：\\n"
        "#L00000010#硬甲#L00000000#：伤害减免提升\\n"
        "#L00000010#复苏#L00000000#：每个大回合回复生命上限比例的血量（生命值较低时触发）\\n"
        "#L00000010#坚固#L00000000#：伤害不可超过一定比例，受到的伤害超过该比例时，在接下来的2回合内造成伤害降低（冷却3回合）\\n"
        "#L00000010#枯萎#L00000000#：降低所有单位速度和双攻"
    ): (
        "Fielding %s-type Pokemon increases Rage Recovery Speed and Ultimate damage by 40%%\\n"
        "Monster traits in this season's stages (scale up with stage progression):\\n"
        "#L00000010#Hard Armor#L00000000#: Damage Reduction increases\\n"
        "#L00000010#Recovery#L00000000#: At the end of each major round, restores HP based on a percentage of Max HP (triggers when HP is low)\\n"
        "#L00000010#Fortified#L00000000#: Damage taken cannot exceed a certain percentage; if it does, damage dealt is reduced for the next 2 rounds (cooldown: 3 rounds)\\n"
        "#L00000010#Wither#L00000000#: Reduces the Speed and dual ATK of all units"
    ),
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


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


def choose_value(
    current: str,
    direct_map: dict[str, str],
    dictionary: dict[str, str],
    *,
    force: bool,
) -> tuple[str, str | None]:
    if not force and current and not CJK_RE.search(current):
        return current, None

    for origin, candidate in (
        ("map", direct_map.get(current)),
        ("dictionary", dictionary.get(current)),
    ):
        if candidate and not CJK_RE.search(candidate):
            return candidate, origin

    return current, None


def sync(args: argparse.Namespace) -> int:
    dictionary = load_dictionary(args.dictionary)

    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    name_index = header.index("name")
    desc_index = header.index("desc")

    stats = {
        "name_map": 0,
        "name_dictionary": 0,
        "desc_map": 0,
        "desc_dictionary": 0,
        "unchanged": 0,
    }
    unresolved: list[tuple[int, str, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue

        changed = False

        new_name, name_origin = choose_value(
            row[name_index],
            NAME_MAP,
            dictionary,
            force=args.force,
        )
        new_desc, desc_origin = choose_value(
            row[desc_index],
            DESC_MAP,
            dictionary,
            force=args.force,
        )

        if name_origin:
            row[name_index] = new_name
            stats[f"name_{name_origin}"] += 1
            changed = True
        if desc_origin:
            row[desc_index] = new_desc
            stats[f"desc_{desc_origin}"] += 1
            changed = True
        if not changed:
            stats["unchanged"] += 1

        if CJK_RE.search(row[name_index]) or CJK_RE.search(row[desc_index]):
            unresolved.append((line_number, row[0], row[name_index], row[desc_index]))

    print(f"rows={sum(1 for row in rows[3:] if row)}")
    for key in ("name_map", "name_dictionary", "desc_map", "desc_dictionary", "unchanged"):
        print(f"{key}={stats[key]}")
    print(f"remaining_cjk_rows={len(unresolved)}")
    for line_number, row_id, name, desc in unresolved[:20]:
        print(f"unresolved line={line_number} id={row_id} name={name!r} desc={desc[:120]!r}")

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
        default=Path("game_config/elite_challenge/theme.csv"),
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
