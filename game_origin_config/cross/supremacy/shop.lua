slot0 = {
	{
		__size = 0
	},
	__size = 5,
	[6] = {
		__size = 1,
		coin15 = 24000
	},
	[9] = {
		__size = 1,
		coin15 = 30000
	},
	[19] = {
		__size = 1,
		coin15 = 9000
	},
	[22] = {
		__size = 1,
		coin15 = 3000
	}
}
slot1 = {
	[2051] = slot0[9],
	[2095] = slot0[19],
	[2141] = slot0[19],
	[2041] = slot0[9],
	[2121] = slot0[19],
	[2131] = slot0[22],
	default = slot0[1],
	[2096] = slot0[22],
	[2091] = slot0[19],
	[2021] = slot0[6],
	[2031] = slot0[9],
	[2111] = slot0[22],
	[2101] = slot0[19],
	[2011] = slot0[6],
	[2151] = slot0[19]
}
csv.cross.supremacy.shop = {
	__size = 18,
	[2001] = {
		exchangeLimit = 2,
		id = 2001,
		regainHour = 36,
		sortValue = 1,
		costMap = {
			__size = 1,
			coin15 = 48000
		},
		itemMap = {
			__size = 1,
			[22351.0] = 1
		}
	},
	[2011] = {
		exchangeLimit = 3,
		id = 2011,
		regainHour = 24,
		sortValue = 2,
		costMap = slot1[2011],
		itemMap = {
			__size = 1,
			[20861.0] = 3
		}
	},
	[2021] = {
		exchangeLimit = 3,
		id = 2021,
		regainHour = 24,
		sortValue = 3,
		costMap = slot1[2021],
		itemMap = {
			[23251.0] = 3,
			__size = 1
		}
	},
	[2031] = {
		exchangeLimit = 3,
		id = 2031,
		regainHour = 30,
		sortValue = 4,
		costMap = slot1[2031],
		itemMap = {
			[23161.0] = 3,
			__size = 1
		}
	},
	[2041] = {
		exchangeLimit = 3,
		id = 2041,
		regainHour = 30,
		sortValue = 5,
		costMap = slot1[2041],
		itemMap = {
			__size = 1,
			[23171.0] = 3
		}
	},
	[2051] = {
		exchangeLimit = 3,
		id = 2051,
		regainHour = 30,
		sortValue = 6,
		costMap = slot1[2051],
		itemMap = {
			__size = 1,
			[23181.0] = 3
		}
	},
	[2062] = {
		exchangeLimit = 1,
		id = 2062,
		regainHour = 336,
		sortValue = 7,
		costMap = {
			__size = 1,
			coin15 = 600000
		},
		itemMap = {
			__size = 1,
			[6050.0] = 1
		}
	},
	[2071] = {
		exchangeLimit = 2,
		id = 2071,
		regainHour = 16,
		sortValue = 8,
		costMap = {
			__size = 1,
			coin15 = 20000
		},
		itemMap = {
			[59002.0] = 2,
			__size = 1
		}
	},
	[2081] = {
		exchangeLimit = 2,
		id = 2081,
		regainHour = 72,
		sortValue = 9,
		costMap = {
			__size = 1,
			coin15 = 50000
		},
		itemMap = {
			[59003.0] = 1,
			__size = 1
		}
	},
	[2091] = {
		exchangeLimit = 5,
		id = 2091,
		regainHour = 24,
		sortValue = 10,
		costMap = slot1[2091],
		itemMap = {
			__size = 1,
			[902.0] = 5
		}
	},
	[2095] = {
		exchangeLimit = 2,
		id = 2095,
		regainHour = 48,
		sortValue = 11,
		costMap = slot1[2095],
		itemMap = {
			__size = 1,
			[124.0] = 2
		}
	},
	[2096] = {
		exchangeLimit = 5,
		id = 2096,
		regainHour = 12,
		sortValue = 12,
		costMap = slot1[2096],
		itemMap = {
			__size = 1,
			[123.0] = 2
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

return csv.cross.supremacy.shop
