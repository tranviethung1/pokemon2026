slot0 = {
	__size = 1,
	[2] = {
		gold = 100000,
		rmb = 100,
		__size = 2
	}
}
slot1 = {
	slot0[2],
	slot0[2],
	[3] = slot0[2],
	[4] = slot0[2]
}
csv.yunying.gateaward = {
	{
		gateID = 10009,
		desc_th = "เคลียร์ระดับยอด บทที่ 1",
		huodongID = 9001,
		id = 1,
		desc_en = "Clear Elite level Chapter 1",
		desc = "Clear Elite level Chapter 1",
		award = slot1[1]
	},
	{
		gateID = 10212,
		desc_th = "เคลียร์ระดับยอด บทที่ 3",
		huodongID = 9001,
		id = 2,
		desc_en = "Clear Elite level Chapter 3",
		desc = "Clear Elite level Chapter 3",
		award = slot1[2]
	},
	{
		gateID = 10412,
		desc_th = "เคลียร์ระดับยอด บทที่ 5",
		huodongID = 9001,
		id = 3,
		desc_en = "Clear Elite level Chapter 5",
		desc = "Clear Elite level Chapter 5",
		award = slot1[3]
	},
	{
		gateID = 10612,
		desc_th = "เคลียร์บทที่ 7 ของ Elite Level",
		huodongID = 9001,
		id = 4,
		desc_en = "Clear Chapter 7 of Elite Level",
		desc = "Clear Chapter 7 of Elite Level",
		award = slot1[4]
	},
	__size = 4,
	__default = {
		__index = {
			gateID = 1,
			desc_th = "",
			huodongID = 0,
			desc_en = "",
			desc = "",
			award = {
				__size = 0
			}
		}
	}
}

return csv.yunying.gateaward
