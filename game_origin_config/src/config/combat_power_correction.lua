slot0 = {
	{
		1,
		0.9
	},
	{
		__size = 2,
		block = 0,
		strike = 0
	},
	{
		0.9,
		0.8
	},
	[5] = {
		0.8,
		0.7
	},
	[7] = {
		0.7,
		0.6
	},
	[9] = {
		0.6,
		0.5
	},
	[11] = {
		0.5,
		0.4
	},
	[13] = {
		0.4,
		0.3
	},
	[14] = {
		__size = 6,
		damageReduce = 10000,
		finalDamageDeepen = 10000,
		block = -10000,
		finalDamageReduce = 10000,
		damageDeepen = 10000,
		strike = -10000
	},
	[15] = {
		0.3,
		0.2
	},
	[16] = {
		0.2,
		0.1
	},
	[17] = {
		0.1,
		0
	},
	[18] = {
		nil,
		3000000,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		3000000,
		500000,
		nil,
		nil,
		2000000,
		500000,
		nil,
		nil,
		3000000,
		nil,
		3000000,
		3000000,
		3000000,
		nil,
		2000000,
		nil,
		nil,
		nil,
		nil,
		3000000,
		3000000,
		__size = 14,
		[999999.0] = 3000000,
		[34.0] = 3000000
	}
}
csv.combat_power_correction = {
	{
		id = 1,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[1],
		attr = slot0[2]
	},
	{
		buffProbRate = -0.02,
		buffValueRate = 0.9,
		id = 2,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[3],
		attr = {
			__size = 4,
			block = -800,
			finalDamageDeepen = 1000,
			finalDamageReduce = 1000,
			strike = -800
		}
	},
	{
		buffProbRate = -0.03,
		buffValueRate = 0.8,
		id = 3,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[5],
		attr = {
			__size = 4,
			block = -1200,
			finalDamageDeepen = 2000,
			finalDamageReduce = 2000,
			strike = -1200
		}
	},
	{
		buffProbRate = -0.05,
		buffValueRate = 0.7,
		id = 4,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[7],
		attr = {
			__size = 6,
			damageReduce = 2000,
			finalDamageDeepen = 2000,
			block = -2500,
			finalDamageReduce = 2000,
			damageDeepen = 2000,
			strike = -2500
		}
	},
	{
		buffProbRate = -0.08,
		buffValueRate = 0.6,
		id = 5,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[9],
		attr = {
			__size = 6,
			damageReduce = 3500,
			finalDamageDeepen = 3500,
			block = -3500,
			finalDamageReduce = 3500,
			damageDeepen = 3500,
			strike = -3500
		}
	},
	{
		buffProbRate = -0.1,
		buffValueRate = 0.5,
		id = 6,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[11],
		attr = {
			__size = 6,
			damageReduce = 5000,
			finalDamageDeepen = 5000,
			block = -5000,
			finalDamageReduce = 5000,
			damageDeepen = 5000,
			strike = -5000
		}
	},
	{
		buffProbRate = -0.15,
		buffValueRate = 0.4,
		id = 7,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[13],
		attr = slot0[14]
	},
	{
		buffProbRate = -0.2,
		buffValueRate = 0.3,
		id = 8,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[15],
		attr = slot0[14]
	},
	{
		buffProbRate = -0.2,
		buffValueRate = 0.2,
		id = 9,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[16],
		attr = slot0[14]
	},
	{
		buffProbRate = -0.2,
		buffValueRate = 0.15,
		id = 10,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[17],
		attr = slot0[14]
	},
	{
		id = 11,
		groupKey = "c.groupstun()",
		fightPointRate = slot0[1]
	},
	{
		id = 12,
		groupKey = "c.groupstun()",
		buffProbRate = -0.01,
		fightPointRate = slot0[3]
	},
	{
		id = 13,
		groupKey = "c.groupstun()",
		buffProbRate = -0.015,
		fightPointRate = slot0[5]
	},
	{
		id = 14,
		groupKey = "c.groupstun()",
		buffProbRate = -0.02,
		fightPointRate = slot0[7]
	},
	{
		id = 15,
		groupKey = "c.groupstun()",
		buffProbRate = -0.025,
		fightPointRate = slot0[9]
	},
	{
		id = 16,
		groupKey = "c.groupstun()",
		buffProbRate = -0.03,
		fightPointRate = slot0[11]
	},
	{
		id = 17,
		groupKey = "c.groupstun()",
		buffProbRate = -0.035,
		fightPointRate = slot0[13]
	},
	{
		id = 18,
		groupKey = "c.groupstun()",
		buffProbRate = -0.04,
		fightPointRate = slot0[15]
	},
	{
		id = 19,
		groupKey = "c.groupstun()",
		buffProbRate = -0.045,
		fightPointRate = slot0[16]
	},
	{
		id = 20,
		groupKey = "c.groupstun()",
		buffProbRate = -0.05,
		fightPointRate = slot0[17]
	},
	__size = 40,
	[1001] = {
		id = 1001,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[1],
		attr = slot0[2],
		combatPowerLimit = slot0[18]
	},
	[1002] = {
		buffProbRate = -0.01,
		buffValueRate = 0.9,
		id = 1002,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[3],
		attr = {
			__size = 4,
			block = -400,
			finalDamageDeepen = 500,
			finalDamageReduce = 500,
			strike = -400
		},
		combatPowerLimit = slot0[18]
	},
	[1003] = {
		buffProbRate = -0.015,
		buffValueRate = 0.8,
		id = 1003,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[5],
		attr = {
			__size = 4,
			block = -600,
			finalDamageDeepen = 1000,
			finalDamageReduce = 1000,
			strike = -600
		},
		combatPowerLimit = slot0[18]
	},
	[1004] = {
		buffProbRate = -0.025,
		buffValueRate = 0.7,
		id = 1004,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[7],
		attr = {
			__size = 6,
			damageReduce = 1000,
			finalDamageDeepen = 1000,
			block = -1250,
			finalDamageReduce = 1000,
			damageDeepen = 1000,
			strike = -1250
		},
		combatPowerLimit = slot0[18]
	},
	[1005] = {
		buffProbRate = -0.04,
		buffValueRate = 0.6,
		id = 1005,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[9],
		attr = {
			__size = 6,
			damageReduce = 1750,
			finalDamageDeepen = 1750,
			block = -1750,
			finalDamageReduce = 1750,
			damageDeepen = 1750,
			strike = -1750
		},
		combatPowerLimit = slot0[18]
	},
	[1006] = {
		buffProbRate = -0.05,
		buffValueRate = 0.5,
		id = 1006,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[11],
		attr = {
			__size = 6,
			damageReduce = 2500,
			finalDamageDeepen = 2500,
			block = -2500,
			finalDamageReduce = 2500,
			damageDeepen = 2500,
			strike = -2500
		},
		combatPowerLimit = slot0[18]
	},
	[1007] = {
		buffProbRate = -0.075,
		buffValueRate = 0.4,
		id = 1007,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[13],
		attr = {
			__size = 6,
			damageReduce = 4000,
			finalDamageDeepen = 4000,
			block = -4000,
			finalDamageReduce = 4000,
			damageDeepen = 4000,
			strike = -4000
		},
		combatPowerLimit = slot0[18]
	},
	[1008] = {
		buffProbRate = -0.1,
		buffValueRate = 0.3,
		id = 1008,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[15],
		attr = {
			__size = 6,
			damageReduce = 6000,
			finalDamageDeepen = 6000,
			block = -6000,
			finalDamageReduce = 6000,
			damageDeepen = 6000,
			strike = -6000
		},
		combatPowerLimit = slot0[18]
	},
	[1009] = {
		buffProbRate = -0.1,
		buffValueRate = 0.2,
		id = 1009,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[16],
		attr = {
			__size = 6,
			damageReduce = 8000,
			finalDamageDeepen = 8000,
			block = -8000,
			finalDamageReduce = 8000,
			damageDeepen = 8000,
			strike = -8000
		},
		combatPowerLimit = slot0[18]
	},
	[1010] = {
		buffProbRate = -0.1,
		buffValueRate = 0.15,
		id = 1010,
		groupKey = "c.groupdebuff_groupbuff()",
		fightPointRate = slot0[17],
		attr = slot0[14],
		combatPowerLimit = slot0[18]
	},
	[1011] = {
		id = 1011,
		groupKey = "c.groupstun()",
		fightPointRate = slot0[1],
		combatPowerLimit = slot0[18]
	},
	[1012] = {
		groupKey = "c.groupstun()",
		id = 1012,
		buffProbRate = -0.01,
		fightPointRate = slot0[3],
		combatPowerLimit = slot0[18]
	},
	[1013] = {
		groupKey = "c.groupstun()",
		id = 1013,
		buffProbRate = -0.015,
		fightPointRate = slot0[5],
		combatPowerLimit = slot0[18]
	},
	[1014] = {
		groupKey = "c.groupstun()",
		id = 1014,
		buffProbRate = -0.02,
		fightPointRate = slot0[7],
		combatPowerLimit = slot0[18]
	},
	[1015] = {
		groupKey = "c.groupstun()",
		id = 1015,
		buffProbRate = -0.025,
		fightPointRate = slot0[9],
		combatPowerLimit = slot0[18]
	},
	[1016] = {
		groupKey = "c.groupstun()",
		id = 1016,
		buffProbRate = -0.03,
		fightPointRate = slot0[11],
		combatPowerLimit = slot0[18]
	},
	[1017] = {
		groupKey = "c.groupstun()",
		id = 1017,
		buffProbRate = -0.035,
		fightPointRate = slot0[13],
		combatPowerLimit = slot0[18]
	},
	[1018] = {
		groupKey = "c.groupstun()",
		id = 1018,
		buffProbRate = -0.04,
		fightPointRate = slot0[15],
		combatPowerLimit = slot0[18]
	},
	[1019] = {
		groupKey = "c.groupstun()",
		id = 1019,
		buffProbRate = -0.045,
		fightPointRate = slot0[16],
		combatPowerLimit = slot0[18]
	},
	[1020] = {
		groupKey = "c.groupstun()",
		id = 1020,
		buffProbRate = -0.05,
		fightPointRate = slot0[17],
		combatPowerLimit = slot0[18]
	},
	__default = {
		__index = {
			buffProbRate = 0,
			buffValueRate = 1,
			groupKey = "",
			fightPointRate = {},
			attr = {
				__size = 0
			},
			excludeBuffID = {},
			combatPowerLimit = {
				__size = 0
			}
		}
	}
}

return csv.combat_power_correction
