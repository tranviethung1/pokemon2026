slot0 = {
	[3] = {
		[37.0] = 0,
		[15.0] = 0,
		__size = 3,
		[11.0] = 0
	},
	[4] = {
		__size = 1,
		[10.0] = 0
	}
}
csv.effect_power = {
	{
		id = 1
	},
	{
		id = 2,
		killAddMp1 = 0,
		triggerPoint = {
			__size = 6,
			[11.0] = 0,
			[13.0] = 0,
			[7.0] = 0,
			[12.0] = 0,
			[8.0] = 0,
			[23.0] = 0
		},
		passiveSkill = {
			nil,
			nil,
			0,
			0,
			0,
			__size = 4,
			[10.0] = 0
		}
	},
	{
		id = 3,
		canAsTurnTarget = 0,
		killAddMp1 = 0
	},
	{
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 4,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	{
		normalSpecialCheck = 0,
		summonSpecialCheck = 0,
		id = 5,
		killAddMp1 = 0,
		needUnitID = 3623,
		hpFormulaDiscount = "findTarget and (less(findTarget:star(),8) and 1 or (findTarget:hasBuff(3623817) and 1 or (not findTarget:hasBuff(3623817) and 0.48 or 1))) or 1",
		hpFixedDiscount = 0.4
	},
	{
		killAddMp1Fix = 0.334,
		summonSpecialCheck = 0,
		normalSpecialCheck = 0,
		id = 6,
		needUnitID = 3623,
		hpFormulaDiscount = "findTarget and (less(findTarget:star(),8) and 1 or (findTarget:hasBuff(3623817) and 1 or (not findTarget:hasBuff(3623817) and 0.48 or 1))) or 1",
		hpFixedDiscount = 0.08
	},
	{
		normalSpecialCheck = 0,
		summonSpecialCheck = 0,
		id = 7,
		killAddMp1 = 0,
		needUnitID = 3623,
		hpFormulaDiscount = "findTarget and (less(findTarget:star(),8) and 1 or (findTarget:hasBuff(3623817) and 1 or (not findTarget:hasBuff(3623817) and 0.48 or 1))) or 1"
	},
	{
		needUnitID = 2423,
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 8,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	{
		needUnitID = 2425,
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 9,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	{
		needUnitID = 2422,
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 10,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	{
		needUnitID = 1966,
		id = 11,
		canAsTurnTarget = 0,
		killAddMp1 = 0
	},
	{
		needUnitID = 2412,
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 12,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	{
		needUnitID = 7016,
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 13,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	{
		id = 14,
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		needUnitID = 1966,
		hpFixedDiscount = 0
	},
	{
		needUnitID = 4111,
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 15,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	{
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 16,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	{
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 17,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	{
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 18,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	{
		id = 19,
		canAsTurnTarget = 0
	},
	{
		needUnitID = 766,
		canAsTurnTarget = 0,
		killAddMp1 = 0,
		id = 20,
		triggerPointKilledTarget = slot0[3],
		passiveSkillKilledTarget = slot0[4]
	},
	__size = 20,
	__default = {
		__index = {
			summonSpecialCheck = 1,
			canAsTurnTarget = 1,
			normalSpecialCheck = 1,
			killAddMp1Fix = 1,
			killAddMp1 = 1,
			hpFixedDiscount = 1,
			triggerPoint = {
				__size = 0
			},
			triggerPointKilledTarget = {
				__size = 0
			},
			passiveSkill = {
				__size = 0
			},
			passiveSkillKilledTarget = {
				__size = 0
			}
		}
	}
}

return csv.effect_power
