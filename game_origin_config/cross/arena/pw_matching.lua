slot0 = {
	__size = 19,
	[7] = {
		"50%",
		"91%"
	},
	[8] = {
		"130%",
		"191%"
	},
	[9] = {
		"200%",
		"501%"
	},
	[30] = {
		"10%",
		"51%"
	},
	[31] = {
		"50%",
		"81%"
	},
	[46] = {
		"30%",
		"71%"
	},
	[47] = {
		"70%",
		"101%"
	},
	[80] = {
		"80%",
		"100%"
	},
	[87] = {
		"65%",
		"75%"
	},
	[88] = {
		"75%",
		"85%"
	},
	[89] = {
		"85%",
		"100%"
	},
	[90] = {
		"100%",
		"120%"
	},
	[93] = {
		"82%",
		"88%"
	},
	[94] = {
		"88%",
		"95%"
	},
	[95] = {
		"95%",
		"100%"
	},
	[96] = {
		"100%",
		"110%"
	},
	[100] = {
		"80%",
		"85%"
	},
	[101] = {
		"85%",
		"90%"
	},
	[102] = {
		"90%",
		"95%"
	}
}
slot1 = {
	[24] = slot0[89],
	[25] = slot0[95],
	[26] = slot0[95],
	[27] = slot0[95],
	[21] = slot0[80],
	[22] = slot0[80],
	[23] = slot0[89],
	[28] = slot0[102],
	[29] = slot0[102],
	[3] = slot0[9],
	[2] = slot0[9]
}
slot2 = {
	[24] = slot0[88],
	[25] = slot0[94],
	[26] = slot0[94],
	[27] = slot0[94],
	[20] = slot0[47],
	[23] = slot0[88],
	[28] = slot0[101],
	[29] = slot0[101],
	[3] = slot0[8],
	[2] = slot0[8],
	[7] = slot0[31],
	[9] = slot0[31],
	[11] = slot0[47],
	[10] = slot0[7],
	[13] = slot0[47],
	[12] = slot0[47],
	[15] = slot0[47],
	[14] = slot0[47],
	[17] = slot0[47],
	[16] = slot0[47],
	[19] = slot0[47],
	[18] = slot0[47]
}
slot3 = {
	[11] = slot0[46],
	[10] = slot0[30],
	[13] = slot0[46],
	[12] = slot0[46],
	[15] = slot0[46],
	[14] = slot0[46],
	[17] = slot0[46],
	[16] = slot0[46],
	[19] = slot0[46],
	[18] = slot0[46],
	[23] = slot0[87],
	[28] = slot0[100],
	[26] = slot0[93],
	[29] = slot0[100],
	[27] = slot0[93],
	[2] = slot0[7],
	[25] = slot0[93],
	[7] = slot0[30],
	[24] = slot0[87],
	[9] = slot0[30],
	[20] = slot0[46]
}
slot4 = {
	[24] = slot0[90],
	[25] = slot0[96],
	[26] = slot0[96],
	[27] = slot0[96],
	[23] = slot0[90],
	[28] = slot0[95],
	[29] = slot0[95]
}
csv.cross.arena.pw_matching = {
	{
		id = 1,
		range = {
			1,
			2
		},
		enemyRange1 = {
			"100%",
			"201%"
		},
		enemyRange2 = {
			"200%",
			"301%"
		},
		enemyRange3 = {
			"300%",
			"751%"
		},
		enemyRange4 = {
			"750%",
			"1201%"
		}
	},
	{
		id = 2,
		range = {
			2,
			3
		},
		enemyRange1 = slot3[2],
		enemyRange2 = slot2[2],
		enemyRange3 = slot1[2],
		enemyRange4 = {
			"500%",
			"801%"
		}
	},
	{
		id = 3,
		range = {
			3,
			4
		},
		enemyRange1 = {
			"30%",
			"91%"
		},
		enemyRange2 = slot2[3],
		enemyRange3 = slot1[3],
		enemyRange4 = {
			"500%",
			"761%"
		}
	},
	{
		id = 4,
		range = {
			4,
			5
		},
		enemyRange1 = {
			"25%",
			"131%"
		},
		enemyRange2 = {
			"130%",
			"201%"
		},
		enemyRange3 = {
			"200%",
			"331%"
		},
		enemyRange4 = {
			"330%",
			"611%"
		}
	},
	{
		id = 5,
		range = {
			5,
			6
		},
		enemyRange1 = {
			"20%",
			"61%"
		},
		enemyRange2 = {
			"60%",
			"101%"
		},
		enemyRange3 = {
			"120%",
			"301%"
		},
		enemyRange4 = {
			"300%",
			"511%"
		}
	},
	{
		id = 6,
		range = {
			6,
			7
		},
		enemyRange1 = {
			"1%",
			"41%"
		},
		enemyRange2 = {
			"40%",
			"81%"
		},
		enemyRange3 = {
			"80%",
			"251%"
		},
		enemyRange4 = {
			"250%",
			"431%"
		}
	},
	{
		id = 7,
		range = {
			7,
			8
		},
		enemyRange1 = slot3[7],
		enemyRange2 = slot2[7],
		enemyRange3 = {
			"80%",
			"215%"
		},
		enemyRange4 = {
			"215%",
			"383%"
		}
	},
	{
		id = 8,
		range = {
			8,
			9
		},
		enemyRange1 = {
			"10%",
			"61%"
		},
		enemyRange2 = {
			"60%",
			"81%"
		},
		enemyRange3 = {
			"80%",
			"188%"
		},
		enemyRange4 = {
			"188%",
			"341%"
		}
	},
	{
		id = 9,
		range = {
			9,
			10
		},
		enemyRange1 = slot3[9],
		enemyRange2 = slot2[9],
		enemyRange3 = {
			"80%",
			"167%"
		},
		enemyRange4 = {
			"167%",
			"311%"
		}
	},
	{
		id = 10,
		range = {
			10,
			11
		},
		enemyRange1 = slot3[10],
		enemyRange2 = slot2[10],
		enemyRange3 = {
			"90%",
			"151%"
		},
		enemyRange4 = {
			"150%",
			"281%"
		}
	},
	{
		id = 11,
		range = {
			11,
			12
		},
		enemyRange1 = slot3[11],
		enemyRange2 = slot2[11],
		enemyRange3 = {
			"100%",
			"155%"
		},
		enemyRange4 = {
			"155%",
			"331%"
		}
	},
	{
		id = 12,
		range = {
			12,
			13
		},
		enemyRange1 = slot3[12],
		enemyRange2 = slot2[12],
		enemyRange3 = {
			"100%",
			"125%"
		},
		enemyRange4 = {
			"125%",
			"351%"
		}
	},
	{
		id = 13,
		range = {
			13,
			14
		},
		enemyRange1 = slot3[13],
		enemyRange2 = slot2[13],
		enemyRange3 = {
			"95%",
			"116%"
		},
		enemyRange4 = {
			"116%",
			"371%"
		}
	},
	{
		id = 14,
		range = {
			14,
			15
		},
		enemyRange1 = slot3[14],
		enemyRange2 = slot2[14],
		enemyRange3 = {
			"157%",
			"186%"
		},
		enemyRange4 = {
			"186%",
			"391%"
		}
	},
	{
		id = 15,
		range = {
			15,
			16
		},
		enemyRange1 = slot3[15],
		enemyRange2 = slot2[15],
		enemyRange3 = {
			"147%",
			"173%"
		},
		enemyRange4 = {
			"173%",
			"411%"
		}
	},
	{
		id = 16,
		range = {
			16,
			17
		},
		enemyRange1 = slot3[16],
		enemyRange2 = slot2[16],
		enemyRange3 = {
			"138%",
			"163%"
		},
		enemyRange4 = {
			"163%",
			"411%"
		}
	},
	{
		id = 17,
		range = {
			17,
			18
		},
		enemyRange1 = slot3[17],
		enemyRange2 = slot2[17],
		enemyRange3 = {
			"129%",
			"153%"
		},
		enemyRange4 = {
			"153%",
			"411%"
		}
	},
	{
		id = 18,
		range = {
			18,
			19
		},
		enemyRange1 = slot3[18],
		enemyRange2 = slot2[18],
		enemyRange3 = {
			"122%",
			"144%"
		},
		enemyRange4 = {
			"144%",
			"411%"
		}
	},
	{
		id = 19,
		range = {
			19,
			20
		},
		enemyRange1 = slot3[19],
		enemyRange2 = slot2[19],
		enemyRange3 = {
			"126%",
			"147%"
		},
		enemyRange4 = {
			"147%",
			"411%"
		}
	},
	{
		id = 20,
		range = {
			20,
			21
		},
		enemyRange1 = slot3[20],
		enemyRange2 = slot2[20],
		enemyRange3 = {
			"115%",
			"135%"
		},
		enemyRange4 = {
			"135%",
			"411%"
		}
	},
	{
		id = 21,
		range = {
			21,
			51
		},
		enemyRange1 = {
			"40%",
			"55%"
		},
		enemyRange2 = {
			"55%",
			"80%"
		},
		enemyRange3 = slot1[21],
		enemyRange4 = {
			"100%",
			"160%"
		}
	},
	{
		id = 22,
		range = {
			51,
			101
		},
		enemyRange1 = {
			"40%",
			"60%"
		},
		enemyRange2 = {
			"60%",
			"80%"
		},
		enemyRange3 = slot1[22],
		enemyRange4 = {
			"100%",
			"140%"
		}
	},
	{
		id = 23,
		range = {
			101,
			201
		},
		enemyRange1 = slot3[23],
		enemyRange2 = slot2[23],
		enemyRange3 = slot1[23],
		enemyRange4 = slot4[23]
	},
	{
		id = 24,
		range = {
			201,
			501
		},
		enemyRange1 = slot3[24],
		enemyRange2 = slot2[24],
		enemyRange3 = slot1[24],
		enemyRange4 = slot4[24]
	},
	{
		id = 25,
		range = {
			501,
			1001
		},
		enemyRange1 = slot3[25],
		enemyRange2 = slot2[25],
		enemyRange3 = slot1[25],
		enemyRange4 = slot4[25]
	},
	{
		id = 26,
		range = {
			1001,
			2001
		},
		enemyRange1 = slot3[26],
		enemyRange2 = slot2[26],
		enemyRange3 = slot1[26],
		enemyRange4 = slot4[26]
	},
	{
		id = 27,
		range = {
			2001,
			5001
		},
		enemyRange1 = slot3[27],
		enemyRange2 = slot2[27],
		enemyRange3 = slot1[27],
		enemyRange4 = slot4[27]
	},
	{
		id = 28,
		range = {
			5001,
			10001
		},
		enemyRange1 = slot3[28],
		enemyRange2 = slot2[28],
		enemyRange3 = slot1[28],
		enemyRange4 = slot4[28]
	},
	{
		id = 29,
		range = {
			10001,
			999999
		},
		enemyRange1 = slot3[29],
		enemyRange2 = slot2[29],
		enemyRange3 = slot1[29],
		enemyRange4 = slot4[29]
	},
	__size = 29,
	__default = {
		__index = {}
	}
}

return csv.cross.arena.pw_matching
