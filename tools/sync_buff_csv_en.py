#!/usr/bin/env python3
"""Translate game_config/auto_chess/buff.csv display names (name column) to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path

CJK_RE = re.compile(r"[\u3400-\u9fff]")


def load_dictionary_md(path: Path) -> dict[str, str]:
    cn2en: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line.startswith("|") or ":---" in line:
            continue
        parts = [p.strip() for p in line.split("|")]
        parts = [p for p in parts if p]
        if len(parts) < 3:
            continue
        if parts[0].isdigit() and CJK_RE.search(parts[1]):
            cn, en = parts[1], parts[2]
            if en and not CJK_RE.search(en):
                cn2en[cn] = en
            continue
        if CJK_RE.search(parts[0]):
            cn, en = parts[0], parts[1]
            if en and not CJK_RE.search(en):
                cn2en.setdefault(cn, en)
    return cn2en


FULL_PHRASES: dict[str, str] = {
    "卡璞·鸣鸣": "Tapu Koko",
    "卡璞·哞哞": "Tapu Bulu",
    "卡璞·蝶蝶": "Tapu Lele",
    "卡璞·鳍鳍": "Tapu Fini",
    "强化·回收装置": "Augmented · Reclaimer",
    "强化·团结一心": "Augmented · United We Stand",
    "强化·巨化喷雾": "Augmented · Growth Spray",
    "强化·强化喷雾": "Augmented · Power-Up Spray",
    "强化·改造之锤": "Augmented · Remodeling Hammer",
    "强化·木制宝箱": "Augmented · Wooden Chest",
    "强化·理财能手": "Augmented · Treasurer",
    "强化·硬化喷雾": "Augmented · Hardening Spray",
    "强化·神奇糖果": "Augmented · Rare Candy",
    "强化·离洞绳": "Augmented · Escape Rope",
    "强化·精灵球": "Augmented · Poke Ball",
    "强化·营地休整": "Augmented · Camp Rest",
    "强化·虚弱喷雾": "Augmented · Weakening Spray",
    "强化·讨价还价": "Augmented · Haggle",
    "强化·贵重球": "Augmented · Luxury Ball",
    "强化·量身定制": "Augmented · Custom Fit",
    "强化·防护装置": "Augmented · Protector Array",
    "强化·除虫喷雾": "Augmented · Bug Repellent",
    "强化·预言之书": "Augmented · Book of Prophecy",
    "强化·黄金宝箱": "Augmented · Gold Chest",
    "强化喷雾": "Power-Up Spray",
    "强化改造锤": "Augmented Remodeling Hammer",
    "预言·胜主buff": "Prophecy · Victory (Main Buff)",
    "预言·负主buff": "Prophecy · Bane (Main Buff)",
    "新年限定·乐": "New Year Limited · Joy",
    "新年限定·新": "New Year Limited · New",
}

PREFIX: dict[str, str] = {
    "三色堇": "Alexa",
    "可尔妮": "Korrina",
    "大木": "Oak",
    "小刚": "Brock",
    "小智": "Ash",
    "小霞": "Misty",
    "布尔美丽": "Plumeria",
    "库库伊": "Kukui",
    "弥莉丝": "Millis",
    "拉普": "Rapp",
    "斗子": "Hilda",
    "新年限定": "New Year Limited",
    "朗日": "Elio",
    "杜鹃": "Roxanne",
    "梅利亚": "Meray",
    "水莲": "Lana",
    "百变怪": "Ditto",
    "碧珂": "Wicke",
    "碧蓝": "Green",
    "紫罗兰": "Viola",
    "美月": "Selene",
    "美洛耶塔": "Meloetta",
    "艾岚": "Alain",
    "芙蓉": "Phoebe",
    "芽衣": "Rosa",
    "蕾冠王": "Calyrex",
    "谢米": "Shaymin",
    "轻飘飘": "Frillish",
    "达帕": "Tupp",
    "霍米加": "Roxie",
    "露美旦": "Morgan",
    "预言": "Prophecy",
}

SUFFIX: dict[str, str] = {
    "乐": "Joy",
    "新": "New",
    "伯乐": "Talent Scout",
    "哞哞": "Bulu",
    "蝶蝶": "Lele",
    "鳍鳍": "Fini",
    "鸣鸣": "Koko",
    "回收装置": "Reclaimer",
    "团结一心": "United We Stand",
    "均衡": "Balance",
    "坚守": "Hold Fast",
    "坚韧": "Tenacity",
    "复仇": "Revenge",
    "复制": "Copy",
    "复生": "Rebirth",
    "天空": "Sky Forme",
    "巨化喷雾": "Growth Spray",
    "异种": "Exotic",
    "怜悯": "Mercy",
    "感知": "Perception",
    "成双": "Pair Up",
    "战意": "Battle Spirit",
    "扩容": "Expansion",
    "折旧": "Depreciation",
    "改造之锤": "Remodeling Hammer",
    "斗技": "Duel",
    "木制宝箱": "Wooden Chest",
    "橙色": "Orange",
    "歌声": "Aria",
    "熟客": "Regular",
    "理财能手": "Treasurer",
    "生财": "Profit",
    "登场": "On Play",
    "白马": "Ice Rider",
    "百变": "Transform",
    "硬化喷雾": "Hardening Spray",
    "神奇糖果": "Rare Candy",
    "离洞绳": "Escape Rope",
    "秘技": "Secret Tech",
    "移魂": "Soul Shift",
    "空投物资": "Supply Drop",
    "精灵球": "Poke Ball",
    "紫色": "Purple",
    "红色": "Red",
    "胜主buff": "Victory (Main Buff)",
    "舞步": "Pirouette",
    "营地休整": "Camp Rest",
    "虚弱喷雾": "Weakening Spray",
    "讨价还价": "Haggle",
    "豪掷": "Splurge",
    "负主buff": "Bane (Main Buff)",
    "贵重球": "Luxury Ball",
    "量身定制": "Custom Fit",
    "锻造": "Forge",
    "间谍": "Spy",
    "防护装置": "Protector Array",
    "陆地": "Land Forme",
    "除虫喷雾": "Bug Repellent",
    "雄": "Male",
    "雌": "Female",
    "预言之书": "Book of Prophecy",
    "黄金宝箱": "Gold Chest",
    "强化喷雾": "Power-Up Spray",
}

EXTRA: dict[str, str] = {
    "通用": "Generic",
    "发现": "Discover",
    "乘胜": "Victory Rush",
    "永恒": "Eternity",
    "奇怪的蛋": "Odd Egg",
    "神奇药水": "Miracle Potion",
    "莱希拉姆测试": "Reshiram Test",
    "风速狗测试": "Arcanine Test",
    "新手引导喷火龙技能": "Tutorial Charizard Skill",
    "新手引导技能": "Tutorial Skill",
    "鸭嘴炎兽(新手引导)": "Magmortar (Tutorial)",
    "喵喵(新手引导）": "Meowth (Tutorial)",
    "喵喵(新手引导)": "Meowth (Tutorial)",
    "PVP新手引导技能": "PVP Tutorial Skill",
    "训练家伤害减免": "Trainer Damage Reduction",
    "（新手引导）": "(Tutorial)",
    "(新手引导)": "(Tutorial)",
    "新手引导": "Tutorial",
    "测试": "Test",
    "痛苦面具": "Mask of Pain",
    "月亮之笛": "Lunar Flute",
    "高能护腕": "Power Band",
    "捣蛋小妖": "Impidimp",
    "闪光超级沙奈朵": "Shiny Mega Gardevoir",
    "晃晃斑": "Spinda",
    "下克上项链": "Underdog Necklace",
    "胡帕的恶作剧": "Hoopa's Prank",
    "戏法空间": "Trick Room",
    "镇店之宝": "Signature Stock",
    "进货": "Stock Up",
    "会员日": "Member Day",
    "复仇之心": "Vengeful Heart",
    "蓝色药丸": "Blue Pill",
    "红色药丸": "Red Pill",
    "绿色药丸": "Green Pill",
    "兴奋剂": "Stimulant",
    "战意": "Battle Spirit",
    "生长": "Growth",
    "进化": "Evolution",
    "彩虹": "Rainbow",
    "和平主义": "Pacifism",
    "讨价还价": "Haggle",
    "团结之力": "Power of Unity",
    "放大镜2": "Magnifier II",
    "放大镜3": "Magnifier III",
    "放大镜4": "Magnifier IV",
    "放大镜5": "Magnifier V",
    "隐居的铁匠": "Reclusive Blacksmith",
    "克隆": "Clone",
    "强夺": "Seize",
    "杀虫喷雾": "Bug Spray",
    "地雷": "Landmine",
    "蝴蝶效应": "Butterfly Effect",
    "放大手电筒": "Magnifying Flashlight",
    "神秘商人": "Mystery Merchant",
    "完美闪避": "Perfect Dodge",
    "一分钱一分货": "You Get What You Pay For",
    "紧急支援": "Emergency Support",
    "批量克隆": "Mass Clone",
    "甄选装备": "Curated Gear",
    "甄选事件": "Curated Events",
    "强化糖果": "Power Candy",
    "泡泡浴": "Bubble Bath",
    "逝时若光": "Fleeting Light",
    "传承": "Legacy",
    "分裂": "Split",
    "羁绊": "Bond",
    "往事回响": "Echoes of the Past",
    "聚宝盆": "Cornucopia",
    "医学奇迹": "Medical Miracle",
    "全副武装": "Fully Loaded",
    "最终决战": "Final Showdown",
    "特价商品": "Clearance Sale",
    "镜子戏法": "Mirror Trick",
    "红色药水": "Red Elixir",
    "绿色药水": "Green Elixir",
    "蓝色药水": "Blue Elixir",
    "交易": "Trade",
    "解除伪装": "Lift Disguise",
    "大葱": "Leek",
    "新年快乐": "Happy New Year",
    "萨戮德": "Zarude",
    "炎帝": "Entei",
    "超梦": "Mewtwo",
    "洛奇亚": "Lugia",
    "甲贺忍蛙": "Greninja",
    "蒂安希": "Diancie",
    "小拉达": "Rattata",
    "凤王": "Ho-Oh",
    "盖欧卡": "Kyogre",
    "暴鲤龙": "Gyarados",
    "帕路奇亚": "Palkia",
    "美洛耶塔·舞步": "Meloetta Pirouette",
    "美洛耶塔·歌声": "Meloetta Aria",
}

# Full-row overrides (avoid single-char dictionary bleed like 红 in 红莲, 修 in 修改, 精灵 in 精灵球).
EXACT_OVERRIDES: dict[str, str] = {
    "不染": "Untainted",
    "业火": "Hellfire",
    "严寒": "Deep Freeze",
    "丰饶": "Bounty",
    "主buff": "(Main Buff)",
    "余烬": "Embers",
    "使用": "Use",
    "偏折": "Deflect",
    "共生": "Symbiosis",
    "凛冬": "Bitter Winter",
    "凝聚": "Condense",
    "剑守": "Stance (Shield)",
    "剑舞": "Swords Dance",
    "剧毒": "Toxic",
    "协力": "Teamwork",
    "召唤": "Summon",
    "吞噬": "Devour",
    "吹雪": "Blizzard",
    "唤灵": "Spirit Call",
    "困倦": "Drowsy",
    "固守": "Hold Ground",
    "坚硬": "Hardness",
    "契约": "Pact",
    "好运": "Good Luck",
    "守卫": "Guard",
    "寒意": "Chill",
    "崩雪": "Avalanche",
    "巨浪": "Surge",
    "平等": "Equality",
    "幻灭": "Fade",
    "强攻": "Assault",
    "影杀": "Shadow Strike",
    "怒火": "Rage",
    "怪蛋": "Odd Egg",
    "戏法": "Trick",
    "摧破": "Shatter",
    "斗技": "Arena Bout",
    "新衣": "New Garb",
    "无尽": "Endless",
    "新年限定": "New Year Limited",
    "星火": "Starfire",
    "暗魂": "Dark Soul",
    "束缚": "Bind",
    "枷锁": "Shackles",
    "棋子": "Chess Piece",
    "欲壑": "Craving",
    "水月": "Moon on Water",
    "治愈": "Heal",
    "泡沫": "Foam",
    "流水": "Current",
    "涅槃": "Rebirth",
    "漩涡": "Whirlpool",
    "潜袭": "Ambush",
    "潺潺": "Murmur",
    "灵动": "Agility",
    "灾祸": "Calamity",
    "熊熊": "Blazing",
    "熔化": "Melt",
    "燃烧": "Burn",
    "燎原": "Wildfire",
    "爆裂": "Burst",
    "牵制": "Pin Down",
    "牵制Ⅱ": "Pin Down II",
    "狂怒": "Berserk",
    "球根": "Bulb",
    "疯狂": "Madness",
    "盾护": "Shield Guard",
    "破冰": "Icebreak",
    "破山": "Mountain Break",
    "窃取": "Steal",
    "红莲": "Scarlet Lotus",
    "组装": "Assemble",
    "缥缈": "Ethereal",
    "联结": "Link",
    "聚流": "Confluence",
    "背水": "Last Stand",
    "脆弱": "Fragile",
    "腐化": "Corrupt",
    "腐坏": "Rot",
    "自爆": "Self-Destruct",
    "藏形": "Hide",
    "虚影": "Phantom",
    "融雪": "Thaw",
    "衰竭": "Exhaust",
    "记录": "Record",
    "谜题": "Riddle",
    "贯穿": "Pierce",
    "过渡": "Transition",
    "退货": "Refund",
    "遁影": "Shadow Step",
    "遗愿": "Last Wish",
    "配件": "Accessory",
    "野蛮": "Savage",
    "铁匠": "Blacksmith",
    "铁卫": "Iron Guard",
    "锁血": "HP Lock",
    "锋利": "Sharp",
    "镜花": "Mirror Bloom",
    "霜舞": "Frost Dance",
    "魅影": "Specter",
    "黑带": "Black Belt",
    "减攻击": "Attack Down",
    "加护甲": "+Armor",
    "加攻击": "+Attack",
    "加生命": "+HP",
    "幽冥火": "Nether Flame",
    "探宝器": "Treasure Sensor",
    "改技能": "Skill Reroll",
    "水中月": "Moon in Water",
    "焦点镜": "Scope Lens",
    "现形镜": "Reveal Glass",
    "离洞绳": "Escape Rope",
    "粗骨头": "Thick Club",
    "精灵球": "Poke Ball",
    "精灵之笛": "Poke Flute",
    "谜拟Q": "Mimikyu",
    "贵重球": "Luxury Ball",
    "金假牙": "Gold Teeth",
    "金属膜": "Metal Coat",
    "金腰带": "Gold Belt",
    "镜中花": "Flower in Mirror",
    "防护服": "Hazard Suit",
    "龙之牙": "Dragon Fang",
    "七彩羽毛": "Rainbow Feather",
    "不朽之剑": "Rusted Sword",
    "不朽之盾": "Rusted Shield",
    "丝绸围巾": "Silk Scarf",
    "先制之爪": "Quick Claw",
    "共鸣元素": "Resonant Element",
    "出售卡牌": "Sell Card",
    "力量护腕": "Power Bracer",
    "力量负重": "Power Belt",
    "升级次数": "Upgrade Count",
    "博士面具": "Professor's Mask",
    "原价出售": "Sell at List Price",
    "右侧记录": "Right Log",
    "右侧过渡": "Right Transition",
    "咸鱼龙刺": "Salty Fish Spine",
    "回收装置": "Reclaimer",
    "团结一心": "United We Stand",
    "坚固铃铛": "Sturdy Bell",
    "坚盾剑怪": "Aegislash",
    "坚钢之力": "Steel Might",
    "基因气团": "Gene Miasma",
    "太阳之笛": "Solar Flute",
    "奇异熏香": "Odd Incense",
    "宝石手镯": "Jewel Bracelet",
    "左侧记录": "Left Log",
    "左侧过渡": "Left Transition",
    "巨化喷雾": "Growth Spray",
    "年 标记": "Year Marker",
    "应激模板": "Stress Template",
    "强力手环": "Power Bracelet",
    "心之水滴": "Mystic Water",
    "心灵香草": "Mental Herb",
    "快 标记": "Fast Marker",
    "技能伤害": "Skill Damage",
    "护甲翻倍": "Double Armor",
    "护盾通用": "Generic Shield",
    "拉鲁拉斯": "Ralts",
    "改造之锤": "Remodeling Hammer",
    "攻击偷取": "Attack Steal",
    "攻击翻倍": "Double Attack",
    "新 标记": "New Marker",
    "星夜祈愿": "Starlit Wish",
    "木制宝箱": "Wooden Chest",
    "机巧魂心": "Ingenious Soul Core",
    "极巨腕带": "Dynamax Band",
    "柔软沙子": "Soft Sand",
    "次数标记": "Count Marker",
    "武士头盔": "Samurai Helmet",
    "气势头带": "Focus Band",
    "气势披带": "Focus Sash",
    "泡沫奶油": "Whipped Dream",
    "消耗金币": "Spend Coins",
    "混元之石": "Primordial Stone",
    "源源不断": "Endless Flow",
    "火焰宝珠": "Flame Orb",
    "灵界之布": "Reaper Cloth",
    "爱心便当": "Lunch Box",
    "王者之证": "King's Rock",
    "理财能手": "Treasurer",
    "生命翻倍": "Double HP",
    "白玉宝珠": "Lustrous Orb",
    "硬化喷雾": "Hardening Spray",
    "神奇糖果": "Rare Candy",
    "神秘项链": "Mystery Necklace",
    "神隐王冠": "Vanishing Crown",
    "移除守卫": "Remove Guard",
    "究极棱镜": "Ultranecrozium Z",
    "紧急包扎": "First Aid",
    "绝对防御": "Absolute Guard",
    "羁绊铃铛": "Bond Bell",
    "获得卡牌": "Gain Card",
    "获得金币": "Gain Coins",
    "营地休整": "Camp Rest",
    "虚弱喷雾": "Weakening Spray",
    "计时模板": "Timer Template",
    "讲究头带": "Choice Band",
    "讲究眼镜": "Choice Specs",
    "诅咒之符": "Spell Tag",
    "财源滚滚": "Rolling Riches",
    "赤焰之爪": "Blazing Claw",
    "迅猛铃铛": "Swift Bell",
    "量身定制": "Custom Fit",
    "钢铁之盾": "Steel Bulwark",
    "银色之风": "Silver Wind",
    "防护装置": "Protector Array",
    "除虫喷雾": "Bug Repellent",
    "预言之书": "Book of Prophecy",
    "饱腹熏香": "Full Incense",
    "鬼手拳套": "Ghost Hand Gloves",
    "黄金宝箱": "Gold Chest",
    "光环给己方": "Aura to Allies",
    "击破时触发": "On Break Trigger",
    "妖精存储器": "Fairy Memory",
    "对战通讯器": "Battle Communicator",
    "小智的帽子": "Ash's Hat",
    "己方行动前": "Before Ally Acts",
    "弹簧拳套总": "Punching Glove (Main)",
    "强制锻炼器": "Macho Brace",
    "恶作剧之影": "Mischief Shadow",
    "永久加护甲": "Permanent +Armor",
    "永久加攻击": "Permanent +Attack",
    "永久加生命": "Permanent +HP",
    "混沌魔方球": "Chaos Magicube",
    "熔岩增幅器": "Magmarizer",
    "生长加攻击": "Growth +Attack",
    "生长加生命": "Growth +HP",
    "硬石头 总": "Hard Stone (Main)",
    "训练家加血": "Trainer Heal",
    "训练家扣血": "Trainer HP Loss",
    "防尘护目镜": "Safety Goggles",
    "驱散302": "Dispel 302",
    "使用次数记录": "Use Count Log",
    "修改升级费用": "Adjust Upgrade Cost",
    "失败次数记录": "Fail Count Log",
    "获得解除伪装": "Gain Lift Disguise",
    "获得随机事件": "Gain Random Event",
    "葛拉西蒂亚花": "Gracidea Flower",
    "设置刷新费用": "Set Refresh Cost",
    "吃剩的苹果 总": "Leftovers (Main)",
    "彩虹主buff": "Rainbow (Main Buff)",
    "战意主buff": "Battle Spirit (Main Buff)",
    "训练家伤害+2": "Trainer Damage +2",
    "训练家伤害-2": "Trainer Damage -2",
    "训练家减伤+1": "Trainer Damage Reduction +1",
    "记录要加的护甲": "Armor to Add (Log)",
    "记录要加的攻击": "Attack to Add (Log)",
    "记录要加的生命": "HP to Add (Log)",
    "过渡主buff": "Transition (Main Buff)",
    "驱散主buff": "Dispel (Main Buff)",
    "打出事件卡时触发": "On Event Card Play",
    "训练家主buff": "Trainer (Main Buff)",
    "设置商店刷新费用": "Set Shop Refresh Cost",
    "每回合首次刷新免费": "First Refresh Free Each Turn",
    "进攻改装主buff": "Offense Mod (Main Buff)",
    "防御改装主buff": "Defense Mod (Main Buff)",
    "集齐新年快乐获得卡牌": "Complete Happy New Year Set for Card",
}


def postprocess_name(s: str) -> str:
    return s.replace("attrHp", "HP")


def merge_maps(dic: Path) -> dict[str, str]:
    m = load_dictionary_md(dic)
    for k, v in EXTRA.items():
        m[k] = v
    keys = sorted(m.keys(), key=len, reverse=True)
    return m, keys


def translate_name(name: str, m: dict[str, str], keys: list[str]) -> str:
    if name in EXACT_OVERRIDES:
        return postprocess_name(EXACT_OVERRIDES[name])
    if not CJK_RE.search(name):
        return name
    if name in FULL_PHRASES:
        return postprocess_name(FULL_PHRASES[name])
    if "·" in name:
        a, b = name.split("·", 1)
        pa = PREFIX.get(a) or translate_segment(a, m, keys)
        sb = SUFFIX.get(b) or translate_segment(b, m, keys)
        return postprocess_name(f"{pa}·{sb}")
    return postprocess_name(translate_segment(name, m, keys))


def translate_segment(seg: str, m: dict[str, str], keys: list[str]) -> str:
    out = seg
    for cn in keys:
        if cn in out:
            out = out.replace(cn, m[cn])
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--target", type=Path, default=Path("game_config/auto_chess/buff.csv"))
    ap.add_argument("--dictionary", type=Path, default=Path("GAME_DICTIONARY.md"))
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    m, keys = merge_maps(args.dictionary)
    csv.field_size_limit(10**7)
    with args.target.open(newline="", encoding="utf-8-sig") as f:
        rows = list(csv.reader(f))

    leftover: list[tuple[str, str]] = []
    for i, row in enumerate(rows):
        if i < 3 or len(row) < 2:
            continue
        old = row[1]
        new = translate_name(old, m, keys)
        if CJK_RE.search(new):
            leftover.append((row[0], new))
        row[1] = new

    print("rows", len(rows), "leftover", len(leftover))
    for rid, nm in leftover[:35]:
        print(rid, nm[:90])
    if len(leftover) > 35:
        print("...")

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding="utf-8-sig") as f:
        csv.writer(f, quoting=csv.QUOTE_MINIMAL).writerows(rows)
    return 1 if leftover else 0


if __name__ == "__main__":
    raise SystemExit(main())
