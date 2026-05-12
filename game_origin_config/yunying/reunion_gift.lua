slot0 = {
	__size = 2,
	[4] = {
		gold = 300000,
		rmb = 300,
		__size = 3,
		[520.0] = 3
	},
	[10] = {
		__size = 4,
		rmb = 50,
		[501.0] = 1,
		gold = 300000,
		[502.0] = 2
	}
}
slot1 = {
	[203] = slot0[10],
	[202] = slot0[10],
	[302] = slot0[10],
	[303] = slot0[10],
	[102] = slot0[10],
	[3] = slot0[4],
	[403] = slot0[10],
	[402] = slot0[10],
	[6] = slot0[4],
	[9] = slot0[4],
	[103] = slot0[10]
}
csv.yunying.reunion_gift = {
	{
		name = "重聚礼包",
		huodongID = 101016,
		type = 1,
		id = 1,
		item = {
			__size = 3,
			rmb = 1200,
			[500.0] = 10,
			[514.0] = 50
		}
	},
	{
		name = "绑定礼包",
		huodongID = 101016,
		type = 2,
		id = 2,
		target = 1,
		item = {
			gold = 500000,
			rmb = 300,
			[519.0] = 3,
			__size = 3
		}
	},
	{
		name = "绑定礼包",
		huodongID = 101016,
		type = 2,
		id = 3,
		target = 2,
		item = slot1[3]
	},
	{
		name = "重聚礼包",
		huodongID = 101017,
		type = 1,
		id = 4,
		item = {
			__size = 3,
			rmb = 1500,
			[500.0] = 20,
			[514.0] = 100
		}
	},
	{
		name = "绑定礼包",
		huodongID = 101017,
		type = 2,
		id = 5,
		target = 1,
		item = {
			gold = 500000,
			rmb = 400,
			[519.0] = 3,
			__size = 3
		}
	},
	{
		name = "绑定礼包",
		huodongID = 101017,
		type = 2,
		id = 6,
		target = 2,
		item = slot1[6]
	},
	{
		name = "重聚礼包",
		huodongID = 101018,
		type = 1,
		id = 7,
		item = {
			__size = 3,
			rmb = 1800,
			[500.0] = 30,
			[514.0] = 150
		}
	},
	{
		name = "绑定礼包",
		huodongID = 101018,
		type = 2,
		id = 8,
		target = 1,
		item = {
			gold = 500000,
			rmb = 500,
			[519.0] = 3,
			__size = 3
		}
	},
	{
		name = "绑定礼包",
		huodongID = 101018,
		type = 2,
		id = 9,
		target = 2,
		item = slot1[9]
	},
	__size = 21,
	[101] = {
		name = "重聚礼包",
		huodongID = 1001,
		type = 1,
		id = 101,
		item = {
			[503.0] = 3,
			rmb = 100,
			gold = 300000,
			__size = 4,
			[519.0] = 3
		}
	},
	[102] = {
		name = "绑定礼包",
		huodongID = 1001,
		type = 2,
		id = 102,
		target = 1,
		item = slot1[102]
	},
	[103] = {
		name = "绑定礼包",
		huodongID = 1001,
		type = 2,
		id = 103,
		target = 2,
		item = slot1[103]
	},
	[201] = {
		name = "重聚礼包",
		huodongID = 1002,
		type = 1,
		id = 201,
		item = {
			[503.0] = 3,
			rmb = 150,
			gold = 300000,
			__size = 4,
			[519.0] = 3
		}
	},
	[202] = {
		name = "绑定礼包",
		huodongID = 1002,
		type = 2,
		id = 202,
		target = 1,
		item = slot1[202]
	},
	[203] = {
		name = "绑定礼包",
		huodongID = 1002,
		type = 2,
		id = 203,
		target = 2,
		item = slot1[203]
	},
	[301] = {
		name = "重聚礼包",
		huodongID = 1003,
		type = 1,
		id = 301,
		item = {
			[503.0] = 3,
			rmb = 200,
			gold = 300000,
			__size = 4,
			[519.0] = 3
		}
	},
	[302] = {
		name = "绑定礼包",
		huodongID = 1003,
		type = 2,
		id = 302,
		target = 1,
		item = slot1[302]
	},
	[303] = {
		name = "绑定礼包",
		huodongID = 1003,
		type = 2,
		id = 303,
		target = 2,
		item = slot1[303]
	},
	[401] = {
		name = "重聚礼包",
		huodongID = 1004,
		type = 1,
		id = 401,
		item = {
			[503.0] = 3,
			rmb = 250,
			gold = 300000,
			__size = 4,
			[519.0] = 3
		}
	},
	[402] = {
		name = "绑定礼包",
		huodongID = 1004,
		type = 2,
		id = 402,
		target = 1,
		item = slot1[402]
	},
	[403] = {
		name = "绑定礼包",
		huodongID = 1004,
		type = 2,
		id = 403,
		target = 2,
		item = slot1[403]
	},
	__default = {
		__index = {
			name = "",
			huodongID = 0,
			type = 0,
			target = 0,
			item = {
				__size = 0
			}
		}
	}
}

return csv.yunying.reunion_gift
