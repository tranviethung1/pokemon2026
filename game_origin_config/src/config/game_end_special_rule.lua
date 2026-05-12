slot0 = {
	__size = 1,
	[3] = {
		3642727,
		3642731
	}
}
slot1 = {
	[3] = slot0[3],
	[2] = slot0[3],
	[4] = slot0[3]
}
csv.game_end_special_rule = {
	{
		markID = 2391,
		id = 1,
		buffID = {
			2391127,
			2391162
		}
	},
	{
		markID = 3641,
		id = 2,
		buffID = slot1[2]
	},
	{
		markID = 3642,
		id = 3,
		buffID = slot1[3]
	},
	{
		markID = 3643,
		id = 4,
		buffID = slot1[4]
	},
	{
		markID = 1281,
		id = 5,
		buffID = {
			1281121,
			1281131
		}
	},
	__size = 5,
	__default = {
		__index = {
			buffID = {}
		}
	}
}

return csv.game_end_special_rule
