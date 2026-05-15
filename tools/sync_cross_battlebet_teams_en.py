#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import io
from pathlib import Path


ROOT = Path("/home/hungtv/pokemon2026")
DEFAULT_TARGET = ROOT / "game_config/cross/battlebet/teams.csv"
DEFAULT_DICTIONARY = ROOT / "GAME_DICTIONARY.md"

TEAM_NAME_MAP = {
    "鬼队": "Ghost Team",
    "一般队": "Normal Team",
    "圣剑使者队": "Sacred Swordsmen Team",
    "神鸟绕柱队": "Divine Birds and Regis Team",
    "神奥御三家队": "Sinnoh Starters Team",
    "成都御三家队": "Johto Starters Team",
    "百变怪队": "Ditto Team",
    "岩队": "Rock Team",
    "幻之宝可梦队": "Mythical Pokemon Team",
    "屠龙勇士队": "Dragon Slayer Team",
    "关都队": "Kanto Team",
    "成都队": "Johto Team",
    "丰缘队": "Hoenn Team",
    "丰源队": "Hoenn Team",
    "神奥队": "Sinnoh Team",
    "合众队": "Unova Team",
    "卡洛斯队": "Kalos Team",
    "宝可萌队": "Cute Pokemon Team",
    "原始回归队": "Primal Reversion Team",
    "策划队": "Planner Team",
    "火箭队": "Team Rocket",
    "银河队": "Team Galactic",
    "胡帕队": "Hoopa Team",
    "达克多队": "Tobias Team",
    "噩梦队": "Nightmare Team",
    "美梦队": "Sweet Dream Team",
    "咸鱼队": "Salted Fish Team",
    "摸鱼队": "Slacker Team",
    "弱鸡队": "Weakling Team",
    "菜狗队": "Rookie Dog Team",
    "马桶王队": "Toilet King Team",
    "谜拟Q队": "Mimikyu Team",
    "超进化X队": "Mega Evolution X Team",
    "超进化Y队": "Mega Evolution Y Team",
    "病猫队": "Sick Cat Team",
    "日神队": "Sun God Team",
    "月神队": "Moon God Team",
    "阿罗拉队": "Alola Team",
    "电斗队": "Electric-Fighting Team",
    "足球队": "Football Team",
    "拳击队": "Boxing Team",
    "岩地队": "Rock-Ground Team",
    "美丽队": "Beauty Team",
    "丑丑队": "Ugly Team",
    "劳动模范队": "Model Worker Team",
    "摸鱼偷懒队": "Slacking Off Team",
    "海鲜队": "Seafood Team",
    "鸡鸭队": "Chicken and Duck Team",
    "猫猫队": "Cat Team",
    "狗狗队": "Dog Team",
    "红色百变怪队": "Red Ditto Team",
    "钻石多多队": "Lots of Diamonds Team",
    "金币满满队": "Gold Overflow Team",
    "下雨队": "Rain Team",
    "打雷队": "Thunder Team",
    "剑舞队": "Swords Dance Team",
    "真龙队": "True Dragon Team",
    "假龙队": "Fake Dragon Team",
    "火队X队": "Fire Team X",
    "火队Y队": "Fire Team Y",
    "单队": "Singles Team",
    "双队": "Doubles Team",
    "丹帝队": "Leon Team",
    "盾队": "Shield Team",
    "剑队": "Sword Team",
    "右边必胜队": "Right Side Must Win Team",
    "左边放水队": "Left Side Throwing Team",
    "热气腾腾队": "Steaming Hot Team",
    "凉风习习队": "Cool Breeze Team",
    "大展宏兔队": "Rabbit's Grand Ambition Team",
    "虎虎生威队": "Mighty Tiger Team",
    "超梦X队": "Mewtwo X Team",
    "超梦Y队": "Mewtwo Y Team",
    "随机生成A队": "Random Team A",
    "随机生成B队": "Random Team B",
    "随机生成C队": "Random Team C",
    "随机生成D队": "Random Team D",
    "随机生成E队": "Random Team E",
    "随机生成F队": "Random Team F",
    "随机生成G队": "Random Team G",
    "随机生成H队": "Random Team H",
    "随机生成I队": "Random Team I",
    "随机生成J队": "Random Team J",
    "阿猫阿狗队": "Cats and Dogs Team",
    "臭鱼烂虾队": "Trash Fish and Shrimp Team",
    "飞机队": "Airplane Team",
    "火车队": "Train Team",
    "卧龙凤雏队": "Crouching Dragon and Young Phoenix Team",
    "光队": "Light Team",
    "暗队": "Darkness Team",
    "打假拳队": "Fake Punch Team",
    "假拳队": "False Punch Team",
    "胃口大开队": "Big Appetite Team",
    "笑口常开队": "Always Smiling Team",
    "龙腾万里队": "Soaring Dragon Team",
    "虫虫队": "Bug Bug Team",
    "龙龙队": "Dragon Dragon Team",
    "蛙蛙队": "Frog Frog Team",
    "鱼鱼队": "Fish Fish Team",
    "龟龟队": "Turtle Turtle Team",
    "鸭鸭队": "Duck Duck Team",
    "又鸟队": "Chicken Team",
    "猪猪队": "Pig Pig Team",
    "一模一样队": "Exactly the Same Team",
    "一样一模队": "Identically Same Team",
    "找不同1队": "Spot the Difference 1 Team",
    "找不同2队": "Spot the Difference 2 Team",
    "20队": "Team 20",
    "21队": "Team 21",
    "一生队": "Lifetime Team",
    "一世队": "Whole Life Team",
    "左边必败队": "Left Side Must Lose Team",
    "右边必赢队": "Right Side Must Win Team",
    "左边必输队": "Left Side Must Lose Team",
    "稍逊一筹队": "Slightly Weaker Team",
    "略胜一筹队": "Slightly Better Team",
    "天下无敌队": "Invincible Under Heaven Team",
    "天上之敌队": "Enemy from Heaven Team",
    "送分队": "Free Points Team",
    "得分队": "Scoring Team",
    "新年快乐队": "Happy New Year Team",
    "元旦快乐队": "Happy New Year's Day Team",
    "真·一模一样队": "Truly Identical Team",
    "西游队": "Journey to the West Team",
    "魑魅魍魉队": "Monsters and Demons Team",
    "大吉大利队": "Great Luck Team",
    "福气满满队": "Full of Blessings Team",
    "龙飞天队": "Dragons Fly Skyward Team",
    "蛇走地队": "Serpents Crawl the Earth Team",
    "皮卡丘1队": "Pikachu 1 Team",
    "皮卡丘2队": "Pikachu 2 Team",
    "闪光队": "Shiny Team",
    "大师队": "Master Team",
    "大器晚成队": "Late Bloomer Team",
    "大器未成队": "Not Yet Great Team",
    "遇事不决左边队": "When in Doubt, Pick Left Team",
    "反押别墅靠海队": "Fade the Bet, Win the Villa Team",
    "眼巴巴队": "Puppy Eyes Team",
    "眼咪咪队": "Smiley Eyes Team",
    "点开看数值队": "Check the Stats Team",
    "不看数值就这队": "No Need to Check Stats Team",
    "今天全押左队": "Bet All on Left Today Team",
    "今天右边全输队": "Right Side Loses Today Team",
    "元旦不快乐队": "Unhappy New Year's Day Team",
    "元旦平安队": "Peaceful New Year's Day Team",
    "元旦不平安队": "Uneasy New Year's Day Team",
    "白给队": "Freebie Team",
    "白送队": "Giveaway Team",
    "黑队": "Black Team",
    "黄队": "Yellow Team",
    "灰队": "Gray Team",
    "粉队": "Pink Team",
    "果神队": "Fruit God Team",
    "冰封闪电队": "Frozen Lightning Team",
    "史诗联盟": "Epic Alliance",
    "幻兽联盟": "Mythical Alliance",
    "黑马喽队": "Dark Horse Bro Team",
    "人工智能队": "Artificial Intelligence Team",
    "鸡哥队": "Bro Chicken Team",
    "木木兽队": "Wood Beast Team",
    "小美队": "Little Beauty Team",
    "小黑子队": "Little Blackie Team",
    "小王子队": "Little Prince Team",
    "小公主队": "Little Princess Team",
    "大鹅队": "Big Goose Team",
    "大狗队": "Big Dog Team",
    "大鱼队": "Big Fish Team",
    "大狮队": "Big Lion Team",
    "女王队": "Queen Team",
    "凤王队": "Ho-Oh Team",
    "马喽队": "Monkey Bro Team",
    "牛马队": "Ox-Horse Team",
    "尊嘟假嘟队": "For Real or Not Team",
    "古希腊掌管口袋的神队": "Ancient Greek God of Pockets Team",
    "水灵灵的队": "Fresh as Water Team",
    "红温队": "Red-Hot Team",
    "偷感队": "Sneaky Vibes Team",
    "硬控队": "Hard Control Team",
    "银发力量队": "Silver Hair Power Team",
    "热辣滚烫队": "Hot and Spicy Team",
    "搞抽象队": "Absurdist Team",
    "脑腐队": "Brainrot Team",
    "冠军队": "Champion Team",
    "city队": "City Team",
    "小米队": "Xiaomi Team",
    "宇宙机器人队": "Cosmic Robot Team",
    "深度求索队": "DeepSeek Team",
    "月之暗面队": "Dark Side of the Moon Team",
    "豆包队": "Doubao Team",
    "混元队": "Hunyuan Team",
    "即梦队": "Jimeng Team",
    "可灵队": "Keling Team",
    "文心一言队": "Ernie Team",
    "通义千问队": "Qwen Team",
    "海螺队": "Conch Team",
    "盘古队": "Pangu Team",
    "子曰队": "Master Said Team",
    "智脑队": "Smart Brain Team",
    "知海图队": "SeaMap Insight Team",
    "智谱清言队": "Zhipu Qingyan Team",
    "小冰队": "XiaoIce Team",
    "ChatPPT队": "ChatPPT Team",
    "伽勒尔队": "Galar Team",
    "帕底亚队": "Paldea Team",
    "橘子群岛队": "Orange Islands Team",
    "封神队": "Deification Team",
    "化石队": "Fossil Team",
    "究极异兽队": "Ultra Beast Team",
}

