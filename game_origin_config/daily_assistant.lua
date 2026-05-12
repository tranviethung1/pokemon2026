slot0 = {
	__size = 0
}
csv.daily_assistant = {
	__size = 20,
	[101] = {
		name = "Union Daily Pack",
		name_en = "Union Daily Pack",
		name_th = "Union Daily Pack",
		id = 101,
		features = "unionDailyGift"
	},
	[102] = {
		name = "Union Red Pack",
		name_en = "Union Red Pack",
		name_th = "Union Red Pack",
		id = 102,
		features = "unionRedpacket",
		sortID = 2,
		inUnlock = 1
	},
	[103] = {
		name = "Passport Daily Rewards",
		name_en = "Passport Daily Rewards",
		name_th = "Passport Daily Rewards",
		id = 103,
		features = "trainer",
		sortID = 3,
		inUnlock = 1
	},
	[104] = {
		name = "Treasure Pot",
		name_en = "Treasure Pot",
		name_th = "Treasure Pot",
		id = 104,
		features = "gainGold",
		sortID = 4
	},
	[201] = {
		name = "Diamond Card Draw",
		name_en = "Diamond Card Draw",
		name_th = "Diamond Card Draw",
		type = 2,
		id = 201,
		features = "drawCardRmb"
	},
	[202] = {
		name_en = "Coin Card Draw",
		name = "Coin Card Draw",
		name_th = "Coin Card Draw",
		type = 2,
		id = 202,
		features = "drawCardGold",
		sortID = 2
	},
	[203] = {
		name_en = "Trinket Card Draw",
		name = "Trinket Card Draw",
		name_th = "Trinket Card Draw",
		type = 2,
		id = 203,
		features = "drawEquip",
		sortID = 3,
		inUnlock = 1
	},
	[204] = {
		name_en = "Explorer Treasure Hunt",
		name = "Explorer Treasure Hunt",
		name_th = "Explorer Treasure Hunt",
		type = 2,
		id = 204,
		features = "explorer",
		sortID = 5,
		inUnlock = 1
	},
	[205] = {
		name_en = "Rune Extraction",
		name = "Rune Extraction",
		name_th = "Rune Extraction",
		type = 2,
		id = 205,
		features = "gem",
		sortID = 4,
		inUnlock = 1
	},
	[206] = {
		name_en = "Chip Draw",
		name = "Chip Draw",
		name_th = "Chip Draw",
		type = 2,
		id = 206,
		features = "chip",
		sortID = 6,
		inUnlock = 1
	},
	[301] = {
		name = "Quartz Assembly",
		name_en = "Quartz Assembly",
		name_th = "Quartz Assembly",
		type = 3,
		id = 301,
		features = "craft",
		inUnlock = 1
	},
	[302] = {
		name_en = "guild battle",
		name = "guild battle",
		name_th = "guild battle",
		type = 3,
		id = 302,
		features = "unionFight",
		sortID = 2,
		inUnlock = 1
	},
	[303] = {
		name_en = "Cross-Server Quartz Conference",
		name = "Cross-Server Quartz Conference",
		name_th = "Cross-Server Quartz Conference",
		type = 3,
		id = 303,
		features = "crossCraft",
		sortID = 3,
		inUnlock = 1
	},
	[401] = {
		name = "everyday copy",
		name_en = "everyday copy",
		name_th = "everyday copy",
		type = 4,
		id = 401,
		features = "activityGate",
		inUnlock = 1
	},
	[402] = {
		name_en = "Adventure Road",
		name = "Adventure Road",
		name_th = "Adventure Road",
		type = 4,
		id = 402,
		features = "endlessTower",
		sortID = 2,
		inUnlock = 1
	},
	[403] = {
		name_en = "fishing",
		name = "fishing",
		name_th = "fishing",
		type = 4,
		id = 403,
		features = "catch",
		sortID = 3,
		inUnlock = 1
	},
	[501] = {
		name = "Guild donation",
		name_en = "Guild donation",
		name_th = "Guild donation",
		type = 5,
		id = 501,
		features = "unionContrib"
	},
	[502] = {
		name_en = "Guild Wish",
		name = "Guild Wish",
		name_th = "Guild Wish",
		type = 5,
		id = 502,
		features = "unionFragDonate",
		sortID = 2
	},
	[503] = {
		name_en = "Speed ​​up for friends",
		name = "Speed ​​up for friends",
		name_th = "Speed ​​up for friends",
		type = 5,
		id = 503,
		features = "unionTrainingSpeedup",
		sortID = 3
	},
	[504] = {
		name_en = "Guild copy",
		name = "Guild copy",
		name_th = "Guild copy",
		type = 5,
		id = 504,
		features = "unionFuben",
		sortID = 4
	},
	__default = {
		__index = {
			type = 1,
			features = "",
			sortID = 1,
			inUnlock = 0,
			languages = {
				"cn",
				"br",
				"en",
				"vn",
				"th",
				"kr"
			}
		}
	}
}

return csv.daily_assistant
