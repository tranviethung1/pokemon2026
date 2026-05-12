slot0 = {
	__size = 0
}
csv.sprite_jump.prop = {
	{
		name = "弹簧",
		id = 1,
		scale = 0.6,
		size = {
			__size = 2,
			height = 100,
			width = 224
		},
		params = {
			speedY = 50,
			__size = 1
		},
		res = {
			png = "activity/sprite_jump/tanhuang.png",
			__size = 1
		}
	},
	{
		name = "翅膀",
		id = 2,
		scale = 0.6,
		params = {
			speedY = 50,
			height = 3500,
			__size = 2
		},
		res = {
			png = "activity/sprite_jump/chibang.png",
			__size = 1
		}
	},
	{
		name = "加x秒",
		id = 3,
		scale = 0.6,
		params = {
			time = 5,
			__size = 1
		},
		res = {
			png = "activity/sprite_jump/shijianhuoqu.png",
			__size = 1
		}
	},
	{
		name = "减x秒",
		id = 4,
		scale = 0.6,
		params = {
			time = -5,
			__size = 1
		},
		res = {
			png = "activity/sprite_jump/shijianjianshao.png",
			__size = 1
		}
	},
	{
		name = "无敌x秒",
		id = 5,
		scale = 0.6,
		params = {
			time = 10,
			__size = 1
		},
		res = {
			png = "activity/sprite_jump/hudun.png",
			__size = 1
		}
	},
	{
		name = "地 刺",
		id = 6,
		size = {
			__size = 2,
			height = 50,
			width = 400
		},
		params = {
			timeEffect = 1,
			timeUnEffect = 2,
			__size = 2
		},
		res = {
			png = "activity/sprite_jump/ci.png",
			__size = 1
		}
	},
	{
		id = 7,
		name = "牵引绳",
		size = {
			__size = 2,
			height = 120,
			width = 120
		},
		res = {
			__size = 2,
			action = "qianyin_dian_loop",
			spine = "sprite_jump/tiaoyuedaoju.skel"
		}
	},
	__size = 7,
	__default = {
		__index = {
			scale = 1,
			size = {
				__size = 2,
				height = 150,
				width = 180
			},
			params = {
				__size = 0
			}
		}
	}
}

return csv.sprite_jump.prop
