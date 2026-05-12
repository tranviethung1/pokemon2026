slot0 = {
	__size = 0
}
csv.draw_chip_dynamic = {
	{
		libID = 22501,
		drawTriggerType = 0,
		selected = 3,
		id = 1,
		drawTriggerTimes = 1
	},
	__size = 11,
	[11] = {
		libID = 22502,
		drawTriggerType = 0,
		selected = 3,
		id = 11,
		drawTriggerTimes = 1
	},
	[21] = {
		weightStart = 0.013,
		drawTriggerType = 1,
		libID = 22503,
		weightEnd = 0.02,
		id = 21,
		startCount = 2,
		drawTriggerTimes = 2,
		selected = 4.5
	},
	[22] = {
		effectLimit = 1,
		drawTriggerType = 3,
		libID = 22503,
		startCount = 1,
		id = 22,
		selected = 1,
		drawTriggerTimes = 1,
		unselected = 0
	},
	[23] = {
		id = 23,
		libID = 22503,
		drawTriggerTimes = 1,
		drawTriggerType = 0
	},
	[31] = {
		weightStart = 0.013,
		drawTriggerType = 1,
		libID = 22504,
		weightEnd = 0.02,
		id = 31,
		startCount = 2,
		drawTriggerTimes = 2,
		selected = 4.5
	},
	[32] = {
		effectLimit = 1,
		drawTriggerType = 3,
		libID = 22504,
		startCount = 1,
		id = 32,
		selected = 1,
		drawTriggerTimes = 1,
		unselected = 0
	},
	[33] = {
		id = 33,
		libID = 22504,
		drawTriggerTimes = 1,
		drawTriggerType = 0
	},
	[41] = {
		weightStart = 0.013,
		drawTriggerType = 1,
		libID = 22505,
		weightEnd = 0.02,
		id = 41,
		startCount = 2,
		drawTriggerTimes = 2,
		selected = 4.5
	},
	[42] = {
		effectLimit = 1,
		drawTriggerType = 3,
		libID = 22505,
		startCount = 1,
		id = 42,
		selected = 1,
		drawTriggerTimes = 1,
		unselected = 0
	},
	[43] = {
		id = 43,
		libID = 22505,
		drawTriggerTimes = 1,
		drawTriggerType = 0
	},
	__default = {
		__index = {
			effectLimit = 0,
			libID = 0,
			weightStart = 0,
			probInit = 0,
			selected = 2,
			probLimit = 0.2,
			drawTriggerTimes = 0,
			probEffectInterval = 50,
			weightEnd = 0,
			drawTriggerType = 2,
			probStep = 0.01,
			unselected = 1,
			startCount = 0,
			probMiniTimes = 30
		}
	}
}

return csv.draw_chip_dynamic
