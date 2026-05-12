slot0 = {
	{
		__size = 0
	},
	{
		gold = 60000,
		__size = 1
	},
	__size = 3,
	[6] = {
		gold = 100000,
		__size = 1
	}
}
slot2 = {
	slot0[2],
	default = slot0[1],
	[4] = slot0[2],
	[7] = slot0[6],
	[6] = slot0[6],
	[8] = slot0[2]
}
csv.yunying.collectcard = {
	{
		huodongID = 18001,
		taskParam = 32,
		id = 1,
		desc_en = "(From 1st Recharge)",
		goto = "firstRecharge",
		desc = "(From 1st Recharge)",
		award = slot2[1]
	},
	{
		huodongID = 18001,
		taskParam = 222,
		id = 2,
		desc_en = "(From V12 Giftpack)",
		goto = "recharge(2,12)",
		desc = "(From V12 Giftpack)",
		award = {
			gold = 120000,
			__size = 1
		}
	},
	{
		huodongID = 18001,
		id = 3,
		desc_en = "(2nd Day Login)",
		goto = "dengluraw",
		desc = "(2nd Day Login)",
		award = {
			gold = 20000,
			__size = 1
		}
	},
	{
		huodongID = 18001,
		taskParam = 51,
		id = 4,
		desc_en = "(3rd Day Login)",
		goto = "dengluraw",
		desc = "(3rd Day Login)",
		award = slot2[4]
	},
	{
		huodongID = 18001,
		taskParam = 322,
		id = 5,
		desc_en = "(From Daily Drawing)",
		goto = "chouka",
		desc = "(From Daily Drawing)",
		award = {
			gold = 80000,
			__size = 1
		}
	},
	{
		huodongID = 18001,
		taskParam = 272,
		id = 6,
		desc_en = "(From Daily Drawing)",
		goto = "chouka",
		desc = "(From Daily Drawing)",
		award = slot2[6]
	},
	{
		huodongID = 18001,
		taskParam = 162,
		id = 7,
		desc_en = "(Daily Discount Event)",
		goto = "chouka",
		desc = "(Daily Discount Event)",
		award = slot2[7]
	},
	{
		huodongID = 18001,
		taskParam = 352,
		id = 8,
		desc_en = "(From  Drawing)",
		goto = "chouka",
		desc = "(From  Drawing)",
		award = slot2[8]
	},
	__size = 8,
	__default = {
		__index = {
			desc = "",
			huodongID = 0,
			taskParam = 21,
			desc_en = "",
			goto = "",
			taskType = 35,
			taskSpecialParam = ({
				default = slot0[1]
			}).default,
			award = slot2.default
		}
	}
}

return csv.yunying.collectcard
