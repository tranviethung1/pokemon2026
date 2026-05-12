slot0 = {
	__size = 2,
	[3] = {
		showWeight = 7,
		speed = 8,
		cardName = "kabishou",
		life = 9,
		showSpeed = 3,
		cardId = 712,
		weight = 5.6,
		__size = 7
	},
	[4] = {
		showWeight = 4,
		speed = 10,
		cardName = "hero_jiaherenwa",
		life = 6,
		showSpeed = 5,
		cardId = 3303,
		weight = 4,
		__size = 7
	}
}
slot1 = {
	[3] = slot0[3],
	[13] = slot0[3],
	[4] = slot0[4],
	[14] = slot0[4]
}
csv.yunying.snowball_element = {
	{
		id = 1,
		huodongID = 101031,
		belongs = 1
	},
	{
		id = 2,
		huodongID = 101031,
		belongs = 2,
		attr = {
			value = 10,
			__size = 2,
			stayTime = 3
		}
	},
	{
		id = 3,
		huodongID = 101031,
		belongs = 3,
		attr = slot1[3]
	},
	{
		id = 4,
		huodongID = 101031,
		belongs = 3,
		attr = slot1[4]
	},
	{
		id = 5,
		huodongID = 101031,
		belongs = 3,
		attr = {
			showWeight = 2,
			speed = 12,
			cardName = "daodianfeishu",
			life = 3,
			showSpeed = 7,
			cardId = 2891,
			weight = 3,
			__size = 7
		}
	},
	__size = 10,
	[11] = {
		id = 11,
		huodongID = 10001,
		belongs = 1
	},
	[12] = {
		id = 12,
		huodongID = 10001,
		belongs = 2,
		attr = {
			value = 10,
			__size = 2,
			stayTime = 1.3
		}
	},
	[13] = {
		id = 13,
		huodongID = 10001,
		belongs = 3,
		attr = slot1[13]
	},
	[14] = {
		id = 14,
		huodongID = 10001,
		belongs = 3,
		attr = slot1[14]
	},
	[15] = {
		id = 15,
		huodongID = 10001,
		belongs = 3,
		attr = {
			showWeight = 2,
			speed = 13,
			cardName = "daodianfeishu",
			life = 3,
			showSpeed = 8,
			cardId = 2891,
			weight = 3,
			__size = 7
		}
	},
	__default = {
		__index = {
			huodongID = 0,
			attr = {
				__size = 0
			}
		}
	}
}

return csv.yunying.snowball_element
