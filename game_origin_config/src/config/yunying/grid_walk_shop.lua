slot0 = {
	{
		__size = 0
	},
	__size = 4,
	[13] = {
		__size = 1,
		rmb = 30
	},
	[22] = {
		__size = 1,
		rmb = 100
	},
	[33] = {
		__size = 1,
		rmb = 38
	}
}
slot2 = {
	[11] = slot0[13],
	[13] = slot0[13],
	[12] = slot0[13],
	[14] = slot0[22],
	[54] = slot0[22],
	[56] = slot0[33],
	default = slot0[1],
	[7] = slot0[13],
	[9] = slot0[13],
	[8] = slot0[13],
	[58] = slot0[33]
}
csv.yunying.grid_walk_shop = {
	{
		id = 1,
		items = {
			[8116.0] = 1,
			__size = 1
		},
		prices = {
			__size = 1,
			[8102.0] = 9
		}
	},
	{
		id = 2,
		weight = 150,
		items = {
			[8114.0] = 1,
			__size = 1
		},
		prices = {
			__size = 1,
			[8102.0] = 5
		}
	},
	{
		id = 3,
		weight = 150,
		items = {
			[8113.0] = 1,
			__size = 1
		},
		prices = {
			__size = 1,
			[8102.0] = 4
		}
	},
	{
		id = 4,
		weight = 150,
		items = {
			[8117.0] = 1,
			__size = 1
		},
		prices = {
			__size = 1,
			[8102.0] = 3
		}
	},
	{
		id = 5,
		weight = 150,
		items = {
			[8115.0] = 1,
			__size = 1
		},
		prices = {
			__size = 1,
			[8102.0] = 2
		}
	},
	__size = 22,
	[7] = {
		id = 7,
		type = 2,
		items = {
			__size = 1,
			[930.0] = 10
		},
		prices = slot2[7]
	},
	[8] = {
		id = 8,
		type = 2,
		items = {
			[5000.0] = 10,
			__size = 1
		},
		prices = slot2[8]
	},
	[9] = {
		id = 9,
		type = 2,
		items = {
			__size = 1,
			[902.0] = 5
		},
		prices = slot2[9]
	},
	[10] = {
		id = 10,
		type = 2,
		items = {
			__size = 1,
			[2103.0] = 3
		},
		prices = {
			__size = 1,
			rmb = 50
		}
	},
	[11] = {
		id = 11,
		type = 2,
		items = {
			__size = 1,
			[4000.0] = 50
		},
		prices = slot2[11]
	},
	[12] = {
		id = 12,
		type = 2,
		items = {
			__size = 1,
			[100.0] = 3
		},
		prices = slot2[12]
	},
	[13] = {
		id = 13,
		type = 2,
		items = {
			__size = 1,
			[851.0] = 50
		},
		prices = slot2[13]
	},
	[14] = {
		id = 14,
		type = 2,
		items = {
			__size = 1,
			[529.0] = 500
		},
		prices = slot2[14]
	},
	[51] = {
		weight = 10,
		type = 2,
		id = 51,
		items = {
			__size = 1,
			[502.0] = 1
		},
		prices = {
			__size = 1,
			rmb = 28
		}
	},
	[52] = {
		weight = 10,
		type = 2,
		id = 52,
		items = {
			__size = 1,
			[521.0] = 1
		},
		prices = {
			__size = 1,
			rmb = 88
		}
	},
	[53] = {
		weight = 10,
		type = 2,
		id = 53,
		items = {
			[515.0] = 1,
			__size = 1
		},
		prices = {
			__size = 1,
			rmb = 20
		}
	},
	[54] = {
		weight = 10,
		type = 2,
		id = 54,
		items = {
			[519.0] = 1,
			__size = 1
		},
		prices = slot2[54]
	},
	[55] = {
		weight = 10,
		type = 2,
		id = 55,
		items = {
			[527.0] = 1,
			__size = 1
		},
		prices = {
			__size = 1,
			rmb = 108
		}
	},
	[56] = {
		weight = 10,
		type = 2,
		id = 56,
		items = {
			[503.0] = 1,
			__size = 1
		},
		prices = slot2[56]
	},
	[57] = {
		weight = 10,
		type = 2,
		id = 57,
		items = {
			__size = 1,
			[520.0] = 1
		},
		prices = {
			__size = 1,
			rmb = 58
		}
	},
	[58] = {
		weight = 10,
		type = 2,
		id = 58,
		items = {
			[531.0] = 1,
			__size = 1
		},
		prices = slot2[58]
	},
	[59] = {
		weight = 10,
		type = 2,
		id = 59,
		items = {
			[501.0] = 1,
			__size = 1
		},
		prices = {
			__size = 1,
			rmb = 208
		}
	},
	__default = {
		__index = {
			weight = 100,
			huodongID = 1001,
			type = 1,
			items = ({
				default = slot0[1]
			}).default,
			prices = slot2.default
		}
	}
}

return csv.yunying.grid_walk_shop
