slot0 = {
	__size = 3,
	[6] = {
		__size = 4,
		[501.0] = 3,
		[20751.0] = 50,
		[14.0] = 20,
		card = {
			id = 753,
			__size = 1
		}
	},
	[7] = {
		__size = 3,
		[6211.0] = 1,
		[501.0] = 2,
		[14.0] = 10
	},
	[8] = {
		__size = 3,
		[6211.0] = 1,
		[501.0] = 1,
		[14.0] = 10
	}
}
slot1 = {
	[10] = slot0[8],
	[5] = slot0[6],
	[7] = slot0[7],
	[6] = slot0[6],
	[9] = slot0[8],
	[8] = slot0[7]
}
csv.yunying.fightrankaward = {
	{
		huodongID = 1001,
		rank = 1,
		fightPointLeast = 80000,
		id = 1,
		award = {
			__size = 5,
			[501.0] = 6,
			[31301.0] = 1,
			[2007.0] = 1,
			[21271.0] = 80,
			card = {
				id = 1271,
				__size = 1
			}
		}
	},
	{
		huodongID = 1001,
		rank = 2,
		fightPointLeast = 80000,
		id = 2,
		award = {
			__size = 4,
			[501.0] = 5,
			[31301.0] = 1,
			[14.0] = 30,
			card = {
				id = 1271,
				__size = 1
			}
		}
	},
	{
		huodongID = 1001,
		rank = 3,
		fightPointLeast = 80000,
		id = 3,
		award = {
			__size = 3,
			[501.0] = 5,
			[14.0] = 20,
			card = {
				id = 1271,
				__size = 1
			}
		}
	},
	{
		huodongID = 1001,
		rank = 4,
		fightPointLeast = 80000,
		id = 4,
		award = {
			__size = 4,
			[501.0] = 4,
			[20751.0] = 100,
			[14.0] = 20,
			card = {
				id = 753,
				__size = 1
			}
		}
	},
	{
		huodongID = 1001,
		rank = 5,
		fightPointLeast = 80000,
		id = 5,
		award = slot1[5]
	},
	{
		huodongID = 1001,
		rank = 6,
		fightPointLeast = 80000,
		id = 6,
		award = slot1[6]
	},
	{
		huodongID = 1001,
		rank = 7,
		fightPointLeast = 80000,
		id = 7,
		award = slot1[7]
	},
	{
		huodongID = 1001,
		rank = 8,
		fightPointLeast = 80000,
		id = 8,
		award = slot1[8]
	},
	{
		huodongID = 1001,
		rank = 9,
		fightPointLeast = 80000,
		id = 9,
		award = slot1[9]
	},
	{
		huodongID = 1001,
		rank = 10,
		fightPointLeast = 80000,
		id = 10,
		award = slot1[10]
	},
	__size = 10,
	__default = {
		__index = {
			huodongID = 0,
			rank = 0,
			fightPointLeast = 1000,
			award = {
				__size = 0
			}
		}
	}
}

return csv.yunying.fightrankaward
