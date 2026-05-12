slot0 = {
	__size = 6,
	[4] = {
		200,
		200
	},
	[6] = {
		35,
		95
	},
	[11] = {
		730,
		1760
	},
	[13] = {
		1080,
		2120
	},
	[20] = {
		160,
		190
	},
	[22] = {
		70,
		130
	}
}
slot1 = {
	[13] = slot0[11],
	[5] = slot0[13],
	[4] = slot0[11],
	[14] = slot0[13]
}
slot2 = {
	slot0[6],
	[17] = slot0[20],
	[19] = slot0[6],
	[18] = slot0[22],
	[9] = slot0[22],
	[8] = slot0[20]
}
slot3 = {
	slot0[4],
	slot0[4],
	[24] = slot0[4],
	[25] = slot0[4],
	[26] = slot0[4],
	[27] = slot0[4],
	[20] = slot0[4],
	[21] = slot0[4],
	[22] = slot0[4],
	[23] = slot0[4],
	[28] = slot0[4],
	[29] = slot0[4],
	[3] = slot0[4],
	[5] = slot0[4],
	[4] = slot0[4],
	[7] = slot0[4],
	[6] = slot0[4],
	[9] = slot0[4],
	[8] = slot0[4],
	[11] = slot0[4],
	[10] = slot0[4],
	[13] = slot0[4],
	[12] = slot0[4],
	[15] = slot0[4],
	[14] = slot0[4],
	[17] = slot0[4],
	[16] = slot0[4],
	[19] = slot0[4],
	[18] = slot0[4],
	[31] = slot0[4],
	[30] = slot0[4],
	[33] = slot0[4],
	[32] = slot0[4]
}
csv.cross.mine.npc = {
	{
		res = "qbanrole/q_bailu.skel",
		id = 1,
		duration = 1440,
		moveSpeed = slot3[1],
		moveIntervalX = {
			1600,
			2450
		},
		moveIntervalY = slot2[1]
	},
	{
		res = "qbanrole/q_buermeili.skel",
		id = 2,
		duration = 1440,
		moveSpeed = slot3[2],
		moveIntervalX = {
			620,
			1460
		},
		moveIntervalY = {
			110,
			180
		}
	},
	{
		res = "qbanrole/q_douzi.skel",
		id = 3,
		duration = 1440,
		moveSpeed = slot3[3],
		moveIntervalX = {
			2160,
			3090
		},
		moveIntervalY = {
			155,
			200
		}
	},
	{
		res = "qbanrole/q_dujuan.skel",
		id = 4,
		duration = 1440,
		moveSpeed = slot3[4],
		moveIntervalX = slot1[4],
		moveIntervalY = {
			40,
			90
		}
	},
	{
		res = "qbanrole/q_huomijia.skel",
		id = 5,
		duration = 1440,
		moveSpeed = slot3[5],
		moveIntervalX = slot1[5],
		moveIntervalY = {
			140,
			180
		}
	},
	{
		res = "qbanrole/q_lapu.skel",
		id = 6,
		duration = 1440,
		moveSpeed = slot3[6],
		moveIntervalX = {
			480,
			1350
		},
		moveIntervalY = {
			60,
			100
		}
	},
	{
		res = "qbanrole/q_sansejin.skel",
		id = 7,
		duration = 1440,
		moveSpeed = slot3[7],
		moveIntervalX = {
			2340,
			3040
		},
		moveIntervalY = {
			120,
			200
		}
	},
	{
		res = "qbanrole/q_xiaoxia.skel",
		id = 8,
		duration = 1440,
		moveSpeed = slot3[8],
		moveIntervalX = {
			1980,
			2970
		},
		moveIntervalY = slot2[8]
	},
	{
		res = "qbanrole/q_xiu.skel",
		id = 9,
		duration = 1440,
		moveSpeed = slot3[9],
		moveIntervalX = {
			1350,
			2600
		},
		moveIntervalY = slot2[9]
	},
	{
		res = "qbanrole/lmd.skel",
		id = 10,
		duration = 1440,
		moveSpeed = slot3[10],
		moveIntervalX = {
			1620,
			2430
		},
		moveIntervalY = {
			50,
			100
		}
	},
	{
		res = "qbanrole/q_meiyali.skel",
		id = 11,
		duration = 1440,
		moveSpeed = slot3[11],
		moveIntervalX = {
			640,
			1450
		},
		moveIntervalY = {
			100,
			160
		}
	},
	{
		res = "qbanrole/ziluolan.skel",
		id = 12,
		duration = 1440,
		moveSpeed = slot3[12],
		moveIntervalX = {
			2180,
			3090
		},
		moveIntervalY = {
			135,
			180
		}
	},
	{
		res = "qbanrole/qbxzy.skel",
		id = 13,
		duration = 1440,
		moveSpeed = slot3[13],
		moveIntervalX = slot1[13],
		moveIntervalY = {
			50,
			90
		}
	},
	{
		res = "qbanrole/aklm.skel",
		id = 14,
		duration = 1440,
		moveSpeed = slot3[14],
		moveIntervalX = slot1[14],
		moveIntervalY = {
			135,
			175
		}
	},
	{
		res = "qbanrole/yasha.skel",
		id = 15,
		duration = 1440,
		moveSpeed = slot3[15],
		moveIntervalX = {
			420,
			1300
		},
		moveIntervalY = {
			70,
			120
		}
	},
	{
		res = "qbanrole/q_keerni.skel",
		id = 16,
		duration = 1440,
		moveSpeed = slot3[16],
		moveIntervalX = {
			2310,
			3010
		},
		moveIntervalY = {
			110,
			190
		}
	},
	{
		res = "qbanrole/qblcn.skel",
		id = 17,
		duration = 1440,
		moveSpeed = slot3[17],
		moveIntervalX = {
			1960,
			2940
		},
		moveIntervalY = slot2[17]
	},
	{
		res = "qbanrole/luxihua.skel",
		id = 18,
		duration = 1440,
		moveSpeed = slot3[18],
		moveIntervalX = {
			1330,
			2570
		},
		moveIntervalY = slot2[18]
	},
	{
		res = "qbanrole/q_lanniuye.skel",
		id = 19,
		duration = 1440,
		moveSpeed = slot3[19],
		moveIntervalX = {
			1670,
			2490
		},
		moveIntervalY = slot2[19]
	},
	{
		res = "qbanrole/luhui.skel",
		id = 20,
		duration = 1440,
		moveSpeed = slot3[20],
		moveIntervalX = {
			600,
			1400
		},
		moveIntervalY = {
			115,
			170
		}
	},
	{
		res = "qbanrole/yy.skel",
		id = 21,
		duration = 1440,
		moveSpeed = slot3[21],
		moveIntervalX = {
			2130,
			3040
		},
		moveIntervalY = {
			145,
			190
		}
	},
	{
		res = "qbanrole/nls.skel",
		id = 22,
		duration = 1440,
		moveSpeed = slot3[22],
		moveIntervalX = {
			690,
			1680
		},
		moveIntervalY = {
			30,
			100
		}
	},
	{
		res = "qbanrole/q_furong.skel",
		id = 23,
		duration = 1440,
		moveSpeed = slot3[23],
		moveIntervalX = {
			1040,
			2100
		},
		moveIntervalY = {
			110,
			170
		}
	},
	{
		res = "qbanrole/qbsl.skel",
		id = 24,
		duration = 1440,
		moveSpeed = slot3[24],
		moveIntervalX = {
			400,
			1290
		},
		moveIntervalY = {
			90,
			170
		}
	},
	{
		res = "qbanrole/qbxl.skel",
		id = 25,
		duration = 1440,
		moveSpeed = slot3[25],
		moveIntervalX = {
			2350,
			3020
		},
		moveIntervalY = {
			140,
			200
		}
	},
	{
		res = "qbanrole/qbxg.skel",
		id = 26,
		duration = 1440,
		moveSpeed = slot3[26],
		moveIntervalX = {
			1920,
			2950
		},
		moveIntervalY = {
			140,
			190
		}
	},
	{
		res = "qbanrole/q_bike.skel",
		id = 27,
		duration = 1440,
		moveSpeed = slot3[27],
		moveIntervalX = {
			1330,
			2610
		},
		moveIntervalY = {
			50,
			110
		}
	},
	{
		res = "qbanrole/dp.skel",
		id = 28,
		duration = 1440,
		moveSpeed = slot3[28],
		moveIntervalX = {
			1590,
			2430
		},
		moveIntervalY = {
			45,
			105
		}
	},
	{
		res = "qbanrole/kky.skel",
		id = 29,
		duration = 1440,
		moveSpeed = slot3[29],
		moveIntervalX = {
			610,
			1410
		},
		moveIntervalY = {
			105,
			170
		}
	},
	{
		res = "qbanrole/qbaf.skel",
		id = 30,
		duration = 1440,
		moveSpeed = slot3[30],
		moveIntervalX = {
			2170,
			3030
		},
		moveIntervalY = {
			145,
			195
		}
	},
	{
		res = "qbanrole/qbdmbs.skel",
		id = 31,
		duration = 1440,
		moveSpeed = slot3[31],
		moveIntervalX = {
			770,
			1760
		},
		moveIntervalY = {
			35,
			85
		}
	},
	{
		res = "qbanrole/qblq.skel",
		id = 32,
		duration = 1440,
		moveSpeed = slot3[32],
		moveIntervalX = {
			1030,
			2090
		},
		moveIntervalY = {
			130,
			180
		}
	},
	{
		res = "qbanrole/meiyue.skel",
		id = 33,
		duration = 1440,
		moveSpeed = slot3[33],
		moveIntervalX = {
			440,
			1310
		},
		moveIntervalY = {
			55,
			100
		}
	},
	__size = 33,
	__default = {
		__index = {
			res = "",
			duration = 0,
			dialogLib = 0,
			moveSpeed = {
				200,
				200
			},
			moveIntervalX = {
				900,
				1200
			},
			moveIntervalY = {
				40,
				200
			}
		}
	}
}

return csv.cross.mine.npc
