slot0 = {
	__size = 0
}
csv.cross.hunting.base = {
	{
		id = 1,
		version = 1001,
		refreshDay = 2
	},
	{
		id = 2,
		version = 2001,
		refreshDay = 4
	},
	__size = 2,
	__default = {
		__index = {
			battleLimit = 5,
			boxOpenLimit = 3,
			version = 0,
			refreshDay = 1,
			rarityC = {
				0.8,
				0.9,
				1,
				1.15,
				1.3,
				__size = 5
			},
			heldItemC = {
				nil,
				1,
				1.05,
				1.15,
				1.25,
				__size = 4
			},
			zawakeC = {
				1,
				1.1,
				1.1,
				1.2,
				1.2,
				1.3,
				1.3,
				1.4,
				__size = 8
			}
		}
	}
}

return csv.cross.hunting.base
