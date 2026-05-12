slot0 = {
	__size = 1,
	[4] = {
		yard = 77007,
		wall = 71001,
		floor = 70001,
		__size = 3
	}
}
slot1 = {
	[5] = slot0[4],
	[6] = slot0[4]
}
csv.town.home = {
	{
		cardNum = 3,
		reply = 15,
		id = 1,
		isNewFurn = true,
		defaultLayout = {
			{
				70506,
				23,
				17,
				9,
				1
			},
			{
				72002,
				25,
				16,
				5,
				0
			},
			{
				75505,
				24,
				6,
				20,
				1
			},
			{
				71001,
				22
			},
			{
				70001,
				21
			}
		}
	},
	{
		cardNum = 5,
		notice2 = "Energy recovery rate up to 17 points/hour",
		reply = 17,
		notice1 = "Rest locations up to 5",
		id = 2,
		isNewFurn = true,
		unLockArea = 2
	},
	{
		cardNum = 7,
		notice2 = "Energy recovery rate up to 19 points/hour",
		reply = 19,
		notice1 = "Rest locations up to 7",
		id = 3,
		isNewFurn = true,
		unLockArea = 2
	},
	{
		cardNum = 9,
		notice2 = "Energy recovery rate up to 21 points/hour",
		reply = 21,
		notice1 = "Rest locations up to 9",
		id = 4,
		unLockArea = 3
	},
	{
		cardNum = 11,
		notice2 = "Energy recovery rate up to 23 points/hour",
		reply = 23,
		notice1 = "Rest locations up to 11",
		id = 5,
		unLockArea = 3,
		defaultIDs = slot1[5]
	},
	{
		cardNum = 13,
		notice2 = "Energy recovery rate up to 25 points/hour",
		reply = 25,
		notice1 = "Rest locations up to 13",
		id = 6,
		unLockArea = 4,
		defaultIDs = slot1[6]
	},
	__size = 6,
	__default = {
		__index = {
			cardNum = 0,
			furnitureLimitNum = 999,
			isNewFurn = false,
			unLockArea = 1,
			notice2 = "",
			reply = 0,
			notice1 = "",
			defaultIDs = {
				yard = 77006,
				wall = 71001,
				floor = 70001,
				__size = 3
			},
			defaultLayout = {}
		}
	}
}

return csv.town.home
