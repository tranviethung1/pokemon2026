slot0 = {
	{
		__size = 0
	},
	__size = 7,
	[5] = {
		coin13 = 1000,
		__size = 1
	},
	[6] = {
		150,
		150
	},
	[10] = {
		coin13 = 800,
		__size = 1
	},
	[15] = {
		coin13 = 75000,
		__size = 1
	},
	[19] = {
		coin13 = 60000,
		__size = 1
	},
	[32] = {
		coin13 = 20000,
		__size = 1
	}
}
slot1 = {
	[201] = slot0[6],
	[241] = slot0[6],
	[231] = slot0[6],
	[221] = slot0[6],
	[211] = slot0[6]
}
slot2 = {
	[201] = slot0[5],
	[1051] = slot0[19],
	[1053] = slot0[19],
	[1021] = slot0[15],
	[1091] = slot0[32],
	[211] = slot0[5],
	[1061] = slot0[15],
	[1131] = slot0[32],
	[1151] = slot0[32],
	[1011] = slot0[15],
	default = slot0[1],
	[241] = slot0[10],
	[1031] = slot0[19],
	[231] = slot0[10],
	[221] = slot0[5],
	[1013] = slot0[15]
}
csv.cross.mine.shop = {
	__size = 24,
	[201] = {
		exchangeLimit = 3,
		id = 201,
		regainHour = 10,
		itemMap = {
			[21901.0] = 5,
			__size = 1
		},
		costMap = slot2[201],
		levelRange = slot1[201]
	},
	[211] = {
		exchangeLimit = 3,
		id = 211,
		regainHour = 10,
		itemMap = {
			[23001.0] = 5,
			__size = 1
		},
		costMap = slot2[211],
		levelRange = slot1[211]
	},
	[221] = {
		exchangeLimit = 3,
		id = 221,
		regainHour = 10,
		itemMap = {
			__size = 1,
			[22231.0] = 5
		},
		costMap = slot2[221],
		levelRange = slot1[221]
	},
	[231] = {
		exchangeLimit = 3,
		id = 231,
		regainHour = 10,
		itemMap = {
			[23141.0] = 5,
			__size = 1
		},
		costMap = slot2[231],
		levelRange = slot1[231]
	},
	[241] = {
		exchangeLimit = 3,
		id = 241,
		regainHour = 10,
		itemMap = {
			[23411.0] = 5,
			__size = 1
		},
		costMap = slot2[241],
		levelRange = slot1[241]
	},
	[1001] = {
		exchangeLimit = 2,
		id = 1001,
		regainHour = 30,
		sortValue = 1,
		itemMap = {
			[21261.0] = 1,
			__size = 1
		},
		costMap = {
			coin13 = 100000,
			__size = 1
		}
	},
	[1011] = {
		exchangeLimit = 2,
		id = 1011,
		regainHour = 24,
		sortValue = 2,
		itemMap = {
			[23151.0] = 3,
			__size = 1
		},
		costMap = slot2[1011]
	},
	[1013] = {
		exchangeLimit = 2,
		id = 1013,
		regainHour = 24,
		sortValue = 3,
		itemMap = {
			[21031.0] = 3,
			__size = 1
		},
		costMap = slot2[1013]
	},
	[1021] = {
		exchangeLimit = 2,
		id = 1021,
		regainHour = 16,
		sortValue = 8,
		itemMap = {
			__size = 1,
			[502.0] = 1
		},
		costMap = slot2[1021]
	},
	[1031] = {
		exchangeLimit = 2,
		id = 1031,
		regainHour = 18,
		sortValue = 4,
		itemMap = {
			[21941.0] = 3,
			__size = 1
		},
		costMap = slot2[1031]
	},
	[1041] = {
		exchangeLimit = 2,
		id = 1041,
		regainHour = 24,
		sortValue = 9,
		itemMap = {
			__size = 1,
			[28504.0] = 1
		},
		costMap = {
			coin13 = 50000,
			__size = 1
		}
	},
	[1051] = {
		exchangeLimit = 2,
		id = 1051,
		regainHour = 18,
		sortValue = 5,
		itemMap = {
			[21951.0] = 3,
			__size = 1
		},
		costMap = slot2[1051]
	},
	[1053] = {
		exchangeLimit = 2,
		id = 1053,
		regainHour = 18,
		sortValue = 6,
		itemMap = {
			__size = 1,
			[20971.0] = 3
		},
		costMap = slot2[1053]
	},
	[1061] = {
		exchangeLimit = 2,
		id = 1061,
		regainHour = 24,
		sortValue = 10,
		itemMap = {
			talent_point = 1,
			__size = 1
		},
		costMap = slot2[1061]
	},
	[1063] = {
		exchangeLimit = 2,
		id = 1063,
		regainHour = 36,
		sortValue = 7,
		itemMap = {
			__size = 1,
			[23201.0] = 3
		},
		costMap = {
			coin13 = 80000,
			__size = 1
		}
	},
	[1071] = {
		exchangeLimit = 2,
		id = 1071,
		regainHour = 60,
		sortValue = 11,
		itemMap = {
			__size = 1,
			[28505.0] = 1
		},
		costMap = {
			coin13 = 180000,
			__size = 1
		}
	},
	[1081] = {
		exchangeLimit = 2,
		id = 1081,
		regainHour = 24,
		sortValue = 12,
		itemMap = {
			__size = 1,
			[529.0] = 500
		},
		costMap = {
			coin13 = 90000,
			__size = 1
		}
	},
	[1091] = {
		exchangeLimit = 2,
		id = 1091,
		regainHour = 48,
		sortValue = 15,
		itemMap = {
			__size = 1,
			[514.0] = 60
		},
		costMap = slot2[1091]
	},
	[1101] = {
		exchangeLimit = 10,
		id = 1101,
		regainHour = 12,
		sortValue = 16,
		itemMap = {
			__size = 1,
			[514.0] = 15
		},
		costMap = {
			coin13 = 5000,
			__size = 1
		}
	},
	[1111] = {
		exchangeLimit = 2,
		id = 1111,
		regainHour = 24,
		sortValue = 17,
		itemMap = {
			__size = 1,
			[15.0] = 10
		},
		costMap = {
			coin13 = 15000,
			__size = 1
		}
	},
	[1121] = {
		exchangeLimit = 12,
		id = 1121,
		regainHour = 4,
		sortValue = 18,
		itemMap = {
			__size = 1,
			[15.0] = 2
		},
		costMap = {
			coin13 = 3000,
			__size = 1
		}
	},
	[1131] = {
		exchangeLimit = 3,
		id = 1131,
		regainHour = 8,
		sortValue = 13,
		itemMap = {
			[111.0] = 100,
			__size = 1
		},
		costMap = slot2[1131]
	},
	[1141] = {
		exchangeLimit = 3,
		id = 1141,
		regainHour = 8,
		sortValue = 14,
		itemMap = {
			__size = 1,
			[112.0] = 20
		},
		costMap = {
			coin13 = 30000,
			__size = 1
		}
	},
	[1151] = {
		exchangeLimit = 2,
		id = 1151,
		regainHour = 12,
		sortValue = 19,
		itemMap = {
			[5000.0] = 20,
			__size = 1
		},
		costMap = slot2[1151]
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
			costMap = slot2.default,
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

return csv.cross.mine.shop
