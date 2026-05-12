slot0 = {
	__size = 1,
	[2] = {
		__size = 4,
		card = 30041,
		[21006.0] = 100,
		gold = 10000,
		[52.0] = 100
	}
}
slot1 = {
	slot0[2],
	slot0[2],
	[3] = slot0[2],
	[5] = slot0[2],
	[4] = slot0[2]
}
csv.yunying.rmbcost = {
	{
		desc = "Spend 280 diamonds in total",
		desc_th = "ใช้จ่ายทั้งหมด 280 เพชร",
		huodongID = 5001,
		id = 1,
		desc_en = "Spend 280 diamonds in total",
		amount = 280,
		award = slot1[1]
	},
	{
		desc = "Spend 1280 diamonds in total",
		desc_th = "ใช้จ่ายทั้งหมด 1280 เพชร",
		huodongID = 5001,
		id = 2,
		desc_en = "Spend 1280 diamonds in total",
		amount = 1280,
		award = slot1[2]
	},
	{
		desc = "Spend 3280 diamonds in total",
		desc_th = "ใช้จ่ายทั้งหมด 3280 เพชร",
		huodongID = 5001,
		id = 3,
		desc_en = "Spend 3280 diamonds in total",
		amount = 3280,
		award = slot1[3]
	},
	{
		desc = "Spend 6800 diamonds in total",
		desc_th = "ใช้จ่ายทั้งหมด 6800 เพชร",
		huodongID = 5001,
		id = 4,
		desc_en = "Spend 6800 diamonds in total",
		amount = 6800,
		award = slot1[4]
	},
	{
		desc = "Spend 13800 diamonds in total",
		desc_th = "ใช้จ่ายทั้งหมด 13800 เพชร",
		huodongID = 5001,
		id = 5,
		desc_en = "Spend 13800 diamonds in total",
		amount = 13800,
		award = slot1[5]
	},
	__size = 5,
	__default = {
		__index = {
			desc = "",
			desc_th = "",
			huodongID = 0,
			desc_en = "",
			amount = 0,
			award = {
				__size = 0
			}
		}
	}
}

return csv.yunying.rmbcost
