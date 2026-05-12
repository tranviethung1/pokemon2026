slot0 = {
	__size = 0
}
csv.pvpandpve = {
	{
		lockbg1 = "city/adventure/activityselect/img_rcfb@.png",
		unlockFeature = "activityGate",
		sortIndex = 1,
		type = "pve",
		title = "Rewards dungeon",
		goto = "activityGate",
		title_th = "Rewards dungeon",
		title_en = "Rewards dungeon",
		id = 1
	},
	{
		lockbg1 = "city/adventure/activityselect/img_wxtz@.png",
		unlockFeature = "endlessTower",
		sortIndex = 2,
		type = "pve",
		title = "Adventure Road",
		goto = "endlessTower",
		title_th = "Adventure Road",
		title_en = "Adventure Road",
		id = 2
	},
	{
		lockbg1 = "city/adventure/activityselect/img_pq@.png",
		unlockFeature = "dispatchTask",
		sortIndex = 3,
		type = "pve",
		title = "Dispatch quest",
		goto = "dispatchTask",
		title_th = "Dispatch quest",
		title_en = "Dispatch quest",
		id = 3
	},
	{
		lockbg1 = "city/adventure/activityselect/img_ytly@.png",
		unlockFeature = "randomTower",
		sortIndex = 5,
		type = "pve",
		title = "Aether Paradise",
		goto = "randomTower",
		title_th = "Aether Paradise",
		title_en = "Aether Paradise",
		id = 4
	},
	{
		lockbg1 = "city/adventure/activityselect/img_ystz@.png",
		unlockFeature = "cloneBattle",
		sortIndex = 4,
		type = "pve",
		title = "Element Challenge",
		goto = "cloneBattle",
		title_th = "Element Challenge",
		title_en = "Element Challenge",
		id = 5
	},
	{
		lockbg1 = "city/adventure/activityselect/img_dy@.png",
		unlockFeature = "fishing",
		sortIndex = 6,
		type = "pve",
		title = "Fishing",
		goto = "fishing",
		title_th = "Fishing",
		title_en = "Fishing",
		id = 6
	},
	{
		lockbg1 = "city/adventure/activityselect/img_dgtz.png",
		unlockFeature = "gym",
		sortIndex = 7,
		type = "pve",
		title = "Gym Challenge",
		goto = "gymChallenge",
		title_th = "Gym Challenge",
		title_en = "Gym Challenge",
		id = 7
	},
	{
		lockbg1 = "city/adventure/activityselect/img_sldd@.png",
		unlockFeature = "hunting",
		sortIndex = 8,
		type = "pve",
		title = "Hunting zone",
		goto = "hunting",
		title_th = "Hunting zone",
		title_en = "Hunting zone",
		id = 8
	},
	{
		lockbg1 = "city/adventure/activityselect/img_bkmtz@.png",
		unlockFeature = "normalBraveChallenge",
		sortIndex = 9,
		type = "pve",
		title = "Pokémon Challenge",
		goto = "normalBraveChallenge",
		title_th = "Pokémon Challenge",
		title_en = "Pokémon Challenge",
		id = 9
	},
	__size = 16,
	[101] = {
		unlockFeature = "arena",
		desc_th = "คู่แข่งมาเผชิญหน้ากันและผู้ชนะก็ปรากฎตัว",
		sortIndex = 1,
		type = "pvp",
		desc = "Rivals meet on face to face and the winner emerges",
		title = "Arena",
		goto = "arena",
		title_th = "Arena",
		lockbg1 = "city/pvp/img_jjc.png",
		title_en = "Arena",
		desc_en = "Rivals meet on face to face and the winner emerges",
		id = 101
	},
	[102] = {
		unlockFeature = "unionFight",
		desc_th = "แข่งขันเพื่อเป็นสหภาพที่ดีที่สุด",
		sortIndex = 3,
		type = "pvp",
		unionFeature = "unionFight",
		title = "union War",
		goto = "unionFight",
		title_th = "union War",
		lockbg1 = "city/pvp/img_ghz.png",
		title_en = "union War",
		desc = "Compete to be the best union",
		desc_en = "Compete to be the best union",
		id = 102,
		serverDayInfo = {
			sevCsv = "csv.union_fight.base[1].servOpenDays",
			__size = 2,
			funcType = "less"
		}
	},
	[103] = {
		unlockFeature = "craft",
		desc_th = "การประชุมที่ราบสูงคราม",
		sortIndex = 2,
		type = "pvp",
		desc = "Indigo Plateau Conference",
		title = "Indigo Plateau Conference",
		goto = "craft",
		title_th = "Indigo Plateau Conference",
		lockbg1 = "city/pvp/img_sydh.png",
		title_en = "Indigo Plateau Conference",
		desc_en = "Indigo Plateau Conference",
		id = 103,
		serverDayInfo = {
			sevCsv = "csv.craft.base[1].servOpenDays",
			__size = 2,
			funcType = "less"
		}
	},
	[104] = {
		lockbg1 = "city/pvp/img_kfsydh.png",
		unlockFeature = "crossCraft",
		sortIndex = 4,
		type = "pvp",
		title = "Global Indigo Plateau Conference",
		goto = "crossCraft",
		title_th = "Global Indigo Plateau Conference",
		title_en = "Global Indigo Plateau Conference",
		id = 104,
		serverDayInfo = {
			sevCsv = "csv.cross.craft.base[1].servOpenDays",
			__size = 2,
			funcType = "less"
		}
	},
	[105] = {
		lockbg1 = "city/pvp/img_kfjjc.png",
		unlockFeature = "crossArena",
		sortIndex = 5,
		type = "pvp",
		title = "World Arena",
		goto = "crossArena",
		title_th = "World Arena",
		title_en = "World Arena",
		id = 105,
		serverDayInfo = {
			sevCsv = "csv.cross.arena.base[1].servOpenDays",
			__size = 2,
			funcType = "less"
		}
	},
	[106] = {
		lockbg1 = "city/pvp/img_dzjjc.png",
		unlockFeature = "onlineFight",
		sortIndex = 6,
		type = "pvp",
		title = "PVP Arena",
		goto = "onlineFight",
		title_th = "PVP Arena",
		title_en = "PVP Arena",
		id = 106,
		serverDayInfo = {
			sevCsv = "csv.cross.online_fight.base[1].servOpenDays",
			__size = 2,
			funcType = "less"
		}
	},
	[107] = {
		lockbg1 = "city/pvp/img_kfzyz.png",
		unlockFeature = "crossMine",
		sortIndex = 7,
		type = "pvp",
		title = "Cross-service commercial street",
		goto = "crossMine",
		title_th = "Cross-service commercial street",
		title_en = "Cross-service commercial street",
		id = 107,
		serverDayInfo = {
			sevCsv = "csv.cross.mine.base[1].servOpenDays",
			__size = 2,
			funcType = "less"
		}
	},
	__default = {
		__index = {
			unlockFeature = "",
			desc = "",
			sortIndex = 0,
			type = "",
			title = "",
			desc_th = "",
			goto = "",
			title_th = "",
			lockbg1 = "",
			title_en = "",
			desc_en = "",
			flag = 0,
			nameRes = ""
		}
	}
}

return csv.pvpandpve
