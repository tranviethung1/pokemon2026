slot0 = {
	{
		gold = 200000,
		coin7 = 200,
		coin8 = 3000,
		__size = 3
	},
	{
		gold = 200000,
		[611.0] = 50,
		coin8 = 3000,
		__size = 3
	},
	{
		[5000.0] = 100,
		gold = 200000,
		coin8 = 3000,
		__size = 3
	},
	{
		gold = 600000,
		[501.0] = 1,
		coin8 = 9000,
		__size = 3
	},
	__size = 4
}
slot1 = {
	slot0[1],
	slot0[2],
	[3] = slot0[3],
	[5] = slot0[1],
	[4] = slot0[4],
	[7] = slot0[3],
	[6] = slot0[2],
	[8] = slot0[4]
}
csv.cross.supremacy.week_award = {
	{
		id = 1,
		fightTimes = 3,
		weekAward = slot1[1]
	},
	{
		id = 2,
		fightTimes = 6,
		weekAward = slot1[2]
	},
	{
		id = 3,
		fightTimes = 9,
		weekAward = slot1[3]
	},
	{
		id = 4,
		fightTimes = 12,
		weekAward = slot1[4]
	},
	{
		id = 5,
		fightTimes = 15,
		weekAward = slot1[5]
	},
	{
		id = 6,
		fightTimes = 18,
		weekAward = slot1[6]
	},
	{
		id = 7,
		fightTimes = 21,
		weekAward = slot1[7]
	},
	{
		id = 8,
		fightTimes = 24,
		weekAward = slot1[8]
	},
	__size = 8,
	__default = {
		__index = {}
	}
}

return csv.cross.supremacy.week_award
