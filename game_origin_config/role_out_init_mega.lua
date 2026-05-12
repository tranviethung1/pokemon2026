slot0 = {
	{
		__size = 0
	},
	__size = 1
}
csv.role_out_init_mega = {
	__size = 2,
	[2] = {
		defence = 35000,
		specialDefenceIgnore = 0,
		damage = 1500000,
		defenceIgnore = 0,
		specialDefence = 35000,
		roleId = 30501,
		strike = 20000,
		speed = 3000,
		classify = 3,
		specialDamage = 1500000,
		hp = 6000000,
		id = 2,
		star = 12,
		roleForce = 1
	},
	[8] = {
		defence = 30000,
		specialDefenceIgnore = 0,
		damage = 1500000,
		defenceIgnore = 0,
		specialDefence = 30000,
		roleId = 30502,
		strike = 20000,
		speed = 2500,
		classify = 3,
		specialDamage = 1500000,
		hp = 6000000,
		id = 8,
		star = 12,
		roleForce = 2
	},
	__default = {
		__index = {
			specialDefence = 1,
			damage = 1,
			mp1Recover = 1,
			natureRestraint = 0,
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
			hpRecover = 1,
			block = 1,
			strike = 1,
			speed = 1,
			hp = 1,
			suckBlood = 0,
			breakBlock = 1,
			specialDefenceIgnore = 1,
			defenceIgnore = 1,
			ultimateAdd = 0,
			ultimateSub = 0,
			dodge = 0,
			specialDamage = 1,
			damageSub = 1,
			activeSkill = 0,
			mp1 = 600,
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

return csv.role_out_init_mega
