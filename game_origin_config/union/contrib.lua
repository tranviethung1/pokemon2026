slot0 = {
	__size = 0
}
csv.union.contrib = {
	{
		title = "contribute1",
		id = 1,
		contrib = 50,
		cost = {
			gold = 30000,
			__size = 1
		},
		award = {
			coin3 = 50,
			__size = 1
		}
	},
	{
		title = "contribute2",
		id = 2,
		contrib = 100,
		cost = {
			__size = 1,
			rmb = 30
		},
		award = {
			coin3 = 100,
			__size = 1
		}
	},
	{
		vipNeed = 5,
		contrib = 250,
		id = 3,
		title = "contribute3",
		cost = {
			__size = 1,
			rmb = 100
		},
		award = {
			coin3 = 250,
			__size = 1
		}
	},
	__size = 3,
	__default = {
		__index = {
			vipNeed = 0,
			title = "",
			contrib = 1,
			cost = {
				__size = 0
			},
			award = {
				gold = 100,
				__size = 1
			}
		}
	}
}

return csv.union.contrib
