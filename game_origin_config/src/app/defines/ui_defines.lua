slot0 = {}
globals.ui = slot0
slot0.FONT_PATH = "font/youmi.ttf"
slot0.FONT_SIZE = 40
slot0.DEFAULT_OUTLINE_SIZE = 4
slot0.TOUCH_MOVED_THRESHOLD = 10
slot0.TOUCH_MOVE_CANCAE_THRESHOLD = 35
slot5 = 249
slot4 = cc.c4b(slot5, 104, 151, 255)
slot0.COLORS = {
	WHITE = cc.c4b(255, 255, 255, 255),
	BLACK = cc.c4b(0, 0, 0, 255),
	RED = cc.c4b(255, 0, 0, 255),
	GREEN = cc.c4b(0, 255, 0, 255),
	BLUE = cc.c4b(0, 0, 255, 255),
	YELLOW = cc.c4b(255, 255, 0, 255),
	NORMAL = {
		DEFAULT = cc.c4b(91, 84, 91, 255),
		WHITE = cc.c4b(255, 252, 237, 255),
		RED = cc.c4b(241, 59, 84, 255),
		GRAY = cc.c4b(183, 176, 158, 255),
		LIGHT_GREEN = cc.c4b(174, 233, 126, 255),
		FRIEND_GREEN = cc.c4b(96, 196, 86, 255),
		ALERT_YELLOW = cc.c4b(236, 183, 42, 255),
		ALERT_ORANGE = cc.c4b(247, 107, 69, 255),
		ALERT_GREEN = cc.c4b(174, 233, 126, 255),
		PINK = cc.c4b(228, 82, 77, 255),
		GREEN = cc.c4b(136, 200, 85, 255),
		CLARET = cc.c4b(139, 34, 16, 255),
		WARM_YELLOW = cc.c4b(241, 188, 76, 255),
		DULL_YELLOW = cc.c4b(175, 101, 14, 255),
		BLACK = cc.c4b(59, 51, 59, 255),
		BROWN = cc.c4b(86, 8, 2, 255)
	},
	GLOW = {
		WHITE = cc.c4b(255, 255, 255, 128),
		RED = cc.c4b(146, 12, 47, 153),
		YELLOW = cc.c4b(255, 234, 0, 255)
	},
	DISABLED = {
		WHITE = cc.c4b(222, 218, 208, 255),
		GRAY = cc.c4b(183, 176, 158, 255),
		TITLE_GRAY = cc.c4b(159, 146, 141, 255),
		SUBTITLE_GRAY = cc.c4b(172, 172, 169, 255),
		YELLOW = cc.c4b(239, 95, 28, 255)
	},
	OUTLINE = {
		DEFAULT = cc.c4b(91, 84, 91, 255),
		RED = cc.c4b(124, 44, 52, 255),
		GREEN = cc.c4b(77, 94, 67, 255),
		WHITE = cc.c4b(255, 252, 237, 255),
		BLUE = cc.c4b(28, 114, 154, 255),
		PURPLE = cc.c4b(126, 58, 222, 255),
		ATROVIRENS = cc.c4b(19, 140, 104, 255),
		ORANGE = cc.c4b(240, 75, 52, 255)
	},
	QUALITY = {
		cc.c4b(153, 153, 153, 255),
		cc.c4b(92, 153, 112, 255),
		cc.c4b(61, 138, 153, 255),
		cc.c4b(138, 92, 153, 255),
		cc.c4b(230, 153, 0, 255),
		cc.c4b(230, 116, 34, 255),
		cc.c4b(241, 59, 84, 255)
	},
	QUALITY_OUTLINE = {
		cc.c4b(91, 84, 91, 255),
		cc.c4b(102, 128, 110, 255),
		cc.c4b(76, 115, 153, 255),
		cc.c4b(115, 76, 128, 255),
		cc.c4b(178, 119, 0, 255),
		cc.c4b(178, 74, 45, 255),
		cc.c4b(218, 60, 79, 255)
	},
	QUALITY_DARK = {
		cc.c4b(222, 218, 209, 255),
		cc.c4b(145, 225, 147, 255),
		cc.c4b(139, 175, 223, 255),
		cc.c4b(203, 142, 222, 255),
		cc.c4b(236, 183, 42, 255),
		cc.c4b(243, 137, 93, 255),
		cc.c4b(238, 115, 143, 255)
	},
	ATTR = {
		[game.NATURE_ENUM_TABLE.normal] = cc.c4b(170, 149, 137, 255),
		[game.NATURE_ENUM_TABLE.fire] = cc.c4b(233, 54, 68, 255),
		[game.NATURE_ENUM_TABLE.water] = cc.c4b(125, 145, 243, 255),
		[game.NATURE_ENUM_TABLE.grass] = cc.c4b(62, 194, 65, 255),
		[game.NATURE_ENUM_TABLE.electricity] = cc.c4b(255, 198, 0, 255),
		[game.NATURE_ENUM_TABLE.ice] = cc.c4b(73, 214, 236, 255),
		[game.NATURE_ENUM_TABLE.combat] = cc.c4b(248, 115, 75, 255),
		[game.NATURE_ENUM_TABLE.poison] = cc.c4b(141, 93, 206, 255),
		[game.NATURE_ENUM_TABLE.ground] = cc.c4b(133, 130, 96, 255),
		[game.NATURE_ENUM_TABLE.fly] = cc.c4b(76, 160, 243, 255),
		[game.NATURE_ENUM_TABLE.super] = cc.c4b(219, 91, 187, 255),
		[game.NATURE_ENUM_TABLE.worm] = cc.c4b(195, 196, 14, 255),
		[game.NATURE_ENUM_TABLE.rock] = cc.c4b(171, 136, 79, 255),
		[game.NATURE_ENUM_TABLE.ghost] = cc.c4b(74, 84, 93, 255),
		[game.NATURE_ENUM_TABLE.dragon] = cc.c4b(137, 111, 230, 255),
		[game.NATURE_ENUM_TABLE.evil] = cc.c4b(151, 116, 106, 255),
		[game.NATURE_ENUM_TABLE.steel] = cc.c4b(111, 145, 156, 255),
		[game.NATURE_ENUM_TABLE.fairy] = slot4
	}
}
slot0.ATTRCOLOR = {
	water = "#C0xFF8DB9FC#",
	fire = "#C0xFFF76A6B#",
	normal = "#C0xFFC6B6AC#",
	combat = "#C0xFFF98562#",
	poison = "#C0xFFAE7EDE#",
	ground = "#C0xFFB8B7B1#",
	worm = "#C0xFFC4D138#",
	fairy = "#C0xFFF96494#",
	ice = "#C0xFF6BDBEC#",
	super = "#C0xFFE76FD7#",
	evil = "#C0xFFAF8B85#",
	grass = "#C0xFF87DC87#",
	ghost = "#C0xFF788797#",
	fly = "#C0xFF85CEFC#",
	dragon = "#C0xFFABA2FF#",
	rock = "#C0xFFBE9E6A#",
	electricity = "#C0xFFE5CC3B#",
	steel = "#C0xFFA5B8BE#"
}
slot0.QUALITYCOLOR = {
	"#C0x999999#",
	"#C0x5C9970#",
	"#C0x3D8A99#",
	"#C0x8A5C99#",
	"#C0xE69900#",
	"#C0xE67422#",
	"#C0xF13B54#"
}
slot0.QUALITY_DARK_COLOR = {
	"#C0x999999#",
	"#C0x91E1B1#",
	"#C0x8BAFDF#",
	"#C0xCB8EDE#",
	"#C0xECB72A#",
	"#C0xF3895B#",
	"#C0xEE738F#"
}
slot0.QUALITY_OUTLINE_COLOR = {
	"#C0x5B545B#",
	"#C0x66806E#",
	"#C0x4C7399#",
	"#C0x734C80#",
	"#C0xB27700#",
	"#C0xB24A2D#",
	"#C0xDA3C4F#"
}
slot0.QUALITY_COLOR_SINGLE_TEXT = {
	"white",
	"green",
	"blue",
	"purple",
	"orange",
	"red",
	"rose"
}
slot0.QUALITY_COLOR_TEXT = {
	"whiteText",
	"greenText",
	"blueText",
	"purpleText",
	"orangeText",
	"redText",
	"roseText"
}
slot0.ATTR_LOGO = {
	defence = "common/icon/attribute/icon_defense.png",
	specialDamage = "common/icon/attribute/icon_spattack.png",
	damage = "common/icon/attribute/icon_attack.png",
	hp = "common/icon/attribute/icon_life.png",
	specialDefence = "common/icon/attribute/icon_spdefense.png",
	speed = "common/icon/attribute/icon_speed.png"
}
slot0.ATTR_ICON = {}
slot0.SKILL_ICON = {}
slot0.SKILL_TEXT_ICON = {}

