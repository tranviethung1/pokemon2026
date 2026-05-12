slot0 = {
	{
		true,
		true,
		true
	},
	[3] = {
		1,
		1,
		1
	}
}
csv.auto_chess.game_shop = {
	{
		id = 1,
		items = "randomCards(c.allCards_allEquips_allEvents(),3)",
		desc = "这是常规店"
	},
	{
		id = 2,
		limited = 1,
		items = "list(1014)",
		desc = "这是白嫖的",
		free = slot0[1]
	},
	{
		type = 1,
		id = 3,
		items = "randomCards(c.shopCards_allEquips_allEvents(),20)",
		desc = "这是黑市",
		cost = {
			1,
			2,
			3
		}
	},
	__size = 29,
	[1001] = {
		id = 1001,
		items = "list(3)",
		desc = "欢迎光临",
		free = slot0[1]
	},
	[1002] = {
		id = 1002,
		items = "list(4,3)",
		desc = "欢迎光临"
	},
	[11] = {
		isInitial = true,
		id = 11,
		limited = 1,
		items = "list()",
		free = slot0[1]
	},
	[12] = {
		type = 1,
		id = 12,
		limited = 2,
		items = "randomCards(c.fireCards(),20)",
		desc = "火系",
		cost = slot0[3]
	},
	[13] = {
		type = 1,
		id = 13,
		limited = 2,
		items = "randomCards(c.steelCards(),20)",
		desc = "钢系",
		cost = {
			2,
			2,
			2
		}
	},
	[14] = {
		id = 14,
		limited = 1,
		items = "randomCards(c.allEquips_allEvents(),3)",
		desc = "杂货店"
	},
	[15] = {
		id = 15,
		desc = "测试专用商店",
		items = "list(7002,4006,4014)",
		type = 2
	},
	[20] = {
		id = 20,
		limited = 1,
		items = "randomCards(c.allCards(),20)",
		desc = "走过路过不要错过",
		free = slot0[1]
	},
	[21] = {
		id = 21,
		desc = "你想要的这里都有",
		items = "randomCards(c.allCards_allEquips_allEvents(),30)",
		type = 1
	},
	[22] = {
		type = 2,
		id = 22,
		limited = 3,
		items = "randomCards(c.allCards(),3)",
		desc = "贵自有贵的道理",
		cost = slot0[3]
	},
	[23] = {
		id = 23,
		limited = 2,
		items = "randomCards(c.allEquips(),3)",
		desc = "这里是装备专卖店"
	},
	[24] = {
		id = 24,
		limited = 2,
		items = "randomCards(c.allEvents(),3)",
		desc = "瞧一瞧，看一看"
	},
	[25] = {
		id = 25,
		limited = 1,
		items = "randomCards(c.allCards_allEquips_allEvents(),1)",
		desc = "跳楼价大促销",
		cost = {
			-2,
			-2,
			-2
		}
	},
	[26] = {
		id = 26,
		items = "randomCards(c.allCards(),20)",
		desc = "为精灵提供温暖的家"
	},
	[27] = {
		id = 27,
		items = "randomCards(c.normalCards(),20)",
		desc = "一般系精灵聚集于此"
	},
	[28] = {
		id = 28,
		items = "randomCards(c.fireCards(),20)",
		desc = "火系精灵聚集于此"
	},
	[30] = {
		id = 30,
		items = "randomCards(c.grassCards(),20)",
		desc = "草系精灵聚集于此"
	},
	[33] = {
		id = 33,
		items = "randomCards(c.combatCards(),20)",
		desc = "格斗系精灵聚集于此"
	},
	[37] = {
		id = 37,
		items = "randomCards(c.superCards(),20)",
		desc = "超能系精灵聚集于此"
	},
	[40] = {
		id = 40,
		items = "randomCards(c.ghostCards(),20)",
		desc = "幽灵系精灵聚集于此"
	},
	[42] = {
		id = 42,
		items = "randomCards(c.evilCards(),20)",
		desc = "恶系精灵聚集于此"
	},
	[43] = {
		id = 43,
		items = "randomCards(c.steelCards(),20)",
		desc = "钢系精灵聚集于此"
	},
	[44] = {
		id = 44,
		items = "randomCards(c.fairyCards(),20)",
		desc = "妖精系精灵聚集于此"
	},
	[45] = {
		items = "randomCards(c.allCards(),20)",
		type = 1,
		id = 45,
		costType = 1,
		desc = "我可以帮你，只需要一点代价"
	},
	[46] = {
		id = 46,
		limited = 1,
		items = "randomCards(c.enhancedEvents(),3,0,0)",
		desc = "发放冒险物资",
		free = slot0[1]
	},
	[47] = {
		type = 1,
		id = 47,
		items = "randomCards(c.yaoshui(),20,0,0)",
		desc = "药水商店",
		cost = {
			1,
			0,
			-1
		}
	},
	__default = {
		__index = {
			isInitial = false,
			repeat2 = false,
			type = 3,
			items = "list()",
			repeat1 = true,
			costType = 0,
			desc = "",
			limited = 0,
			free = {
				false,
				false,
				false
			},
			cost = {
				0,
				0,
				0
			}
		}
	}
}

return csv.auto_chess.game_shop
