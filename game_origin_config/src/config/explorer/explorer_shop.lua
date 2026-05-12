slot0 = {
	__size = 11,
	[4] = {
		__size = 1,
		[4000.0] = 10
	},
	[6] = {
		1,
		150
	},
	[10] = {
		coin4 = 50,
		__size = 1
	},
	[13] = {
		__size = 6,
		[4013.0] = 5,
		[4023.0] = 5,
		[4022.0] = 5,
		[4021.0] = 5,
		[4011.0] = 5,
		[4012.0] = 5
	},
	[14] = {
		coin4 = 5,
		__size = 1
	},
	[15] = {
		__size = 9,
		[4041.0] = 5,
		[4033.0] = 5,
		[4042.0] = 5,
		[4052.0] = 5,
		[4053.0] = 5,
		[4051.0] = 5,
		[4032.0] = 5,
		[4043.0] = 5,
		[4031.0] = 5
	},
	[16] = {
		coin4 = 30,
		__size = 1
	},
	[17] = {
		__size = 8,
		[4073.0] = 5,
		[4071.0] = 5,
		[4061.0] = 5,
		[4062.0] = 5,
		[4064.0] = 5,
		[4072.0] = 5,
		[4074.0] = 5,
		[4063.0] = 5
	},
	[18] = {
		coin4 = 200,
		__size = 1
	},
	[19] = {
		__size = 10,
		[4093.0] = 5,
		[4096.0] = 5,
		[4085.0] = 6,
		[4092.0] = 5,
		[4084.0] = 5,
		[4082.0] = 5,
		[4083.0] = 5,
		[4094.0] = 5,
		[4081.0] = 5,
		[4095.0] = 8
	},
	[20] = {
		coin4 = 500,
		__size = 1
	}
}
slot1 = {
	slot0[4],
	slot0[4],
	[201] = slot0[15],
	[200] = slot0[13],
	[900] = slot0[19],
	[600] = slot0[19],
	[300] = slot0[15],
	[700] = slot0[19],
	[3] = slot0[4],
	[401] = slot0[17],
	[400] = slot0[15],
	[100] = slot0[13],
	[800] = slot0[19],
	[500] = slot0[17]
}
slot2 = {
	slot0[6],
	slot0[6],
	[201] = slot0[6],
	[200] = slot0[6],
	[900] = slot0[6],
	[600] = slot0[6],
	[300] = slot0[6],
	[700] = slot0[6],
	[51] = slot0[6],
	[50] = slot0[6],
	[52] = slot0[6],
	[3] = slot0[6],
	[401] = slot0[6],
	[400] = slot0[6],
	[100] = slot0[6],
	[800] = slot0[6],
	[500] = slot0[6],
	[2001] = slot0[6]
}
slot3 = {
	[201] = slot0[16],
	[200] = slot0[14],
	[900] = slot0[20],
	[600] = slot0[20],
	[300] = slot0[16],
	[700] = slot0[20],
	[51] = slot0[10],
	[50] = slot0[10],
	[52] = slot0[10],
	[2001] = slot0[20],
	[401] = slot0[18],
	[400] = slot0[16],
	[100] = slot0[14],
	[800] = slot0[20],
	[500] = slot0[18]
}
csv.explorer.explorer_shop = {
	{
		vipWeight = 100,
		itemCount = 50,
		id = 1,
		itemWeightMap = slot1[1],
		costMap = {
			coin4 = 20,
			__size = 1
		},
		levelRange = slot2[1]
	},
	{
		vipWeight = 80,
		itemCount = 100,
		id = 2,
		itemWeightMap = slot1[2],
		costMap = {
			coin4 = 40,
			__size = 1
		},
		levelRange = slot2[2]
	},
	{
		vipWeight = 50,
		itemCount = 150,
		id = 3,
		itemWeightMap = slot1[3],
		costMap = {
			coin4 = 60,
			__size = 1
		},
		levelRange = slot2[3]
	},
	__size = 18,
	[50] = {
		vipWeight = 0,
		itemCount = 3,
		id = 50,
		position = 1,
		itemWeightMap = {
			[19.0] = 10,
			__size = 1
		},
		costMap = slot3[50],
		levelRange = slot2[50]
	},
	[51] = {
		vipWeight = 0,
		itemCount = 10,
		id = 51,
		position = 1,
		itemWeightMap = {
			__size = 1,
			[14.0] = 10
		},
		costMap = slot3[51],
		levelRange = slot2[51]
	},
	[52] = {
		vipWeight = 0,
		itemCount = 3,
		id = 52,
		position = 1,
		itemWeightMap = {
			__size = 1,
			[100.0] = 10
		},
		costMap = slot3[52],
		levelRange = slot2[52]
	},
	[100] = {
		vipWeight = 100,
		itemCount = 1,
		id = 100,
		position = 1,
		itemWeightMap = slot1[100],
		costMap = slot3[100],
		levelRange = slot2[100]
	},
	[200] = {
		vipWeight = 100,
		itemCount = 1,
		id = 200,
		position = 2,
		itemWeightMap = slot1[200],
		costMap = slot3[200],
		levelRange = slot2[200]
	},
	[201] = {
		vipWeight = 100,
		itemCount = 1,
		id = 201,
		position = 2,
		itemWeightMap = slot1[201],
		costMap = slot3[201],
		levelRange = slot2[201]
	},
	[300] = {
		vipWeight = 100,
		itemCount = 1,
		id = 300,
		position = 3,
		itemWeightMap = slot1[300],
		costMap = slot3[300],
		levelRange = slot2[300]
	},
	[400] = {
		vipWeight = 100,
		itemCount = 1,
		id = 400,
		position = 4,
		itemWeightMap = slot1[400],
		costMap = slot3[400],
		levelRange = slot2[400]
	},
	[401] = {
		vipWeight = 100,
		itemCount = 1,
		id = 401,
		position = 4,
		itemWeightMap = slot1[401],
		costMap = slot3[401],
		levelRange = slot2[401]
	},
	[500] = {
		vipWeight = 100,
		itemCount = 1,
		id = 500,
		position = 5,
		itemWeightMap = slot1[500],
		costMap = slot3[500],
		levelRange = slot2[500]
	},
	[600] = {
		vipWeight = 100,
		itemCount = 1,
		id = 600,
		position = 6,
		itemWeightMap = slot1[600],
		costMap = slot3[600],
		levelRange = slot2[600]
	},
	[700] = {
		vipWeight = 100,
		itemCount = 1,
		id = 700,
		position = 7,
		itemWeightMap = slot1[700],
		costMap = slot3[700],
		levelRange = slot2[700]
	},
	[800] = {
		vipWeight = 0,
		itemCount = 1,
		id = 800,
		position = 6,
		itemWeightMap = slot1[800],
		costMap = slot3[800],
		levelRange = slot2[800]
	},
	[900] = {
		vipWeight = 0,
		itemCount = 1,
		id = 900,
		position = 7,
		itemWeightMap = slot1[900],
		costMap = slot3[900],
		levelRange = slot2[900]
	},
	[2001] = {
		itemCount = 1,
		limitType = 3,
		vipWeight = 100,
		limitTimes = 2,
		id = 2001,
		position = 8,
		itemWeightMap = {
			[967.0] = 10,
			__size = 1
		},
		costMap = slot3[2001],
		levelRange = slot2[2001]
	},
	__default = {
		__index = {
			vipStart = 0,
			itemCount = 0,
			beginDate = 0,
			showUnable = false,
			limitTimes = 0,
			endDate = 20990101,
			limitType = 0,
			vipWeight = 1,
			position = 0,
			itemWeightMap = {
				__size = 0
			},
			costMap = {
				coin4 = 0,
				__size = 1
			},
			levelRange = {
				1,
				100
			}
		}
	}
}

return csv.explorer.explorer_shop