for slot4, slot5 in ipairs(game.NATURE_TABLE) do
	slot0.ATTR_ICON[slot4] = string.format("common/icon/attr/icon_%s.png", slot5)
	slot0.SKILL_ICON[slot4] = string.format("common/icon/skill/icon_%s.png", slot5)
	slot0.SKILL_TEXT_ICON[slot4] = string.format("common/icon/skill_text/icon_%s.png", slot5)
end

slot0.ATTR_MAX = #slot0.ATTR_ICON + 1
slot0.RARITY_ICON = {}

for slot4 = 0, 5 do
	slot0.RARITY_ICON[slot4] = string.format("common/icon/icon_rarity%d.png", slot4 + 1)
end

slot0.RARITY_LAST_VAL = table.maxn(slot0.RARITY_ICON) + 1
slot0.RARITY_TEXT = {
	[0] = "C",
	"B",
	"A",
	"S",
	"SS",
	"SSS"
}
slot0.RARITY_DATAS = {}

for slot4 = 1, 5 do
	table.insert(slot0.RARITY_DATAS, {
		rarity = slot4
	})
end

slot0.COMMON_ICON = {
	coin3 = "common/icon/icon_ghb.png",
	rmb = "common/icon/icon_diamond.png",
	coin6 = "common/icon/icon_sydhdb1.png",
	stamina = "common/icon/icon_stamina.png",
	coin9 = "common/icon/icon_kfsydhdb2.png",
	coin1 = "common/icon/icon_ryb.png",
	coin4 = "common/icon/icon_jxlj.png",
	gold = "common/icon/icon_gold.png",
	coin7 = "common/icon/icon_sydhdb2.png",
	coin10 = "common/icon/icon_ghzb1.png",
	coin2 = "common/icon/icon_ytjj.png",
	coin11 = "common/icon/icon_ghzb2.png",
	coin5 = "common/icon/icon_frgitm.png",
	coin8 = "common/icon/icon_kfsydhdb1.png",
	overflow_exp = "common/icon/icon_jyb.png"
}
slot0.QUALITY_BOX = {}
slot0.QUALITY_FRAME = {}

