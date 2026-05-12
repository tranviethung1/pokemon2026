slot0 = {
	__size = 0
}
csv.cross.online_fight.weekly_target = {
	{
		id = 1,
		count = 3,
		type = 1,
		award = {
			gold = 100000,
			coin12 = 1500,
			rmb = 20,
			__size = 3
		}
	},
	{
		id = 2,
		count = 8,
		type = 2,
		award = {
			gold = 200000,
			coin12 = 3000,
			__size = 3,
			[502.0] = 1
		}
	},
	__size = 2,
	__default = {
		__index = {
			count = 999,
			type = 0,
			award = {
				__size = 0
			}
		}
	}
}

return csv.cross.online_fight.weekly_target
