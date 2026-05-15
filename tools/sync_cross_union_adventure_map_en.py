#!/usr/bin/env python3
"""Translate name and desc in cross/union_adventure/map.csv to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_MAP = {
    "左基地": "Left Base",
    "右基地": "Right Base",
    "左上据点": "Upper Left Outpost",
    "左中据点": "Middle Left Outpost",
    "左下据点": "Lower Left Outpost",
    "右上据点": "Upper Right Outpost",
    "右中据点": "Middle Right Outpost",
    "右下据点": "Lower Right Outpost",
    "小匙镇": "Spoonlet Town",
    "渍沁镇": "Dewwell Town",
    "结晶祠": "Crystal Shrine",
    "小匙小径": "Spoonlet Path",
    "霜抹山": "Frostbrush Mountain",
    "锅巴林道": "Scorchcrust Trail",
    "锦穴山道": "Brocade Hollow Pass",
    "焙固空洞": "Bakehold Hollow",
    "印记森林园": "Sigil Forest Garden",
    "海湾洞穴": "Bay Cavern",
    "橄榄大农园": "Grand Olive Farm",
    "列柱洞": "Pillar Cave",
    "名福其石": "Blessing Stone",
    "朽木之祠": "Rottenwood Shrine",
    "冻裂之祠": "Frostcrack Shrine",
    "桌台市": "Tableland City",
    "酿光市": "Brewlight City",
    "淅洒斜塔": "Slanted Rain Tower",
    "零区匣口": "Zero Area Gate",
    "尘土之祠": "Dust Shrine",
    "火难之祠": "Firebane Shrine",
    "观望塔": "Watchtower",
    "灯塔": "Lighthouse",
    "帕底亚巨屋": "Paldean Great House",
    "灯塔研究所": "Lighthouse Research Institute",
    "烘烘屋": "Hearth House",
    "雨痕剧院": "Rainmark Theater",
    "灰鸽教堂": "Gray Dove Cathedral",
    "雾隐巷": "Mistveil Alley",
    "灰烬十字街": "Ashcross Street",
    "泰晤士暗闸": "Thames Darkgate",
    "煤灯胡同": "Gaslamp Alley",
    "旧钟楼雾径": "Old Belfry Mist Path",
    "鸦栖码头": "Crow's Roost Pier",
    "铸铁街": "Cast Iron Street",
    "黯影堤岸": "Gloomshore Embankment",
    "蒸汽修道院": "Steam Abbey",
    "雾中公馆": "Mist Manor",
    "锈链桥区": "Rustchain Bridge District",
    "午夜书局": "Midnight Bookshop",
    "郁金香暗巷": "Tulip Shadow Alley",
    "旧港雾墙": "Old Port Mistwall",
    "瓦斯灯广场": "Gaslight Square",
    "黑砖工厂": "Blackbrick Factory",
}

DESC_MAP = {
    "在两队精灵全部力竭时，营地可提供复活，但复活需要时间": "When all Pokemon on both teams have fainted, the camp can revive them, but revival takes time.",
    "特殊据点：该据点被占领后，将为占领方产出高额的资源量": "Special outpost: Once this outpost is occupied, it grants the occupying side a high amount of resources.",
    "在据点内的驻守玩家，精灵的双攻将获得提升": "Pokemon of players stationed at this outpost gain increased physical and special attack.",
    "在据点内的驻守玩家，精灵的双防将获得提升": "Pokemon of players stationed at this outpost gain increased physical and special defense.",
    "在据点内驻守的玩家，当前使用队伍中未力竭的精灵将获得生命恢复": "Players stationed at this outpost restore HP to non-fainted Pokemon in their current team.",
    "在对方抢夺该据点过程中，抢夺消耗的自然时间将提升": "During the opposing side's attempt to capture this outpost, the natural time required for capture is increased.",
    "在据点内驻守的玩家，当前队伍精灵生命值上限提升": "Players stationed at this outpost gain increased max HP for the Pokemon in their current team.",
    "在据点内的驻守玩家，精灵的双防和生命将获得提升": "Pokemon of players stationed at this outpost gain increased physical and special defense, and increased HP.",
    "特殊据点：该据点被占领后，将为占领方全员提供属性加成": "Special outpost: Once this outpost is occupied, it grants attribute bonuses to all members of the occupying side.",
    "在据点内的驻守玩家，精灵的生命将获得提升": "Pokemon of players stationed at this outpost gain increased HP.",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    idx_name = header.index("name")
    idx_desc = header.index("desc")

    name_updates = 0
    desc_updates = 0
    missing_name: list[tuple[int, str, str]] = []
    missing_desc: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue

        if len(row) > idx_name:
            name = row[idx_name].strip()
            if name:
                translated = NAME_MAP.get(name)
                if translated:
                    if row[idx_name] != translated:
                        row[idx_name] = translated
                        name_updates += 1
                elif CJK_RE.search(name):
                    missing_name.append((line_number, row[0], name))

        if len(row) > idx_desc:
            desc = row[idx_desc].strip()
            if desc:
                translated = DESC_MAP.get(desc)
                if translated:
                    if row[idx_desc] != translated:
                        row[idx_desc] = translated
                        desc_updates += 1
                elif CJK_RE.search(desc):
                    missing_desc.append((line_number, row[0], desc))

    remaining_name = [
        (line_number, row[0], row[idx_name])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and len(row) > idx_name and CJK_RE.search(row[idx_name])
    ]
    remaining_desc = [
        (line_number, row[0], row[idx_desc])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and len(row) > idx_desc and CJK_RE.search(row[idx_desc])
    ]

    print(f"rows={sum(1 for row in rows[3:] if row)}")
    print(f"name_updates={name_updates}")
    print(f"desc_updates={desc_updates}")
    print(f"missing_names={len(missing_name)}")
    print(f"missing_desc={len(missing_desc)}")
    print(f"remaining_cjk_names={len(remaining_name)}")
    print(f"remaining_cjk_desc={len(remaining_desc)}")
    for line_number, row_id, value in missing_name[:20]:
        print(f"missing name line={line_number} id={row_id} value={value!r}")
    for line_number, row_id, value in missing_desc[:20]:
        print(f"missing desc line={line_number} id={row_id} value={value!r}")

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
        default=Path("game_config/cross/union_adventure/map.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
