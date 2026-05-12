slot0 = {
	{
		__size = 0
	},
	{
		gold = 10000,
		[121.0] = 1,
		__size = 2
	},
	{
		gold = 20000,
		[121.0] = 1,
		__size = 2
	},
	{
		gold = 30000,
		[121.0] = 2,
		__size = 2
	},
	{
		gold = 50000,
		[121.0] = 3,
		__size = 2
	},
	{
		gold = 100000,
		[121.0] = 5,
		__size = 2
	},
	__size = 6
}
slot1 = {
	slot0[4],
	slot0[4],
	default = slot0[1],
	[3] = slot0[4],
	[5] = slot0[4],
	[4] = slot0[4]
}
slot2 = {
	slot0[3],
	slot0[3],
	default = slot0[1],
	[3] = slot0[3],
	[5] = slot0[3],
	[4] = slot0[3]
}
slot3 = {
	slot0[2],
	slot0[2],
	default = slot0[1],
	[3] = slot0[2],
	[5] = slot0[2],
	[4] = slot0[2]
}
slot4 = {
	slot0[6],
	slot0[6],
	default = slot0[1],
	[3] = slot0[6],
	[5] = slot0[6],
	[4] = slot0[6]
}
slot5 = {
	slot0[5],
	slot0[5],
	default = slot0[1],
	[3] = slot0[5],
	[5] = slot0[5],
	[4] = slot0[5]
}
csv.chip.recast_cost = {
	{
		id = 1,
		costItemMap1 = slot3[1],
		costItemMap2 = slot2[1],
		costItemMap3 = slot1[1],
		costItemMap4 = slot5[1],
		costItemMap5 = slot4[1]
	},
	{
		id = 2,
		costItemMap1 = slot3[2],
		costItemMap2 = slot2[2],
		costItemMap3 = slot1[2],
		costItemMap4 = slot5[2],
		costItemMap5 = slot4[2]
	},
	{
		id = 3,
		costItemMap1 = slot3[3],
		costItemMap2 = slot2[3],
		costItemMap3 = slot1[3],
		costItemMap4 = slot5[3],
		costItemMap5 = slot4[3]
	},
	{
		id = 4,
		costItemMap1 = slot3[4],
		costItemMap2 = slot2[4],
		costItemMap3 = slot1[4],
		costItemMap4 = slot5[4],
		costItemMap5 = slot4[4]
	},
	{
		id = 5,
		costItemMap1 = slot3[5],
		costItemMap2 = slot2[5],
		costItemMap3 = slot1[5],
		costItemMap4 = slot5[5],
		costItemMap5 = slot4[5]
	},
	__size = 5,
	__default = {
		__index = {
			costItemMap1 = slot3.default,
			costItemMap2 = slot2.default,
			costItemMap3 = slot1.default,
			costItemMap4 = slot5.default,
			costItemMap5 = slot4.default
		}
	}
}

return csv.chip.recast_cost
