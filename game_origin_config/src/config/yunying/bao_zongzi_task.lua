slot0 = {
	__size = 2,
	[3] = {
		__size = 4,
		rmb = 50,
		[519.0] = 2,
		gold = 200000,
		[502.0] = 3
	},
	[5] = {
		__size = 4,
		rmb = 100,
		[501.0] = 1,
		gold = 300000,
		[519.0] = 2
	}
}
slot1 = {
	[12] = slot0[3],
	[2] = slot0[3],
	[4] = slot0[5],
	[14] = slot0[5]
}
csv.yunying.bao_zongzi_task = {
	{
		id = 1,
		huodongID = 1001,
		taskParam = 5,
		award = {
			__size = 4,
			rmb = 50,
			gold = 200000,
			[2315.0] = 1,
			[519.0] = 1
		}
	},
	{
		id = 2,
		huodongID = 1001,
		taskParam = 10,
		award = slot1[2]
	},
	{
		id = 3,
		huodongID = 1001,
		taskParam = 20,
		award = {
			__size = 4,
			rmb = 100,
			gold = 300000,
			[519.0] = 2,
			[2016.0] = 1
		}
	},
	{
		id = 4,
		huodongID = 1001,
		taskParam = 30,
		award = slot1[4]
	},
	{
		id = 5,
		huodongID = 1001,
		taskParam = 50,
		award = {
			__size = 4,
			rmb = 150,
			gold = 500000,
			[2405.0] = 1,
			[519.0] = 3
		}
	},
	__size = 10,
	[11] = {
		id = 11,
		huodongID = 1002,
		taskParam = 5,
		award = {
			__size = 4,
			rmb = 50,
			[2327.0] = 1,
			[519.0] = 1,
			gold = 200000
		}
	},
	[12] = {
		id = 12,
		huodongID = 1002,
		taskParam = 10,
		award = slot1[12]
	},
	[13] = {
		id = 13,
		huodongID = 1002,
		taskParam = 20,
		award = {
			__size = 4,
			rmb = 100,
			gold = 300000,
			[519.0] = 2,
			[2029.0] = 1
		}
	},
	[14] = {
		id = 14,
		huodongID = 1002,
		taskParam = 30,
		award = slot1[14]
	},
	[15] = {
		id = 15,
		huodongID = 1002,
		taskParam = 50,
		award = {
			__size = 4,
			rmb = 150,
			[519.0] = 3,
			gold = 500000,
			[2418.0] = 1
		}
	},
	__default = {
		__index = {
			huodongID = 0,
			taskParam = 9999,
			award = {
				__size = 0
			}
		}
	}
}

return csv.yunying.bao_zongzi_task
