slot0 = {
	__size = 2,
	[2] = {
		[5000.0] = 3,
		gold = 5000,
		__size = 2
	},
	[3] = {
		gold = 5000,
		__size = 2,
		[930.0] = 3
	}
}
slot1 = {
	slot0[2],
	slot0[3]
}
slot2 = {
	slot0[2],
	slot0[3]
}
csv.online_gift = {
	{
		periods = 5,
		id = 1,
		award = slot2[1],
		awardShow = slot1[1]
	},
	{
		periods = 10,
		id = 2,
		award = slot2[2],
		awardShow = slot1[2]
	},
	{
		periods = 15,
		id = 3,
		award = {
			gold = 10000,
			[100.0] = 1,
			__size = 2
		},
		awardShow = {
			gold = 10000,
			__size = 2,
			[523.0] = 2
		}
	},
	{
		periods = 30,
		id = 4,
		randLib = 135,
		award = {
			gold = 10000,
			[451.0] = 5,
			__size = 2
		},
		awardShow = {
			[9999.0] = 1,
			[451.0] = 5,
			gold = 10000,
			__size = 3
		}
	},
	{
		periods = 60,
		id = 5,
		randLib = 135,
		award = {
			gold = 20000,
			[19.0] = 1,
			__size = 2
		},
		awardShow = {
			[9999.0] = 1,
			[19.0] = 1,
			gold = 10000,
			__size = 3
		}
	},
	__size = 5,
	__default = {
		__index = {
			periods = 0,
			randLib = 0,
			award = {
				__size = 0
			}
		}
	}
}

return csv.online_gift
