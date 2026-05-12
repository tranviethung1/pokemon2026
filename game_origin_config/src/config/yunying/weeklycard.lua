slot0 = {
	__size = 3,
	[2] = {
		gold = 200000,
		rmb = 160,
		__size = 3,
		[11.0] = 30
	},
	[4] = {
		gold = 500000,
		rmb = 1000,
		[519.0] = 5,
		__size = 3
	},
	[7] = {
		[452.0] = 50,
		rmb = 300,
		__size = 3,
		[502.0] = 3
	}
}
slot1 = {
	[123] = slot0[7],
	[126] = slot0[7],
	[127] = slot0[7],
	[115] = slot0[4],
	[114] = slot0[4],
	[122] = slot0[7],
	[116] = slot0[4],
	[124] = slot0[7],
	[125] = slot0[7],
	[113] = slot0[4],
	[112] = slot0[4],
	[102] = slot0[2],
	[103] = slot0[2],
	[101] = slot0[2],
	[106] = slot0[2],
	[107] = slot0[2],
	[104] = slot0[2],
	[105] = slot0[2]
}
csv.yunying.weeklycard = {
	__size = 21,
	[101] = {
		id = 101,
		huodongID = 1001,
		day = 1,
		award = slot1[101]
	},
	[102] = {
		id = 102,
		huodongID = 1001,
		day = 2,
		award = slot1[102]
	},
	[103] = {
		id = 103,
		huodongID = 1001,
		day = 3,
		award = slot1[103]
	},
	[104] = {
		id = 104,
		huodongID = 1001,
		day = 4,
		award = slot1[104]
	},
	[105] = {
		id = 105,
		huodongID = 1001,
		day = 5,
		award = slot1[105]
	},
	[106] = {
		id = 106,
		huodongID = 1001,
		day = 6,
		award = slot1[106]
	},
	[107] = {
		id = 107,
		huodongID = 1001,
		day = 7,
		award = slot1[107]
	},
	[111] = {
		id = 111,
		huodongID = 1002,
		day = 1,
		award = {
			gold = 2000000,
			rmb = 2000,
			[519.0] = 5,
			__size = 3
		}
	},
	[112] = {
		id = 112,
		huodongID = 1002,
		day = 2,
		award = slot1[112]
	},
	[113] = {
		id = 113,
		huodongID = 1002,
		day = 3,
		award = slot1[113]
	},
	[114] = {
		id = 114,
		huodongID = 1002,
		day = 4,
		award = slot1[114]
	},
	[115] = {
		id = 115,
		huodongID = 1002,
		day = 5,
		award = slot1[115]
	},
	[116] = {
		id = 116,
		huodongID = 1002,
		day = 6,
		award = slot1[116]
	},
	[117] = {
		id = 117,
		huodongID = 1002,
		day = 7,
		award = {
			gold = 500000,
			rmb = 4000,
			[519.0] = 5,
			__size = 3
		}
	},
	[121] = {
		id = 121,
		huodongID = 1003,
		day = 1,
		award = {
			[452.0] = 200,
			rmb = 980,
			__size = 3,
			[502.0] = 9
		}
	},
	[122] = {
		id = 122,
		huodongID = 1003,
		day = 2,
		award = slot1[122]
	},
	[123] = {
		id = 123,
		huodongID = 1003,
		day = 3,
		award = slot1[123]
	},
	[124] = {
		id = 124,
		huodongID = 1003,
		day = 4,
		award = slot1[124]
	},
	[125] = {
		id = 125,
		huodongID = 1003,
		day = 5,
		award = slot1[125]
	},
	[126] = {
		id = 126,
		huodongID = 1003,
		day = 6,
		award = slot1[126]
	},
	[127] = {
		id = 127,
		huodongID = 1003,
		day = 7,
		award = slot1[127]
	},
	__default = {
		__index = {
			day = 99,
			award = {
				__size = 0
			}
		}
	}
}

return csv.yunying.weeklycard