SHORT_NAME_ALIASES = {
    "妖": "Fairy",
    "超": "Psychic",
    "斗": "Fighting",
    "普": "Normal",
    "地": "Ground",
    "飞": "Flying",
    "鬼": "Ghost",
    "岩": "Rock",
    "关都": "Kanto",
    "成都": "Johto",
    "城都": "Johto",
    "丰缘": "Hoenn",
    "丰源": "Hoenn",
    "神奥": "Sinnoh",
    "合众": "Unova",
    "卡洛斯": "Kalos",
    "阿罗拉": "Alola",
    "伽勒尔": "Galar",
    "帕底亚": "Paldea",
    "橘子群岛": "Orange Islands",
}


def load_dictionary(path: Path) -> dict[str, str]:
    cn_to_en: dict[str, str] = {}

    for line in path.read_text(encoding="utf-8", errors="ignore").splitlines():
        if not line.startswith("|"):
            continue

        parts = [part.strip() for part in line.strip().strip("|").split("|")]
        if len(parts) < 3:
            continue

        if parts[0] in {"Gốc (CN)", ":---", "ID", "Keyword `【…】`"}:
            continue

        if parts[0].isdigit():
            if len(parts) >= 3 and parts[1] and parts[2] and parts[2] != "English":
                cn_to_en.setdefault(parts[1], parts[2])
        else:
            if parts[0] and parts[1] and parts[1] != "English":
                cn_to_en.setdefault(parts[0], parts[1])

    cn_to_en.update(SHORT_NAME_ALIASES)
    return cn_to_en


