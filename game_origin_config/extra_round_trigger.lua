slot0 = {
	[10] = {
		5,
		6,
		7,
		8,
		10,
		14,
		15,
		24,
		25,
		30,
		40
	}
}
csv.extra_round_trigger = {
	{
		id = 1,
		disableBattleState = 1,
		forbiddenBuff = {
			5,
			24,
			25
		},
		forbiddenPassiveSkill = {
			2,
			23
		},
		cfgIds = {
			4161681,
			149041,
			790954,
			126925,
			242340,
			522158,
			522159
		}
	},
	{
		id = 2,
		disableBattleState = 2,
		forbiddenBuff = {
			6,
			42
		},
		forbiddenPassiveSkill = {
			9,
			18,
			24,
			25,
			28
		}
	},
	{
		id = 3,
		enableActiveSkillMp = true,
		limitBuff = {
			7,
			8,
			10,
			14
		},
		cfgIds = {
			2461311,
			761237
		}
	},
	{
		id = 4,
		limitBuff = {
			3,
			5,
			6,
			7,
			8,
			10,
			14,
			15,
			40,
			30
		},
		cfgIds = {
			1962480,
			1962485
		}
	},
	{
		id = 5,
		limitBuff = slot0[10],
		forbiddenBuff = {
			23
		},
		cfgIds = {
			4161680,
			776029,
			872893,
			211251
		}
	},
	{
		id = 6,
		cfgIds = {
			762687,
			762403
		}
	},
	{
		id = 7,
		limitBuff = slot0[10],
		forbiddenBuff = slot0[10],
		cfgIds = {
			90764041
		}
	},
	__size = 8,
	[1000] = {
		id = 1000,
		limitBuff = slot0[10]
	},
	__default = {
		__index = {
			enableActiveSkillMp = false,
			disableBattleState = 0,
			limitBuff = {},
			forbiddenBuff = {},
			forbiddenPassiveSkill = {},
			cfgIds = {}
		}
	}
}

return csv.extra_round_trigger
