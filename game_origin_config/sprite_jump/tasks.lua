slot0 = {
	__size = 2,
	[2] = {
		gold = 200000,
		[519.0] = 1,
		__size = 3,
		[930.0] = 20
	},
	[3] = {
		[519.0] = 1,
		rmb = 50,
		[59002.0] = 2,
		__size = 3
	}
}
slot1 = {
	[102] = slot0[3],
	[103] = slot0[2],
	[101] = slot0[2],
	[106] = slot0[3],
	[104] = slot0[3],
	[105] = slot0[2]
}
csv.sprite_jump.tasks = {
	__size = 9,
	[101] = {
		id = 101,
		huodongID = 1000,
		targetArg = 1000,
		award = slot1[101]
	},
	[102] = {
		id = 102,
		huodongID = 1000,
		targetArg = 2000,
		award = slot1[102]
	},
	[103] = {
		id = 103,
		huodongID = 1000,
		targetArg = 3500,
		award = slot1[103]
	},
	[104] = {
		id = 104,
		huodongID = 1000,
		targetArg = 5000,
		award = slot1[104]
	},
	[105] = {
		id = 105,
		huodongID = 1000,
		targetArg = 6500,
		award = slot1[105]
	},
	[106] = {
		id = 106,
		huodongID = 1000,
		targetArg = 8000,
		award = slot1[106]
	},
	[107] = {
		id = 107,
		huodongID = 1000,
		targetArg = 9500,
		award = {
			gold = 200000,
			[519.0] = 1,
			[59003.0] = 1,
			__size = 3
		}
	},
	[108] = {
		id = 108,
		huodongID = 1000,
		targetArg = 11000,
		award = {
			[519.0] = 1,
			rmb = 50,
			[59003.0] = 1,
			__size = 3
		}
	},
	[109] = {
		id = 109,
		huodongID = 1000,
		targetArg = 13000,
		award = {
			[519.0] = 1,
			rmb = 100,
			[59003.0] = 1,
			__size = 3
		}
	},
	__default = {
		__index = {
			huodongID = 0,
			targetArg = 0,
			award = {
				__size = 0
			}
		}
	}
}

return csv.sprite_jump.tasks
