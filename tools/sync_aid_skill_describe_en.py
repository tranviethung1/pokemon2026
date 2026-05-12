#!/usr/bin/env python3
"""Translate aid_skill_describe.csv text columns to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

TOKEN_MAP = {
    "【中毒Ⅰ】": "【Poison I】",
    "【中毒】": "【Poison】",
    "【速度Ⅱ】": "【Speed II】",
    "【石化】": "【Petrify】",
    "【沉默】": "【Silence】",
    "【反弹Ⅱ】": "【Reflect II】",
    "【助·恐惧Ⅰ】": "【Aid: Fear I】",
    "【助·恐惧Ⅱ】": "【Aid: Fear II】",
    "【助·掠杀】": "【Aid: Hunt】",
    "【冰冻Ⅰ】": "【Freeze I】",
    "【爆炎】": "【Blazing Flame】",
    "【花舞】": "【Flower Dance】",
    "【助·致盲Ⅰ】": "【Aid: Blind I】",
    "【助·致盲Ⅱ】": "【Aid: Blind II】",
    "【助·失衡】": "【Aid: Imbalance】",
    "【助·激怒】": "【Aid: Enrage】",
    "【助·幸运】": "【Aid: Luck】",
    "【感电Ⅰ】": "【Electrified I】",
    "【感电Ⅱ】": "【Electrified II】",
    "【感电】": "【Electrified】",
    "【助·蝎毒】": "【Aid: Scorpion Poison】",
    "【神速】": "【Extreme Speed】",
    "【圣火灼烧】": "【Sacred Flame Burn】",
    "【污泥鱼雷】": "【Sludge Torpedo】",
    "【污泥炸弹Ⅱ】": "【Sludge Bomb II】",
    "【魅惑】": "【Charm】",
    "【时间扰动】": "【Time Disturbance】",
    "【火焰獠牙】": "【Fire Fang】",
    "【伤害减免Ⅰ】": "【Damage Reduction I】",
    "【伤害减免Ⅱ】": "【Damage Reduction II】",
    "【净化Ⅰ】": "【Purify I】",
    "【助·淘汰】": "【Aid: Eliminate】",
    "【波导能量】": "【Aura Energy】",
    "【助·水流刃】": "【Aid: Aqua Blade】",
    "【反噬缠绕】": "【Backlash Bind】",
    "【流沙陷阱】": "【Quicksand Trap】",
    "【咬住】": "【Bite】",
    "【撕裂】": "【Rend】",
    "【易伤Ⅰ】": "【Vulnerability I】",
    "【易伤Ⅱ】": "【Vulnerability II】",
    "【磐石】": "【Boulder】",
    "【助·天恩】": "【Aid: Heavenly Grace】",
    "【时空加速】": "【Space-Time Acceleration】",
    "【助·蒸汽】": "【Aid: Steam】",
    "【鬼火】": "【Will-O-Wisp】",
    "【助·海刺龙】": "【Aid: Kingdra】",
    "【噩梦印记】": "【Nightmare Mark】",
    "【助·炎甲】": "【Aid: Flame Armor】",
    "【暴击Ⅰ】": "【Crit I】",
    "【暴击Ⅱ】": "【Crit II】",
    "【暴击伤害Ⅰ】": "【Crit Damage I】",
    "【暴击伤害Ⅱ】": "【Crit Damage II】",
    "【太阳羽衣】": "【Solar Feather Robe】",
    "【助·黄色旋律果】": "【Aid: Yellow Melody Fruit】",
    "【助·蓝色旋律果】": "【Aid: Blue Melody Fruit】",
    "【助·士兵】": "【Aid: Soldier】",
    "【助·守卫模式】": "【Aid: Guard Mode】",
    "【捏碎】": "【Crush】",
    "【助·活跃模式】": "【Aid: Active Mode】",
    "【助·生命诅咒】": "【Aid: Life Curse】",
    "【助·招架姿态】": "【Aid: Parry Stance】",
    "【助·记仇】": "【Aid: Grudge】",
    "【麻痹】": "【Paralysis】",
}

TYPE_MAP = {
    "普通": "Normal",
    "火": "Fire",
    "水": "Water",
    "草": "Grass",
    "电": "Electric",
    "冰": "Ice",
    "格斗": "Fighting",
    "斗": "Fighting",
    "毒": "Poison",
    "地面": "Ground",
    "地": "Ground",
    "飞行": "Flying",
    "飞": "Flying",
    "超能": "Psychic",
    "超": "Psychic",
    "虫": "Bug",
    "岩": "Rock",
    "幽灵": "Ghost",
    "鬼": "Ghost",
    "龙": "Dragon",
    "恶": "Dark",
    "钢": "Steel",
    "妖精": "Fairy",
    "妖": "Fairy",
}

PHRASE_REPLACEMENTS = [
    ("#L10#助战技能效果：#L0#", "#L10#Aid Skill Effect: #L0#"),
    ("#L10#助战技能效果：", "#L10#Aid Skill Effect: "),
    ("#L10#助战触发次数：#L0#", "#L10#Aid Trigger Count: #L0#"),
    ("#L10#助战触发条件：#L0#", "#L10#Aid Trigger Condition: #L0#"),
    ("开启助战技能", "Unlock Aid Skill"),
    ("造成", "deals "),
    ("助战次数上限+1", "Aid use limit +1"),
    ("伤害系数提升至", "Damage multiplier increased to "),
    ("系数提升至", "Multiplier increased to "),
    ("效果持续回合+1", "Effect duration +1 round"),
    ("持续回合+1", "duration +1 round"),
    ("持续回合数+1", "duration +1 round"),
    ("回合数提升为", "duration becomes "),
    ("回合提升至", "duration increased to "),
    ("持续时间变为", "duration becomes "),
    ("攻击目标+1", "Attack targets +1"),
    ("改为添加", "Changed to apply "),
    ("改为", "Changed to "),
    ("释放必杀技时触发", "triggers when an Ultimate is used"),
    ("精灵释放必杀技时触发", "triggers when a Pokemon uses an Ultimate"),
    ("精灵释放必杀技时", "when a Pokemon uses an Ultimate"),
    ("精灵释放必杀技时触发", "triggers when a Pokemon uses an Ultimate"),
    ("释放必杀技时", "when an Ultimate is used"),
    ("必杀技触发", "Ultimate trigger"),
    ("必杀技时触发", "Ultimate triggers"),
    ("必杀技时", "Ultimate"),
    ("大回合开始时触发", "triggers at the start of the major round"),
    ("第二回合起，", "from round 2, "),
    ("触发后冷却", "cooldown after triggering: "),
    ("助战技威力", "Aid skill power"),
    ("本次助战技能", "this Aid skill"),
    ("本次助战技", "this Aid skill"),
    ("助战攻击", "Aid attack"),
    ("助战", "Aid"),
    ("物理伤害", "Physical Damage"),
    ("特殊伤害", "Special Damage"),
    ("物攻", "P.ATK"),
    ("特攻", "SP.ATK"),
    ("物防", "P.DEF"),
    ("特防", "SP.DEF"),
    ("双攻", "dual ATK"),
    ("双防", "dual DEF"),
    ("速度", "Speed"),
    ("命中率", "Accuracy"),
    ("暴击率", "Crit Rate"),
    ("暴击伤害", "Crit Damage"),
    ("暴击抗性", "Crit Resistance"),
    ("闪避率", "Dodge Rate"),
    ("闪避", "Dodge"),
    ("治疗率", "Healing Rate"),
    ("受治疗率", "Healing Received"),
    ("控制率", "Control Rate"),
    ("免控率", "Control Immunity"),
    ("异常效果抵抗", "status resistance"),
    ("异常抗性", "status resistance"),
    ("负面抗性", "debuff resistance"),
    ("伤害加成", "Damage Bonus"),
    ("伤害减免", "Damage Reduction"),
    ("生命上限", "Max HP"),
    ("最大生命", "Max HP"),
    ("生命比例", "HP ratio"),
    ("血量最低", "lowest HP"),
    ("血量", "HP"),
    ("生命", "HP"),
    ("怒气恢复速度", "Rage recovery speed"),
    ("怒气", "Rage"),
    ("易伤", "vulnerability"),
    ("护盾", "shield"),
    ("禁疗", "healing disabled"),
    ("治疗量", "healing amount"),
    ("加成", "scaling"),
    ("最大血量", "Max HP"),
    ("每回合", "each round"),
    ("大回合", "major round"),
    ("回合", "round"),
    ("持续", "lasts "),
    ("效果", "effect"),
    ("概率", "chance"),
    ("几率", "chance"),
    ("伤害量", "damage amount"),
    ("伤害", "damage"),
    ("技能", "skill"),
    ("小技能", "minor skill"),
    ("主动技能", "active skill"),
    ("主动攻击", "active attack"),
    ("必杀技", "Ultimate"),
    ("攻击", "attack"),
    ("目标", "target"),
    ("精灵", "Pokemon"),
    ("角色", "character"),
    ("单位", "unit"),
    ("队友", "ally"),
    ("友方", "ally"),
    ("己方", "ally"),
    ("敌方", "enemy"),
    ("敌人", "enemy"),
    ("随机", "random "),
    ("全体", "all"),
    ("单体", "single target"),
    ("前排", "front row"),
    ("后排", "back row"),
    ("列排", "column"),
    ("十字范围", "cross area"),
    ("主目标", "main target"),
    ("所有目标", "all targets"),
    ("每个目标", "each target"),
    ("优先", "prioritizes "),
    ("最高", "highest"),
    ("最低", "lowest"),
    ("额外", "additional "),
    ("附带", "also adds "),
    ("附加", "also applies "),
    ("同时", "also "),
    ("并", "and "),
    ("为", "to "),
    ("给", "to "),
    ("对", "to "),
    ("添加", "apply "),
    ("获得", "gain "),
    ("提供", "grant "),
    ("提升", "increase "),
    ("提高", "increase "),
    ("降低", "reduce "),
    ("减少", "reduce "),
    ("恢复", "restore "),
    ("治疗", "heal "),
    ("偷取", "steal "),
    ("吸收", "absorb "),
    ("引爆", "detonate "),
    ("注入", "infuse "),
    ("放置", "place "),
    ("扩散", "spread "),
    ("驱散", "dispel "),
    ("抵挡", "block "),
    ("承受", "take "),
    ("继承", "inherit "),
    ("转移", "transfer "),
    ("转化", "convert "),
    ("均分", "evenly distribute "),
    ("叠加", "stack "),
    ("可叠加", "can stack "),
    ("最多", "up to "),
    ("上限", "limit "),
    ("不超过", "not exceeding "),
    ("无视", "ignore "),
    ("落空", "miss "),
    ("出拳", "punch "),
    ("解除", "removed"),
    ("立刻", "immediately "),
    ("反弹率", "reflect rate"),
    ("无效", "no effect"),
    ("弱化", "weaken "),
    ("抵御率", "block rate"),
    ("施加", "applied "),
    ("印记限", "per mark limit "),
    ("最大", "max "),
    ("减免", "reduction"),
    ("触发", "trigger "),
    ("释放", "cast "),
    ("身上", "on "),
    ("少", "fewer "),
    ("动", "action "),
    ("小", "minor "),
    ("数", "number "),
    ("可", "can "),
    ("有", "has "),
    ("值", "value"),
    ("助", "Aid"),
    ("被", "is "),
    ("在", "when "),
    ("生效前", "before taking effect"),
    ("成功时", "on success"),
    ("未添加成功时", "if applying fails"),
    ("行动前", "before action"),
    ("行动后", "after action"),
    ("受到", "when taking "),
    ("期间", "during "),
    ("自身", "self"),
    ("释放者", "caster"),
    ("召唤者", "summoner"),
    ("基拉祈", "Jirachi"),
    ("海刺龙", "Kingdra"),
    ("寒冰陷阱", "Ice Trap"),
    ("眩晕", "Stun"),
    ("石化", "Petrify"),
    ("神速", "Extreme Speed"),
    ("念力", "Psychic Power"),
    ("身上的灼烧", "burn on them"),
    ("毒元素", "Poison-element"),
    ("初始", "initial "),
    ("免伤", "damage immunity"),
    ("级负面", "level debuff"),
    ("秒杀", "instant-kill"),
    ("许愿灵签", "Wish Talisman"),
    ("不可超过", "not exceeding "),
    ("所有", "all "),
    ("两个", "two "),
    ("两", "two "),
    ("一", "one "),
    ("总量", "total amount"),
    ("主", "main "),
    ("本", "this "),
    ("每", "each "),
    ("未", "not "),
    ("如", "if "),
    ("若", "if "),
    ("已有", "already has "),
    ("已", "already "),
    ("将其进阶", "upgrade it "),
    ("将", "will "),
    ("低于", "below "),
    ("消耗", "consume "),
    ("以", "to "),
    ("作", "as "),
    ("其他", "other "),
    ("在该", "when that "),
    ("该", "that "),
    ("跟随", "follow "),
    ("随", "follow "),
    ("受", "takes "),
    ("代其", "in its place "),
    ("冷却增加", "cooldown increased by "),
    ("永久", "permanently "),
    ("先", "first "),
    ("手", "opponent"),
    ("减半", "halved"),
    ("拥有", "has "),
    ("属性", "stats"),
    ("来源进行", "source with "),
    ("状态", "status"),
    ("破隐", "after breaking stealth"),
    ("层", " stack(s) "),
    ("枚", " stack(s) "),
    ("名", " "),
    ("个", " "),
    ("位", " "),
    ("点", " "),
    ("次", " time(s)"),
    ("倍", "x"),
    ("变为", "becomes "),
    ("变", "becomes "),
    ("变成", "becomes "),
    ("增至", "increased to "),
    ("至", "to "),
    ("前", "before "),
    ("后", "after "),
    ("时", "when "),
    ("会", "will "),
    ("使", "make "),
    ("令", "make "),
    ("从", "from "),
    ("与", "and "),
    ("和", "and "),
    ("普通", "Normal"),
    ("火", "Fire"),
    ("水", "Water"),
    ("草", "Grass"),
    ("电", "Electric"),
    ("冰", "Ice"),
    ("格斗", "Fighting"),
    ("斗", "Fighting"),
    ("毒", "Poison"),
    ("地面", "Ground"),
    ("地", "Ground"),
    ("飞行", "Flying"),
    ("飞", "Flying"),
    ("超能", "Psychic"),
    ("超", "Psychic"),
    ("虫", "Bug"),
    ("岩", "Rock"),
    ("幽灵", "Ghost"),
    ("鬼", "Ghost"),
    ("龙", "Dragon"),
    ("恶", "Dark"),
    ("钢", "Steel"),
    ("妖精", "Fairy"),
    ("妖", "Fairy"),
    ("的", " "),
    ("添", "apply "),
    ("功", "success "),
    ("所", "all "),
    ("者", "caster "),
    ("行", "act "),
    ("不", "not "),
    ("过", "exceed "),
    ("灼烧", "Burn"),
    ("系", "-type"),
    ("拥", "has "),
    ("或", "or "),
    ("，", ", "),
    ("；", "; "),
    ("：", ": "),
    ("（", " ("),
    ("）", ") "),
    ("。", ". "),
    ("、", "/"),
    ("％", "%"),
]


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def translate_types(text: str) -> str:
    # Longest names first so 地面 is handled before 地.
    for source, target in sorted(TYPE_MAP.items(), key=lambda item: len(item[0]), reverse=True):
        text = text.replace(f"{source}系", f"{target}-type")
    return text


def translate_text(text: str) -> str:
    if not text:
        return text

    for source, target in TOKEN_MAP.items():
        text = text.replace(source, target)

    text = translate_types(text)

    for source, target in PHRASE_REPLACEMENTS:
        text = text.replace(source, target)

    # Light cleanup after phrase replacement.
    text = re.sub(r"\s+", " ", text)
    text = text.replace(" ,", ",").replace(" ;", ";").replace("( ", "(").replace(" )", ")")
    cleanup_replacements = [
        ("to enemyall", "to all enemies "),
        ("to enemycross area", "to enemies in a cross area "),
        ("to enemycolumn", "to enemy column "),
        ("to enemyfront row", "to enemy front row "),
        ("to enemyback row", "to enemy back row "),
        ("to enemysingle target", "to a single enemy "),
        ("allally", "all allies "),
        ("allyapply", "ally apply "),
        ("enemyapply", "enemy apply "),
        ("targetapply", "target apply "),
        ("Pokemon释放", "Pokemon uses "),
        ("Pokemontriggers when an Ultimate is used", "triggers when a Pokemon uses an Ultimate"),
        ("Pokemonuses", "Pokemon uses"),
        ("Fire-typewhen a Pokemon uses an Ultimate", "triggers when a Fire-type Pokemon uses an Ultimate"),
        ("Electric-typePokemontriggers when an Ultimate is used", "triggers when an Electric-type Pokemon uses an Ultimate"),
        ("Electric-typeUltimate triggers", "triggers when an Electric-type Ultimate is used"),
        ("Ground/Flying-typeUltimate triggers", "triggers when a Ground/Flying-type Ultimate is used"),
        ("Bug/Steel-typeUltimate triggers", "triggers when a Bug/Steel-type Ultimate is used"),
        ("Fire-typeally", "Fire-type ally"),
        ("Electric-typeally", "Electric-type ally"),
        ("Ice-typeally", "Ice-type ally"),
        ("Grass-typeally", "Grass-type ally"),
        ("Steel-typeally", "Steel-type ally"),
        ("targetalready", "target already"),
        ("targeteach", "target each"),
        ("targetgain", "target gain"),
        ("target apply", "target apply"),
        ("columnrandom", "column random"),
        ("effectbecomes", "effect becomes"),
        ("roundnumber", "round count"),
        ("time(s)act action after", "time(s) after acting"),
        ("Poison-elementdamage", "Poison-element damage"),
        ("attackrandom", "attack random"),
        ("enemytarget", "enemy target"),
        ("time(s)deals", "time(s), deals"),
        ("chanceapply", "chance to apply "),
        ("attackadditional", "attack additionally"),
        ("Electric-typevulnerability", "Electric-type vulnerability "),
        ("Fire-typevulnerability", "Fire-type vulnerability "),
        ("Dark-typevulnerability", "Dark-type vulnerability "),
        ("follow after", "then"),
        ("enemy25%", "enemy with a 25%"),
        ("enemy15%", "enemy with a 15%"),
        ("cast caster", "caster"),
        ("all has enemyon Burn", "all enemies with Burn"),
        ("all has enemyon", "all enemies with"),
    ]
    for source, target in cleanup_replacements:
        text = text.replace(source, target)
    text = re.sub(r"(\d+)round", r"\1 round", text)
    text = re.sub(r"(\d+)time\(s\)", r"\1 time(s)", text)
    text = re.sub(r"(\d+)%chance", r"\1% chance", text)
    text = re.sub(r"(\d+)([A-Za-z-]+type)", r"\1 \2", text)
    text = re.sub(r"(\d+)%(Electric|Fire|Water|Grass|Dark|Poison|Rock|Ice|Ground|Steel|Fairy|Psychic|Fighting|Bug|Flying|Dragon|Ghost)-type", r"\1% \2-type", text)
    text = re.sub(r"(【[^】]+】)(\d+) round", r"\1 for \2 round", text)
    text = re.sub(r"(\d+) round(【[^】]+】)", r"\1-round \2", text)
    text = re.sub(r"\bfor ([2-9]|1[0-9]) round\b", r"for \1 rounds", text)
    text = text.replace("to target apply", "applies to target")
    text = text.replace("to all allies apply", "applies to all allies")
    text = text.replace("to allally apply", "applies to all allies")
    text = text.replace("to all enemies apply", "applies to all enemies")
    text = text.replace("to 1 Fire-type ally apply", "applies to 1 Fire-type ally")
    text = text.replace("to 2 Fire-type ally apply", "applies to 2 Fire-type allies")
    text = text.replace("to 1 Electric-type ally apply", "applies to 1 Electric-type ally")
    text = text.replace("to 2 Electric-type ally apply", "applies to 2 Electric-type allies")
    text = text.replace("to 1 Ice-type ally apply", "applies to 1 Ice-type ally")
    text = text.replace("to 2 Ice-type ally apply", "applies to 2 Ice-type allies")
    text = text.replace("to 1 Grass-type ally apply", "applies to 1 Grass-type ally")
    text = text.replace("to 2 Grass-type ally apply", "applies to 2 Grass-type allies")
    text = text.replace("to 1 Steel-type ally apply", "applies to 1 Steel-type ally")
    text = text.replace("to 2 Steel-type ally apply", "applies to 2 Steel-type allies")
    text = re.sub(r"(ally|allies) (【[^】]+】)", r"\1 with \2", text)
    text = re.sub(r"target (\d+ stack\(s\))", r"target with \1", text)
    text = text.replace("  ", " ")
    text = text.replace("all enemy", "all enemies")
    text = text.replace("enemy all", "all enemies")
    text = text.replace("ally all", "all allies")
    return text.strip()


def sync(args: argparse.Namespace) -> int:
    lineterminator = detect_lineterminator(args.target)

    with args.target.open(newline="", encoding="utf-8") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    columns = ["describes", "describeStage", "triggerTimes", "triggerCondition", "keyWords"]
    indexes = {column: header.index(column) for column in columns}
    updates = {column: 0 for column in columns}
    unresolved: list[tuple[int, str, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue
        for column, index in indexes.items():
            if args.force or has_cjk(row[index]):
                translated = translate_text(row[index])
                if translated != row[index]:
                    row[index] = translated
                    updates[column] += 1

        remaining = {column: row[index] for column, index in indexes.items() if has_cjk(row[index])}
        if remaining:
            unresolved.append((line_number, row[0], next(iter(remaining)), next(iter(remaining.values()))))

    print(f"rows={sum(1 for row in rows[3:] if row)}")
    for column in columns:
        print(f"{column}_updates={updates[column]}")
    print(f"remaining_cjk_rows={len(unresolved)}")
    for line_number, row_id, column, value in unresolved[:40]:
        print(f"unresolved line={line_number} id={row_id} column={column} value={value[:180]!r}")

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", type=Path, default=Path("game_config/aid/aid_skill_describe.csv"))
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--force", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
