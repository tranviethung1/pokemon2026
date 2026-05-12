slot0 = {
	__size = 7,
	[2] = {},
	[4] = {
		{
			__size = 1,
			[602.0] = 10
		},
		{
			[925.0] = 1,
			__size = 1
		},
		{
			__size = 1,
			rmb = 30
		},
		{
			__size = 1,
			card = {
				id = 11,
				__size = 1
			}
		}
	},
	[6] = {
		__size = 1,
		rmb = 300
	},
	[7] = {
		{
			[20001.0] = 5,
			__size = 1
		},
		{
			[925.0] = 1,
			__size = 1
		},
		{
			__size = 1,
			rmb = 30
		},
		{
			__size = 1,
			card = {
				id = 11,
				__size = 1
			}
		}
	},
	[10] = {
		__size = 1,
		rmb = 600
	},
	[12] = {
		{
			__size = 1,
			card = {
				id = 1221,
				__size = 1
			}
		},
		{
			__size = 1,
			card = {
				id = 1231,
				__size = 1
			}
		},
		{
			__size = 1,
			card = {
				id = 1241,
				__size = 1
			}
		}
	},
	[26] = {
		__size = 1,
		rmb = 6480
	}
}
slot1 = {
	[13] = slot0[26],
	[4] = slot0[6],
	[7] = slot0[10],
	[102] = slot0[6],
	[103] = slot0[10],
	[107] = slot0[26]
}
slot2 = {
	default = slot0[2],
	[3] = slot0[4],
	[2] = slot0[4],
	[5] = slot0[7],
	[4] = slot0[7],
	[9] = slot0[12],
	[8] = slot0[12]
}
csv.yunying.customize_gift = {
	{
		buyTimes = 1,
		name = "1 RMB customized gift bag",
		huodongID = 1001,
		id = 1,
		rechargeID = 101,
		optionalAwards1 = {
			{
				[53.0] = 20,
				__size = 1
			},
			{
				[111.0] = 10,
				__size = 1
			},
			{
				__size = 1,
				rmb = 30
			},
			{
				__size = 1,
				card = {
					id = 11,
					__size = 1
				}
			}
		}
	},
	{
		buyTimes = 2,
		name = "6 RMB customized gift bag",
		huodongID = 1001,
		id = 2,
		rechargeID = 102,
		optionalAwards1 = slot2[2]
	},
	{
		name = "12 RMB customized gift bag",
		huodongID = 1001,
		buyTimes = 1,
		id = 3,
		rechargeID = 103,
		awards = {
			__size = 1,
			rmb = 200
		},
		optionalAwards1 = slot2[3]
	},
	{
		name = "18 RMB customized gift bag",
		huodongID = 1001,
		buyTimes = 2,
		id = 4,
		rechargeID = 104,
		awards = slot1[4],
		optionalAwards1 = slot2[4]
	},
	{
		buyTimes = 1,
		name = "25 RMB customized gift bag",
		huodongID = 1001,
		id = 5,
		rechargeID = 105,
		optionalAwards1 = slot2[5]
	},
	{
		buyTimes = 2,
		name = "30 RMB customized gift bag",
		huodongID = 1001,
		id = 6,
		rechargeID = 106,
		optionalAwards1 = {
			{
				[20641.0] = 10,
				__size = 1
			},
			{
				__size = 1,
				[20721.0] = 10
			},
			{
				__size = 1,
				[20731.0] = 10
			},
			{
				[20741.0] = 10,
				__size = 1
			}
		},
		optionalAwards2 = {
			{
				coin7 = 300,
				__size = 1
			},
			{
				coin8 = 300,
				__size = 1
			},
			{
				__size = 1,
				coin14 = 300
			},
			{
				__size = 1,
				coin1 = 300
			}
		}
	},
	{
		name = "60 RMB customized gift bag",
		huodongID = 1001,
		buyTimes = 1,
		id = 7,
		rechargeID = 107,
		awards = slot1[7],
		optionalAwards1 = {
			{
				__size = 1,
				card = {
					id = 1031,
					__size = 1
				}
			},
			{
				__size = 1,
				card = {
					id = 1081,
					__size = 1
				}
			},
			{
				__size = 1,
				card = {
					id = 1171,
					__size = 1
				}
			},
			{
				__size = 1,
				card = {
					id = 1291,
					__size = 1
				}
			}
		}
	},
	{
		name = "98 RMB customized gift bag",
		huodongID = 1001,
		id = 8,
		buyTimes = 2,
		rechargeID = 108,
		optionalAwards1 = slot2[8],
		optionalAwards2 = {
			{
				coin7 = 1000,
				__size = 1
			},
			{
				coin8 = 1000,
				__size = 1
			},
			{
				__size = 1,
				coin14 = 1000
			},
			{
				__size = 1,
				coin1 = 1000
			}
		},
		optionalAwards3 = {
			{
				[53.0] = 90,
				__size = 1
			},
			{
				__size = 1,
				[11.0] = 90
			},
			{
				__size = 1,
				[100.0] = 60
			},
			{
				[523.0] = 40,
				__size = 1
			}
		}
	},
	{
		name = "128 RMB customized gift bag",
		huodongID = 1001,
		buyTimes = 1,
		id = 9,
		rechargeID = 109,
		awards = {
			__size = 1,
			rmb = 1280
		},
		optionalAwards1 = slot2[9]
	},
	{
		name = "168 RMB customized gift bag",
		huodongID = 1001,
		buyTimes = 2,
		id = 10,
		rechargeID = 110,
		awards = {
			__size = 1,
			rmb = 1680
		},
		optionalAwards1 = {
			{
				__size = 1,
				[502.0] = 50
			},
			{
				__size = 1,
				[521.0] = 20
			}
		},
		optionalAwards2 = {
			{
				gold = 1000000,
				__size = 1
			},
			{
				coin6 = 1000,
				__size = 1
			},
			{
				coin10 = 1000,
				__size = 1
			},
			{
				coin11 = 1000,
				__size = 1
			}
		}
	},
	{
		name = "198 RMB customized gift bag",
		huodongID = 1001,
		buyTimes = 1,
		id = 11,
		rechargeID = 111,
		awards = {
			[967.0] = 20,
			__size = 1
		},
		optionalAwards1 = {
			{
				__size = 1,
				[602.0] = 100
			},
			{
				__size = 1,
				[603.0] = 60
			}
		},
		optionalAwards2 = {
			{
				[6231.0] = 2,
				__size = 1
			},
			{
				[6232.0] = 2,
				__size = 1
			},
			{
				[6233.0] = 2,
				__size = 1
			},
			{
				[6234.0] = 2,
				__size = 1
			}
		}
	},
	{
		name = "328 RMB customized gift bag",
		buyTimes = 2,
		rechargeID = 112,
		huodongID = 1001,
		id = 12,
		optionalAwards1 = {
			{
				__size = 1,
				[502.0] = 100
			},
			{
				__size = 1,
				[521.0] = 50
			}
		},
		optionalAwards2 = {
			{
				coin7 = 5000,
				__size = 1
			},
			{
				coin8 = 5000,
				__size = 1
			},
			{
				__size = 1,
				coin14 = 5000
			},
			{
				__size = 1,
				coin1 = 5000
			}
		},
		optionalAwards3 = {
			{
				[53.0] = 300,
				__size = 1
			},
			{
				__size = 1,
				[11.0] = 300
			},
			{
				__size = 1,
				[100.0] = 100
			},
			{
				[523.0] = 100,
				__size = 1
			}
		},
		optionalAwards4 = {
			{
				[20641.0] = 50,
				__size = 1
			},
			{
				__size = 1,
				[20721.0] = 50
			},
			{
				__size = 1,
				[20731.0] = 50
			},
			{
				[20741.0] = 50,
				__size = 1
			}
		}
	},
	{
		name = "648 RMB customized gift bag",
		huodongID = 1001,
		buyTimes = 1,
		id = 13,
		rechargeID = 113,
		awards = slot1[13],
		optionalAwards1 = {
			{
				__size = 1,
				card = {
					id = 1971,
					__size = 1
				}
			},
			{
				__size = 1,
				card = {
					id = 1961,
					__size = 1
				}
			},
			{
				__size = 1,
				card = {
					id = 1981,
					__size = 1
				}
			}
		},
		optionalAwards2 = {
			{
				coin7 = 10000,
				__size = 1
			},
			{
				coin8 = 10000,
				__size = 1
			},
			{
				__size = 1,
				coin14 = 10000
			},
			{
				__size = 1,
				coin1 = 10000
			}
		}
	},
	__size = 24,
	[101] = {
		name = "1$ Customized Gift",
		buyTimes = 2,
		rechargeID = 102,
		huodongID = 1002,
		id = 101,
		awards = {
			__size = 1,
			rmb = 120
		},
		optionalAwards1 = {
			{
				gold = 50000,
				__size = 1
			}
		},
		optionalAwards2 = {
			{
				[503.0] = 1,
				__size = 1
			},
			{
				[519.0] = 1,
				__size = 1
			},
			{
				__size = 1,
				[520.0] = 1
			}
		},
		optionalAwards3 = {
			{
				__size = 1,
				[502.0] = 2
			},
			{
				[19.0] = 3,
				__size = 1
			},
			{
				[531.0] = 1,
				__size = 1
			},
			{
				__size = 1,
				[537.0] = 1
			}
		}
	},
	[102] = {
		name = "4.99$ Customized Gift",
		buyTimes = 2,
		rechargeID = 106,
		huodongID = 1002,
		id = 102,
		awards = slot1[102],
		optionalAwards1 = {
			{
				gold = 500000,
				__size = 1
			}
		},
		optionalAwards2 = {
			{
				[452.0] = 75,
				__size = 1
			},
			{
				[503.0] = 4,
				__size = 1
			},
			{
				[604.0] = 10,
				__size = 1
			},
			{
				__size = 1,
				[851.0] = 150
			},
			{
				[152.0] = 30,
				__size = 1
			},
			{
				__size = 1,
				[112.0] = 30
			},
			{
				[531.0] = 4,
				__size = 1
			},
			{
				__size = 1,
				[537.0] = 4
			},
			{
				__size = 1,
				[520.0] = 4
			}
		},
		optionalAwards3 = {
			{
				__size = 1,
				[451.0] = 150
			},
			{
				__size = 1,
				[2103.0] = 30
			},
			{
				__size = 1,
				[902.0] = 30
			},
			{
				__size = 1,
				[850.0] = 300
			},
			{
				[151.0] = 300,
				__size = 1
			},
			{
				[111.0] = 150,
				__size = 1
			},
			{
				__size = 1,
				[529.0] = 750
			},
			{
				__size = 1,
				[124.0] = 10
			},
			{
				__size = 1,
				[4000.0] = 100
			}
		}
	},
	[103] = {
		name = "8.99$ Customized Gift",
		buyTimes = 2,
		rechargeID = 107,
		huodongID = 1002,
		id = 103,
		awards = slot1[103],
		optionalAwards1 = {
			{
				__size = 1,
				[502.0] = 5
			},
			{
				[501.0] = 1,
				__size = 1
			},
			{
				gold = 500000,
				__size = 1
			},
			{
				[519.0] = 3,
				__size = 1
			},
			{
				[527.0] = 3,
				__size = 1
			}
		},
		optionalAwards2 = {
			{
				[452.0] = 150,
				__size = 1
			},
			{
				[503.0] = 8,
				__size = 1
			},
			{
				[604.0] = 20,
				__size = 1
			},
			{
				__size = 1,
				[851.0] = 300
			},
			{
				[152.0] = 60,
				__size = 1
			},
			{
				__size = 1,
				[112.0] = 60
			},
			{
				[531.0] = 8,
				__size = 1
			},
			{
				__size = 1,
				[537.0] = 8
			},
			{
				__size = 1,
				[520.0] = 8
			}
		},
		optionalAwards3 = {
			{
				__size = 1,
				[451.0] = 300
			},
			{
				__size = 1,
				[2103.0] = 60
			},
			{
				__size = 1,
				[902.0] = 60
			},
			{
				__size = 1,
				[850.0] = 600
			},
			{
				[151.0] = 600,
				__size = 1
			},
			{
				[111.0] = 300,
				__size = 1
			},
			{
				__size = 1,
				[529.0] = 1500
			},
			{
				__size = 1,
				[124.0] = 20
			},
			{
				__size = 1,
				[4000.0] = 200
			}
		}
	},
	[104] = {
		name = "14.99$ Customized Gift",
		buyTimes = 2,
		rechargeID = 108,
		huodongID = 1002,
		id = 104,
		awards = {
			__size = 1,
			rmb = 980
		},
		optionalAwards1 = {
			{
				__size = 1,
				[502.0] = 8
			},
			{
				[501.0] = 2,
				__size = 1
			},
			{
				gold = 800000,
				__size = 1
			},
			{
				[519.0] = 5,
				__size = 1
			},
			{
				[527.0] = 5,
				__size = 1
			}
		},
		optionalAwards2 = {
			{
				[452.0] = 200,
				__size = 1
			},
			{
				[503.0] = 10,
				__size = 1
			},
			{
				[604.0] = 30,
				__size = 1
			},
			{
				__size = 1,
				[851.0] = 400
			},
			{
				[152.0] = 80,
				__size = 1
			},
			{
				__size = 1,
				[112.0] = 80
			},
			{
				[531.0] = 10,
				__size = 1
			},
			{
				__size = 1,
				[537.0] = 10
			},
			{
				__size = 1,
				[520.0] = 10
			}
		},
		optionalAwards3 = {
			{
				__size = 1,
				[451.0] = 400
			},
			{
				__size = 1,
				[2103.0] = 80
			},
			{
				__size = 1,
				[902.0] = 80
			},
			{
				__size = 1,
				[850.0] = 800
			},
			{
				[151.0] = 800,
				__size = 1
			},
			{
				[111.0] = 400,
				__size = 1
			},
			{
				__size = 1,
				[529.0] = 2000
			},
			{
				__size = 1,
				[124.0] = 30
			},
			{
				__size = 1,
				[4000.0] = 300
			}
		}
	},
	[105] = {
		name = "29.99$ Customized Gift",
		buyTimes = 2,
		rechargeID = 111,
		huodongID = 1002,
		id = 105,
		awards = {
			__size = 1,
			rmb = 1980
		},
		optionalAwards1 = {
			{
				__size = 1,
				[502.0] = 15
			},
			{
				[501.0] = 4,
				__size = 1
			},
			{
				gold = 150000,
				__size = 1
			},
			{
				[519.0] = 10,
				__size = 1
			},
			{
				[527.0] = 10,
				__size = 1
			}
		},
		optionalAwards2 = {
			{
				[452.0] = 400,
				__size = 1
			},
			{
				[503.0] = 20,
				__size = 1
			},
			{
				[604.0] = 60,
				__size = 1
			},
			{
				__size = 1,
				[851.0] = 800
			},
			{
				[152.0] = 160,
				__size = 1
			},
			{
				__size = 1,
				[112.0] = 160
			},
			{
				[531.0] = 20,
				__size = 1
			},
			{
				__size = 1,
				[537.0] = 20
			},
			{
				__size = 1,
				[520.0] = 20
			}
		},
		optionalAwards3 = {
			{
				__size = 1,
				[451.0] = 800
			},
			{
				__size = 1,
				[2103.0] = 160
			},
			{
				__size = 1,
				[902.0] = 160
			},
			{
				__size = 1,
				[850.0] = 1600
			},
			{
				[151.0] = 1600,
				__size = 1
			},
			{
				[111.0] = 800,
				__size = 1
			},
			{
				__size = 1,
				[529.0] = 4000
			},
			{
				__size = 1,
				[124.0] = 60
			},
			{
				__size = 1,
				[4000.0] = 600
			}
		}
	},
	[106] = {
		name = "49.99$ Customized Gift",
		buyTimes = 2,
		rechargeID = 112,
		huodongID = 1002,
		id = 106,
		awards = {
			__size = 1,
			rmb = 3280
		},
		optionalAwards1 = {
			{
				[2152.0] = 1,
				__size = 1
			},
			{
				__size = 1,
				[942.0] = 1
			},
			{
				[962.0] = 1,
				__size = 1
			},
			{
				__size = 1,
				[993.0] = 1
			},
			{
				__size = 1,
				[7324.0] = 1
			}
		},
		optionalAwards2 = {
			{
				[452.0] = 600,
				__size = 1
			},
			{
				[503.0] = 30,
				__size = 1
			},
			{
				[604.0] = 90,
				__size = 1
			},
			{
				__size = 1,
				[851.0] = 1200
			},
			{
				[152.0] = 240,
				__size = 1
			},
			{
				__size = 1,
				[112.0] = 240
			},
			{
				[531.0] = 30,
				__size = 1
			},
			{
				__size = 1,
				[537.0] = 30
			},
			{
				__size = 1,
				[520.0] = 30
			}
		},
		optionalAwards3 = {
			{
				__size = 1,
				[451.0] = 1200
			},
			{
				__size = 1,
				[2103.0] = 240
			},
			{
				__size = 1,
				[902.0] = 240
			},
			{
				__size = 1,
				[850.0] = 2400
			},
			{
				[151.0] = 2400,
				__size = 1
			},
			{
				[111.0] = 1200,
				__size = 1
			},
			{
				__size = 1,
				[529.0] = 6000
			},
			{
				__size = 1,
				[124.0] = 90
			},
			{
				__size = 1,
				[4000.0] = 900
			}
		}
	},
	[107] = {
		name = "99.99$ Customized Gift",
		buyTimes = 2,
		rechargeID = 113,
		huodongID = 1002,
		id = 107,
		awards = slot1[107],
		optionalAwards1 = {
			{
				[2152.0] = 2,
				__size = 1
			},
			{
				__size = 1,
				[942.0] = 2
			},
			{
				[963.0] = 1,
				__size = 1
			},
			{
				[994.0] = 1,
				__size = 1
			},
			{
				__size = 1,
				[7325.0] = 1
			},
			{
				__size = 1,
				[521.0] = 10
			}
		},
		optionalAwards2 = {
			{
				[452.0] = 1200,
				__size = 1
			},
			{
				[503.0] = 60,
				__size = 1
			},
			{
				[604.0] = 180,
				__size = 1
			},
			{
				__size = 1,
				[851.0] = 2400
			},
			{
				[152.0] = 480,
				__size = 1
			},
			{
				__size = 1,
				[112.0] = 480
			},
			{
				[531.0] = 60,
				__size = 1
			},
			{
				__size = 1,
				[537.0] = 60
			},
			{
				__size = 1,
				[520.0] = 60
			}
		},
		optionalAwards3 = {
			{
				__size = 1,
				[451.0] = 2400
			},
			{
				__size = 1,
				[2103.0] = 480
			},
			{
				__size = 1,
				[902.0] = 480
			},
			{
				__size = 1,
				[850.0] = 4800
			},
			{
				[151.0] = 4800,
				__size = 1
			},
			{
				[111.0] = 2400,
				__size = 1
			},
			{
				__size = 1,
				[529.0] = 12000
			},
			{
				__size = 1,
				[124.0] = 180
			},
			{
				__size = 1,
				[4000.0] = 1800
			}
		}
	},
	[10011] = {
		name = "Beginners' Special Pack",
		originalCost = 25,
		huodongID = 3002,
		id = 10011,
		buyTimes = 1,
		rechargeID = 106,
		awards = {
			__size = 4,
			rmb = 18888,
			gold = 999999,
			stamina = 200,
			card = {
				id = 9003,
				__size = 1
			}
		}
	},
	[10012] = {
		name = "Beginners' Special Pack",
		originalCost = 125,
		huodongID = 3002,
		id = 10012,
		buyTimes = 1,
		rechargeID = 108,
		awards = {
			__size = 4,
			[6283.0] = 5,
			stamina = 400,
			rmb = 28888,
			card = {
				id = 9003,
				__size = 1
			}
		}
	},
	[10013] = {
		name = "Beginners' Special Pack",
		originalCost = 180,
		huodongID = 3002,
		id = 10013,
		buyTimes = 1,
		rechargeID = 111,
		awards = {
			__size = 4,
			rmb = 38888,
			stamina = 500,
			[6876.0] = 5,
			card = {
				id = 9003,
				__size = 1
			}
		}
	},
	[10014] = {
		name = "Beginners' Special Pack",
		originalCost = 325,
		huodongID = 3002,
		id = 10014,
		buyTimes = 1,
		rechargeID = 111,
		awards = {
			__size = 4,
			[6900.0] = 5,
			stamina = 500,
			rmb = 38888,
			card = {
				id = 9003,
				__size = 1
			}
		}
	},
	__default = {
		__index = {
			name = "",
			buyTimes = 0,
			rechargeID = 0,
			originalCost = 0,
			icon = "",
			awards = {
				__size = 0
			},
			optionalAwards1 = slot2.default,
			optionalAwards2 = ({
				default = slot0[2]
			}).default,
			optionalAwards3 = ({
				default = slot0[2]
			}).default,
			optionalAwards4 = ({
				default = slot0[2]
			}).default
		}
	}
}

return csv.yunying.customize_gift
