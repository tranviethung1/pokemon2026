#!/usr/bin/env python3
"""Translate aid_skill.csv display fields to English."""

from __future__ import annotations

import argparse
import csv
import re
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
    "1261": (
        "Additionally grants 【Aid: Wind Barrier】 to 1 ally for #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# rounds "
        "(prioritizes the ally with the highest ATK) (【Aid: Wind Barrier】: Lv.2 buff, non-stackable, increases Dodge by "
        "#C0x5c9970#$(10+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B#, reduces damage taken by "
        "#C0x5c9970#$(7+(skillLevel >= 3 and 8 or 0))$%#C0x5B545B#, and enemies attacking the barrier target take reflected damage equal to "
        "#C0x5c9970#$(40+(skillLevel >= 4 and 40 or 0))$%#C0x5B545B# of the caster's SP.ATK; splash, trap, and negative effects do not spread outside the barrier)"
    ),
    "1271": (
        "Additionally grants 【Aid: Nirvana】 to 1 ally (once per unit). After triggering, the target gains 20% damage reduction for 2 rounds "
        "(【Aid: Nirvana】: special effect; when taking lethal damage, consumes 【Aid: Nirvana】 and becomes a Phoenix Egg that can withstand "
        "#C0x5c9970#$(3+(skillLevel >= 2 and 1 or 0)+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# active attacks. When attacked, applies 1 stack of "
        "【Sacred Flame Burn】 to the enemy. If not broken, before acting next round, revives with "
        "#C0x5c9970#$(50+(skillLevel >= 3 and 10 or 0)+(skillLevel >= 5 and 20 or 0))$%#C0x5B545B# HP and "
        "#C0x5c9970#$(50+(skillLevel >= 3 and 20 or 0)+(skillLevel >= 5 and 30 or 0))$%#C0x5B545B# Rage)"
    ),
    "1281": (
        "Additionally grants 【Aid: Time Imprint】 to the #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# allied Psychic/Grass-type Pokemon with the highest ATK for "
        "#C0x5c9970#$(1+(skillLevel >= 1 and 1 or 0)+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# rounds. 【Aid: Time Imprint】: Lv.3 buff; when taking fatal damage, consumes this imprint and rewinds to "
        "#C0x5c9970#$(20+(skillLevel >= 3 and 20 or 0))$%#C0x5B545B# Rage and #C0x5c9970#$(20+(skillLevel >= 2 and 20 or 0))$%#C0x5B545B# HP (unaffected by healing effects and Rage recovery speed)"
    ),
    "1991": (
        "Additionally grants 【Wish】 to 1 Psychic/Steel-type ally with 【Aid: Heavenly Grace】 for #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# rounds. "
        "【Wish】: before each active action, gains 1 extra Wish Charm. Each time a Wish Charm is gained, strengthens the target based on the charm: 【Aid: Counter Wish】 grants the target a shield equal to "
        "#C0x5c9970#$(10+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B# of Jirachi's Max HP, 【Aid: Assist Wish】 heals "
        "#C0x5c9970#$(5+(skillLevel >= 3 and 5 or 0))$%#C0x5B545B# of the target's Max HP, and 【Aid: Pursuit Wish】 grants "
        "#C0x5c9970#$(7+(skillLevel >= 4 and 8 or 0))$%#C0x5B545B# Life Steal"
    ),
    "2351": (
        "Applies 【Time Echo】 to 1 allied unit with the highest dual ATK for #C0x5c9970#$(2+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# rounds "
        "(prioritizes the ally with the highest ATK) (【Time Echo】: Lv.2 buff; during the effect, damage bonus increases by "
        "#C0x5c9970#$(10+(skillLevel >= 3 and 10 or 0))$%#C0x5B545B#. After using an active skill, at the end of the major round there is a "
        "#C0x5c9970#$(30+(skillLevel >= 2 and 10 or 0)+(skillLevel >= 4 and 20 or 0))$%#C0x5B545B# chance to cast the corresponding skill again at no cost)"
    ),
    "2361": (
        "Additionally applies 【Spatial Warp】 to 1 enemy (prioritizes the enemy with the highest ATK) (【Spatial Warp】: Lv.2 debuff; during the effect, the target gains "
        "#C0x5c9970#$(5+(skillLevel >= 3 and 10 or 0))$%#C0x5B545B# Water-type vulnerability, and "
        "#C0x5c9970#$(30+(skillLevel >= 2 and 20 or 0)+(skillLevel >= 4 and 20 or 0))$%#C0x5B545B# of the damage dealt by Water Blade is transferred to this target. "
        "When an allied unit takes Ultimate damage, this unit warps to that ally's position to block the damage; removed after triggering "
        "#C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# times)"
    ),
    "2381": (
        "Before casting, triggers 【Aid: Tectonic Shift】 first (prioritizes swapping front and back rows). After triggering, swapped units take "
        "#C0x5c9970#$(20+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B# increased damage for 1 round and cannot gain Rage from HP loss during the effect "
        "(【Aid: Tectonic Shift】: Lv.3 control; randomly swaps the positions of #C0x5c9970#$(2+(skillLevel >= 5 and 2 or 0))$#C0x5B545B# enemy targets. Swapped units lose "
        "#C0x5c9970#$(5+(skillLevel >= 3 and 10 or 0))$%#C0x5B545B# dual ATK and #C0x5c9970#$(3+(skillLevel >= 3 and 6 or 0))$%#C0x5B545B# Speed for "
        "#C0x5c9970#$(1+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# rounds)"
    ),
    "2391": (
        "Additionally grants 【Aid: Ghost Shield】 to #C0x5c9970#$(2+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# random units (prioritizes Ghost-type units): special shield, does not decay, blocks damage equal to "
        "#C0x5c9970#$(8+(skillLevel >= 3 and 8 or 0))$%#C0x5B545B# of the target's Max HP (#C0x5c9970#$(12+(skillLevel >= 3 and 12 or 0))$%#C0x5B545B# for Ghost types). "
        "When broken, reduces the attacker's Rage by #C0x5c9970#$(20+(skillLevel >= 2 and 40 or 0)+(skillLevel >= 4 and 40 or 0))$#C0x5B545B#"
    ),
    "2421": (
        "Grants 【Aid: Water Bubble】 to #C0x5c9970#$(2+(skillLevel >= 3 and 2 or 0)+(skillLevel >= 5 and 2 or 0)+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# random Water-type Pokemon for 1 major round "
        "(【Aid: Water Bubble】: Lv.3 buff; immediately removes Burn effects, reduces ongoing and reflect-type damage taken by "
        "#C0x5c9970#$(20+(skillLevel >= 4 and 20 or 0))$%#C0x5B545B#, increases Crit Resistance by "
        "#C0x5c9970#$(5+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B#, and reduces Crit Damage taken by "
        "#C0x5c9970#$(5+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B#)"
    ),
    "2431": (
        "Puts 1 enemy (prioritizes the one with the highest dual ATK) into 【Aid: Deep Sleep】 for 1 round and additionally grants 1 stack of 【Nightmare Mark】 for "
        "#C0x5c9970#$(1+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# rounds (【Aid: Deep Sleep】: Lv.1 control; deep sleep prevents action and can be removed after being hit 2 times or by 2 cleanse/dispels. "
        "During the effect, the target loses #C0x5c9970#$(5+(skillLevel >= 4 and 10 or 0))$%#C0x5B545B# Speed and "
        "#C0x5c9970#$(5+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B# damage, and the chance for 【Nightmare Mark】 to convert into 【Aid: Deep Sleep】 increases by "
        "#C0x5c9970#$(10+(skillLevel >= 5 and 20 or 0))$%#C0x5B545B#)"
    ),
    "2461": (
        "Additionally releases 【Aid: Ember Seed】, fusing with the allied Fire-type Pokemon with the highest ATK for "
        "#C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# rounds. 【Aid: Ember Seed】: on fusion, immediately restores "
        "#C0x5c9970#$(8+(skillLevel >= 2 and 8 or 0))$%#C0x5B545B# HP to the target, grants "
        "#C0x5c9970#$(8+(skillLevel >= 3 and 8 or 0))$%#C0x5B545B# of Victini's base dual ATK, and increases Crit Rate and Crit Damage by "
        "#C0x5c9970#$(10+(skillLevel >= 4 and 10 or 0))$%#C0x5B545B#"
    ),
    "3261": (
        "Applies 【Aid: Magenta Melody Fruit】 to #C0x5c9970#$(1+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# random enemy Pokemon for 1 major round "
        "(【Aid: Magenta Melody Fruit】: special effect; has a #C0x5c9970#$(20+(skillLevel >= 3 and 20 or 0)+(skillLevel >= 5 and 20 or 0))$%#C0x5B545B# chance to Charm enemies for 1 round, reduces dual DEF by "
        "#C0x5c9970#$(10+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B#, and weakens damage reduction by "
        "#C0x5c9970#$(5+(skillLevel >= 2 and 5 or 0))$%#C0x5B545B#)"
    ),
    "3271": (
        "Grants 【Aid: Turret Mode】 to the #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# allied Bug/Steel-type Pokemon with the highest ATK for "
        "#C0x5c9970#$(1+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# major rounds (【Aid: Turret Mode】: special effect; damage increases by "
        "#C0x5c9970#$(10+(skillLevel >= 2 and 10 or 0))$%#C0x5B545B#. When a Bug/Steel-type ally uses an active attack, uses Flash Cannon to assist, dealing "
        "#C0x5c9970#$(160+(skillLevel >= 2 and 20 or 0))$%#C0x5B545B# P.ATK damage to a single target, up to "
        "#C0x5c9970#$(2+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# triggers per round)"
    ),
    "3601": (
        "Links the team's highest-ATK Fairy/Grass/Ground-type Pokemon with the #C0x5c9970#$(2+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# other Fairy/Grass/Ground-type Pokemon with the highest Max HP using 【Aid: Life Link】 for "
        "#C0x5c9970#$(1+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# major rounds (【Aid: Life Link】: Lv.4 buff; when a linked target takes damage, 50% of the damage is shared evenly with other linked allies, and the target's damage reduction increases by "
        "#C0x5c9970#$(5+(skillLevel >= 2 and 5 or 0)+(skillLevel >= 5 and 5 or 0))$%#C0x5B545B#)"
    ),
    "3611": (
        "Forms 【Aid: Death Link】 on #C0x5c9970#$(2+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# random enemies for "
        "#C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# rounds. 【Aid: Death Link】: Lv.3 debuff, non-stackable; links several enemy units. Active attack damage taken by one linked unit conducts "
        "#C0x5c9970#$(10+(skillLevel >= 3 and 15 or 0))$%#C0x5B545B# to the other targets (Dark-type conducted damage is doubled), and linked targets' healing rate is reduced by "
        "#C0x5c9970#$(15+(skillLevel >= 2 and 15 or 0))$%#C0x5B545B#"
    ),
    "3651": (
        "Additionally applies 【Aid: Steam】 to #C0x5c9970#$(1+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# random enemies for 2 rounds and makes all 【Aid: Steam】 carry the 【Steam Eruption】 trait "
        "(【Steam Eruption】: after all enemy targets with 【Aid: Steam】 are attacked 6 times by Water/Fire Pokemon, immediately triggers Steam Eruption once, dealing Fire elemental damage equal to 20% of Volcanion's SP.ATK to all enemies. "
        "For each stack of 【Aid: Steam】 on the target, this damage multiplier increases by 10%; cooldown "
        "#C0x5c9970#$(3+(skillLevel >= 5 and -1 or 0))$#C0x5B545B# rounds, limited to "
        "#C0x5c9970#$(1+(skillLevel >= 2 and 1 or 0)+(skillLevel >= 4 and 1 or 0))$#C0x5B545B# times per battle)"
    ),
    "4121": (
        "Grants 【Aid: All-Out Mode】 to the allied Fighting/Ghost-type Pokemon with the highest ATK for "
        "#C0x5c9970#$(1+(skillLevel >= 3 and 1 or 0))$#C0x5B545B# major rounds (【Aid: All-Out Mode】: special effect; Break Block Rate and Basic Attack damage increase by "
        "#C0x5c9970#$(10+(skillLevel >= 2 and 10 or 0)+(skillLevel >= 4 and 10 or 0)+(skillLevel >= 5 and 10 or 0))$%#C0x5B545B#. Each active attack deals additional Ghost-type damage equal to "
        "#C0x5c9970#$(40+(skillLevel >= 2 and 20 or 0)+(skillLevel >= 4 and 20 or 0)+(skillLevel >= 5 and 20 or 0))$%#C0x5B545B# P.ATK, up to 2 triggers per round. Attacks ignore shields and damage sharing)"
    ),
    "4161": (
        "Creates 1 【Aid: Thunder Phantom】 for 1 Electric-type ally for #C0x5c9970#$(1+(skillLevel >= 5 and 1 or 0))$#C0x5B545B# rounds (prioritizes the one with the highest ATK). "
        "【Aid: Thunder Phantom】: following summon; inherits #C0x5c9970#$(50+(skillLevel >= 2 and 20 or 0)+(skillLevel >= 3 and 10 or 0)+(skillLevel >= 4 and 20 or 0))$%#C0x5B545B# of the caster's stats, follows the main body to deal phantom Electric elemental damage equal to "
        "#C0x5c9970#$(50+(skillLevel >= 3 and 25 or 0)+(skillLevel >= 4 and 25 or 0))$%#C0x5B545B# P.ATK to the main target, and has a "
        "#C0x5c9970#$(30+(skillLevel >= 3 and 20 or 0)+(skillLevel >= 4 and 20 or 0))$%#C0x5B545B# chance to block active attacks and effects for the main body (does not block Ground-type attacks)"
    ),
}


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def sync(args: argparse.Namespace) -> int:
    lineterminator = detect_lineterminator(args.target)
    with args.target.open(newline="", encoding="utf-8") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    name_index = header.index("name")
    awake_index = header.index("awakeDescribes")
    updates = {"name": 0, "awakeDescribes": 0}
    unresolved: list[tuple[int, str, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue
        row_id = row[0]
        if row_id in NAME_BY_ID and (args.force or has_cjk(row[name_index])):
            row[name_index] = NAME_BY_ID[row_id]
            updates["name"] += 1
        if row_id in AWAKE_BY_ID and (args.force or has_cjk(row[awake_index])):
            row[awake_index] = AWAKE_BY_ID[row_id]
            updates["awakeDescribes"] += 1
        if has_cjk(row[name_index]) or has_cjk(row[awake_index]):
            unresolved.append((line_number, row_id, row[name_index], row[awake_index]))

    print(f"rows={sum(1 for row in rows[3:] if row)}")
    print(f"name_updates={updates['name']}")
    print(f"awakeDescribes_updates={updates['awakeDescribes']}")
    print(f"remaining_cjk_rows={len(unresolved)}")
    for line_number, row_id, name, awake in unresolved[:20]:
        print(f"unresolved line={line_number} id={row_id} name={name!r} awakeDescribes={awake[:80]!r}")

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", type=Path, default=Path("game_config/aid/aid_skill.csv"))
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--force", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
