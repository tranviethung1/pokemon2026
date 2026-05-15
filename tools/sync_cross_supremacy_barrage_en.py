#!/usr/bin/env python3
"""Translate cross/supremacy/barrage.csv barrage text to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

EXACT_TEXT_MAP = {
    "帅不过三秒": "Cool for three seconds at most.",
    "召唤智神坐骑之一洛奇亚": "Summon Lugia, one of Lord Ash's mounts.",
    "小智，使用全复药！！": "Ash, use a Max Potion!!",
    "一会儿裂空座告诉你什么叫一挑五": "Rayquaza will show you what 1v5 means in a second.",
    "闪光裂毛虫": "Shiny Caterquaza",
    "诸神之战，开始！": "Battle of the gods, begin!",
    "前方高能预警": "High-energy alert ahead.",
    "疯狂打call": "Cheering like crazy!",
    "皮卡丘，十万伏特！": "Pikachu, Thunderbolt!",
    "断崖之剑警告！": "Precipice Blades warning!",
    "还有谁不会飞？": "Who else can't fly?",
    "固拉多不会飞": "Groudon can't fly.",
    "冲鸭！！": "Let's gooo!!",
    "太帅了口巴！": "So freakin' cool!",
    "皮皮虾，我们走！": "Pipi Shrimp, let's go!",
    "奥利给": "Let's freaking go!",
    "爷青回": "My youth is back!",
    "卷起来了": "They're going all out!",
    "燃起来了": "This is getting hype!",
    "厉害": "Impressive!",
    "太强了": "Too strong!",
    "就决定是你了": "I choose you!",
    "特效炸裂": "The effects are exploding!",
    "特效太帅了": "The effects are so cool!",
    "口袋觉醒，启动！": "Pokemon Awakening, activate!",
    "大佬大佬": "What a legend!",
    "牛啊": "That's sick!",
    "强啊": "So strong!",
    "目标是，宝可梦大师": "The goal is to become a Pokemon Master.",
    "来了老弟": "Here we go, bro!",
    "我一定会成为宝可梦大师的": "I will become a Pokemon Master!",
    "芜湖起飞": "Woohoo, we're flying!",
    "大招毁天灭地": "That ultimate can destroy the world!",
    "还有谁！！": "Who else?!!",
    "无敌了": "Unstoppable!",
    "秀儿": "Stylish.",
    "秀啊": "What a play!",
    "太秀了": "That was too clean!",
    "优秀": "Excellent!",
    "哇！！": "Whoa!!",
    "可以可以": "Nice, nice.",
    "xswl": "LMAO",
    "这迷之操作": "What a mysterious play.",
    "这操作太秀了": "That play was too clean.",
    "这波可以": "That was a good one.",
    "1打6": "1 vs 6.",
    "一串三": "Three in a row!",
    "太肉了": "Too tanky!",
    "这谁顶得住啊": "Who can survive that?",
    "水溅跃！": "Splash!",
    "极意画龙点睛！！": "Ultimate Dragon Ascent!!",
    "皮卡皮卡必杀击！": "Catastropika!",
    "九彩升华齐聚顶": "Extreme Evoboost!",
    "九彩升华齐做梦": "Extreme Evodream!",
    "究极无敌大冲撞": "Breakneck Blitz!",
    "全力无双激烈拳": "All-Out Pummeling!",
    "极速俯冲轰烈撞": "Supersonic Skystrike!",
    "强酸剧毒灭绝雨": "Acid Downpour!",
    "地隆啸天大终结": "Tectonic Rage!",
    "毁天灭地巨岩坠": "Continental Crush!",
    "绝对捕食回旋斩": "Savage Spin-Out!",
    "无尽暗夜之诱惑": "Never-Ending Nightmare!",
    "超绝螺旋连击": "Corkscrew Crash!",
    "超强极限爆焰弹": "Inferno Overdrive!",
    "超级水流大漩涡": "Hydro Vortex!",
    "绚烂缤纷花怒放": "Bloom Doom!",
    "终极伏特狂雷闪": "Gigavolt Havoc!",
    "至高精神破坏波": "Shattered Psyche!",
    "激狂大地万里冰": "Subzero Slammer!",
    "究极巨龙震天地": "Devastating Drake!",
    "黑洞吞噬万物灭": "Black Hole Eclipse!",
    "可爱星星飞天撞": "Twinkle Tackle!",
    "YYDS": "GOAT!",
    "打不过根本打不过": "Can't beat it, seriously can't beat it.",
    "要掉段了": "I'm about to derank.",
    "求放过！": "Have mercy!",
    "大佬带我啊": "Pro, carry me!",
    "固拉多太肉了": "Groudon is way too tanky.",
    "我上铂金了": "I made Platinum!",
    "打不上去了": "I can't climb any higher.",
    "固拉多怎么打啊": "How do you beat Groudon?",
    "原始固拉多怎么打啊": "How do you beat Primal Groudon?",
    "不会飞为什么这么强？": "Why is the one that can't fly so strong?",
    "不会飞起飞了": "The one that can't fly is popping off.",
    "帅": "Cool.",
    "帅啊": "So cool!",
    "太帅了": "Too cool!",
    "爱了爱了": "Love it, love it.",
    "美哭": "So beautiful I'm crying.",
    "冲冲冲": "Go go go!",
    "头给打爆了": "Got my head blown off.",
    "我已经没钱守护宝可梦了": "I have no money left to protect Pokemon.",
    "我得到神奇宝贝了！": "I got a Pokemon!",
    "高能预警": "Hype warning.",
    "好看": "Looks great.",
    "不会飞已经不行了": "The one that can't fly is washed.",
    "版本之子": "Meta king.",
    "口袋觉醒！": "Pokemon Awakening!",
    "好多大佬啊": "So many pros here!",
    "膜拜大佬": "All hail the pros.",
    "大佬带我！": "Pro, carry me!",
}

ALIAS_NAME_MAP = {
    "小智": "Ash",
    "小拉达": "Rattata",
    "绿毛虫": "Caterpie",
    "可达鸭": "Psyduck",
    "喷火龙": "Charizard",
    "杰尼龟": "Squirtle",
    "代欧奇希斯": "Deoxys",
    "捷拉奥拉": "Zeraora",
    "电猫": "Electric Cat",
    "超梦": "Mewtwo",
    "谢米": "Shaymin",
    "玛夏多": "Marshadow",
    "达克莱伊": "Darkrai",
    "美洛耶塔": "Meloetta",
    "拉帝亚斯": "Latias",
    "拉帝欧斯": "Latios",
    "巨金怪": "Metagross",
    "洛奇亚": "Lugia",
    "帕路奇亚": "Palkia",
    "水龙": "Water Dragon",
    "雷吉奇卡斯": "Regigigas",
    "马桶王": "Toilet King",
    "基拉祈": "Jirachi",
    "时拉比": "Celebi",
    "比克提尼": "Victini",
    "玛纳霏": "Manaphy",
    "伊裴尔塔尔": "Yveltal",
    "哲尔尼亚斯": "Xerneas",
    "盖诺赛克特": "Genesect",
    "露奈雅拉": "Lunala",
    "索尔迦雷欧": "Solgaleo",
    "裂空座": "Rayquaza",
    "酋雷姆": "Kyurem",
    "冰龙": "Ice Dragon",
    "骑拉帝纳": "Giratina",
    "鬼龙": "Ghost Dragon",
    "凤王": "Ho-Oh",
    "莱希拉姆": "Reshiram",
    "捷克罗姆": "Zekrom",
    "帝牙卢卡": "Dialga",
    "白龙": "White Dragon",
    "黑龙": "Black Dragon",
    "钢龙": "Steel Dragon",
    "盖欧卡": "Kyogre",
    "固拉多": "Groudon",
    "胡帕": "Hoopa",
    "霏欧纳": "Phione",
    "奈克洛兹玛": "Necrozma",
    "拂晓之翼": "Dawn Wings",
    "黄昏之鬃": "Dusk Mane",
    "玛机雅娜": "Magearna",
    "蒂安希": "Diancie",
    "美录梅塔": "Melmetal",
    "螺丝": "Melmetal",
    "幸福蛋": "Blissey",
    "皮卡丘": "Pikachu",
    "皮神": "Pika God",
    "智蛙": "Ash-Greninja",
    "波尔凯尼恩": "Volcanion",
    "钢队": "Steel team",
    "水队": "Water team",
    "火队": "Fire team",
    "原固": "Primal Groudon",
    "原鱼": "Primal Kyogre",
    "狮子": "Solgaleo",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def translate_text(text: str) -> str:
    text = text.strip()
    if not text:
        return ""

    if text in EXACT_TEXT_MAP:
        return EXACT_TEXT_MAP[text]

    if re.fullmatch(r"6+", text):
        bangs = max(0, len(text) - 2)
        return "Nice" + ("!" * bangs)

    if match := re.fullmatch(r"去吧，(.+)！", text):
        target = ALIAS_NAME_MAP.get(match.group(1), match.group(1))
        return f"Go, {target}!"

    if match := re.fullmatch(r"(.+)yyds", text, flags=re.IGNORECASE):
        target = ALIAS_NAME_MAP.get(match.group(1), match.group(1))
        return f"{target} is the GOAT!"

    if text == "xdm加油":
        return "Let's go, bros!"
    if text == "xdm我上铂金了":
        return "Bros, I made Platinum!"
    if text == "xdm原固怎么打？":
        return "Bros, how do you beat Primal Groudon?"
    if text == "xdm原鱼怎么打？":
        return "Bros, how do you beat Primal Kyogre?"
    if text == "xdm狮子怎么打？":
        return "Bros, how do you beat Solgaleo?"

    return ""


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    text_index = header.index("text")
    updates = 0
    missing: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row or len(row) <= text_index:
            continue

        value = row[text_index]
        translated = translate_text(value)
        if translated:
            if translated != value:
                row[text_index] = translated
                updates += 1
        elif CJK_RE.search(value):
            missing.append((line_number, row[0], value))

    remaining = [
        (line_number, row[0], row[text_index])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and len(row) > text_index and CJK_RE.search(row[text_index])
    ]

    print(f"rows={sum(1 for row in rows[3:] if row and row[0])}")
    print(f"text_updates={updates}")
    print(f"missing_text={len(missing)}")
    print(f"remaining_cjk_text={len(remaining)}")
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
        default=Path("game_config/cross/supremacy/barrage.csv"),
    )
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
