csv.cross.union_adventure.car = {
	{
		radius = 82,
		name = "Common Magikarp Cart",
		res = "cross_union_adventure/che/liyuwangche.skel",
		specialDesc = "This Cart possesses a primal sense of beauty, with no excessive features beyond basic enhancements.",
		id = 1,
		scale = 2.19,
		show = {
			__size = 4,
			res = "jiyingchidoucar/lywc.skel",
			scale = 0.47,
			y = -20,
			x = -100
		},
		attrEffect = {
			"1%",
			nil,
			nil,
			nil,
			nil,
			nil,
			"1%",
			"1%",
			__size = 3
		}
	},
	{
		battleDeadAttack = 0.05,
		radius = 77,
		vip = 0,
		name = "Large Armor Self-Destruct Tracked Cart",
		speedEffect = -0.2,
		res = "cross_union_adventure/che/dajiache.skel",
		specialDesc = "When the driver's individual team is defeated, the Cart self-destructs! Deducting 5% of the maximum HP of each opponent's remaining Pokémon (this damage does not result in fainting).",
		id = 2,
		scale = 2.19,
		show = {
			__size = 4,
			res = "dajialvdaiche/dajialvdaiche.skel",
			scale = 1.2,
			y = 13,
			x = -15
		},
		cost = {
			gold = 3000000,
			coin21 = 20000,
			__size = 2
		},
		condition = {
			[1.0] = 20,
			__size = 1
		},
		attrEffect = {
			"3%",
			[27.0] = "3%",
			__size = 2
		}
	},
	{
		name = "Fast-shadow Heracross Cart",
		vip = 0,
		quality = 2,
		radius = 79,
		speedEffect = 0.2,
		res = "cross_union_adventure/che/zaijv3lanse.skel",
		specialDesc = "The Cart is very fast and has a 20% speed boost. Take the wheel and speed through the arena.",
		id = 3,
		scale = 2.19,
		show = {
			__size = 4,
			res = "helakeluosizhanche/helakeluosizhanche.skel",
			scale = 1.1,
			y = 40,
			x = -30
		},
		cost = {
			gold = 6000000,
			coin21 = 32000,
			__size = 2
		},
		condition = {
			[2.0] = 300,
			__size = 1
		},
		attrEffect = {
			__size = 3,
			[13.0] = "3%",
			[8.0] = "3%",
			[7.0] = "3%"
		}
	},
	{
		radius = 79,
		vip = 0,
		rebirthTimeEffect = 0.1,
		quality = 2,
		battleWinRecoverHPLimit = 0.5,
		name = "Politoed Aid Cart",
		battleWinRecoverHPTimeMax = 1,
		res = "cross_union_adventure/che/honglanerduo.skel",
		battleWinRecoverHP = 0.12,
		specialDesc = "After a victorious battle, when our team's total Pokémon HP percentage falls below 50%, restore 12% of the team's HP, with a maximum of 1 activation (as the theme effect will not trigger if HP is already below 50%).",
		id = 4,
		scale = 2.19,
		show = {
			__size = 4,
			res = "wenxiangwatangceqi/wenxiangwatanceqi.skel",
			scale = 1.13,
			y = 15,
			x = -15
		},
		cost = {
			gold = 8000000,
			coin21 = 45000,
			__size = 2
		},
		condition = {
			[2.0] = 600,
			__size = 1
		},
		attrEffect = {
			[9.0] = "3%",
			[10.0] = "3%",
			__size = 3,
			[28.0] = "3%"
		}
	},
	{
		name = "Pseudo-legendary Teleportation Aircraft",
		vip = 10,
		quality = 3,
		radius = 100,
		occupyTimeEffect = 0.2,
		transferTimes = 5,
		res = "cross_union_adventure/che/gaioukache.skel",
		specialDesc = "When the driver reappears at the base due to revival, they can use Pseudo-legendary teleportation to directly teleport to any of our team's stronghold, with only 5 chances per match (note: leaving the base after teleportation is considered as not using teleportation).",
		id = 5,
		scale = 2.19,
		show = {
			__size = 4,
			res = "gaioukafeixingqi/gaioukafeixingqi.skel",
			scale = 1.15,
			y = 0,
			x = -30
		},
		cost = {
			gold = 10000000,
			rmb = 3880,
			__size = 2
		},
		condition = {
			[1.0] = 10,
			__size = 1
		},
		attrEffect = {
			"3%",
			nil,
			nil,
			nil,
			nil,
			nil,
			"3%",
			"3%",
			__size = 3
		}
	},
	__size = 5,
	__default = {
		__index = {
			battleDeadAttack = 0,
			name = "",
			speed = 65,
			rebirthTimeEffect = 0,
			speedEffect = 0,
			radius = 75,
			transferTimes = 0,
			battleWinRecoverHPLimit = 1,
			battleWinRecoverHPTimeMax = -1,
			specialDesc = "",
			quality = 1,
			vip = 999,
			occupyTimeEffect = 0,
			produceDesc = "",
			res = "",
			battleWinRecoverHP = 0,
			scale = 2,
			show = {
				__size = 0
			},
			languages = {
				"cn",
				"tw",
				"en",
				"en_us",
				"en_eu",
				"vn",
				"th",
				"kr"
			},
			cost = {
				__size = 0
			},
			condition = {
				__size = 0
			},
			attrEffect = {
				__size = 0
			},
			vertexTeammateAttrEffect = {
				__size = 0
			}
		}
	}
}

return csv.cross.union_adventure.car
