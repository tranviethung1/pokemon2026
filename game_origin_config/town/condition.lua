slot0 = {
	__size = 8,
	[2] = {
		[1.0] = 1,
		__size = 1
	},
	[3] = {
		[1.0] = 2,
		__size = 1
	},
	[4] = {
		[1.0] = 3,
		__size = 1
	},
	[11] = {
		[2.0] = 1,
		__size = 1
	},
	[12] = {
		[3.0] = 2,
		__size = 1
	},
	[13] = {
		[3.0] = 3,
		__size = 1
	},
	[14] = {
		[4.0] = 1,
		__size = 1
	},
	[15] = {
		[4.0] = 2,
		__size = 1
	}
}
slot1 = {
	slot0[2],
	slot0[3],
	[308] = slot0[12],
	[309] = slot0[13],
	[310] = slot0[14],
	[301] = slot0[2],
	[302] = slot0[3],
	[303] = slot0[4],
	[304] = slot0[11],
	[3] = slot0[4],
	[111] = slot0[13],
	[110] = slot0[12],
	[113] = slot0[15],
	[112] = slot0[14],
	[101] = slot0[11],
	[311] = slot0[15]
}
csv.town.condition = {
	{
		id = 1,
		desc = "大厅达到1级",
		taskType = 1,
		taskSpecialParam = slot1[1]
	},
	{
		id = 2,
		desc = "大厅达到2级",
		taskType = 1,
		taskSpecialParam = slot1[2]
	},
	{
		id = 3,
		desc = "大厅达到3级",
		taskType = 1,
		taskSpecialParam = slot1[3]
	},
	{
		id = 4,
		desc = "大厅达到4级",
		taskType = 1,
		taskSpecialParam = {
			[1.0] = 4,
			__size = 1
		}
	},
	{
		id = 5,
		desc = "大厅达到5级",
		taskType = 1,
		taskSpecialParam = {
			[1.0] = 5,
			__size = 1
		}
	},
	{
		id = 6,
		desc = "大厅达到6级",
		taskType = 1,
		taskSpecialParam = {
			[1.0] = 6,
			__size = 1
		}
	},
	{
		id = 7,
		desc = "大厅达到7级",
		taskType = 1,
		taskSpecialParam = {
			[1.0] = 7,
			__size = 1
		}
	},
	{
		id = 8,
		desc = "大厅达到8级",
		taskType = 1,
		taskSpecialParam = {
			[1.0] = 8,
			__size = 1
		}
	},
	{
		id = 9,
		desc = "大厅达到9级",
		taskType = 1,
		taskSpecialParam = {
			[1.0] = 9,
			__size = 1
		}
	},
	__size = 33,
	[101] = {
		id = 101,
		desc = "我的小屋解锁",
		taskType = 1,
		taskSpecialParam = slot1[101]
	},
	[110] = {
		id = 110,
		desc = "炼金场2级",
		taskType = 1,
		taskSpecialParam = slot1[110]
	},
	[111] = {
		id = 111,
		desc = "炼金场3级",
		taskType = 1,
		taskSpecialParam = slot1[111]
	},
	[112] = {
		id = 112,
		desc = "伐木场1级",
		taskType = 1,
		taskSpecialParam = slot1[112]
	},
	[113] = {
		id = 113,
		desc = "伐木场2级",
		taskType = 1,
		taskSpecialParam = slot1[113]
	},
	[114] = {
		id = 114,
		desc = "甜品站2级",
		taskType = 1,
		taskSpecialParam = {
			__size = 1,
			[5.0] = 2
		}
	},
	[115] = {
		id = 115,
		desc = "甜品站3级",
		taskType = 1,
		taskSpecialParam = {
			__size = 1,
			[5.0] = 3
		}
	},
	[116] = {
		id = 116,
		desc = "金融银行3级",
		taskType = 1,
		taskSpecialParam = {
			[6.0] = 3,
			__size = 1
		}
	},
	[117] = {
		id = 117,
		desc = "金融银行4级",
		taskType = 1,
		taskSpecialParam = {
			[6.0] = 4,
			__size = 1
		}
	},
	[201] = {
		id = 201,
		desc = "小屋已装饰数量达到5件",
		taskParam = 5,
		taskType = 2
	},
	[202] = {
		id = 202,
		desc = "小屋已装饰数量达到10件",
		taskParam = 10,
		taskType = 2
	},
	[203] = {
		id = 203,
		desc = "小屋已装饰数量达到15件",
		taskParam = 15,
		taskType = 2
	},
	[301] = {
		id = 301,
		desc = "地区1声望达到1级",
		taskType = 3,
		taskSpecialParam = slot1[301]
	},
	[302] = {
		id = 302,
		desc = "地区1声望达到2级",
		taskType = 3,
		taskSpecialParam = slot1[302]
	},
	[303] = {
		id = 303,
		desc = "地区1声望达到3级",
		taskType = 3,
		taskSpecialParam = slot1[303]
	},
	[304] = {
		id = 304,
		desc = "地区2声望达到1级",
		taskType = 3,
		taskSpecialParam = slot1[304]
	},
	[305] = {
		id = 305,
		desc = "地区2声望达到2级",
		taskType = 3,
		taskSpecialParam = {
			[2.0] = 2,
			__size = 1
		}
	},
	[306] = {
		id = 306,
		desc = "地区2声望达到3级",
		taskType = 3,
		taskSpecialParam = {
			[2.0] = 3,
			__size = 1
		}
	},
	[307] = {
		id = 307,
		desc = "地区3声望达到1级",
		taskType = 3,
		taskSpecialParam = {
			[3.0] = 1,
			__size = 1
		}
	},
	[308] = {
		id = 308,
		desc = "地区3声望达到2级",
		taskType = 3,
		taskSpecialParam = slot1[308]
	},
	[309] = {
		id = 309,
		desc = "地区3声望达到3级",
		taskType = 3,
		taskSpecialParam = slot1[309]
	},
	[310] = {
		id = 310,
		desc = "地区4声望达到1级",
		taskType = 3,
		taskSpecialParam = slot1[310]
	},
	[311] = {
		id = 311,
		desc = "地区4声望达到2级",
		taskType = 3,
		taskSpecialParam = slot1[311]
	},
	[312] = {
		id = 312,
		desc = "地区4声望达到3级",
		taskType = 3,
		taskSpecialParam = {
			[4.0] = 3,
			__size = 1
		}
	},
	__default = {
		__index = {
			desc = "",
			taskParam = 9999,
			taskType = 0,
			taskSpecialParam = {
				__size = 0
			}
		}
	}
}

return csv.town.condition
