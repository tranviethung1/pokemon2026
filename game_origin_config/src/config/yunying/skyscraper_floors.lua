slot0 = {
	__size = 1,
	[6] = {
		__size = 1,
		libs = {
			10101
		}
	}
}
slot1 = {
	[11] = slot0[6],
	[10] = slot0[6],
	[3] = slot0[6],
	[5] = slot0[6],
	[7] = slot0[6],
	[9] = slot0[6]
}
csv.yunying.skyscraper_floors = {
	{
		id = 1,
		huodongID = 1,
		hookSpeed = 1.5,
		range = {
			0,
			5
		}
	},
	{
		id = 2,
		huodongID = 1,
		maxRotate = 23,
		hookSpeed = 1.6,
		range = {
			5,
			8
		}
	},
	{
		id = 3,
		huodongID = 1,
		maxRotate = 23,
		hookSpeed = 1.7,
		awardsIcon = "config/item/icon_box3.png",
		range = {
			8,
			12
		},
		awards = slot1[3]
	},
	{
		id = 4,
		huodongID = 1,
		maxRotate = 25,
		hookSpeed = 1.9,
		range = {
			12,
			15
		}
	},
	{
		id = 5,
		huodongID = 1,
		maxRotate = 25,
		hookSpeed = 2,
		awardsIcon = "config/item/icon_box3.png",
		range = {
			15,
			20
		},
		awards = slot1[5]
	},
	{
		id = 6,
		huodongID = 1,
		maxRotate = 28,
		hookSpeed = 2.1,
		range = {
			20,
			25
		}
	},
	{
		id = 7,
		huodongID = 1,
		maxRotate = 28,
		hookSpeed = 2.2,
		awardsIcon = "config/item/icon_box3.png",
		range = {
			25,
			30
		},
		awards = slot1[7]
	},
	{
		id = 8,
		huodongID = 1,
		maxRotate = 30,
		hookSpeed = 2.3,
		range = {
			30,
			35
		}
	},
	{
		id = 9,
		huodongID = 1,
		maxRotate = 30,
		hookSpeed = 2.4,
		awardsIcon = "config/item/icon_box3.png",
		range = {
			35,
			40
		},
		awards = slot1[9]
	},
	{
		id = 10,
		huodongID = 1,
		maxRotate = 30,
		hookSpeed = 2.5,
		awardsIcon = "config/item/icon_box3.png",
		range = {
			40,
			45
		},
		awards = slot1[10]
	},
	{
		id = 11,
		huodongID = 1,
		maxRotate = 30,
		hookSpeed = 2.5,
		awardsIcon = "config/item/icon_box3.png",
		range = {
			45,
			51
		},
		awards = slot1[11]
	},
	__size = 11,
	__default = {
		__index = {
			huodongID = 1001,
			maxRotate = 0,
			swing = 0,
			hookSpeed = 0,
			awardsIcon = "",
			range = {},
			awards = {
				__size = 0
			}
		}
	}
}

return csv.yunying.skyscraper_floors
