# -*- coding: utf-8 -*-
"""Translate game_config/brave_challenge/badge.csv name/desc columns to English.

  python3 tools/scripts/sync_brave_challenge_badge_en.py [--dry-run]

Parses Pokémon CN→EN from GAME_DICTIONARY.md §4, merges badge stem names,
applies phrase gloss for descriptions, then writes CSV (unless --dry-run).
"""

from __future__ import annotations

import argparse
import csv
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BADGE_CSV = ROOT / "game_config/brave_challenge/badge.csv"
DICT_MD = ROOT / "GAME_DICTIONARY.md"

CJK_RE = re.compile(r"[\u3400-\u9fff]")

# 172 unique stems from badge.csv — aligned with export_brave_challenge_badge_en NAME_BASE
STEM_EN: dict[str, str] = {
    "UB：刺针": "UB: Barbed Needle",
    "不动如山": "Sturdy",
    "不屈之心": "Steadfast",
    "伤害强化": "Damage Boost",
    "伤害强化(强)": "Enhanced Damage Boost",
    "余烬怨念": "Lingering Spite",
    "储水": "Water Absorb",
    "催化毒液": "Corrosive Venom",
    "催眠反击": "Hypnotic Riposte",
    "兆级电压": "Teravolt",
    "光隐": "Light Conceal",
    "免伤强化": "Damage Reduction Boost",
    "免伤强化(强)": "Enhanced Damage Reduction Boost",
    "入梦": "Sweet Dreams",
    "冰冻之躯": "Ice Body",
    "冰封世界": "Frozen Domain",
    "冰霜之怒": "Frost Wrath",
    "冰霜反弹": "Frost Rebuke",
    "冰霜封印": "Frost Seal",
    "冰霜觉醒": "Frost Awakening",
    "凤王涅盘": "Ho-Oh Rebirth",
    "凶暴吞噬": "Savage Devour",
    "刚骨之气": "Iron Bone Spirit",
    "刺铠": "Barbed Armor",
    "剑·盾": "Sword & Shield",
    "勇猛之心": "Dauntless Heart",
    "双倍多多碎碎冰": "Double Shaved Ice",
    "双生魅影": "Twin Mirage",
    "双防强化": "DEF & SPDEF Boost",
    "双防强化(强)": "Enhanced DEF & SPDEF Boost",
    "反弹强化": "Reflect Boost",
    "反弹强化(强)": "Enhanced Reflect Boost",
    "叶刃": "Leaf Blade",
    "合体之谜I": "Fusion Riddle I",
    "合体之谜II": "Fusion Riddle II",
    "合纵连横": "Coalition Tactics",
    "吸血强化": "Life Drain Boost",
    "吸血强化(强)": "Enhanced Life Drain Boost",
    "唱反调": "Contrary",
    "噪声": "Uproar",
    "回怒强化": "Rage Regen Boost",
    "回怒强化(强)": "Enhanced Rage Regen Boost",
    "回音察觉": "Echo Sight",
    "圣鸟守护": "Sacred Avian Guard",
    "坚硬岩石": "Solid Rock",
    "大地之怒": "Land's Wrath",
    "天空之花": "Sky Bloom",
    "天空霸者": "Sky Tyrant",
    "奇迹之眼": "Miracle Eye",
    "女王的威严": "Queenly Majesty",
    "守护之心": "Guardian Heart",
    "宝石之心": "Gem Heart",
    "寒冰身躯": "Frost Body",
    "屠龙": "Dragon Slayer",
    "山崩地裂": "Earthquake",
    "岩崩": "Rock Slide",
    "岩石守备": "Rock Bulwark",
    "引燃": "Flash Fire",
    "强力恢复": "Mighty Recovery",
    "德尔塔气流": "Delta Stream",
    "心灵致动": "Telekinesis",
    "必杀强化": "Ultimate Boost",
    "必杀强化(强)": "Enhanced Ultimate Boost",
    "必杀抗性强化": "Ultimate Resist Boost",
    "必杀抗性强化(强)": "Enhanced Ultimate Resist Boost",
    "忍耐": "Endure",
    "快龙": "Dragonite",
    "念力控制": "Mind Lock",
    "恐惧": "Dread",
    "恢复通用": "Recovery (General)",
    "恢复通用(强)": "Recovery (Strong)",
    "惩戒光轮": "Judgment Wheel",
    "感恩之心": "Gratitude",
    "慢启动": "Slow Start",
    "扭转空间": "Spatial Twist",
    "抗暴强化": "Crit Resist Boost",
    "抗暴强化(强)": "Enhanced Crit Resist Boost",
    "招募队友": "Recruit Ally",
    "控制强化": "Control Boost",
    "控制强化(强)": "Enhanced Control Boost",
    "控制通用": "Control (General)",
    "控制通用(强)": "Control (Strong)",
    "撕裂": "Rend",
    "攻击强化": "Attack Boost",
    "攻击强化(强)": "Enhanced Attack Boost",
    "攻击通用": "Attack (General)",
    "攻击通用(强)": "Attack (Strong)",
    "时光间隙": "Temporal Rift",
    "时间轮回": "Time Spiral",
    "星夜祈语": "Nocturnal Wish",
    "暗黑之牙": "Dark Fang",
    "暴击强化": "Crit Chance Boost",
    "暴击强化(强)": "Enhanced Crit Chance Boost",
    "月相光环": "Moonphase Halo",
    "梦幻": "Mew",
    "正义之心": "Justified",
    "毅力": "Guts",
    "毒刺碉堡": "Poison Barb Bastion",
    "水影分身之术": "Aqua Clone Jutsu",
    "永久徽章": "Permanent Badge",
    "沙之力": "Sand Force",
    "治愈芬芳": "Healing Aroma",
    "治疗强化": "Healing Boost",
    "治疗强化(强)": "Enhanced Healing Boost",
    "浊流": "Muddy Water",
    "海洋庇护": "Ocean Aegis",
    "液态金属": "Liquid Metal",
    "深寒领域": "Deep Freeze",
    "深渊黑洞": "Abyssal Void",
    "混迷利刃": "Bewildering Edge",
    "潮汐之力": "Tidal Force",
    "激流": "Torrent",
    "火暴": "Blazing Rush",
    "火焰穿透": "Flame Pierce",
    "火神庇护": "Volcanic Shelter",
    "火龙之怒": "Dragonfire Wrath",
    "炎暴": "Burst Flame",
    "燃尽": "Burn Up",
    "燃爆": "Blast Combust",
    "狂暴": "Rampage",
    "狙射": "Sharpshooting",
    "猛火": "Blaze",
    "生芽": "Sprouting",
    "电磁力": "Electrodynamic Field",
    "电能激发": "Voltage Surge",
    "盗梦": "Dream Thief",
    "真刚之心": "Steelheart",
    "石之守护": "Stone Bastion",
    "祝福": "Blessing",
    "神秘护身": "Mysterious Barrier",
    "空间扭曲": "Spatial Warp",
    "空间隐匿": "Dimensional Hide",
    "精神强念": "Psychic",
    "能源制造": "Power Forge",
    "自我再生": "Recover",
    "花之舞者": "Petal Dancer",
    "花束种子": "Flower Seed",
    "萌": "Charm",
    "藤蔓守护": "Vine Mantle",
    "虫之共鸣": "Bug Resonance",
    "虫之预感": "Swarm",
    "蛮力": "Superpower",
    "螳螂在后": "Striker's Gambit",
    "被动激活": "Passive Trigger",
    "贪吃鬼": "Gluttony",
    "超梦": "Mewtwo",
    "超级幸运": "Super Luck",
    "超频模式": "Overclock",
    "辅助通用": "Support (General)",
    "辅助通用(强)": "Support (Strong)",
    "迅捷": "Nimble",
    "远古血脉": "Primordial Lineage",
    "追打": "Pursuit",
    "逃跑": "Run Away",
    "速度强化": "SPD Boost",
    "速度强化(强)": "Enhanced SPD Boost",
    "钢甲": "Steel Aegis",
    "钢铁反击": "Steel Riposte",
    "钢铁吸收": "Steel Sink",
    "闪电": "Lightning Strike",
    "防御通用": "Defense (General)",
    "防御通用(强)": "Defense (Strong)",
    "隐匿空间": "Hidden Realm",
    "雷霆之力": "Thunderforce",
    "青焰火墙": "Azure Flame Wall",
    "高压电": "High Voltage",
    "鬼影重重": "Phantasmal Mass",
    "魔之心": "Arcane Heart",
    "魔法守护": "Magic Guard",
    "黏泡泡": "Gooey Bubbles",
    "龙之威压": "Dragon's Pressure",
    "龙之怒": "Dragon Wrath",
}

