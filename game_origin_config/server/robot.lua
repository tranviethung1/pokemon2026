slot0 = {
	__size = 11,
	[4] = {
		41,
		45
	},
	[5] = {
		38,
		41
	},
	[6] = {
		35,
		38
	},
	[7] = {
		31,
		34
	},
	[8] = {
		27,
		30
	},
	[9] = {
		23,
		26
	},
	[10] = {
		19,
		22
	},
	[11] = {
		17,
		18
	},
	[12] = {
		15,
		16
	},
	[18] = {
		3,
		4
	},
	[19] = {
		2,
		3
	}
}
slot1 = {
	slot0[4],
	slot0[5],
	[15] = slot0[18],
	[17] = slot0[19],
	[16] = slot0[18],
	[18] = slot0[19],
	[3] = slot0[6],
	[5] = slot0[8],
	[4] = slot0[7],
	[7] = slot0[10],
	[6] = slot0[9],
	[9] = slot0[12],
	[8] = slot0[11]
}
slot2 = {
	slot0[4],
	slot0[5],
	[11] = slot0[12],
	[10] = slot0[12],
	[13] = slot0[12],
	[12] = slot0[12],
	[15] = slot0[12],
	[14] = slot0[12],
	[17] = slot0[12],
	[16] = slot0[12],
	[18] = slot0[12],
	[3] = slot0[6],
	[5] = slot0[8],
	[4] = slot0[7],
	[7] = slot0[10],
	[6] = slot0[9],
	[9] = slot0[12],
	[8] = slot0[11]
}
csv.server.robot = {
	{
		id = 1,
		rank = 5,
		levelRange = slot1[1],
		level = slot2[1]
	},
	{
		id = 2,
		rank = 10,
		levelRange = slot1[2],
		level = slot2[2]
	},
	{
		id = 3,
		rank = 20,
		levelRange = slot1[3],
		level = slot2[3]
	},
	{
		id = 4,
		rank = 30,
		levelRange = slot1[4],
		level = slot2[4]
	},
	{
		id = 5,
		rank = 40,
		levelRange = slot1[5],
		level = slot2[5]
	},
	{
		id = 6,
		rank = 50,
		levelRange = slot1[6],
		level = slot2[6]
	},
	{
		id = 7,
		rank = 75,
		levelRange = slot1[7],
		level = slot2[7]
	},
	{
		id = 8,
		rank = 100,
		levelRange = slot1[8],
		level = slot2[8]
	},
	{
		id = 9,
		rank = 500,
		levelRange = slot1[9],
		level = slot2[9]
	},
	{
		id = 10,
		rank = 1000,
		levelRange = {
			13,
			14
		},
		level = slot2[10]
	},
	{
		id = 11,
		rank = 2500,
		levelRange = {
			11,
			12
		},
		level = slot2[11]
	},
	{
		id = 12,
		rank = 4000,
		levelRange = {
			9,
			10
		},
		level = slot2[12]
	},
	{
		id = 13,
		rank = 5000,
		levelRange = {
			7,
			8
		},
		level = slot2[13]
	},
	{
		id = 14,
		rank = 6000,
		levelRange = {
			5,
			6
		},
		level = slot2[14]
	},
	{
		id = 15,
		rank = 7000,
		levelRange = slot1[15],
		level = slot2[15]
	},
	{
		id = 16,
		rank = 8000,
		levelRange = slot1[16],
		level = slot2[16]
	},
	{
		id = 17,
		rank = 9000,
		levelRange = slot1[17],
		level = slot2[17]
	},
	{
		id = 18,
		rank = 10000,
		levelRange = slot1[18],
		level = slot2[18]
	},
	__size = 18,
	__default = {
		__index = {
			name = "%s",
			levelRange = {
				1,
				20
			},
			logo = {
				1,
				5
			},
			level = {
				1,
				10
			}
		}
	}
}

return csv.server.robot
