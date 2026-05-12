slot0 = {
	{
		__size = 0
	},
	__size = 5,
	[6] = {
		__size = 2,
		rmb = 100,
		[501.0] = 1
	},
	[14] = {
		gold = 18000,
		rmb = 80,
		__size = 2
	},
	[17] = {
		gold = 12000,
		rmb = 60,
		__size = 2
	},
	[20] = {
		gold = 6000,
		rmb = 50,
		__size = 2
	}
}
slot2 = {
	[11] = slot0[6],
	[24] = slot0[20],
	[15] = slot0[14],
	[16] = slot0[14],
	[19] = slot0[17],
	[23] = slot0[20],
	[20] = slot0[17],
	default = slot0[1],
	[5] = slot0[6],
	[8] = slot0[6]
}
csv.pwrank_award = {
	{
		id = 1,
		needRank = 1,
		award = {
			__size = 2,
			[6051.0] = 1,
			rmb = 200
		}
	},
	{
		id = 2,
		needRank = 3,
		award = {
			gold = 100000,
			rmb = 150,
			__size = 2
		}
	},
	{
		id = 3,
		needRank = 6,
		award = {
			__size = 2,
			rmb = 120,
			[6052.0] = 1
		}
	},
	{
		id = 4,
		needRank = 10,
		award = {
			gold = 80000,
			rmb = 100,
			__size = 2
		}
	},
	{
		id = 5,
		needRank = 30,
		award = slot2[5]
	},
	{
		id = 6,
		needRank = 50,
		award = {
			gold = 45000,
			rmb = 100,
			__size = 2
		}
	},
	{
		id = 7,
		needRank = 70,
		award = {
			gold = 42500,
			rmb = 100,
			__size = 2
		}
	},
	{
		id = 8,
		needRank = 100,
		award = slot2[8]
	},
	{
		id = 9,
		needRank = 200,
		award = {
			gold = 37500,
			rmb = 100,
			__size = 2
		}
	},
	{
		id = 10,
		needRank = 300,
		award = {
			gold = 35000,
			rmb = 100,
			__size = 2
		}
	},
	{
		id = 11,
		needRank = 400,
		award = slot2[11]
	},
	{
		id = 12,
		needRank = 600,
		award = {
			__size = 2,
			rmb = 100,
			[941.0] = 1
		}
	},
	{
		id = 13,
		needRank = 800,
		award = {
			gold = 25000,
			rmb = 100,
			__size = 2
		}
	},
	{
		id = 14,
		needRank = 1000,
		award = {
			[503.0] = 1,
			rmb = 100,
			__size = 2
		}
	},
	{
		id = 15,
		needRank = 1500,
		award = slot2[15]
	},
	{
		id = 16,
		needRank = 2000,
		award = slot2[16]
	},
	{
		id = 17,
		needRank = 3000,
		award = {
			[503.0] = 1,
			rmb = 80,
			__size = 2
		}
	},
	{
		id = 18,
		needRank = 4000,
		award = {
			gold = 16000,
			rmb = 60,
			__size = 2
		}
	},
	{
		id = 19,
		needRank = 6000,
		award = slot2[19]
	},
	{
		id = 20,
		needRank = 8000,
		award = slot2[20]
	},
	{
		id = 21,
		needRank = 10000,
		award = {
			gold = 10000,
			rmb = 60,
			__size = 2
		}
	},
	{
		id = 22,
		needRank = 12000,
		award = {
			gold = 8000,
			rmb = 50,
			__size = 2
		}
	},
	{
		id = 23,
		needRank = 16000,
		award = slot2[23]
	},
	{
		id = 24,
		needRank = 20000,
		award = slot2[24]
	},
	{
		id = 25,
		needRank = 30000,
		award = {
			gold = 5000,
			rmb = 50,
			__size = 2
		}
	},
	__size = 25,
	__default = {
		__index = {
			award = slot2.default,
			cost = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.pwrank_award
