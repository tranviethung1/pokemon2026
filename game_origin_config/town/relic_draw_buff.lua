slot0 = {
	__size = 0
}
csv.town.relic_draw_buff = {
	__size = 4,
	[107] = {
		effectLimit = 1,
		drawTriggerType = 4,
		lotteryType1 = 14,
		lotteryWeight1 = 100,
		id = 107,
		drawTriggerTimes = 5
	},
	[108] = {
		effectLimit = 1,
		drawTriggerType = 4,
		lotteryType1 = 11,
		lotteryWeight1 = 40,
		id = 108,
		drawTriggerTimes = 1
	},
	[109] = {
		probEffectInterval = 20,
		startCount = 5,
		lotteryType1 = 14,
		probLimit = 1,
		probInit = 0.05,
		probStep = 0.05,
		drawTriggerType = 2,
		lotteryWeight1 = 100,
		id = 109,
		probMiniTimes = 20
	},
	[110] = {
		lotteryType1 = 10,
		lotteryType4 = 13,
		lotteryWeight3 = 15,
		lotteryType2 = 11,
		lotteryWeight4 = 15,
		lotteryWeight1 = 30,
		id = 110,
		lotteryWeight2 = 40,
		lotteryType3 = 12
	},
	__default = {
		__index = {
			weightStart = 0,
			startCount = 0,
			lotteryType2 = 0,
			drawTriggerTimes = 0,
			probInit = 0,
			lotteryType4 = 0,
			probStep = 0.01,
			lotteryWeight3 = 0,
			weightEnd = 0,
			drawTriggerType = 0,
			lotteryType5 = 0,
			probEffectInterval = 50,
			probMiniTimes = 30,
			effectLimit = 0,
			drawType = "town_relic1",
			lotteryType1 = 0,
			probLimit = 0.2,
			lotteryWeight5 = 0,
			lotteryWeight4 = 0,
			lotteryWeight1 = 0,
			lotteryWeight2 = 0,
			lotteryType3 = 0
		}
	}
}

return csv.town.relic_draw_buff
