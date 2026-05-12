slot0 = {
	__size = 19,
	[2] = {
		1,
		2
	},
	[4] = {
		2,
		3
	},
	[6] = {
		3,
		4
	},
	[8] = {
		4,
		5
	},
	[10] = {
		5,
		6
	},
	[12] = {
		6,
		7
	},
	[14] = {
		7,
		8
	},
	[16] = {
		8,
		9
	},
	[18] = {
		9,
		10
	},
	[20] = {
		10,
		11
	},
	[22] = {
		11,
		21
	},
	[24] = {
		21,
		31
	},
	[26] = {
		31,
		41
	},
	[28] = {
		41,
		51
	},
	[30] = {
		51,
		61
	},
	[32] = {
		61,
		81
	},
	[34] = {
		81,
		101
	},
	[36] = {
		101,
		301
	},
	[38] = {
		301,
		9999999
	}
}
slot1 = {
	slot0[2],
	slot0[4],
	[115] = slot0[30],
	[114] = slot0[28],
	[117] = slot0[34],
	[116] = slot0[32],
	[111] = slot0[22],
	[110] = slot0[20],
	[113] = slot0[26],
	[112] = slot0[24],
	[119] = slot0[38],
	[118] = slot0[36],
	[3] = slot0[6],
	[5] = slot0[10],
	[4] = slot0[8],
	[7] = slot0[14],
	[6] = slot0[12],
	[9] = slot0[18],
	[8] = slot0[16],
	[108] = slot0[16],
	[109] = slot0[18],
	[102] = slot0[4],
	[103] = slot0[6],
	[101] = slot0[2],
	[106] = slot0[12],
	[107] = slot0[14],
	[104] = slot0[8],
	[105] = slot0[10],
	[11] = slot0[22],
	[10] = slot0[20],
	[13] = slot0[26],
	[12] = slot0[24],
	[15] = slot0[30],
	[14] = slot0[28],
	[17] = slot0[34],
	[16] = slot0[32],
	[19] = slot0[38],
	[18] = slot0[36]
}
csv.random_tower.rank_award = {
	{
		id = 1,
		range = slot1[1],
		periodAward = {
			gold = 80000,
			[4000.0] = 60,
			coin2 = 600,
			__size = 3
		}
	},
	{
		id = 2,
		range = slot1[2],
		periodAward = {
			gold = 74000,
			[4000.0] = 55,
			coin2 = 540,
			__size = 3
		}
	},
	{
		id = 3,
		range = slot1[3],
		periodAward = {
			gold = 71000,
			[4000.0] = 50,
			coin2 = 520,
			__size = 3
		}
	},
	{
		id = 4,
		range = slot1[4],
		periodAward = {
			gold = 68000,
			[4000.0] = 50,
			coin2 = 500,
			__size = 3
		}
	},
	{
		id = 5,
		range = slot1[5],
		periodAward = {
			gold = 65000,
			[4000.0] = 45,
			coin2 = 480,
			__size = 3
		}
	},
	{
		id = 6,
		range = slot1[6],
		periodAward = {
			gold = 62000,
			[4000.0] = 45,
			coin2 = 460,
			__size = 3
		}
	},
	{
		id = 7,
		range = slot1[7],
		periodAward = {
			gold = 59000,
			[4000.0] = 45,
			coin2 = 440,
			__size = 3
		}
	},
	{
		id = 8,
		range = slot1[8],
		periodAward = {
			gold = 56000,
			[4000.0] = 40,
			coin2 = 420,
			__size = 3
		}
	},
	{
		id = 9,
		range = slot1[9],
		periodAward = {
			gold = 53000,
			[4000.0] = 40,
			coin2 = 400,
			__size = 3
		}
	},
	{
		id = 10,
		range = slot1[10],
		periodAward = {
			gold = 50000,
			[4000.0] = 40,
			coin2 = 380,
			__size = 3
		}
	},
	{
		id = 11,
		range = slot1[11],
		periodAward = {
			gold = 47000,
			[4000.0] = 35,
			coin2 = 360,
			__size = 3
		}
	},
	{
		id = 12,
		range = slot1[12],
		periodAward = {
			gold = 44000,
			[4000.0] = 35,
			coin2 = 350,
			__size = 3
		}
	},
	{
		id = 13,
		range = slot1[13],
		periodAward = {
			gold = 41000,
			[4000.0] = 35,
			coin2 = 340,
			__size = 3
		}
	},
	{
		id = 14,
		range = slot1[14],
		periodAward = {
			gold = 38000,
			[4000.0] = 35,
			coin2 = 330,
			__size = 3
		}
	},
	{
		id = 15,
		range = slot1[15],
		periodAward = {
			gold = 35000,
			[4000.0] = 35,
			coin2 = 320,
			__size = 3
		}
	},
	{
		id = 16,
		range = slot1[16],
		periodAward = {
			gold = 32000,
			[4000.0] = 30,
			coin2 = 310,
			__size = 3
		}
	},
	{
		id = 17,
		range = slot1[17],
		periodAward = {
			gold = 30000,
			[4000.0] = 30,
			coin2 = 300,
			__size = 3
		}
	},
	{
		id = 18,
		range = slot1[18],
		periodAward = {
			gold = 28000,
			[4000.0] = 30,
			coin2 = 290,
			__size = 3
		}
	},
	{
		id = 19,
		range = slot1[19],
		periodAward = {
			gold = 26000,
			[4000.0] = 30,
			coin2 = 280,
			__size = 3
		}
	},
	__size = 38,
	[101] = {
		id = 101,
		version = 101,
		range = slot1[101],
		periodAward = {
			gold = 120000,
			[4000.0] = 70,
			coin2 = 700,
			__size = 3
		}
	},
	[102] = {
		id = 102,
		version = 101,
		range = slot1[102],
		periodAward = {
			gold = 114000,
			[4000.0] = 65,
			coin2 = 640,
			__size = 3
		}
	},
	[103] = {
		id = 103,
		version = 101,
		range = slot1[103],
		periodAward = {
			gold = 111000,
			[4000.0] = 60,
			coin2 = 620,
			__size = 3
		}
	},
	[104] = {
		id = 104,
		version = 101,
		range = slot1[104],
		periodAward = {
			gold = 108000,
			[4000.0] = 60,
			coin2 = 600,
			__size = 3
		}
	},
	[105] = {
		id = 105,
		version = 101,
		range = slot1[105],
		periodAward = {
			gold = 105000,
			[4000.0] = 55,
			coin2 = 580,
			__size = 3
		}
	},
	[106] = {
		id = 106,
		version = 101,
		range = slot1[106],
		periodAward = {
			gold = 102000,
			[4000.0] = 55,
			coin2 = 560,
			__size = 3
		}
	},
	[107] = {
		id = 107,
		version = 101,
		range = slot1[107],
		periodAward = {
			gold = 99000,
			[4000.0] = 55,
			coin2 = 540,
			__size = 3
		}
	},
	[108] = {
		id = 108,
		version = 101,
		range = slot1[108],
		periodAward = {
			gold = 96000,
			[4000.0] = 50,
			coin2 = 520,
			__size = 3
		}
	},
	[109] = {
		id = 109,
		version = 101,
		range = slot1[109],
		periodAward = {
			gold = 93000,
			[4000.0] = 50,
			coin2 = 500,
			__size = 3
		}
	},
	[110] = {
		id = 110,
		version = 101,
		range = slot1[110],
		periodAward = {
			gold = 90000,
			[4000.0] = 50,
			coin2 = 480,
			__size = 3
		}
	},
	[111] = {
		id = 111,
		version = 101,
		range = slot1[111],
		periodAward = {
			gold = 87000,
			[4000.0] = 45,
			coin2 = 460,
			__size = 3
		}
	},
	[112] = {
		id = 112,
		version = 101,
		range = slot1[112],
		periodAward = {
			gold = 84000,
			[4000.0] = 45,
			coin2 = 450,
			__size = 3
		}
	},
	[113] = {
		id = 113,
		version = 101,
		range = slot1[113],
		periodAward = {
			gold = 81000,
			[4000.0] = 45,
			coin2 = 440,
			__size = 3
		}
	},
	[114] = {
		id = 114,
		version = 101,
		range = slot1[114],
		periodAward = {
			gold = 78000,
			[4000.0] = 45,
			coin2 = 430,
			__size = 3
		}
	},
	[115] = {
		id = 115,
		version = 101,
		range = slot1[115],
		periodAward = {
			gold = 75000,
			[4000.0] = 45,
			coin2 = 420,
			__size = 3
		}
	},
	[116] = {
		id = 116,
		version = 101,
		range = slot1[116],
		periodAward = {
			gold = 72000,
			[4000.0] = 40,
			coin2 = 410,
			__size = 3
		}
	},
	[117] = {
		id = 117,
		version = 101,
		range = slot1[117],
		periodAward = {
			gold = 70000,
			[4000.0] = 40,
			coin2 = 400,
			__size = 3
		}
	},
	[118] = {
		id = 118,
		version = 101,
		range = slot1[118],
		periodAward = {
			gold = 68000,
			[4000.0] = 40,
			coin2 = 390,
			__size = 3
		}
	},
	[119] = {
		id = 119,
		version = 101,
		range = slot1[119],
		periodAward = {
			gold = 66000,
			[4000.0] = 40,
			coin2 = 380,
			__size = 3
		}
	},
	__default = {
		__index = {
			version = 0,
			periodAward = {
				__size = 0
			}
		}
	}
}

return csv.random_tower.rank_award
