slot0 = {
	__size = 13,
	[3] = {
		1,
		100
	},
	[7] = {
		150,
		150
	},
	[8] = {
		[5000.0] = 10,
		__size = 1
	},
	[10] = {
		__size = 1,
		[514.0] = 10
	},
	[16] = {
		coin3 = 1500,
		__size = 1
	},
	[22] = {
		coin3 = 900,
		__size = 1
	},
	[27] = {
		[535.0] = 2500,
		__size = 1
	},
	[28] = {
		1,
		150
	},
	[34] = {
		"cn",
		"kr"
	},
	[36] = {
		[535.0] = 1800,
		__size = 1
	},
	[38] = {
		3,
		150
	},
	[41] = {
		[535.0] = 1000,
		__size = 1
	},
	[49] = {
		[535.0] = 600,
		__size = 1
	}
}
slot1 = {
	[2035] = slot0[34],
	[2021] = slot0[34]
}
slot2 = {
	[26] = slot0[8],
	[27] = slot0[10],
	[3021] = slot0[10],
	[3011] = slot0[8]
}
slot3 = {
	[3011] = slot0[28],
	[10001] = slot0[28],
	default = slot0[3],
	[3001] = slot0[28],
	[2051] = slot0[28],
	[25] = slot0[7],
	[26] = slot0[7],
	[27] = slot0[7],
	[42] = slot0[7],
	[43] = slot0[7],
	[3021] = slot0[28],
	[41] = slot0[7],
	[2035] = slot0[28],
	[2031] = slot0[28],
	[2071] = slot0[28],
	[2011] = slot0[28],
	[2041] = slot0[28],
	[33] = slot0[7],
	[32] = slot0[7],
	[31] = slot0[7],
	[2081] = slot0[28],
	[37] = slot0[7],
	[36] = slot0[7],
	[35] = slot0[7],
	[34] = slot0[7],
	[3012] = slot0[28],
	[2001] = slot0[28],
	[2021] = slot0[28],
	[2061] = slot0[28]
}
slot4 = {
	[2051] = slot0[41],
	[3021] = slot0[49],
	[2041] = slot0[36],
	[33] = slot0[16],
	[32] = slot0[16],
	[3011] = slot0[41],
	[42] = slot0[16],
	[43] = slot0[16],
	[35] = slot0[22],
	[34] = slot0[22],
	[3012] = slot0[41],
	[2035] = slot0[36],
	[36] = slot0[22],
	[3001] = slot0[49],
	[37] = slot0[22],
	[2031] = slot0[36],
	[2061] = slot0[41],
	[2071] = slot0[41],
	[41] = slot0[16],
	[2011] = slot0[27],
	[2001] = slot0[27]
}
slot5 = {
	[2051] = slot0[28],
	[10001] = slot0[28],
	[2041] = slot0[38],
	[3012] = slot0[28],
	[3011] = slot0[28],
	[3021] = slot0[28],
	default = slot0[3],
	[2035] = slot0[38],
	[2001] = slot0[28],
	[3001] = slot0[28],
	[2031] = slot0[28],
	[2061] = slot0[28],
	[2071] = slot0[28]
}
csv.fishing.shop = {
	__size = 28,
	[25] = {
		vipWeight = 0,
		itemCount = 10,
		id = 25,
		position = 12,
		itemWeightMap = {
			[452.0] = 10,
			__size = 1
		},
		costMap = {
			coin3 = 500,
			__size = 1
		},
		levelRange = slot3[25]
	},
	[26] = {
		vipWeight = 0,
		itemCount = 20,
		id = 26,
		position = 13,
		itemWeightMap = slot2[26],
		costMap = {
			coin3 = 400,
			__size = 1
		},
		levelRange = slot3[26]
	},
	[27] = {
		vipWeight = 0,
		itemCount = 5,
		id = 27,
		position = 14,
		itemWeightMap = slot2[27],
		costMap = {
			coin3 = 200,
			__size = 1
		},
		levelRange = slot3[27]
	},
	[31] = {
		vipWeight = 0,
		itemCount = 5,
		id = 31,
		itemWeightMap = {
			[23541.0] = 10,
			__size = 1
		},
		costMap = {
			coin3 = 2000,
			__size = 1
		},
		levelRange = slot3[31],
		fishingLevelRange = {
			10,
			100
		}
	},
	[32] = {
		vipWeight = 0,
		itemCount = 5,
		id = 32,
		position = 1,
		itemWeightMap = {
			[23021.0] = 10,
			__size = 1
		},
		costMap = slot4[32],
		levelRange = slot3[32]
	},
	[33] = {
		vipWeight = 0,
		itemCount = 5,
		id = 33,
		position = 2,
		itemWeightMap = {
			__size = 1,
			[20491.0] = 10
		},
		costMap = slot4[33],
		levelRange = slot3[33]
	},
	[41] = {
		vipWeight = 0,
		itemCount = 5,
		id = 41,
		position = 3,
		itemWeightMap = {
			[21311.0] = 10,
			__size = 1
		},
		costMap = slot4[41],
		levelRange = slot3[41]
	},
	[42] = {
		vipWeight = 0,
		itemCount = 5,
		id = 42,
		position = 4,
		itemWeightMap = {
			__size = 1,
			[20731.0] = 10
		},
		costMap = slot4[42],
		levelRange = slot3[42]
	},
	[43] = {
		vipWeight = 0,
		itemCount = 5,
		id = 43,
		position = 5,
		itemWeightMap = {
			__size = 1,
			[21081.0] = 10
		},
		costMap = slot4[43],
		levelRange = slot3[43]
	},
	[34] = {
		vipWeight = 0,
		itemCount = 5,
		id = 34,
		position = 6,
		itemWeightMap = {
			[20271.0] = 10,
			__size = 1
		},
		costMap = slot4[34],
		levelRange = slot3[34]
	},
	[35] = {
		vipWeight = 0,
		itemCount = 5,
		id = 35,
		position = 7,
		itemWeightMap = {
			__size = 1,
			[22011.0] = 10
		},
		costMap = slot4[35],
		levelRange = slot3[35]
	},
	[36] = {
		vipWeight = 0,
		itemCount = 5,
		id = 36,
		position = 8,
		itemWeightMap = {
			__size = 1,
			[20471.0] = 10
		},
		costMap = slot4[36],
		levelRange = slot3[36]
	},
	[37] = {
		vipWeight = 0,
		itemCount = 5,
		id = 37,
		position = 9,
		itemWeightMap = {
			[20001.0] = 10,
			__size = 1
		},
		costMap = slot4[37],
		levelRange = slot3[37]
	},
	[2001] = {
		vipWeight = 100,
		itemCount = 5,
		id = 2001,
		itemWeightMap = {
			[21931.0] = 10,
			__size = 1
		},
		costMap = slot4[2001],
		levelRange = slot3[2001],
		fishingLevelRange = slot5[2001]
	},
	[2011] = {
		itemCount = 5,
		vipWeight = 100,
		showUnable = true,
		id = 2011,
		position = 1,
		itemWeightMap = {
			[21911.0] = 10,
			__size = 1
		},
		costMap = slot4[2011],
		levelRange = slot3[2011],
		fishingLevelRange = {
			5,
			150
		}
	},
	[2021] = {
		itemCount = 5,
		vipWeight = 100,
		showUnable = true,
		id = 2021,
		position = 2,
		itemWeightMap = {
			[21921.0] = 10,
			__size = 1
		},
		costMap = {
			[535.0] = 3200,
			__size = 1
		},
		levelRange = slot3[2021],
		fishingLevelRange = {
			7,
			150
		},
		languages = slot1[2021]
	},
	[2031] = {
		vipWeight = 100,
		itemCount = 5,
		id = 2031,
		position = 3,
		itemWeightMap = {
			__size = 1,
			[23591.0] = 10
		},
		costMap = slot4[2031],
		levelRange = slot3[2031],
		fishingLevelRange = slot5[2031]
	},
	[2035] = {
		itemCount = 5,
		vipWeight = 100,
		showUnable = true,
		id = 2035,
		position = 4,
		itemWeightMap = {
			__size = 1,
			[20161.0] = 10
		},
		costMap = slot4[2035],
		levelRange = slot3[2035],
		fishingLevelRange = slot5[2035],
		languages = slot1[2035]
	},
	[2041] = {
		itemCount = 5,
		vipWeight = 100,
		showUnable = true,
		id = 2041,
		position = 5,
		itemWeightMap = {
			[22991.0] = 10,
			__size = 1
		},
		costMap = slot4[2041],
		levelRange = slot3[2041],
		fishingLevelRange = slot5[2041]
	},
	[2051] = {
		vipWeight = 100,
		itemCount = 5,
		id = 2051,
		position = 6,
		itemWeightMap = {
			__size = 1,
			[22841.0] = 10
		},
		costMap = slot4[2051],
		levelRange = slot3[2051],
		fishingLevelRange = slot5[2051]
	},
	[2061] = {
		vipWeight = 100,
		itemCount = 5,
		id = 2061,
		position = 7,
		itemWeightMap = {
			__size = 1,
			[20341.0] = 10
		},
		costMap = slot4[2061],
		levelRange = slot3[2061],
		fishingLevelRange = slot5[2061]
	},
	[2071] = {
		vipWeight = 100,
		itemCount = 5,
		id = 2071,
		position = 8,
		itemWeightMap = {
			__size = 1,
			[20221.0] = 10
		},
		costMap = slot4[2071],
		levelRange = slot3[2071],
		fishingLevelRange = slot5[2071]
	},
	[2081] = {
		itemCount = 1,
		vipWeight = 100,
		showUnable = true,
		limitType = 3,
		limitTimes = 20,
		id = 2081,
		position = 9,
		itemWeightMap = {
			__size = 1,
			[21961.0] = 1
		},
		costMap = {
			[535.0] = 5000,
			__size = 1
		},
		levelRange = slot3[2081],
		fishingLevelRange = {
			9,
			150
		},
		languages = {
			"cn"
		}
	},
	[3001] = {
		vipWeight = 100,
		itemCount = 100,
		id = 3001,
		position = 10,
		itemWeightMap = {
			__size = 1,
			[529.0] = 10
		},
		costMap = slot4[3001],
		levelRange = slot3[3001],
		fishingLevelRange = slot5[3001]
	},
	[3011] = {
		vipWeight = 100,
		itemCount = 20,
		id = 3011,
		position = 11,
		itemWeightMap = slot2[3011],
		costMap = slot4[3011],
		levelRange = slot3[3011],
		fishingLevelRange = slot5[3011]
	},
	[3012] = {
		vipWeight = 100,
		itemCount = 20,
		id = 3012,
		position = 13,
		itemWeightMap = {
			__size = 1,
			[930.0] = 10
		},
		costMap = slot4[3012],
		levelRange = slot3[3012],
		fishingLevelRange = slot5[3012]
	},
	[3021] = {
		vipWeight = 100,
		itemCount = 10,
		id = 3021,
		position = 14,
		itemWeightMap = slot2[3021],
		costMap = slot4[3021],
		levelRange = slot3[3021],
		fishingLevelRange = slot5[3021]
	},
	[10001] = {
		itemCount = 1,
		vipWeight = 100,
		limitType = 4,
		limitTimes = 1,
		id = 10001,
		position = 12,
		itemWeightMap = {
			__size = 1,
			[2225.0] = 1
		},
		costMap = {
			[535.0] = 30000,
			__size = 1
		},
		levelRange = slot3[10001],
		fishingLevelRange = slot5[10001]
	},
	__default = {
		__index = {
			vipStart = 0,
			itemCount = 0,
			beginDate = 0,
			showUnable = false,
			endDate = 20990101,
			limitTimes = 0,
			limitType = 0,
			vipWeight = 1,
			position = 0,
			itemWeightMap = {
				__size = 0
			},
			costMap = {
				coin3 = 0,
				__size = 1
			},
			levelRange = slot3.default,
			fishingLevelRange = slot5.default,
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

return csv.fishing.shop
