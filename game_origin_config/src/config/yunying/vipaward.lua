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
	[11] = slot0[2],
	[10] = slot0[2],
	[13] = slot0[2],
	[12] = slot0[2],
	[15] = slot0[2],
	[14] = slot0[2],
	[3] = slot0[2],
	[5] = slot0[2],
	[4] = slot0[2],
	[7] = slot0[2],
	[6] = slot0[2],
	[9] = slot0[2],
	[8] = slot0[2]
}
csv.yunying.vipaward = {
	{
		desc_th = "VIP 1 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 1,
		desc_en = "VIP 1 can claim",
		desc = "VIP 1 can claim",
		award = slot1[1]
	},
	{
		desc = "VIP 2 can claim",
		desc_th = "VIP 2 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 2,
		desc_en = "VIP 2 can claim",
		needLevel = 2,
		award = slot1[2]
	},
	{
		desc = "VIP 3 can claim",
		desc_th = "VIP 3 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 3,
		desc_en = "VIP 3 can claim",
		needLevel = 3,
		award = slot1[3]
	},
	{
		desc = "VIP 4 can claim",
		desc_th = "VIP 4 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 4,
		desc_en = "VIP 4 can claim",
		needLevel = 4,
		award = slot1[4]
	},
	{
		desc = "VIP 5 can claim",
		desc_th = "VIP 5 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 5,
		desc_en = "VIP 5 can claim",
		needLevel = 5,
		award = slot1[5]
	},
	{
		desc = "VIP 6 can claim",
		desc_th = "VIP 6 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 6,
		desc_en = "VIP 6 can claim",
		needLevel = 6,
		award = slot1[6]
	},
	{
		desc = "VIP 7 can claim",
		desc_th = "VIP 7 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 7,
		desc_en = "VIP 7 can claim",
		needLevel = 7,
		award = slot1[7]
	},
	{
		desc = "VIP 8 can claim",
		desc_th = "VIP 8 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 8,
		desc_en = "VIP 8 can claim",
		needLevel = 8,
		award = slot1[8]
	},
	{
		desc = "VIP 9 can claim",
		desc_th = "VIP 9 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 9,
		desc_en = "VIP 9 can claim",
		needLevel = 9,
		award = slot1[9]
	},
	{
		desc = "VIP 10 can claim",
		desc_th = "VIP 10 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 10,
		desc_en = "VIP 10 can claim",
		needLevel = 10,
		award = slot1[10]
	},
	{
		desc = "VIP 11 can claim",
		desc_th = "VIP 11 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 11,
		desc_en = "VIP 11 can claim",
		needLevel = 11,
		award = slot1[11]
	},
	{
		desc = "VIP 12 can claim",
		desc_th = "VIP 12 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 12,
		desc_en = "VIP 12 can claim",
		needLevel = 12,
		award = slot1[12]
	},
	{
		desc = "VIP 13 can claim",
		desc_th = "VIP 13 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 13,
		desc_en = "VIP 13 can claim",
		needLevel = 13,
		award = slot1[13]
	},
	{
		desc = "VIP 14 can claim",
		desc_th = "VIP 14 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 14,
		desc_en = "VIP 14 can claim",
		needLevel = 14,
		award = slot1[14]
	},
	{
		desc = "VIP 15 can claim",
		desc_th = "VIP 15 รับสิทธิ์ได้",
		huodongID = 8001,
		id = 15,
		desc_en = "VIP 15 can claim",
		needLevel = 15,
		award = slot1[15]
	},
	__size = 15,
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

return csv.yunying.vipaward
