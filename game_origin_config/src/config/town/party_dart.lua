slot0 = {
	__size = 1,
	[15] = {
		0,
		1
	}
}
slot1 = {
	[8] = slot0[15],
	[7] = slot0[15]
}
csv.town.party_dart = {
	{
		res = "city/town/home/party/darts/endscore/logo_xunuli.png",
		id = 1,
		grade = {
			105,
			205
		},
		reward = {
			gold = 10000,
			coin16 = 5,
			[8201.0] = 10,
			__size = 3
		}
	},
	{
		res = "city/town/home/party/darts/endscore/logo_jiaocha.png",
		id = 2,
		grade = {
			75,
			105
		},
		reward = {
			gold = 15000,
			coin16 = 7,
			[8201.0] = 15,
			__size = 3
		}
	},
	{
		res = "city/town/home/party/darts/endscore/logo_yiban.png",
		id = 3,
		grade = {
			50,
			75
		},
		reward = {
			gold = 20000,
			coin16 = 9,
			[8201.0] = 20,
			__size = 3
		}
	},
	{
		res = "city/town/home/party/darts/endscore/logo_zhongdeng.png",
		id = 4,
		grade = {
			30,
			50
		},
		reward = {
			gold = 25000,
			coin16 = 11,
			[8201.0] = 25,
			__size = 3
		}
	},
	{
		res = "city/town/home/party/darts/endscore/logo_bucuo.png",
		id = 5,
		grade = {
			10,
			30
		},
		reward = {
			gold = 30000,
			coin16 = 13,
			[8201.0] = 30,
			__size = 3
		}
	},
	{
		res = "city/town/home/party/darts/endscore/logo_youxiu.png",
		id = 6,
		grade = {
			1,
			10
		},
		reward = {
			gold = 35000,
			coin16 = 15,
			[8201.0] = 35,
			__size = 3
		}
	},
	{
		res = "city/town/home/party/darts/endscore/logo_wanmei.png",
		dartUseNum = 5,
		id = 7,
		grade = slot1[7],
		reward = {
			gold = 40000,
			coin16 = 17,
			[8201.0] = 40,
			__size = 3
		}
	},
	{
		res = "city/town/home/party/darts/endscore/logo_shenzhun.png",
		dartUseNum = 4,
		id = 8,
		grade = slot1[8],
		reward = {
			gold = 50000,
			coin16 = 20,
			[8201.0] = 50,
			__size = 3
		}
	},
	__size = 8,
	__default = {
		__index = {
			res = "",
			dartUseNum = 0,
			grade = {},
			reward = {
				__size = 0
			}
		}
	}
}

return csv.town.party_dart
