slot0 = {
	__size = 0
}
csv.town.home_like_award = {
	__size = 4,
	[101] = {
		id = 101,
		taskParam = 3,
		award = {
			gold = 100000,
			[8203.0] = 300,
			[8202.0] = 300,
			__size = 3
		}
	},
	[102] = {
		id = 102,
		taskParam = 6,
		award = {
			gold = 150000,
			[8203.0] = 600,
			[8202.0] = 600,
			__size = 3
		}
	},
	[103] = {
		id = 103,
		taskParam = 10,
		award = {
			gold = 200000,
			__size = 3,
			[8201.0] = 1000,
			[502.0] = 2
		}
	},
	[104] = {
		id = 104,
		taskParam = 15,
		award = {
			gold = 300000,
			coin16 = 200,
			rmb = 50,
			__size = 3
		}
	},
	__default = {
		__index = {
			taskParam = 9999,
			award = {
				__size = 0
			}
		}
	}
}

return csv.town.home_like_award