MODE_DESC_EN: dict[str, str] = {
    "该玩法内己方全体反弹率提升20%": "In this mode, all allies gain +20% Reflect rate.",
    "该玩法内己方全体反弹率提升5%": "In this mode, all allies gain +5% Reflect rate.",
    "该玩法内己方全体吸血率提升20%": "In this mode, all allies gain +20% Life Steal.",
    "该玩法内己方全体吸血率提升5%": "In this mode, all allies gain +5% Life Steal.",
    "该玩法内己方全体回怒速度提升30%": "In this mode, all allies gain +30% Rage recovery speed.",
    "该玩法内己方全体回怒速度提升5%": "In this mode, all allies gain +5% Rage recovery speed.",
    "该玩法内己方全体控制率提升15%": "In this mode, all allies gain +15% Control rate.",
    "该玩法内己方全体控制率提升5%": "In this mode, all allies gain +5% Control rate.",
    "该玩法内己方全体治疗效果提升40%": "In this mode, all allies gain +40% healing received.",
    "该玩法内己方全体治疗效果提升5%": "In this mode, all allies gain +5% healing received.",
    "该玩法内己方全体速度提升25%": "In this mode, all allies gain +25% Speed.",
    "该玩法内己方全体速度提升5%": "In this mode, all allies gain +5% Speed.",
    "该玩法内己方前排伤害减免提升10%": "In this mode, allied front row gains +10% damage reduction.",
    "该玩法内己方前排伤害减免提升20%": "In this mode, allied front row gains +20% damage reduction.",
    "该玩法内己方前排双防提升10%": "In this mode, allied front row gains +10% P.DEF & S.DEF.",
    "该玩法内己方前排双防提升20%": "In this mode, allied front row gains +20% P.DEF & S.DEF.",
    "该玩法内己方前排必杀抗性提升10%": "In this mode, allied front row gains +10% Ultimate Resistance.",
    "该玩法内己方前排必杀抗性提升20%": "In this mode, allied front row gains +20% Ultimate Resistance.",
    "该玩法内己方前排抗爆率提升10%": "In this mode, allied front row gains +10% Crit Resistance.",
    "该玩法内己方前排抗爆率提升20%": "In this mode, allied front row gains +20% Crit Resistance.",
    "该玩法内己方后排伤害加成提升10%": "In this mode, allied back row gains +10% damage bonus.",
    "该玩法内己方后排伤害加成提升20%": "In this mode, allied back row gains +20% damage bonus.",
    "该玩法内己方后排双攻提升10%": "In this mode, allied back row gains +10% P.ATK & S.ATK.",
    "该玩法内己方后排双攻提升20%": "In this mode, allied back row gains +20% P.ATK & S.ATK.",
    "该玩法内己方后排必杀伤害加成10%": "In this mode, allied back row gains +10% Ultimate damage.",
    "该玩法内己方后排必杀伤害加成20%": "In this mode, allied back row gains +20% Ultimate damage.",
    "该玩法内己方后排暴击率提升10%": "In this mode, allied back row gains +10% Crit Rate.",
    "该玩法内己方后排暴击率提升20%": "In this mode, allied back row gains +20% Crit Rate.",
}

