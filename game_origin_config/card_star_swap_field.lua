slot0 = {
	__size = 1,
	[2] = {
		3
	}
}
slot1 = {
	slot0[2],
	[3] = slot0[2]
}
csv.card_star_swap_field = {
	{
		id = 1,
		unlockType = 1,
		chillDown = 36,
		rarities = slot1[1]
	},
	{
		id = 2,
		unlockType = 1,
		chillDown = 72,
		rarities = {
			4
		}
	},
	{
		unlockType = 1,
		chillDown = 36,
		unlockParam = 6,
		id = 3,
		rarities = slot1[3]
	},
	__size = 3,
	__default = {
		__index = {
			unlockType = 0,
			chillDown = 0,
			unlockParam = 0,
			rarities = {
				3,
				4
			}
		}
	}
}

return csv.card_star_swap_field
