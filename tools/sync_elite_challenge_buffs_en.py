#!/usr/bin/env python3
"""Translate elite_challenge/buffs.csv name and desc fields to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_OVERRIDES = {
    "武道熊师": "Urshifu",
}

DESC_BY_ID = {
    "111": "Basic Attack damage dealt by the Pokemon increases by 15%.",
    "112": "When the Pokemon uses a Basic Attack, Crit Rate increases by 10% for 2 rounds.",
    "113": "After the Pokemon uses a Basic Attack, Crit Damage increases by 15% for 2 rounds.",
    "114": "After the Pokemon uses a Basic Attack, dual ATK increases by 10% for 2 rounds.",
    "115": "After the Pokemon uses a Basic Attack, dual DEF increases by 20% for 2 rounds.",
    "116": "During a single major round, each Basic Attack increases damage by 10% (stacks up to 3 times).",
    "117": "If the Pokemon did not use an active Basic Attack skill this round, its next Basic Attack deals 16% more damage (stacks up to 2 times).",
    "118": "Basic Attack damage splashes to a random adjacent target for damage equal to 40% of the original damage.",
    "119": "Each Basic Attack grants a shield equal to 10% of Max HP (up to 3 triggers per Pokemon per major round).",
    "120": "When using a Basic Attack, there is a 50% chance to restore HP equal to 30% of the damage dealt by that Basic Attack.",
    "121": "After the Pokemon uses an Ultimate, it additionally triggers 【Pursuit I】.",
    "122": "After each active attack, the Pokemon can trigger 【Combo I】 once, with a 50% chance to additionally trigger 【Pursuit I】 1 extra time; if it defeats a unit, it can additionally trigger 【Pursuit I】 on a random target.",
    "211": "Ultimate damage increases by 20%.",
    "212": "Rage Recovery Speed increases by 40%.",
    "213": "When the Pokemon uses an Ultimate, Crit Rate increases by 25%.",
    "214": "After the Pokemon uses an Ultimate, its next attack deals 100% more damage.",
    "215": "After the Pokemon uses an Ultimate, restore HP equal to 10% of Max HP.",
    "216": "Each time the Pokemon uses an Ultimate, Ultimate Damage Bonus increases by 12% (stacks up to 3 times).",
    "217": "After using an Ultimate, Rage Recovery Speed increases by 50% for the next 2 rounds.",
    "218": "On defeating an enemy, gain 100 extra Rage and permanently gain 10% Ultimate Damage Bonus (stacks up to 3 times).",
    "219": "Each time the Pokemon uses a Basic Attack or Basic Skill, Ultimate damage increases by 20%, stacking up to 3 times and resetting after the Ultimate is cast.",
    "220": "In battle, the Rage cap is reduced by 200.",
    "221": "Before battle ends, restore HP equal to 5% of Max HP for each Ultimate the Pokemon has used (up to 20%).",
    "222": "Gain full Rage on entry. After every 2 active Ultimates, the Pokemon additionally casts 1 cost-free Ultimate; if that cost-free Ultimate defeats a unit, it gains 200 extra Rage.",
    "311": "dual ATK increases by 15%.",
    "312": "Max HP increases by 10%.",
    "313": "Whenever the Pokemon loses HP, dual ATK increases by 5% (stacks up to 4 times).",
    "314": "For every 1% Max HP the Pokemon loses, Damage Bonus increases by 3%.",
    "315": "For every 1% Max HP the Pokemon loses, dual ATK increases by 3%.",
    "316": "For every 1% Max HP the Pokemon loses, dual DEF increases by 6%.",
    "317": "The first time the Pokemon's current HP percentage falls below 50%, it gains a shield equal to 20% of Max HP for 2 rounds.",
    "318": "On entering battle, gain a shield equal to 36% of missing HP for 2 rounds.",
    "319": "After the Pokemon loses HP, restore 50 Rage (up to once per major round).",
    "320": "The first allied unit to take lethal damage survives with 1 HP.",
    "321": "For every cumulative 1% Max HP the Pokemon loses, dual ATK increases by 1% (up to 200%).",
    "322": "The first time the Pokemon's HP falls below 50% and again below 20%, it additionally casts 1 cost-free Ultimate and gains 25% Life Steal, then deals extra true damage equal to 50% of its lost HP.",
    "411": "Control Rate increases by 20%.",
    "412": "Enemy Control Immunity decreases by 20%.",
    "413": "Enemy targets under control effects take 10% more damage.",
    "414": "After an enemy target becomes controlled, the next attack it receives gains 100% Crit Rate.",
    "415": "When the Pokemon uses an Ultimate or Basic Skill on an enemy target under control effects, damage dealt increases by 30%.",
    "416": "When attacking, there is a 30% chance to permanently increase Control Rate by 5% (stacks up to 5 times).",
    "417": "When the Pokemon uses a finishing move, there is a 30% chance to Stun the target for 1 round.",
    "418": "When attacking, there is a 10% chance to inflict a random target with Stun, Sleep, Freeze, Silence, or Confusion for 1 round.",
    "419": "The first time an enemy target's current HP percentage falls below 70% or 30%, there is a 60% chance to inflict Freeze for 1 round.",
    "420": "Each time the Pokemon controls an enemy, it restores 3% HP, up to 12% restored per action round.",
    "421": "When a control effect is applied to an enemy, deal true damage equal to 10% of the target's current HP (up to once per major round).",
    "422": "At the start of each major round, there is a 30% chance to inflict the target with one of Stun, Sleep, Freeze, Silence, or Confusion (using the allied unit with the highest Control Rate for the calculation), and additionally deal true damage equal to 120% of the higher allied ATK value; damage increases by 10% for each control effect on the enemy, and on trigger the enemy's Control Immunity is reduced by 30%.",
    "511": "Pokemon with a shield gain 16% Crit Rate.",
    "512": "Pokemon with a shield gain 30% Crit Damage.",
    "513": "Pokemon with a shield gain 20% dual DEF.",
    "514": "Pokemon with a shield gain 15% Damage Reduction.",
    "515": "After the Pokemon is attacked, it gains a shield equal to 18% of the HP lost from that attack.",
    "516": "On entering battle, the Pokemon gains a shield equal to 15% of Max HP.",
    "517": "After self attacks, there is a 60% chance to gain a shield equal to 12% of Max HP.",
    "518": "When self takes an active attack, deal rebound damage to the attacker equal to 30% of self's shield value (can Crit).",
    "519": "Pokemon with a shield gain dual ATK equal to 40% of their shield value, capped at 120% of their initial dual ATK.",
    "520": "Before battle ends, 20% of self's shield value is converted into HP recovery.",
    "521": "Attacks deal additional true damage equal to 30% of shield value (capped at 200% of the higher of self's dual ATK, and this damage can Crit).",
    "522": "At the end of each major round, inflict 【Rebound】 on all enemy units. The damage is true damage equal to the total amount of allied shields; this Rebound damage can Crit and inherits the highest allied Crit Rate.",
    "611": "After receiving healing, dual DEF increases by 20% for 2 rounds.",
    "612": "After receiving healing, dual ATK increases by 20% for 2 rounds.",
    "613": "After the Pokemon provides healing, it restores HP equal to 10% of Max HP (triggers once per major round).",
    "614": "At the start of each major round, the Pokemon restores HP equal to 12% of Max HP.",
    "615": "Healing Received increases by 20%.",
    "616": "While at full HP, damage taken is reduced by 30%.",
    "617": "After the Pokemon attacks, it deals true damage to the main target equal to 20% of its current HP.",
    "618": "When the Pokemon's HP falls below 30%, Max HP increases by 50% for 2 rounds (cooldown: 3 rounds).",
    "619": "When the Pokemon uses a Basic Attack or Basic Skill, it restores HP equal to 20% of the damage dealt by that attack.",
    "620": "Each major round, whenever an allied unit heals an allied target, the healing amount is recorded. After any allied target attacks, deal bonus true damage to the main target equal to 30% of the recorded healing.",
    "621": "When casting an Ultimate, restore HP equal to 20% of Max HP and gain 50% Control Immunity for 1 round.",
    "622": "At the end of each major round, restore 20% HP to allies; the more HP they have lost, the greater the healing. Also deal true damage to all enemy units equal to 50% of total allied healing this round, restore 200 Rage to self, and trigger 【Dispel I】.",
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


def choose_name(
    current: str,
    dictionary: dict[str, str],
    *,
    force: bool,
) -> tuple[str, str | None]:
    if not force and current and not CJK_RE.search(current):
        return current, None

    if current in NAME_OVERRIDES:
        return NAME_OVERRIDES[current], "override"

    translated = dictionary.get(current)
    if translated and not CJK_RE.search(translated):
        return translated, "dictionary"

    return current, None


def choose_desc(
    row_id: str,
    current: str,
    *,
    force: bool,
) -> tuple[str, str | None]:
    if not force and current and not CJK_RE.search(current):
        return current, None

    translated = DESC_BY_ID.get(row_id)
    if translated:
        return translated, "map"

    return current, None


def sync(args: argparse.Namespace) -> int:
    dictionary = load_dictionary(args.dictionary)

    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    if len(rows) < 3:
        raise SystemExit("target CSV must include metadata, default, and description rows")

    header = rows[0]
    name_index = header.index("name")
    desc_index = header.index("desc")

    stats = {
        "name_override": 0,
        "name_dictionary": 0,
        "desc_map": 0,
        "unchanged": 0,
    }
    missing_names: list[tuple[int, str, str]] = []
    missing_descs: list[tuple[int, str, str]] = []
    unresolved: list[tuple[int, str, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue

        row_id = row[0]
        changed = False

        new_name, name_origin = choose_name(
            row[name_index],
            dictionary,
            force=args.force,
        )
        new_desc, desc_origin = choose_desc(
            row_id,
            row[desc_index],
            force=args.force,
        )

        if name_origin:
            row[name_index] = new_name
            stats[f"name_{name_origin}"] += 1
            changed = True
        elif CJK_RE.search(row[name_index]):
            missing_names.append((line_number, row_id, row[name_index]))

        if desc_origin:
            row[desc_index] = new_desc
            stats["desc_map"] += 1
            changed = True
        elif CJK_RE.search(row[desc_index]):
            missing_descs.append((line_number, row_id, row[desc_index]))

        if not changed:
            stats["unchanged"] += 1

        if CJK_RE.search(row[name_index]) or CJK_RE.search(row[desc_index]):
            unresolved.append((line_number, row_id, row[name_index], row[desc_index]))

    print(f"rows={sum(1 for row in rows[3:] if row)}")
    for key in ("name_override", "name_dictionary", "desc_map", "unchanged"):
        print(f"{key}={stats[key]}")
    print(f"missing_names={len(missing_names)}")
    print(f"missing_descs={len(missing_descs)}")
    print(f"remaining_cjk_rows={len(unresolved)}")
    for line_number, row_id, value in missing_names[:20]:
        print(f"missing_name line={line_number} id={row_id} value={value!r}")
    for line_number, row_id, value in missing_descs[:20]:
        print(f"missing_desc line={line_number} id={row_id} value={value!r}")

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
        default=Path("game_config/elite_challenge/buffs.csv"),
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
