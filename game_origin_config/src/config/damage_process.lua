slot0 = {
	{
		__size = 2,
		damageAdd = {
			"setValue(list(\"ignoreDamageSub\"),list(ifElse(less(target:mp1(),target:mp1Max()),attacker:ignoreDamageSub()*10000+1000+600*attacker:getBuffOverlayCount(4121652)+2000,attacker:ignoreDamageSub()*10000+1000+600*attacker:getBuffOverlayCount(4121652))))"
		},
		reduce = {
			"setValue(list(\"specialDefenceIgnore\"),list(ifElse(less(target:mp1(),target:mp1Max()),attacker:specialDefenceIgnore()*10000+4000,attacker:specialDefenceIgnore()*10000)))"
		}
	},
	[4] = {
		__size = 4,
		calcInternalDamageFinish = {
			"setValue(list(\"calFinalDamage\"),list(calFinalDamage*(1+0.05*attacker:getBuffOverlayCount(4101131))))"
		},
		damageAdd = {
			"setValue(list(\"damageSub\"),list(target:damageSub()*10000-5000))"
		},
		finalRate = {
			"setValue(list(\"finalDamageSub\"),list(target:finalDamageSub()*10000-5000))"
		},
		reduce = {
			"setValue(list(\"specialDefenceIgnore\"),list(attacker:specialDefenceIgnore()*10000+5000))"
		}
	},
	[15] = {
		__size = 2,
		buffAdd = {
			"setValue(list(\"damageRateAdd\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:damageRateAdd()+(moreThan(div((attacker:speed()-target:speed()),attacker:speed(),attacker:speed()/1000)*2,0.6) and 0.6 or div((attacker:speed()-target:speed()),attacker:speed(),attacker:speed()/1000)*2),attacker:damageRateAdd())))"
		},
		reduce = {
			"setValue(list(\"specialDefenceIgnore\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:specialDefenceIgnore()*10000+1000+(attacker:skillLv(33016,33026,33036) or 0)*10,attacker:specialDefenceIgnore()*10000)))"
		}
	},
	[27] = {
		__size = 1,
		reduce = {
			"setValue(list(\"specialDefenceIgnore\"),list(ifElse(more(attacker:star(),7) and target:hasBuffGroup(1500,1510,1520),attacker:specialDefenceIgnore()*10000+2000,attacker:specialDefenceIgnore()*10000)))"
		}
	},
	[31] = {
		__size = 2,
		damageAdd = {
			"setValue(list(\"ignoreDamageSub\"),list(ifElse((attacker:unitID()==3261 or attacker:unitID()==3263) and target:hasBuff(3262117),attacker:ignoreDamageSub()*10000+4000,attacker:ignoreDamageSub()*10000)))"
		},
		reduce = {
			"setValue(list(\"specialDefenceIgnore\",\"defenceIgnore\"),list(ifElse(((attacker:unitID()==3261 or attacker:unitID()==3263) and target:hasBuff(3262117)),attacker:specialDefenceIgnore()*10000+3000,attacker:specialDefenceIgnore()*10000) ,ifElse(((attacker:unitID()==3261 or attacker:unitID()==3263) and target:hasBuff(3262117)),attacker:defenceIgnore()*10000+3000,attacker:defenceIgnore()*10000)) )"
		}
	},
	[41] = {
		__size = 2,
		damageAdd = {
			"setValue(list(\"ignoreDamageSub\"),list(ifElse(less(target:mp1(),target:mp1Max()),attacker:ignoreDamageSub()*10000+1000+600*attacker:getBuffOverlayCount(4121652)+2000,attacker:ignoreDamageSub()*10000+1000+600*attacker:getBuffOverlayCount(4121652))))"
		},
		damageHit = {
			"setValue(list(\"damageHit\"),list(attacker:damageHit()*10000+2500*attacker:getBuffOverlayCount(4121652)))"
		}
	},
	[42] = {
		__size = 1,
		calcInternalDamageFinish = {
			"setValue(list(\"calFinalDamage\"),list(calFinalDamage*(1+0.05*attacker:getBuffOverlayCount(4121652))))"
		}
	}
}
csv.damage_process = {
	{
		finalSkillAdd = "sum1",
		strike = "multiply",
		ultimateAdd = "multiply",
		behead = "sum1",
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		calcInternalDamageFinish = "out",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		limit = 10000,
		fatal = "sum1",
		damageHit = "multiply",
		id = 1
	},
	{
		id = 2
	},
	{
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		natureDelta = "sum2",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 3
	},
	{
		id = 4,
		nature = "multiply",
		natureDelta = "sum2",
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	{
		shield = "jump",
		id = 5,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	{
		immuneDamage = "jump",
		id = 6,
		lockHp = "jump",
		immuneSpecialDamage = "jump",
		immuneAllDamage = "jump",
		immunePhysicalDamage = "jump",
		keepHpUnChanged = "jump"
	},
	{
		block = "multiply",
		id = 7,
		strike = "multiply",
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	{
		shield = "jump",
		dmgDelta = "multiply|max(sum2(1),0.05)",
		block = "multiply",
		immuneSpecialDamage = "jump",
		id = 8,
		immunePhysicalDamage = "jump",
		strike = "multiply"
	},
	{
		shield = "jump",
		delayDamage = "jump",
		suckblood = "jump",
		immuneSpecialDamage = "jump",
		assimilateDamage = "jump",
		damageLink = "jump",
		groupShield = "jump",
		finalRate = "jump",
		lockHp = "jump",
		immuneAllDamage = "jump",
		protection = "jump",
		rebound = "jump",
		immuneDamage = "jump",
		damageAllocate = "jump",
		keepHpUnChanged = "jump",
		leave = "jump",
		stealth = "jump",
		ignoreRoundDamage = "jump",
		id = 9,
		immunePhysicalDamage = "jump",
		freeze = "jump"
	},
	{
		shield = "jump",
		damageAllocate = "jump",
		delayDamage = "jump",
		damageLink = "jump",
		groupShield = "jump",
		finalRate = "jump",
		id = 10,
		protection = "jump",
		freeze = "jump",
		assimilateDamage = "jump"
	},
	{
		shield = "jump",
		damageAdd = "multiply|max(sum2(1),0.05)",
		nature = "multiply",
		natureDelta = "sum2",
		groupShield = "jump",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 11
	},
	{
		shield = "jump",
		damageAllocate = "jump",
		groupShield = "jump",
		dmgDelta = "multiply|max(sum2(1),0.05)",
		id = 12,
		protection = "jump",
		damageLink = "jump",
		freeze = "jump"
	},
	{
		shield = "jump",
		damageAllocate = "jump",
		groupShield = "jump",
		damageLink = "jump",
		id = 13,
		protection = "jump",
		freeze = "jump"
	},
	{
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		strike = "multiply",
		natureDelta = "sum2",
		block = "multiply",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 14
	},
	{
		id = 15,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	{
		reduce = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		nature = "multiply",
		dmgDelta = "sum2",
		id = 16,
		damageDeepen = "sum2",
		limit = 10000,
		freeze = "jump"
	},
	{
		id = 17,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	{
		shield = "jump",
		delayDamage = "jump",
		nature = "multiply",
		immuneSpecialDamage = "jump",
		suckblood = "jump",
		assimilateDamage = "jump",
		block = "multiply",
		damageLink = "jump",
		groupShield = "jump",
		finalRate = "jump",
		lockHp = "jump",
		result = "jump",
		immuneAllDamage = "jump",
		protection = "jump",
		rebound = "jump",
		immuneDamage = "jump",
		damageAllocate = "jump",
		keepHpUnChanged = "jump",
		leave = "jump",
		strike = "multiply",
		stealth = "jump",
		ignoreRoundDamage = "jump",
		damageHit = "multiply",
		id = 18,
		immunePhysicalDamage = "jump",
		freeze = "jump"
	},
	{
		id = 19
	},
	{
		id = 20,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	{
		id = 21,
		damageAllocate = "jump",
		shield = "jump",
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	{
		shield = "jump",
		damageAdd = "multiply|max(sum2(1),0.05)",
		natureDelta = "sum2",
		damageAllocate = "jump",
		damageDeepen = "sum2",
		limit = 10000,
		nature = "multiply",
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 22,
		preBehaviour = slot0[1]
	},
	{
		strike = "multiply",
		ultimateAdd = "multiply",
		behead = "sum1",
		skillPower = "multiply",
		natureDelta = "sum2",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		limit = 10000,
		fatal = "sum1",
		id = 23,
		preBehaviour = {
			__size = 3,
			buffAdd = {
				"setValue(list(\"damageRateAdd\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:damageRateAdd()+(moreThan(div((attacker:speed()-target:speed()),attacker:speed(),attacker:speed()/1000)*3,1) and 1 or div((attacker:speed()-target:speed()),attacker:speed(),attacker:speed()/1000)*3),attacker:damageRateAdd())))"
			},
			damageAdd = {
				"setValue(list(\"ignoreDamageSub\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:ignoreDamageSub()*10000+2,attacker:ignoreDamageSub()*10000)))"
			},
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:specialDefenceIgnore()*10000+2000+(attacker:skillLv(33046) or 0)*10,attacker:specialDefenceIgnore()*10000)))"
			}
		}
	},
	{
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		natureDelta = "sum2",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 24,
		preBehaviour = {
			__size = 2,
			damageAdd = {
				"setValue(list(\"damageSub\"),list(target:damageSub()*5000))"
			},
			reduce = {
				"setValue(list(\"defenceIgnore\"),list(attacker:defenceIgnore()*10000+5000))"
			}
		}
	},
	{
		dmgDelta = "multiply|max(sum2(1),0.05)",
		id = 25,
		immuneSpecialDamage = "jump",
		block = "multiply",
		immunePhysicalDamage = "jump",
		strike = "multiply"
	},
	{
		shield = "jump",
		dmgDelta = "multiply|max(sum2(1),0.05)",
		block = "multiply",
		immuneSpecialDamage = "jump",
		id = 26,
		immunePhysicalDamage = "jump",
		strike = "multiply"
	},
	{
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		strike = "multiply",
		natureDelta = "sum2",
		block = "multiply",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 27
	},
	{
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		natureDelta = "sum2",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 28,
		preBehaviour = slot0[1]
	},
	{
		freeze = "jump",
		damageAllocate = "jump",
		delayDamage = "jump",
		groupShield = "jump",
		finalRate = "jump",
		id = 29,
		protection = "jump",
		damageLink = "jump",
		assimilateDamage = "jump"
	},
	{
		groupShield = "jump",
		damageDeepen = "sum2",
		reduce = "multiply",
		damageAllocate = "jump",
		nature = "multiply",
		ultimateAdd = "multiply",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		behead = "sum1",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		skillPower = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		limit = 10000,
		fatal = "sum1",
		id = 30,
		preBehaviour = slot0[4]
	},
	{
		groupShield = "jump",
		damageDeepen = "sum2",
		reduce = "multiply",
		damageAllocate = "jump",
		nature = "multiply",
		ultimateAdd = "multiply",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		behead = "sum1",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		skillPower = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		limit = 10000,
		fatal = "sum1",
		id = 31,
		preBehaviour = {
			__size = 4,
			calcInternalDamageFinish = {
				"setValue(list(\"calFinalDamage\"),list(calFinalDamage*(1+0.05*attacker:getBuffOverlayCount(4101131))))"
			},
			damageAdd = {
				"setValue(list(\"damageSub\"),list(target:damageSub()*10000-5000))"
			},
			finalRate = {
				"setValue(list(\"finalDamageSub\"),list(target:finalDamageSub()*10000-5000))"
			},
			reduce = {
				"setValue(list(\"defenceIgnore\"),list(attacker:defenceIgnore()*10000+5000))"
			}
		}
	},
	{
		shield = "jump",
		id = 32,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	__size = 184,
	[33] = {
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		strike = "multiply",
		natureDelta = "sum2",
		block = "multiply",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 33
	},
	[34] = {
		shield = "jump",
		damageDeepen = "sum2",
		reduce = "multiply",
		nature = "multiply",
		limit = 10000,
		ultimateAdd = "multiply",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		behead = "sum1",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		skillPower = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		natureDelta = "sum2",
		fatal = "sum1",
		id = 34,
		preBehaviour = slot0[4]
	},
	[35] = {
		dmgDelta = "multiply|max(sum2(1),0.05)",
		id = 35,
		immuneSpecialDamage = "jump",
		block = "multiply",
		immunePhysicalDamage = "jump"
	},
	[101] = {
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		limit = 10000,
		dmgDelta = "sum2",
		damageDeepen = "sum2",
		natureDelta = "sum2",
		reduce = "multiply",
		gateDelta = "sum2",
		damageHit = "multiply",
		id = 101
	},
	[201] = {
		groupShield = "jump",
		delayDamage = "jump",
		id = 201
	},
	[301] = {
		shield = "jump",
		damageAllocate = "jump",
		immuneSpecialDamage = "jump",
		keepHpUnChanged = "jump",
		delayDamage = "jump",
		immuneDamage = "jump",
		id = 301,
		immunePhysicalDamage = "jump",
		groupShield = "jump",
		finalRate = "jump",
		damageLink = "jump",
		immuneAllDamage = "jump",
		protection = "jump",
		freeze = "jump",
		assimilateDamage = "jump"
	},
	[401] = {
		id = 401,
		protection = "jump",
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[501] = {
		groupShield = "jump",
		damageAllocate = "jump",
		dmgDelta = "multiply|max(sum2(1),0.05)",
		id = 501,
		limit = 10000
	},
	[1003] = {
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		natureDelta = "sum2",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 1003
	},
	[1015] = {
		id = 1015,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[1972212] = {
		id = 1972212,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[3651609] = {
		reduce = "multiply",
		strike = "multiply",
		damageDeepen = "sum2",
		skillPower = "multiply",
		natureDelta = "sum2",
		ultimateAdd = "multiply",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		behead = "sum1",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		limit = 10000,
		fatal = "sum1",
		id = 3651609
	},
	[2001] = {
		id = 2001,
		finalRate = "jump"
	},
	[2002] = {
		id = 2002
	},
	[36337] = {
		calcInternalDamageFinish = "out",
		id = 36337,
		limit = 10000
	},
	[36338] = {
		id = 36338,
		finalRate = "jump"
	},
	[2003] = {
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		natureDelta = "sum2",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 2003
	},
	[3002] = {
		id = 3002,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3651335] = {
		id = 3651335,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3003] = {
		id = 3003,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3651334] = {
		id = 3651334,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3005] = {
		id = 3005,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3006] = {
		id = 3006,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3008] = {
		id = 3008,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3001] = {
		id = 3001,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3004] = {
		id = 3004,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3007] = {
		id = 3007,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3009] = {
		id = 3009,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3010] = {
		id = 3010,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3011] = {
		id = 3011,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3012] = {
		id = 3012,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3013] = {
		id = 3013,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3014] = {
		id = 3014,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3015] = {
		id = 3015,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3016] = {
		id = 3016,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3017] = {
		id = 3017,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[3018] = {
		id = 3018,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)"
	},
	[9999] = {
		id = 9999
	},
	[10000] = {
		nature = "multiply",
		calcInternalDamageFinish = "out",
		buffAdd = "multiply",
		id = 10000,
		extraAdd = "multiply|0.05"
	},
	[10001] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 10001,
		preBehaviour = {
			__size = 1,
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:specialDefenceIgnore()*10000+3500,attacker:specialDefenceIgnore()*10000)))"
			}
		}
	},
	[10002] = {
		id = 10002,
		preBehaviour = {
			__size = 1,
			shield = {
				"setValue(list(\"shieldHp\"),list(ifElse( more(attacker:star() , 10),0,target:shieldHp() )))"
			}
		}
	},
	[111] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 111,
		preBehaviour = {
			__size = 1,
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(ifElse(more(attacker:star(),7) and target:hasBuffGroup(1500,1510,1520),attacker:specialDefenceIgnore()*10000+2000+(attacker:skillLv(116,126,136) or 0)*10-10,attacker:specialDefenceIgnore()*10000)))"
			}
		}
	},
	[112] = {
		id = 112
	},
	[141] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 141,
		preBehaviour = {
			__size = 1,
			reduce = {
				"setValue(list(\"defenceIgnore\"),list(ifElse(more(attacker:star(),7) and target:hasBuffGroup(1500,1510,1520),attacker:defenceIgnore()*10000+2000,attacker:defenceIgnore()*10000)))"
			}
		}
	},
	[142] = {
		id = 142
	},
	[151] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 151,
		preBehaviour = {
			__size = 1,
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(ifElse( target:hasBuffGroup(1500,1510,1520),attacker:specialDefenceIgnore()*10000+2000+(attacker:skillLv(156) or 0)*10-10,attacker:specialDefenceIgnore()*10000)))"
			}
		}
	},
	[152] = {
		id = 152
	},
	[7611] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 7611,
		preBehaviour = {
			__size = 2,
			damageAdd = {
				"setValue(list(\"ignoreDamageSub\"),list(ifElse(more(attacker:star(),7) and more(attacker:speed(),target:speed()),attacker:ignoreDamageSub()*10000+2000,attacker:ignoreDamageSub()*10000)))"
			},
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(ifElse(more(attacker:star(),7) and more(attacker:speed(),target:speed()),attacker:specialDefenceIgnore()*10000+3000,attacker:specialDefenceIgnore()*10000 )))"
			}
		}
	},
	[7612] = {
		id = 7612
	},
	[19911] = {
		reduce = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		nature = "multiply",
		dmgDelta = "sum2",
		id = 19911,
		damageDeepen = "sum2",
		limit = 10000
	},
	[19811] = {
		finalSkillAdd = "sum1",
		strike = "multiply",
		ultimateAdd = "multiply",
		behead = "sum1",
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		calcInternalDamageFinish = "out",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		limit = 10000,
		fatal = "sum1",
		damageHit = "multiply",
		id = 19811
	},
	[19812] = {
		id = 19812,
		immuneSpecialDamage = "jump"
	},
	[8011] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 8011,
		preBehaviour = {
			__size = 1,
			buffAdd = {
				"setValue(list(\"damageRateAdd\"),list(ifElse(target:hasBuffGroup(1301,1311,1321),attacker:damageRateAdd()+0.3,attacker:damageRateAdd())))"
			}
		}
	},
	[8012] = {
		id = 8012
	},
	[24811] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 24811,
		preBehaviour = {
			__size = 1,
			buffAdd = {
				"setValue(list(\"damageRateAdd\"),list(ifElse(target:hasBuffGroup(11),attacker:damageRateAdd()+0.3+(attacker:skillLv(24816,24826,24836) or 0)*0.002-0.002+ifElse(moreEqualThan(attacker:star(), 8),0.2,0),attacker:damageRateAdd())))"
			}
		}
	},
	[24812] = {
		id = 24812
	},
	[30111] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 30111,
		preBehaviour = {
			__size = 1,
			strike = {
				"setValue(list(\"strike\",\"strikeDamage\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:strike()*10000+(attacker:flagZ3() and 5000 or 3000),attacker:strike()*10000),ifElse(more(attacker:speed(),target:speed()),attacker:strikeDamage()*10000+3000,attacker:strikeDamage()*10000)))"
			}
		}
	},
	[30112] = {
		id = 30112
	},
	[33011] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 33011,
		preBehaviour = slot0[15]
	},
	[33012] = {
		id = 33012
	},
	[33021] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 33021,
		preBehaviour = slot0[15]
	},
	[33022] = {
		id = 33022
	},
	[33031] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 33031,
		preBehaviour = {
			__size = 3,
			buffAdd = {
				"setValue(list(\"damageRateAdd\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:damageRateAdd()+(moreThan(div((attacker:speed()-target:speed()),attacker:speed(),attacker:speed()/1000)*2,0.6) and 0.6 or div((attacker:speed()-target:speed()),attacker:speed(),attacker:speed()/1000)*2),attacker:damageRateAdd())))"
			},
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:specialDefenceIgnore()*10000+1000+(attacker:skillLv(33016,33026,33036) or 0)*10,attacker:specialDefenceIgnore()*10000)))"
			},
			strike = {
				"setValue(list(\"strike\",\"strikeDamage\"),list(ifElse(more(attacker:star() , 10) and target:hasBuffGroup(1301,1311,1321),attacker:strike()*10000+2000,attacker:strike()*10000),ifElse(more(attacker:star() , 10) and target:hasBuffGroup(1301,1311,1321),attacker:strikeDamage()*10000+3000,attacker:strikeDamage()*10000)))"
			}
		}
	},
	[33032] = {
		id = 33032
	},
	[33041] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 33041,
		preBehaviour = {
			__size = 2,
			buffAdd = {
				"setValue(list(\"damageRateAdd\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:damageRateAdd()+(moreThan(div((attacker:speed()-target:speed()),attacker:speed(),0)*3,0.98) and 0.92 or div((attacker:speed()-target:speed()),attacker:speed(),0)*3),attacker:damageRateAdd())))"
			},
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:specialDefenceIgnore()*10000+2000+(attacker:skillLv(33046) or 0)*10,attacker:specialDefenceIgnore()*10000)))"
			}
		}
	},
	[33042] = {
		id = 33042
	},
	[33043] = {
		calcInternalDamageFinish = "out",
		id = 33043,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[33044] = {
		id = 33044
	},
	[22411] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 22411,
		preBehaviour = {
			__size = 1,
			buffAdd = {
				"setValue(list(\"damageRateAdd\"),list((arg.natureFlag==\"strong\" and attacker:damageRateAdd()+(0.2+(attacker:skillLv(22416,22426) or 0)*0.0015-0.0015) or attacker:damageRateAdd() )))"
			}
		}
	},
	[22412] = {
		id = 22412
	},
	[22421] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 22421,
		preBehaviour = {
			__size = 2,
			buffAdd = {
				"setValue(list(\"damageRateAdd\"),list((arg.natureFlag==\"strong\" and attacker:damageRateAdd()+(0.2+(attacker:skillLv(22416,22426) or 0)*0.0015-0.0015) or attacker:damageRateAdd() )))"
			},
			strike = {
				"setValue(list(\"strike\"),list((arg.natureFlag==\"strong\" and attacker:strike()*10000+2000 or attacker:strike()*10000)))"
			}
		}
	},
	[22422] = {
		id = 22422
	},
	[35111] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 35111,
		preBehaviour = {
			__size = 1,
			reduce = {
				"setValue(list(\"defenceIgnore\"),list(ifElse(more(attacker:speed(),target:speed()),attacker:defenceIgnore()*10000+(30+(attacker:skillLv(35116) or 0)*0.2-0.2)*100,attacker:defenceIgnore()*10000)))"
			}
		}
	},
	[35112] = {
		id = 35112
	},
	[29911] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 29911,
		preBehaviour = {
			__size = 1,
			strike = {
				"setValue(list(\"strike\"),list(ifElse(more(attacker:star(),11) and target:hasBuff(2991127),attacker:strike()*10000+2000,attacker:strike()*10000)))"
			}
		}
	},
	[29912] = {
		id = 29912
	},
	[36311] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 36311,
		preBehaviour = {
			__size = 3,
			damageAdd = {
				"setValue(list(\"damageSub\"),list(ifElse(more(target:damageSub(),attacker:damageAdd()),target:damageSub()*(5000+attacker:level()*50),target:damageSub()*10000)))"
			},
			damageDeepen = {
				"setValue(list(\"damageReduce\"),list(ifElse(less(target:damageDeepen(),attacker:damageReduce()),attacker:damageReduce()*(5000+attacker:level()*50),attacker:damageReduce()*10000)))"
			},
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(attacker:specialDefenceIgnore()*10000+(6000-attacker:level()*60)))"
			}
		}
	},
	[36312] = {
		id = 36312
	},
	[19414] = {
		finalSkillAdd = "sum1",
		suckblood = "jump",
		behead = "sum1",
		damageDeepen = "sum2",
		limit = 10000,
		ultimateAdd = "multiply",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		skillPower = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		calcInternalDamageFinish = "out",
		natureDelta = "sum2",
		rebound = "jump",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 19414
	},
	[19415] = {
		id = 19415,
		suckblood = "jump",
		rebound = "jump"
	},
	[19611] = {
		finalSkillAdd = "sum1",
		strike = "multiply",
		ultimateAdd = "multiply",
		behead = "sum1",
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		calcInternalDamageFinish = "out",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		limit = 10000,
		fatal = "sum1",
		damageHit = "multiply",
		id = 19611
	},
	[19612] = {
		id = 19612,
		preBehaviour = {
			__size = 1,
			calcInternalDamageFinish = {
				"setValue(list(\"calFinalDamage\"),list(calFinalDamage*(moreE(attacker:sumBuffOverlayByGroup(1961132),6) and 0.8*0.8*0.8*0.8*0.8 or (moreE(attacker:sumBuffOverlayByGroup(1961132),5) and 0.8*0.8*0.8*0.8 or (moreE(attacker:sumBuffOverlayByGroup(1961132),4) and 0.8*0.8*0.8 or (moreE(attacker:sumBuffOverlayByGroup(1961132),3) and 0.8*0.8 or (moreE(attacker:sumBuffOverlayByGroup(1961132),2) and 0.8 or (moreE(attacker:sumBuffOverlayByGroup(1961132),1) and 1 or 1))))))))"
			}
		}
	},
	[19621] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 19621,
		preBehaviour = {
			__size = 1,
			buffAdd = {
				"setValue(list(\"damageRateAdd\"),list((arg.natureFlag==\"strong\" and attacker:damageRateAdd()+(0.5) or attacker:damageRateAdd() )))"
			}
		}
	},
	[19622] = {
		id = 19622,
		preBehaviour = {
			__size = 1,
			calcInternalDamageFinish = {
				"setValue(list(\"calFinalDamage\"),list(calFinalDamage*(moreE(attacker:sumBuffOverlayByGroup(1961132),6) and 1*1*1*1*1 or (moreE(attacker:sumBuffOverlayByGroup(1961132),5) and 1*1*1*1 or (moreE(attacker:sumBuffOverlayByGroup(1961132),4) and 1*1*1 or (moreE(attacker:sumBuffOverlayByGroup(1961132),3) and 1*1 or (moreE(attacker:sumBuffOverlayByGroup(1961132),2) and 1 or (moreE(attacker:sumBuffOverlayByGroup(1961132),1) and 1 or 1))))))))"
			}
		}
	},
	[19623] = {
		id = 19623,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)",
		freeze = "jump"
	},
	[19631] = {
		id = 19631,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)",
		calcInternalDamageFinish = "out"
	},
	[19632] = {
		id = 19632
	},
	[19641] = {
		id = 19641,
		nature = "multiply",
		natureDelta = "multiply|max(sum2(1),0.05)",
		calcInternalDamageFinish = "out"
	},
	[19642] = {
		id = 19642
	},
	[23511] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 23511,
		preBehaviour = {
			__size = 1,
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(ifElse(more(target:specialDefence(),target:defence()),attacker:specialDefenceIgnore()*10000+300+attacker:level()*3-3,attacker:specialDefenceIgnore()*10000 )))"
			}
		}
	},
	[23512] = {
		id = 23512
	},
	[13011] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 13011,
		preBehaviour = slot0[27]
	},
	[13012] = {
		id = 13012
	},
	[13041] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 13041,
		preBehaviour = slot0[27]
	},
	[13042] = {
		id = 13042
	},
	[13043] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 13043,
		preBehaviour = {
			__size = 2,
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(ifElse(more(attacker:star(),7) and target:hasBuffGroup(c.zhuoshao_oc()),attacker:specialDefenceIgnore()*10000+2000,attacker:specialDefenceIgnore()*10000)))"
			},
			strike = {
				"setValue(list(\"strikeDamage\"),list((target:hasBuffGroup(c.zhuoshao_oc()) and attacker:strikeDamage()*10000+8000 or attacker:strikeDamage()*10000)))"
			}
		}
	},
	[13044] = {
		id = 13044
	},
	[23611] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 23611,
		preBehaviour = {
			__size = 1,
			buffAdd = {
				"setValue(list(\"damageRateAdd\"),list(ifElse(more(attacker:specialDefence(),target:specialDefence()),attacker:damageRateAdd()+(moreThan(div((attacker:specialDefence()-target:specialDefence()),attacker:specialDefence(),attacker:specialDefence()/1000)*1,0.03) and 0.03 or div((attacker:specialDefence()-target:specialDefence()),attacker:specialDefence(),attacker:specialDefence()/1000)*1),attacker:damageRateAdd())))"
			}
		}
	},
	[23612] = {
		id = 23612
	},
	[24421] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 24421,
		preBehaviour = {
			__size = 2,
			damageAdd = {
				"setValue(list(\"damageSub\"),list(ifElse(more(target:damageSub(),attacker:damageAdd()),target:damageSub()*10000-1000,target:damageSub()*10000)))"
			},
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(attacker:specialDefenceIgnore()*10000+1000))"
			}
		}
	},
	[24422] = {
		id = 24422
	},
	[32611] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 32611,
		preBehaviour = slot0[31]
	},
	[32612] = {
		id = 32612
	},
	[32613] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 32613,
		preBehaviour = slot0[31]
	},
	[32614] = {
		id = 32614
	},
	[32615] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 32615,
		preBehaviour = {
			__size = 3,
			buffAdd = {
				"setValue(list(\"damageRateAdd\"),list(ifElse((attacker:unitID()==3261 or attacker:unitID()==3263) and target:hasBuffGroup(36),attacker:damageRateAdd()+0.3,attacker:damageRateAdd())))"
			},
			damageAdd = {
				"setValue(list(\"ignoreDamageSub\"),list(ifElse((attacker:unitID()==3261 or attacker:unitID()==3263) and target:hasBuff(3262117),attacker:ignoreDamageSub()*10000+4000,attacker:ignoreDamageSub()*10000)))"
			},
			reduce = {
				"setValue(list(\"specialDefenceIgnore\",\"defenceIgnore\"),list(ifElse(((attacker:unitID()==3261 or attacker:unitID()==3263) and target:hasBuff(3262117)),attacker:specialDefenceIgnore()*10000+3000,attacker:specialDefenceIgnore()*10000),ifElse(((attacker:unitID()==3261 or attacker:unitID()==3263) and target:hasBuff(3262117)),attacker:defenceIgnore()*10000+3000,attacker:defenceIgnore()*10000)))"
			}
		}
	},
	[32616] = {
		id = 32616,
		preBehaviour = {
			__size = 1,
			suckblood = {
				"setValue(list(\"suckBlood\"),list(ifElse((attacker:unitID()==3261 or attacker:unitID()==3263) and target:hasBuffGroup(36),attacker:suckBlood()+2500,attacker:suckBlood())))"
			}
		}
	},
	[31411] = {
		finalSkillAdd = "sum1",
		strike = "multiply",
		ultimateAdd = "multiply",
		behead = "sum1",
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		calcInternalDamageFinish = "out",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		limit = 10000,
		fatal = "sum1",
		damageHit = "multiply",
		id = 31411
	},
	[31412] = {
		id = 31412,
		preBehaviour = {
			__size = 1,
			calcInternalDamageFinish = {
				"setValue(list(\"calFinalDamage\"),list(calFinalDamage*(moreE(attacker:sumBuffOverlayByGroup(3143113)+attacker:sumBuffOverlayByGroup(3143115),12) and (1+0.01*random(1,4))*(1+0.01*random(1,4))*(1+0.01*random(1,4))*(1+0.01*random(1,4))*(1+0.01*random(1,4)) or (moreE(attacker:sumBuffOverlayByGroup(3143113)+attacker:sumBuffOverlayByGroup(3143115),10) and (1+0.01*random(1,4))*(1+0.01*random(1,4))*(1+0.01*random(1,4))*(1+0.01*random(1,4)) or (moreE(attacker:sumBuffOverlayByGroup(3143113)+attacker:sumBuffOverlayByGroup(3143115),8) and (1+0.01*random(1,4))*(1+0.01*random(1,4))*(1+0.01*random(1,4)) or (moreE(attacker:sumBuffOverlayByGroup(3143113)+attacker:sumBuffOverlayByGroup(3143115),6) and (1+0.01*random(1,4))*(1+0.01*random(1,4)) or (moreE(attacker:sumBuffOverlayByGroup(3143113)+attacker:sumBuffOverlayByGroup(3143115),4) and (1+0.01*random(1,4)) or (moreE(attacker:sumBuffOverlayByGroup(3143113)+attacker:sumBuffOverlayByGroup(3143115),2) and 1 or 1))))))))"
			}
		}
	},
	[32711] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 32711,
		preBehaviour = {
			__size = 4,
			damageAdd = {
				"setValue(list(\"ignoreDamageSub\"),list(ifElse(more(attacker:star(),11),attacker:ignoreDamageSub()*10000+1000,attacker:ignoreDamageSub()*10000)))"
			},
			init = {
				"setValue(list(\"damageType\"),list(ifElse(more(target:specialDefence(),target:defence()),0,1)))"
			},
			reduce = {
				"setValue(list(\"damage\",\"specialDamage\"),list(ifElse(more(target:specialDefence(),target:defence()),attacker:damage()*(1.3+0.003*(attacker:skillLv(32716) or 0)-0.003),attacker:damage()),ifElse(more(target:specialDefence(),target:defence()),attacker:specialDamage(),attacker:specialDamage()*(1.3+0.003*(attacker:skillLv(32716) or 0)-0.003))))"
			},
			strike = {
				"setValue(list(\"strike\"),list(ifElse(more(attacker:star(),10),attacker:strike()*10000+500,attacker:strike()*10000)))"
			}
		}
	},
	[32712] = {
		id = 32712
	},
	[32713] = {
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		natureDelta = "sum2",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 32713,
		preBehaviour = {
			__size = 2,
			init = {
				"setValue(list(\"damageType\"),list(ifElse(more(target:specialDefence(),target:defence()),0,1)))"
			},
			reduce = {
				"setValue(list(\"damage\",\"specialDamage\"),list(ifElse(more(target:specialDefence(),target:defence()),attacker:damage()*(1.2+0.002*(attacker:skillLv(32716) or 0)-0.002),attacker:damage()),ifElse(more(target:specialDefence(),target:defence()),attacker:specialDamage(),attacker:specialDamage()*(1.2+0.002*(attacker:skillLv(32716) or 0)-0.002))))"
			}
		}
	},
	[32714] = {
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		natureDelta = "sum2",
		damageDeepen = "sum2",
		limit = 10000,
		reduce = "multiply",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		id = 32714,
		preBehaviour = {
			__size = 2,
			init = {
				"setValue(list(\"damageType\"),list(ifElse(more(target:specialDefence(),target:defence()),0,1)))"
			},
			reduce = {
				"setValue(list(\"damage\",\"specialDamage\"),list(ifElse(more(target:specialDefence(),target:defence()),attacker:damage()*(1.05+0.0015*(attacker:skillLv(32716) or 0)-0.0015),attacker:damage()),ifElse(more(target:specialDefence(),target:defence()),attacker:specialDamage(),attacker:specialDamage()*(1.05+0.0015*(attacker:skillLv(32716) or 0)-0.0015))))"
			}
		}
	},
	[36111] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 36111,
		preBehaviour = {
			__size = 1,
			damageAdd = {
				"setValue(list(\"ignoreDamageSub\"),list(ifElse(target:hasBuffGroup(20),attacker:ignoreDamageSub()*10000+3000,attacker:ignoreDamageSub()*10000)))"
			}
		}
	},
	[36112] = {
		id = 36112
	},
	[36211] = {
		calcInternalDamageFinish = "out",
		id = 36211,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[36212] = {
		id = 36212
	},
	[39771] = {
		calcInternalDamageFinish = "out",
		id = 39771,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[39772] = {
		id = 39772
	},
	[41011] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 41011,
		preBehaviour = {
			__size = 3,
			damageAdd = {
				"setValue(list(\"damageSub\"),list(target:damageSub()*10000-5000))"
			},
			finalRate = {
				"setValue(list(\"finalDamageSub\"),list(target:finalDamageSub()*10000-5000))"
			},
			reduce = {
				"setValue(list(\"specialDefenceIgnore\"),list(attacker:specialDefenceIgnore()*10000+5000))"
			}
		}
	},
	[41012] = {
		id = 41012,
		preBehaviour = {
			__size = 1,
			calcInternalDamageFinish = {
				"setValue(list(\"calFinalDamage\"),list(calFinalDamage*(1+0.05*attacker:getBuffOverlayCount(4101131))))"
			}
		}
	},
	[41211] = {
		shield = "jump",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		calcInternalDamageFinish = "out",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		damageAdd = "multiply|max(sum2(1),0.05)",
		natureDelta = "sum2",
		nature = "multiply",
		damageAllocate = "jump",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 41211,
		preBehaviour = slot0[41]
	},
	[41212] = {
		id = 41212,
		damageAllocate = "jump",
		shield = "jump",
		preBehaviour = slot0[42]
	},
	[41231] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 41231,
		preBehaviour = slot0[41]
	},
	[41232] = {
		id = 41232,
		preBehaviour = slot0[42]
	},
	[41221] = {
		shield = "jump",
		damageAllocate = "jump",
		calcInternalDamageFinish = "out",
		dmgDelta = "multiply|max(sum2(1),0.05)",
		id = 41221
	},
	[41222] = {
		id = 41222,
		damageAllocate = "jump",
		shield = "jump",
		preBehaviour = slot0[42]
	},
	[41241] = {
		calcInternalDamageFinish = "out",
		id = 41241,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[41242] = {
		id = 41242,
		preBehaviour = slot0[42]
	},
	[41711] = {
		calcInternalDamageFinish = "out",
		id = 41711,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[41712] = {
		id = 41712
	},
	[41721] = {
		reduce = "multiply",
		strike = "multiply",
		ultimateAdd = "multiply",
		skillPower = "multiply",
		natureDelta = "sum2",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		behead = "sum1",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		limit = 10000,
		fatal = "sum1",
		damageHit = "multiply",
		id = 41721
	},
	[41722] = {
		id = 41722
	},
	[13961] = {
		reduce = "multiply",
		strike = "multiply",
		ultimateAdd = "multiply",
		skillPower = "multiply",
		natureDelta = "sum2",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		behead = "sum1",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		limit = 10000,
		fatal = "sum1",
		damageHit = "multiply",
		id = 13961
	},
	[13962] = {
		id = 13962
	},
	[40231] = {
		id = 40231,
		damageAllocate = "jump",
		calcInternalDamageFinish = "out",
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[40232] = {
		id = 40232,
		damageAllocate = "jump"
	},
	[40241] = {
		calcInternalDamageFinish = "out",
		id = 40241,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[40242] = {
		id = 40242
	},
	[36521] = {
		finalSkillAdd = "sum1",
		strike = "multiply",
		ultimateAdd = "multiply",
		behead = "sum1",
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		calcInternalDamageFinish = "out",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		limit = 10000,
		fatal = "sum1",
		damageHit = "multiply",
		id = 36521
	},
	[36522] = {
		id = 36522
	},
	[5411] = {
		calcInternalDamageFinish = "out",
		id = 5411,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[5412] = {
		id = 5412
	},
	[70481] = {
		id = 70481,
		calcInternalDamageFinish = "out",
		dmgDelta = "multiply|max(sum2(1),0.05)",
		block = "multiply",
		strike = "multiply"
	},
	[70482] = {
		id = 70482
	},
	[9970511] = {
		id = 9970511
	},
	[70611] = {
		calcInternalDamageFinish = "out",
		id = 70611,
		dmgDelta = "multiply|max(sum2(1),0.05)"
	},
	[70612] = {
		id = 70612
	},
	[70721] = {
		groupShield = "jump",
		nature = "multiply",
		calcInternalDamageFinish = "out",
		dmgDelta = "multiply|max(sum2(1),0.05)",
		id = 70721
	},
	[70722] = {
		id = 70722,
		groupShield = "jump"
	},
	[7641] = {
		calcInternalDamageFinish = "out",
		behead = "sum1",
		ultimateAdd = "multiply",
		limit = 10000,
		skillPower = "multiply",
		damageDeepen = "sum2",
		extraAdd = "multiply|max(sum1(1),0.05)",
		damageByHpRate = "sum1",
		reduce = "multiply",
		natureDelta = "sum2",
		gateDelta = "sum2",
		dmgDelta = "sum2",
		finalSkillAdd = "sum1",
		nature = "multiply",
		damageAdd = "multiply|max(sum2(1),0.05)",
		buffAdd = "multiply",
		block = "multiply",
		strike = "multiply",
		fatal = "sum1",
		damageHit = "multiply",
		id = 7641,
		preBehaviour = slot0[4]
	},
	[7642] = {
		id = 7642
	},
	__default = {
		__index = {
			shield = "run",
			suckblood = "run",
			immuneAllDamage = "run",
			immuneSpecialDamage = "run",
			assimilateDamage = "run",
			reflexDamage = "run",
			delayDamage = "run",
			invincible = "run",
			groupShield = "run",
			finalRate = "run",
			lockHp = "run",
			result = "run",
			calcInternalDamageFinish = "run",
			protection = "run",
			damageLink = "run",
			rebound = "run",
			immuneDamage = "run",
			damageAllocate = "run",
			keepHpUnChanged = "run",
			leave = "run",
			stealth = "run",
			ignoreRoundDamage = "run",
			immunePhysicalDamage = "run",
			freeze = "run"
		}
	}
}

return csv.damage_process
