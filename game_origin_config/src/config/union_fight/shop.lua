slot0 = {
	{
		__size = 0
	},
	__size = 5,
	[5] = {
		coin10 = 2200,
		__size = 1
	},
	[8] = {
		coin10 = 1500,
		__size = 1
	},
	[13] = {
		coin10 = 600,
		__size = 1
	},
	[19] = {
		coin10 = 500,
		__size = 1
	}
}
slot1 = {
	[630] = slot0[19],
	[115] = slot0[8],
	[132] = slot0[13],
	[610] = slot0[19],
	[133] = slot0[13],
	default = slot0[1],
	[114] = slot0[8],
	[131] = slot0[13],
	[111] = slot0[5],
	[110] = slot0[5],
	[113] = slot0[8],
	[112] = slot0[8]
}
csv.union_fight.shop = {
	__size = 15,
	[110] = {
		id = 110,
		itemMap = {
			__size = 1,
			[20561.0] = 2
		},
		costMap = slot1[110]
	},
	[111] = {
		id = 111,
		itemMap = {
			[20751.0] = 2,
			__size = 1
		},
		costMap = slot1[111]
	},
	[112] = {
		id = 112,
		itemMap = {
			__size = 1,
			[20721.0] = 2
		},
		costMap = slot1[112]
	},
	[113] = {
		id = 113,
		itemMap = {
			__size = 1,
			[22821.0] = 2
		},
		costMap = slot1[113]
	},
	[114] = {
		id = 114,
		itemMap = {
			[22721.0] = 2,
			__size = 1
		},
		costMap = slot1[114]
	},
	[115] = {
		id = 115,
		itemMap = {
			__size = 1,
			[23591.0] = 2
		},
		costMap = slot1[115]
	},
	[131] = {
		id = 131,
		itemMap = {
			__size = 1,
			[21851.0] = 2
		},
		costMap = slot1[131]
	},
	[132] = {
		id = 132,
		itemMap = {
			[23511.0] = 2,
			__size = 1
		},
		costMap = slot1[132]
	},
	[133] = {
		id = 133,
		itemMap = {
			[22611.0] = 2,
			__size = 1
		},
		costMap = slot1[133]
	},
	[600] = {
		id = 600,
		itemMap = {
			__size = 1,
			[15.0] = 1
		},
		costMap = {
			coin10 = 200,
			__size = 1
		}
	},
	[610] = {
		id = 610,
		itemMap = {
			__size = 1,
			[514.0] = 15
		},
		costMap = slot1[610]
	},
	[620] = {
		id = 620,
		itemMap = {
			[5000.0] = 20,
			__size = 1
		},
		costMap = {
			coin10 = 1000,
			__size = 1
		}
	},
	[630] = {
		id = 630,
		itemMap = {
			__size = 1,
			[850.0] = 50
		},
		costMap = slot1[630]
	},
	[640] = {
		id = 640,
		itemMap = {
			__size = 1,
			[851.0] = 20
		},
		costMap = {
			coin10 = 300,
			__size = 1
		}
	},
	[1001] = {
		limitType = 4,
		limitTimes = 1,
		id = 1001,
		itemMap = {
			[2222.0] = 1,
			__size = 1
		},
		costMap = {
			coin10 = 20000,
			__size = 1
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

return csv.union_fight.shop
