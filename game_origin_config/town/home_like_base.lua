slot0 = {
	__size = 0
}
csv.town.home_like_base = {
	{
		likedAwardLimit = 100,
		weeklyLikeLimit = 30,
		visitHistoryLimit = 30,
		crossRankRequir = 240,
		visitDelay = 300,
		decorateReachValue = 200,
		likedNum = 10,
		id = 1,
		likedAward = {
			gold = 100000,
			[4000.0] = 5,
			rmb = 10,
			__size = 3
		},
		likedAwardRange = {
			{
				10,
				100
			},
			{
				20,
				50
			},
			{
				30,
				30
			},
			{
				50,
				20
			}
		},
		randomScale = {
			3,
			5,
			2
		}
	},
	__size = 1,
	__default = {
		__index = {
			groupFixVal = 0,
			weeklyLikeLimit = 0,
			visitHistoryLimit = 10,
			crossRankRequir = 9999999,
			visitDelay = 3600,
			decorateReachValue = 0,
			likedAwardLimit = 0,
			likedNum = 9999,
			likedAward = {
				__size = 0
			},
			likedAwardRange = {}
		}
	}
}

return csv.town.home_like_base
