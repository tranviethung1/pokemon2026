slot0 = {
	__size = 2,
	[2] = {
		gold = 20000,
		coin1 = 60,
		__size = 3,
		[529.0] = 100
	},
	[3] = {
		gold = 20000,
		[2103.0] = 1,
		__size = 3,
		[529.0] = 100
	}
}
slot1 = {
	slot0[2],
	slot0[2],
	[3] = slot0[3],
	[4] = slot0[2],
	[6] = slot0[2],
	[9] = slot0[2],
	[8] = slot0[3]
}
csv.cross.arena.daily_award = {
	{
		id = 1,
		pwTime = 1,
		award = slot1[1]
	},
	{
		id = 2,
		pwTime = 2,
		award = slot1[2]
	},
	{
		id = 3,
		pwTime = 3,
		award = slot1[3]
	},
	{
		id = 4,
		pwTime = 4,
		award = slot1[4]
	},
	{
		id = 5,
		pwTime = 5,
		award = {
			talent_point = 1,
			gold = 60000,
			__size = 3,
			[529.0] = 200
		}
	},
	{
		id = 6,
		pwTime = 6,
		award = slot1[6]
	},
	{
		id = 7,
		pwTime = 7,
		award = {
			gold = 20000,
			[529.0] = 100,
			__size = 3,
			[502.0] = 1
		}
	},
	{
		id = 8,
		pwTime = 8,
		award = slot1[8]
	},
	{
		id = 9,
		pwTime = 9,
		award = slot1[9]
	},
	{
		id = 10,
		pwTime = 10,
		award = {
			gold = 60000,
			[529.0] = 200,
			__size = 3,
			[502.0] = 1
		}
	},
	__size = 10,
	__default = {
		__index = {
			award = {
				__size = 0
			}
		}
	}
}

return csv.cross.arena.daily_award
