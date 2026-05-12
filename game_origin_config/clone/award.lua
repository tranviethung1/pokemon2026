slot0 = {
	__size = 1,
	[3] = {
		1004,
		1005
	}
}
slot1 = {
	[3] = slot0[3],
	[2] = slot0[3]
}
csv.clone.award = {
	{
		id = 1,
		randWeight = 300,
		dropLib = {
			1003,
			1004,
			1005
		}
	},
	{
		id = 2,
		dropNum = 1,
		randWeight = 680,
		dropLib = slot1[2]
	},
	{
		id = 3,
		dropNum = 2,
		randWeight = 20,
		dropLib = slot1[3]
	},
	__size = 3,
	__default = {
		__index = {
			dropNum = 0,
			randWeight = 0,
			dropLib = {}
		}
	}
}

return csv.clone.award
