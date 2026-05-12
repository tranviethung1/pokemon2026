slot0 = {
	{},
	__size = 1
}
csv.craft.base = {
	{
		damageScoreRatio = 500,
		servOpenDays = 9,
		maxBetWin = 1000000,
		minBetRate = 2,
		autoSignVIP = 4,
		numMax = 3000,
		betRateFix = 1,
		id = 1,
		winAward = {
			{
				1,
				72,
				{
					[6005.0] = 1,
					__size = 1
				}
			},
			{
				73,
				150,
				{
					[6007.0] = 1,
					__size = 1
				}
			}
		},
		failAward = {
			{
				1,
				72,
				{
					[6006.0] = 1,
					__size = 1
				}
			},
			{
				73,
				150,
				{
					[6008.0] = 1,
					__size = 1
				}
			}
		}
	},
	__size = 1,
	__default = {
		__index = {
			damageScoreRatio = 1000,
			winAward = ({
				default = slot0[1]
			}).default,
			failAward = ({
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
			}
		}
	}
}

return csv.craft.base
