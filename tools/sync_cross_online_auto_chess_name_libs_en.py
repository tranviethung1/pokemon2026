#!/usr/bin/env python3
"""Translate cross/online_auto_chess/name_libs.csv random trainer names to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

EXACT_NAME_MAP = {
    "龙骑士盖欧卡": "Dragon Rider Kyogre",
    "草系大师": "Grass Master",
    "电光一闪雷丘": "Quick Attack Raichu",
    "冰霜女皇": "Frost Queen",
    "钢翼巨龙": "Steelwing Dragon",
    "虫鸣蟋蟀": "Bug Buzz Cricket",
    "月亮能量露奈雅拉": "Moon-Powered Lunala",
    "火焰舞者": "Flame Dancer",
    "水域守护": "Water Guardian",
    "草野探险家": "Grassland Explorer",
    "伊布幻想": "Eevee Fantasy",
    "幻域行者": "Phantom Realm Wanderer",
    "暴鲤风暴": "Gyarados Storm",
    "电光石火": "Lightning Speed",
    "暗影使者": "Shadow Envoy",
    "精灵球收藏家": "Poke Ball Collector",
    "宝可梦训练师": "Pokemon Trainer",
    "喷火龙之怒": "Rage of Charizard",
    "岩石之力": "Power of Rock",
    "沙漠蜻蜓之翼": "Wings of Flygon",
    "太阳精灵之歌": "Song of Espeon",
    "闪电之翼": "Wings of Lightning",
    "龙之翼影": "Dragonwing Shadow",
    "冰霜之心": "Heart of Frost",
    "神秘之森": "Mystic Forest",
    "火焰之誓": "Vow of Flame",
    "钢铁之志": "Will of Steel",
    "虫鸣之音": "Sound of Bug Buzz",
    "蜻蜓之舞": "Dance of the Dragonfly",
    "沙漠之风": "Wind of the Desert",
    "冰霜之触": "Touch of Frost",
    "月亮之泪": "Tear of the Moon",
    "太阳之辉": "Radiance of the Sun",
}

SUBJECT_OVERRIDES = {
    "阿尔宙斯": "Arceus",
    "暗影球": "Shadow Ball",
    "冰精灵": "Glaceon",
    "冰霜": "Frost",
    "电击魔": "Electivire",
    "焰后蜥": "Salazzle",
    "风速狗": "Arcanine",
    "鬼盆栽": "Spiritomb",
    "黑龙": "Zekrom",
    "火焰": "Flame",
    "伊布": "Eevee",
    "磨牙彩皮鱼": "Bruxish",
    "洛托姆": "Rotom",
    "谜拟Q": "Mimikyu",
    "谜拟Ｑ": "Mimikyu",
    "沙漠": "Desert",
    "闪电": "Lightning",
    "神秘": "Mystic",
    "太阳": "Sun",
    "太阳精灵": "Espeon",
    "托戈德玛尔": "Togedemaru",
    "蜻蜓": "Dragonfly",
    "仙子精灵": "Sylveon",
    "叶精灵": "Leafeon",
    "月亮": "Moon",
    "月精灵": "Umbreon",
    "岩石": "Rock",
    "白龙": "Reshiram",
    "虫鸣": "Bug Buzz",
}

SUFFIX_MAP = {
    "闪电": "Lightning",
    "海洋": "Ocean",
    "成长": "Growth",
    "进化梦": "Evolution Dream",
    "追寻者": "Seeker",
    "飞跃": "Leap",
    "恶作剧": "Prank",
    "舞步": "Dance",
    "守护": "Guardian",
    "伙伴": "Partner",
    "烈焰": "Blaze",
    "波涛": "Waves",
    "绿叶": "Green Leaves",
    "狡猾": "Cunning",
    "电力": "Electric Power",
    "百变": "Versatility",
    "传说": "Legend",
    "幻影": "Phantom",
    "心灵感应": "Telepathy",
    "疾风": "Gale",
    "午睡": "Nap",
    "飞翔": "Flight",
    "光辉": "Radiance",
    "炽热": "Scorch",
    "风暴": "Storm",
    "寒冰": "Ice",
    "雷霆": "Thunder",
    "火焰": "Flame",
    "正义": "Justice",
    "忠诚": "Loyalty",
    "优雅": "Grace",
    "狂野": "Wildness",
    "力量": "Strength",
    "迅猛": "Swiftness",
    "形态": "Form",
    "谜团": "Mystery",
    "时间": "Time",
    "空间": "Space",
    "暗影": "Shadow",
    "创造": "Creation",
    "咆哮": "Roar",
    "纯洁": "Purity",
    "怒吼": "Howl",
    "宁静": "Serenity",
    "热舞": "Hot Dance",
    "泥潭": "Mire",
    "火花": "Spark",
    "利刃": "Blade",
    "沙漠": "Desert",
    "冰川": "Glacier",
    "光明": "Light",
    "幽暗": "Gloom",
    "森林": "Forest",
    "霜冻": "Frost",
    "魔法": "Magic",
    "斗志": "Fighting Spirit",
    "隐秘": "Stealth",
    "欢乐": "Joy",
    "电波": "Electro Wave",
    "幻象": "Illusion",
    "大地": "Earth",
    "太阳": "Sun",
    "月亮": "Moon",
    "虚空": "Void",
    "强壮": "Strength",
    "模仿": "Mimicry",
    "锋利": "Sharpness",
    "星辰": "Stars",
    "坚硬": "Hardness",
    "电流": "Current",
    "戏法": "Trick",
    "咬合": "Bite",
    "诡计": "Scheme",
    "惊喜": "Surprise",
    "活力": "Vitality",
    "食欲": "Appetite",
    "切割": "Cut",
    "坚固": "Solidity",
    "警戒": "Vigilance",
    "变身": "Transformation",
    "攻击": "Attack",
    "翻转": "Reversal",
    "爆炸": "Explosion",
    "舞蹈": "Dance",
    "充电": "Charge",
    "吞噬": "Devour",
    "斩击": "Slash",
    "防御": "Defense",
    "保护": "Protection",
    "戏耍": "Tease",
    "捕食": "Predation",
    "策略": "Strategy",
    "表演": "Performance",
    "华丽": "Splendor",
    "放电": "Discharge",
    "饱食": "Satiety",
    "剑舞": "Swords Dance",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def load_dictionary_md(path: Path) -> dict[str, str]:
    cn2en: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line.startswith("|") or ":---" in line:
            continue
        parts = [part.strip() for part in line.split("|") if part.strip()]
        if len(parts) >= 4 and parts[0].isdigit():
            cn2en.setdefault(parts[1], parts[2])
        elif len(parts) >= 3:
            cn2en.setdefault(parts[0], parts[1])
    return cn2en


def load_unit_name_en(path: Path) -> dict[str, str]:
    rows = list(csv.reader(path.read_text(encoding="gb18030").splitlines()))
    header = rows[0]
    idx_name = header.index("name")
    idx_name_en = header.index("name_en")
    cn2en: dict[str, str] = {}
    for row in rows[3:]:
        if not row or len(row) <= idx_name_en:
            continue
        cn = row[idx_name].strip()
        en = row[idx_name_en].strip()
        if cn and en and not CJK_RE.search(en):
            cn2en.setdefault(cn, en)
    return cn2en


def lookup_subject(
    subject: str,
    dictionary: dict[str, str],
    unit_names: dict[str, str],
) -> str:
    if subject in SUBJECT_OVERRIDES:
        return SUBJECT_OVERRIDES[subject]
    if subject in dictionary and not CJK_RE.search(dictionary[subject]):
        return dictionary[subject]
    if subject in unit_names:
        return unit_names[subject]
    return ""


def translate_name(
    name: str,
    dictionary: dict[str, str],
    unit_names: dict[str, str],
) -> str:
    if name in EXACT_NAME_MAP:
        return EXACT_NAME_MAP[name]

    if "的" in name:
        subject, suffix = name.split("的", 1)
        subject_en = lookup_subject(subject, dictionary, unit_names)
        suffix_en = SUFFIX_MAP.get(suffix, "")
        if subject_en and suffix_en:
            apostrophe = "'" if subject_en.endswith("s") else "'s"
            return f"{subject_en}{apostrophe} {suffix_en}"

    return ""


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    dictionary = load_dictionary_md(args.dictionary)
    unit_names = load_unit_name_en(args.unit_source)

    header = rows[0]
    name_index = header.index("name")
    updates = 0
    missing: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue

        value = row[name_index]
        translated = translate_name(value, dictionary, unit_names)
        if translated:
            if translated != value:
                row[name_index] = translated
                updates += 1
        elif CJK_RE.search(value):
            missing.append((line_number, row[0], value))

    remaining = [
        (line_number, row[0], row[name_index])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and CJK_RE.search(row[name_index])
    ]

    print(f"rows={sum(1 for row in rows[3:] if row)}")
    print(f"name_updates={updates}")
    print(f"missing_names={len(missing)}")
    print(f"remaining_cjk_names={len(remaining)}")
    for line_number, row_id, value in missing[:20]:
        print(f"missing line={line_number} id={row_id} name={value!r}")
    for line_number, row_id, value in remaining[:20]:
        print(f"remaining line={line_number} id={row_id} name={value!r}")

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
        default=Path("game_config/cross/online_auto_chess/name_libs.csv"),
    )
    parser.add_argument(
        "--dictionary",
        type=Path,
        default=Path("GAME_DICTIONARY.md"),
    )
    parser.add_argument(
        "--unit-source",
        type=Path,
        default=Path("game_config/unit_csv_test.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
