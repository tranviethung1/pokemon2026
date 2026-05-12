slot0 = {
	{
		__size = 0
	},
	__size = 2,
	[3] = {
		{
			100,
			2300
		}
	}
}
csv.cross.online_fight.base = {
	{
		limitedBanScore = 501,
		awardTime = 2030,
		awardTime_en = 2230,
		matchTimeMax = 200,
		winStreakCount = 3,
		weeklyTarget = 2,
		failStreakCount = 3,
		matchTime = 6,
		normalMatchTimeout = 60,
		id = 1,
		expandLimitedOpenScore = 1800,
		servOpenDays = 38,
		battleWinAward = {
			gold = 30000,
			coin12 = 1000,
			__size = 2
		},
		battleFailAward = {
			gold = 15000,
			coin12 = 500,
			__size = 2
		},
		openTime = {
			{
				1200,
				2000
			}
		},
		openTime_en = {
			{
				1200,
				2200
			}
		},
		topBattleHistoryPeriods = {
			13,
			14,
			15,
			16,
			17,
			18,
			19,
			20
		}
	},
	__size = 1,
	__default = {
		__index = {
			limitedBanScore = 200,
			weeklyAwardLeastTimes = 3,
			matchTime = 0,
			awardTime_en = 2200,
			leastCardNum = 12,
			matchTimeMax = 0,
			awardTime = 2200,
			limitedTopBattleRank = 100,
			expandLimitedOpenScore = 100,
			weeklyTarget = 1,
			expandUnlimitedOpenScore = 100,
			mostCardNum = 36,
			longMatchTimeout = 300,
			expandLimitedOpen = false,
			normalMatchTimeout = 30,
			expandLimitedOpen_en = false,
			unlimitedTopBattleRank = 100,
			expandUnlimitedOpen = false,
			battleWinAward = ({
				default = slot0[1]
			}).default,
			battleFailAward = ({
				default = slot0[1]
			}).default,
			openWeekday = {
				1,
				2,
				3,
				4,
				5,
				6,
				7
			},
			openTime = ({
				default = slot0[3]
			}).default,
			openTime_en = ({
				default = slot0[3]
			}).default,
			topBattleHistoryPeriods = {}
		}
	}
}

return csv.cross.online_fight.base
