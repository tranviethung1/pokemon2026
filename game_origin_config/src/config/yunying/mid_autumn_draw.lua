slot0 = {
	{
		__size = 0
	},
	{
		__size = 1,
		libs = {
			10121,
			10122,
			10123,
			10124
		}
	},
	{
		gold = "1,209=12,402=10",
		__size = 1
	},
	{
		__size = 1,
		libs = {
			10131,
			10132,
			10133,
			10134
		}
	},
	__size = 4
}
slot1 = {
	slot0[2],
	slot0[2],
	default = slot0[1],
	[3] = slot0[2],
	[5] = slot0[2],
	[4] = slot0[2],
	[6] = slot0[2]
}
slot2 = {
	slot0[3],
	default = slot0[1]
}
slot3 = {
	default = slot0[1],
	[3] = slot0[4],
	[2] = slot0[4],
	[5] = slot0[4],
	[4] = slot0[4],
	[6] = slot0[4]
}
slot4 = {
	default = slot0[1],
	[6] = slot0[3]
}
csv.yunying.mid_autumn_draw = {
	{
		roundDrawTimes = 1,
		huodongID = 1001,
		id = 1,
		commonPoolID = slot1[1],
		common = slot2[1]
	},
	{
		bestPoolProb = 10,
		roundDrawTimes = 2,
		huodongID = 1001,
		id = 2,
		bestPoolMaxTimes = 1,
		commonPoolID = slot1[2],
		bestPoolID = slot3[2]
	},
	{
		bestPoolProb = 10,
		roundDrawTimes = 3,
		huodongID = 1001,
		id = 3,
		bestPoolMaxTimes = 1,
		commonPoolID = slot1[3],
		bestPoolID = slot3[3]
	},
	{
		bestPoolProb = 30,
		roundDrawTimes = 4,
		huodongID = 1001,
		id = 4,
		bestPoolMaxTimes = 3,
		commonPoolID = slot1[4],
		bestPoolID = slot3[4]
	},
	{
		bestPoolProb = 60,
		roundDrawTimes = 5,
		huodongID = 1001,
		id = 5,
		bestPoolMaxTimes = 5,
		commonPoolID = slot1[5],
		bestPoolID = slot3[5]
	},
	{
		bestPoolProb = 100,
		roundDrawTimes = 6,
		huodongID = 1001,
		id = 6,
		bestPoolMaxTimes = 99999,
		commonPoolID = slot1[6],
		bestPoolID = slot3[6],
		best = slot4[6]
	},
	__size = 6,
	__default = {
		__index = {
			bestPoolProb = 0,
			roundDrawTimes = 0,
			huodongID = 0,
			bestPoolMaxTimes = 0,
			commonPoolID = slot1.default,
			bestPoolID = slot3.default,
			common = slot2.default,
			best = slot4.default
		}
	}
}

return csv.yunying.mid_autumn_draw
