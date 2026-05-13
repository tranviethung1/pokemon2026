#!/usr/bin/env python3
"""Translate auto_chess/chess_guide.csv tutorial text to English."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path


CJK_RE = re.compile(r"[\u3400-\u9fff]")

ROLE_NAME_MAP = {
    "图鉴洛托姆": "Rotom Pokédex",
}

LIMIT_HINT_MAP = {
    "点击进入商店": "Tap to enter the shop",
    "拖动小火龙并打出到场上": "Drag Charmander onto the field",
    "拖动喵喵并打出到场上": "Drag Meowth onto the field",
    "将喵喵拖动至出售区域并出售": "Drag Meowth to the sell zone and sell it",
    "拖动熔岩增幅器到小火龙身上，为其装备": "Drag Magmarizer onto Charmander to equip it",
    "拖动鸭嘴宝宝并打出到场上": "Drag Magby onto the field",
    "拖动鸭嘴宝宝和小火龙交换位置": "Drag Magby and Charmander to swap their positions",
    "拖动指定商品至绿色区域完成购买": "Drag the designated shop item to the green area to buy it",
    "拖动指定卡牌打出到场上": "Drag the designated card onto the field",
    "点击按钮升级商店": "Tap the button to upgrade the shop",
    "点击锁定按钮锁定当前商品": "Tap the Lock button to lock the current shop items",
    "拖动力量护腕到嘟嘟身上，为其装备": "Drag Power Bracer onto Doduo to equip it",
    "拖动指定卡牌至上方出售区域出售": "Drag the designated card to the upper sell zone to sell it",
}

TALK_CONTENT_MAP = {
    "训练家，欢迎来到卡牌冒险，让我带你熟悉熟悉玩法吧洛托！": (
        "Trainer, welcome to card adventure. Let me walk you through how it works!"
    ),
    "我们先来挑选一只宝可梦伙伴吧！": "Let's pick a Pokemon partner first!",
    "点击进入商店": "Tap to enter the shop",
    "点击选中商品": "Tap to select the item",
    "点击确认购买": "Tap to confirm the purchase",
    "非常棒！现在我们拥有了一只小火龙": "Excellent! Now we have a Charmander.",
    "从手牌拖动小火龙，放入场上": "Drag Charmander from your hand onto the field",
    "一切准备就绪": "Everything is ready.",
    "检测到附近有野生的宝可梦，准备战斗！": "Wild Pokemon detected nearby. Get ready for battle!",
    "点击战斗遭遇": "Tap the battle encounter",
    "此界面展示对阵目标的信息以及战斗获胜后的奖励": (
        "This screen shows information about your opponent and the rewards for winning the battle."
    ),
    "点击开始战斗": "Tap to start the battle",
    "这是准备阶段，可以看到敌方的布阵情况": (
        "This is the prep phase. You can see the enemy's formation here."
    ),
    "点击查看敌方的单位信息": "Tap to view the enemy unit's details",
    "这里是精灵名称": "This is the Pokemon's name",
    "这里是精灵攻击，决定攻击时对敌方造成多少伤害": (
        "This is the Pokemon's Attack, which determines how much damage it deals when attacking"
    ),
    "这里是精灵生命，决定卡牌在阵亡前能承受多少伤害": (
        "This is the Pokemon's HP, which determines how much damage it can take before it is knocked out"
    ),
    "这里是精灵星级，卡牌的能力会随星级提升": (
        "This is the Pokemon's star level. Its power increases as its star level goes up"
    ),
    "这里是自然属性，不同训练家会有不同的属性偏好": (
        "These are the Pokemon's natures. Different Trainers prefer different natures"
    ),
    "点击关闭详情": "Tap to close the details",
    "精灵伤害规则1：普通攻击时，#C0xF13B54#攻击方#C0x5B545B#和#C0x3D8A99#受击方#C0x5B545B#会互相碰撞攻击，#C0x3D8A99#受击方#C0x5B545B#受到等于#C0xF13B54#攻击方#C0x5B545B#攻击力的伤害\n#C0xF13B54#小火龙#C0x5B545B#会对#C0x3D8A99#妙蛙种子#C0x5B545B#造成3点伤害": (
        "Pokemon damage rule 1: When making a basic attack, the "
        "#C0xF13B54#attacker#C0x5B545B# and the "
        "#C0x3D8A99#defender#C0x5B545B# clash, and the "
        "#C0x3D8A99#defender#C0x5B545B# takes damage equal to the Attack of the "
        "#C0xF13B54#attacker#C0x5B545B#\n"
        "#C0xF13B54#Charmander#C0x5B545B# will deal 3 damage to "
        "#C0x3D8A99#Bulbasaur#C0x5B545B#"
    ),
    "精灵伤害规则2：然后，#C0xF13B54#攻击方#C0x5B545B#受到等于#C0x3D8A99#受击方#C0x5B545B#攻击力的反击伤害\n#C0xF13B54#小火龙#C0x5B545B#会受到来自#C0x3D8A99#妙蛙种子#C0x5B545B#的2点反击伤害": (
        "Pokemon damage rule 2: Then the "
        "#C0xF13B54#attacker#C0x5B545B# takes counter damage equal to the Attack of the "
        "#C0x3D8A99#defender#C0x5B545B#\n"
        "#C0xF13B54#Charmander#C0x5B545B# will take 2 counter damage from "
        "#C0x3D8A99#Bulbasaur#C0x5B545B#"
    ),
    "精灵伤害规则3：当卡牌生命降至0时，卡牌阵亡": (
        "Pokemon damage rule 3: When a card's HP drops to 0, that card is knocked out"
    ),
    "训练家伤害规则1：当一方场上的单位被消灭殆尽时，游戏结束\n胜方会对败方的训练家造成伤害（伤害量=己方场上单位星级总和+训练家基础伤害）\n将敌方训练家生命降至0时，战斗胜利": (
        "Trainer damage rule 1: When one side has no units left on the field, the game ends\n"
        "The winner deals damage to the losing Trainer (damage = total star level of the winner's units on the field + the Trainer's base damage)\n"
        "Reduce the enemy Trainer's HP to 0 to win the battle"
    ),
    "瞧，本次战斗胜利我们获得了3个金币，可以购买新的精灵了": (
        "Look, we won this battle and earned 3 gold, so now we can buy a new Pokemon"
    ),
    "点击关闭结算界面": "Tap to close the results screen",
    "战斗结束后，己方精灵的状态都会恢复\n战斗内添加的非永久增益不会保留": (
        "After the battle ends, all of your Pokemon recover their status\n"
        "Non-permanent buffs gained during battle are not kept"
    ),
    "快看，你的小火龙又恢复健康状态了": "Look, your Charmander is healthy again",
    "即便如此，我们需要更多伙伴": "Even so, we still need more partners",
    "前方有家商店，刚刚获得的金币能派上用场了": (
        "There is a shop up ahead. The gold we just earned will come in handy there"
    ),
    "我们的金币貌似只能买得起喵喵，点击选择喵喵": (
        "It looks like we can only afford Meowth. Tap to select Meowth"
    ),
    "点击查看喵喵的信息": "Tap to view Meowth's details",
    "这里是精灵效果": "Here are the Pokemon's effects",
    "这里是名词解释": "Here are the keyword explanations",
    "太好了，打出喵喵可以让我们获得3金币\n点击关闭详情，然后像之前一样拖动打出喵喵吧": (
        "Great! Playing Meowth will give us 3 gold\n"
        "Tap to close the details, then drag Meowth onto the field like before"
    ),
    "我们现在有4金币了，但是还是不够": "We have 4 gold now, but it still is not enough",
    "向上拖动喵喵到出售区域并出售": "Drag Meowth upward to the sell zone and sell it",
    "太棒了，现在我们有足够的金币来购买小火龙了": (
        "Great! Now we have enough gold to buy Charmander"
    ),
    "点击选择小火龙": "Tap to select Charmander",
    "两张1星的卡牌会自动合成，突破成为2星卡牌": (
        "Two identical 1-star cards automatically combine into a 2-star card"
    ),
    "拖动打出2星小火龙": "Drag the 2-star Charmander onto the field",
    "行动顺序：多名角色战斗时，由最左侧的单位优先行动，并按照从左到右的顺序依次行动": (
        "Action order: When multiple units are battling, the leftmost unit acts first, then actions proceed from left to right"
    ),
    "攻击目标：当有多名角色可被攻击时，会从中随机选取一个目标": (
        "Attack target: When there are multiple possible targets, one is chosen at random"
    ),
    "训练家伤害规则2：如果己方的训练家生命被降至0，冒险将以失败告终": (
        "Trainer damage rule 2: If your Trainer's HP is reduced to 0, the adventure ends in defeat"
    ),
    "这次对战失败了，没关系，我们训练家生命还很健康": (
        "We lost this battle, but that's okay. Our Trainer still has plenty of HP"
    ),
    "看呐！博士给我们送来了一些帮手": "Look! The Professor sent us some helpers",
    "点击查看新获得的装备牌": "Tap to view the newly obtained equipment card",
    "这里是装备名称": "This is the equipment's name",
    "这里是装备攻击，装上后给精灵提供额外的攻击力加成": (
        "This is the equipment's Attack bonus. When equipped, it gives the Pokemon extra Attack"
    ),
    "这里是装备生命，装上后给精灵提供额外的生命加成": (
        "This is the equipment's HP bonus. When equipped, it gives the Pokemon extra HP"
    ),
    "这里是装备效果，暴击可以让精灵的攻击更加强力": (
        "This is the equipment's effect. Critical Hit makes a Pokemon's attacks stronger"
    ),
    "从手牌拖动装备卡到小火龙身上，为其装备上熔岩增幅器": (
        "Drag the equipment card from your hand onto Charmander to equip Magmarizer"
    ),
    "非常好！接下来拖动打出鸭嘴宝宝": "Very good! Next, drag Magby onto the field",
    "点击查看鸭嘴宝宝": "Tap to view Magby's details",
    "鸭嘴宝宝会配合暴击角色触发效果，所以晚点出手会更好": (
        "Magby works well with Critical Hit units, so it is better if it acts later"
    ),
    "拖动鸭嘴宝宝和小火龙交换位置": (
        "Drag Magby and Charmander to swap their positions"
    ),
    "看得出来你非常有天赋，已经完全掌握了": (
        "You clearly have a knack for this. You've mastered it already"
    ),
    "那么接下来，就向着宝可梦大师的目标！努力吧！": (
        "Next, aim for the goal of becoming a Pokemon Master! Do your best!"
    ),
    "你好！训练家，欢迎来到卡牌对决。在正式开始之前，你需要通过一个小小的考验。": (
        "Hello, Trainer. Welcome to card duels. Before we begin, you need to pass a small trial."
    ),
    "进入对战前，需要先选择一个代理身份。": (
        "Before entering battle, you first need to choose a Trainer role."
    ),
    "请仔细阅读训练家的技能，然后选择一个训练家": (
        "Read each Trainer's skill carefully, then choose a Trainer"
    ),
    "选择完毕后点击准备。（洛托小贴士：点击准备后仍然可以切换训练家选择哦）": (
        "After choosing, tap Ready. (Rotom tip: Even after tapping Ready, you can still switch your Trainer selection.)"
    ),
    "最左侧区域列出了本局游戏的玩家，#C0x3D8A99#蓝色标识出你所控制的训练家#C0x5B545B#，#C0xF13B54#红色标识出本回合你将要对战的训练家#C0x5B545B#（洛托小贴士：正式游戏中将会有6名玩家同台竞技）": (
        "The left side lists the players in this match. "
        "#C0x3D8A99#Blue marks the Trainer you control#C0x5B545B#, and "
        "#C0xF13B54#Red marks the Trainer you will battle this round#C0x5B545B# "
        "(Rotom tip: In a full match, 6 players compete at the same time.)"
    ),
    "这里显示的是当前回合数": "This shows the current round number",
    "右上角区域列出了当前持有的金币和下回合开始时可以获得的金币数量": (
        "The top-right area shows how much gold you currently have and how much you will gain at the start of the next round"
    ),
    "让我们先从商店招募一个精灵": "Let's recruit a Pokemon from the shop first",
    "从手牌拖动嘟嘟，放入场上": "Drag Doduo from your hand onto the field",
    "剩余的金币用来升级商店，可以帮我们找到更强大的伙伴。下回合开始时，商店商品会自动刷新": (
        "Use the remaining gold to upgrade the shop. It will help us find stronger partners. "
        "At the start of the next round, the shop offerings will refresh automatically"
    ),
    "点击准备按钮，准备迎接第一场战斗": (
        "Tap the Ready button and get ready for the first battle"
    ),
    "行动顺序：多名精灵战斗时，由最左侧的精灵优先行动，并按照从左到右的顺序依次行动；若最左侧有两名精灵，则属性之和较大的精灵优先行动": (
        "Action order: When multiple Pokemon are battling, the leftmost Pokemon acts first, "
        "and turns proceed from left to right; if there are two leftmost Pokemon, the one "
        "with the higher total stats acts first"
    ),
    "精灵伤害规则1：普通攻击时，#C0xF13B54#攻击方#C0x5B545B#和#C0x3D8A99#受击方#C0x5B545B#会互相碰撞攻击，#C0x3D8A99#受击方#C0x5B545B#受到等于#C0xF13B54#攻击方#C0x5B545B#攻击力的伤害，嘟嘟会对露力丽造成1点伤害": (
        "Pokemon damage rule 1: When making a basic attack, the "
        "#C0xF13B54#attacker#C0x5B545B# and the "
        "#C0x3D8A99#defender#C0x5B545B# clash, and the "
        "#C0x3D8A99#defender#C0x5B545B# takes damage equal to the Attack of the "
        "#C0xF13B54#attacker#C0x5B545B#. Doduo will deal 1 damage to Azurill"
    ),
    "精灵伤害规则2：然后，#C0xF13B54#攻击方#C0x5B545B#受到等于#C0x3D8A99#受击方#C0x5B545B#攻击力的反击伤害，嘟嘟受到露力丽的1点反击伤害": (
        "Pokemon damage rule 2: Then the "
        "#C0xF13B54#attacker#C0x5B545B# takes counter damage equal to the Attack of the "
        "#C0x3D8A99#defender#C0x5B545B#. Doduo takes 1 counter damage from Azurill"
    ),
    "精灵伤害规则3：当精灵生命降至0时，该精灵将暂时离场，下回合开始时你的阵容会恢复原样": (
        "Pokemon damage rule 3: When a Pokemon's HP drops to 0, it temporarily leaves the field, "
        "and your lineup is restored at the start of the next round"
    ),
    "训练家伤害规则1：当一方场上的单位被消灭殆尽时，战斗阶段结束\n获胜方会对失败方的训练家造成伤害（伤害量=己方场上单位星级总和+获胜方商店等级）\n训练家生命变为0时，将被淘汰并结算排名": (
        "Trainer damage rule 1: When one side has no units left on the field, the battle phase ends\n"
        "The winner deals damage to the losing Trainer (damage = total star level of the winner's units on the field + the winner's shop level)\n"
        "When a Trainer's HP reaches 0, they are eliminated and their final placement is settled"
    ),
    "太棒了，我们已经赢得了第一场战斗，并且获得了更多的金币": (
        "Great! We won the first battle and earned more gold"
    ),
    "商店中的商品刷新了，让我们把嘟嘟买下来": "The shop has refreshed. Let's buy Doduo",
    "两只相同的1星精灵会合成为2星精灵并返回手牌。让我们继续购买": (
        "Two identical 1-star Pokemon combine into a 2-star Pokemon and return to your hand. Let's keep buying"
    ),
    "让我们继续购买": "Let's keep buying",
    "两只相同的2星精灵会合成为4星精灵并返回手牌，并且还能获得1张突破奖励事件": (
        "Two identical 2-star Pokemon combine into a 4-star Pokemon and return to your hand, and you also gain 1 Breakthrough reward event card"
    ),
    "事件卡可以给我们提供强力的增益，让我们打出事件卡": (
        "Event cards can give us powerful buffs. Let's play the event card"
    ),
    "选中卡牌": "Select the card",
    "点击确定": "Tap Confirm",
    "大舌贝的守卫效果可以更好地保护嘟嘟，让我们将其置于嘟嘟右侧": (
        "Shellder's Guard effect can protect Doduo better. Let's place it to Doduo's right"
    ),
    "商店中还有个装备卡，点击查看效果": (
        "There is also an equipment card in the shop. Tap it to view its effect"
    ),
    "这个装备看起来非常适合行动次数较多的嘟嘟，不过我们暂时无法购买": (
        "This equipment looks perfect for Doduo, who acts many times, but we can't afford it yet"
    ),
    "再次点击取消详情": "Tap again to close the details",
    "让我们点击锁定按钮，将当前商品先锁定。锁定后的商品在下回合仍会出现在商店中。": (
        "Let's tap the Lock button to keep the current shop items. Locked items will still appear in the shop next round"
    ),
    "点击准备按钮": "Tap the Ready button",
    "非常好，这次胜利多亏了大舌贝，替嘟嘟挡下了致命一击": (
        "Excellent. We won this battle thanks to Shellder, which blocked a fatal blow for Doduo"
    ),
    "现在我们有足够的金币购买装备卡了，让我们买下它！": (
        "Now we have enough gold to buy the equipment card. Let's take it!"
    ),
    "剩余的金币让我们买两只小拉达合成2星": (
        "With the remaining gold, let's buy two Rattata to combine them into a 2-star Pokemon"
    ),
    "再买一只": "Buy one more",
    "让我们给嘟嘟穿上装备": "Let's equip Doduo",
    "嘟嘟和大舌贝行动时可以触发小拉达的效果，让我们将小拉达置于最右侧": (
        "Doduo and Shellder can trigger Rattata's effect when they act, so let's place Rattata on the far right"
    ),
    "糟糕！洛托嗅到一丝强大的气息！经过计算，下场战斗失败概率高达99.99%%": (
        "Oh no! Rotom detects a powerful presence! According to my calculations, the chance of losing the next battle is as high as 99.99%%"
    ),
    "别怕！我们还有强大的训练家技能帮我们扭转战局。": (
        "Don't worry! We still have powerful Trainer skills to turn the battle around"
    ),
    "点击使用训练家技能": "Tap to use the Trainer skill",
    "好险，多亏了训练家技能，我们本次失败没有受到伤害。让我们有了绝地翻盘的希望！": (
        "That was close. Thanks to the Trainer skill, we took no damage from this loss. "
        "Now we still have a chance to turn it around!"
    ),
    "我们还通过技能获得了足够的金币来强化我们的队伍，我们继续购买卡牌，将小拉达升至4星": (
        "The skill also gave us enough gold to strengthen our team. Let's keep buying cards and raise Rattata to 4 stars"
    ),
    "小拉达合成4星后，我们又能获得1张突破奖励事件": (
        "After Rattata combines into 4 stars, we get another Breakthrough reward event card"
    ),
    "打出小拉达": "Play Rattata",
    "打出事件卡": "Play the event card",
    "我们有足够的金币，让我们直接将商店升至6级，寻找更强力的精灵": (
        "We have enough gold, so let's level the shop straight to level 6 and look for stronger Pokemon"
    ),
    "再次升级": "Upgrade again",
    "点击刷新按钮，刷新商品": "Tap the Refresh button to refresh the shop",
    "购买指定商品": "Buy the designated item",
    "我们还差一个金币，让我们把场上较弱的大舌贝出售（洛托小贴士：无论是几星的精灵，出售都是获得1金币哦）": (
        "We are still 1 gold short, so let's sell the weaker Shellder on the field. "
        "(Rotom tip: No matter how many stars a Pokemon has, selling it always gives 1 gold.)"
    ),
    "打出晃晃斑": "Play Spinda",
    "打出小福蛋": "Play Happiny",
    "打出美洛耶塔·舞步": "Play Meloetta - Pirouette",
    "打出美洛耶塔·歌声": "Play Meloetta - Aria",
}


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def output_encoding(path: Path) -> str:
    return "utf-8-sig" if path.read_bytes().startswith(b"\xef\xbb\xbf") else "utf-8"


def lookup_translation(value: str, mapping: dict[str, str]) -> str | None:
    translated = mapping.get(value)
    if translated is not None:
        return translated
    if "\\n" in value:
        translated = mapping.get(value.replace("\\n", "\n"))
        if translated is not None:
            return translated
    if "\n" in value:
        translated = mapping.get(value.replace("\n", "\\n"))
        if translated is not None:
            return translated
    return None


def update_column(
    rows: list[list[str]],
    index: int,
    mapping: dict[str, str],
) -> tuple[int, list[tuple[int, str, str]], list[tuple[int, str, str]]]:
    updates = 0
    missing: list[tuple[int, str, str]] = []

    for line_number, row in enumerate(rows[3:], start=4):
        if not row:
            continue
        value = row[index]
        translated = lookup_translation(value, mapping)
        if translated is not None:
            if translated != value:
                row[index] = translated
                updates += 1
        elif CJK_RE.search(value):
            missing.append((line_number, row[0], value))

    remaining = [
        (line_number, row[0], row[index])
        for line_number, row in enumerate(rows[3:], start=4)
        if row and CJK_RE.search(row[index])
    ]
    return updates, missing, remaining


def sync(args: argparse.Namespace) -> int:
    with args.target.open(newline="", encoding="utf-8-sig") as handle:
        rows = list(csv.reader(handle))

    header = rows[0]
    column_maps = {
        "limitHint": LIMIT_HINT_MAP,
        "roleName": ROLE_NAME_MAP,
        "talkContent": TALK_CONTENT_MAP,
    }

    has_issues = False
    for column_name, mapping in column_maps.items():
        index = header.index(column_name)
        updates, missing, remaining = update_column(rows, index, mapping)
        print(f"{column_name}_updates={updates}")
        print(f"{column_name}_missing={len(missing)}")
        print(f"{column_name}_remaining_cjk={len(remaining)}")
        for line_number, row_id, value in missing[:20]:
            print(f"missing column={column_name} line={line_number} id={row_id} value={value!r}")
        for line_number, row_id, value in remaining[:20]:
            print(f"remaining column={column_name} line={line_number} id={row_id} value={value!r}")
        if missing or remaining:
            has_issues = True

    if has_issues:
        return 1

    if args.dry_run:
        return 0

    encoding = output_encoding(args.target)
    lineterminator = detect_lineterminator(args.target)
    with args.target.open(
        "w",
        newline="",
        encoding=encoding,
    ) as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", type=Path, default=Path("game_config/auto_chess/chess_guide.csv"))
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
