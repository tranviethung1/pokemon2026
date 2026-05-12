slot0 = {
	{
		__size = 0
	},
	{
		__size = 5,
		height = 18,
		width = 18,
		y = 6,
		wallHeight = 5,
		x = 6
	},
	{
		maxScale = 0.8,
		minScale = 0.4,
		k = 0.5,
		__size = 4,
		maxNum = 50
	},
	{
		__size = 2,
		height = 5,
		width = 18
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
	[1004] = slot0[4],
	[1003] = slot0[4],
	[1002] = slot0[4],
	[1001] = slot0[4]
}
slot2 = {
	slot0[3],
	slot0[3],
	default = slot0[1],
	[3] = slot0[3],
	[5] = slot0[3],
	[4] = slot0[3]
}
csv.town.wall_floor = {
	{
		type = 1,
		res = "town/floor70001.tmx",
		furnId = 70001,
		roomID = 1,
		id = 1,
		size = slot1[1],
		attr = slot2[1]
	},
	{
		type = 1,
		res = "town/floor70002.tmx",
		furnId = 70002,
		roomID = 2,
		id = 2,
		size = slot1[2],
		attr = slot2[2]
	},
	{
		type = 1,
		res = "town/floor70003.tmx",
		furnId = 70003,
		roomID = 3,
		id = 3,
		size = slot1[3],
		attr = slot2[3]
	},
	{
		type = 1,
		res = "town/floor70004.tmx",
		furnId = 70004,
		roomID = 4,
		id = 4,
		size = slot1[4],
		attr = slot2[4]
	},
	{
		type = 1,
		res = "town/floor70005.tmx",
		furnId = 70005,
		roomID = 1,
		id = 5,
		size = slot1[5],
		attr = slot2[5]
	},
	__size = 9,
	[1001] = {
		type = 2,
		res = "town/wall71001.tmx",
		furnId = 71001,
		roomID = 1,
		id = 1001,
		size = slot1[1001]
	},
	[1002] = {
		type = 2,
		res = "town/wall71001.tmx",
		furnId = 71002,
		roomID = 2,
		id = 1002,
		size = slot1[1002]
	},
	[1003] = {
		type = 2,
		res = "town/wall71001.tmx",
		furnId = 71003,
		roomID = 3,
		id = 1003,
		size = slot1[1003]
	},
	[1004] = {
		type = 2,
		res = "town/wall71001.tmx",
		furnId = 71004,
		roomID = 4,
		id = 1004,
		size = slot1[1004]
	},
	__default = {
		__index = {
			size = slot1.default,
			attr = slot2.default
		}
	}
}

return csv.town.wall_floor
