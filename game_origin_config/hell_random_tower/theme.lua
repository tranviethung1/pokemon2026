slot0 = {
	{},
	__size = 2,
	[3] = {
		0,
		300,
		500,
		1200
	}
}
slot2 = {
	slot0[3],
	slot0[3],
	default = slot0[1],
	[3] = slot0[3],
	[4] = slot0[3]
}
csv.hell_random_tower.theme = {
	{
		name = "常规模式",
		awardVersion = 1,
		buffGroupEffectLimit = 999,
		id = 1,
		resetTimesLimit = 2,
		readyCardNum = 2,
		fightCardNum = slot2[1]
	},
	{
		name = "限定稀有度",
		awardVersion = 2,
		resetTimesLimit = 2,
		readyCardNum = 2,
		desc = "本期无尽模式只能使用%s的精灵",
		buffGroupEffectLimit = 999,
		id = 2,
		fightCardNum = slot2[2],
		validRarity = {
			3,
			4
		}
	},
	{
		name = "行动值",
		awardVersion = 3,
		resetTimesLimit = 2,
		readyCardNum = 2,
		desc = "初始行动值为%s，向前行动1格将消耗1点行动值，行动值消耗殆尽，挑战结束",
		buffGroupEffectLimit = 999,
		id = 3,
		actionPoint = 30,
		fightCardNum = slot2[3]
	},
	{
		name = "流派强化主题",
		awardVersion = 1,
		resetTimesLimit = 2,
		readyCardNum = 2,
		desc = "庇护类的战斗加成效果强化",
		buffGroupEffectLimit = 999,
		id = 4,
		fightCardNum = slot2[4],
		buffGroup = {
			[0] = 50,
			100,
			__size = 2
		}
	},
	{
		name = "双队模式",
		awardVersion = 2,
		buffGroupEffectLimit = 999,
		id = 5,
		resetTimesLimit = 2,
		readyCardNum = 4,
		fightCardNum = {
			0,
			200,
			300,
			400,
			500,
			1000,
			1200
		}
	},
	__size = 5,
	__default = {
		__index = {
			name = "",
			buffGroupEffectLimit = 0,
			resetTimesLimit = 0,
			readyCardNum = 0,
			desc = "",
			buffSkillID = 0,
			awardVersion = 0,
			actionPoint = 0,
			fightCardNum = slot2.default,
			validRarity = ({
				default = slot0[1]
			}).default,
			buffGroup = {
				__size = 0
			}
		}
	}
}

return csv.hell_random_tower.theme
