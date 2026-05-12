slot0 = {
	[2] = {
		500,
		1500
	},
	[3] = {
		20,
		1500
	},
	[4] = {
		20,
		1000
	},
	[5] = {
		10,
		1000
	},
	[6] = {
		0.13,
		0.2
	}
}
csv.auto_chess.base = {
	{
		timesLimitStart = 3,
		failWeights = 15,
		resumeCount2 = 5,
		newbieCards = "c.newCards()",
		failCdTimes = 2,
		newbieTimes = 3,
		newbieWeights = 20,
		timesLimit = 5,
		refreshDay = 1,
		timesLimit2 = 10,
		id = 1,
		failCards = "c.cards5_equips5_cards6_equips6()",
		trainers = {
			200002,
			200003
		},
		pvpWinPoint = slot0[2],
		pvpDamagePoint = slot0[3],
		pveHpPoint = slot0[4],
		pveCoinPoint = slot0[5],
		failWeight = slot0[6]
	},
	{
		timesLimitStart = 3,
		failWeights = 15,
		resumeCount2 = 5,
		newbieCards = "c.newCards()",
		failCdTimes = 2,
		newbieTimes = 3,
		newbieWeights = 20,
		timesLimit = 5,
		refreshDay = 1,
		timesLimit2 = 10,
		id = 2,
		failCards = "c.cards5_equips5_cards6_equips6()",
		trainers = {
			200001,
			200002
		},
		pvpWinPoint = slot0[2],
		pvpDamagePoint = slot0[3],
		pveHpPoint = slot0[4],
		pveCoinPoint = slot0[5],
		failWeight = slot0[6]
	},
	{
		timesLimitStart = 3,
		failWeights = 15,
		resumeCount2 = 5,
		newbieCards = "c.newCards()",
		failCdTimes = 2,
		newbieTimes = 3,
		newbieWeights = 20,
		timesLimit = 5,
		refreshDay = 1,
		timesLimit2 = 10,
		id = 3,
		failCards = "c.cards5_equips5_cards6_equips6()",
		trainers = {
			200001,
			200003
		},
		pvpWinPoint = slot0[2],
		pvpDamagePoint = slot0[3],
		pveHpPoint = slot0[4],
		pveCoinPoint = slot0[5],
		failWeight = slot0[6]
	},
	{
		timesLimitStart = 3,
		failWeights = 15,
		resumeCount2 = 5,
		newbieCards = "c.newCards()",
		failCdTimes = 2,
		newbieTimes = 3,
		newbieWeights = 20,
		timesLimit = 5,
		refreshDay = 1,
		timesLimit2 = 10,
		id = 4,
		failCards = "c.cards5_equips5_cards6_equips6()",
		trainers = {
			200002,
			200004
		},
		pvpWinPoint = slot0[2],
		pvpDamagePoint = slot0[3],
		pveHpPoint = slot0[4],
		pveCoinPoint = slot0[5],
		failWeight = slot0[6]
	},
	__size = 4,
	__default = {
		__index = {
			resumeCount2 = 1,
			newbieTimes = 5,
			resumeCount = 1,
			timesLimit = 0,
			failCdTimes = 5,
			timesLimit2 = 0,
			refreshDay2 = 1,
			trainers = {},
			pvpWinPoint = {},
			pvpDamagePoint = {},
			pveHpPoint = {},
			pveCoinPoint = {},
			failWeight = {
				0,
				0
			}
		}
	}
}

return csv.auto_chess.base