EXACT_DESC_EN: dict[str, str] = {
    "这是一个神秘的徽章": "This is a mysterious badge.",
    "己方全体精灵免控率和伤害加成提升10%~30%": "All allies gain +10%–30% control immunity and damage bonus.",
    "己方全体精灵免控率和伤害加成提升10％~30％": "All allies gain +10%–30% control immunity and damage bonus.",
    "每个大回合结束，己方随机一个精灵的血量和怒气获得恢复": "At the end of each mega-turn, a random ally restores HP and Rage.",
}

EXTRA_SPECIES: dict[str, str] = {
    "龙系精灵": "Dragon-type Pokémon",
    "坚盾剑怪·盾牌": "Aegislash (Shield Forme)",
    "谢米·天空": "Shaymin (Sky Forme)",
    "超级巨沼怪": "Mega Swampert",
    "超级暴雪王": "Mega Abomasnow",
    "小智版皮卡丘": "Ash's Pikachu",
}

MARK_PERMANENT_ZH = "【永久徽章】"
MARK_PERMANENT_EN = "【Permanent Badge】"
TAIL_MARKER = "#C0x5B545B#"


def load_pokemon_cn_en(md: Path) -> dict[str, str]:
    text = md.read_text(encoding="utf-8")
    pat = re.compile(r"^\|\s*\d+\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|", re.M)
    out: dict[str, str] = {}
    for m in pat.finditer(text):
        cn, en = m.group(1).strip(), m.group(2).strip()
        if cn and en and not cn.startswith(":"):
            out.setdefault(cn, en)
    # appendix-style rows (no leading ID)
    for line in text.splitlines():
        m = re.match(r"^\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*$", line)
        if not m:
            continue
        a, b, c = (x.strip() for x in m.groups())
        if re.match(r"^\d+$", a) or a.startswith(":---"):
            continue
        if CJK_RE.search(a) and b and not CJK_RE.search(b):
            out.setdefault(a, b)
        if CJK_RE.search(a) and c and not CJK_RE.search(c) and a not in out:
            out.setdefault(a, c)
    out.update(EXTRA_SPECIES)
    return out