for slot4 = 1, game.QUALITY_MAX do
	slot0.QUALITY_BOX[slot4] = string.format("common/icon/panel_icon_%d.png", slot4)
	slot0.QUALITY_FRAME[slot4] = string.format("common/icon/tag_digital%d.png", slot4)
end

slot0.VIP_ICON = {}

for slot4 = 1, 23 do
	slot0.VIP_ICON[slot4] = string.format("common/icon/vip/icon_vip%d.png", slot4)
end

slot0.RANK_ICON = {
	"city/rank/icon_jp.png",
	"city/rank/icon_yp.png",
	"city/rank/icon_tp.png",
	"common/icon/icon_four.png"
}
slot0.SOUND_LIST = {
	["advance_suc.mp3"] = {
		musicLens = 2,
		weekOpen = true
	},
	["battle_false.mp3"] = {
		musicLens = 2,
		weekOpen = true
	},
	["card_gain.mp3"] = {
		musicLens = 4,
		weekOpen = true
	},
	["drawcard_one.mp3"] = {
		musicLens = 3,
		weekOpen = true
	},
	["drawcard_one2.mp3"] = {
		musicLens = 2,
		weekOpen = true
	},
	["drawcard_ten.mp3"] = {
		musicLens = 9,
		weekOpen = true
	},
	["drawcard_ten2.mp3"] = {
		musicLens = 2,
		weekOpen = true
	},
	["evolution.mp3"] = {
		musicLens = 13,
		weekOpen = true
	},
	["gate_win.mp3"] = {
		musicLens = 2,
		weekOpen = true
	},
	["item_gain.mp3"] = {
		musicLens = 2,
		weekOpen = true
	},
	["pve_win.mp3"] = {
		musicLens = 4,
		weekOpen = true
	},
	["pvp_win.mp3"] = {
		musicLens = 3,
		weekOpen = true
	},
	["qiangdilaixi.mp3"] = {
		musicLens = 2,
		weekOpen = true
	},
	["role_levelup.mp3"] = {
		musicLens = 3,
		weekOpen = true
	},
	["golden.mp3"] = {
		musicLens = 3,
		weekOpen = false
	},
	["refinement.mp3"] = {
		musicLens = 3,
		weekOpen = false
	},
	["star.mp3"] = {
		musicLens = 3,
		weekOpen = false
	},
	["formation.mp3"] = {
		musicLens = 3,
		weekOpen = false
	},
	["equip.mp3"] = {
		musicLens = 3,
		weekOpen = false
	},
	["click.mp3"] = {
		musicLens = 3,
		weekOpen = false
	},
	["circle.mp3"] = {
		musicLens = 3,
		weekOpen = false
	},
	["flop.mp3"] = {
		musicLens = 3,
		weekOpen = true
	},
	["zaixianlibao.mp3"] = {
		musicLens = 5,
		weekOpen = true
	},
	["gem_draw_1.mp3"] = {
		musicLens = 3,
		weekOpen = true
	},
	["gem_diamond_10.mp3"] = {
		musicLens = 3,
		weekOpen = true
	},
	["gem_gold_10.mp3"] = {
		musicLens = 3,
		weekOpen = true
	}
}
slot0.TOUCH_SOUND_LIST = {
	"click_1.mp3",
	"click_2.mp3"
}
slot0.PRELOAD_EFFECT_LIST = {
	"advance_suc.mp3",
	"item_gain.mp3",
	"iconpopup.mp3",
	"golden.mp3",
	"card_gain.mp3",
	"role_levelup.mp3",
	"popupopen.mp3",
	"popupclose.mp3",
	"click_1.mp3",
	"click_2.mp3",
	"newbie_finish.mp3",
	"drawcard_one.mp3",
	"drawcard_one2.mp3",
	"drawcard_ten.mp3",
	"drawcard_ten2.mp3",
	"zaixianlibao.mp3",
	"evolution.mp3",
	"gem_draw_1.mp3",
	"gem_gold_10.mp3",
	"gem_diamond_10.mp3"
}
slot0.IGNORE_CLEAN_MAP = {
	["battle.view"] = true,
	["battle.loading"] = true
}
slot0.GEM_SUIT_ICON = {
	"city/card/gem/suit/icon_t1.png",
	"city/card/gem/suit/icon_t6.png",
	"city/card/gem/suit/icon_t9.png",
	"city/card/gem/suit/icon_t4.png",
	"city/card/gem/suit/icon_t7.png",
	"city/card/gem/suit/icon_t3.png",
	"city/card/gem/suit/icon_t2.png",
	"city/card/gem/suit/icon_t5.png",
	"city/card/gem/suit/icon_t8.png"
}
slot0.CONSOLE_COLOR = {
	Default = 7,
	Dark_Yellow = 6,
	Light_Blue = 9,
	Dark_Blue_Green = 3,
	Dark_Blue = 1,
	Dark_Purple = 5,
	Light_Purple = 13,
	Light_Blue_Green = 11,
	Light_Black = 8,
	Dark_Red = 4,
	Light_Green = 10,
	Dark_Green = 2,
	Light_Red = 12,
	Dark_black = 0,
	Light_Yellow = 14,
	Light_White = 15
}
slot0.CARD_USING_TXTS = {
	starAid = "inStarAid",
	crossunionfight = "inCrossUnionCombat",
	arena = "inArena",
	gymLeader = "inGymEmbattle",
	crossMine = "inCrossMine",
	meteorites = "inMeteorites",
	relieveC = "inRelieve",
	unionFight = "inUnionCombat",
	craft = "inCraft",
	activeAid = "inAiding",
	crossArena = "inCrossArena",
	crossCraft = "inCrossCraft",
	meteorSameSprite = "inMeteorSameSprite",
	unionTraining = "inUnionTrain",
	gymBadgeGuard = "inGymBadgeGuard",
	mergeAB = "inMerge",
	crossGymLeader = "inCrossGymEmbattle",
	battle = "inCityTeam",
	crossSupremacy = "inCrossSupremacy",
	cloneBattle = "inCloneBattle"
}
slot0.CONTRACT_QUALITY_ITEM = {
	nil,
	9051,
	9052,
	9053,
	9054,
	9055
}
