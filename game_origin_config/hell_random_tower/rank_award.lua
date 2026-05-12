slot0 = {
	__size = 12,
	[3] = {
		1,
		2
	},
	[5] = {
		2,
		3
	},
	[7] = {
		3,
		4
	},
	[9] = {
		4,
		7
	},
	[11] = {
		7,
		11
	},
	[13] = {
		11,
		31
	},
	[15] = {
		31,
		61
	},
	[17] = {
		61,
		101
	},
	[19] = {
		101,
		301
	},
	[21] = {
		301,
		601
	},
	[23] = {
		601,
		1001
	},
	[25] = {
		1001,
		100000
	}
}
slot1 = {
	slot0[3],
	slot0[5],
	[111] = slot0[23],
	[110] = slot0[21],
	[112] = slot0[25],
	[3] = slot0[7],
	[5] = slot0[11],
	[4] = slot0[9],
	[7] = slot0[15],
	[6] = slot0[13],
	[9] = slot0[19],
	[8] = slot0[17],
	[108] = slot0[17],
	[109] = slot0[19],
	[102] = slot0[5],
	[103] = slot0[7],
	[101] = slot0[3],
	[106] = slot0[13],
	[107] = slot0[15],
	[104] = slot0[9],
	[105] = slot0[11],
	[11] = slot0[23],
	[10] = slot0[21],
	[12] = slot0[25]
}
csv.hell_random_tower.rank_award = {
	{
		id = 1,
		periodAward = {
			__size = 4,
			rmb = 300,
			[15.0] = 30,
			gold = 2000000,
			[529.0] = 6000
		},
		range = slot1[1]
	},
	{
		id = 2,
		periodAward = {
			__size = 4,
			rmb = 270,
			[15.0] = 27,
			gold = 1800000,
			[529.0] = 5400
		},
		range = slot1[2]
	},
	{
		id = 3,
		periodAward = {
			__size = 4,
			rmb = 240,
			[15.0] = 24,
			gold = 1600000,
			[529.0] = 4800
		},
		range = slot1[3]
	},
	{
		id = 4,
		periodAward = {
			__size = 4,
			rmb = 220,
			[15.0] = 22,
			gold = 1400000,
			[529.0] = 4400
		},
		range = slot1[4]
	},
	{
		id = 5,
		periodAward = {
			__size = 4,
			rmb = 200,
			[15.0] = 20,
			gold = 1200000,
			[529.0] = 4000
		},
		range = slot1[5]
	},
	{
		id = 6,
		periodAward = {
			__size = 4,
			rmb = 180,
			[15.0] = 18,
			gold = 1120000,
			[529.0] = 3600
		},
		range = slot1[6]
	},
	{
		id = 7,
		periodAward = {
			__size = 4,
			rmb = 160,
			[15.0] = 16,
			gold = 1040000,
			[529.0] = 3200
		},
		range = slot1[7]
	},
	{
		id = 8,
		periodAward = {
			__size = 4,
			rmb = 150,
			[15.0] = 14,
			gold = 960000,
			[529.0] = 3000
		},
		range = slot1[8]
	},
	{
		id = 9,
		periodAward = {
			__size = 4,
			rmb = 140,
			[15.0] = 13,
			gold = 880000,
			[529.0] = 2800
		},
		range = slot1[9]
	},
	{
		id = 10,
		periodAward = {
			__size = 4,
			rmb = 130,
			[15.0] = 12,
			gold = 800000,
			[529.0] = 2600
		},
		range = slot1[10]
	},
	{
		id = 11,
		periodAward = {
			__size = 4,
			rmb = 120,
			[15.0] = 11,
			gold = 720000,
			[529.0] = 2400
		},
		range = slot1[11]
	},
	{
		id = 12,
		periodAward = {
			__size = 4,
			rmb = 110,
			[15.0] = 10,
			gold = 640000,
			[529.0] = 2200
		},
		range = slot1[12]
	},
	__size = 24,
	[101] = {
		id = 101,
		periodAward = {
			gold = 1000000,
			rmb = 100,
			__size = 3,
			[930.0] = 60
		},
		range = slot1[101]
	},
	[102] = {
		id = 102,
		periodAward = {
			gold = 900000,
			rmb = 90,
			__size = 3,
			[930.0] = 50
		},
		range = slot1[102]
	},
	[103] = {
		id = 103,
		periodAward = {
			gold = 800000,
			rmb = 80,
			__size = 3,
			[930.0] = 45
		},
		range = slot1[103]
	},
	[104] = {
		id = 104,
		periodAward = {
			gold = 750000,
			rmb = 75,
			__size = 3,
			[930.0] = 40
		},
		range = slot1[104]
	},
	[105] = {
		id = 105,
		periodAward = {
			gold = 700000,
			rmb = 70,
			__size = 3,
			[930.0] = 35
		},
		range = slot1[105]
	},
	[106] = {
		id = 106,
		periodAward = {
			gold = 650000,
			rmb = 65,
			__size = 3,
			[930.0] = 30
		},
		range = slot1[106]
	},
	[107] = {
		id = 107,
		periodAward = {
			gold = 600000,
			rmb = 60,
			__size = 3,
			[930.0] = 25
		},
		range = slot1[107]
	},
	[108] = {
		id = 108,
		periodAward = {
			gold = 550000,
			rmb = 55,
			__size = 3,
			[930.0] = 20
		},
		range = slot1[108]
	},
	[109] = {
		id = 109,
		periodAward = {
			gold = 500000,
			rmb = 50,
			__size = 3,
			[930.0] = 18
		},
		range = slot1[109]
	},
	[110] = {
		id = 110,
		periodAward = {
			gold = 450000,
			rmb = 45,
			__size = 3,
			[930.0] = 16
		},
		range = slot1[110]
	},
	[111] = {
		id = 111,
		periodAward = {
			gold = 400000,
			rmb = 40,
			__size = 3,
			[930.0] = 14
		},
		range = slot1[111]
	},
	[112] = {
		id = 112,
		periodAward = {
			gold = 350000,
			rmb = 35,
			__size = 3,
			[930.0] = 12
		},
		range = slot1[112]
	},
	__default = {
		__index = {
			periodAward = {
				__size = 0
			}
		}
	}
}

return csv.hell_random_tower.rank_award
