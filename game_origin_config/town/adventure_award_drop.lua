slot0 = {
	{
		__size = 0
	},
	{
		[8545.0] = 1,
		__size = 1
	},
	{
		__size = 1,
		[8515.0] = 1
	},
	{
		__size = 1,
		[8535.0] = 1
	},
	{
		__size = 1,
		[8525.0] = 1
	},
	{
		[8544.0] = 1,
		__size = 1
	},
	{
		__size = 1,
		[8514.0] = 1
	},
	{
		__size = 1,
		[8534.0] = 1
	},
	{
		__size = 1,
		[8524.0] = 1
	},
	{
		__size = 1,
		[8580.0] = 1
	},
	__size = 10
}
slot1 = {
	slot0[2],
	[11] = slot0[2],
	[21] = slot0[2],
	[32] = slot0[10],
	[31] = slot0[6],
	[41] = slot0[6],
	default = slot0[1]
}
slot2 = {
	slot0[3],
	[11] = slot0[3],
	[21] = slot0[3],
	[32] = slot0[10],
	[31] = slot0[7],
	[41] = slot0[7],
	default = slot0[1]
}
slot3 = {
	slot0[4],
	[11] = slot0[4],
	[21] = slot0[4],
	[32] = slot0[10],
	[31] = slot0[8],
	[41] = slot0[8],
	default = slot0[1]
}
slot4 = {
	slot0[5],
	[11] = slot0[5],
	[21] = slot0[5],
	[32] = slot0[10],
	[31] = slot0[9],
	[41] = slot0[9],
	default = slot0[1]
}
csv.town.adventure_award_drop = {
	{
		weightStart = 0.054,
		startCount = 10,
		drawTriggerTimes = 11,
		weightEnd = 0.113,
		drawTriggerType = 1,
		id = 1,
		awardArea4 = slot1[1],
		awardArea1 = slot2[1],
		awardArea3 = slot3[1],
		awardArea2 = slot4[1]
	},
	__size = 8,
	[11] = {
		weightStart = 0.05,
		effectLimit = 1,
		startCount = 6,
		drawTriggerTimes = 6,
		weightEnd = 0.45,
		drawTriggerType = 1,
		id = 11,
		awardArea4 = slot1[11],
		awardArea1 = slot2[11],
		awardArea3 = slot3[11],
		awardArea2 = slot4[11]
	},
	[21] = {
		weightStart = 0.3,
		effectLimit = 1,
		startCount = 2,
		drawTriggerTimes = 1,
		weightEnd = 0.4,
		drawTriggerType = 1,
		id = 21,
		awardArea4 = slot1[21],
		awardArea1 = slot2[21],
		awardArea3 = slot3[21],
		awardArea2 = slot4[21]
	},
	[31] = {
		weightStart = 0.05,
		startCount = 1,
		drawTriggerTimes = 1,
		weightEnd = 0.45,
		drawTriggerType = 1,
		id = 31,
		awardArea4 = slot1[31],
		awardArea1 = slot2[31],
		awardArea3 = slot3[31],
		awardArea2 = slot4[31]
	},
	[32] = {
		weightStart = 0.05,
		startCount = 1,
		drawTriggerTimes = 1,
		weightEnd = 0.45,
		drawTriggerType = 1,
		id = 32,
		awardArea4 = slot1[32],
		awardArea1 = slot2[32],
		awardArea3 = slot3[32],
		awardArea2 = slot4[32]
	},
	[41] = {
		effectLimit = 1,
		drawTriggerType = 3,
		id = 41,
		drawTriggerTimes = 2,
		awardArea4 = slot1[41],
		awardArea1 = slot2[41],
		awardArea3 = slot3[41],
		awardArea2 = slot4[41]
	},
	[51] = {
		effectLimit = 1,
		drawTriggerType = 3,
		id = 51,
		drawTriggerTimes = 1,
		awardArea4 = {
			__size = 1,
			[8543.0] = 1
		},
		awardArea1 = {
			__size = 1,
			[8513.0] = 1
		},
		awardArea3 = {
			__size = 1,
			[8533.0] = 1
		},
		awardArea2 = {
			__size = 1,
			[8523.0] = 1
		}
	},
	[61] = {
		id = 61,
		drawTriggerTimes = 2
	},
	__default = {
		__index = {
			weightStart = 0,
			effectLimit = 0,
			probLimit = 0.2,
			startCount = 0,
			probStep = 0.01,
			drawType = "town_adventure1",
			weightEnd = 0,
			drawTriggerType = 0,
			drawTriggerTimes = 0,
			probEffectInterval = 50,
			probInit = 0,
			probMiniTimes = 30,
			awardArea4 = slot1.default,
			awardArea1 = slot2.default,
			awardArea3 = slot3.default,
			awardArea2 = slot4.default
		}
	}
}

return csv.town.adventure_award_drop
