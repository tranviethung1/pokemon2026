slot0 = {
	__size = 2,
	[4] = {
		coin3 = 500,
		rmb = 50,
		coin10 = 300,
		__size = 4,
		gold = 300000
	},
	[7] = {
		coin10 = 600,
		rmb = 100,
		coin3 = 1000,
		__size = 5,
		gold = 600000,
		[502.0] = 1
	}
}
slot1 = {
	[8] = slot0[7],
	[3] = slot0[4],
	[4] = slot0[4],
	[7] = slot0[7]
}
csv.cross.union_fight.rank_award = {
	{
		id = 1,
		rank = 1,
		type = 1,
		award = {
			coin10 = 500,
			rmb = 100,
			coin3 = 1000,
			__size = 5,
			gold = 500000,
			[502.0] = 1
		}
	},
	{
		id = 2,
		rank = 2,
		type = 1,
		award = {
			coin3 = 750,
			rmb = 75,
			coin10 = 400,
			__size = 4,
			gold = 400000
		}
	},
	{
		id = 3,
		rank = 3,
		type = 1,
		award = slot1[3]
	},
	{
		id = 4,
		rank = 4,
		type = 1,
		award = slot1[4]
	},
	{
		id = 5,
		rank = 1,
		type = 2,
		award = {
			coin10 = 1000,
			rmb = 200,
			coin3 = 2000,
			__size = 5,
			gold = 1000000,
			[502.0] = 3
		}
	},
	{
		id = 6,
		rank = 2,
		type = 2,
		award = {
			coin10 = 800,
			rmb = 150,
			coin3 = 1500,
			__size = 5,
			gold = 800000,
			[502.0] = 2
		}
	},
	{
		id = 7,
		rank = 3,
		type = 2,
		award = slot1[7]
	},
	{
		id = 8,
		rank = 4,
		type = 2,
		award = slot1[8]
	},
	__size = 8,
	__default = {
		__index = {
			award = {
				__size = 0
			}
		}
	}
}

return csv.cross.union_fight.rank_award
