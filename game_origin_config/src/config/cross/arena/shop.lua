slot0 = {
	{
		__size = 0
	},
	__size = 10,
	[4] = {
		[21901.0] = 2,
		__size = 1
	},
	[5] = {
		__size = 1,
		coin12 = 1200
	},
	[6] = {
		150,
		150
	},
	[7] = {
		[23001.0] = 2,
		__size = 1
	},
	[8] = {
		[23141.0] = 2,
		__size = 1
	},
	[9] = {
		__size = 1,
		coin12 = 800
	},
	[10] = {
		[23411.0] = 2,
		__size = 1
	},
	[12] = {
		__size = 1,
		coin12 = 1500
	},
	[13] = {
		__size = 1,
		coin12 = 1000
	}
}
slot1 = {
	[201] = slot0[6],
	[1001] = slot0[6],
	[211] = slot0[6],
	[1002] = slot0[6],
	[114] = slot0[6],
	[111] = slot0[6],
	[241] = slot0[6],
	[221] = slot0[6],
	[113] = slot0[6],
	[112] = slot0[6],
	[102] = slot0[6],
	[103] = slot0[6],
	[101] = slot0[6],
	[231] = slot0[6],
	[104] = slot0[6]
}
slot2 = {
	[201] = slot0[5],
	[620] = slot0[13],
	[211] = slot0[5],
	default = slot0[1],
	[114] = slot0[13],
	[111] = slot0[12],
	[241] = slot0[9],
	[221] = slot0[5],
	[113] = slot0[13],
	[112] = slot0[12],
	[102] = slot0[5],
	[103] = slot0[9],
	[101] = slot0[5],
	[231] = slot0[9],
	[104] = slot0[9]
}
slot3 = {
	[201] = slot0[4],
	[211] = slot0[7],
	default = slot0[1],
	[114] = slot0[10],
	[111] = slot0[4],
	[241] = slot0[10],
	[113] = slot0[8],
	[112] = slot0[7],
	[102] = slot0[7],
	[103] = slot0[8],
	[101] = slot0[4],
	[231] = slot0[8],
	[104] = slot0[10]
}
csv.cross.arena.shop = {
	__size = 20,
	[101] = {
		id = 101,
		itemMap = slot3[101],
		costMap = slot2[101],
		levelRange = slot1[101]
	},
	[102] = {
		id = 102,
		itemMap = slot3[102],
		costMap = slot2[102],
		levelRange = slot1[102]
	},
	[103] = {
		id = 103,
		itemMap = slot3[103],
		costMap = slot2[103],
		levelRange = slot1[103]
	},
	[104] = {
		id = 104,
		itemMap = slot3[104],
		costMap = slot2[104],
		levelRange = slot1[104]
	},
	[201] = {
		id = 201,
		itemMap = slot3[201],
		costMap = slot2[201],
		levelRange = slot1[201]
	},
	[211] = {
		id = 211,
		itemMap = slot3[211],
		costMap = slot2[211],
		levelRange = slot1[211]
	},
	[221] = {
		id = 221,
		itemMap = {
			__size = 1,
			[22231.0] = 2
		},
		costMap = slot2[221],
		levelRange = slot1[221]
	},
	[231] = {
		id = 231,
		itemMap = slot3[231],
		costMap = slot2[231],
		levelRange = slot1[231]
	},
	[241] = {
		id = 241,
		itemMap = slot3[241],
		costMap = slot2[241],
		levelRange = slot1[241]
	},
	[111] = {
		id = 111,
		itemMap = slot3[111],
		costMap = slot2[111],
		levelRange = slot1[111]
	},
	[112] = {
		id = 112,
		itemMap = slot3[112],
		costMap = slot2[112],
		levelRange = slot1[112]
	},
	[113] = {
		id = 113,
		itemMap = slot3[113],
		costMap = slot2[113],
		levelRange = slot1[113]
	},
	[114] = {
		id = 114,
		itemMap = slot3[114],
		costMap = slot2[114],
		levelRange = slot1[114]
	},
	[600] = {
		id = 600,
		itemMap = {
			__size = 1,
			[15.0] = 2
		},
		costMap = {
			__size = 1,
			coin12 = 200
		}
	},
	[610] = {
		id = 610,
		itemMap = {
			__size = 1,
			[514.0] = 30
		},
		costMap = {
			__size = 1,
			coin12 = 500
		}
	},
	[620] = {
		id = 620,
		itemMap = {
			[5000.0] = 40,
			__size = 1
		},
		costMap = slot2[620]
	},
	[630] = {
		id = 630,
		itemMap = {
			__size = 1,
			[529.0] = 100
		},
		costMap = {
			__size = 1,
			coin12 = 300
		}
	},
	[1001] = {
		limitType = 3,
		limitTimes = 2,
		id = 1001,
		itemMap = {
			__size = 1,
			[992.0] = 1
		},
		costMap = {
			__size = 1,
			coin12 = 3600
		},
		levelRange = slot1[1001]
	},
	[1002] = {
		limitType = 3,
		limitTimes = 1,
		id = 1002,
		itemMap = {
			__size = 1,
			[993.0] = 1
		},
		costMap = {
			__size = 1,
			coin12 = 10000
		},
		levelRange = slot1[1002]
	},
	[1101] = {
		limitType = 4,
		limitTimes = 1,
		id = 1101,
		itemMap = {
			__size = 1,
			[2208.0] = 1
		},
		costMap = {
			__size = 1,
			coin12 = 24000
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
			itemMap = slot3.default,
			costMap = slot2.default,
			levelRange = {
				1,
				150
			},
			languages = {
				"cn",
				"en",
				"br",
				"th",
				"vn",
				"kr"
			}
		}
	}
}

return csv.cross.arena.shop
