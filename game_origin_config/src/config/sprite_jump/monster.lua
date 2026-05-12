slot0 = {
	__size = 1,
	[3] = {
		__size = 1,
		times = 1
	}
}
slot1 = {
	slot0[3],
	slot0[3]
}
csv.sprite_jump.monster = {
	{
		score = 50,
		res = "sprite_jump/ggbianfu.skel",
		id = 1,
		params = slot1[1]
	},
	{
		score = 100,
		res = "sprite_jump/miaomiao.skel",
		id = 2,
		speedX = 5,
		manualBox = {
			__size = 4,
			height = 150,
			width = 100,
			y = 0,
			x = -50
		},
		params = slot1[2]
	},
	__size = 3,
	[4] = {
		id = 4,
		res = "sprite_jump/jinglingtiaoyue.skel",
		params = {
			fireStop = 1,
			fireTime = 1,
			__size = 3,
			times = 0
		}
	},
	__default = {
		__index = {
			score = 0,
			res = "",
			speedX = 0,
			manualBox = {
				__size = 0
			},
			params = {
				__size = 1,
				times = 1
			}
		}
	}
}

return csv.sprite_jump.monster
