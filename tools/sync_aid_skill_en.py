#!/usr/bin/env python3
"""Translate aid_skill.csv name and awakeDescribes columns to English."""

from __future__ import annotations

import argparse
import csv
import re
import sys
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_BY_ID = {
    "161": "Toxic Bomb",
    "241": "Flare Blitz",
    "261": "Psycho Cut",
    "264": "Super Psycho Cut",
    "381": "Frostwave Crash",
    "391": "Fear",
    "394": "Dream Eater",
    "401": "Rock Strike",
    "403": "Explosive Rock Impact",
    "571": "Sky Hunt",
    "574": "Super Sky Hunt",
    "601": "Magma Blaze",
    "611": "Vice Grip",
    "721": "Iceberg",
    "731": "Thunderous Force",
    "741": "Cinder Blaze",
    "861": "Blessing",
    "881": "Electro Surge",
    "884": "Super Electro Surge",
    "1031": "Poison Sting",
    "1081": "Super Ice Trap",
    "1171": "Encirclement Hunt",
    "1173": "Super Encirclement Hunt",
    "1221": "Thunder Claw",
    "1231": "Doomsday Flame Burst",
    "1241": "Tidal Whirlpool",
    "1261": "Whirlpool Storm",
    "1271": "Phoenix Ascension",
    "1281": "Space-Time Turbulence",
    "1311": "Mud Tide",
    "1314": "Super Mud Tide",
    "1391": "Psychic Impulse",
    "1396": "Super Psychic Impulse",
    "1421": "Frenzy",
    "1891": "Explosive Dragon Breath",
    "1911": "Rock Impact",
    "1921": "Frozen Earth",
    "1931": "Flash Cannon",
    "1991": "Super Serene Grace",
    "2241": "Focus Blast",
    "2243": "Super Focus Blast",
    "2351": "Roar of Time",
    "2361": "Spacial Rend",
    "2381": "Crush",
    "2391": "Nether Ghostfire",
    "2421": "Lord of the Sea",
    "2431": "Nightmare Dreamscape",
    "2461": "V-create",
    "2471": "Thorn Dance",
    "2721": "Hidden Hunt",
    "3151": "Bugfire",
    "3261": "Twin Phantoms",
    "3271": "Focused Flash Cannon",
    "3351": "Floral Surge",
    "3601": "Life Link",
    "3611": "Death Curse",
    "3651": "Steam Eruption",
    "3661": "Mighty Bow and Crossbow",
    "4121": "Defense into Offense",
    "4161": "Plasma Fists",
}

