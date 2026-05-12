slot0 = {
	__size = 1,
	[2] = {
		gold = 300000,
		rmb = 100,
		__size = 3,
		coin17 = 100
	}
}
slot1 = {
	[201] = slot0[2],
	[203] = slot0[2],
	[202] = slot0[2],
	[301] = slot0[2],
	[302] = slot0[2],
	[303] = slot0[2],
	[403] = slot0[2],
	[402] = slot0[2],
	[401] = slot0[2],
	[102] = slot0[2],
	[103] = slot0[2],
	[101] = slot0[2],
	[502] = slot0[2],
	[503] = slot0[2],
	[501] = slot0[2]
}
csv.totem.collection = {
	__size = 15,
	[101] = {
		text = "Activate %d Mystic Charm in Secret Territory",
		groupType = 1,
		activeNum = 10,
		id = 101,
		sort = 1,
		award = slot1[101]
	},
	[102] = {
		text = "Activate %d Mystic Charm in Secret Territory",
		groupType = 1,
		activeNum = 30,
		id = 102,
		sort = 2,
		award = slot1[102]
	},
	[103] = {
		text = "Activate %d Mystic Charm in Secret Territory",
		groupType = 1,
		activeNum = 50,
		id = 103,
		sort = 3,
		award = slot1[103]
	},
	[201] = {
		text = "Activate %d Mystic Charm in Dream World",
		groupType = 2,
		activeNum = 10,
		id = 201,
		sort = 1,
		award = slot1[201]
	},
	[202] = {
		text = "Activate %d Mystic Charm in Dream World",
		groupType = 2,
		activeNum = 30,
		id = 202,
		sort = 2,
		award = slot1[202]
	},
	[203] = {
		text = "Activate %d Mystic Charm in Dream World",
		groupType = 2,
		activeNum = 50,
		id = 203,
		sort = 3,
		award = slot1[203]
	},
	[301] = {
		text = "Activate %d Mystic Charm in Secret Power",
		groupType = 3,
		activeNum = 10,
		id = 301,
		sort = 1,
		award = slot1[301]
	},
	[302] = {
		text = "Activate %d Mystic Charm in Secret Power",
		groupType = 3,
		activeNum = 30,
		id = 302,
		sort = 2,
		award = slot1[302]
	},
	[303] = {
		text = "Activate %d Mystic Charm in Secret Power",
		groupType = 3,
		activeNum = 50,
		id = 303,
		sort = 3,
		award = slot1[303]
	},
	[401] = {
		text = "Activate %d Mystic Charm in Nature Power",
		groupType = 4,
		activeNum = 10,
		id = 401,
		sort = 1,
		award = slot1[401]
	},
	[402] = {
		text = "Activate %d Mystic Charm in Nature Power",
		groupType = 4,
		activeNum = 30,
		id = 402,
		sort = 2,
		award = slot1[402]
	},
	[403] = {
		text = "Activate %d Mystic Charm in Nature Power",
		groupType = 4,
		activeNum = 50,
		id = 403,
		sort = 3,
		award = slot1[403]
	},
	[501] = {
		text = "Activate %d Mystic Charm in Far and Wide",
		groupType = 5,
		activeNum = 10,
		id = 501,
		sort = 1,
		award = slot1[501]
	},
	[502] = {
		text = "Activate %d Mystic Charm in Far and Wide",
		groupType = 5,
		activeNum = 30,
		id = 502,
		sort = 2,
		award = slot1[502]
	},
	[503] = {
		text = "Activate %d Mystic Charm in Far and Wide",
		groupType = 5,
		activeNum = 50,
		id = 503,
		sort = 3,
		award = slot1[503]
	},
	__default = {
		__index = {
			text = "collection",
			activeNum = 0,
			groupType = 0,
			sort = 0,
			award = {
				__size = 0
			}
		}
	}
}

return csv.totem.collection
