slot0 = {
	{
		__size = 0
	},
	{
		__size = 1,
		[11.0] = 1
	},
	{
		[12.0] = 1,
		__size = 1
	},
	{
		[13.0] = 1,
		__size = 1
	},
	{
		__size = 1,
		[5.0] = 5
	},
	__size = 5
}
slot1 = {
	slot0[2],
	slot0[3],
	[11] = slot0[2],
	[12] = slot0[3],
	[21] = slot0[3],
	[22] = slot0[4],
	[33] = slot0[5],
	[32] = slot0[5],
	[31] = slot0[5],
	default = slot0[1]
}
slot2 = {
	slot0[2],
	slot0[3],
	[11] = slot0[2],
	[12] = slot0[3],
	[21] = slot0[3],
	[22] = slot0[4],
	[33] = slot0[5],
	[32] = slot0[5],
	[31] = slot0[5],
	default = slot0[1]
}
csv.cross.mine.event_times = {
	{
		weight1 = 90,
		time = 1230,
		weight2 = 90,
		id = 1,
		day = 1,
		randLib1 = slot1[1],
		randLib2 = slot2[1]
	},
	{
		weight1 = 90,
		time = 1830,
		weight2 = 90,
		id = 2,
		day = 1,
		randLib1 = slot1[2],
		randLib2 = slot2[2]
	},
	__size = 9,
	[11] = {
		weight1 = 90,
		time = 1230,
		weight2 = 90,
		id = 11,
		day = 2,
		randLib1 = slot1[11],
		randLib2 = slot2[11]
	},
	[12] = {
		weight1 = 90,
		time = 1830,
		weight2 = 90,
		id = 12,
		day = 2,
		randLib1 = slot1[12],
		randLib2 = slot2[12]
	},
	[21] = {
		weight1 = 90,
		time = 1230,
		weight2 = 90,
		id = 21,
		day = 3,
		randLib1 = slot1[21],
		randLib2 = slot2[21]
	},
	[22] = {
		weight1 = 90,
		time = 1830,
		weight2 = 90,
		id = 22,
		day = 3,
		randLib1 = slot1[22],
		randLib2 = slot2[22]
	},
	[31] = {
		weight1 = 90,
		time = 500,
		weight2 = 90,
		id = 31,
		day = 1,
		randLib1 = slot1[31],
		randLib2 = slot2[31]
	},
	[32] = {
		weight1 = 90,
		time = 500,
		weight2 = 90,
		id = 32,
		day = 2,
		randLib1 = slot1[32],
		randLib2 = slot2[32]
	},
	[33] = {
		weight1 = 90,
		time = 500,
		weight2 = 90,
		id = 33,
		day = 3,
		randLib1 = slot1[33],
		randLib2 = slot2[33]
	},
	__default = {
		__index = {
			weight1 = 0,
			weight2 = 0,
			time = 0,
			day = 0,
			randLib1 = slot1.default,
			randLib2 = slot2.default
		}
	}
}

return csv.cross.mine.event_times