POKEMON_ORDER: tuple[str, ...] = ()


def _species_replace_order(cn2en: dict[str, str]) -> tuple[str, ...]:
    return tuple(sorted(cn2en.keys(), key=len, reverse=True))


def translate_name(raw: str) -> str:
    s = raw.strip()
    if not s or not CJK_RE.search(s):
        return s
    if s.startswith("MAX·"):
        stem = s[4:]
        base = STEM_EN.get(stem) or stem
        return f"MAX · {base}"
    return STEM_EN.get(s, s)


def _replace_species_fragment(text: str, cn2en: dict[str, str]) -> str:
    for zh in POKEMON_ORDER:
        if zh in text:
            text = text.replace(zh, cn2en[zh])
    return text


def _translate_recruit_line(s: str, cn2en: dict[str, str]) -> str:
    if not s.startswith("招募"):
        return s
    inner_m = re.search(r"#L10#(.+?)#L0#", s)
    if inner_m:
        inner = inner_m.group(1)
        inner_en = _replace_species_fragment(inner, cn2en)
        inner_en = re.sub(r"\((\d+)星\)", r"(\1★)", inner_en)
        inner_en = inner_en.replace("，", ", ")
        return s[: inner_m.start(1)] + inner_en + s[inner_m.end(1) :]
    rest = s[2:]
    rest = _replace_species_fragment(rest, cn2en)
    rest = re.sub(r"\((\d+)星\)", r"(\1★)", rest)
    rest = rest.replace("，", ", ")
    return "Recruit " + rest


