slot0 = {
	{
		__size = 0
	},
	{
		gold = 5000,
		__size = 2,
		libs = {
			504,
			504
		}
	},
	{
		gold = 20000,
		__size = 2,
		libs = {
			505,
			8016
		}
	},
	{
		gold = 20000,
		__size = 2,
		libs = {
			505,
			505
		}
	},
	{
		gold = 20000,
		__size = 2,
		libs = {
			505,
			8013
		}
	},
	__size = 5
}
slot2 = {
	slot0[2],
	slot0[2],
	[11] = slot0[3],
	[13] = slot0[5],
	[12] = slot0[4],
	[15] = slot0[4],
	[14] = slot0[3],
	[17] = slot0[3],
	[10] = slot0[2],
	[19] = slot0[3],
	[18] = slot0[4],
	[16] = slot0[5],
	[20] = slot0[4],
	default = slot0[1],
	[3] = slot0[2],
	[5] = slot0[2],
	[4] = slot0[2],
	[7] = slot0[2],
	[6] = slot0[2],
	[9] = slot0[2],
	[8] = slot0[2]
}
csv.hell_random_tower.box = {
	{
		id = 1,
		version = 1,
		award = slot2[1]
	},
	{
		id = 2,
		version = 1,
		index = 2,
		award = slot2[2]
	},
	{
		id = 3,
		version = 1,
		index = 3,
		award = slot2[3]
	},
	{
		id = 4,
		version = 1,
		index = 4,
		award = slot2[4]
	},
	{
		id = 5,
		version = 1,
		index = 5,
		award = slot2[5]
	},
	{
		id = 6,
		version = 1,
		index = 6,
		award = slot2[6]
	},
	{
		id = 7,
		version = 1,
		index = 7,
		award = slot2[7]
	},
	{
		id = 8,
		version = 1,
		index = 8,
		award = slot2[8]
	},
	{
		id = 9,
		version = 1,
		index = 9,
		award = slot2[9]
	},
	{
		id = 10,
		version = 1,
		index = 10,
		award = slot2[10]
	},
	{
		id = 11,
		boxType = 2,
		index = 11,
		version = 1,
		award = slot2[11]
	},
	{
		id = 12,
		boxType = 2,
		index = 12,
		version = 1,
		award = slot2[12]
	},
	{
		id = 13,
		boxType = 2,
		index = 13,
		version = 1,
		award = slot2[13]
	},
	{
		id = 14,
		boxType = 2,
		index = 14,
		version = 1,
		award = slot2[14]
	},
	{
		id = 15,
		boxType = 2,
		index = 15,
		version = 1,
		award = slot2[15]
	},
	{
		id = 16,
		boxType = 2,
		index = 16,
		version = 1,
		award = slot2[16]
	},
	{
		id = 17,
		boxType = 2,
		index = 17,
		version = 1,
		award = slot2[17]
	},
	{
		id = 18,
		boxType = 2,
		index = 18,
		version = 1,
		award = slot2[18]
	},
	{
		id = 19,
		boxType = 2,
		index = 19,
		version = 1,
		award = slot2[19]
	},
	{
		id = 20,
		boxType = 2,
		index = 20,
		version = 1,
		award = slot2[20]
	},
	__size = 21,
	[101] = {
		id = 101,
		boxType = 2,
		index = 101,
		version = 1,
		award = {
			gold = 200000,
			__size = 2,
			libs = {
				505,
				505,
				8013,
				8017
			}
		}
	},
	__default = {
		__index = {
			boxType = 1,
			index = 1,
			version = 0,
			award = slot2.default,
			award2 = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.hell_random_tower.box
