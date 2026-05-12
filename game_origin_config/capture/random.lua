slot0 = {
	__size = 1,
	[5] = {
		[3.0] = 1,
		__size = 1
	}
}
slot1 = {
	[4] = slot0[5],
	[7] = slot0[5]
}
csv.capture.random = {
	{
		effectLimit = 150,
		drawTriggerType = 0,
		drawType = "default",
		id = 1,
		drawTriggerTimes = 1,
		libs = {
			70,
			30,
			__size = 2
		}
	},
	{
		effectLimit = 150,
		drawTriggerType = 0,
		drawType = "default",
		id = 2,
		drawTriggerTimes = 151,
		libs = {
			65,
			35,
			__size = 2
		}
	},
	{
		drawTriggerType = 0,
		drawType = "default",
		id = 3,
		drawTriggerTimes = 301,
		libs = {
			60,
			40,
			__size = 2
		}
	},
	{
		drawTriggerType = 4,
		drawType = "default",
		id = 4,
		drawTriggerTimes = 12,
		libs = slot1[4]
	},
	__size = 5,
	[7] = {
		drawType = "default",
		id = 7,
		probLimit = 0.6,
		startCount = 22,
		probStep = 0.02,
		probMiniTimes = 40,
		libs = slot1[7]
	},
	__default = {
		__index = {
			effectLimit = 0,
			drawType = "",
			weightStart = 0,
			probInit = 0,
			probStep = 0.01,
			probLimit = 0.2,
			drawTriggerTimes = 0,
			probEffectInterval = 50,
			weightEnd = 0,
			drawTriggerType = 2,
			startCount = 0,
			probMiniTimes = 30,
			libs = {
				__size = 0
			}
		}
	}
}

return csv.capture.random