def translate_name(name: str, cn_to_en: dict[str, str]) -> str | None:
    if not any("\u4e00" <= ch <= "\u9fff" for ch in name):
        return name
    if name in TEAM_NAME_MAP:
        return TEAM_NAME_MAP[name]
    if name in cn_to_en:
        return cn_to_en[name]
    if name.endswith("队"):
        stem = name[:-1]
        if stem in TEAM_NAME_MAP:
            return TEAM_NAME_MAP[stem]
        if stem in cn_to_en:
            return f"{cn_to_en[stem]} Team"
    return None


def load_rows(path: Path) -> list[list[str]]:
    return list(csv.reader(path.read_text(encoding="utf-8-sig").splitlines()))


def dump_rows(rows: list[list[str]]) -> str:
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\r\n")
    writer.writerows(rows)
    return output.getvalue()


def sync_file(target: Path, dictionary: Path, dry_run: bool) -> None:
    rows = load_rows(target)
    cn_to_en = load_dictionary(dictionary)

    header = rows[0]
    idx_id = header.index("变量名")
    idx_name = header.index("name")

    updated = 0
    unchanged = 0
    missing: list[tuple[str, str]] = []

    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue

        row_id = row[idx_id].strip()
        current_name = row[idx_name].strip()
        if not row_id:
            continue

        english = translate_name(current_name, cn_to_en)
        if not english:
            missing.append((row_id, current_name))
            continue

        if row[idx_name] != english:
            row[idx_name] = english
            updated += 1
        else:
            unchanged += 1

    remaining_cjk = []
    for row in rows[3:]:
        if not row or not any(cell.strip() for cell in row):
            continue
        value = row[idx_name]
        if any("\u4e00" <= ch <= "\u9fff" for ch in value):
            remaining_cjk.append((row[idx_id], value))

    print(f"updated name: {updated}")
    print(f"unchanged name: {unchanged}")
    print(f"missing mappings: {len(missing)}")
    for row_id, value in missing[:20]:
        print(f"  - row {row_id}: {value}")
    print(f"remaining CJK rows: {len(remaining_cjk)}")
    for row_id, value in remaining_cjk[:20]:
        print(f"  - row {row_id}: {value}")

    if dry_run:
        return

    target.write_text(dump_rows(rows), encoding="utf-8-sig")


def main() -> None:
    parser = argparse.ArgumentParser(description="Sync cross battlebet teams.csv names to English")
    parser.add_argument("--target", type=Path, default=DEFAULT_TARGET, help="Target CSV path")
    parser.add_argument(
        "--dictionary",
        type=Path,
        default=DEFAULT_DICTIONARY,
        help="Dictionary markdown path",
    )
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing")
    args = parser.parse_args()

    sync_file(args.target, args.dictionary, args.dry_run)


if __name__ == "__main__":
    main()
