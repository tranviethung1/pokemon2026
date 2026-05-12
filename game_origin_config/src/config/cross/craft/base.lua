slot0 = {
	{
		__size = 0
	},
	__size = 1
}
csv.cross.craft.base = {
	{
		championBetGold = 300000,
		maxBetWinCoin = 1500,
		betRateFixGold = 1,
		championBetCoin = 200,
		top4BetGold = 200000,
		minBetRateGold = 2.5,
		betRateFixCoin = 1,
		maxBetWinGold = 1500000,
		preBetGold = 200000,
		autoSignVIP = 5,
		minBetRateCoin = 2,
		id = 1,
		servOpenDays = 30,
		winAward = {
			__size = 1,
			[6017.0] = 1
		},
		failAward = {
			__size = 1,
			[6018.0] = 1
		},
		preBetExtraAward = {
			gold = 300000,
			__size = 2,
			coin8 = 200
		},
		top4BetExtraAward = {
			gold = 300000,
			__size = 2,
			coin8 = 300
		}
	},
	__size = 1,
	__default = {
		__index = {
			damageScoreRatio = 1000,
			championBetGold = 50000,
			preBetGold = 50000,
			championBetCoin = 100,
			preBetCoin = 100,
			top4BetGold = 50000,
			top4BetCoin = 100,
			winAward = ({
				default = slot0[1]
			}).default,
			failAward = ({
				default = slot0[1]
			}).default,
			preBetExtraAward = ({
				default = slot0[1]
			}).default,
			top4BetExtraAward = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.cross.craft.base
