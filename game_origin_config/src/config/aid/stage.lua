slot0 = {
	{
		gold = 100000,
		coin1 = 480,
		rmb = 500,
		__size = 3
	}
}
csv.aid.stage = {
	{
		id = 1,
		stage = 1,
		sequenceID = 1,
		costMap = slot0[1]
	},
	{
		id = 2,
		stage = 2,
		sequenceID = 1,
		costMap = {
			gold = 200000,
			coin1 = 700,
			rmb = 600,
			__size = 3
		}
	},
	{
		id = 3,
		stage = 3,
		sequenceID = 1,
		costMap = {
			gold = 200000,
			coin1 = 8000,
			rmb = 500,
			__size = 3
		}
	},
	{
		id = 4,
		stage = 4,
		sequenceID = 1,
		costMap = {
			gold = 400000,
			coin1 = 900,
			rmb = 700,
			__size = 3
		}
	},
	{
		id = 5,
		stage = 5,
		sequenceID = 1,
		costMap = slot0[1]
	},
	{
		id = 6,
		stage = 6,
		sequenceID = 1,
		costMap = slot0[1]
	},
	{
		id = 7,
		stage = 7,
		sequenceID = 1,
		costMap = slot0[1]
	},
	__size = 14,
	[10] = {
		id = 10,
		stage = 1,
		sequenceID = 2
	},
	[11] = {
		id = 11,
		stage = 2,
		sequenceID = 2
	},
	[12] = {
		id = 12,
		stage = 3,
		sequenceID = 2
	},
	[13] = {
		id = 13,
		stage = 4,
		sequenceID = 2
	},
	[14] = {
		id = 14,
		stage = 5,
		sequenceID = 2
	},
	[15] = {
		id = 15,
		stage = 6,
		sequenceID = 2
	},
	[16] = {
		id = 16,
		stage = 7,
		sequenceID = 2
	},
	__default = {
		__index = {
			stage = 0,
			sequenceID = 0,
			costMap = {
				__size = 0
			}
		}
	}
}

return csv.aid.stage
