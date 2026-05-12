slot0 = {
	__size = 2,
	[2] = {
		coin10 = 2000,
		rmb = 200,
		coin6 = 2000,
		__size = 5,
		gold = 1000000,
		[502.0] = 4
	},
	[18] = {
		__size = 5,
		rmb = 100,
		coin2 = 2000,
		gold = 500000,
		coin1 = 2000,
		[502.0] = 2
	}
}
slot1 = {
	slot0[2],
	slot0[2],
	[102] = slot0[18],
	[101] = slot0[18]
}
csv.card_star_swap_cost = {
	{
		id = 1,
		rarity = 3,
		reachStar = 4,
		costItem = slot1[1]
	},
	{
		id = 2,
		rarity = 3,
		reachStar = 5,
		costItem = slot1[2]
	},
	{
		id = 3,
		rarity = 3,
		reachStar = 6,
		costItem = {
			coin10 = 4000,
			rmb = 400,
			coin6 = 4000,
			__size = 5,
			gold = 2000000,
			[502.0] = 8
		}
	},
	{
		id = 4,
		rarity = 3,
		reachStar = 7,
		costItem = {
			coin10 = 6000,
			rmb = 600,
			coin6 = 6000,
			__size = 5,
			gold = 3000000,
			[502.0] = 12
		}
	},
	{
		id = 5,
		rarity = 3,
		reachStar = 8,
		costItem = {
			coin10 = 8000,
			rmb = 800,
			coin6 = 8000,
			__size = 5,
			gold = 4000000,
			[502.0] = 16
		}
	},
	{
		id = 6,
		rarity = 3,
		reachStar = 9,
		costItem = {
			coin10 = 12000,
			rmb = 1200,
			coin6 = 12000,
			__size = 5,
			gold = 6000000,
			[502.0] = 24
		}
	},
	{
		id = 7,
		rarity = 3,
		reachStar = 10,
		costItem = {
			coin10 = 16000,
			rmb = 1600,
			coin6 = 16000,
			__size = 5,
			gold = 8000000,
			[502.0] = 32
		}
	},
	{
		id = 8,
		rarity = 3,
		reachStar = 11,
		costItem = {
			coin10 = 24000,
			rmb = 2400,
			coin6 = 24000,
			__size = 5,
			gold = 12000000,
			[502.0] = 48
		}
	},
	{
		id = 9,
		rarity = 3,
		reachStar = 12,
		costItem = {
			coin10 = 32000,
			rmb = 3200,
			coin6 = 32000,
			__size = 5,
			gold = 16000000,
			[502.0] = 64
		}
	},
	__size = 34,
	[11] = {
		id = 11,
		rarity = 4,
		reachStar = 5,
		costItem = {
			coin10 = 6000,
			rmb = 600,
			coin6 = 6000,
			[521.0] = 4,
			gold = 3000000,
			__size = 5
		}
	},
	[12] = {
		id = 12,
		rarity = 4,
		reachStar = 6,
		costItem = {
			coin10 = 12000,
			rmb = 1200,
			coin6 = 12000,
			[521.0] = 8,
			gold = 6000000,
			__size = 5
		}
	},
	[13] = {
		id = 13,
		rarity = 4,
		reachStar = 7,
		costItem = {
			coin10 = 18000,
			rmb = 1800,
			coin6 = 18000,
			[521.0] = 12,
			gold = 9000000,
			__size = 5
		}
	},
	[14] = {
		id = 14,
		rarity = 4,
		reachStar = 8,
		costItem = {
			coin10 = 24000,
			rmb = 2400,
			coin6 = 24000,
			[521.0] = 16,
			gold = 12000000,
			__size = 5
		}
	},
	[15] = {
		id = 15,
		rarity = 4,
		reachStar = 9,
		costItem = {
			coin10 = 36000,
			rmb = 3600,
			coin6 = 36000,
			[521.0] = 24,
			gold = 18000000,
			__size = 5
		}
	},
	[16] = {
		id = 16,
		rarity = 4,
		reachStar = 10,
		costItem = {
			coin10 = 48000,
			rmb = 4800,
			coin6 = 48000,
			[521.0] = 32,
			gold = 24000000,
			__size = 5
		}
	},
	[17] = {
		id = 17,
		rarity = 4,
		reachStar = 11,
		costItem = {
			coin10 = 72000,
			rmb = 7200,
			coin6 = 72000,
			[521.0] = 48,
			gold = 36000000,
			__size = 5
		}
	},
	[18] = {
		id = 18,
		rarity = 4,
		reachStar = 12,
		costItem = {
			coin10 = 96000,
			rmb = 9600,
			coin6 = 96000,
			[521.0] = 64,
			gold = 48000000,
			__size = 5
		}
	},
	[101] = {
		reachStar = 4,
		rarity = 3,
		type = 1,
		id = 101,
		costItem = slot1[101]
	},
	[102] = {
		reachStar = 5,
		rarity = 3,
		type = 1,
		id = 102,
		costItem = slot1[102]
	},
	[103] = {
		reachStar = 6,
		rarity = 3,
		type = 1,
		id = 103,
		costItem = {
			__size = 5,
			rmb = 200,
			coin2 = 4000,
			gold = 1000000,
			coin1 = 4000,
			[502.0] = 4
		}
	},
	[104] = {
		reachStar = 7,
		rarity = 3,
		type = 1,
		id = 104,
		costItem = {
			__size = 5,
			rmb = 300,
			coin2 = 6000,
			gold = 1500000,
			coin1 = 6000,
			[502.0] = 6
		}
	},
	[105] = {
		reachStar = 8,
		rarity = 3,
		type = 1,
		id = 105,
		costItem = {
			__size = 5,
			rmb = 400,
			coin2 = 8000,
			gold = 2000000,
			coin1 = 8000,
			[502.0] = 8
		}
	},
	[106] = {
		reachStar = 9,
		rarity = 3,
		type = 1,
		id = 106,
		costItem = {
			__size = 5,
			rmb = 600,
			coin2 = 12000,
			gold = 3000000,
			coin1 = 12000,
			[502.0] = 12
		}
	},
	[107] = {
		reachStar = 10,
		rarity = 3,
		type = 1,
		id = 107,
		costItem = {
			__size = 5,
			rmb = 800,
			coin2 = 16000,
			gold = 4000000,
			coin1 = 16000,
			[502.0] = 16
		}
	},
	[108] = {
		reachStar = 11,
		rarity = 3,
		type = 1,
		id = 108,
		costItem = {
			__size = 5,
			rmb = 1200,
			coin2 = 24000,
			gold = 6000000,
			coin1 = 24000,
			[502.0] = 24
		}
	},
	[109] = {
		reachStar = 12,
		rarity = 3,
		type = 1,
		id = 109,
		costItem = {
			__size = 5,
			rmb = 1600,
			coin2 = 32000,
			gold = 8000000,
			coin1 = 32000,
			[502.0] = 32
		}
	},
	[111] = {
		reachStar = 5,
		rarity = 4,
		type = 1,
		id = 111,
		costItem = {
			__size = 5,
			rmb = 300,
			coin2 = 6000,
			[521.0] = 2,
			gold = 1500000,
			coin1 = 6000
		}
	},
	[112] = {
		reachStar = 6,
		rarity = 4,
		type = 1,
		id = 112,
		costItem = {
			__size = 5,
			rmb = 600,
			coin2 = 12000,
			[521.0] = 4,
			gold = 3000000,
			coin1 = 12000
		}
	},
	[113] = {
		reachStar = 7,
		rarity = 4,
		type = 1,
		id = 113,
		costItem = {
			__size = 5,
			rmb = 900,
			coin2 = 18000,
			[521.0] = 6,
			gold = 4500000,
			coin1 = 18000
		}
	},
	[114] = {
		reachStar = 8,
		rarity = 4,
		type = 1,
		id = 114,
		costItem = {
			__size = 5,
			rmb = 1200,
			coin2 = 24000,
			[521.0] = 8,
			gold = 6000000,
			coin1 = 24000
		}
	},
	[115] = {
		reachStar = 9,
		rarity = 4,
		type = 1,
		id = 115,
		costItem = {
			__size = 5,
			rmb = 1800,
			coin2 = 36000,
			[521.0] = 12,
			gold = 9000000,
			coin1 = 36000
		}
	},
	[116] = {
		reachStar = 10,
		rarity = 4,
		type = 1,
		id = 116,
		costItem = {
			__size = 5,
			rmb = 2400,
			coin2 = 48000,
			[521.0] = 16,
			gold = 12000000,
			coin1 = 48000
		}
	},
	[117] = {
		reachStar = 11,
		rarity = 4,
		type = 1,
		id = 117,
		costItem = {
			__size = 5,
			rmb = 3600,
			coin2 = 72000,
			[521.0] = 24,
			gold = 18000000,
			coin1 = 72000
		}
	},
	[118] = {
		reachStar = 12,
		rarity = 4,
		type = 1,
		id = 118,
		costItem = {
			__size = 5,
			rmb = 4800,
			coin2 = 96000,
			[521.0] = 32,
			gold = 24000000,
			coin1 = 96000
		}
	},
	__default = {
		__index = {
			reachStar = 0,
			rarity = 0,
			type = 0,
			costItem = {
				__size = 0
			}
		}
	}
}

return csv.card_star_swap_cost
