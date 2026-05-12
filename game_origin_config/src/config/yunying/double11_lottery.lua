slot0 = {
	__size = 4,
	[2] = {
		[503.0] = 6,
		rmb = 288,
		__size = 4,
		[521.0] = 4,
		gold = 1680000
	},
	[3] = {
		[503.0] = 4,
		rmb = 168,
		__size = 4,
		[521.0] = 2,
		gold = 1080000
	},
	[4] = {
		[503.0] = 2,
		rmb = 88,
		__size = 4,
		gold = 680000,
		[502.0] = 3
	},
	[5] = {
		[503.0] = 1,
		rmb = 38,
		__size = 4,
		gold = 280000,
		[502.0] = 1
	}
}
slot1 = {
	slot0[2],
	slot0[3],
	[11] = slot0[2],
	[13] = slot0[4],
	[12] = slot0[3],
	[14] = slot0[5],
	[3] = slot0[4],
	[4] = slot0[5]
}
csv.yunying.double11_lottery = {
	{
		huodongID = 1,
		name_en = "First Prize",
		name_tw = "First Prize",
		name_kr = "First Prize",
		name = "First Prize",
		prize = 1,
		name_vn = "First Prize",
		name_th = "First Prize",
		id = 1,
		weight = 1,
		award = slot1[1]
	},
	{
		huodongID = 1,
		name_en = "Second Prize",
		name_tw = "Second Prize",
		name_kr = "Second Prize",
		name = "Second Prize",
		prize = 2,
		name_vn = "Second Prize",
		name_th = "Second Prize",
		id = 2,
		weight = 4,
		award = slot1[2]
	},
	{
		huodongID = 1,
		name_en = "Third Prize",
		name_tw = "Third Prize",
		name_kr = "Third Prize",
		name = "Third Prize",
		prize = 3,
		name_vn = "Third Prize",
		name_th = "Third Prize",
		id = 3,
		weight = 20,
		award = slot1[3]
	},
	{
		huodongID = 1,
		name_en = "Good Luck Prize",
		name_tw = "Good Luck Prize",
		name_kr = "Good Luck Prize",
		name = "Good Luck Prize",
		prize = 4,
		name_vn = "Good Luck Prize",
		name_th = "Good Luck Prize",
		id = 4,
		weight = 75,
		award = slot1[4]
	},
	__size = 8,
	[11] = {
		huodongID = 2,
		name_en = "First Prize",
		name_tw = "First Prize",
		name_kr = "First Prize",
		name = "First Prize",
		prize = 1,
		name_vn = "First Prize",
		name_th = "First Prize",
		id = 11,
		weight = 1,
		award = slot1[11]
	},
	[12] = {
		huodongID = 2,
		name_en = "Second Prize",
		name_tw = "Second Prize",
		name_kr = "Second Prize",
		name = "Second Prize",
		prize = 2,
		name_vn = "Second Prize",
		name_th = "Second Prize",
		id = 12,
		weight = 4,
		award = slot1[12]
	},
	[13] = {
		huodongID = 2,
		name_en = "Third Prize",
		name_tw = "Third Prize",
		name_kr = "Third Prize",
		name = "Third Prize",
		prize = 3,
		name_vn = "Third Prize",
		name_th = "Third Prize",
		id = 13,
		weight = 20,
		award = slot1[13]
	},
	[14] = {
		huodongID = 2,
		name_en = "Good Luck Prize",
		name_tw = "Good Luck Prize",
		name_kr = "Good Luck Prize",
		name = "Good Luck Prize",
		prize = 4,
		name_vn = "Good Luck Prize",
		name_th = "Good Luck Prize",
		id = 14,
		weight = 75,
		award = slot1[14]
	},
	__default = {
		__index = {
			name = "",
			name_en = "",
			name_tw = "",
			name_kr = "",
			huodongID = 0,
			prize = 0,
			name_vn = "",
			name_th = "",
			weight = 0,
			award = {
				__size = 0
			}
		}
	}
}

return csv.yunying.double11_lottery
