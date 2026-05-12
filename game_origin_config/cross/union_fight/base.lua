slot0 = {
	{
		__size = 0
	},
	__size = 1
}
csv.cross.union_fight.base = {
	{
		unionLevel = 4,
		id = 1,
		roleLevel = 50,
		servOpenDays = 30,
		preBetCost = {
			coin3 = 500,
			__size = 1
		},
		preBetWinAward = {
			coin3 = 300,
			__size = 1
		},
		preBetFailAward = {
			gold = 200000,
			rmb = 50,
			coin3 = 600,
			__size = 3
		},
		top4BetCost = {
			gold = 100000,
			rmb = 20,
			coin3 = 200,
			__size = 3
		},
		top4BetWinAward = {
			coin3 = 1500,
			__size = 1
		},
		top4BetFailAward = {
			coin3 = 3000,
			rmb = 100,
			__size = 4,
			gold = 600000,
			[502.0] = 2
		},
		extraAward = {
			gold = 200000,
			rmb = 30,
			coin3 = 800,
			__size = 3
		}
	},
	__size = 1,
	__default = {
		__index = {
			unionLevel = 0,
			roleLevel = 0,
			preBetCost = ({
				default = slot0[1]
			}).default,
			preBetWinAward = ({
				default = slot0[1]
			}).default,
			preBetFailAward = ({
				default = slot0[1]
			}).default,
			top4BetCost = ({
				default = slot0[1]
			}).default,
			top4BetWinAward = ({
				default = slot0[1]
			}).default,
			top4BetFailAward = ({
				default = slot0[1]
			}).default,
			extraAward = ({
				default = slot0[1]
			}).default,
			sceneCount = {
				1,
				1,
				5
			},
			roundLimit = {
				20,
				10,
				10
			},
			attrCorrectMap = {
				100028,
				100029,
				100030
			}
		}
	}
}

return csv.cross.union_fight.base
