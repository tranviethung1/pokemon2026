slot0 = {
	{
		__size = 0
	},
	{
		[8505.0] = 1,
		__size = 1
	},
	{
		[8504.0] = 1,
		__size = 1
	},
	{
		[8503.0] = 1,
		__size = 1
	},
	__size = 14,
	[8] = {
		__size = 4,
		[8505.0] = 1,
		[8503.0] = 1,
		[8502.0] = 1,
		[8510.0] = 3
	},
	[9] = {
		__size = 3,
		[8510.0] = 2,
		[8505.0] = 1,
		[8502.0] = 3
	},
	[10] = {
		__size = 3,
		[8510.0] = 3,
		[8505.0] = 1,
		[8502.0] = 2
	},
	[11] = {
		__size = 4,
		[8505.0] = 1,
		[8509.0] = 1,
		[8502.0] = 2,
		[8510.0] = 2
	},
	[12] = {
		__size = 4,
		[8505.0] = 1,
		[8503.0] = 1,
		[8502.0] = 2,
		[8510.0] = 2
	},
	[13] = {
		__size = 4,
		[8504.0] = 1,
		[8503.0] = 1,
		[8502.0] = 1,
		[8510.0] = 3
	},
	[14] = {
		__size = 3,
		[8510.0] = 2,
		[8504.0] = 1,
		[8502.0] = 3
	},
	[15] = {
		__size = 3,
		[8510.0] = 3,
		[8504.0] = 1,
		[8502.0] = 2
	},
	[16] = {
		__size = 4,
		[8504.0] = 1,
		[8509.0] = 1,
		[8502.0] = 2,
		[8510.0] = 2
	},
	[17] = {
		__size = 4,
		[8504.0] = 1,
		[8503.0] = 1,
		[8502.0] = 2,
		[8510.0] = 2
	}
}
slot4 = {
	[307] = slot0[4],
	default = slot0[1],
	[405] = slot0[14],
	[404] = slot0[14],
	[403] = slot0[9],
	[402] = slot0[9],
	[401] = slot0[9]
}
slot5 = {
	default = slot0[1],
	[405] = slot0[17],
	[404] = slot0[17],
	[403] = slot0[12],
	[402] = slot0[12],
	[401] = slot0[12]
}
slot6 = {
	default = slot0[1],
	[405] = slot0[16],
	[404] = slot0[16],
	[403] = slot0[11],
	[402] = slot0[11],
	[401] = slot0[11]
}
slot8 = {
	default = slot0[1],
	[405] = slot0[13],
	[404] = slot0[13],
	[403] = slot0[8],
	[402] = slot0[8],
	[401] = slot0[8]
}
slot9 = {
	[301] = slot0[2],
	[302] = slot0[2],
	[303] = slot0[3],
	[304] = slot0[3],
	[305] = slot0[4],
	[306] = slot0[4],
	default = slot0[1],
	[405] = slot0[15],
	[404] = slot0[15],
	[403] = slot0[10],
	[402] = slot0[10],
	[401] = slot0[10]
}
csv.draw_totem = {
	__size = 13,
	[301] = {
		weightStart = 0.0045,
		drawType = "rmb1",
		id = 301,
		drawTriggerTimes = 60,
		weightEnd = 0.0102,
		drawTriggerType = 1,
		lotteryWeight1 = 100,
		startCount = 60,
		lotteryType1 = slot9[301]
	},
	[302] = {
		weightStart = 0.02,
		drawType = "rmb1",
		effectLimit = 1,
		startCount = 40,
		drawTriggerTimes = 40,
		weightEnd = 0.08,
		drawTriggerType = 1,
		lotteryWeight1 = 100,
		id = 302,
		lotteryType1 = slot9[302]
	},
	[303] = {
		weightStart = 0.015,
		drawType = "rmb1",
		id = 303,
		drawTriggerTimes = 20,
		weightEnd = 0.025,
		drawTriggerType = 1,
		lotteryWeight1 = 100,
		startCount = 20,
		lotteryType1 = slot9[303]
	},
	[304] = {
		weightStart = 0.06,
		drawType = "rmb1",
		effectLimit = 1,
		startCount = 10,
		drawTriggerTimes = 10,
		weightEnd = 0.14,
		drawTriggerType = 1,
		lotteryWeight1 = 100,
		id = 304,
		lotteryType1 = slot9[304]
	},
	[305] = {
		effectLimit = 1,
		drawType = "rmb1",
		lotteryWeight1 = 100,
		id = 305,
		drawTriggerType = 1,
		drawTriggerTimes = 10,
		lotteryType1 = slot9[305]
	},
	[306] = {
		effectLimit = 1,
		drawType = "rmb1",
		lotteryWeight1 = 100,
		id = 306,
		drawTriggerType = 3,
		drawTriggerTimes = 1,
		lotteryType1 = slot9[306]
	},
	[307] = {
		drawType = "rmb1",
		drawTriggerTimes = 2,
		lotteryWeight3 = 410,
		drawTriggerType = 0,
		lotteryWeight4 = 20,
		lotteryWeight1 = 390,
		id = 307,
		lotteryWeight2 = 200,
		lotteryType3 = {
			[8509.0] = 1,
			__size = 1
		},
		lotteryType2 = slot4[307],
		lotteryType1 = {
			[8502.0] = 1,
			__size = 1
		},
		lotteryType4 = {
			[8510.0] = 1,
			__size = 1
		}
	},
	[401] = {
		weightStart = 0.061,
		drawTriggerTimes = 10,
		lotteryWeight3 = 30,
		weightEnd = 0.12,
		drawTriggerType = 1,
		startCount = 9,
		drawType = "rmb6",
		lotteryWeight5 = 30,
		lotteryWeight4 = 30,
		lotteryWeight1 = 100,
		id = 401,
		lotteryWeight2 = 100,
		lotteryType3 = slot8[401],
		lotteryType2 = slot4[401],
		lotteryType1 = slot9[401],
		lotteryType5 = slot6[401],
		lotteryType4 = slot5[401]
	},
	[402] = {
		weightStart = 0.05,
		weightEnd = 0.45,
		drawTriggerTimes = 5,
		lotteryWeight3 = 30,
		drawTriggerType = 1,
		startCount = 5,
		effectLimit = 1,
		drawType = "rmb6",
		lotteryWeight5 = 30,
		lotteryWeight4 = 30,
		lotteryWeight1 = 100,
		id = 402,
		lotteryWeight2 = 100,
		lotteryType3 = slot8[402],
		lotteryType2 = slot4[402],
		lotteryType1 = slot9[402],
		lotteryType5 = slot6[402],
		lotteryType4 = slot5[402]
	},
	[403] = {
		weightStart = 0.3,
		weightEnd = 0.4,
		drawTriggerTimes = 1,
		lotteryWeight3 = 30,
		drawTriggerType = 1,
		startCount = 1,
		effectLimit = 1,
		drawType = "rmb6",
		lotteryWeight5 = 30,
		lotteryWeight4 = 30,
		lotteryWeight1 = 100,
		id = 403,
		lotteryWeight2 = 100,
		lotteryType3 = slot8[403],
		lotteryType2 = slot4[403],
		lotteryType1 = slot9[403],
		lotteryType5 = slot6[403],
		lotteryType4 = slot5[403]
	},
	[404] = {
		weightStart = 0.085,
		drawTriggerTimes = 1,
		lotteryWeight3 = 30,
		weightEnd = 0.485,
		drawTriggerType = 1,
		startCount = 1,
		drawType = "rmb6",
		lotteryWeight5 = 30,
		lotteryWeight4 = 30,
		lotteryWeight1 = 100,
		id = 404,
		lotteryWeight2 = 100,
		lotteryType3 = slot8[404],
		lotteryType2 = slot4[404],
		lotteryType1 = slot9[404],
		lotteryType5 = slot6[404],
		lotteryType4 = slot5[404]
	},
	[405] = {
		effectLimit = 1,
		drawType = "rmb6",
		lotteryWeight5 = 30,
		drawTriggerTimes = 1,
		lotteryWeight3 = 30,
		drawTriggerType = 3,
		lotteryWeight4 = 30,
		lotteryWeight1 = 100,
		id = 405,
		lotteryWeight2 = 100,
		lotteryType3 = slot8[405],
		lotteryType2 = slot4[405],
		lotteryType1 = slot9[405],
		lotteryType5 = slot6[405],
		lotteryType4 = slot5[405]
	},
	[406] = {
		drawType = "rmb6",
		lotteryWeight5 = 30,
		drawTriggerTimes = 2,
		lotteryWeight3 = 30,
		drawTriggerType = 0,
		lotteryWeight4 = 30,
		lotteryWeight1 = 100,
		id = 406,
		lotteryWeight2 = 100,
		lotteryType3 = {
			__size = 3,
			[8510.0] = 3,
			[8502.0] = 1,
			[8503.0] = 2
		},
		lotteryType2 = {
			__size = 3,
			[8510.0] = 2,
			[8502.0] = 3,
			[8503.0] = 1
		},
		lotteryType1 = {
			__size = 3,
			[8510.0] = 3,
			[8502.0] = 2,
			[8503.0] = 1
		},
		lotteryType5 = {
			__size = 4,
			[8502.0] = 2,
			[8509.0] = 1,
			[8503.0] = 1,
			[8510.0] = 2
		},
		lotteryType4 = {
			__size = 3,
			[8510.0] = 2,
			[8502.0] = 2,
			[8503.0] = 2
		}
	},
	__default = {
		__index = {
			probLimit = 0.2,
			weightStart = 0,
			probStep = 0.01,
			lotteryWeight3 = 0,
			drawTriggerType = 2,
			lotteryWeight9 = 0,
			startCount = 0,
			lotteryWeight6 = 0,
			lotteryWeight7 = 0,
			probMiniTimes = 30,
			effectLimit = 0,
			lotteryWeight8 = 0,
			lotteryWeight10 = 0,
			probInit = 0,
			lotteryWeight5 = 0,
			probEffectInterval = 50,
			weightEnd = 0,
			drawTriggerTimes = 0,
			lotteryWeight4 = 0,
			lotteryWeight1 = 0,
			lotteryWeight2 = 0,
			lotteryType6 = ({
				default = slot0[1]
			}).default,
			lotteryType8 = ({
				default = slot0[1]
			}).default,
			lotteryType3 = slot8.default,
			lotteryType2 = slot4.default,
			lotteryType10 = ({
				default = slot0[1]
			}).default,
			lotteryType1 = slot9.default,
			lotteryType9 = ({
				default = slot0[1]
			}).default,
			lotteryType7 = ({
				default = slot0[1]
			}).default,
			lotteryType5 = slot6.default,
			lotteryType4 = slot5.default
		}
	}
}

return csv.draw_totem
