slot0 = {
	{
		__size = 0
	},
	__size = 1
}
csv.union_fight.base = {
	{
		failPoint = 1,
		betRateFix = 1,
		maxBetWin = 1000000,
		minBetRate = 2,
		autoSignVIP = 4,
		winLimit = 6,
		id = 1,
		winPoint = 2,
		servOpenDays = 14,
		preSignAward = {
			gold = 100000,
			rmb = 20,
			__size = 3,
			[5503.0] = 5
		},
		finalSignAward = {
			gold = 200000,
			rmb = 50,
			[5504.0] = 5,
			__size = 3
		},
		winAward = {
			__size = 1,
			[5503.0] = 1
		}
	},
	__size = 1,
	__default = {
		__index = {
			preSignAward = ({
				default = slot0[1]
			}).default,
			finalSignAward = ({
				default = slot0[1]
			}).default,
			winAward = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.union_fight.base
