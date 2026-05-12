slot0 = {
	__size = 2,
	[10] = {
		__size = 4,
		rmb = 1500,
		[14.0] = 10,
		gold = 600000,
		[502.0] = 7
	},
	[11] = {
		__size = 4,
		rmb = 2000,
		[14.0] = 10,
		gold = 900000,
		[502.0] = 10
	}
}
slot1 = {
	[9] = slot0[10],
	[10] = slot0[10],
	[12] = slot0[11],
	[11] = slot0[11]
}
csv.yunying.levelfund = {
	{
		desc = "Reach Lv.15",
		desc_th = "ถึง Lv.15",
		huodongID = 22001,
		id = 1,
		desc_en = "Reach Lv.15",
		needLevel = 15,
		award = {
			__size = 4,
			rmb = 300,
			gold = 300000,
			[12.0] = 10,
			[502.0] = 3
		}
	},
	{
		desc = "Reach Lv.20",
		desc_th = "ถึง Lv.20",
		huodongID = 22001,
		id = 2,
		desc_en = "Reach Lv.20",
		needLevel = 20,
		award = {
			__size = 4,
			rmb = 400,
			gold = 300000,
			[12.0] = 10,
			[502.0] = 3
		}
	},
	{
		desc = "Reach Lv.25",
		desc_th = "ถึง Lv.25",
		huodongID = 22001,
		id = 3,
		desc_en = "Reach Lv.25",
		needLevel = 25,
		award = {
			__size = 4,
			rmb = 500,
			gold = 300000,
			[12.0] = 10,
			[502.0] = 3
		}
	},
	{
		desc = "Reach Lv.30",
		desc_th = "ถึงLv.30",
		huodongID = 22001,
		id = 4,
		desc_en = "Reach Lv.30",
		needLevel = 30,
		award = {
			__size = 4,
			rmb = 600,
			gold = 300000,
			[12.0] = 10,
			[502.0] = 5
		}
	},
	{
		desc = "Reach Lv.35",
		desc_th = "ถึง Lv.35",
		huodongID = 22001,
		id = 5,
		desc_en = "Reach Lv.35",
		needLevel = 35,
		award = {
			__size = 4,
			rmb = 700,
			gold = 300000,
			[12.0] = 10,
			[502.0] = 5
		}
	},
	{
		desc = "Reach Lv.40",
		desc_th = "ถึง Lv.40",
		huodongID = 22001,
		id = 6,
		desc_en = "Reach Lv.40",
		needLevel = 40,
		award = {
			__size = 4,
			rmb = 800,
			gold = 600000,
			[12.0] = 10,
			[502.0] = 5
		}
	},
	{
		desc = "Reach Lv.45",
		desc_th = "ถึง Lv.45",
		huodongID = 22001,
		id = 7,
		desc_en = "Reach Lv.45",
		needLevel = 45,
		award = {
			__size = 4,
			rmb = 1000,
			gold = 600000,
			[12.0] = 10,
			[502.0] = 7
		}
	},
	{
		desc = "Reach Lv.50",
		desc_th = "ถึง Lv.50",
		huodongID = 22001,
		id = 8,
		desc_en = "Reach Lv.50",
		needLevel = 50,
		award = {
			__size = 4,
			rmb = 1200,
			gold = 600000,
			[12.0] = 10,
			[502.0] = 7
		}
	},
	{
		desc = "Reach Lv.55",
		desc_th = "ถึงLv.55",
		huodongID = 22001,
		id = 9,
		desc_en = "Reach Lv.55",
		needLevel = 55,
		award = slot1[9]
	},
	{
		desc = "Reach Lv.60",
		desc_th = "ถึง Lv.60",
		huodongID = 22001,
		id = 10,
		desc_en = "Reach Lv.60",
		needLevel = 60,
		award = slot1[10]
	},
	{
		desc = "Reach Lv.70",
		desc_th = "ถึง Lv.70",
		huodongID = 22001,
		id = 11,
		desc_en = "Reach Lv.70",
		needLevel = 70,
		award = slot1[11]
	},
	{
		desc = "Reach Lv.80",
		desc_th = "ถึงLv.80",
		huodongID = 22001,
		id = 12,
		desc_en = "Reach Lv.80",
		needLevel = 80,
		award = slot1[12]
	},
	{
		desc = "Reach Lv.90",
		desc_th = "ถึง Lv.90",
		huodongID = 22001,
		id = 13,
		desc_en = "Reach Lv.90",
		needLevel = 90,
		award = {
			__size = 4,
			rmb = 2500,
			[14.0] = 10,
			gold = 900000,
			[502.0] = 10
		}
	},
	__size = 13,
	__default = {
		__index = {
			desc = "",
			desc_th = "",
			huodongID = 0,
			desc_en = "",
			needLevel = 1,
			award = {
				__size = 0
			}
		}
	}
}

return csv.yunying.levelfund
