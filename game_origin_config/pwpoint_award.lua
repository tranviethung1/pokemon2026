slot0 = {
	__size = 3,
	[3] = {
		gold = 24000,
		coin1 = 80,
		__size = 3,
		[11.0] = 15
	},
	[4] = {
		gold = 21000,
		coin1 = 60,
		__size = 3,
		[11.0] = 15
	},
	[6] = {
		gold = 15000,
		coin1 = 60,
		__size = 3,
		[11.0] = 15
	}
}
slot1 = {
	[10] = slot0[6],
	[3] = slot0[4],
	[2] = slot0[3],
	[5] = slot0[6],
	[7] = slot0[3],
	[8] = slot0[4]
}
csv.pwpoint_award = {
	{
		id = 1,
		needPoint = 20,
		award = {
			gold = 30000,
			coin1 = 100,
			__size = 3,
			[502.0] = 1
		}
	},
	{
		id = 2,
		needPoint = 18,
		award = slot1[2]
	},
	{
		id = 3,
		needPoint = 16,
		award = slot1[3]
	},
	{
		id = 4,
		needPoint = 14,
		award = {
			gold = 18000,
			coin1 = 60,
			__size = 3,
			[502.0] = 1
		}
	},
	{
		id = 5,
		needPoint = 12,
		award = slot1[5]
	},
	{
		id = 6,
		needPoint = 10,
		award = {
			talent_point = 1,
			coin1 = 100,
			gold = 30000,
			__size = 3
		}
	},
	{
		id = 7,
		needPoint = 8,
		award = slot1[7]
	},
	{
		id = 8,
		needPoint = 6,
		award = slot1[8]
	},
	{
		id = 9,
		needPoint = 4,
		award = {
			gold = 18000,
			coin1 = 60,
			__size = 3,
			[11.0] = 15
		}
	},
	{
		id = 10,
		needPoint = 2,
		award = slot1[10]
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

return csv.pwpoint_award
