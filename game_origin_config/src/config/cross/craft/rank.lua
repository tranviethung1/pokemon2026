slot0 = {
	__size = 1,
	[4] = {
		__size = 5,
		[21971.0] = 2,
		[529.0] = 160,
		[521.0] = 1,
		gold = 400000,
		[6017.0] = 6
	}
}
slot1 = {
	[3] = slot0[4],
	[4] = slot0[4]
}
csv.cross.craft.rank = {
	{
		id = 1,
		rankMax = 1,
		award = {
			__size = 5,
			[21971.0] = 3,
			[529.0] = 200,
			[521.0] = 2,
			gold = 500000,
			[6017.0] = 8
		}
	},
	{
		id = 2,
		rankMax = 2,
		award = {
			__size = 5,
			[21971.0] = 2,
			[529.0] = 180,
			[521.0] = 2,
			gold = 450000,
			[6017.0] = 7
		}
	},
	{
		id = 3,
		rankMax = 3,
		award = slot1[3]
	},
	{
		id = 4,
		rankMax = 4,
		award = slot1[4]
	},
	{
		id = 5,
		rankMax = 8,
		award = {
			__size = 5,
			[21971.0] = 1,
			[529.0] = 145,
			[521.0] = 1,
			gold = 380000,
			[6017.0] = 5
		}
	},
	{
		id = 6,
		rankMax = 16,
		award = {
			__size = 5,
			[529.0] = 130,
			[6017.0] = 4,
			[521.0] = 1,
			gold = 360000,
			[6018.0] = 1
		}
	},
	{
		id = 7,
		rankMax = 32,
		award = {
			__size = 5,
			[502.0] = 1,
			[6017.0] = 3,
			[529.0] = 120,
			gold = 340000,
			[6018.0] = 2
		}
	},
	{
		id = 8,
		rankMax = 64,
		award = {
			__size = 5,
			[502.0] = 1,
			[6017.0] = 2,
			[529.0] = 110,
			gold = 320000,
			[6018.0] = 3
		}
	},
	{
		id = 9,
		rankMax = 100,
		award = {
			__size = 4,
			[529.0] = 100,
			[6017.0] = 1,
			gold = 300000,
			[6018.0] = 4
		}
	},
	{
		id = 10,
		rankMax = 200,
		award = {
			gold = 280000,
			[529.0] = 95,
			__size = 3,
			[6018.0] = 5
		}
	},
	{
		id = 11,
		rankMax = 300,
		award = {
			gold = 260000,
			[529.0] = 90,
			__size = 3,
			[6018.0] = 5
		}
	},
	{
		id = 12,
		rankMax = 500,
		award = {
			gold = 240000,
			[529.0] = 85,
			__size = 3,
			[6018.0] = 5
		}
	},
	{
		id = 13,
		rankMax = 1000,
		award = {
			gold = 220000,
			[529.0] = 80,
			__size = 3,
			[6018.0] = 5
		}
	},
	{
		id = 14,
		rankMax = 2000,
		award = {
			gold = 200000,
			[529.0] = 75,
			__size = 3,
			[6018.0] = 5
		}
	},
	{
		id = 15,
		rankMax = 99999,
		award = {
			gold = 180000,
			[529.0] = 70,
			__size = 3,
			[6018.0] = 5
		}
	},
	__size = 15,
	__default = {
		__index = {
			version = 0,
			award = {
				__size = 0
			}
		}
	}
}

return csv.cross.craft.rank
