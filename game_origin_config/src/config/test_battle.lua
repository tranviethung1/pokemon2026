slot0 = {
	{
		__size = 0
	},
	__size = 1
}
csv.test_battle = {
	__size = 3,
	[2] = {
		defence = 3000,
		roleForce = 1,
		damage = 10000,
		specialDefence = 3000,
		speed = 19,
		roleId = 7049,
		classify = 3,
		specialDamage = 10000,
		id = 2,
		level = 1
	},
	[8] = {
		defence = 3000,
		roleForce = 1,
		damage = 10000,
		specialDefence = 3000,
		speed = 18,
		roleId = 4082,
		classify = 3,
		specialDamage = 10000,
		id = 8,
		level = 1
	},
	[3] = {
		defence = 3000,
		roleForce = 1,
		damage = 10000,
		specialDefence = 3000,
		speed = 17,
		roleId = 4102,
		classify = 3,
		specialDamage = 10000,
		id = 3,
		level = 1
	},
	__default = {
		__index = {
			specialDefence = 1,
			damage = 1,
			mp1Recover = 1,
			natureRestraint = 1,
			mp2 = 1,
			damageDeepen = 1,
			level = 90,
			hit = 10000,
			classify = 0,
			damageReduce = 1,
			rebound = 0,
			strikeResistance = 1,
			star = 5,
			mp2Recover = 1,
			defence = 1,
			controlPer = 1,
			hpRecover = 1,
			block = 1,
			strike = 1,
			speed = 1,
			hp = 1400000,
			immuneControl = 1,
			suckBlood = 0,
			breakBlock = 1,
			specialDefenceIgnore = 1,
			defenceIgnore = 1,
			ultimateAdd = 0,
			ultimateSub = 0,
			dodge = 1,
			specialDamage = 1,
			damageSub = 1,
			activeSkill = 0,
			mp1 = 1000,
			damageAdd = 1,
			blockPower = 1,
			strikeDamage = 15000,
			cure = 1,
			skills = ({
				default = slot0[1]
			}).default,
			fight_soul = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.test_battle
