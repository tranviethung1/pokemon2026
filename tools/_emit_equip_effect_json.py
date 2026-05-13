#!/usr/bin/env python3
"""Writes tools/equip_card_effect_en.json (literal \\n matches game CSV)."""
import csv
import json
from pathlib import Path

# CSV stores line breaks as two chars backslash + n, not ASCII newline.
NL = chr(92) + "n"

# Chinese effect text -> English (【keywords】 match key_words.csv English names).
CARD_EFFECT_EN: dict[str, str] = {
    "": "",
    "【先机】/【濒死】：己方全体获得【隐匿】": "【First Strike】/【Near Death】: All allied Pokémon gain 【Stealth】",
    "【先机】：【晕眩】自身，【晕眩】结束后获得【强攻】、【突袭】、【贯穿】": "【First Strike】: 【Stun】 self; when 【Stun】 ends, gain 【Brute Force】, 【Ambush】, and 【Cleave】",
    "【先机】：触发1次相邻精灵的【登场】效果": "【First Strike】: Trigger 【On Play】 once for an adjacent Pokémon",
    "【击破】：己方精灵永久+3攻击，永久+3生命": "【Break】: Your Pokémon permanently gain +3 Attack and +3 HP",
    "【坚甲】": "【Fortified Armor】",
    "【失败】：令装备者返回手牌": "【On Defeat】: Return the holder to hand",
    "【失败】：获得1张随机事件卡（最多生效10次）": "【On Defeat】: Gain 1 random event card (max 10 triggers)",
    "【失败】：获得1张随机装备卡": "【On Defeat】: Gain 1 random gear card",
    f"【守卫】{NL}准备阶段结束时自身永久+3护甲": f"【Guard】{NL}At prep phase end, permanently gain +3 Armor",
    f"【守卫】{NL}准备阶段结束，自身永久+4护甲": f"【Guard】{NL}At prep phase end, permanently gain +4 Armor",
    f"【守卫】{NL}受到攻击后，+8攻击，+8护甲": f"【Guard】{NL}After being attacked, +8 Attack and +8 Armor",
    f"【幻影】{NL}【濒死】：使随机敌方获得此装备的效果": f"【Phantom】{NL}【Near Death】: A random enemy gains this item's effect",
    "【应激】：永久+2攻击，永久+2生命": "【Reactive】: Permanently +2 Attack and +2 HP",
    "【强攻】": "【Brute Force】",
    f"【强攻】{NL}【先机】：获得1次行动": f"【Brute Force】{NL}【First Strike】: Gain 1 action",
    f"【强攻】{NL}【击破】：永久+3攻击，永久+3生命": f"【Brute Force】{NL}【Break】: Permanently +3 Attack and +3 HP",
    "【护盾】": "【Shield】",
    f"【护盾】{NL}【守卫】{NL}【盾反】": f"【Shield】{NL}【Guard】{NL}【Shield Counter】",
    "【暴击】": "【Critical Hit】",
    f"【暴击】{NL}【暴击】期间获得【突袭】": f"【Critical Hit】{NL}While 【Critical Hit】 is active, gain 【Ambush】",
    f"【流水】{NL}自身触发或受到【流水】效果时，永久+1生命": f"【Flow】{NL}When you trigger or are affected by 【Flow】, permanently +1 HP",
    "【溅射】": "【Splash】",
    "【濒死】：令手牌随机精灵入场（不触发【登场】效果）": "【Near Death】: Play a random Pokémon from hand (does not trigger 【On Play】)",
    "【濒死】：对随机敌人造成10点技能伤害": "【Near Death】: Deal 10 skill damage to a random enemy",
    "【濒死】：获得1个金币": "【Near Death】: Gain 1 gold",
    "【濒死】：解除伤害来源的所有正面【状态】": "【Near Death】: Clear all positive 【Status】 from the damage source",
    "【特技】：【召唤】1个自身的【幻影】": "【Special Technique】: 【Summon】 one of your 【Phantom】 copies",
    "【特技】：偷取随机敌方5点攻击和5点生命": "【Special Technique】: Steal 5 Attack and 5 HP from a random enemy",
    f"【特技】：对全体敌方造成1点【破甲】{NL}【光环】：场上单位的【破甲】不会自动清除": f"【Special Technique】: Deal 1 【Armor Shred】 to all enemies{NL}【Aura】: 【Armor Shred】 on the field is not cleared automatically",
    "【特技】：对自身和随机敌方单位造成100点技能伤害": "【Special Technique】: Deal 100 skill damage to self and a random enemy",
    "【特技】：对随机敌方造成等于自身攻击的技能伤害": "【Special Technique】: Deal skill damage to a random enemy equal to your Attack",
    "【特技】：自身攻击减半，令随机敌方单位【晕眩】，之后对所有【晕眩】中的敌方造成5点技能伤害": "【Special Technique】: Halve your Attack; 【Stun】 a random enemy, then deal 5 skill damage to all 【Stun】ned enemies",
    "【特技】：自身攻击减半，令随机敌方单位攻击减半并【晕眩】": "【Special Technique】: Halve your Attack; halve a random enemy's Attack and 【Stun】 it",
    "【特技】：自身攻击减半，令随机敌方单位获得【剧毒】": "【Special Technique】: Halve your Attack; inflict 【Toxic】 on a random enemy",
    f"【特技】：自身攻击减半，对全体单位造成1点【破甲】{NL}【光环】：场上单位的【破甲】不会自动清除": f"【Special Technique】: Halve your Attack; deal 1 【Armor Shred】 to all units{NL}【Aura】: 【Armor Shred】 on the field is not cleared automatically",
    "【特技】：自身攻击减半，对随机敌方单位造成5点技能伤害，获得1金币": "【Special Technique】: Halve your Attack; deal 5 skill damage to a random enemy and gain 1 gold",
    "【特技】：自身攻击减半，对随机敌方单位造成减半值的技能伤害，获得2金币": "【Special Technique】: Halve your Attack; deal skill damage equal to half that value to a random enemy and gain 2 gold",
    "【破敌】：+N护甲（N为目标生命上限）": "【On Kill】: +N Armor (N = target's max HP)",
    "【胜利】：永久+1攻击，永久+1生命": "【On Victory】: Permanently +1 Attack and +1 HP",
    f"【胜利】：永久+5攻击，永久+5生命{NL}【失败】：永久-10攻击，永久-10生命": f"【On Victory】: Permanently +5 Attack and +5 HP{NL}【On Defeat】: Permanently -10 Attack and -10 HP",
    "【连击】：触发1次自身【击破】效果": "【Combo】: Trigger your 【Break】 effect once",
    "【隐匿】": "【Stealth】",
    f"【隐匿】状态下获得【突袭】{NL}【击破】：获得【隐匿】": f"While 【Stealth】 is active, gain 【Ambush】{NL}【Break】: Gain 【Stealth】",
    f"【隐匿】状态下获得【突袭】{NL}【破敌】：获得【隐匿】": f"While 【Stealth】 is active, gain 【Ambush】{NL}【On Kill】: Gain 【Stealth】",
    "【鼓舞】：攻击者触发【鼓舞】时额外获得装备者属性": "【Rally】: When an attacker triggers 【Rally】, they also gain the holder's stats",
    f"【鼓舞】：自身+8护甲{NL}【坚甲】": f"【Rally】: Self gains +8 Armor{NL}【Fortified Armor】",
    "【鼓舞】：自身和攻击者+5生命": "【Rally】: Self and attacker gain +5 HP",
    "【鼓舞】：自身获得1次行动": "【Rally】: Self gains 1 action",
    "免疫【晕眩】和【消灭】效果": "Immune to 【Stun】 and 【Destroy】",
    "免疫技能伤害和【消灭】效果": "Immune to skill damage and 【Destroy】",
    "免疫负面【状态】": "Immune to negative 【Status】",
    "准备阶段结束时自身永久+1生命": "At prep phase end, permanently gain +1 HP",
    "准备阶段结束，自身永久+2攻击，永久+2生命": "At prep phase end, permanently gain +2 Attack and +2 HP",
    "友方阵亡时，自身永久+1攻击，永久+1生命": "When an ally is knocked out, permanently gain +1 Attack and +1 HP",
    "受到【晕眩】或【魅惑】时，将其解除": "When 【Stun】 or 【Charm】 is applied, remove it",
    "受到【晕眩】时，将其解除": "When 【Stun】 is applied, remove it",
    f"受到【治疗】时，存储治疗量{NL}【濒死】：对敌方全体造成等于治疗量的技能伤害": f"When 【Heal】ed, store the heal amount{NL}【Near Death】: Deal skill damage to all enemies equal to stored heal",
    "受到【治疗】时，对随机敌方造成10点伤害": "When 【Heal】ed, deal 10 damage to a random enemy",
    "受到攻击前+3攻击": "Before being attacked, +3 Attack",
    "受到攻击前先对攻击者造成5点技能伤害": "Before being attacked, deal 5 skill damage to the attacker first",
    "受到攻击前降低攻击者5点攻击": "Before being attacked, reduce the attacker's Attack by 5",
    "受到攻击后若满血，+20护甲并获得1次行动": "After being attacked at full HP, +20 Armor and gain 1 action",
    "受到攻击后若满血，+20护甲，然后令1个己方精灵获得1次行动": "After being attacked at full HP, +20 Armor, then grant 1 action to an allied Pokémon",
    "失去生命时，对随机敌方造成1点技能伤害，每次触发后伤害会翻倍": "When losing HP, deal 1 skill damage to a random enemy; damage doubles each time this triggers",
    "将最左侧敌方视为【宿敌】": "Treat the leftmost enemy as 【Rival】",
    "将破甲最高的敌方视为【宿敌】": "Treat the enemy with the highest Armor Shred as 【Rival】",
    "将距离最近的敌方视为【宿敌】": "Treat the nearest enemy as 【Rival】",
    "战斗开始时【晕眩】自身": "At battle start, 【Stun】 self",
    "战斗开始时【晕眩】自身，【晕眩】结束后获得【暴击】、【贯穿】": "At battle start, 【Stun】 self; when 【Stun】 ends, gain 【Critical Hit】 and 【Cleave】",
    "战斗阶段，其他精灵入场时，使其+N攻击（N为装备者的攻击）": "During battle, when other Pokémon enter, they gain +N Attack (N = holder's Attack)",
    "战斗阶段，其他精灵入场时，使其+N攻击，+N生命（N为装备者的对应属性）": "During battle, when other Pokémon enter, they gain +N Attack and +N HP (N = holder's matching stat)",
    "攻击【晕眩】目标时不会受到反击伤害": "When attacking a 【Stun】ned target, take no counter damage",
    "攻击前对目标造成等于自身攻击的技能伤害": "Before attacking, deal skill damage to the target equal to your Attack",
    "攻击后【晕眩】目标": "After attacking, 【Stun】 the target",
    "攻击后【晕眩】自身": "After attacking, 【Stun】 self",
    "攻击后，若自身未损失生命，+8护甲": "After attacking, if you took no HP loss, +8 Armor",
    "攻击后，若自身未损失生命，+8生命": "After attacking, if you took no HP loss, +8 HP",
    "攻击后，若自身未损失生命，永久+2攻击，永久+2生命": "After attacking, if you took no HP loss, permanently +2 Attack and +2 HP",
    "攻击和生命翻倍": "Attack and HP are doubled",
    "攻击攻击力低于自身的目标时不会受到反击伤害": "When attacking a target with lower Attack than you, take no counter damage",
    "攻击攻击力低于自身的目标时不受反击": "When attacking a target with lower Attack than you, take no counter",
    "自身【击破】效果额外触发1次": "Your 【Break】 effect triggers one extra time",
    "自身【濒死】效果额外触发1次": "Your 【Near Death】 effect triggers one extra time",
    "自身属性翻倍": "Your stats are doubled",
    "获得【暴击】，攻击后不会失去【暴击】": "Gain 【Critical Hit】; it is not removed after attacking",
    "行动前+1攻击，+1生命": "Before acting, +1 Attack and +1 HP",
    "行动前+2攻击": "Before acting, +2 Attack",
    "行动前+2攻击，+1生命": "Before acting, +2 Attack and +1 HP",
    "行动前【消灭】一个己方随机单位，获得其全部属性": "Before acting, 【Destroy】 one random allied unit and gain all its stats",
    "行动前【消灭】右侧相邻单位，获得其全部属性": "Before acting, 【Destroy】 the adjacent unit on the right and gain all its stats",
    "行动前，获得等于自身当前生命的护甲，将其平均分配给己方精灵": "Before acting, gain Armor equal to your current HP and split it evenly among allied Pokémon",
    "行动后【治疗】自身10点伤害": "After acting, 【Heal】 10 damage from self",
    "行动后【治疗】自身20点伤害": "After acting, 【Heal】 20 damage from self",
    "行动后，触发自身的【登场】效果": "After acting, trigger your 【On Play】 effect",
    "行动次数+1": "+1 action per round",
    f"行动次数+1{NL}行动前+3攻击，+3生命": f"+1 action per round{NL}Before acting, +3 Attack and +3 HP",
    f"行动次数+1{NL}行动前+5攻击，+5生命": f"+1 action per round{NL}Before acting, +5 Attack and +5 HP",
    "装备者攻击力始终等于生命": "Holder's Attack always equals its HP",
    "阵亡时【召唤】1个自身的1星复制": "When knocked out, 【Summon】 a 1-star copy of self",
    "阵亡时【召唤】1个自身的复制": "When knocked out, 【Summon】 a copy of self",
}


def main() -> None:
    root = Path(__file__).resolve().parent
    p_csv = root.parent / "game_config/auto_chess/equip.csv"
    with p_csv.open(newline="", encoding="utf-8-sig") as f:
        rows = list(csv.reader(f))
    keys = {r[4] for r in rows[3:] if len(r) > 4}
    missing = sorted(keys - CARD_EFFECT_EN.keys())
    if missing:
        raise SystemExit(f"missing keys: {missing}")
    extra = set(CARD_EFFECT_EN.keys()) - keys
    if extra - {""}:
        raise SystemExit(f"extra keys: {sorted(extra - {''})}")
    out = root / "equip_card_effect_en.json"
    out.write_text(json.dumps(CARD_EFFECT_EN, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print("wrote", out, "entries", len(CARD_EFFECT_EN))


if __name__ == "__main__":
    main()