_PHRASES_RAW: dict[str, str] = {
    MARK_PERMANENT_ZH: MARK_PERMANENT_EN,
    "【寄生种子】": "【Leech Seed】",
    "【太阳羽衣】": "【Solar Cloak】",
    "【博士面具】": "【Professor's Mask】",
    "【强力手环】": "【Power Band】",
    "【现形镜】": "【Reveal Glass】",
    "【苹果】": "【Apple】",
    "在场时有一定概率触发：": ", while present, may proc: ",
    "在场时该效果必然触发": ", while present, this effect is guaranteed.",
    ",该效果必然触发": ", guaranteed while tied Pokémon is present.",
    "有一定概率触发": "may randomly trigger:",
    "真实伤害抗性": "true damage resistance",
    "真实伤害减免": "true damage mitigation",
    "最终伤害减免": "final damage mitigation",
    "最终伤害加成": "final damage bonus",
    "伤害减免": "damage reduction",
    "伤害加成": "damage bonus",
    "必杀伤害": "Ultimate damage",
    "必杀抗性": "Ultimate Resistance",
    "必杀技能": "Ultimate Skill",
    "必杀技": "Ultimate",
    "主动技能": "Active Skill",
    "小技能冷却缩减": "Basic Skill cooldown reduction",
    "小技能冷却": "Basic Skill cooldown",
    "小技能": "Basic Skill",
    "额外提升其被动技能等级：30级": "Passive skill level +30.",
    "额外提升其被动技能等级：60级": "Passive skill level +60.",
    "额外提升其所有技能等级：60级": "All skill levels +60.",
    "额外提升其所有技能等级：30级": "All skill levels +30.",
    "使用技能时": "When using a skill,",
    "使用技能后": "After using a skill,",
    "使用技能": "uses a skill",
    "友方随机3个单位": "3 random allies",
    "友方随机": "a random ally",
    "友方全体单位": "all allies",
    "友方全体": "all allies",
    "友方": "allies",
    "敌方全体": "all enemies",
    "敌方每个单位": "each enemy",
    "敌方随机": "a random enemy",
    "敌方": "enemies",
    "己方": "allied",
    "己方双攻最高精灵": "the ally with highest combined ATK",
    "己方前排": "allied front row",
    "己方后排": "allied back row",
    "己方全体": "all allies",
    "己方随机": "a random ally",
    "己方血量最低单位": "the lowest-HP ally",
    "每个大回合结束": "At the end of each mega-turn,",
    "每个大回合首个释放必杀技的己方精灵": "The first ally to use an Ultimate each mega-turn",
    "每个大回合": "each mega-turn",
    "每个大回合开始前": "Before each mega-turn,",
    "大回合结束": "mega-turn ends",
    "大回合": "mega-turn",
    "入场时": "On entry,",
    "入场前3回合": "For the first 3 mega-turns after entry,",
    "入场": "On entry",
    "战斗中首次释放技能": "The first skill used in battle",
    "战斗中": "During battle,",
    "战斗前3回合": "For the first 3 mega-turns,",
    "战斗第4回合开始": "From mega-turn 4 onward,",
    "首回合": "On the first mega-turn,",
    "每次攻击前": "Before each attack,",
    "每次行动": "Each action,",
    "每次行动后": "After each action,",
    "击杀目标后": "After KOing a target,",
    "击杀单位时": "When KOing a unit,",
    "击杀单位": "KO a unit",
    "击杀": "KO",
    "血量比例越低": "the lower its HP ratio,",
    "血量比例越高": "the higher its HP ratio,",
    "血量越低": "the lower its HP,",
    "血量越高": "the higher its HP,",
    "血量": "HP",
    "怒气": "Rage",
    "满怒气": "full Rage",
    "回怒速度": "Rage recovery speed",
    "控制率": "Control rate",
    "控制中": "controlled",
    "受控制": "controlled",
    "缠绕": "Bind",
    "隐身": "Stealth",
    "灼烧": "Burn",
    "致盲": "Blind",
    "麻痹": "Paralysis",
    "易伤": "Vulnerability",
    "护盾": "Shield",
    "恢复": "restore",
    "回血": "heal",
    "复活": "revive",
    "死亡": "faint",
    "阵亡": "faint",
    "永久获得": "permanently gains",
    "永久提升": "permanently gains",
    "临时提升": "temporarily gains",
    "额外提升": "additionally gains",
    "额外造成": "deals additional",
    "额外": "additionally",
    "提升": "increases",
    "降低": "reduces",
    "无视": "ignores",
    "概率": "chance",
    "回合": "turn(s)",
    "行动回合": "action turn(s)",
    "个行动回合": " action turn(s)",
    "个大回合": " mega-turn(s)",
    "层": " stack(s)",
    "可叠加": "stacks",
    "不可连续触发": "cannot trigger twice in a row",
    "必然": "always",
    "随机": "random",
    "全体": "all units",
    "前排": "front row",
    "后排": "back row",
    "精灵": "Pokémon",
    "单位": "unit",
    "目标": "target",
    "自身": "self",
    "暴击率": "Crit Rate",
    "暴击伤害": "crit damage",
    "暴击": "crit",
    "抗暴率": "Crit Resistance",
    "双防": "P.DEF & S.DEF",
    "双攻": "P.ATK & S.ATK",
    "双攻之和": "combined ATK",
    "真实伤害": "true damage",
    "治疗效果": "healing",
    "吸血率": "Life Steal",
    "反弹率": "Reflect rate",
    "免控率": "control immunity",
    "速度": "Speed",
    "闪避率": "Dodge",
    "抵御": "Block",
    "触发": "triggers",
    "获得": "gains",
    "添加": "applies",
    "附带": "applies",
    "造成": "deals",
    "恢复": "restores",
    "回复": "restores",
    "生命值的血量": "of max HP as HP",
    "生命值": "HP",
    "并": " and ",
    "或": " or ",
    "与": " and ",
    "；": "; ",
    "，": ", ",
    "。": ". ",
    "（": " (",
    "）": ") ",
    "：": ": ",
}

