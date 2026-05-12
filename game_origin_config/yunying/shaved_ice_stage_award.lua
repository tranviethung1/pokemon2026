slot0 = {
	__size = 6,
	[2] = {
		__size = 0
	},
	[7] = {
		__size = 1,
		libs = {
			10101
		}
	},
	[12] = {
		__size = 1,
		libs = {
			10101,
			10101
		}
	},
	[17] = {
		__size = 1,
		libs = {
			10101,
			10101,
			10101
		}
	},
	[25] = {
		__size = 1,
		libs = {
			10101,
			10101,
			10101,
			10101,
			10101
		}
	},
	[39] = {
		gold = 240000,
		__size = 2,
		[6394.0] = 18
	}
}
slot1 = {
	[11] = slot0[25],
	[10] = slot0[25],
	[13] = slot0[25],
	[12] = slot0[25],
	[15] = slot0[25],
	[14] = slot0[25],
	[17] = slot0[25],
	[16] = slot0[25],
	default = slot0[2],
	[3] = slot0[7],
	[2] = slot0[7],
	[5] = slot0[12],
	[4] = slot0[12],
	[7] = slot0[17],
	[6] = slot0[17],
	[9] = slot0[25]
}
slot2 = {
	default = slot0[2],
	[17] = slot0[39],
	[16] = slot0[39]
}
csv.yunying.shaved_ice_stage_award = {
	{
		id = 1,
		huodongID = 101058,
		score = {
			0,
			10
		},
		award = {
			gold = 10000,
			__size = 2,
			[6394.0] = 2
		}
	},
	{
		huodongID = 101058,
		id = 2,
		score = {
			10,
			30
		},
		award = {
			gold = 20000,
			__size = 2,
			[6394.0] = 4
		},
		randomAward = slot1[2]
	},
	{
		huodongID = 101058,
		id = 3,
		score = {
			30,
			60
		},
		award = {
			gold = 30000,
			__size = 2,
			[6394.0] = 6
		},
		randomAward = slot1[3]
	},
	{
		huodongID = 101058,
		id = 4,
		score = {
			60,
			90
		},
		award = {
			gold = 40000,
			__size = 2,
			[6394.0] = 8
		},
		randomAward = slot1[4]
	},
	{
		huodongID = 101058,
		id = 5,
		score = {
			90,
			120
		},
		award = {
			gold = 50000,
			__size = 2,
			[6394.0] = 10
		},
		randomAward = slot1[5]
	},
	{
		huodongID = 101058,
		id = 6,
		score = {
			120,
			150
		},
		award = {
			gold = 60000,
			__size = 2,
			[6394.0] = 12
		},
		randomAward = slot1[6]
	},
	{
		huodongID = 101058,
		id = 7,
		score = {
			150,
			180
		},
		award = {
			gold = 70000,
			__size = 2,
			[6394.0] = 14
		},
		randomAward = slot1[7]
	},
	{
		huodongID = 101058,
		id = 8,
		score = {
			180,
			200
		},
		award = {
			gold = 80000,
			__size = 2,
			[6394.0] = 16
		},
		randomAward = {
			__size = 1,
			libs = {
				10101,
				10101,
				10101,
				10101
			}
		}
	},
	{
		huodongID = 101058,
		id = 9,
		score = {
			200,
			220
		},
		award = {
			gold = 100000,
			__size = 2,
			[6394.0] = 18
		},
		randomAward = slot1[9]
	},
	{
		huodongID = 101058,
		id = 10,
		score = {
			220,
			240
		},
		award = {
			gold = 120000,
			__size = 2,
			[6394.0] = 18
		},
		randomAward = slot1[10]
	},
	{
		huodongID = 101058,
		id = 11,
		score = {
			240,
			270
		},
		award = {
			gold = 140000,
			__size = 2,
			[6394.0] = 18
		},
		randomAward = slot1[11]
	},
	{
		huodongID = 101058,
		id = 12,
		score = {
			270,
			300
		},
		award = {
			gold = 160000,
			__size = 2,
			[6394.0] = 18
		},
		randomAward = slot1[12]
	},
	{
		huodongID = 101058,
		id = 13,
		score = {
			300,
			330
		},
		award = {
			gold = 180000,
			__size = 2,
			[6394.0] = 18
		},
		randomAward = slot1[13]
	},
	{
		huodongID = 101058,
		id = 14,
		score = {
			330,
			360
		},
		award = {
			gold = 200000,
			__size = 2,
			[6394.0] = 18
		},
		randomAward = slot1[14]
	},
	{
		huodongID = 101058,
		id = 15,
		score = {
			360,
			390
		},
		award = {
			gold = 220000,
			__size = 2,
			[6394.0] = 18
		},
		randomAward = slot1[15]
	},
	{
		huodongID = 101058,
		id = 16,
		score = {
			390,
			420
		},
		award = slot2[16],
		randomAward = slot1[16]
	},
	{
		huodongID = 101058,
		id = 17,
		score = {
			420,
			99999999
		},
		award = slot2[17],
		randomAward = slot1[17]
	},
	__size = 17,
	__default = {
		__index = {
			huodongID = 0,
			score = {},
			award = slot2.default,
			randomAward = slot1.default
		}
	}
}

return csv.yunying.shaved_ice_stage_award
