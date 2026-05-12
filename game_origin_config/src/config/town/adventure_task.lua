slot0 = {
	__size = 7,
	[2] = {
		gold = 100000,
		__size = 2,
		[8201.0] = 1200
	},
	[3] = {
		gold = 200000,
		__size = 2,
		[8201.0] = 2400
	},
	[4] = {
		gold = 300000,
		__size = 2,
		[8201.0] = 3600
	},
	[5] = {
		[527.0] = 2,
		rmb = 30,
		gold = 50000,
		__size = 3
	},
	[6] = {
		gold = 100000,
		rmb = 50,
		[526.0] = 2,
		__size = 3
	},
	[7] = {
		gold = 200000,
		rmb = 50,
		[501.0] = 2,
		__size = 3
	},
	[8] = {
		gold = 300000,
		rmb = 100,
		__size = 3,
		[521.0] = 3
	}
}
slot1 = {
	[1321] = slot0[7],
	[1301] = slot0[5],
	[1221] = slot0[7],
	[211] = slot0[3],
	[1121] = slot0[7],
	[311] = slot0[3],
	[1201] = slot0[5],
	[111] = slot0[3],
	[1111] = slot0[6],
	[321] = slot0[4],
	[401] = slot0[2],
	[421] = slot0[4],
	[1031] = slot0[8],
	[1011] = slot0[6],
	[201] = slot0[2],
	[1211] = slot0[6],
	[1231] = slot0[8],
	[1311] = slot0[6],
	[301] = slot0[2],
	[1131] = slot0[8],
	[1331] = slot0[8],
	[121] = slot0[4],
	[101] = slot0[2],
	[221] = slot0[4],
	[1021] = slot0[7],
	[411] = slot0[3],
	[1101] = slot0[5],
	[1001] = slot0[5]
}
csv.town.adventure_task = {
	__size = 28,
	[101] = {
		id = 101,
		areaType = 1,
		desc = "Expedition 5 times",
		targetArg = 5,
		taskBelong = 1,
		taskType = 1,
		awards = slot1[101]
	},
	[111] = {
		sort = 2,
		areaType = 1,
		targetArg = 20,
		id = 111,
		taskBelong = 1,
		desc = "Expedition 20 times",
		taskType = 1,
		awards = slot1[111]
	},
	[121] = {
		sort = 3,
		areaType = 1,
		targetArg = 60,
		id = 121,
		taskBelong = 1,
		desc = "Expedition 60 times",
		taskType = 1,
		awards = slot1[121]
	},
	[201] = {
		id = 201,
		areaType = 2,
		desc = "Expedition 5 times",
		targetArg = 5,
		taskBelong = 1,
		taskType = 1,
		awards = slot1[201]
	},
	[211] = {
		sort = 2,
		areaType = 2,
		targetArg = 20,
		id = 211,
		taskBelong = 1,
		desc = "Expedition 20 times",
		taskType = 1,
		awards = slot1[211]
	},
	[221] = {
		sort = 3,
		areaType = 2,
		targetArg = 60,
		id = 221,
		taskBelong = 1,
		desc = "Expedition 60 times",
		taskType = 1,
		awards = slot1[221]
	},
	[301] = {
		id = 301,
		areaType = 3,
		desc = "Expedition 5 times",
		targetArg = 5,
		taskBelong = 1,
		taskType = 1,
		awards = slot1[301]
	},
	[311] = {
		sort = 2,
		areaType = 3,
		targetArg = 20,
		id = 311,
		taskBelong = 1,
		desc = "Expedition 20 times",
		taskType = 1,
		awards = slot1[311]
	},
	[321] = {
		sort = 3,
		areaType = 3,
		targetArg = 60,
		id = 321,
		taskBelong = 1,
		desc = "Expedition 60 times",
		taskType = 1,
		awards = slot1[321]
	},
	[401] = {
		id = 401,
		areaType = 4,
		desc = "Expedition 5 times",
		targetArg = 5,
		taskBelong = 1,
		taskType = 1,
		awards = slot1[401]
	},
	[411] = {
		sort = 2,
		areaType = 4,
		targetArg = 20,
		id = 411,
		taskBelong = 1,
		desc = "Expedition 20 times",
		taskType = 1,
		awards = slot1[411]
	},
	[421] = {
		sort = 3,
		areaType = 4,
		targetArg = 60,
		id = 421,
		taskBelong = 1,
		desc = "Expedition 60 times",
		taskType = 1,
		awards = slot1[421]
	},
	[1001] = {
		id = 1001,
		areaType = 1,
		desc = "Reaching the 'Unskilled'",
		targetArg = 2,
		taskBelong = 2,
		taskType = 2,
		awards = slot1[1001]
	},
	[1011] = {
		sort = 2,
		areaType = 1,
		targetArg = 3,
		id = 1011,
		taskBelong = 2,
		desc = "Reaching the 'Venture deeper'",
		taskType = 2,
		awards = slot1[1011]
	},
	[1021] = {
		sort = 3,
		areaType = 1,
		targetArg = 4,
		id = 1021,
		taskBelong = 2,
		desc = "Reaching the 'Getting better'",
		taskType = 2,
		awards = slot1[1021]
	},
	[1031] = {
		sort = 4,
		areaType = 1,
		targetArg = 5,
		id = 1031,
		taskBelong = 2,
		desc = "Reaching the 'Familiar'",
		taskType = 2,
		awards = slot1[1031]
	},
	[1101] = {
		id = 1101,
		areaType = 2,
		desc = "Reaching the 'Unskilled'",
		targetArg = 2,
		taskBelong = 2,
		taskType = 2,
		awards = slot1[1101]
	},
	[1111] = {
		sort = 2,
		areaType = 2,
		targetArg = 3,
		id = 1111,
		taskBelong = 2,
		desc = "Reaching the 'Venture deeper'",
		taskType = 2,
		awards = slot1[1111]
	},
	[1121] = {
		sort = 3,
		areaType = 2,
		targetArg = 4,
		id = 1121,
		taskBelong = 2,
		desc = "Reaching the 'Getting better'",
		taskType = 2,
		awards = slot1[1121]
	},
	[1131] = {
		sort = 4,
		areaType = 2,
		targetArg = 5,
		id = 1131,
		taskBelong = 2,
		desc = "Reaching the 'Familiar'",
		taskType = 2,
		awards = slot1[1131]
	},
	[1201] = {
		id = 1201,
		areaType = 3,
		desc = "Reaching the 'Unskilled'",
		targetArg = 2,
		taskBelong = 2,
		taskType = 2,
		awards = slot1[1201]
	},
	[1211] = {
		sort = 2,
		areaType = 3,
		targetArg = 3,
		id = 1211,
		taskBelong = 2,
		desc = "Reaching the 'Venture deeper'",
		taskType = 2,
		awards = slot1[1211]
	},
	[1221] = {
		sort = 3,
		areaType = 3,
		targetArg = 4,
		id = 1221,
		taskBelong = 2,
		desc = "Reaching the 'Getting better'",
		taskType = 2,
		awards = slot1[1221]
	},
	[1231] = {
		sort = 4,
		areaType = 3,
		targetArg = 5,
		id = 1231,
		taskBelong = 2,
		desc = "Reaching the 'Familiar'",
		taskType = 2,
		awards = slot1[1231]
	},
	[1301] = {
		id = 1301,
		areaType = 4,
		desc = "Reaching the 'Unskilled'",
		targetArg = 2,
		taskBelong = 2,
		taskType = 2,
		awards = slot1[1301]
	},
	[1311] = {
		sort = 2,
		areaType = 4,
		targetArg = 3,
		id = 1311,
		taskBelong = 2,
		desc = "Reaching the 'Venture deeper'",
		taskType = 2,
		awards = slot1[1311]
	},
	[1321] = {
		sort = 3,
		areaType = 4,
		targetArg = 4,
		id = 1321,
		taskBelong = 2,
		desc = "Reaching the 'Getting better'",
		taskType = 2,
		awards = slot1[1321]
	},
	[1331] = {
		sort = 4,
		areaType = 4,
		targetArg = 5,
		id = 1331,
		taskBelong = 2,
		desc = "Reaching the 'Familiar'",
		taskType = 2,
		awards = slot1[1331]
	},
	__default = {
		__index = {
			sort = 1,
			areaType = 0,
			desc = "adventure_task",
			taskBelong = 0,
			taskType = 0,
			awards = {
				__size = 0
			}
		}
	}
}

return csv.town.adventure_task
