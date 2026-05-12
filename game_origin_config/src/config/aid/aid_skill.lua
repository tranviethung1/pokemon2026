csv.aid.aid_skill = {
	{
		skillID = 8000001,
		name = "妙蛙种子助战技能",
		id = 1,
		awakeDescribes = "攻击敌方单体目标，造成#C0x3D8A99#450%特攻#C0x5B545B#+$(skillLevel*4*60)$的#C0xF13B54#特殊伤害#C0x5B545B#，为己方全体添加一枚寄生种子3回合，并立即触发一次寄生种子中的恢复效果",
		describes = "攻击敌方单体目标，造成#C0x3D8A99#90%特攻#C0x5B545B#+$(skillLevel*4*24)$的#C0xF13B54#特殊伤害#C0x5B545B#"
	},
	{
		skillID = 8000002,
		name = "超级妙蛙花助战技能",
		id = 2,
		awakeDescribes = "攻击敌方单体目标，造成#C0x3D8A99#450%特攻#C0x5B545B#+$(skillLevel*4*60)$的#C0xF13B54#特殊伤害#C0x5B545B#，为己方全体添加一枚寄生种子3回合，并立即触发一次寄生种子中的恢复效果",
		describes = "攻击敌方单体目标，造成#C0x3D8A99#90%特攻#C0x5B545B#+$(skillLevel*4*24)$的#C0xF13B54#特殊伤害#C0x5B545B#"
	},
	__size = 9,
	[11] = {
		id = 11,
		skillID = 8000011,
		timesLimit = "2",
		useSkills = 2,
		roundTimes = {
			99
		}
	},
	[12] = {
		timesLimit = "5",
		skillID = 8000012,
		id = 12,
		useSkills = 2,
		cdRound = 1,
		roundTimes = {
			2
		}
	},
	[13] = {
		startRound = "2",
		timesLimit = "3",
		useSkills = 2,
		cdRound = 3,
		triggerType = "2",
		skillID = 8000013,
		id = 13,
		roundTimes = {
			5
		},
		conditions = {
			"false",
			"false",
			"false",
			__size = 3
		}
	},
	[21] = {
		id = 21,
		skillID = 8000021,
		useSkills = 2
	},
	[22] = {
		startRound = "2",
		timesLimit = "2",
		useSkills = 2,
		cdRound = 1,
		triggerType = "2",
		skillID = 8000022,
		id = 22,
		roundTimes = {
			1
		},
		conditions = {
			"true",
			"false",
			"false",
			__size = 3
		}
	},
	[1971] = {
		triggerType = "1",
		skillID = 8001971,
		startRound = "1",
		id = 1971,
		awakeDescribes = "觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能",
		describes = "总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述"
	},
	[1972] = {
		triggerType = "3",
		skillID = 8001972,
		startRound = "2",
		id = 1972,
		awakeDescribes = "觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能觉醒技能",
		describes = "总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述总预览描述"
	},
	__default = {
		__index = {
			name = "",
			timesLimit = "3",
			useSkills = 1,
			cdRound = 2,
			triggerType = "1",
			startRound = "2",
			awakeDescribes = "",
			describes = "“”",
			roundTimes = {
				2,
				3
			},
			conditions = {
				"true",
				"false",
				"true",
				__size = 3
			}
		}
	}
}

return csv.aid.aid_skill
