slot0 = {
	{
		__size = 0
	},
	__size = 13,
	[5] = {
		[232.0] = 100,
		[202.0] = 100,
		[233.0] = 100,
		[205.0] = 100,
		[223.0] = 100,
		[204.0] = 100,
		[220.0] = 100,
		[225.0] = 100,
		[221.0] = 100,
		[222.0] = 100,
		[210.0] = 100,
		[215.0] = 100,
		[211.0] = 100,
		[231.0] = 100,
		__size = 24,
		[224.0] = 100,
		[214.0] = 100,
		[230.0] = 100,
		[212.0] = 100,
		[213.0] = 100,
		[201.0] = 100,
		[234.0] = 100,
		[200.0] = 100,
		[235.0] = 100,
		[203.0] = 100
	},
	[6] = {
		equip_awake_frag = 200,
		__size = 1
	},
	[7] = {
		__size = 11,
		[30204.0] = 100,
		[30207.0] = 100,
		[30206.0] = 100,
		[30209.0] = 100,
		[30203.0] = 100,
		[31201.0] = 100,
		[30201.0] = 100,
		[31202.0] = 100,
		[30202.0] = 100,
		[30208.0] = 100,
		[30205.0] = 100
	},
	[8] = {
		equip_awake_frag = 60,
		__size = 1
	},
	[9] = {
		__size = 17,
		[30302.0] = 100,
		[30303.0] = 100,
		[30306.0] = 100,
		[30308.0] = 150,
		[30313.0] = 100,
		[30309.0] = 150,
		[30305.0] = 100,
		[30304.0] = 100,
		[30301.0] = 100,
		[30314.0] = 100,
		[30312.0] = 150,
		[30315.0] = 100,
		[30311.0] = 150,
		[30310.0] = 150,
		[30317.0] = 100,
		[30316.0] = 100,
		[30307.0] = 150
	},
	[10] = {
		equip_awake_frag = 300,
		__size = 1
	},
	[11] = {
		__size = 6,
		[30106.0] = 100,
		[30104.0] = 100,
		[30102.0] = 100,
		[30101.0] = 100,
		[30105.0] = 100,
		[30103.0] = 100
	},
	[12] = {
		equip_awake_frag = 30,
		__size = 1
	},
	[19] = {
		equip_awake_frag = 50,
		__size = 1
	},
	[27] = {
		equip_awake_frag = 36,
		__size = 1
	},
	[28] = {
		75,
		200
	},
	[40] = {
		equip_awake_frag = 10,
		__size = 1
	}
}
slot1 = {
	slot0[5],
	slot0[5],
	default = slot0[1],
	[3] = slot0[7],
	[5] = slot0[7],
	[4] = slot0[9],
	[7] = slot0[11],
	[6] = slot0[9],
	[8] = slot0[11]
}
slot2 = {
	[303] = slot0[28],
	[304] = slot0[28]
}
slot3 = {
	slot0[6],
	slot0[6],
	[62] = slot0[12],
	[64] = slot0[19],
	[3] = slot0[8],
	[5] = slot0[8],
	[4] = slot0[10],
	[7] = slot0[12],
	[6] = slot0[10],
	[8] = slot0[12],
	[201] = slot0[40],
	[203] = slot0[40],
	[202] = slot0[40],
	[205] = slot0[40],
	[204] = slot0[40],
	[207] = slot0[40],
	[206] = slot0[40],
	[303] = slot0[27],
	[304] = slot0[27],
	[108] = slot0[19],
	[109] = slot0[19],
	[102] = slot0[19],
	[103] = slot0[19],
	[101] = slot0[19],
	[106] = slot0[19],
	[107] = slot0[19],
	[104] = slot0[19],
	[105] = slot0[19]
}
csv.equip_shop = {
	{
		itemCount = 1,
		type = 2,
		id = 1,
		position = 1,
		itemWeightMap = slot1[1],
		costMap = slot3[1]
	},
	{
		itemCount = 1,
		type = 2,
		id = 2,
		position = 2,
		itemWeightMap = slot1[2],
		costMap = slot3[2]
	},
	{
		itemCount = 1,
		type = 2,
		id = 3,
		position = 3,
		itemWeightMap = slot1[3],
		costMap = slot3[3]
	},
	{
		itemCount = 1,
		type = 2,
		id = 4,
		position = 3,
		itemWeightMap = slot1[4],
		costMap = slot3[4]
	},
	{
		itemCount = 1,
		type = 2,
		id = 5,
		position = 4,
		itemWeightMap = slot1[5],
		costMap = slot3[5]
	},
	{
		itemCount = 1,
		type = 2,
		id = 6,
		position = 4,
		itemWeightMap = slot1[6],
		costMap = slot3[6]
	},
	{
		itemCount = 1,
		type = 2,
		id = 7,
		position = 5,
		itemWeightMap = slot1[7],
		costMap = slot3[7]
	},
	{
		itemCount = 1,
		type = 2,
		id = 8,
		position = 6,
		itemWeightMap = slot1[8],
		costMap = slot3[8]
	},
	__size = 33,
	[61] = {
		type = 1,
		id = 61,
		position = 7,
		itemMap = {
			[501.0] = 1,
			__size = 1
		},
		costMap = {
			equip_awake_frag = 24,
			__size = 1
		}
	},
	[62] = {
		type = 1,
		id = 62,
		position = 8,
		itemMap = {
			__size = 1,
			[902.0] = 5
		},
		costMap = slot3[62]
	},
	[63] = {
		type = 1,
		id = 63,
		position = 9,
		itemMap = {
			__size = 1,
			[2103.0] = 1
		},
		costMap = {
			equip_awake_frag = 12,
			__size = 1
		}
	},
	[64] = {
		type = 1,
		id = 64,
		position = 10,
		itemMap = {
			[941.0] = 1,
			__size = 1
		},
		costMap = slot3[64]
	},
	[65] = {
		type = 1,
		id = 65,
		position = 11,
		itemMap = {
			[940.0] = 1,
			__size = 1
		},
		costMap = {
			equip_awake_frag = 25,
			__size = 1
		}
	},
	[301] = {
		limitType = 3,
		type = 1,
		id = 301,
		position = 12,
		limitTimes = 3,
		itemMap = {
			[2152.0] = 1,
			__size = 1
		},
		costMap = {
			equip_awake_frag = 100,
			__size = 1
		}
	},
	[302] = {
		limitType = 3,
		type = 1,
		id = 302,
		position = 13,
		limitTimes = 2,
		itemMap = {
			[2153.0] = 1,
			__size = 1
		},
		costMap = {
			equip_awake_frag = 600,
			__size = 1
		}
	},
	[303] = {
		type = 1,
		id = 303,
		position = 14,
		limitType = 4,
		limitTimes = 50,
		itemMap = {
			__size = 1,
			[28102.0] = 1
		},
		costMap = slot3[303],
		levelRange = slot2[303]
	},
	[304] = {
		type = 1,
		id = 304,
		position = 15,
		limitType = 4,
		limitTimes = 50,
		itemMap = {
			__size = 1,
			[28103.0] = 1
		},
		costMap = slot3[304],
		levelRange = slot2[304]
	},
	[101] = {
		vipWeight = 0,
		type = 2,
		id = 101,
		position = 4,
		itemMap = {
			__size = 1,
			[30201.0] = 1
		},
		costMap = slot3[101]
	},
	[102] = {
		vipWeight = 0,
		type = 2,
		id = 102,
		position = 5,
		itemMap = {
			__size = 1,
			[30202.0] = 1
		},
		costMap = slot3[102]
	},
	[103] = {
		vipWeight = 0,
		type = 2,
		id = 103,
		position = 6,
		itemMap = {
			__size = 1,
			[30203.0] = 1
		},
		costMap = slot3[103]
	},
	[104] = {
		vipWeight = 0,
		type = 2,
		id = 104,
		position = 7,
		itemMap = {
			__size = 1,
			[30204.0] = 1
		},
		costMap = slot3[104]
	},
	[105] = {
		vipWeight = 0,
		type = 2,
		id = 105,
		position = 8,
		itemMap = {
			__size = 1,
			[30205.0] = 1
		},
		costMap = slot3[105]
	},
	[106] = {
		vipWeight = 0,
		type = 2,
		id = 106,
		position = 9,
		itemMap = {
			__size = 1,
			[30206.0] = 1
		},
		costMap = slot3[106]
	},
	[107] = {
		vipWeight = 0,
		type = 2,
		id = 107,
		position = 10,
		itemMap = {
			__size = 1,
			[30207.0] = 1
		},
		costMap = slot3[107]
	},
	[108] = {
		vipWeight = 0,
		type = 2,
		id = 108,
		position = 11,
		itemMap = {
			[30208.0] = 1,
			__size = 1
		},
		costMap = slot3[108]
	},
	[109] = {
		vipWeight = 0,
		type = 2,
		id = 109,
		position = 12,
		itemMap = {
			[30209.0] = 1,
			__size = 1
		},
		costMap = slot3[109]
	},
	[201] = {
		vipWeight = 0,
		type = 2,
		id = 201,
		position = 14,
		itemMap = {
			[30101.0] = 1,
			__size = 1
		},
		costMap = slot3[201]
	},
	[202] = {
		vipWeight = 0,
		type = 2,
		id = 202,
		position = 15,
		itemMap = {
			[30102.0] = 1,
			__size = 1
		},
		costMap = slot3[202]
	},
	[203] = {
		vipWeight = 0,
		type = 2,
		id = 203,
		position = 16,
		itemMap = {
			[30103.0] = 1,
			__size = 1
		},
		costMap = slot3[203]
	},
	[204] = {
		vipWeight = 0,
		type = 2,
		id = 204,
		position = 17,
		itemMap = {
			[30104.0] = 1,
			__size = 1
		},
		costMap = slot3[204]
	},
	[205] = {
		vipWeight = 0,
		type = 2,
		id = 205,
		position = 18,
		itemMap = {
			[30105.0] = 1,
			__size = 1
		},
		costMap = slot3[205]
	},
	[206] = {
		vipWeight = 0,
		type = 2,
		id = 206,
		position = 19,
		itemMap = {
			[30106.0] = 1,
			__size = 1
		},
		costMap = slot3[206]
	},
	[207] = {
		vipWeight = 0,
		type = 2,
		id = 207,
		position = 20,
		itemMap = {
			[30107.0] = 1,
			__size = 1
		},
		costMap = slot3[207]
	},
	__default = {
		__index = {
			vipStart = 0,
			itemCount = 0,
			type = 0,
			vipWeight = 1,
			showUnable = false,
			endDate = 20990101,
			limitTimes = 0,
			beginDate = 0,
			position = 0,
			limitType = 0,
			itemWeightMap = slot1.default,
			itemMap = ({
				default = slot0[1]
			}).default,
			costMap = {
				equip_awake_frag = 0,
				__size = 1
			},
			levelRange = {
				1,
				200
			},
			languages = {
				"cn",
				"br",
				"en",
				"vn",
				"th",
				"kr"
			}
		}
	}
}

return csv.equip_shop
