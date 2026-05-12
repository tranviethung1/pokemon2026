slot0 = {
	{
		__size = 0
	},
	__size = 4,
	[5] = {
		__size = 1,
		coin14 = 2000
	},
	[10] = {
		__size = 1,
		coin14 = 5000
	},
	[18] = {
		__size = 1,
		coin14 = 1500
	}
}
slot1 = {
	[1111] = slot0[10],
	[1110] = slot0[18],
	default = slot0[1],
	[1107] = slot0[18],
	[1105] = slot0[10],
	[1103] = slot0[18],
	[1101] = slot0[5],
	[1006] = slot0[5],
	[1005] = slot0[10],
	[1004] = slot0[5],
	[1003] = slot0[5],
	[1002] = slot0[5],
	[1001] = slot0[5]
}
csv.cross.hunting.shop = {
	__size = 18,
	[1001] = {
		exchangeLimit = 2,
		id = 1001,
		regainHour = 24,
		sortValue = 1,
		itemMap = {
			__size = 1,
			[27001.0] = 3
		},
		costMap = slot1[1001]
	},
	[1002] = {
		exchangeLimit = 2,
		id = 1002,
		regainHour = 24,
		sortValue = 2,
		itemMap = {
			[23771.0] = 3,
			__size = 1
		},
		costMap = slot1[1002]
	},
	[1003] = {
		exchangeLimit = 2,
		id = 1003,
		regainHour = 24,
		sortValue = 3,
		itemMap = {
			[24131.0] = 3,
			__size = 1
		},
		costMap = slot1[1003]
	},
	[1004] = {
		exchangeLimit = 2,
		id = 1004,
		regainHour = 24,
		sortValue = 4,
		itemMap = {
			__size = 1,
			[23841.0] = 3
		},
		costMap = slot1[1004]
	},
	[1005] = {
		limitType = 3,
		limitTimes = 20,
		id = 1005,
		sortValue = 7,
		itemMap = {
			[22431.0] = 1,
			__size = 1
		},
		costMap = slot1[1005]
	},
	[1006] = {
		exchangeLimit = 2,
		id = 1006,
		regainHour = 24,
		sortValue = 5,
		itemMap = {
			[22021.0] = 3,
			__size = 1
		},
		costMap = slot1[1006]
	},
	[1007] = {
		exchangeLimit = 2,
		id = 1007,
		regainHour = 36,
		sortValue = 6,
		itemMap = {
			__size = 1,
			[23231.0] = 3
		},
		costMap = {
			__size = 1,
			coin14 = 2500
		}
	},
	[1101] = {
		exchangeLimit = 2,
		id = 1101,
		regainHour = 24,
		sortValue = 8,
		itemMap = {
			[5000.0] = 10,
			__size = 1
		},
		costMap = slot1[1101]
	},
	[1102] = {
		exchangeLimit = 3,
		id = 1102,
		regainHour = 48,
		sortValue = 9,
		itemMap = {
			__size = 1,
			[514.0] = 10
		},
		costMap = {
			__size = 1,
			coin14 = 1200
		}
	},
	[1103] = {
		exchangeLimit = 3,
		id = 1103,
		regainHour = 24,
		sortValue = 10,
		itemMap = {
			__size = 1,
			[15.0] = 5
		},
		costMap = slot1[1103]
	},
	[1104] = {
		limitType = 2,
		limitTimes = 3,
		id = 1104,
		sortValue = 11,
		itemMap = {
			[7302.0] = 1,
			__size = 1
		},
		costMap = {
			__size = 1,
			coin14 = 1000
		}
	},
	[1105] = {
		limitType = 3,
		limitTimes = 3,
		id = 1105,
		sortValue = 12,
		itemMap = {
			[7303.0] = 1,
			__size = 1
		},
		costMap = slot1[1105]
	},
	[1106] = {
		limitType = 3,
		limitTimes = 1,
		id = 1106,
		sortValue = 13,
		itemMap = {
			[7304.0] = 1,
			__size = 1
		},
		costMap = {
			__size = 1,
			coin14 = 15000
		}
	},
	[1107] = {
		limitType = 2,
		limitTimes = 5,
		id = 1107,
		sortValue = 14,
		itemMap = {
			__size = 1,
			[121.0] = 1
		},
		costMap = slot1[1107]
	},
	[1108] = {
		exchangeLimit = 10,
		id = 1108,
		regainHour = 12,
		sortValue = 15,
		itemMap = {
			__size = 1,
			[122.0] = 1
		},
		costMap = {
			__size = 1,
			coin14 = 100
		}
	},
	[1109] = {
		exchangeLimit = 5,
		id = 1109,
		regainHour = 24,
		sortValue = 16,
		itemMap = {
			__size = 1,
			[123.0] = 1
		},
		costMap = {
			__size = 1,
			coin14 = 500
		}
	},
	[1110] = {
		exchangeLimit = 2,
		id = 1110,
		regainHour = 48,
		sortValue = 17,
		itemMap = {
			__size = 1,
			[124.0] = 1
		},
		costMap = slot1[1110]
	},
	[1111] = {
		id = 1111,
		limitType = 3,
		exchangeLimit = 1,
		limitTimes = 3,
		regainHour = 48,
		sortValue = 18,
		itemMap = {
			[538.0] = 1,
			__size = 1
		},
		costMap = slot1[1111],
		levelRange = {
			150,
			150
		}
	},
	__default = {
		__index = {
			regainHour = 0,
			exchangeLimit = -1,
			limitType = 0,
			limitTimes = 0,
			showUnable = false,
			vipStart = 0,
			endDate = 20990101,
			beginDate = 0,
			sortValue = 0,
			itemMap = ({
				default = slot0[1]
			}).default,
			costMap = slot1.default,
			levelRange = {
				1,
				150
			},
			languages = {
				"cn",
				"vn",
				"en",
				"kr",
				"br",
				"id",
				"th",
				"es",
				"tw"
			}
		}
	}
}

return csv.cross.hunting.shop