_PHRASES: tuple[tuple[str, str], ...] = tuple(
    sorted(((a, b) for a, b in _PHRASES_RAW.items() if len(a) > 1), key=lambda x: -len(x[0]))
)

EXCLUSIVE_OPEN = re.compile(r"【([^】]+)】")


def _translate_exclusive_tags(s: str, cn2en: dict[str, str]) -> str:
    def repl(m: re.Match[str]) -> str:
        inner = m.group(1)
        if inner.endswith("专属"):
            stem = inner[:-2]
            en = cn2en.get(stem) or _replace_species_fragment(stem, cn2en)
            return f"【{en} Exclusive】"
        return m.group(0)

    return EXCLUSIVE_OPEN.sub(repl, s)


def translate_desc(raw: str, cn2en: dict[str, str]) -> str:
    s = raw.strip()
    if not s:
        return s
    if s in MODE_DESC_EN:
        return MODE_DESC_EN[s]
    if s in EXACT_DESC_EN:
        return EXACT_DESC_EN[s]
    if s.startswith("招募"):
        return _translate_recruit_line(s, cn2en)
    if s.startswith("该玩法内"):
        return MODE_DESC_EN.get(s, s)

    if s.startswith("#C") and TAIL_MARKER in s:
        head, sep, tail = s.partition(TAIL_MARKER)
        tail = tail.strip()
        tail = MARK_PERMANENT_ZH.join(
            translate_desc(part, cn2en) if CJK_RE.search(part) else part
            for part in tail.split(MARK_PERMANENT_ZH)
        )
        tail = _translate_exclusive_tags(tail, cn2en)
        for zh in POKEMON_ORDER:
            if zh in tail:
                tail = tail.replace(zh, cn2en[zh])
        for zh, en in _PHRASES:
            if zh in tail:
                tail = tail.replace(zh, en)
        tail = re.sub(r"\s+", " ", tail).strip()
        return head + sep + tail

    s2 = _translate_exclusive_tags(s, cn2en)
    for zh in POKEMON_ORDER:
        if zh in s2:
            s2 = s2.replace(zh, cn2en[zh])
    for zh, en in _PHRASES:
        if zh in s2:
            s2 = s2.replace(zh, en)
    s2 = re.sub(r"\s+", " ", s2).strip()
    return s2


def main() -> None:
    global POKEMON_ORDER
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    cn2en = load_pokemon_cn_en(DICT_MD)
    POKEMON_ORDER = _species_replace_order(cn2en)

    with BADGE_CSV.open(encoding="utf-8-sig", newline="") as f:
        rows = list(csv.reader(f))
    ni, di = rows[0].index("name"), rows[0].index("desc")
    updates = 0
    leaky: list[tuple[int, str, str]] = []

    for idx, row in enumerate(rows):
        if idx < 3:
            continue
        if len(row) <= max(ni, di):
            continue
        on, od = row[ni], row[di]
        nn = translate_name(on)
        nd = translate_desc(od, cn2en)
        if nn != on or nd != od:
            updates += 1
        if CJK_RE.search(nn) or CJK_RE.search(nd):
            leaky.append((idx + 1, nn, nd))
        row[ni], row[di] = nn, nd

    print("rows touched:", updates)
    print("rows with remaining CJK:", len(leaky))
    for line_no, nn, nd in leaky[:25]:
        print(f"  L{line_no} name={nn[:40]!r} desc={nd[:80]!r}")

    leak_path = ROOT / "tools/data/brave_challenge_badge_leaks.json"
    if leaky:
        leak_path.parent.mkdir(parents=True, exist_ok=True)
        leak_path.write_text(
            json.dumps(
                [{"line": ln, "name": n, "desc": d} for ln, n, d in leaky],
                ensure_ascii=False,
                indent=2,
            )
            + "\n",
            encoding="utf-8",
        )
        print("wrote", leak_path, "with", len(leaky), "entries")

    if not args.dry_run and not leaky:
        with BADGE_CSV.open("w", encoding="utf-8-sig", newline="") as f:
            csv.writer(f).writerows(rows)
        print("wrote", BADGE_CSV)
    elif not args.dry_run and leaky:
        print("CSV not written: fix leaks first or extend EXACT_DESC_EN / phrases.")


if __name__ == "__main__":
    main()
