slot0 = {
	__size = 5,
	[5] = {
		__size = 4,
		[4101.0] = 4,
		gold = 100000,
		[4001.0] = 4,
		[54.0] = 2
	},
	[10] = {
		__size = 5,
		[54.0] = 1,
		[4101.0] = 3,
		gold = 80000,
		[4001.0] = 3,
		[53.0] = 3
	},
	[16] = {
		__size = 5,
		[54.0] = 1,
		[4101.0] = 2,
		gold = 70000,
		[4001.0] = 2,
		[53.0] = 2
	},
	[19] = {
		__size = 4,
		[4101.0] = 2,
		gold = 60000,
		[4001.0] = 2,
		[54.0] = 1
	},
	[26] = {
		__size = 4,
		[4103.0] = 1,
		gold = 30000,
		[4002.0] = 1,
		[53.0] = 2
	}
}
slot1 = {
	[11] = slot0[16],
	[10] = slot0[10],
	[13] = slot0[19],
	[12] = slot0[16],
	[20] = slot0[26],
	[14] = slot0[19],
	[17] = slot0[26],
	[19] = slot0[26],
	[18] = slot0[26],
	[3] = slot0[5],
	[2] = slot0[5],
	[5] = slot0[5],
	[4] = slot0[5],
	[7] = slot0[10],
	[6] = slot0[10],
	[9] = slot0[10],
	[8] = slot0[10]
}
csv.bossaward = {
	{
		id = 1,
		range = {
			1,
			2
		},
		award = {
			__size = 4,
			[4101.0] = 5,
			gold = 200000,
			[4001.0] = 5,
			[54.0] = 3
		}
	},
	{
		id = 2,
		range = {
			2,
			3
		},
		award = slot1[2]
	},
	{
		id = 3,
		range = {
			3,
			4
		},
		award = slot1[3]
	},
	{
		id = 4,
		range = {
			4,
			5
		},
		award = slot1[4]
	},
	{
		id = 5,
		range = {
			5,
			6
		},
		award = slot1[5]
	},
	{
		id = 6,
		range = {
			6,
			7
		},
		award = slot1[6]
	},
	{
		id = 7,
		range = {
			7,
			8
		},
		award = slot1[7]
	},
	{
		id = 8,
		range = {
			8,
			9
		},
		award = slot1[8]
	},
	{
		id = 9,
		range = {
			9,
			10
		},
		award = slot1[9]
	},
	{
		id = 10,
		range = {
			10,
			11
		},
		award = slot1[10]
	},
	{
		id = 11,
		range = {
			11,
			21
		},
		award = slot1[11]
	},
	{
		id = 12,
		range = {
			21,
			51
		},
		award = slot1[12]
	},
	{
		id = 13,
		range = {
			51,
			101
		},
		award = slot1[13]
	},
	{
		id = 14,
		range = {
			101,
			201
		},
		award = slot1[14]
	},
	{
		id = 15,
		range = {
			201,
			501
		},
		award = {
			__size = 4,
			[4103.0] = 3,
			gold = 50000,
			[4002.0] = 3,
			[53.0] = 4
		}
	},
	{
		id = 16,
		range = {
			501,
			1001
		},
		award = {
			__size = 4,
			[4103.0] = 2,
			gold = 40000,
			[4002.0] = 2,
			[53.0] = 3
		}
	},
	{
		id = 17,
		range = {
			1001,
			2001
		},
		award = slot1[17]
	},
	{
		id = 18,
		range = {
			2001,
			5001
		},
		award = slot1[18]
	},
	{
		id = 19,
		range = {
			5001,
			10001
		},
		award = slot1[19]
	},
	{
		id = 20,
		range = {
			10001,
			9999999
		},
		award = slot1[20]
	},
	__size = 20,
	__default = {
		__index = {
			award = {
				__size = 0
			}
		}
	}
}

return csv.bossaward
