slot0 = {
	{
		__size = 0
	},
	{
		{
			skillPower = "10%",
			__size = 1
		},
		{
			skillPower = "-10%",
			__size = 1
		}
	},
	{
		{
			990001
		}
	},
	__size = 5,
	[5] = {
		{
			990002
		},
		{
			990003
		}
	},
	[8] = {
		{
			{
				buffProb = 1,
				buffLifeRound = 10,
				buffValue = "-target:hpMax()*0.15",
				__size = 3
			}
		},
		{
			{
				buffProb = 1,
				buffLifeRound = 10,
				buffValue = "target:specialDefence()*0.45",
				__size = 3
			}
		}
	}
}
slot2 = {
	[9] = slot0[5],
	[8] = slot0[5],
	[3] = slot0[3],
	[4] = slot0[5],
	[7] = slot0[3]
}
slot3 = {
	[9] = slot0[8],
	[8] = slot0[8]
}
slot5 = {
	slot0[2],
	slot0[2],
	[5] = slot0[2],
	[6] = slot0[2]
}
csv.weather = {
	{
		name = "Rainy",
		describe = "Weather becomes clear: Damage of fire-type moves increases, while water-type decreases",
		name_en = "Rainy",
		weatherType = 1,
		effectRes = "weather/xiayu.skel",
		lifeRound = 4,
		describe_th = "Weather becomes clear: Damage of fire-type moves increases, while water-type decreases",
		overlay = 99,
		iconRes = "battle/weather_icon/icon_rain.png",
		name_th = "Rainy",
		id = 1,
		describe_en = "Weather becomes clear: Damage of fire-type moves increases, while water-type decreases",
		regEffect = slot5[1]
	},
	{
		name = "Thunder",
		describe = "Damage of water-type moves increases, while fire-type moves decreases",
		name_en = "Thunder",
		weatherType = 2,
		effectRes = "weather/leiyu.skel",
		lifeRound = 4,
		describe_th = "Damage of water-type moves increases, while fire-type moves decreases",
		overlay = 99,
		iconRes = "battle/weather_icon/icon_thunderstorm.png",
		name_th = "Thunder",
		id = 2,
		describe_en = "Damage of water-type moves increases, while fire-type moves decreases",
		regEffect = slot5[2]
	},
	{
		name = "Snow",
		describe = "Deals damage to all Pokémons on the battlefield at the beginning of each main rounds, except for Ice-type Pokémons",
		weatherType = 3,
		effectRes = "weather/xuehua.skel",
		lifeRound = 4,
		describe_th = "Deals damage to all Pokémons on the battlefield at the beginning of each main rounds, except for Ice-type Pokémons",
		overlay = 99,
		iconRes = "battle/weather_icon/icon_snow.png",
		name_en = "Snow",
		name_th = "Snow",
		id = 3,
		describe_en = "Deals damage to all Pokémons on the battlefield at the beginning of each main rounds, except for Ice-type Pokémons",
		buffId = slot2[3],
		buffValueGroup = {
			{
				{
					buffProb = 1,
					buffLifeRound = 4,
					buffValue = "-target:hpMax()*0.1",
					__size = 3
				}
			}
		}
	},
	{
		name = "Sand",
		describe = "Pokémons besides the Rock, Ground, and Steel-type will receive continuous damage; the SP.DEF of Rock-type Pokémons also increases",
		weatherType = 4,
		effectRes = "weather/shachen.skel",
		lifeRound = 4,
		describe_th = "Pokémons besides the Rock, Ground, and Steel-type will receive continuous damage; the SP.DEF of Rock-type Pokémons also increases",
		overlay = 99,
		iconRes = "battle/weather_icon/icon_sandstorm.png",
		name_en = "Sand",
		name_th = "Sand",
		id = 4,
		describe_en = "Pokémons besides the Rock, Ground, and Steel-type will receive continuous damage; the SP.DEF of Rock-type Pokémons also increases",
		buffId = slot2[4],
		buffValueGroup = {
			{
				{
					buffProb = 1,
					buffLifeRound = 4,
					buffValue = "-target:hpMax()*0.15",
					__size = 3
				}
			},
			{
				{
					buffProb = 1,
					buffLifeRound = 4,
					buffValue = "target:specialDefence()*0.45",
					__size = 3
				}
			}
		}
	},
	{
		name = "Storm",
		describe = "Weather becomes clear: Damage of fire-type moves increases, while water-type decreases",
		name_en = "Storm",
		weatherType = 5,
		effectRes = "weather/luanliu.skel",
		lifeRound = 10,
		describe_th = "Weather becomes clear: Damage of fire-type moves increases, while water-type decreases",
		overlay = 99,
		iconRes = "battle/weather_icon/icon_turbulence.png",
		name_th = "Storm",
		id = 5,
		describe_en = "Weather becomes clear: Damage of fire-type moves increases, while water-type decreases",
		regEffect = slot5[5]
	},
	{
		name = "Sunny",
		describe = "Damage of water-type moves increases, while fire-type moves decreases\nAll allies gain [Solar Power] (lost HP each round, DMG increased, can be stacked)",
		name_en = "Sunny",
		weatherType = 6,
		effectRes = "weather/darizhao.skel",
		lifeRound = 10,
		describe_th = "Damage of water-type moves increases, while fire-type moves decreases\nAll allies gain [Solar Power] (lost HP each round, DMG increased, can be stacked)",
		overlay = 99,
		iconRes = "battle/weather_icon/icon_sun.png",
		name_th = "Sunny",
		id = 6,
		describe_en = "Damage of water-type moves increases, while fire-type moves decreases\nAll allies gain [Solar Power] (lost HP each round, DMG increased, can be stacked)",
		regEffect = slot5[6]
	},
	{
		name = "Fog",
		describe = "Deals damage to all Pokémons on the battlefield at the beginning of each main rounds, except for Ice-type Pokémons",
		weatherType = 7,
		effectRes = "weather/nongwu.skel",
		lifeRound = 10,
		describe_th = "Deals damage to all Pokémons on the battlefield at the beginning of each main rounds, except for Ice-type Pokémons",
		overlay = 99,
		iconRes = "battle/weather_icon/icon_fog.png",
		name_en = "Fog",
		name_th = "Fog",
		id = 7,
		describe_en = "Deals damage to all Pokémons on the battlefield at the beginning of each main rounds, except for Ice-type Pokémons",
		buffId = slot2[7],
		buffValueGroup = {
			{
				{
					buffProb = 1,
					buffLifeRound = 10,
					buffValue = "-target:hpMax()*0.1",
					__size = 3
				}
			}
		}
	},
	{
		name = "Night",
		describe = "Pokémons besides the Rock, Ground, and Steel-type will receive continuous damage; the SP.DEF of Rock-type Pokémons also increases",
		weatherType = 8,
		effectRes = "weather/yewan.skel",
		lifeRound = 10,
		describe_th = "Pokémons besides the Rock, Ground, and Steel-type will receive continuous damage; the SP.DEF of Rock-type Pokémons also increases",
		overlay = 99,
		iconRes = "battle/weather_icon/icon_nightmoon.png",
		name_en = "Night",
		name_th = "Night",
		id = 8,
		describe_en = "Pokémons besides the Rock, Ground, and Steel-type will receive continuous damage; the SP.DEF of Rock-type Pokémons also increases",
		buffId = slot2[8],
		buffValueGroup = slot3[8]
	},
	{
		name = "Night",
		describe = "Pokémons besides the Rock, Ground, and Steel-type will receive continuous damage; the SP.DEF of Rock-type Pokémons also increases",
		weatherType = 9,
		effectRes = "weather/yewan.skel",
		lifeRound = 10,
		describe_th = "Pokémons besides the Rock, Ground, and Steel-type will receive continuous damage; the SP.DEF of Rock-type Pokémons also increases",
		overlay = 99,
		iconRes = "battle/weather_icon/icon_nightmoon.png",
		name_en = "Night",
		name_th = "Night",
		id = 9,
		describe_en = "Pokémons besides the Rock, Ground, and Steel-type will receive continuous damage; the SP.DEF of Rock-type Pokémons also increases",
		buffId = slot2[9],
		buffValueGroup = slot3[9]
	},
	{
		id = 10,
		iconRes = "battle/weather_icon/icon_yutian.png",
		effectRes = "weather/xiayu.skel",
		weatherType = 11
	},
	{
		id = 11,
		iconRes = "battle/weather_icon/icon_rizhao.png",
		effectRes = "weather/darizhao.skel",
		weatherType = 12
	},
	{
		id = 12,
		iconRes = "battle/weather_icon/icon_qinglang.png",
		effectRes = "weather/nongwu.skel",
		weatherType = 13
	},
	{
		id = 13,
		iconRes = "battle/weather_icon/icon_baoxue.png",
		effectRes = "weather/xuehua.skel",
		weatherType = 14
	},
	{
		id = 14,
		iconRes = "battle/weather_icon/icon_shabao.png",
		effectRes = "weather/shachen.skel",
		weatherType = 15
	},
	{
		iconRes = "battle/weather_icon/icon_dayutian.png",
		weatherType = 21,
		id = 15,
		advanced = 1,
		effectRes = "weather/xiayu.skel"
	},
	{
		iconRes = "battle/weather_icon/icon_darizhao.png",
		weatherType = 22,
		id = 16,
		advanced = 1,
		effectRes = "weather/darizhao.skel"
	},
	{
		upgradeType1 = 1,
		weatherType = 23,
		upgradeType2 = 2,
		effectRes = "weather/nongwu.skel",
		iconRes = "battle/weather_icon/icon_daqingtian.png",
		id = 17,
		advanced = 1,
		preWeather = 13,
		upgradeCondition1 = {
			[4.0] = 3,
			__size = 1
		},
		upgradeCondition2 = {
			[1972.0] = 1,
			__size = 1
		}
	},
	{
		iconRes = "battle/weather_icon/icon_shenshengshabao.png",
		upgradeType1 = 2,
		weatherType = 25,
		id = 18,
		advanced = 1,
		effectRes = "weather/shachen.skel",
		preWeather = 15,
		upgradeCondition1 = {
			[3632.0] = 1,
			__size = 1
		}
	},
	{
		id = 19,
		iconRes = "battle/weather_icon/icon_luanliu.png",
		effectRes = "weather/luanliu.skel",
		weatherType = 30
	},
	__size = 19,
	__default = {
		__index = {
			upgradeType2 = 0,
			advanced = 0,
			upgradeType1 = 0,
			preWeather = 0,
			upgradeCondition1 = ({
				default = slot0[1]
			}).default,
			upgradeCondition2 = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.weather
