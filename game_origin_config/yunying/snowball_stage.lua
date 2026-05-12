slot0 = {
	__size = 4,
	[6] = {
		50,
		14,
		__size = 3,
		effect = "effect3_loop"
	},
	[10] = {
		14,
		4,
		__size = 3,
		effect = "effect1_loop"
	},
	[12] = {
		20,
		6,
		__size = 3,
		effect = "effect2_loop"
	},
	[14] = {
		25,
		7,
		__size = 3,
		effect = "effect3_loop"
	}
}
slot1 = {
	[15] = slot0[10],
	[14] = slot0[10],
	[17] = slot0[12],
	[23] = slot0[14],
	[18] = slot0[12],
	[22] = slot0[14],
	[5] = slot0[6],
	[6] = slot0[6],
	[20] = slot0[14],
	[21] = slot0[14]
}
csv.yunying.snowball_stage = {
	{
		timeScore = 30,
		huodongID = 101031,
		id = 1,
		timing = 15,
		dropsTempo = {
			12,
			6,
			__size = 3,
			effect = "effect1_loop"
		}
	},
	{
		timeScore = 40,
		huodongID = 101031,
		id = 2,
		timing = 40,
		dropsTempo = {
			35,
			12,
			__size = 3,
			effect = "effect1_loop"
		}
	},
	{
		timeScore = 50,
		huodongID = 101031,
		id = 3,
		timing = 60,
		dropsTempo = {
			33,
			11,
			__size = 3,
			effect = "effect2_loop"
		}
	},
	{
		timeScore = 60,
		huodongID = 101031,
		id = 4,
		timing = 80,
		dropsTempo = {
			40,
			13,
			__size = 3,
			effect = "effect2_loop"
		}
	},
	{
		timeScore = 70,
		huodongID = 101031,
		id = 5,
		timing = 100,
		dropsTempo = slot1[5]
	},
	{
		timeScore = 70,
		huodongID = 101031,
		id = 6,
		timing = 120,
		dropsTempo = slot1[6]
	},
	__size = 19,
	[11] = {
		timeScore = 5,
		huodongID = 10001,
		id = 11,
		timing = 5,
		dropsTempo = {
			5,
			2,
			__size = 3,
			effect = "effect1_loop"
		}
	},
	[12] = {
		timeScore = 10,
		huodongID = 10001,
		id = 12,
		timing = 15,
		dropsTempo = {
			10,
			4,
			__size = 3,
			effect = "effect1_loop"
		}
	},
	[13] = {
		timeScore = 15,
		huodongID = 10001,
		id = 13,
		timing = 20,
		dropsTempo = {
			11,
			4,
			__size = 3,
			effect = "effect1_loop"
		}
	},
	[14] = {
		timeScore = 20,
		huodongID = 10001,
		id = 14,
		timing = 30,
		dropsTempo = slot1[14]
	},
	[15] = {
		timeScore = 20,
		huodongID = 10001,
		id = 15,
		timing = 40,
		dropsTempo = slot1[15]
	},
	[16] = {
		timeScore = 25,
		huodongID = 10001,
		id = 16,
		timing = 50,
		dropsTempo = {
			20,
			5,
			__size = 3,
			effect = "effect2_loop"
		}
	},
	[17] = {
		timeScore = 25,
		huodongID = 10001,
		id = 17,
		timing = 60,
		dropsTempo = slot1[17]
	},
	[18] = {
		timeScore = 30,
		huodongID = 10001,
		id = 18,
		timing = 70,
		dropsTempo = slot1[18]
	},
	[19] = {
		timeScore = 30,
		huodongID = 10001,
		id = 19,
		timing = 80,
		dropsTempo = {
			20,
			7,
			__size = 3,
			effect = "effect2_loop"
		}
	},
	[20] = {
		timeScore = 35,
		huodongID = 10001,
		id = 20,
		timing = 90,
		dropsTempo = slot1[20]
	},
	[21] = {
		timeScore = 35,
		huodongID = 10001,
		id = 21,
		timing = 100,
		dropsTempo = slot1[21]
	},
	[22] = {
		timeScore = 35,
		huodongID = 10001,
		id = 22,
		timing = 110,
		dropsTempo = slot1[22]
	},
	[23] = {
		timeScore = 35,
		huodongID = 10001,
		id = 23,
		timing = 120,
		dropsTempo = slot1[23]
	},
	__default = {
		__index = {
			timing = 0,
			huodongID = 0,
			timeScore = 0,
			dropsTempo = {
				__size = 0
			}
		}
	}
}

return csv.yunying.snowball_stage
