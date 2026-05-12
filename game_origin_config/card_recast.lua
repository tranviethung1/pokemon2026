slot0 = {
	__size = 1,
	[7] = {
		gold = 10000,
		rmb = 550,
		[19.0] = 1,
		__size = 3
	}
}
slot1 = {
	[7] = slot0[7],
	[6] = slot0[7]
}
csv.card_recast = {
	{
		id = 1,
		costItems = {
			gold = 10000,
			rmb = 0,
			[19.0] = 1,
			__size = 3
		}
	},
	{
		id = 2,
		lockNum = 1,
		costItems = {
			gold = 10000,
			rmb = 50,
			[19.0] = 1,
			__size = 3
		}
	},
	{
		id = 3,
		lockNum = 2,
		costItems = {
			gold = 10000,
			rmb = 120,
			[19.0] = 1,
			__size = 3
		}
	},
	{
		id = 4,
		lockNum = 3,
		costItems = {
			gold = 10000,
			rmb = 200,
			[19.0] = 1,
			__size = 3
		}
	},
	{
		id = 5,
		lockNum = 4,
		costItems = {
			gold = 10000,
			rmb = 350,
			[19.0] = 1,
			__size = 3
		}
	},
	{
		id = 6,
		lockNum = 5,
		costItems = slot1[6]
	},
	{
		id = 7,
		lockNum = 6,
		costItems = slot1[7]
	},
	__size = 7,
	__default = {
		__index = {
			lockNum = 0,
			costItems = {
				__size = 0
			}
		}
	}
}

return csv.card_recast
