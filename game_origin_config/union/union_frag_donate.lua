slot0 = {
	__size = 1,
	[2] = {
		gold = 5000,
		__size = 1
	}
}
slot1 = {
	slot0[2],
	slot0[2]
}
csv.union.union_frag_donate = {
	{
		id = 1,
		award = slot1[1]
	},
	{
		id = 2,
		award = slot1[2]
	},
	{
		id = 3,
		point = 15,
		award = {
			coin5 = 2,
			gold = 15000,
			__size = 2
		}
	},
	{
		id = 4,
		point = 20,
		award = {
			coin5 = 5,
			gold = 15000,
			__size = 2
		}
	},
	{
		id = 5,
		totalmax = 2,
		point = 30,
		award = {
			coin5 = 10,
			gold = 25000,
			__size = 2
		}
	},
	{
		id = 6,
		totalmax = 1,
		point = 40,
		award = {
			coin5 = 30,
			gold = 50000,
			__size = 2
		}
	},
	__size = 6,
	__default = {
		__index = {
			point = 10,
			totalmax = 3,
			award = {
				__size = 0
			}
		}
	}
}

return csv.union.union_frag_donate
