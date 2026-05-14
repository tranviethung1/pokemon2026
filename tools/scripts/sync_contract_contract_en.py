#!/usr/bin/env python3
"""Translate `game_config/contract/contract.csv` into repo-style English.

Usage:
  python3 tools/scripts/sync_contract_contract_en.py [--dry-run]

The file only exposes `name` and `desc` columns, so this translator does two
things:
1. apply stable English item names via an explicit name map
2. convert long Chinese lore blurbs into concise English summaries with a mix
   of exact templates and repeatable heuristics
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
CSV_PATH = ROOT / "game_config/contract/contract.csv"
DICT_MD = ROOT / "GAME_DICTIONARY.md"

CJK_RE = re.compile(r"[\u3400-\u9fff]")

NAME_MAP: dict[str, str] = {
    "扬尘之章": "Dustrise Sigil",
    "骨朵之章": "Bonebud Sigil",
    "远望之章": "Farwatch Sigil",
    "钝地之章": "Earthspade Sigil",
    "极眺之章": "Grandview Sigil",
    "蚀骨之章": "Bonebite Sigil",
    "素洁之章": "Pureview Sigil",
    "开采之章": "Excavation Sigil",
    "炽焰之章": "Blazing Flame Sigil",
    "翎羽之章": "Featherwing Sigil",
    "强者之章": "Champion Sigil",
    "铁锤之章": "Iron Hammer Sigil",
    "迷帽之章": "Mystic Cap Sigil",
    "背刺之章": "Backstab Sigil",
    "咸鱼之章": "Fish King Sigil",
    "掌印之章": "Pawprint Sigil",
    "螺旋之章": "Spiral Sigil",
    "飞射之章": "Slingshot Sigil",
    "乒乓之章": "Ping-Pong Sigil",
    "暴槌之章": "Crushing Hammer Sigil",
    "桎梏之章": "Shackles Sigil",
    "千钧之章": "Thousandweight Sigil",
    "利爪之章": "Claw Sigil",
    "矫捷之章": "Nimble Sigil",
    "盾守之章": "Shieldguard Sigil",
    "绒羽之章": "Downfeather Sigil",
    "锋刃之章": "Bladeedge Sigil",
    "甜果之章": "Sweetfruit Sigil",
    "翠叶之章": "Emerald Leaf Sigil",
    "迭纸之章": "Folded Paper Sigil",
    "磁力之章": "Magnetism Sigil",
    "电能之章": "Electric Power Sigil",
    "刺局之章": "Thorntrap Sigil",
    "烈刃之章": "Fierce Blade Sigil",
    "野性之章": "Wildheart Sigil",
    "龙戟之章": "Dragon Halberd Sigil",
    "锯角之章": "Sawhorn Sigil",
    "远古之章": "Ancient Sigil",
    "跃兔之章": "Leaping Rabbit Sigil",
    "破浪之章": "Wavebreaker Sigil",
    "叶袭之章": "Leafstrike Sigil",
    "凸刺之章": "Spikecrest Sigil",
    "火舞之章": "Firedance Sigil",
    "淬毒之章": "Venomtemper Sigil",
    "掘地之章": "Burrowing Sigil",
    "暗爪之章": "Dark Claw Sigil",
    "双刃之章": "Twinblade Sigil",
    "捶捶之章": "Hammerbeat Sigil",
    "爆爆之章": "Blastburst Sigil",
    "黑镜之章": "Black Mirror Sigil",
    "怨影之章": "Grudge Shadow Sigil",
    "毒噬之章": "Venombite Sigil",
    "爆炬之章": "Blazing Torch Sigil",
    "迅斩之章": "Swift Slash Sigil",
    "暴刹之章": "Violent Strike Sigil",
    "熊偶之章": "Bear Doll Sigil",
    "尾旋之章": "Tailspin Sigil",
    "虹电之章": "Rainbow Volt Sigil",
    "翎飓之章": "Feather Gale Sigil",
    "低语之章": "Whisper Sigil",
    "蚀刻之章": "Etched Sigil",
    "悠游之章": "Drifter Sigil",
    "丛云之章": "Cloudgrove Sigil",
    "扭曲之章": "Distortion Sigil",
    "淬砺之章": "Tempered Sigil",
    "天籁之章": "Heavensong Sigil",
    "压制之章": "Suppression Sigil",
    "暴能之章": "Burst Power Sigil",
    "制胜之章": "Victory Sigil",
    "暗黑之章": "Darkness Sigil",
    "惩戒之章": "Punishment Sigil",
    "电拳之章": "Thunderfist Sigil",
    "暗剑之章": "Darkblade Sigil",
    "波能之章": "Wave Power Sigil",
    "蓝焰之章": "Blueflame Sigil",
    "曜晶之章": "Suncrystal Sigil",
    "妖王之章": "Demon King Sigil",
    "蛊惑之章": "Bewitching Sigil",
    "灭世之章": "Worldbane Sigil",
    "巧捷之章": "Cleverstride Sigil",
    "破空之章": "Skybreak Sigil",
    "碎岩之章": "Rockshatter Sigil",
    "幻能之章": "Phantom Power Sigil",
    "幻影之章": "Phantom Sigil",
    "锋霜之章": "Frostedge Sigil",
    "雷刺之章": "Thunder Thorn Sigil",
    "穹攫之章": "Skygrasp Sigil",
    "天蓝之章": "Skyblue Sigil",
    "链接之章": "Link Sigil",
    "结界之章": "Barrier Sigil",
    "好运之章": "Good Luck Sigil",
    "野营之章": "Camping Sigil",
    "庇护之章": "Shelter Sigil",
    "荆棘之章": "Thorn Sigil",
    "绮丽之章": "Splendor Sigil",
    "甜甜圈之章": "Donut Sigil",
    "神屋之章": "Spirit Shrine Sigil",
    "香露之章": "Fragrant Dew Sigil",
    "漏刻之章": "Waterclock Sigil",
    "洞察之章": "Insight Sigil",
    "真知之章": "Trueknowledge Sigil",
    "契合之章": "Harmony Sigil",
    "熊熊之章": "Bewear Sigil",
    "圣水之章": "Holy Water Sigil",
    "甜蜜之章": "Sweetness Sigil",
    "冰晶之章": "Ice Crystal Sigil",
    "科技之章": "Technology Sigil",
    "致命之章": "Lethal Sigil",
    "引燃之章": "Ignition Sigil",
    "寒冰之章": "Frost Sigil",
    "磐石之章": "Bedrock Sigil",
    "角刺之章": "Hornthorn Sigil",
    "黏黏之章": "Gooey Sigil",
    "固守之章": "Holdfast Sigil",
    "水波之章": "Ripple Sigil",
    "蛇行之章": "Serpentine Sigil",
    "蛮劲之章": "Bruteforce Sigil",
    "超磁之章": "Supermagnet Sigil",
    "重组之章": "Reassembly Sigil",
    "落雷之章": "Thunderfall Sigil",
    "梦萤之章": "Dreamglow Sigil",
    "冲击之章": "Impact Sigil",
    "极触之章": "Extreme Touch Sigil",
    "寒盾之章": "Frostshield Sigil",
    "灵槌之章": "Spirit Hammer Sigil",
    "炽冠之章": "Blaze Crown Sigil",
    "眩蛰之章": "Dizzysting Sigil",
    "坚鳞之章": "Hardscale Sigil",
    "壳御之章": "Shellguard Sigil",
    "镇御之章": "Townguard Sigil",
    "牢靠之章": "Reliable Sigil",
    "冰冻之章": "Freeze Sigil",
    "铁甲之章": "Iron Armor Sigil",
    "暗影之章": "Shadow Sigil",
    "飞鸿之章": "Soaring Flame Sigil",
    "异变之章": "Mutation Sigil",
    "金轮之章": "Golden Wheel Sigil",
    "烈盾之章": "Fierce Shield Sigil",
    "磐盾之章": "Stone Shield Sigil",
    "混沌之章": "Chaos Sigil",
    "稳固之章": "Stability Sigil",
    "无极之章": "Infinity Sigil",
    "纯净之章": "Purity Sigil",
    "烁亮之章": "Gleambright Sigil",
    "回忆之章": "Memory Sigil",
    "占卜之章": "Divination Sigil",
    "支离之章": "Shattered Sigil",
    "幻羽之章": "Phantom Feather Sigil",
    "缠络之章": "Entanglement Sigil",
    "牢不可破之章": "Unbreakable Sigil",
    "孤勇之章": "Lone Courage Sigil",
    "幽钥之章": "Nether Key Sigil",
    "束缚之章": "Binding Sigil",
    "灵磁石之章": "Spirit Magnet Sigil",
    "霹雳之章": "Thunderclap Sigil",
    "涟漪之章": "Ripples Sigil",
    "樱之章": "Sakura Sigil",
    "幸运星之章": "Lucky Star Sigil",
    "炫光之章": "Radiant Light Sigil",
    "澎湃之章": "Surging Sigil",
    "片羽之章": "Fallen Feather Sigil",
    "青翠之章": "Verdure Sigil",
    "晶亮之章": "Crystalglow Sigil",
    "空灵之章": "Ethereal Sigil",
    "水气球之章": "Water Balloon Sigil",
    "怒雷之章": "Fury Thunder Sigil",
    "幻境之章": "Mirage Sigil",
    "鬼脸之章": "Ghostface Sigil",
    "悲鸣之章": "Lament Sigil",
    "新绿之章": "New Green Sigil",
    "烛影之章": "Candle Shadow Sigil",
    "火星之章": "Mars Sigil",
    "漩涡之章": "Whirlpool Sigil",
    "豆蔻之章": "Cardamom Sigil",
    "幻乐之章": "Phantom Melody Sigil",
    "暴麟之章": "Rampage Scale Sigil",
    "破土之章": "Earthbreak Sigil",
    "福蛋之章": "Happiness Egg Sigil",
    "幸运蛋之章": "Lucky Egg Sigil",
    "绵力之章": "Cotton Power Sigil",
    "假面之章": "Mask Sigil",
    "先知之章": "Oracle Sigil",
    "赤瞳之章": "Crimson Eye Sigil",
    "流风之章": "Windflow Sigil",
    "奇冠之章": "Odd Crown Sigil",
    "裂音之章": "Splitsound Sigil",
    "绵白之章": "Cottonwhite Sigil",
    "海渊之章": "Sea Abyss Sigil",
    "叩木之章": "Knockwood Sigil",
    "藤符之章": "Vine Talisman Sigil",
    "幻冕之章": "Phantom Crown Sigil",
    "绯璃之章": "Scarlet Glass Sigil",
    "苍翠之章": "Deep Verdure Sigil",
    "铃铛塔之章": "Bell Tower Sigil",
    "鲸睛之章": "Whale Eye Sigil",
    "爱之章": "Love Sigil",
    "永恒之章": "Eternity Sigil",
    "天虹之章": "Skybow Sigil",
    "浩浪之章": "Vast Wave Sigil",
    "生机之章": "Vitality Sigil",
    "星愿之章": "Wishstar Sigil",
    "璀璨之章": "Brilliance Sigil",
    "魂芯之章": "Soulcore Sigil",
    "同辉之章": "Shared Radiance Sigil",
    "疗愈之章": "Healing Sigil",
    "荧彩之章": "Luminous Prism Sigil",
    "瑰丽之章": "Splendid Grace Sigil",
    "天驰之章": "Skystride Sigil",
    "蔓花之章": "Bloomvine Sigil",
    "烟熏简信": "Smoky Note",
    "闪耀简信": "Shining Note",
    "圆润简信": "Rounded Note",
    "风筝简信": "Kite Note",
    "衔尾便邮": "Tailclasp Mail",
    "闪亮便邮": "Bright Mail",
    "表情便邮": "Emoji Mail",
    "高山便邮": "Highland Mail",
    "融化便邮": "Melting Mail",
    "巨岩便邮": "Monolith Mail",
    "鬼祟便邮": "Sneaky Mail",
    "结界信函": "Barrier Letter",
    "清澈信函": "Clear Letter",
    "蛮力信函": "Brute Letter",
    "酥麻信函": "Numbing Letter",
    "晶莹信函": "Crystal Letter",
    "绷带信函": "Bandage Letter",
    "璀璨信函": "Splendid Letter",
    "友善信函": "Friendly Letter",
    "蜂巢信函": "Beehive Letter",
    "星星信函": "Star Letter",
    "忍者信函": "Ninja Letter",
    "立方明信片": "Cube Postcard",
    "链接明信片": "Link Postcard",
    "光明明信片": "Bright Postcard",
    "青枝明信片": "Greenbranch Postcard",
    "绵软明信片": "Soft Postcard",
    "箭矢明信片": "Arrow Postcard",
    "天使明信片": "Angel Postcard",
    "振翅明信片": "Wingbeat Postcard",
    "恶魔明信片": "Demon Postcard",
    "虫虫明信片": "Bugbug Postcard",
    "明眸明信片": "Bright-Eyed Postcard",
    "龙环明信片": "Dragon Ring Postcard",
    "蜜桃手札": "Peach Notebook",
    "羽冠手札": "Feathercrown Notebook",
    "爱的手札": "Love Notebook",
    "无限手札": "Infinity Notebook",
    "流星手札": "Meteor Notebook",
    "天籁手札": "Heavensong Notebook",
}

ALIASES: dict[str, str] = {
    "咕咕鸽": "Tranquill",
    "美洛耶塔": "Meloetta",
    "起源梦幻": "Origin Mew",
    "闪光暴雪王": "Shiny Abomasnow",
    "闪光超级妙蛙花": "Shiny Mega Venusaur",
    "闪光超级班基拉斯": "Shiny Mega Tyranitar",
    "铁火辉夜": "Celesteela",
    "费洛美螂": "Pheromosa",
    "垒磊石": "Stakataka",
    "毒贝比": "Poipole",
    "捷拉奥拉": "Zeraora",
    "波尔凯尼恩": "Volcanion",
    "雷吉斯奇鲁": "Registeel",
    "雷吉洛克": "Regirock",
    "雷吉艾斯": "Regice",
    "密勒顿": "Miraidon",
    "小智忍蛙": "Ash-Greninja",
    "大嘴鸥": "Pelipper",
}

REGION_MAP: list[tuple[str, str]] = [
    ("王冠雪原", "the Crown Tundra"),
    ("铠岛", "the Isle of Armor"),
    ("北上乡", "Kitakami"),
    ("洗翠", "Hisui"),
    ("伽勒尔", "Galar"),
    ("丰缘", "Hoenn"),
    ("神奥", "Sinnoh"),
    ("关都", "Kanto"),
    ("城都", "Johto"),
    ("合众", "Unova"),
    ("卡洛斯", "Kalos"),
    ("阿罗拉", "Alola"),
    ("帕底亚", "Paldea"),
    ("橘子群岛", "the Orange Archipelago"),
]

PLACE_KIND_MAP: list[tuple[str, str]] = [
    ("百货公司", "department store"),
    ("百货", "department store"),
    ("博物馆", "museum"),
    ("研究所", "research institute"),
    ("实验室", "laboratory"),
    ("游戏城", "game corner"),
    ("图书馆", "library"),
    ("竞技场", "arena"),
    ("道馆", "Gym"),
    ("学校", "school"),
    ("森林", "forest"),
    ("公园", "park"),
    ("基地", "base camp"),
    ("遗迹", "ruins"),
    ("海湾", "bay"),
    ("海港", "harbor"),
    ("洞窟", "cave"),
    ("钟乳洞", "cavern"),
    ("山道", "mountain trail"),
    ("山", "mountain"),
    ("塔", "tower"),
    ("岛", "island"),
    ("镇", "town"),
    ("市", "city"),
    ("商店", "shop"),
]

THEME_MAP: list[tuple[str, str]] = [
    ("宝芬", "Poffin"),
    ("火焰", "flame"),
    ("火把", "torch"),
    ("骨头", "bone"),
    ("望远镜", "telescope"),
    ("铁锹", "shovel"),
    ("护盾", "shield"),
    ("匕首", "dagger"),
    ("面具", "mask"),
    ("磁石", "magnet"),
    ("树叶", "leaf"),
    ("锯刃", "saw blade"),
    ("羽毛扇", "feather fan"),
    ("羽毛", "feather"),
    ("翅膀", "wing"),
    ("化石", "fossil"),
    ("歌声", "song"),
    ("晶体", "crystal"),
    ("石头", "stone"),
    ("炸弹", "bomb"),
    ("药水", "potion"),
    ("糖果", "candy"),
    ("水气球", "water balloon"),
    ("录音", "recorded rhythm"),
    ("围巾", "scarf"),
    ("蛋", "egg"),
    ("盾牌", "shield"),
    ("武器", "weapon"),
]

MAIL_DESC_EN: dict[str, str] = {
    "这是由咕咕鸽跋涉万里飞行护送的不知名的寄件人赠送印记之章，可以在城镇中任何商店中使用并查看信件的信息":
        "Delivered over long distances by Tranquill for an unknown sender, this mail-themed sigil can be used at any town shop to view the letter contents.",
    "这是由咕咕鸽跋涉万里飞行护送的不知名的寄件人赠送印记之章，包装样式完整且简单，可以在城镇中任何商店中使用并查看信件的信息":
        "Delivered over long distances by Tranquill for an unknown sender, this simple, fully wrapped mail-themed sigil can be used at any town shop to view the letter contents.",
    "这是由咕咕鸽跋涉万里飞行护送的不知名的寄件人赠送印记之章，淡紫色的邮件封面配色很是明快，可以在城镇中任何商店中使用并查看信件的信息":
        "Delivered over long distances by Tranquill for an unknown sender, this bright lavender mail-themed sigil can be used at any town shop to view the letter contents.",
    "这是由咕咕鸽跋涉万里飞行护送的不知名的寄件人赠送印记之章，邮件封面有利落的线条装饰，设计的即简单又潮流，可以在城镇中任何商店中使用并查看信件的信息":
        "Delivered over long distances by Tranquill for an unknown sender, this stylish mail-themed sigil can be used at any town shop to view the letter contents.",
    "这是由咕咕鸽跋涉万里飞行护送的不知名的寄件人赠送印记之章，使用了热情饱满的红色与活力的橙色相互搭配，是可以直接作为装饰品的设计样式，让人爱不释手，可以在城镇中任何商店中使用并查看信件的信息":
        "Delivered over long distances by Tranquill for an unknown sender, this warm red-and-orange decorative mail sigil can be used at any town shop to view the letter contents.",
}

ROW_DESC_OVERRIDES: dict[str, str] = {
    "81201": "This sigil comes from a Poffin kitchen admired by travelers for its spotless presentation and tidy atmosphere.",
    "81301": "This sigil comes from a Poffin kitchen admired by travelers for its spotless presentation and exceptionally high praise.",
    "81202": "This sigil is tied to a volcanic park where Cubone lore and scattered bone-shaped finds became a well-known local curiosity.",
    "81302": "This sigil is tied to a volcanic park where Cubone lore and scattered bone-shaped finds became a well-known local curiosity.",
    "81203": "This sigil reflects the vast open sky above Hoenn, where travelers ride Pokemon and peer into the distance through a telescope.",
    "81303": "This sigil reflects the vast open sky above Hoenn, where travelers ride Pokemon and enjoy a sweeping view of the world from above.",
    "81204": "This sigil is linked to a treasure-rich forest route where passing adventurers once carried plain shovels.",
    "81304": "This sigil is linked to a treasure-rich forest route where passing adventurers once carried compact treasure-digging shovels.",
    "81403": "This sigil honors the Battle Tower dream of becoming the strongest trainer and carrying off the victor's cup.",
    "81406": "Awarded after clearing every challenger in Spikemuth, this sigil bears the Gym leader's favorite weapon.",
    "81505": "This sigil commemorates Ambipom's table-tennis talent after Champion O invited it to train as a proper ping-pong player.",
    "81522": "Sold as a rare limited keepsake in Hau'oli City's shopping district, this sigil is carved after Gyarados and radiates violent force.",
    "81520": "This ceramic sigil was carefully crafted by a master potter and fired with Magby's gentle flames to create its lifelike heat.",
    "81539": "This sigil recreates Litten's dramatic festival-stage fire trap, where burning fur balls rained down like meteors for a comeback win.",
    "81607": "Sold in Blueberry Academy's coastal biome, this sigil hides a switch that plays a song said to draw Meloetta closer.",
    "81613": "Awarded during Feng City's annual Wind Festival, this sigil honors Zeraora and the fire it once helped defeat.",
    "81614": "This sigil became a hot-selling keepsake after Ash won the World Coronation Series, and its sharp design is dedicated to Ash-Greninja.",
    "81617": "This mysterious sigil depicts a black crystal that dims strong light and bends it like a prism, hinting at power beyond this world.",
    "81619": "This sigil was briefly discovered in a dark classroom haunted-house setup, where its carved stone seemed to call out from another dimension before vanishing.",
    "81620": "Recovered from Team Rocket's Pelipper, this sigil bears a terrifying mask resembling Shiny Mega Tyranitar and hints at destructive power.",
    "81621": "This sigil is said to be a heartfelt gift from Gallade to trainers who have become its most trusted battle partners.",
    "82303": "Sold at the first Hisui snowfield base camp, this sigil is displayed among popular cold-weather gear for deep-forest explorers.",
    "82405": "Awarded by a detective at a Galar hotel, this magnifying-glass sigil celebrates a traveler's sharp logic and deduction.",
    "82503": "This sigil is tied to a major Silph Co. research potion project and reflects the company's cutting-edge manufacturing legacy.",
    "82504": "This sigil takes its cue from the oversized honey candy made in a once-barren flower town that bloomed after heartfelt prayers.",
    "82507": "This sigil represents Ash's beloved Magikarp baseball team and its dream of one day defeating the star Electabuzz squad.",
    "82524": "This sigil was awarded as the champion keepsake in a Pallet Town guessing game after one player correctly identified Wynaut's tail.",
    "82529": "This sigil was carried out of an Ultra Wormhole by Looker and resembles Celesteela, hinting at a forgotten encounter from that void.",
    "82607": "This Alolan sigil is linked to the legendary 'sun-devouring beast,' and its three glowing eyes are said to open a path to another world.",
    "83302": "This sigil hangs near Memorial Pillar as a sign that beautiful memories should endure for both people and Pokemon.",
    "83503": "This sigil became the cover design of Time Ripples, a travel anthology that weaves countless adventurers' stories into one tale.",
    "83518": "This eerie sigil glows more brightly for younger owners and was discovered in a hillside manor near Nimbasa, passing through many hands since.",
    "83535": "This sigil recalls the rare sight of Phione drifting on the sea with its head sac inflated like a bright orb above the waves.",
    "83536": "This sigil can record Grookey's tapping rhythm, and replaying that sound is said to restore vigor to grass, leaves, and wilted flowers.",
    "83537": "This jade sigil was found in a barren rocky wasteland, yet it grows greener in harsh drought and duller in lush forests or grasslands.",
    "83524": "Gifted at Cogita's secluded retreat in Hisui, this sigil carries an Exeggcute-themed shape and a trace of old legend.",
    "83529": "This island sigil is tied to Absol's warning feathers and is said to glow before disaster strikes the village.",
    "83532": "Sold in Snowbelle City's clothing shops, this warm and cute hat-themed sigil was inspired by Mime Jr..",
    "83602": "The back of this sigil recounts the Bell Tower legend of Ho-Oh reviving the three Pokemon lost in the fire that consumed the western tower.",
    "83608": "This near-unforgeable sigil is said to be a trace left by Celebi, rare in thriving forests and treasured as a sign of hope.",
    "83609": "This sigil is imagined as Jirachi's wish-granting token, a prize so rare that almost no one has truly seen it.",
    "83610": "This sigil mirrors the sacred diamond of the Diamond Domain and the overwhelming brilliance associated with Princess Diancie.",
    "83612": "This Alolan sigil is linked to the legendary 'moon-calling beast,' with star signs and a pale red eye that can open a gate to another world.",
    "83613": "This sigil commemorates Zarude's scarf and the story of raising Koko after carrying him away from the river.",
    "83614": "Found in the forest near Pallet Town, this sigil's radiant crystal shimmer is linked by explorers to the trail of Origin Mew.",
    "83615": "This sigil is said to appear after Gardevoir rescues its trainer from extreme danger, carrying an unreal beauty and reassuring warmth.",
}

MARKET_PLACES = {"department store", "shop", "museum", "game corner"}
LOW_SIGNAL_PLACES = {"city", "town", "island", "mountain", "forest", "bay"}


def load_species_map(md_path: Path) -> dict[str, str]:
    text = md_path.read_text(encoding="utf-8")
    header = "## 4. Danh sách Pokémon"
    start = text.index(header)
    end = text.find("\n---", start)
    section = text[start:end]
    pattern = re.compile(r"^\|\s*\d+\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|", re.M)
    species = {m.group(1).strip(): m.group(2).strip() for m in pattern.finditer(section)}
    species.update(ALIASES)
    return species


def has_all(text: str, *tokens: str) -> bool:
    return all(token in text for token in tokens)


def detect_region(text: str) -> str | None:
    for zh, en in REGION_MAP:
        if zh in text:
            return en
    return None


def detect_place_kind(text: str) -> str | None:
    for zh, en in PLACE_KIND_MAP:
        if zh in text:
            return en
    return None


def detect_theme(text: str) -> str | None:
    for zh, en in THEME_MAP:
        if zh in text:
            return en
    return None


def detect_species(text: str, species_order: list[str], species_map: dict[str, str]) -> list[str]:
    found: list[str] = []
    for zh in species_order:
        if zh in text:
            en = species_map[zh]
            if en not in found:
                found.append(en)
        if len(found) >= 2:
            break
    return found


def join_species(names: list[str]) -> str:
    if len(names) == 1:
        return names[0]
    return f"{names[0]} and {names[1]}"


def with_article(noun: str) -> str:
    article = "an" if noun[:1].lower() in {"a", "e", "i", "o", "u"} else "a"
    return f"{article} {noun}"


def translate_mail_desc(text: str) -> str | None:
    return MAIL_DESC_EN.get(text)


def translate_desc_by_patterns(text: str, species_order: list[str], species_map: dict[str, str]) -> str | None:
    if "深灰科学博物馆" in text and "第三层开张" in text:
        species = detect_species(text, species_order, species_map)
        if species:
            return (
                f"Sold during a new third-floor commemorative event at a museum, this sigil draws on {species[0]} "
                "and the weight of its legendary story."
            )

    if "世界初始之树" in text:
        species = detect_species(text, species_order, species_map)
        if species:
            return (
                f"Found around the World Tree, this sigil is one of the three guardian designs and takes its look from {species[0]}."
            )

    if "古昔隐居地" in text and "吾思" in text:
        species = detect_species(text, species_order, species_map)
        if species:
            return (
                f"Gifted at Cogita's secluded retreat in Hisui, this sigil carries a {species[0]}-themed shape and a trace of old legend."
            )

    if "阿罗拉地区对原始部落神和图腾文化非常崇拜" in text:
        species = detect_species(text, species_order, species_map)
        if species:
            return (
                f"This sigil is steeped in Alolan totem lore and is linked to the legendary beast {species[0]}."
            )

    if "这是在真新镇附近的森林中发现的印记之章" in text:
        species = detect_species(text, species_order, species_map)
        if species:
            return (
                f"Found in the forest near Pallet Town, this sigil points explorers toward the elusive traces of {species[0]}."
            )

    if "这是伽勒尔地区特殊的道馆挑战的奖励" in text:
        species = detect_species(text, species_order, species_map)
        if species:
            return (
                f"Awarded for clearing Galar's special Gym challenge, this sigil draws on the image of {species[0]} and a royal steed."
            )

    if "随处可以买到的旅行探险必备用品，来自于千万个旅行者的推荐" in text:
        species = detect_species(text, species_order, species_map)
        if species:
            return (
                f"This traveler-favorite utility sigil was modeled after {species[0]} and turned into a practical exploration tool."
            )

    if "这枚印记之章现在在各个城市中发放" in text and "秘密武器" in text:
        species = detect_species(text, species_order, species_map)
        if species:
            return (
                f"This warning-style sigil references a chemical weapon secretly developed for Team Flare and based on {species[0]}."
            )

    if "零区研究所" in text and "防御工事" in text:
        species = detect_species(text, species_order, species_map)
        if species:
            return (
                f"Developed at the Area Zero laboratory, this sigil reflects a defensive weapon design inspired by {species[0]}."
            )

    return None


def detect_action(text: str) -> str:
    if any(token in text for token in ("可以买到", "售卖", "发售", "热销", "售罄")):
        return "sold"
    if any(token in text for token in ("赠送", "奖励", "获得")):
        return "awarded"
    if any(token in text for token in ("发现", "找到", "拾起", "捡起", "捡到", "搜出来")):
        return "found"
    if any(token in text for token in ("研制", "制作", "设计", "篆刻")):
        return "crafted"
    return "linked"


def summarize_desc(text: str, species_order: list[str], species_map: dict[str, str]) -> str:
    region = detect_region(text)
    place_kind = detect_place_kind(text)
    theme = detect_theme(text)
    species = detect_species(text, species_order, species_map)
    action = detect_action(text)

    if action == "sold":
        if place_kind in MARKET_PLACES and region:
            lead = f"This sigil is sold through {with_article(place_kind)} in {region}."
        elif place_kind in MARKET_PLACES:
            lead = f"This sigil is sold through {with_article(place_kind)}."
        elif region:
            lead = f"This sigil is sold as a keepsake in {region}."
        else:
            lead = "This sigil is sold as a themed keepsake."
    elif action == "awarded":
        if place_kind and place_kind not in LOW_SIGNAL_PLACES and region:
            lead = f"This sigil is awarded through {with_article(place_kind)} in {region}."
        elif place_kind and place_kind not in LOW_SIGNAL_PLACES:
            lead = f"This sigil is awarded through {with_article(place_kind)}."
        elif region:
            lead = f"This sigil is awarded to travelers in {region}."
        else:
            lead = "This sigil is awarded as a keepsake."
    elif action == "found":
        if place_kind and region:
            lead = f"This sigil is found around {with_article(place_kind)} in {region}."
        elif place_kind:
            lead = f"This sigil is found around {with_article(place_kind)}."
        elif region:
            lead = f"This sigil is found in the field across {region}."
        else:
            lead = "This sigil is found as a curious relic."
    elif action == "crafted":
        if place_kind and place_kind not in LOW_SIGNAL_PLACES and region:
            lead = f"This sigil was crafted around local lore from {with_article(place_kind)} in {region}."
        elif place_kind and place_kind not in LOW_SIGNAL_PLACES:
            lead = f"This sigil was crafted around local lore from {with_article(place_kind)}."
        elif region:
            lead = f"This sigil was crafted around local lore from {region}."
        else:
            lead = "This sigil was crafted as a special keepsake."
    else:
        if place_kind and place_kind not in LOW_SIGNAL_PLACES and region:
            lead = f"This sigil is tied to {with_article(place_kind)} in {region}."
        elif place_kind and place_kind not in LOW_SIGNAL_PLACES:
            lead = f"This sigil is tied to {with_article(place_kind)}."
        elif region:
            lead = f"This sigil is tied to regional lore in {region}."
        else:
            lead = "This sigil is tied to local lore."

    extras: list[str] = []
    if species:
        extras.append(f"It references {join_species(species)}.")
    if theme:
        extras.append(f"The design focuses on a {theme} motif.")
    if "传说" in text or "神话" in text or "据说" in text:
        extras.append("Its story is steeped in legend.")
    if "警示" in text or "谨慎前行" in text or "十分危险" in text:
        extras.append("It also serves as a warning for travelers.")
    if "纪念" in text or "纪念品" in text:
        extras.append("It is treated as a commemorative keepsake.")

    if not lead.endswith("."):
        lead += "."
    return " ".join([lead] + extras)


def translate_desc(row_id: str, text: str, species_order: list[str], species_map: dict[str, str]) -> str:
    if row_id in ROW_DESC_OVERRIDES:
        return ROW_DESC_OVERRIDES[row_id]

    exact_mail = translate_mail_desc(text)
    if exact_mail:
        return exact_mail

    special = translate_desc_by_patterns(text, species_order, species_map)
    if special:
        return special

    return summarize_desc(text, species_order, species_map)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    species_map = load_species_map(DICT_MD)
    species_order = sorted(species_map, key=len, reverse=True)

    with CSV_PATH.open(encoding="utf-8-sig", newline="") as f:
        rows = list(csv.reader(f))

    name_index = rows[0].index("name")
    desc_index = rows[0].index("desc")

    name_updates = 0
    desc_updates = 0
    missing_names: list[tuple[int, str, str]] = []
    remaining_cjk: list[tuple[int, str, str]] = []

    for row_no, row in enumerate(rows):
        if row_no < 3 or not any(row):
            continue
        row_id = row[0].strip()
        if not row_id:
            continue

        old_name = row[name_index].strip()
        new_name = NAME_MAP.get(old_name)
        if new_name is None:
            missing_names.append((row_no + 1, row_id, old_name))
            new_name = old_name
        elif row[name_index] != new_name:
            row[name_index] = new_name
            name_updates += 1

        old_desc = row[desc_index].strip()
        new_desc = translate_desc(row_id, old_desc, species_order, species_map)
        if row[desc_index] != new_desc:
            row[desc_index] = new_desc
            desc_updates += 1

        if CJK_RE.search(row[name_index]) or CJK_RE.search(row[desc_index]):
            remaining_cjk.append((row_no + 1, row_id, row[name_index]))

    print(f"name_updates={name_updates}")
    print(f"desc_updates={desc_updates}")
    print(f"missing_name_mappings={len(missing_names)}")
    for line_no, row_id, value in missing_names[:20]:
        print(f"missing_name line={line_no} id={row_id} value={value!r}")
    print(f"remaining_cjk_rows={len(remaining_cjk)}")
    for line_no, row_id, value in remaining_cjk[:20]:
        print(f"remaining_cjk line={line_no} id={row_id} value={value!r}")

    if missing_names or remaining_cjk:
        print("CSV not written: add the remaining mappings first.")
        return 1

    if not args.dry_run:
        with CSV_PATH.open("w", encoding="utf-8-sig", newline="") as f:
            csv.writer(f).writerows(rows)
        print(f"wrote {CSV_PATH}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
