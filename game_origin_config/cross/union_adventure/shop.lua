slot0 = {
	{
		__size = 0
	},
	__size = 4,
	[6] = {
		__size = 1,
		coin21 = 2400
	},
	[17] = {
		__size = 1,
		coin21 = 720
	},
	[19] = {
		__size = 1,
		coin21 = 240
	}
}
slot1 = {
	[2121] = slot0[17],
	[2141] = slot0[17],
	[2041] = slot0[6],
	[2131] = slot0[19],
	default = slot0[1],
	[2021] = slot0[6],
	[2031] = slot0[6],
	[2111] = slot0[19],
	[2101] = slot0[17],
	[2011] = slot0[6],
	[2151] = slot0[17]
}
csv.cross.union_adventure.shop = {
	__size = 15,
	[2001] = {
		exchangeLimit = 2,
		id = 2001,
		regainHour = 48,
		sortValue = 1,
		costMap = {
			__size = 1,
			coin21 = 3600
		},
		itemMap = {
			__size = 1,
			[22391.0] = 1
		}
	},
	[2011] = {
		exchangeLimit = 2,
		id = 2011,
		regainHour = 30,
		sortValue = 2,
		costMap = slot1[2011],
		itemMap = {
			__size = 1,
			[23191.0] = 3
		}
	},
	[2021] = {
		exchangeLimit = 2,
		id = 2021,
		regainHour = 30,
		sortValue = 3,
		costMap = slot1[2021],
		itemMap = {
			__size = 1,
			[23961.0] = 3
		}
	},
	[2031] = {
		exchangeLimit = 2,
		id = 2031,
		regainHour = 30,
		sortValue = 4,
		costMap = slot1[2031],
		itemMap = {
			[22411.0] = 3,
			__size = 1
		}
	},
	[2041] = {
		exchangeLimit = 2,
		id = 2041,
		regainHour = 30,
		sortValue = 5,
		costMap = slot1[2041],
		itemMap = {
			[23671.0] = 3,
			__size = 1
		}
	},
	[2061] = {
		exchangeLimit = 2,
		id = 2061,
		regainHour = 60,
		sortValue = 6,
		costMap = {
			__size = 1,
			coin21 = 3000
		},
		itemMap = {
			__size = 1,
			[502.0] = 1
		}
	},
	[2071] = {
		exchangeLimit = 1,
		id = 2071,
		regainHour = 480,
		sortValue = 7,
		costMap = {
			__size = 1,
			coin21 = 30000
		},
		itemMap = {
			__size = 1,
			[8833.0] = 1
		}
	},
	[2091] = {
		exchangeLimit = 2,
		id = 2091,
		regainHour = 48,
		sortValue = 12,
		costMap = {
			__size = 1,
			coin21 = 1500
		},
		itemMap = {
			[161.0] = 50,
			__size = 1
		}
	},
	[2101] = {
		exchangeLimit = 2,
		id = 2101,
		regainHour = 48,
		sortValue = 13,
		costMap = slot1[2101],
		itemMap = {
			__size = 1,
			[514.0] = 30
		}
	},
	[2111] = {
		exchangeLimit = 10,
		id = 2111,
		regainHour = 12,
		sortValue = 14,
		costMap = slot1[2111],
		itemMap = {
			__size = 1,
			[514.0] = 10
		}
	},
	[2121] = {
		exchangeLimit = 2,
		id = 2121,
		regainHour = 24,
		sortValue = 15,
		costMap = slot1[2121],
		itemMap = {
			__size = 1,
			[15.0] = 10
		}
	},
	[2131] = {
		exchangeLimit = 12,
		id = 2131,
		regainHour = 4,
		sortValue = 16,
		costMap = slot1[2131],
		itemMap = {
			__size = 1,
			[15.0] = 2
		}
	},
	[2141] = {
		exchangeLimit = 2,
		id = 2141,
		regainHour = 18,
		sortValue = 17,
		costMap = slot1[2141],
		itemMap = {
			__size = 1,
			[870.0] = 20
		}
	},
	[2151] = {
		exchangeLimit = 2,
		id = 2151,
		regainHour = 18,
		sortValue = 18,
		costMap = slot1[2151],
		itemMap = {
			__size = 1,
			[930.0] = 20
		}
	},
	[2161] = {
		id = 2161,
		limitType = 4,
		limitTimes = 1,
		sortValue = 19,
		costMap = {
			__size = 1,
			coin21 = 36000
		},
		itemMap = {
			[2528.0] = 1,
			__size = 1
		}
	},
	__default = {
		__index = {
			limitTimes = 0,
			limitType = 0,
			showUnable = false,
			vipStart = 0,
			endDate = 20990101,
			exchangeLimit = -1,
			beginDate = 0,
			regainHour = 0,
			sortValue = 0,
			costMap = slot1.default,
			levelRange = {
				1,
				150
			},
			itemMap = ({
				default = slot0[1]
			}).default,
			languages = {
				"cn",
				"br",
				"en",
				"vn",
				"th",
				"kr",
				"id"
			}
		}
	}
}

return csv.cross.union_adventure.shop
