slot0 = {
	__size = 0
}
csv.homeland.home = {
	{
		id = 1,
		name = "room1",
		roleNum = 2,
		unLockLv = {
			1,
			5
		}
	},
	{
		id = 2,
		name = "room2",
		roleNum = 3,
		unLockLv = {
			2,
			6
		}
	},
	{
		id = 3,
		name = "room3",
		roleNum = 4,
		unLockLv = {
			3,
			7
		}
	},
	{
		id = 4,
		name = "room4",
		roleNum = 5,
		unLockLv = {
			4,
			8
		}
	},
	__size = 4,
	__default = {
		__index = {
			roleNum = 1,
			unLockLv = {},
			defaultIDs = {
				__size = 2,
				wall = 51001,
				floor = 50001
			}
		}
	}
}

return csv.homeland.home
