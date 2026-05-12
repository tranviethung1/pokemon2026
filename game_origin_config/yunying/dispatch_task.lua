slot0 = {
	{
		__size = 0
	},
	__size = 2,
	[3] = {
		gold = 50000,
		[8118.0] = 3,
		__size = 3,
		[20701.0] = 1
	}
}
slot2 = {
	default = slot0[1],
	[3] = slot0[3],
	[2] = slot0[3],
	[5] = slot0[3],
	[4] = slot0[3],
	[6] = slot0[3]
}
csv.yunying.dispatch_task = {
	{
		desc_th = "Log in today",
		taskType = 17,
		type = 5,
		desc_en = "Log in today",
		desc = "Log in today",
		huodongID = 101056,
		taskParam = 1,
		id = 1,
		desc_vn = "Log in today",
		desc_kr = "Log in today",
		award = {
			[8118.0] = 3,
			gold = 50000,
			__size = 2
		}
	},
	{
		desc_th = "Upgrade any Elf 10 times",
		taskType = 36,
		type = 5,
		goTo = "strengthen",
		desc_en = "Upgrade any Elf 10 times",
		desc = "Upgrade any Elf 10 times",
		huodongID = 101056,
		taskParam = 10,
		id = 2,
		desc_vn = "Upgrade any Elf 10 times",
		desc_kr = "Upgrade any Elf 10 times",
		award = slot2[2]
	},
	{
		desc_th = "A total of 5 battles in the arena",
		taskType = 41,
		type = 5,
		goTo = "arena",
		desc_en = "A total of 5 battles in the arena",
		desc = "A total of 5 battles in the arena",
		huodongID = 101056,
		taskParam = 5,
		id = 3,
		desc_vn = "A total of 5 battles in the arena",
		desc_kr = "A total of 5 battles in the arena",
		award = slot2[3]
	},
	{
		desc_th = "Challenge elite levels 10 times",
		taskType = 30,
		type = 5,
		goTo = "20000",
		desc_en = "Challenge elite levels 10 times",
		desc = "Challenge elite levels 10 times",
		huodongID = 101056,
		taskParam = 10,
		id = 4,
		desc_vn = "Challenge elite levels 10 times",
		desc_kr = "Challenge elite levels 10 times",
		award = slot2[4]
	},
	{
		desc_th = "Collect treasure 5 times",
		taskType = 18,
		type = 5,
		goTo = "gainGold",
		desc_en = "Collect treasure 5 times",
		desc = "Collect treasure 5 times",
		huodongID = 101056,
		taskParam = 5,
		id = 5,
		desc_vn = "Collect treasure 5 times",
		desc_kr = "Collect treasure 5 times",
		award = slot2[5]
	},
	{
		desc_th = "Total consumption of 200 diamonds",
		taskType = 21,
		type = 5,
		desc_en = "Total consumption of 200 diamonds",
		desc = "Total consumption of 200 diamonds",
		huodongID = 101056,
		taskParam = 200,
		id = 6,
		desc_vn = "Total consumption of 200 diamonds",
		desc_kr = "Total consumption of 200 diamonds",
		award = slot2[6]
	},
	__size = 6,
	__default = {
		__index = {
			taskType = 0,
			desc_th = "",
			type = 0,
			desc_en = "",
			goTo = "",
			desc = "",
			huodongID = 0,
			taskParam = 0,
			desc_vn = "",
			desc_kr = "",
			taskSpecialParam = ({
				default = slot0[1]
			}).default,
			award = slot2.default
		}
	}
}

return csv.yunying.dispatch_task
