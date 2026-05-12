slot0 = {
	{
		gold = 2000,
		coin1 = 480,
		rmb = 500,
		__size = 3
	},
	{
		gold = 3000,
		coin1 = 700,
		rmb = 1000,
		__size = 3
	}
}
csv.aid.aid = {
	{
		id = 1,
		stageSequenceID = 1,
		levelSequenceID = 1,
		awakeSequenceID = 1,
		activeCost = slot0[1],
		awakeCost = slot0[1]
	},
	{
		id = 2,
		stageSequenceID = 1,
		levelSequenceID = 1,
		awakeSequenceID = 1,
		activeCost = slot0[2],
		awakeCost = slot0[1]
	},
	__size = 9,
	[11] = {
		id = 11,
		stageSequenceID = 1,
		levelSequenceID = 1,
		awakeSequenceID = 1,
		activeCost = slot0[2],
		awakeCost = slot0[1]
	},
	[12] = {
		id = 12,
		stageSequenceID = 1,
		levelSequenceID = 1,
		awakeSequenceID = 1,
		activeCost = slot0[2],
		awakeCost = slot0[1]
	},
	[13] = {
		id = 13,
		stageSequenceID = 1,
		levelSequenceID = 1,
		awakeSequenceID = 1,
		activeCost = slot0[2],
		awakeCost = slot0[1]
	},
	[21] = {
		id = 21,
		stageSequenceID = 1,
		levelSequenceID = 1,
		awakeSequenceID = 1,
		activeCost = slot0[2],
		awakeCost = slot0[1]
	},
	[22] = {
		id = 22,
		stageSequenceID = 1,
		levelSequenceID = 1,
		awakeSequenceID = 1,
		activeCost = slot0[2],
		awakeCost = slot0[1]
	},
	[1971] = {
		id = 1971,
		stageSequenceID = 1,
		levelSequenceID = 1,
		awakeSequenceID = 1,
		activeCost = slot0[2],
		awakeCost = slot0[1]
	},
	[1972] = {
		id = 1972,
		stageSequenceID = 1,
		levelSequenceID = 1,
		awakeSequenceID = 1,
		activeCost = slot0[2],
		awakeCost = slot0[1]
	},
	__default = {
		__index = {
			activeDemandLevel = 75,
			levelSequenceID = 0,
			activeDemandAdvance = 10,
			stageSequenceID = 0,
			activeDemandStar = 8,
			awakeDemandAidLevel = 2,
			awakeSequenceID = 0,
			awakeDemandAidStage = 2,
			activeCost = {
				__size = 0
			},
			awakeCost = {
				__size = 0
			}
		}
	}
}

return csv.aid.aid
