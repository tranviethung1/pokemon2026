slot0 = {
	{
		__size = 0
	},
	__size = 1
}
csv.weather_system.weather = {
	__size = 17,
	[11] = {
		iconRes = "battle/weather_icon/icon_yutian.png",
		skillId = 19610,
		id = 11,
		natureType = 3,
		effectRes = "weather/yutian.skel"
	},
	[12] = {
		iconRes = "battle/weather_icon/icon_rizhao.png",
		skillId = 19710,
		id = 12,
		natureType = 2,
		effectRes = "weather/rizhao.skel"
	},
	[13] = {
		iconRes = "battle/weather_icon/icon_qinglang.png",
		skillId = 24410,
		id = 13,
		natureType = 4,
		effectRes = "weather/qinglang.skel"
	},
	[14] = {
		iconRes = "battle/weather_icon/icon_xuetian.png",
		skillId = 23030,
		id = 14,
		natureType = 6,
		effectRes = "weather/xuehua.skel"
	},
	[15] = {
		iconRes = "battle/weather_icon/icon_shabao.png",
		skillId = 70310,
		id = 15,
		natureType = 13,
		effectRes = "weather/shabao.skel"
	},
	[16] = {
		iconRes = "battle/weather_icon/icon_baoxue.png",
		skillId = 71310,
		id = 16,
		natureType = 6,
		effectRes = "weather/xuehua.skel"
	},
	[20] = {
		iconRes = "battle/weather_icon/icon_qizha.png",
		skillId = 19810,
		id = 20,
		natureType = 10,
		effectRes = "weather/luanliu.skel"
	},
	[21] = {
		iconRes = "battle/weather_icon/icon_dayutian.png",
		advanced = 1,
		skillId = 19620,
		id = 21,
		natureType = 3,
		effectRes = "weather/dayutian.skel"
	},
	[22] = {
		iconRes = "battle/weather_icon/icon_darizhao.png",
		advanced = 1,
		skillId = 19720,
		id = 22,
		natureType = 2,
		effectRes = "weather/darizhao.skel"
	},
	[23] = {
		upgradeType1 = 1,
		effectRes = "weather/daqingtian.skel",
		iconRes = "battle/weather_icon/icon_daqingtian.png",
		upgradeType2 = 2,
		natureType = 4,
		skillId = 24419,
		id = 23,
		advanced = 1,
		upgradeCondition1 = {
			[4.0] = 3,
			__size = 1
		},
		upgradeCondition2 = {
			[1972.0] = 1,
			__size = 1
		}
	},
	[25] = {
		effectRes = "weather/shenshengshabao.skel",
		advanced = 1,
		skillId = 70319,
		id = 25,
		natureType = 13,
		upgradeType1 = 2,
		iconRes = "battle/weather_icon/icon_shenshengshabao.png",
		upgradeCondition1 = {
			[3632.0] = 1,
			__size = 1
		}
	},
	[26] = {
		effectRes = "weather/xuehua.skel",
		advanced = 1,
		skillId = 71319,
		id = 26,
		natureType = 6,
		upgradeType1 = 2,
		iconRes = "battle/weather_icon/icon_bingxuebao.png",
		upgradeCondition1 = {
			[3242.0] = 1,
			__size = 1
		}
	},
	[30] = {
		iconRes = "battle/weather_icon/icon_luanliu.png",
		skillId = 19820,
		id = 30,
		natureType = 10,
		effectRes = "weather/luanliu.skel"
	},
	[41] = {
		iconRes = "battle/weather_icon/icon_luanliu.png",
		skillId = 19820,
		id = 41,
		natureType = 10,
		effectRes = "weather/luanliu.skel"
	},
	[42] = {
		id = 42,
		natureType = 18,
		effectRes = "weather/nongwu.skel",
		iconRes = "battle/weather_icon/icon_wutian.png"
	},
	[43] = {
		id = 43,
		natureType = 14,
		effectRes = "weather/yewan.skel",
		iconRes = "battle/weather_icon/icon_yewan.png"
	},
	[44] = {
		id = 44,
		natureType = 5,
		effectRes = "weather/leiyu.skel",
		iconRes = "battle/weather_icon/icon_leiyu.png"
	},
	__default = {
		__index = {
			upgradeType1 = 0,
			upgradeType2 = 0,
			advanced = 0,
			upgradeCondition1 = ({
				default = slot0[1]
			}).default,
			upgradeCondition2 = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.weather_system.weather
