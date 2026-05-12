slot0 = {
	{
		__size = 0
	},
	__size = 18,
	[4] = {
		__size = 1,
		[14] = {
			10,
			51
		}
	},
	[6] = {
		__size = 1,
		[14] = {
			20,
			51
		}
	},
	[8] = {
		__size = 1,
		[14] = {
			30,
			51
		}
	},
	[10] = {
		__size = 1,
		[14] = {
			40,
			51
		}
	},
	[13] = {
		__size = 1,
		[15] = {
			10,
			51
		}
	},
	[15] = {
		__size = 1,
		[15] = {
			20,
			51
		}
	},
	[17] = {
		__size = 1,
		[15] = {
			30,
			51
		}
	},
	[19] = {
		__size = 1,
		[15] = {
			40,
			51
		}
	},
	[22] = {
		__size = 1,
		[16] = {
			10,
			51
		}
	},
	[24] = {
		__size = 1,
		[16] = {
			20,
			51
		}
	},
	[26] = {
		__size = 1,
		[16] = {
			30,
			51
		}
	},
	[28] = {
		__size = 1,
		[16] = {
			40,
			51
		}
	},
	[31] = {
		__size = 1,
		[17] = {
			10,
			51
		}
	},
	[33] = {
		__size = 1,
		[17] = {
			20,
			51
		}
	},
	[35] = {
		__size = 1,
		[17] = {
			30,
			51
		}
	},
	[37] = {
		__size = 1,
		[17] = {
			40,
			51
		}
	},
	[39] = {
		__size = 4,
		[15] = {
			10,
			51
		},
		[14] = {
			10,
			51
		},
		[17] = {
			10,
			51
		},
		[16] = {
			10,
			51
		}
	}
}
slot1 = {
	[604] = slot0[19],
	[601] = slot0[13],
	[603] = slot0[17],
	[602] = slot0[15],
	[704] = slot0[28],
	[1204] = slot0[37],
	[1201] = slot0[31],
	[701] = slot0[22],
	[702] = slot0[24],
	[703] = slot0[26],
	default = slot0[1],
	[2051] = slot0[39],
	[2052] = slot0[39],
	[407] = slot0[35],
	[405] = slot0[33],
	[403] = slot0[31],
	[2032] = slot0[39],
	[2031] = slot0[39],
	[2012] = slot0[39],
	[504] = slot0[10],
	[502] = slot0[6],
	[503] = slot0[8],
	[409] = slot0[37],
	[501] = slot0[4],
	[309] = slot0[28],
	[203] = slot0[13],
	[205] = slot0[15],
	[207] = slot0[17],
	[209] = slot0[19],
	[303] = slot0[22],
	[305] = slot0[24],
	[307] = slot0[26],
	[109] = slot0[10],
	[1203] = slot0[35],
	[2021] = slot0[39],
	[103] = slot0[4],
	[1202] = slot0[33],
	[107] = slot0[8],
	[105] = slot0[6],
	[902] = slot0[6],
	[903] = slot0[8],
	[901] = slot0[4],
	[904] = slot0[10],
	[2011] = slot0[39],
	[2002] = slot0[39],
	[1104] = slot0[28],
	[2001] = slot0[39],
	[1102] = slot0[24],
	[1103] = slot0[26],
	[2022] = slot0[39],
	[1101] = slot0[22],
	[803] = slot0[35],
	[802] = slot0[33],
	[801] = slot0[31],
	[1004] = slot0[19],
	[1003] = slot0[17],
	[1002] = slot0[15],
	[1001] = slot0[13],
	[804] = slot0[37]
}
csv.town.relic_buff = {
	__size = 82,
	[91] = {
		id = 91,
		weight = 100,
		lotteryType = 10
	},
	[101] = {
		param = 0.2,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-金币副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 1,
		id = 101,
		weight = 100,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[14] = {
				1,
				51
			}
		}
	},
	[102] = {
		param = 0.2,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-金币副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 1,
		id = 102,
		weight = 95,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[14] = {
				5,
				51
			}
		}
	},
	[103] = {
		param = 0.25,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-金币副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 1,
		id = 103,
		weight = 90,
		effectiveTimes = 1,
		relicLevelLimit = slot1[103]
	},
	[104] = {
		param = 0.25,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-金币副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 1,
		id = 104,
		weight = 85,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[14] = {
				15,
				51
			}
		}
	},
	[105] = {
		param = 0.3,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-金币副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 1,
		id = 105,
		weight = 80,
		effectiveTimes = 1,
		relicLevelLimit = slot1[105]
	},
	[106] = {
		param = 0.35,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-金币副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 1,
		id = 106,
		weight = 75,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[14] = {
				25,
				51
			}
		}
	},
	[107] = {
		param = 0.4,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-金币副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 1,
		id = 107,
		weight = 70,
		effectiveTimes = 1,
		relicLevelLimit = slot1[107]
	},
	[108] = {
		param = 0.45,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-金币副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 1,
		id = 108,
		weight = 65,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[14] = {
				35,
				51
			}
		}
	},
	[109] = {
		param = 0.5,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-金币副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 1,
		id = 109,
		weight = 60,
		effectiveTimes = 1,
		relicLevelLimit = slot1[109]
	},
	[201] = {
		param = 0.2,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-经验副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 2,
		id = 201,
		weight = 100,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[15] = {
				1,
				51
			}
		}
	},
	[202] = {
		param = 0.2,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-经验副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 2,
		id = 202,
		weight = 95,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[15] = {
				5,
				51
			}
		}
	},
	[203] = {
		param = 0.25,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-经验副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 2,
		id = 203,
		weight = 90,
		effectiveTimes = 1,
		relicLevelLimit = slot1[203]
	},
	[204] = {
		param = 0.25,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-经验副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 2,
		id = 204,
		weight = 85,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[15] = {
				15,
				51
			}
		}
	},
	[205] = {
		param = 0.3,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-经验副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 2,
		id = 205,
		weight = 80,
		effectiveTimes = 1,
		relicLevelLimit = slot1[205]
	},
	[206] = {
		param = 0.35,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-经验副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 2,
		id = 206,
		weight = 75,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[15] = {
				25,
				51
			}
		}
	},
	[207] = {
		param = 0.4,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-经验副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 2,
		id = 207,
		weight = 70,
		effectiveTimes = 1,
		relicLevelLimit = slot1[207]
	},
	[208] = {
		param = 0.45,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-经验副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 2,
		id = 208,
		weight = 65,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[15] = {
				35,
				51
			}
		}
	},
	[209] = {
		param = 0.5,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-经验副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 2,
		id = 209,
		weight = 60,
		effectiveTimes = 1,
		relicLevelLimit = slot1[209]
	},
	[301] = {
		param = 0.2,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-礼物副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 3,
		id = 301,
		weight = 100,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[16] = {
				1,
				51
			}
		}
	},
	[302] = {
		param = 0.2,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-礼物副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 3,
		id = 302,
		weight = 95,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[16] = {
				5,
				51
			}
		}
	},
	[303] = {
		param = 0.25,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-礼物副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 3,
		id = 303,
		weight = 90,
		effectiveTimes = 1,
		relicLevelLimit = slot1[303]
	},
	[304] = {
		param = 0.25,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-礼物副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 3,
		id = 304,
		weight = 85,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[16] = {
				15,
				51
			}
		}
	},
	[305] = {
		param = 0.3,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-礼物副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 3,
		id = 305,
		weight = 80,
		effectiveTimes = 1,
		relicLevelLimit = slot1[305]
	},
	[306] = {
		param = 0.35,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-礼物副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 3,
		id = 306,
		weight = 75,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[16] = {
				25,
				51
			}
		}
	},
	[307] = {
		param = 0.4,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-礼物副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 3,
		id = 307,
		weight = 70,
		effectiveTimes = 1,
		relicLevelLimit = slot1[307]
	},
	[308] = {
		param = 0.45,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-礼物副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 3,
		id = 308,
		weight = 65,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[16] = {
				35,
				51
			}
		}
	},
	[309] = {
		param = 0.5,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-礼物副本#C0x5B545B#中，任一难度副本产出增加%s，持续%d次",
		type = 3,
		id = 309,
		weight = 60,
		effectiveTimes = 1,
		relicLevelLimit = slot1[309]
	},
	[401] = {
		param = 0.2,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-碎片副本#C0x5B545B#中，任一难度副本道具产出增加%s，且%s的概率再获得1个碎片，持续%d次",
		type = 4,
		id = 401,
		weight = 100,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[17] = {
				1,
				51
			}
		}
	},
	[402] = {
		param = 0.2,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-碎片副本#C0x5B545B#中，任一难度副本道具产出增加%s，且%s的概率再获得1个碎片，持续%d次",
		type = 4,
		id = 402,
		weight = 95,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[17] = {
				5,
				51
			}
		}
	},
	[403] = {
		param = 0.25,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-碎片副本#C0x5B545B#中，任一难度副本道具产出增加%s，且%s的概率再获得1个碎片，持续%d次",
		type = 4,
		id = 403,
		weight = 90,
		effectiveTimes = 1,
		relicLevelLimit = slot1[403]
	},
	[404] = {
		param = 0.25,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-碎片副本#C0x5B545B#中，任一难度副本道具产出增加%s，且%s的概率再获得1个碎片，持续%d次",
		type = 4,
		id = 404,
		weight = 85,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[17] = {
				15,
				51
			}
		}
	},
	[405] = {
		param = 0.3,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-碎片副本#C0x5B545B#中，任一难度副本道具产出增加%s，且%s的概率再获得1个碎片，持续%d次",
		type = 4,
		id = 405,
		weight = 80,
		effectiveTimes = 1,
		relicLevelLimit = slot1[405]
	},
	[406] = {
		param = 0.35,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-碎片副本#C0x5B545B#中，任一难度副本道具产出增加%s，且%s的概率再获得1个碎片，持续%d次",
		type = 4,
		id = 406,
		weight = 75,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[17] = {
				25,
				51
			}
		}
	},
	[407] = {
		param = 0.4,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-碎片副本#C0x5B545B#中，任一难度副本道具产出增加%s，且%s的概率再获得1个碎片，持续%d次",
		type = 4,
		id = 407,
		weight = 70,
		effectiveTimes = 1,
		relicLevelLimit = slot1[407]
	},
	[408] = {
		param = 0.45,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-碎片副本#C0x5B545B#中，任一难度副本道具产出增加%s，且%s的概率再获得1个碎片，持续%d次",
		type = 4,
		id = 408,
		weight = 65,
		effectiveTimes = 1,
		relicLevelLimit = {
			__size = 1,
			[17] = {
				35,
				51
			}
		}
	},
	[409] = {
		param = 0.5,
		lotteryType = 11,
		desc = "#C0xF76B45#冒险-日常副本-碎片副本#C0x5B545B#中，任一难度副本道具产出增加%s，且%s的概率再获得1个碎片，持续%d次",
		type = 4,
		id = 409,
		weight = 60,
		effectiveTimes = 1,
		relicLevelLimit = slot1[409]
	},
	[501] = {
		param = 0.05,
		lotteryType = 12,
		duration = 24,
		type = 5,
		id = 501,
		weight = 100,
		desc = "#C0xF76B45#冒险-冒险之路#C0x5B545B#中，24小时以内，扫荡时概率获得的道具再增加%s的获得概率",
		relicLevelLimit = slot1[501]
	},
	[502] = {
		param = 0.075,
		lotteryType = 12,
		duration = 24,
		type = 5,
		id = 502,
		weight = 80,
		desc = "#C0xF76B45#冒险-冒险之路#C0x5B545B#中，24小时以内，扫荡时概率获得的道具再增加%s的获得概率",
		relicLevelLimit = slot1[502]
	},
	[503] = {
		param = 0.1,
		lotteryType = 12,
		duration = 24,
		type = 5,
		id = 503,
		weight = 60,
		desc = "#C0xF76B45#冒险-冒险之路#C0x5B545B#中，24小时以内，扫荡时概率获得的道具再增加%s的获得概率",
		relicLevelLimit = slot1[503]
	},
	[504] = {
		param = 0.125,
		lotteryType = 12,
		duration = 24,
		type = 5,
		id = 504,
		weight = 40,
		desc = "#C0xF76B45#冒险-冒险之路#C0x5B545B#中，24小时以内，扫荡时概率获得的道具再增加%s的获得概率",
		relicLevelLimit = slot1[504]
	},
	[505] = {
		id = 505,
		weight = 1,
		lotteryType = 12
	},
	[601] = {
		param = 1,
		lotteryType = 12,
		desc = "#C0xF76B45#冒险-派遣#C0x5B545B#中，派遣任务获得的奖励翻倍，持续%d次",
		type = 6,
		id = 601,
		weight = 100,
		effectiveTimes = 1,
		relicLevelLimit = slot1[601]
	},
	[602] = {
		param = 1,
		lotteryType = 12,
		desc = "#C0xF76B45#冒险-派遣#C0x5B545B#中，派遣任务获得的奖励翻倍，持续%d次",
		type = 6,
		id = 602,
		weight = 80,
		effectiveTimes = 2,
		relicLevelLimit = slot1[602]
	},
	[603] = {
		param = 1,
		lotteryType = 12,
		desc = "#C0xF76B45#冒险-派遣#C0x5B545B#中，派遣任务获得的奖励翻倍，持续%d次",
		type = 6,
		id = 603,
		weight = 60,
		effectiveTimes = 3,
		relicLevelLimit = slot1[603]
	},
	[604] = {
		param = 1,
		lotteryType = 12,
		desc = "#C0xF76B45#冒险-派遣#C0x5B545B#中，派遣任务获得的奖励翻倍，持续%d次",
		type = 6,
		id = 604,
		weight = 40,
		effectiveTimes = 4,
		relicLevelLimit = slot1[604]
	},
	[701] = {
		param = 0.2,
		lotteryType = 12,
		desc = "#C0xF76B45#购买体力#C0x5B545B#时，可多获得%s的体力值，持续%d次",
		type = 7,
		id = 701,
		weight = 100,
		effectiveTimes = 1,
		relicLevelLimit = slot1[701]
	},
	[702] = {
		param = 0.2,
		lotteryType = 12,
		desc = "#C0xF76B45#购买体力#C0x5B545B#时，可多获得%s的体力值，持续%d次",
		type = 7,
		id = 702,
		weight = 80,
		effectiveTimes = 2,
		relicLevelLimit = slot1[702]
	},
	[703] = {
		param = 0.2,
		lotteryType = 12,
		desc = "#C0xF76B45#购买体力#C0x5B545B#时，可多获得%s的体力值，持续%d次",
		type = 7,
		id = 703,
		weight = 60,
		effectiveTimes = 3,
		relicLevelLimit = slot1[703]
	},
	[704] = {
		param = 0.2,
		lotteryType = 12,
		desc = "#C0xF76B45#购买体力#C0x5B545B#时，可多获得%s的体力值，持续%d次",
		type = 7,
		id = 704,
		weight = 40,
		effectiveTimes = 4,
		relicLevelLimit = slot1[704]
	},
	[801] = {
		param = 0.3,
		lotteryType = 12,
		desc = "#C0xF76B45#聚宝#C0x5B545B#时，可多获得%s（在单次聚宝获得金币的基础上）的金币奖励，持续%d次",
		type = 8,
		id = 801,
		weight = 100,
		effectiveTimes = 1,
		relicLevelLimit = slot1[801]
	},
	[802] = {
		param = 0.3,
		lotteryType = 12,
		desc = "#C0xF76B45#聚宝#C0x5B545B#时，可多获得%s（在单次聚宝获得金币的基础上）的金币奖励，持续%d次",
		type = 8,
		id = 802,
		weight = 80,
		effectiveTimes = 2,
		relicLevelLimit = slot1[802]
	},
	[803] = {
		param = 0.3,
		lotteryType = 12,
		desc = "#C0xF76B45#聚宝#C0x5B545B#时，可多获得%s（在单次聚宝获得金币的基础上）的金币奖励，持续%d次",
		type = 8,
		id = 803,
		weight = 60,
		effectiveTimes = 3,
		relicLevelLimit = slot1[803]
	},
	[804] = {
		param = 0.3,
		lotteryType = 12,
		desc = "#C0xF76B45#聚宝#C0x5B545B#时，可多获得%s（在单次聚宝获得金币的基础上）的金币奖励，持续%d次",
		type = 8,
		id = 804,
		weight = 40,
		effectiveTimes = 4,
		relicLevelLimit = slot1[804]
	},
	[901] = {
		param = 0.1,
		lotteryType = 13,
		desc = "#C0xF76B45#在家园未知探险#C0x5B545B#中，探险消耗甜点减少%s（在初始值的基础上减少），持续%d次（提前召回祝福不予返还）",
		type = 9,
		id = 901,
		weight = 100,
		effectiveTimes = 1,
		relicLevelLimit = slot1[901]
	},
	[902] = {
		param = 0.15,
		lotteryType = 13,
		desc = "#C0xF76B45#在家园未知探险#C0x5B545B#中，探险消耗甜点减少%s（在初始值的基础上减少），持续%d次（提前召回祝福不予返还）",
		type = 9,
		id = 902,
		weight = 80,
		effectiveTimes = 2,
		relicLevelLimit = slot1[902]
	},
	[903] = {
		param = 0.2,
		lotteryType = 13,
		desc = "#C0xF76B45#在家园未知探险#C0x5B545B#中，探险消耗甜点减少%s（在初始值的基础上减少），持续%d次（提前召回祝福不予返还）",
		type = 9,
		id = 903,
		weight = 60,
		effectiveTimes = 3,
		relicLevelLimit = slot1[903]
	},
	[904] = {
		param = 0.25,
		lotteryType = 13,
		desc = "#C0xF76B45#在家园未知探险#C0x5B545B#中，探险消耗甜点减少%s（在初始值的基础上减少），持续%d次（提前召回祝福不予返还）",
		type = 9,
		id = 904,
		weight = 40,
		effectiveTimes = 4,
		relicLevelLimit = slot1[904]
	},
	[905] = {
		id = 905,
		weight = 1,
		lotteryType = 13
	},
	[1001] = {
		param = 0.1,
		lotteryType = 13,
		duration = 6,
		type = 10,
		id = 1001,
		weight = 100,
		desc = "#C0xF76B45#家园伐木场#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1001]
	},
	[1002] = {
		param = 0.15,
		lotteryType = 13,
		duration = 6,
		type = 10,
		id = 1002,
		weight = 80,
		desc = "#C0xF76B45#家园伐木场#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1002]
	},
	[1003] = {
		param = 0.2,
		lotteryType = 13,
		duration = 6,
		type = 10,
		id = 1003,
		weight = 60,
		desc = "#C0xF76B45#家园伐木场#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1003]
	},
	[1004] = {
		param = 0.25,
		lotteryType = 13,
		duration = 6,
		type = 10,
		id = 1004,
		weight = 40,
		desc = "#C0xF76B45#家园伐木场#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1004]
	},
	[1101] = {
		param = 0.1,
		lotteryType = 13,
		duration = 6,
		type = 11,
		id = 1101,
		weight = 100,
		desc = "#C0xF76B45#家园炼金厂#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1101]
	},
	[1102] = {
		param = 0.15,
		lotteryType = 13,
		duration = 6,
		type = 11,
		id = 1102,
		weight = 80,
		desc = "#C0xF76B45#家园炼金厂#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1102]
	},
	[1103] = {
		param = 0.2,
		lotteryType = 13,
		duration = 6,
		type = 11,
		id = 1103,
		weight = 60,
		desc = "#C0xF76B45#家园炼金厂#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1103]
	},
	[1104] = {
		param = 0.25,
		lotteryType = 13,
		duration = 6,
		type = 11,
		id = 1104,
		weight = 40,
		desc = "#C0xF76B45#家园炼金厂#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1104]
	},
	[1201] = {
		param = 0.1,
		lotteryType = 13,
		duration = 6,
		type = 12,
		id = 1201,
		weight = 100,
		desc = "#C0xF76B45#家园甜品站#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1201]
	},
	[1202] = {
		param = 0.15,
		lotteryType = 13,
		duration = 6,
		type = 12,
		id = 1202,
		weight = 80,
		desc = "#C0xF76B45#家园甜品站#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1202]
	},
	[1203] = {
		param = 0.2,
		lotteryType = 13,
		duration = 6,
		type = 12,
		id = 1203,
		weight = 60,
		desc = "#C0xF76B45#家园甜品站#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1203]
	},
	[1204] = {
		param = 0.25,
		lotteryType = 13,
		duration = 6,
		type = 12,
		id = 1204,
		weight = 40,
		desc = "#C0xF76B45#家园甜品站#C0x5B545B#中，生产速度增加%s/小时（在初始速度的基础上），持续%d小时",
		relicLevelLimit = slot1[1204]
	},
	[2001] = {
		id = 2001,
		weight = 100,
		lotteryType = 14,
		award = {
			__size = 1,
			[502.0] = 2
		},
		relicLevelLimit = slot1[2001]
	},
	[2002] = {
		id = 2002,
		weight = 50,
		lotteryType = 14,
		award = {
			__size = 1,
			[521.0] = 1
		},
		relicLevelLimit = slot1[2002]
	},
	[2011] = {
		id = 2011,
		weight = 100,
		lotteryType = 14,
		award = {
			gold = 500000,
			__size = 1
		},
		relicLevelLimit = slot1[2011]
	},
	[2012] = {
		id = 2012,
		weight = 30,
		lotteryType = 14,
		award = {
			gold = 1000000,
			__size = 1
		},
		relicLevelLimit = slot1[2012]
	},
	[2021] = {
		id = 2021,
		weight = 100,
		lotteryType = 14,
		award = {
			__size = 1,
			rmb = 88
		},
		relicLevelLimit = slot1[2021]
	},
	[2022] = {
		id = 2022,
		weight = 30,
		lotteryType = 14,
		award = {
			__size = 1,
			rmb = 188
		},
		relicLevelLimit = slot1[2022]
	},
	[2031] = {
		id = 2031,
		weight = 30,
		lotteryType = 14,
		award = {
			__size = 1,
			stamina = 60
		},
		relicLevelLimit = slot1[2031]
	},
	[2032] = {
		id = 2032,
		weight = 15,
		lotteryType = 14,
		award = {
			__size = 1,
			stamina = 100
		},
		relicLevelLimit = slot1[2032]
	},
	[2041] = {
		id = 2041,
		weight = 1,
		lotteryType = 14
	},
	[2051] = {
		id = 2051,
		weight = 80,
		lotteryType = 14,
		award = {
			[527.0] = 1,
			[541.0] = 1,
			__size = 5,
			[537.0] = 1,
			[519.0] = 1,
			[531.0] = 1
		},
		relicLevelLimit = slot1[2051]
	},
	[2052] = {
		id = 2052,
		weight = 30,
		lotteryType = 14,
		award = {
			[527.0] = 2,
			[541.0] = 2,
			__size = 5,
			[537.0] = 2,
			[519.0] = 2,
			[531.0] = 2
		},
		relicLevelLimit = slot1[2052]
	},
	__default = {
		__index = {
			param = 0,
			desc = "",
			type = 0,
			lotteryType = 0,
			effectiveTimes = 0,
			duration = 0,
			weight = 0,
			award = ({
				default = slot0[1]
			}).default,
			relicLevelLimit = slot1.default
		}
	}
}

return csv.town.relic_buff
