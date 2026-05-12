slot0 = {
	__size = 8,
	[4] = {
		100,
		100,
		100,
		40,
		20,
		__size = 5
	},
	[7] = {
		100,
		115,
		110,
		48,
		24,
		__size = 5
	},
	[10] = {
		100,
		130,
		120,
		56,
		28,
		__size = 5
	},
	[13] = {
		100,
		145,
		130,
		64,
		32,
		__size = 5
	},
	[16] = {
		100,
		160,
		140,
		72,
		36,
		__size = 5
	},
	[19] = {
		100,
		175,
		150,
		80,
		40,
		__size = 5
	},
	[22] = {
		100,
		190,
		160,
		88,
		44,
		__size = 5
	},
	[25] = {
		100,
		205,
		170,
		96,
		48,
		__size = 5
	}
}
slot1 = {
	slot0[4],
	slot0[4],
	[11] = slot0[19],
	[10] = slot0[16],
	[13] = slot0[22],
	[12] = slot0[19],
	[15] = slot0[25],
	[14] = slot0[22],
	[17] = slot0[25],
	[16] = slot0[25],
	[18] = slot0[25],
	[3] = slot0[7],
	[5] = slot0[10],
	[4] = slot0[7],
	[7] = slot0[13],
	[6] = slot0[10],
	[9] = slot0[16],
	[8] = slot0[13]
}
csv.dispatch_task.rankdom = {
	{
		id = 1,
		levelRange = {
			1,
			29
		},
		weights = slot1[1]
	},
	{
		id = 2,
		levelRange = {
			30,
			35
		},
		weights = slot1[2]
	},
	{
		id = 3,
		levelRange = {
			36,
			41
		},
		weights = slot1[3]
	},
	{
		id = 4,
		levelRange = {
			42,
			47
		},
		weights = slot1[4]
	},
	{
		id = 5,
		levelRange = {
			48,
			53
		},
		weights = slot1[5]
	},
	{
		id = 6,
		levelRange = {
			54,
			59
		},
		weights = slot1[6]
	},
	{
		id = 7,
		levelRange = {
			60,
			65
		},
		weights = slot1[7]
	},
	{
		id = 8,
		levelRange = {
			66,
			71
		},
		weights = slot1[8]
	},
	{
		id = 9,
		levelRange = {
			72,
			77
		},
		weights = slot1[9]
	},
	{
		id = 10,
		levelRange = {
			78,
			83
		},
		weights = slot1[10]
	},
	{
		id = 11,
		levelRange = {
			84,
			89
		},
		weights = slot1[11]
	},
	{
		id = 12,
		levelRange = {
			90,
			95
		},
		weights = slot1[12]
	},
	{
		id = 13,
		levelRange = {
			96,
			101
		},
		weights = slot1[13]
	},
	{
		id = 14,
		levelRange = {
			102,
			107
		},
		weights = slot1[14]
	},
	{
		id = 15,
		levelRange = {
			108,
			113
		},
		weights = slot1[15]
	},
	{
		id = 16,
		levelRange = {
			114,
			119
		},
		weights = slot1[16]
	},
	{
		id = 17,
		levelRange = {
			120,
			125
		},
		weights = slot1[17]
	},
	{
		id = 18,
		levelRange = {
			126,
			999
		},
		weights = slot1[18]
	},
	__size = 18,
	__default = {
		__index = {
			levelRange = {
				1,
				100
			},
			weights = {
				__size = 0
			}
		}
	}
}

return csv.dispatch_task.rankdom