AWAKE_BY_ID = {
    "1261": "Additionally grants 1 ally 【Aid: Wind Barrier】#C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# turns (prioritizes the highest ATK ally). (【Aid: Wind Barrier】: Level 2 buff, non-stackable. Evasion is increased by #C0x5c9970#$(10+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B#, damage taken is reduced by #C0x5c9970#$(7+(skillLevel >= 3 and 8 or 0))$%#C0x5B545B#, and attacking the shielded target causes the attacker to take Special ATK reflect damage equal to #C0x5c9970#$(40+(skillLevel >= 4 and 40 or 0))$%#C0x5B545B# of the caster's Special ATK. Splash damage, traps, and negative effects do not spread outside the barrier.)",
    "1271": "Additionally grants 1 ally 【Aid: Nirvana】 (once per unit). After it triggers, the target gains 20% damage reduction for 2 turns. (【Aid: Nirvana】: Special effect. When the target takes fatal damage, 【Aid: Nirvana】 is consumed and the target turns into a phoenix egg. The egg can endure #C0x5c9970#$(3+(skillLevel >= 2 and 1 or 0)+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# active attacks. Whenever it is attacked, it inflicts 1 stack of 【Sacred Flame Burn】 on the attacker. If the egg is not destroyed, then before acting on the next turn it revives with #C0x5c9970#$(50+(skillLevel >= 3 and 10 or 0)+(skillLevel >= 5 and 20 or 0))$%#C0x5B545B# HP and #C0x5c9970#$(50+(skillLevel >= 3 and 20 or 0)+(skillLevel >= 5 and 30 or 0))$%#C0x5B545B# Rage.)",
    "1281": "Additionally grants the #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# Psychic/Grass allies with the highest ATK 【Aid: Time Imprint】 for #C0x5c9970#$(1+(skillLevel >= 1 and 1 or 0)+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# turns. 【Aid: Time Imprint】: Level 3 buff. When the target takes fatal damage, the imprint is consumed and the target rewinds to #C0x5c9970#$(20+(skillLevel >= 3 and 20 or 0))$%#C0x5B545B# Rage and #C0x5c9970#$(20+(skillLevel >= 2 and 20 or 0))$%#C0x5B545B# HP (unaffected by healing effects or Rage recovery speed).",
    "1991": "Additionally grants 1 Psychic/Steel ally that already has 【Aid: Heavenly Grace】 【Wish】 for #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# turns. 【Wish】: Before each active action, the target gains 1 extra wish token. Each time a wish token is gained, it strengthens the target based on the type of token received. 【Aid: Counter Wish】 grants a shield equal to #C0x5c9970#$(10+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B# of Jirachi's max HP. 【Aid: Assist Wish】 heals the target for #C0x5c9970#$(5+(skillLevel >= 3 and 5 or 0))$%#C0x5B545B# max HP. 【Aid: Pursuit Wish】 grants the target #C0x5c9970#$(7+(skillLevel >= 4 and 8 or 0))$%#C0x5B545B# life steal.",
    "2351": "Grants 1 ally with the highest combined ATK 【Time Echo】 for #C0x5c9970#$(2+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# turns (prioritizes the highest ATK ally). (【Time Echo】: Level 2 buff. During the effect, damage bonus is increased by #C0x5c9970#$(10+(skillLevel >= 3 and 10 or 0))$%#C0x5B545B#. After the target uses an active skill, there is a #C0x5c9970#$(30+(skillLevel >= 2 and 10 or 0)+(skillLevel >= 4 and 20 or 0))$%#C0x5B545B# chance to cast the corresponding skill again for free at the end of the major turn.)",
    "2361": "Additionally inflicts 1 enemy with 【Spatial Warp】 (prioritizes the highest ATK enemy). (【Spatial Warp】: Level 2 debuff. During the effect, the target takes #C0x5c9970#$(5+(skillLevel >= 3 and 10 or 0))$%#C0x5B545B# extra Water damage. #C0x5c9970#$(30+(skillLevel >= 2 and 20 or 0)+(skillLevel >= 4 and 20 or 0))$%#C0x5B545B# of the damage dealt by Water Blade is transferred to this target. When an ally takes ultimate damage, the target is warped to that ally's position to block the damage. The effect ends after triggering #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# times.)",
    "2381": "Before casting, first triggers 【Aid: Tectonic Shift】 (prioritizes swapping between front-row and back-row positions). After it triggers, swapped targets take #C0x5c9970#$(20+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B# extra damage for 1 turn, and they cannot gain Rage from HP loss during the effect. (【Aid: Tectonic Shift】: Level 3 control. Randomly swaps the positions of #C0x5c9970#$(2+(skillLevel >= 5 and 2 or 0))$#C0x5B545B# enemy targets. Swapped targets lose #C0x5c9970#$(5+(skillLevel >= 3 and 10 or 0))$%#C0x5B545B# to both ATK stats and #C0x5c9970#$(3+(skillLevel >= 3 and 6 or 0))$%#C0x5B545B# Speed for #C0x5c9970#$(1+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# turns.)",
    "2391": "Additionally grants #C0x5c9970#$(2+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# random allied units 【Aid: Ghost Shield】 (prioritizes Ghost type). 【Aid: Ghost Shield】: Special shield that does not decay. It blocks damage equal to #C0x5c9970#$(8+(skillLevel >= 3 and 8 or 0))$%#C0x5B545B# of the target's max HP (or #C0x5c9970#$(12+(skillLevel >= 3 and 12 or 0))$%#C0x5B545B# for Ghost-type units). When the shield breaks, the attacker loses #C0x5c9970#$(20+(skillLevel >= 2 and 40 or 0)+(skillLevel >= 4 and 40 or 0))$#C0x5B545B# Rage.",
    "2421": "Grants #C0x5c9970#$(2+(skillLevel >= 3 and 2 or 0)+(skillLevel >= 5 and 2 or 0)+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# random Water-type Pokemon 【Aid: Water Bubble】 for 1 major turn. (【Aid: Water Bubble】: Level 3 buff. Immediately removes burn-type effects, reduces ongoing damage and reflect-type damage taken by #C0x5c9970#$(20+(skillLevel >= 4 and 20 or 0))$%#C0x5B545B#, increases crit resistance by #C0x5c9970#$(5+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B#, and reduces crit damage taken by #C0x5c9970#$(5+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B#.)",
    "2431": "Causes 1 enemy (prioritizes the highest combined ATK) to enter 【Aid: Deep Sleep】 for 1 turn and additionally gain 1 stack of 【Nightmare Mark】 for #C0x5c9970#$(1+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# turns. (【Aid: Deep Sleep】: Level 1 control. The target falls into deep sleep and cannot act. The effect can be removed after the target is hit twice or purified/dispelled twice. During the effect, the target loses #C0x5c9970#$(5+(skillLevel >= 4 and 10 or 0))$%#C0x5B545B# Speed and #C0x5c9970#$(5+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B# damage, and the chance for 【Nightmare Mark】 to turn into 【Aid: Deep Sleep】 is increased by #C0x5c9970#$(10+(skillLevel >= 5 and 20 or 0))$%#C0x5B545B#.)",
    "2461": "Additionally casts 【Aid: Ember Seed】 and fuses it with the Fire-type ally with the highest ATK for #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# turns. 【Aid: Ember Seed】: On fusion, the target immediately recovers #C0x5c9970#$(8+(skillLevel >= 2 and 8 or 0))$%#C0x5B545B# HP, gains base ATK and Special ATK equal to #C0x5c9970#$(8+(skillLevel >= 3 and 8 or 0))$%#C0x5B545B# of Victini's stats, and gains #C0x5c9970#$(10+(skillLevel >= 4 and 10 or 0))$%#C0x5B545B# Crit Rate and Crit Damage.",
    "3261": "Grants #C0x5c9970#$(1+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# random enemy Pokemon 【Aid: Magenta Melody Fruit】 for 1 major turn. (【Aid: Magenta Melody Fruit】: Special effect. There is a #C0x5c9970#$(20+(skillLevel >= 3 and 20 or 0)+(skillLevel >= 5 and 20 or 0))$%#C0x5B545B# chance to Charm the enemy for 1 turn, both DEF stats are reduced by #C0x5c9970#$(10+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B#, and damage reduction is weakened by #C0x5c9970#$(5+(skillLevel >= 2 and 5 or 0))$%#C0x5B545B#.)",
    "3271": "Grants the #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# Bug/Steel allies with the highest ATK 【Aid: Turret Mode】 for #C0x5c9970#$(1+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# major turns. (【Aid: Turret Mode】: Special effect. Damage is increased by #C0x5c9970#$(10+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B#. When Bug/Steel allies use active attacks, they follow up with Flash Cannon, dealing Physical damage equal to #C0x5c9970#$(160+(skillLevel >= 2 and 20 or 0))$%#C0x5B545B# ATK to a single target. This can trigger up to #C0x5c9970#$(2+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# times per turn.)",
    "3601": "Links the Fairy/Grass/Ground ally with the highest ATK to the #C0x5c9970#$(2+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# Fairy/Grass/Ground allies with the highest max HP using 【Aid: Life Link】 for #C0x5c9970#$(1+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# major turns. (【Aid: Life Link】: Level 4 buff. When a linked target takes damage, 50% of that damage is split among the other linked allies, and the target gains #C0x5c9970#$(5+(skillLevel >= 2 and 5 or 0)+(skillLevel >= 5 and 5 or 0))$%#C0x5B545B# damage reduction.)",
    "3611": "Causes #C0x5c9970#$(2+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# random enemies to form 【Aid: Death Link】 for #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# turns. 【Aid: Death Link】: Level 3 debuff, non-stackable. Several enemy units are linked together; active attack damage taken by one linked unit is transferred to the others by #C0x5c9970#$(10+(skillLevel >= 3 and 15 or 0))$%#C0x5B545B# (Dark-type transfer damage is doubled), and healing received by linked targets is reduced by #C0x5c9970#$(15+(skillLevel >= 2 and 15 or 0))$%#C0x5B545B#.",
    "3651": "Additionally inflicts #C0x5c9970#$(1+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# random enemies with 【Aid: Steam】 for 2 turns and gives all 【Aid: Steam】 effects the 【Steam Eruption】 trait. (【Steam Eruption】: After enemy targets with 【Aid: Steam】 have been hit a total of 6 times by Water/Fire Pokemon, a Steam Eruption is triggered immediately, dealing Fire-element damage to all enemies equal to 20% of Volcanion's Special ATK. For each stack of 【Aid: Steam】 on the target, this damage multiplier increases by 10%. Cooldown: #C0x5c9970#$(3+(skillLevel >= 5 and -1 or 0))$#C0x5B545B# turns. Maximum triggers per battle: #C0x5c9970#$(1+(skillLevel >= 2 and 1 or 0)+(skillLevel >= 4 and 1 or 0))$#C0x5B545B#.)",
    "4121": "Grants 1 Fighting/Ghost ally with the highest ATK 【Aid: All-Out Mode】 for #C0x5c9970#$(1+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# major turns. (【Aid: All-Out Mode】: Special effect. Break Block Rate and basic attack damage are increased by #C0x5c9970#$(10+(skillLevel >= 2 and 10 or 0)+(skillLevel >= 4 and 10 or 0)+(skillLevel >= 5 and 10 or 0))$%#C0x5B545B#. Each active attack also deals additional Ghost-type damage equal to #C0x5c9970#$(40+(skillLevel >= 2 and 20 or 0)+(skillLevel >= 4 and 20 or 0)+(skillLevel >= 5 and 20 or 0))$%#C0x5B545B# ATK (up to 2 times per turn). Attacks ignore shields and damage sharing.)",
    "4161": "Additionally creates 1 【Aid: Thunder Phantom】 for an Electric-type ally for #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# turns (prioritizes the highest ATK ally). 【Aid: Thunder Phantom】: Follower summon. It inherits #C0x5c9970#$(50+(skillLevel >= 2 and 20 or 0)+(skillLevel >= 3 and 10 or 0)+(skillLevel >= 4 and 20 or 0))$%#C0x5B545B# of the caster's stats, follows the main body to deal Electric-element damage to the primary target equal to #C0x5c9970#$(50+(skillLevel >= 3 and 25 or 0)+(skillLevel >= 4 and 25 or 0))$%#C0x5B545B# ATK, and has a #C0x5c9970#$(30+(skillLevel >= 3 and 20 or 0)+(skillLevel >= 4 and 20 or 0))$%#C0x5B545B# chance to block incoming active attacks and effects for the main body (it will not block Ground-type attacks).",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Translate aid_skill.csv to English")
    parser.add_argument("--csv-target", required=True, type=Path, help="Path to aid_skill.csv")
    parser.add_argument("--dry-run", action="store_true", help="Show changes without writing")
    return parser.parse_args()


def translate_csv(csv_path: Path, dry_run: bool) -> int:
    with csv_path.open("r", encoding="utf-8-sig", newline="") as handle:
        rows = list(csv.reader(handle))

    if len(rows) < 4:
        print(f"CSV file looks too short: {csv_path}", file=sys.stderr)
        return 1

    headers = rows[0]
    required = {"name", "awakeDescribes"}
    missing = required.difference(headers)
    if missing:
        print(f"Missing columns: {', '.join(sorted(missing))}", file=sys.stderr)
        return 1

    id_idx = 0
    name_idx = headers.index("name")
    awake_idx = headers.index("awakeDescribes")

    name_updates = 0
    awake_updates = 0
    missing_name_ids: list[str] = []
    missing_awake_ids: list[str] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[id_idx].strip()
        current_name = row[name_idx].strip()
        current_awake = row[awake_idx].strip()

        target_name = NAME_BY_ID.get(row_id)
        target_awake = AWAKE_BY_ID.get(row_id)

        if target_name:
            if row[name_idx] != target_name:
                row[name_idx] = target_name
                name_updates += 1
        elif current_name and CJK_RE.search(current_name):
            missing_name_ids.append(row_id)

        if target_awake:
            if row[awake_idx] != target_awake:
                row[awake_idx] = target_awake
                awake_updates += 1
        elif current_awake and CJK_RE.search(current_awake):
            missing_awake_ids.append(row_id)

    remaining_cjk_rows = 0
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        if CJK_RE.search(row[name_idx]) or CJK_RE.search(row[awake_idx]):
            remaining_cjk_rows += 1

    if not dry_run:
        with csv_path.open("w", encoding="utf-8-sig", newline="") as handle:
            writer = csv.writer(handle, lineterminator="\n")
            writer.writerows(rows)

    mode = "Dry run" if dry_run else "Updated"
    print(f"{mode}: {csv_path}")
    print(f"Name updates: {name_updates}")
    print(f"Awake description updates: {awake_updates}")
    print(f"Remaining CJK rows: {remaining_cjk_rows}")
    print(f"Missing name mappings: {len(missing_name_ids)}")
    print(f"Missing awake mappings: {len(missing_awake_ids)}")

    if missing_name_ids:
        print("Missing name id preview: " + ", ".join(missing_name_ids[:20]))
    if missing_awake_ids:
        print("Missing awake id preview: " + ", ".join(missing_awake_ids[:20]))

    return 0


def main() -> int:
    args = parse_args()
    return translate_csv(args.csv_target, args.dry_run)


if __name__ == "__main__":
    raise SystemExit(main())
