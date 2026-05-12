slot0 = {
	{
		__size = 0
	},
	{
		__size = 1,
		[4004.0] = 1
	},
	{
		__size = 1,
		[4001.0] = 1
	},
	{
		__size = 1,
		[4002.0] = 1
	},
	{
		__size = 1,
		[4003.0] = 1
	},
	{
		[4010.0] = 1,
		__size = 1
	},
	{
		__size = 4,
		[4002.0] = 3,
		[4001.0] = 4,
		[4004.0] = 1,
		[4010.0] = 2
	},
	__size = 10,
	[11] = {
		__size = 1,
		[4005.0] = 1
	},
	[12] = {
		__size = 5,
		[4001.0] = 3,
		[4002.0] = 2,
		[4003.0] = 2,
		[4005.0] = 1,
		[4011.0] = 2
	},
	[13] = {
		__size = 5,
		[4001.0] = 3,
		[4002.0] = 3,
		[4003.0] = 2,
		[4005.0] = 1,
		[4011.0] = 1
	}
}
slot5 = {
	default = slot0[1],
	[24] = slot0[2],
	[3] = slot0[6]
}
slot6 = {
	default = slot0[1],
	[24] = slot0[6]
}
slot7 = {
	default = slot0[1],
	[24] = slot0[4],
	[3] = slot0[4],
	[31] = slot0[13],
	[32] = slot0[13]
}
slot8 = {
	default = slot0[1],
	[24] = slot0[5],
	[3] = slot0[5]
}
slot9 = {
	slot0[2],
	slot0[2],
	[11] = slot0[7],
	[12] = slot0[7],
	[21] = slot0[11],
	[22] = slot0[11],
	[23] = slot0[2],
	[32] = slot0[12],
	[31] = slot0[12],
	default = slot0[1],
	[3] = slot0[3],
	[24] = slot0[3]
}
csv.draw_metal = {
	{
		weightStart = 0.015,
		drawType = "gold1",
		lotteryWeight1 = 100,
		id = 1,
		weightEnd = 0.025,
		drawTriggerTimes = 6,
		startCount = 6,
		lotteryType1 = slot9[1]
	},
	{
		effectLimit = 1,
		drawType = "gold1",
		id = 2,
		weightStart = 0.2,
		drawTriggerTimes = 2,
		weightEnd = 0.3,
		lotteryWeight1 = 100,
		startCount = 2,
		lotteryType1 = slot9[2]
	},
	{
		drawType = "gold1",
		drawTriggerTimes = 1,
		lotteryWeight3 = 10,
		drawTriggerType = 0,
		lotteryWeight4 = 15,
		lotteryWeight1 = 45,
		id = 3,
		lotteryWeight2 = 35,
		lotteryType1 = slot9[3],
		lotteryType2 = slot7[3],
		lotteryType3 = slot8[3],
		lotteryType4 = slot5[3]
	},
	__size = 14,
	[11] = {
		weightStart = 0.15,
		drawType = "gold10",
		lotteryWeight1 = 100,
		id = 11,
		weightEnd = 0.25,
		drawTriggerTimes = 2,
		startCount = 2,
		lotteryType1 = slot9[11]
	},
	[12] = {
		drawType = "gold10",
		drawTriggerType = 3,
		lotteryWeight1 = 100,
		id = 12,
		drawTriggerTimes = 1,
		lotteryType1 = slot9[12]
	},
	[13] = {
		drawTriggerType = 0,
		lotteryWeight1 = 50,
		id = 13,
		lotteryWeight2 = 50,
		drawTriggerTimes = 1,
		drawType = "gold10",
		lotteryType1 = {
			__size = 4,
			[4002.0] = 3,
			[4001.0] = 4,
			[4003.0] = 1,
			[4010.0] = 2
		},
		lotteryType2 = {
			__size = 4,
			[4002.0] = 3,
			[4001.0] = 5,
			[4003.0] = 1,
			[4010.0] = 1
		}
	},
	[14] = {
		drawType = "gold50",
		drawTriggerType = 0,
		lotteryWeight1 = 100,
		id = 14,
		drawTriggerTimes = 1,
		lotteryType1 = {
			__size = 5,
			[4001.0] = 20,
			[4002.0] = 15,
			[4003.0] = 4,
			[4004.0] = 1,
			[4010.0] = 10
		}
	},
	[21] = {
		weightStart = 0.02,
		drawType = "rmb1",
		lotteryWeight1 = 100,
		id = 21,
		weightEnd = 0.03,
		drawTriggerTimes = 20,
		startCount = 20,
		lotteryType1 = slot9[21]
	},
	[22] = {
		effectLimit = 1,
		drawType = "rmb1",
		id = 22,
		weightStart = 0.06,
		drawTriggerTimes = 10,
		weightEnd = 0.14,
		lotteryWeight1 = 100,
		startCount = 10,
		lotteryType1 = slot9[22]
	},
	[23] = {
		drawType = "rmb1",
		drawTriggerType = 3,
		lotteryWeight1 = 100,
		id = 23,
		drawTriggerTimes = 1,
		lotteryType1 = slot9[23]
	},
	[24] = {
		drawType = "rmb1",
		lotteryWeight5 = 12,
		drawTriggerTimes = 2,
		lotteryWeight3 = 20,
		drawTriggerType = 0,
		lotteryWeight4 = 8,
		lotteryWeight1 = 35,
		id = 24,
		lotteryWeight2 = 25,
		lotteryType1 = slot9[24],
		lotteryType2 = slot7[24],
		lotteryType3 = slot8[24],
		lotteryType4 = slot5[24],
		lotteryType5 = slot6[24]
	},
	[31] = {
		weightStart = 0.26,
		drawType = "rmb10",
		id = 31,
		drawTriggerTimes = 3,
		lotteryWeight3 = 10,
		weightEnd = 0.36,
		lotteryWeight1 = 45,
		startCount = 3,
		lotteryWeight2 = 45,
		lotteryType1 = slot9[31],
		lotteryType2 = slot7[31],
		lotteryType3 = {
			__size = 6,
			[4001.0] = 3,
			[4002.0] = 2,
			[4005.0] = 1,
			[4003.0] = 2,
			[4004.0] = 1,
			[4011.0] = 1
		}
	},
	[32] = {
		drawTriggerType = 3,
		lotteryWeight1 = 50,
		id = 32,
		lotteryWeight2 = 50,
		drawTriggerTimes = 1,
		drawType = "rmb10",
		lotteryType1 = slot9[32],
		lotteryType2 = slot7[32]
	},
	[33] = {
		drawType = "rmb10",
		drawTriggerTimes = 2,
		lotteryWeight3 = 25,
		drawTriggerType = 0,
		lotteryWeight4 = 25,
		lotteryWeight1 = 25,
		id = 33,
		lotteryWeight2 = 25,
		lotteryType1 = {
			__size = 5,
			[4001.0] = 3,
			[4002.0] = 3,
			[4003.0] = 2,
			[4004.0] = 1,
			[4011.0] = 1
		},
		lotteryType2 = {
			__size = 5,
			[4001.0] = 3,
			[4002.0] = 3,
			[4003.0] = 1,
			[4004.0] = 2,
			[4011.0] = 1
		},
		lotteryType3 = {
			__size = 4,
			[4001.0] = 4,
			[4002.0] = 3,
			[4003.0] = 2,
			[4004.0] = 1
		},
		lotteryType4 = {
			__size = 5,
			[4001.0] = 3,
			[4002.0] = 2,
			[4003.0] = 2,
			[4004.0] = 1,
			[4011.0] = 2
		}
	},
	__default = {
		__index = {
			weightStart = 0,
			lotteryWeight7 = 0,
			drawTriggerTimes = 0,
			lotteryWeight3 = 0,
			weightEnd = 0,
			drawTriggerType = 1,
			lotteryWeight9 = 0,
			startCount = 0,
			lotteryWeight10 = 0,
			effectLimit = 0,
			lotteryWeight8 = 0,
			lotteryWeight5 = 0,
			lotteryWeight6 = 0,
			lotteryWeight4 = 0,
			lotteryWeight1 = 0,
			lotteryWeight2 = 0,
			lotteryType1 = slot9.default,
			lotteryType2 = slot7.default,
			lotteryType3 = slot8.default,
			lotteryType4 = slot5.default,
			lotteryType5 = slot6.default,
			lotteryType6 = ({
				default = slot0[1]
			}).default,
			lotteryType7 = ({
				default = slot0[1]
			}).default,
			lotteryType8 = ({
				default = slot0[1]
			}).default,
			lotteryType9 = ({
				default = slot0[1]
			}).default,
			lotteryType10 = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.draw_metal
