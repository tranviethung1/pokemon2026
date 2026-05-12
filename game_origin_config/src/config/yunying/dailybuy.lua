slot0 = {
	__size = 1,
	[4] = {
		gold = 1,
		__size = 1
	}
}
slot1 = {
	[8] = slot0[4],
	[3] = slot0[4],
	[4] = slot0[4],
	[14] = slot0[4],
	[6] = slot0[4]
}
csv.yunying.dailybuy = {
	{
		rmbShow = 300,
		discount = 2,
		huodongID = 19001,
		rmbCost = 60,
		id = 1,
		buyMax = 3000,
		vipLeast = 0,
		item = {
			__size = 1,
			[100.0] = 3
		}
	},
	{
		rmbShow = 1000,
		discount = 3,
		huodongID = 19001,
		rmbCost = 300,
		id = 2,
		buyMax = 1500,
		vipLeast = 3,
		item = {
			__size = 1,
			[520.0] = 10
		}
	},
	{
		rmbShow = 600,
		id = 3,
		rmbCost = 120,
		buyMax = 2500,
		dayIdx = 1,
		discount = 2,
		huodongID = 19001,
		vipLeast = 0,
		item = slot1[3]
	},
	{
		rmbShow = 2000,
		id = 4,
		rmbCost = 400,
		buyMax = 1000,
		dayIdx = 1,
		discount = 2,
		huodongID = 19001,
		vipLeast = 3,
		item = slot1[4]
	},
	{
		rmbShow = 750,
		id = 5,
		rmbCost = 150,
		buyMax = 1500,
		dayIdx = 2,
		discount = 2,
		huodongID = 19001,
		vipLeast = 0,
		item = {
			gold = 300000,
			__size = 1
		}
	},
	{
		rmbShow = 3000,
		id = 6,
		rmbCost = 600,
		buyMax = 600,
		dayIdx = 2,
		discount = 2,
		huodongID = 19001,
		vipLeast = 4,
		item = slot1[6]
	},
	{
		rmbShow = 1000,
		id = 7,
		rmbCost = 200,
		buyMax = 1500,
		dayIdx = 3,
		discount = 2,
		huodongID = 19001,
		vipLeast = 0,
		item = {
			__size = 1,
			[500.0] = 4
		}
	},
	{
		rmbShow = 3000,
		id = 8,
		rmbCost = 600,
		buyMax = 500,
		dayIdx = 3,
		discount = 2,
		huodongID = 19001,
		vipLeast = 5,
		item = slot1[8]
	},
	{
		rmbShow = 1000,
		id = 9,
		rmbCost = 200,
		buyMax = 1200,
		dayIdx = 4,
		discount = 2,
		huodongID = 19001,
		vipLeast = 0,
		item = {
			talent_point = 4,
			__size = 1
		}
	},
	{
		rmbShow = 4000,
		id = 10,
		rmbCost = 800,
		buyMax = 300,
		dayIdx = 4,
		discount = 2,
		huodongID = 19001,
		vipLeast = 6,
		item = {
			talent_point = 16,
			__size = 1
		}
	},
	{
		rmbShow = 1000,
		id = 11,
		rmbCost = 200,
		buyMax = 1000,
		dayIdx = 5,
		discount = 2,
		huodongID = 19001,
		vipLeast = 0,
		item = {
			__size = 1,
			[520.0] = 5
		}
	},
	{
		rmbShow = 5000,
		id = 12,
		rmbCost = 1000,
		buyMax = 200,
		dayIdx = 5,
		discount = 2,
		huodongID = 19001,
		vipLeast = 7,
		item = {
			[501.0] = 8,
			__size = 1
		}
	},
	{
		rmbShow = 1000,
		id = 13,
		rmbCost = 200,
		buyMax = 800,
		dayIdx = 6,
		discount = 2,
		huodongID = 19001,
		vipLeast = 0,
		item = {
			__size = 1,
			[611.0] = 100
		}
	},
	{
		rmbShow = 5000,
		id = 14,
		rmbCost = 1000,
		buyMax = 100,
		dayIdx = 6,
		discount = 2,
		huodongID = 19001,
		vipLeast = 8,
		item = slot1[14]
	},
	__size = 14,
	__default = {
		__index = {
			rmbShow = 100,
			discount = 0,
			huodongID = 0,
			rmbCost = 90,
			buyMax = 10000,
			vipLeast = 2,
			dayIdx = 0,
			item = {
				__size = 0
			}
		}
	}
}

return csv.yunying.dailybuy
