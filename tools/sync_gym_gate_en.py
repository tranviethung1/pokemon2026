#!/usr/bin/env python3
"""Sync gym/gate.csv English text columns and _beizhu labels."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

MANUAL_BY_ID_FIELD = {
    ("80533", "specialEffDesc"): (
        "\nIn warfare, avoid the strong and strike the weak\n"
        "#C0xFFDEAD#Meaning: attack the odd one out"
    ),
}

BEIZHU_TRANSLATIONS = {
    "5怪力": "5 Machamp",
    "6V6单挑 属性": "6v6 Duel: Type Advantage",
    "6V6单挑 斗": "6v6 Duel: Fighting",
    "6Y神": "6 Yveltal",
    "6一拳": "6 One-Punch Team",
    "6凤王": "6 Ho-Oh",
    "6大钢蛇": "6 Steelix",
    "6岩斗士": "6 Rock Brawlers",
    "6岩柱子": "6 Regirock",
    "6时拉比": "6 Celebi",
    "6暴鲤龙": "6 Gyarados",
    "6洛奇亚": "6 Lugia",
    "6爆音怪": "6 Exploud",
    "6瓦斯弹": "6 Koffing",
    "6索罗亚克": "6 Zoroark",
    "6自爆磁怪": "6 Magnezone",
    "6超坏星": "6 Toxapex",
    "6超梦": "6 Mewtwo",
    "一般系送分": "Normal Easy Win",
    "三圣鸟": "Three Legendary Birds",
    "三马桶": "Triple Toilet Squad",
    "乘龙+水龙": "Lapras + Kingdra",
    "全员肉搏": "All-Out Melee",
    "冰系主阵容": "Ice Core Team",
    "冰系送分": "Ice Easy Win",
    "剑队": "Blade Team",
    "卡比+树枭": "Snorlax + Rowlet",
    "反伤": "Reflect Damage",
    "可多拉+犀牛": "Lairon + Rhino",
    "可达鸭": "Psyduck",
    "哥斯拉大战金刚": "Godzilla vs. Kong",
    "喷火龙全家桶": "Full Charizard Lineup",
    "嘎啦嘎啦": "Marowak",
    "四龙": "Four Dragons",
    "固拉多": "Groudon",
    "地面系主阵容": "Ground Core Team",
    "地面送分": "Ground Easy Win",
    "大岩蛇小拳石": "Onix + Geodude",
    "妖精系主阵容": "Fairy Core Team",
    "妖系送分": "Fairy Easy Win",
    "妙蛙+月桂叶": "Bulbasaur + Bayleef",
    "尼多家族": "Nido Family",
    "岩地馆主": "Rock/Ground Gym Leader",
    "岩杂": "Mixed Rock Squad",
    "岩石送分": "Rock Easy Win",
    "巨金怪+美梦": "Metagross + Cresselia",
    "恶系主阵容": "Dark Core Team",
    "恶系送分": "Dark Easy Win",
    "恶鬼混合送分": "Dark/Ghost Mixed Easy Win",
    "恶鬼馆主": "Dark/Ghost Gym Leader",
    "打地鼠": "Diglett",
    "无限火力": "Ultra Rapid Fire",
    "日夜交替-免疫物攻": "Day-Night Cycle - Physical Damage Immunity",
    "日夜交替-免疫特攻": "Day-Night Cycle - Special Damage Immunity",
    "普草飞馆主": "Normal/Grass/Flying Gym Leader",
    "格斗三傻": "Fighting Trio",
    "格斗送分": "Fighting Easy Win",
    "梦幻超梦": "Mew + Mewtwo",
    "毒系送分": "Poison Easy Win",
    "毒队": "Poison Squad",
    "水冰送分": "Water/Ice Easy Win",
    "水冰馆主": "Water/Ice Gym Leader",
    "水晶大岩蛇": "Crystal Onix",
    "水系主阵容": "Water Core Team",
    "水系御三家": "Water Starter Trio",
    "水系送分": "Water Easy Win",
    "沙奈朵家族": "Gardevoir Family",
    "火斗馆主": "Fire/Fighting Gym Leader",
    "火炎狮残局王者": "Pyroar, Endgame King",
    "火系主阵容": "Fire Core Team",
    "火系御三家": "Fire Starter Trio",
    "火系送分": "Fire Easy Win",
    "班基拉+固拉多": "Tyranitar + Groudon",
    "电击魔+电龙": "Electivire + Ampharos",
    "电系主阵容": "Electric Core Team",
    "电系送分": "Electric Easy Win",
    "百变怪送分": "Ditto Easy Win",
    "百鸟朝凤": "All Birds Pay Homage to the Phoenix",
    "皮卡丘": "Pikachu",
    "皮卡丘电系阵容": "Pikachu Electric Team",
    "皮神": "Pika God",
    "真·噩梦副本": "True Nightmare Dungeon",
    "真·魔神本": "True Demon God Dungeon",
    "红色暴鲤龙": "Red Gyarados",
    "绿毛虫送分": "Caterpie Easy Win",
    "耿鬼家族": "Gengar Family",
    "胖丁": "Jigglypuff",
    "自爆螳螂": "Self-Destruct Scyther",
    "草系御三家": "Grass Starter Trio",
    "草系送分": "Grass Easy Win",
    "虫族场地": "Zerg Rush Terrain",
    "虫系协战": "Bug Support Battle",
    "虫系进化": "Bug Evolution",
    "螺帽基拉祈": "Cocooned Jirachi",
    "谢米": "Shaymin",
    "超、妖送分": "Psychic/Fairy Easy Win",
    "超级暴雪王": "Mega Abomasnow",
    "超级胡地": "Mega Alakazam",
    "超能控制队": "Psychic Control Team",
    "超能送分": "Psychic Easy Win",
    "迷你龙送分": "Dratini Easy Win",
    "酋雷姆": "Kyurem",
    "钢柱+3可可": "Registeel + 3 Aron",
    "钢系主阵容": "Steel Core Team",
    "钢系送分": "Steel Easy Win",
    "镜像": "Mirror Match",
    "雪妖女": "Froslass",
    "雪妖女美纳斯": "Froslass + Milotic",
    "雪花+玛狃拉": "Snowflake + Weavile",
    "露力丽": "Azurill",
    "音波龙+螳螂": "Noivern + Scyther",
    "飞行系送分": "Flying Easy Win",
    "鬼系主阵容": "Ghost Core Team",
    "鬼系送分": "Ghost Easy Win",
    "魔灵+娃娃": "Mismagius + Banette",
    "黏美龙+X喷": "Goodra + Mega Charizard X",
    "龙电送分": "Dragon/Electric Easy Win",
    "龙电馆主": "Dragon/Electric Gym Leader",
    "龙系主阵容": "Dragon Core Team",
    "龙系送分": "Dragon Easy Win",
}


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def unescape_lua_string(value: str) -> str:
    replacements = {
        r"\"": '"',
        r"\n": "\n",
        r"\r": "\r",
        r"\t": "\t",
        r"\\": "\\",
    }
    for old, new in replacements.items():
        value = value.replace(old, new)
    return value.replace("\u00a0", " ")


def normalize_for_csv(value: str) -> str:
    return value.replace("\r", r"\r").replace("\n", r"\n").replace("\t", r"\t")


def extract_string_field(block: str, field_name: str) -> str | None:
    match = re.search(
        rf"\n\s*{re.escape(field_name)}\s*=\s*\"((?:[^\"\\]|\\.)*)\"",
        block,
    )
    if not match:
        return None
    return unescape_lua_string(match.group(1))


def extract_int_field(block: str, field_name: str) -> str | None:
    match = re.search(rf"\n\s*{re.escape(field_name)}\s*=\s*(\d+)", block)
    if not match:
        return None
    return match.group(1)


def iter_top_level_blocks(text: str, marker: str):
    start = text.index(marker)
    index = text.index("{", start) + 1
    depth = 1
    in_string = False
    escaped = False
    block_start: int | None = None

    while index < len(text) and depth:
        char = text[index]
        if in_string:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = False
        else:
            if char == '"':
                in_string = True
            elif char == "{":
                if depth == 1:
                    block_start = index
                depth += 1
            elif char == "}":
                depth -= 1
                if depth == 1 and block_start is not None:
                    yield text[block_start : index + 1]
                    block_start = None
        index += 1


def load_source_entries(path: Path) -> dict[str, dict[str, str]]:
    entries: dict[str, dict[str, str]] = {}
    text = path.read_text(encoding="utf-8")

    for block in iter_top_level_blocks(text, "csv.gym.gate = {"):
        row_id = extract_int_field(block, "id")
        if not row_id:
            continue
        values: dict[str, str] = {}
        for field in ("weatherDesc", "palce", "placeDesc", "specialEffDesc"):
            value = extract_string_field(block, field)
            if value is not None:
                values[field] = normalize_for_csv(value)
        entries[row_id] = values

    return entries


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def detect_encoding(path: Path) -> str:
    data = path.read_bytes()
    if data.startswith(b"\xef\xbb\xbf"):
        return "utf-8-sig"
    for encoding in ("utf-8", "gb18030"):
        try:
            data.decode(encoding)
            return encoding
        except UnicodeDecodeError:
            continue
    raise SystemExit(f"unable to decode {path}")


def read_csv_rows(path: Path) -> tuple[list[list[str]], str]:
    encoding = detect_encoding(path)
    with path.open(encoding=encoding, newline="") as handle:
        return list(csv.reader(handle)), encoding


def sync(args: argparse.Namespace) -> int:
    source_entries = load_source_entries(args.source)
    rows, encoding = read_csv_rows(args.target)
    lineterminator = detect_lineterminator(args.target)

    if len(rows) < 3:
        raise SystemExit("target CSV must include metadata, default, and description rows")

    header = rows[0]
    beizhu_index = header.index("_beizhu")
    field_map = {
        "weatherDesc": "weatherDesc_en",
        "palce": "palce_en",
        "placeDesc": "placeDesc_en",
        "specialEffDesc": "specialEffDesc_en",
    }
    indexes = {lua_field: header.index(csv_field) for lua_field, csv_field in field_map.items()}

    stats = {
        "beizhu_updates": 0,
        "weatherDesc_source_updates": 0,
        "palce_source_updates": 0,
        "placeDesc_source_updates": 0,
        "specialEffDesc_source_updates": 0,
        "manual_updates": 0,
        "unchanged": 0,
    }
    unresolved: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or not row[0]:
            continue

        row_id = row[0]
        source_values = source_entries.get(row_id, {})
        changed = False

        beizhu_value = row[beizhu_index]
        translated_beizhu = BEIZHU_TRANSLATIONS.get(beizhu_value)
        if translated_beizhu is not None and beizhu_value != translated_beizhu:
            row[beizhu_index] = translated_beizhu
            stats["beizhu_updates"] += 1
            changed = True

        for lua_field, csv_field in field_map.items():
            source_value = source_values.get(lua_field)
            manual_value = MANUAL_BY_ID_FIELD.get((row_id, lua_field))
            candidate = source_value if source_value is not None else manual_value
            if candidate is None:
                continue
            candidate = normalize_for_csv(candidate)
            index = indexes[lua_field]
            if row[index] != candidate:
                row[index] = candidate
                if source_value is not None:
                    stats[f"{lua_field}_source_updates"] += 1
                else:
                    stats["manual_updates"] += 1
                changed = True

        if not changed:
            stats["unchanged"] += 1

        if row[beizhu_index] and has_cjk(row[beizhu_index]):
            unresolved.append((line_number, row_id, "_beizhu"))
            continue

        for lua_field in field_map:
            source_value = source_values.get(lua_field)
            if source_value is not None and has_cjk(row[indexes[lua_field]]):
                unresolved.append((line_number, row_id, field_map[lua_field]))
                break

    print(f"encoding={encoding}")
    print(f"source_entries={len(source_entries)}")
    print(f"rows={sum(1 for row in rows[3:] if row and row[0])}")
    for key in (
        "beizhu_updates",
        "weatherDesc_source_updates",
        "palce_source_updates",
        "placeDesc_source_updates",
        "specialEffDesc_source_updates",
        "manual_updates",
        "unchanged",
    ):
        print(f"{key}={stats[key]}")
    print(f"remaining_cjk_rows={len(unresolved)}")

    if args.dry_run:
        return 0

    with args.target.open("w", encoding=encoding, newline="") as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--source",
        type=Path,
        default=Path("game_origin_config/gym/gate.lua"),
    )
    parser.add_argument(
        "--target",
        type=Path,
        default=Path("game_config/gym/gate.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
