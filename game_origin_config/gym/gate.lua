slot0 = {
	{},
	__size = 7,
	[18] = {
		{
			{
				3
			},
			1,
			0,
			"6%"
		}
	},
	[27] = {
		{
			{
				1
			},
			1,
			0,
			"5%"
		}
	},
	[49] = {
		{
			{
				15
			},
			1,
			0,
			"5%"
		}
	},
	[62] = {
		{
			{
				14
			},
			1,
			0,
			"6%"
		},
		{
			{
				14
			},
			95,
			0,
			1000
		}
	},
	[63] = {
		{
			{
				16
			},
			1,
			0,
			"7%"
		},
		{
			{
				16
			},
			13,
			0,
			"10%"
		}
	},
	[72] = {
		{
			{
				8
			},
			1,
			0,
			"6%"
		},
		{
			{
				8
			},
			9,
			0,
			"5%"
		},
		{
			{
				8
			},
			10,
			0,
			"5%"
		}
	}
}
slot2 = {
	[80512] = slot0[62],
	[80511] = slot0[62],
	[80204] = slot0[27],
	[80203] = slot0[27],
	default = slot0[1],
	[80612] = slot0[72],
	[80613] = slot0[72],
	[80401] = slot0[49],
	[80111] = slot0[18],
	[80521] = slot0[63],
	[80404] = slot0[49],
	[80524] = slot0[63],
	[80132] = slot0[18]
}
csv.gym.gate = {
	__size = 248,
	[80001] = {
		weatherDesc = "[Sandstorm] (Increase P.DEF of Rock type Pokémon. All non-ground and rock Pokémon have chance to be [Blinded] at the end of each round)",
		id = 80001,
		gymID = 1,
		hardDegree = 1,
		weight = 1,
		specialEff = {
			{
				{
					13
				},
				1,
				0,
				"5%"
			},
			{
				{
					13
				},
				9,
				0,
				"50%"
			}
		}
	},
	[80002] = {
		weatherDesc = "[Sandstorm] (Increase P.DEF of Rock type Pokémon. All non-ground and rock Pokémon have chance to be [Blinded] at the end of each round)",
		id = 80002,
		gymID = 1,
		hardDegree = 1,
		weight = 1,
		specialEff = {
			{
				{
					9
				},
				1,
				0,
				"5%"
			},
			{
				{
					9
				},
				9,
				0,
				"5%"
			}
		}
	},
	[80003] = {
		weatherDesc = "[Sandstorm] (Increase P.DEF of Rock type Pokémon. All non-ground and rock Pokémon have chance to be [Blinded] at the end of each round)",
		id = 80003,
		gymID = 1,
		hardDegree = 1,
		weight = 1,
		specialEff = {
			{
				{
					13
				},
				1,
				0,
				"5%"
			},
			{
				{
					13
				},
				9,
				0,
				"10%"
			}
		}
	},
	[80004] = {
		id = 80004,
		weatherDesc = "All non-Ice type Pokémon suffer a certain amount of Ice damage at the end of each round, and have 10% chance to be in [Frozen] for 2 rounds",
		gymID = 1,
		hardDegree = 1
	},
	[80005] = {
		id = 80005,
		hardDegree = 1,
		gymID = 1
	},
	[80006] = {
		id = 80006,
		hardDegree = 1,
		gymID = 1
	},
	[80011] = {
		weatherDesc = "[Sandstorm] (Increase P.DEF of Rock type Pokémon. All non-ground and rock Pokémon have chance to be [Blinded] at the end of each round)",
		id = 80011,
		gymID = 1,
		hardDegree = 2,
		weight = 1,
		specialEff = {
			{
				{
					9,
					13
				},
				1,
				0,
				"6%"
			},
			{
				{
					9,
					13
				},
				17,
				0,
				500
			}
		}
	},
	[80012] = {
		specialEffDesc = "\n#L10# Diglett are scared of too many people and don’t dare to come out#L0#",
		gymID = 1,
		id = 80012,
		hardDegree = 2,
		weight = 1,
		specialEff = {
			{
				{
					9
				},
				1,
				0,
				"6%"
			},
			{
				{
					9
				},
				14,
				0,
				1000
			}
		}
	},
	[80013] = {
		weatherDesc = "[Sandstorm] (Increase P.DEF of Rock type Pokémon. All non-ground and rock Pokémon have chance to be [Blinded] at the end of each round)",
		id = 80013,
		gymID = 1,
		hardDegree = 2,
		weight = 1,
		specialEff = {
			{
				{
					9
				},
				1,
				0,
				"6%"
			},
			{
				{
					9
				},
				7,
				0,
				"10%"
			},
			{
				{
					9
				},
				9,
				0,
				"30%"
			}
		}
	},
	[80014] = {
		id = 80014,
		hardDegree = 2,
		gymID = 1
	},
	[80015] = {
		id = 80015,
		hardDegree = 2,
		gymID = 1
	},
	[80016] = {
		id = 80016,
		hardDegree = 2,
		gymID = 1
	},
	[80021] = {
		id = 80021,
		gymID = 1,
		hardDegree = 3,
		weight = 1,
		specialEff = {
			{
				{
					13
				},
				1,
				0,
				"7%"
			},
			{
				{
					13
				},
				27,
				0,
				500
			}
		}
	},
	[80022] = {
		id = 80022,
		hardDegree = 3,
		gymID = 1
	},
	[80023] = {
		specialEffDesc = "\n Bullish! ！！",
		gymID = 1,
		id = 80023,
		hardDegree = 3,
		weight = 1,
		specialEff = {
			{
				{
					13
				},
				24,
				0,
				10000
			}
		}
	},
	[80024] = {
		id = 80024,
		hardDegree = 3,
		gymID = 1
	},
	[80025] = {
		id = 80025,
		hardDegree = 3,
		gymID = 1
	},
	[80026] = {
		id = 80026,
		hardDegree = 3,
		gymID = 1
	},
	[80031] = {
		weatherDesc = "[Sandstorm] (Increase P.DEF of Rock type Pokémon. All non-ground and rock Pokémon have chance to be [Blinded] at the end of each round)",
		lastJump = 2,
		id = 80031,
		hardDegree = 4,
		gymID = 1,
		weight = 1,
		specialEff = {
			{
				{
					9,
					13
				},
				1,
				0,
				"8%"
			},
			{
				{
					9,
					13
				},
				14,
				0,
				500
			}
		}
	},
	[80032] = {
		weatherDesc = "[Sandstorm] (Increase P.DEF of Rock type Pokémon. All non-ground and rock Pokémon have chance to be [Blinded] at the end of each round)",
		lastJump = 2,
		id = 80032,
		hardDegree = 4,
		gymID = 1,
		weight = 1,
		specialEff = {
			{
				{
					13
				},
				1,
				0,
				"8%"
			},
			{
				{
					13
				},
				9,
				0,
				"20%"
			}
		}
	},
	[80033] = {
		weatherDesc = "[Sandstorm] (Increase P.DEF of Rock type Pokémon. All non-ground and rock Pokémon have chance to be [Blinded] at the end of each round)",
		lastJump = 2,
		id = 80033,
		hardDegree = 4,
		gymID = 1,
		weight = 1,
		specialEff = {
			{
				{
					13,
					9
				},
				1,
				0,
				"8%"
			},
			{
				{
					13,
					9
				},
				17,
				0,
				1000
			}
		}
	},
	[80034] = {
		id = 80034,
		hardDegree = 4,
		gymID = 1,
		lastJump = 2
	},
	[80035] = {
		id = 80035,
		hardDegree = 4,
		gymID = 1,
		lastJump = 2
	},
	[80036] = {
		id = 80036,
		hardDegree = 4,
		gymID = 1,
		lastJump = 2
	},
	[80041] = {
		weatherDesc = "[Sandstorm] (Increase P.DEF of Rock type Pokémon. All non-ground and rock Pokémon have chance to be [Blinded] at the end of each round)",
		lastJump = 3,
		historyJump = 2,
		hardDegree = 5,
		id = 80041,
		weight = 1,
		gymID = 1,
		specialEff = {
			{
				{
					9,
					13
				},
				1,
				0,
				"10%"
			},
			{
				{
					9
				},
				23,
				0,
				1000
			},
			{
				{
					10
				},
				22,
				0,
				6000
			}
		}
	},
	[80042] = {
		gymID = 1,
		specialEffDesc = "Groudon hates Flying type Pokémon in particular! \nGroudon hates Flying type Pokémon in particular! ! \nGroudon hates Flying type Pokémon in particular! ！！",
		lastJump = 3,
		historyJump = 2,
		hardDegree = 5,
		id = 80042,
		weight = 2
	},
	[80043] = {
		specialEffDesc = "The Crystal Onix is immune to control, negative effects and water type damage, and any attack to Crystal Onix’s ally will leads to a counterattack.\nGigalith Petrify itself for 10 rounds at start, and its Block Power is increased by 60%.\nSmall tip: The Crystal Onix is not afraid of water , then what is it afraid of?",
		lastJump = 3,
		historyJump = 2,
		hardDegree = 5,
		gymID = 1,
		weight = 1,
		id = 80043,
		specialEff = {
			{
				{
					13,
					9
				},
				1,
				0,
				"10%"
			},
			{
				{
					13,
					9
				},
				17,
				0,
				10000
			}
		}
	},
	[80044] = {
		gymID = 1,
		specialEffDesc = "#L10#Godzilla vs. Kong#L0#\n\nHow small are human beings are in front of the ultimate monster",
		lastJump = 3,
		historyJump = 2,
		hardDegree = 5,
		id = 80044,
		weight = 1
	},
	[80045] = {
		gymID = 1,
		id = 80045,
		historyJump = 2,
		hardDegree = 5,
		lastJump = 3
	},
	[80046] = {
		gymID = 1,
		id = 80046,
		historyJump = 2,
		hardDegree = 5,
		lastJump = 3
	},
	[80051] = {
		id = 80051,
		weight = 100,
		gymID = 1,
		npc = true
	},
	[80101] = {
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled)",
		id = 80101,
		gymID = 2,
		hardDegree = 11,
		weight = 1,
		specialEff = {
			{
				{
					3
				},
				1,
				0,
				"5%"
			},
			{
				{
					2
				},
				22,
				1,
				2000
			}
		}
	},
	[80102] = {
		weatherDesc = "[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		id = 80102,
		gymID = 2,
		hardDegree = 11,
		weight = 1,
		specialEff = {
			{
				{
					6
				},
				1,
				0,
				"5%"
			}
		}
	},
	[80103] = {
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled) \n[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		id = 80103,
		gymID = 2,
		hardDegree = 11,
		weight = 1,
		specialEff = {
			{
				{
					3,
					6
				},
				1,
				0,
				"5%"
			}
		}
	},
	[80104] = {
		id = 80104,
		hardDegree = 11,
		gymID = 2
	},
	[80105] = {
		id = 80105,
		hardDegree = 11,
		gymID = 2
	},
	[80106] = {
		id = 80106,
		hardDegree = 11,
		gymID = 2
	},
	[80111] = {
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled)",
		id = 80111,
		gymID = 2,
		hardDegree = 12,
		specialEffDesc = "\n Ultimate Evolution",
		weight = 1,
		specialEff = slot2[80111]
	},
	[80112] = {
		gymID = 2,
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled) \n[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		id = 80112,
		specialEffDesc = "\nThe name of dragon slayer is well earned",
		hardDegree = 12,
		weight = 1
	},
	[80113] = {
		gymID = 2,
		specialEffDesc = "Ducky don't know anything, it no ducky business\n#C0xFFDEAD#Ducky is to free score",
		id = 80113,
		hardDegree = 12,
		weight = 1
	},
	[80114] = {
		id = 80114,
		hardDegree = 12,
		gymID = 2
	},
	[80115] = {
		id = 80115,
		hardDegree = 12,
		gymID = 2
	},
	[80116] = {
		id = 80116,
		hardDegree = 12,
		gymID = 2
	},
	[80121] = {
		id = 80121,
		hardDegree = 13,
		gymID = 2
	},
	[80122] = {
		gymID = 2,
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled) \n[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		id = 80122,
		specialEffDesc = "The damage reflection effect of all enemy Pokémons has been greatly increased\nThe damage of all allies Ultimate Skill has been greatly increased",
		hardDegree = 13,
		weight = 1
	},
	[80123] = {
		weatherDesc = "[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		id = 80123,
		gymID = 2,
		hardDegree = 13,
		specialEffDesc = "\nFroslass loves and protects the things they love and trust, especially their child Snorunt",
		weight = 1,
		specialEff = {
			{
				{
					6
				},
				1,
				0,
				"7%"
			}
		}
	},
	[80124] = {
		gymID = 2,
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled) \n[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		id = 80124,
		specialEffDesc = "Froslass stealth in snow\n Milotic Dodge greatly increase in Rainy",
		hardDegree = 13,
		weight = 1
	},
	[80125] = {
		id = 80125,
		hardDegree = 13,
		gymID = 2
	},
	[80126] = {
		id = 80126,
		hardDegree = 13,
		gymID = 2
	},
	[80131] = {
		gymID = 2,
		weatherDesc = "[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		lastJump = 12,
		id = 80131,
		hardDegree = 14,
		specialEffDesc = "The speed of all enemy Pokémon has been greatly increased\nSneasel’s P.ATK in first round has been greatly increased",
		weight = 1
	},
	[80132] = {
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled) \n[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		lastJump = 12,
		id = 80132,
		hardDegree = 14,
		gymID = 2,
		weight = 1,
		specialEff = slot2[80132]
	},
	[80133] = {
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled)",
		lastJump = 12,
		id = 80133,
		hardDegree = 14,
		gymID = 2,
		weight = 1,
		specialEff = {
			{
				{
					3
				},
				14,
				0,
				4000
			},
			{
				{
					3
				},
				15,
				0,
				5000
			},
			{
				{
					3
				},
				5,
				0,
				5000
			},
			{
				{
					3
				},
				24,
				0,
				2000
			}
		}
	},
	[80134] = {
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled)",
		lastJump = 12,
		id = 80134,
		hardDegree = 14,
		gymID = 2,
		weight = 1,
		specialEffDesc = "The Red Gyarados is usually incompetent, but if you provokes it...",
		specialEff = {
			{
				{
					3
				},
				15,
				0,
				5000
			},
			{
				{
					3
				},
				24,
				0,
				2000
			}
		}
	},
	[80135] = {
		id = 80135,
		hardDegree = 14,
		gymID = 2,
		lastJump = 12
	},
	[80136] = {
		id = 80136,
		hardDegree = 14,
		gymID = 2,
		lastJump = 12
	},
	[80141] = {
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled) \n[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		lastJump = 13,
		historyJump = 12,
		hardDegree = 15,
		id = 80141,
		weight = 1,
		gymID = 2,
		specialEff = {
			{
				{
					3
				},
				1,
				0,
				"10%"
			},
			{
				{
					3
				},
				16,
				0,
				3000
			}
		}
	},
	[80142] = {
		weatherDesc = "[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		lastJump = 13,
		historyJump = 12,
		hardDegree = 15,
		id = 80142,
		weight = 1,
		gymID = 2,
		specialEff = {
			{
				{
					6
				},
				1,
				0,
				"10%"
			},
			{
				{
					6
				},
				13,
				0,
				"15%"
			}
		}
	},
	[80143] = {
		gymID = 2,
		weatherDesc = "[Rainy] (Increase speed of water type Pokémon, reduce damage of fire type Pokémon. At the end of each round, part of negative effects on all Pokémon are dispelled) \n[Snow] (Increase Ice type Pokémon P. & Sp. DEF, all non-ice type Pokémon suffer a certain amount of ice damage at the end of each round, and have chance to be [Frozen])",
		lastJump = 13,
		historyJump = 12,
		hardDegree = 15,
		id = 80143,
		weight = 1,
		specialEffDesc = "Mega Abomasnow’s ability is greatly enhanced in snowy days, and freezes a target permanently when Ultimate Skill is released (not able to dispell)"
	},
	[80144] = {
		hardDegree = 15,
		id = 80144,
		placeDesc = [[
Kyurem open Frozen Ring: 
 Select the highest ATK unit ad Hunting target, 
 and permanent freeze all unit besides hunting target until dead
 Hunting and permanent Freeze can't be immune and dispell]],
		gymID = 2,
		palce = "Frozen Ring:",
		lastJump = 13,
		specialEffDesc = "Best Dragon&Frozen Battle",
		historyJump = 12,
		weight = 1,
		specialEff = {
			{
				{
					6
				},
				1,
				0,
				"10%"
			}
		}
	},
	[80145] = {
		gymID = 2,
		id = 80145,
		historyJump = 12,
		hardDegree = 15,
		lastJump = 13
	},
	[80146] = {
		gymID = 2,
		id = 80146,
		historyJump = 12,
		hardDegree = 15,
		lastJump = 13
	},
	[80151] = {
		id = 80151,
		weight = 100,
		gymID = 2,
		npc = true
	},
	[80201] = {
		id = 80201,
		palce = "Grassy Terrain:",
		placeDesc = "Grass type Pokémon recovers a certain amount of HP every round",
		hardDegree = 21,
		gymID = 3,
		weight = 1,
		specialEff = {
			{
				{
					4
				},
				1,
				0,
				"5%"
			}
		}
	},
	[80202] = {
		weatherDesc = "[Strong Winds] (Increase Speed of Flying type Pokémon. Each round, Pokémon have a chance to be [Blow off], and non-Flying type Pokémon will lose a certain amount of HP when landing)",
		id = 80202,
		gymID = 3,
		hardDegree = 21,
		specialEffDesc = "The damage of Hawlucha’s Ultimate Skill is greatly increased",
		weight = 1,
		specialEff = {
			{
				{
					10
				},
				1,
				0,
				"5%"
			}
		}
	},
	[80203] = {
		id = 80203,
		gymID = 3,
		hardDegree = 21,
		weight = 1,
		specialEff = slot2[80203]
	},
	[80204] = {
		id = 80204,
		gymID = 3,
		hardDegree = 21,
		weight = 1,
		specialEff = slot2[80204]
	},
	[80205] = {
		id = 80205,
		hardDegree = 21,
		gymID = 3
	},
	[80206] = {
		id = 80206,
		hardDegree = 21,
		gymID = 3
	},
	[80211] = {
		specialEffDesc = "\n Ultimate Evolution",
		palce = "Grassy Terrain:",
		placeDesc = "Grass type Pokémon recovers a certain amount of HP every round",
		hardDegree = 22,
		gymID = 3,
		weight = 1,
		id = 80211,
		specialEff = {
			{
				{
					4
				},
				1,
				0,
				"6%"
			}
		}
	},
	[80212] = {
		id = 80212,
		hardDegree = 22,
		gymID = 3
	},
	[80213] = {
		specialEffDesc = "\nAnger of all enemies are full and unlimited",
		gymID = 3,
		id = 80213,
		hardDegree = 22,
		weight = 1,
		specialEff = {
			{
				{
					1
				},
				1,
				0,
				"6%"
			},
			{
				{
					1
				},
				13,
				0,
				"6%"
			},
			{
				{
					1
				},
				7,
				0,
				"10%"
			},
			{
				{
					1
				},
				8,
				0,
				"10%"
			},
			{
				{
					1
				},
				9,
				0,
				"20%"
			},
			{
				{
					1
				},
				10,
				0,
				"20%"
			},
			{
				{
					1
				},
				24,
				0,
				8000
			}
		}
	},
	[80214] = {
		id = 80214,
		hardDegree = 22,
		gymID = 3
	},
	[80215] = {
		id = 80215,
		hardDegree = 22,
		gymID = 3
	},
	[80216] = {
		id = 80216,
		hardDegree = 22,
		gymID = 3
	},
	[80221] = {
		id = 80221,
		palce = "Grassy Terrain:",
		placeDesc = "Grass type Pokémon recovers a certain amount of HP every round",
		hardDegree = 23,
		gymID = 3,
		weight = 1,
		specialEff = {
			{
				{
					4
				},
				1,
				0,
				"7%"
			},
			{
				{
					4
				},
				23,
				0,
				2500
			}
		}
	},
	[80222] = {
		weatherDesc = "[Strong Winds] (Increase Speed of Flying type Pokémon. Each round, Pokémon have a chance to be [Blow off], and non-Flying type Pokémon will lose a certain amount of HP when landing)",
		id = 80222,
		gymID = 3,
		hardDegree = 23,
		weight = 1,
		specialEff = {
			{
				{
					10
				},
				1,
				0,
				"7%"
			},
			{
				{
					10
				},
				95,
				0,
				2000
			}
		}
	},
	[80223] = {
		id = 80223,
		gymID = 3,
		hardDegree = 23,
		weight = 1,
		specialEff = {
			{
				{
					1
				},
				1,
				0,
				"7%"
			},
			{
				{
					1
				},
				24,
				0,
				5000
			}
		}
	},
	[80224] = {
		id = 80224,
		hardDegree = 23,
		gymID = 3
	},
	[80225] = {
		id = 80225,
		hardDegree = 23,
		gymID = 3
	},
	[80226] = {
		id = 80226,
		hardDegree = 23,
		gymID = 3
	},
	[80231] = {
		id = 80231,
		lastJump = 22,
		placeDesc = "Grass type Pokémon recovers a certain amount of HP every round",
		hardDegree = 24,
		palce = "Grassy Terrain:",
		weight = 2,
		gymID = 3,
		specialEff = {
			{
				{
					4
				},
				1,
				0,
				"8%"
			},
			{
				{
					4
				},
				25,
				0,
				2000
			},
			{
				{
					4
				},
				23,
				0,
				2000
			}
		}
	},
	[80232] = {
		id = 80232,
		lastJump = 22,
		gymID = 3,
		hardDegree = 24,
		weight = 1,
		specialEff = {
			{
				{
					4
				},
				14,
				0,
				500
			},
			{
				{
					1,
					4
				},
				1,
				0,
				"8%"
			},
			{
				{
					1
				},
				25,
				0,
				1000
			}
		}
	},
	[80233] = {
		id = 80233,
		hardDegree = 24,
		gymID = 3,
		lastJump = 22
	},
	[80234] = {
		id = 80234,
		hardDegree = 24,
		gymID = 3,
		lastJump = 22
	},
	[80235] = {
		id = 80235,
		hardDegree = 24,
		gymID = 3,
		lastJump = 22
	},
	[80236] = {
		id = 80236,
		hardDegree = 24,
		gymID = 3,
		lastJump = 22
	},
	[80241] = {
		gymID = 3,
		specialEffDesc = "Maybe Ditto has a special ability?",
		lastJump = 23,
		historyJump = 22,
		hardDegree = 25,
		id = 80241,
		weight = 1
	},
	[80242] = {
		gymID = 3,
		weatherDesc = "[Strong Winds] (Increase Speed of Flying type Pokémon. Each round, Pokémon have a chance to be [Blow off], and non-Flying type Pokémon will lose a certain amount of HP when landing)",
		lastJump = 23,
		historyJump = 22,
		hardDegree = 25,
		id = 80242,
		weight = 1,
		specialEffDesc = "The Three Legendary Birds are immune to the damage of their corresponding type;\nThe type restrain damage of both sides is greatly increased"
	},
	[80243] = {
		gymID = 3,
		weatherDesc = "[Strong Winds] (Increase Speed of Flying type Pokémon. Each round, Pokémon have a chance to be [Blow off], and non-Flying type Pokémon will lose a certain amount of HP when landing)",
		lastJump = 23,
		historyJump = 22,
		hardDegree = 25,
		id = 80243,
		weight = 1,
		specialEffDesc = "Leader of legend birds: Ho-Oh will protect all allies from the Strong Wind weather\nHo-Oh sacrifices 20% of its HP with each Ultimate Skill. Holy Bird Blessing will affect all its allies and the number of times is unlimited.\nAfter Ho-Oh being defeated , all the Pokémon flees away"
	},
	[80244] = {
		specialEffDesc = "\n The past me, is also the future me",
		lastJump = 23,
		historyJump = 22,
		hardDegree = 25,
		gymID = 3,
		weight = 1,
		id = 80244,
		specialEff = {
			{
				{
					4
				},
				1,
				0,
				"10%"
			}
		}
	},
	[80245] = {
		gymID = 3,
		id = 80245,
		historyJump = 22,
		hardDegree = 25,
		lastJump = 23
	},
	[80246] = {
		gymID = 3,
		id = 80246,
		historyJump = 22,
		hardDegree = 25,
		lastJump = 23
	},
	[80251] = {
		id = 80251,
		weight = 100,
		gymID = 3,
		npc = true
	},
	[80301] = {
		id = 80301,
		gymID = 4,
		hardDegree = 31,
		weight = 1,
		specialEff = {
			{
				{
					2
				},
				1,
				0,
				"5%"
			},
			{
				{
					2
				},
				14,
				0,
				500
			}
		}
	},
	[80302] = {
		id = 80302,
		gymID = 4,
		hardDegree = 31,
		weight = 1,
		specialEff = {
			{
				{
					7
				},
				1,
				0,
				"5%"
			},
			{
				{
					7
				},
				14,
				0,
				500
			}
		}
	},
	[80303] = {
		id = 80303,
		hardDegree = 31,
		gymID = 4
	},
	[80304] = {
		id = 80304,
		hardDegree = 31,
		gymID = 4
	},
	[80305] = {
		id = 80305,
		hardDegree = 31,
		gymID = 4
	},
	[80306] = {
		id = 80306,
		hardDegree = 31,
		gymID = 4
	},
	[80311] = {
		weatherDesc = "[Extremely Harsh Sunlight] (Increase damage of Fire type Pokémon, and reduce damage of Water type Pokémon, all Pokémon get [Power of the Sun] state (a certain amount of HP will be lost every round, can be stack, damage raises when stack)",
		id = 80311,
		gymID = 4,
		hardDegree = 32,
		specialEffDesc = "\n Ultimate Evolution",
		weight = 1,
		specialEff = {
			{
				{
					2
				},
				1,
				0,
				"6%"
			}
		}
	},
	[80312] = {
		specialEffDesc = "Machamp laughed out loud",
		gymID = 4,
		id = 80312,
		hardDegree = 32,
		weight = 1,
		specialEff = {
			{
				{
					2,
					7
				},
				1,
				0,
				"6%"
			},
			{
				{
					2,
					7
				},
				24,
				0,
				2000
			}
		}
	},
	[80313] = {
		weatherDesc = "[Extremely Harsh Sunlight] (Increase damage of Fire type Pokémon, and reduce damage of Water type Pokémon, all Pokémon get [Power of the Sun] state (a certain amount of HP will be lost every round, can be stack, damage raises when stack)",
		id = 80313,
		gymID = 4,
		hardDegree = 32,
		weight = 1,
		specialEff = {
			{
				{
					2
				},
				1,
				0,
				"6%"
			},
			{
				{
					2
				},
				14,
				0,
				10000
			},
			{
				{
					2
				},
				23,
				0,
				5000
			}
		}
	},
	[80314] = {
		id = 80314,
		hardDegree = 32,
		gymID = 4
	},
	[80315] = {
		id = 80315,
		hardDegree = 32,
		gymID = 4
	},
	[80316] = {
		id = 80316,
		hardDegree = 32,
		gymID = 4
	},
	[80321] = {
		weatherDesc = "[Extremely Harsh Sunlight] (Increase damage of Fire type Pokémon, and reduce damage of Water type Pokémon, all Pokémon get [Power of the Sun] state (a certain amount of HP will be lost every round, can be stack, damage raises when stack)",
		id = 80321,
		gymID = 4,
		hardDegree = 33,
		weight = 1,
		specialEff = {
			{
				{
					2
				},
				1,
				0,
				"7%"
			},
			{
				{
					2
				},
				15,
				0,
				2000
			}
		}
	},
	[80322] = {
		deployCardNumLimit = 3,
		id = 80322,
		gymID = 4,
		hardDegree = 33,
		specialEffDesc = [[

Limited to use 3 Pokémon in the battle
When any of the enemy Pokémon attacks, the rest of the enemies will use their skills to attack together
When enemy is attacked, they will counterattack]],
		weight = 1,
		specialEff = {
			{
				{
					7
				},
				1,
				0,
				"7%"
			},
			{
				{
					7
				},
				17,
				0,
				1500
			},
			{
				{
					7
				},
				95,
				0,
				1500
			}
		}
	},
	[80323] = {
		id = 80323,
		hardDegree = 33,
		gymID = 4
	},
	[80324] = {
		id = 80324,
		hardDegree = 33,
		gymID = 4
	},
	[80325] = {
		id = 80325,
		hardDegree = 33,
		gymID = 4
	},
	[80326] = {
		id = 80326,
		hardDegree = 33,
		gymID = 4
	},
	[80331] = {
		weatherDesc = "[Extremely Harsh Sunlight] (Increase damage of Fire type Pokémon, and reduce damage of Water type Pokémon, all Pokémon get [Power of the Sun] state (a certain amount of HP will be lost every round, can be stack, damage raises when stack)",
		id = 80331,
		weight = 1,
		lastJump = 32,
		specialEffDesc = "\nThe type restraint damage is greatly increased (the enemy's dual type Pokémon’s Fighting type will not be restrained)",
		hardDegree = 34,
		deployType = 2,
		gymID = 4,
		specialEff = {
			{
				{
					7
				},
				1,
				0,
				"10%"
			},
			{
				{
					7
				},
				14,
				0,
				2000
			}
		}
	},
	[80332] = {
		weatherDesc = "[Extremely Harsh Sunlight] (Increase damage of Fire type Pokémon, and reduce damage of Water type Pokémon, all Pokémon get [Power of the Sun] state (a certain amount of HP will be lost every round, can be stack, damage raises when stack)",
		lastJump = 32,
		id = 80332,
		hardDegree = 34,
		deployType = 2,
		weight = 1,
		gymID = 4,
		specialEff = {
			{
				{
					7
				},
				1,
				0,
				"10%"
			},
			{
				{
					7
				},
				14,
				0,
				2000
			},
			{
				{
					7
				},
				5,
				0,
				10000
			}
		}
	},
	[80333] = {
		id = 80333,
		hardDegree = 34,
		gymID = 4,
		lastJump = 32
	},
	[80334] = {
		id = 80334,
		hardDegree = 34,
		gymID = 4,
		lastJump = 32
	},
	[80335] = {
		id = 80335,
		hardDegree = 34,
		gymID = 4,
		lastJump = 32
	},
	[80336] = {
		id = 80336,
		hardDegree = 34,
		gymID = 4,
		lastJump = 32
	},
	[80341] = {
		weatherDesc = "[Extremely Harsh Sunlight] (Increase damage of Fire type Pokémon, and reduce damage of Water type Pokémon, all Pokémon get [Power of the Sun] state (a certain amount of HP will be lost every round, can be stack, damage raises when stack)",
		lastJump = 33,
		historyJump = 32,
		hardDegree = 35,
		id = 80341,
		weight = 1,
		gymID = 4,
		specialEff = {
			{
				{
					2
				},
				1,
				0,
				"10%"
			},
			{
				{
					2
				},
				14,
				0,
				3000
			},
			{
				{
					2
				},
				15,
				0,
				4000
			}
		}
	},
	[80342] = {
		specialEffDesc = "\nUltra Rapid Fire: Both sides recovers full anger each round, all are immune to control effect",
		lastJump = 33,
		historyJump = 32,
		hardDegree = 35,
		gymID = 4,
		weight = 1,
		id = 80342,
		specialEff = {
			{
				{
					2,
					7
				},
				1,
				0,
				"30%"
			},
			{
				{
					2,
					7
				},
				24,
				0,
				3000
			}
		}
	},
	[80343] = {
		specialEffDesc = "\nMelee combat: both sides cannot use Ultimate Skill, damage of basic attacks and basic skills increas by 20%, the more anger, the higher the damage dealt",
		lastJump = 33,
		historyJump = 32,
		hardDegree = 35,
		gymID = 4,
		weight = 1,
		id = 80343,
		specialEff = {
			{
				{
					2,
					7
				},
				1,
				0,
				"10%"
			},
			{
				{
					2,
					7
				},
				15,
				0,
				3000
			}
		}
	},
	[80344] = {
		id = 80344,
		lastJump = 33,
		historyJump = 32,
		hardDegree = 35,
		gymID = 4,
		weight = 1,
		specialEff = {
			{
				{
					2
				},
				1,
				0,
				"10%"
			},
			{
				{
					2
				},
				15,
				0,
				3000
			}
		}
	},
	[80345] = {
		gymID = 4,
		id = 80345,
		historyJump = 32,
		hardDegree = 35,
		lastJump = 33
	},
	[80346] = {
		gymID = 4,
		id = 80346,
		historyJump = 32,
		hardDegree = 35,
		lastJump = 33
	},
	[80351] = {
		id = 80351,
		weight = 100,
		gymID = 4,
		npc = true
	},
	[80401] = {
		specialEffDesc = "\nSomething strange seems to be mixed in",
		gymID = 5,
		id = 80401,
		hardDegree = 41,
		weight = 1,
		specialEff = slot2[80401]
	},
	[80402] = {
		weatherDesc = "[Thunderstorm] (Electric skill damage increased. At the end of each round, a falling lightning strikes a random target on the field, causing tons of damage (Electric Pokémon have chance to absorb the damage), non-electric type Pokémon have chance to be [Paralysis] )",
		id = 80402,
		gymID = 5,
		hardDegree = 41,
		weight = 1,
		specialEff = {
			{
				{
					5
				},
				1,
				0,
				"5%"
			}
		}
	},
	[80403] = {
		weatherDesc = "[Thunderstorm] (Electric skill damage increased. At the end of each round, a falling lightning strikes a random target on the field, causing tons of damage (Electric Pokémon have chance to absorb the damage), non-electric type Pokémon have chance to be [Paralysis] )",
		id = 80403,
		gymID = 5,
		hardDegree = 41,
		weight = 1,
		specialEff = {
			{
				{
					5,
					15
				},
				1,
				0,
				"5%"
			}
		}
	},
	[80404] = {
		specialEffDesc = "\n Cute Dratini and Dragonair don't like to fight",
		gymID = 5,
		id = 80404,
		hardDegree = 41,
		weight = 1,
		specialEff = slot2[80404]
	},
	[80405] = {
		id = 80405,
		hardDegree = 41,
		gymID = 5
	},
	[80406] = {
		id = 80406,
		hardDegree = 41,
		gymID = 5
	},
	[80411] = {
		id = 80411,
		hardDegree = 42,
		gymID = 5
	},
	[80412] = {
		weatherDesc = "[Thunderstorm] (Electric skill damage increased. At the end of each round, a falling lightning strikes a random target on the field, causing tons of damage (Electric Pokémon have chance to absorb the damage), non-electric type Pokémon have chance to be [Paralysis] )",
		id = 80412,
		gymID = 5,
		hardDegree = 42,
		weight = 100,
		specialEff = {
			{
				{
					5
				},
				1,
				0,
				"6%"
			},
			{
				{
					5
				},
				5,
				0,
				1000
			}
		}
	},
	[80413] = {
		id = 80413,
		hardDegree = 42,
		gymID = 5
	},
	[80414] = {
		id = 80414,
		hardDegree = 42,
		gymID = 5
	},
	[80415] = {
		id = 80415,
		hardDegree = 42,
		gymID = 5
	},
	[80416] = {
		id = 80416,
		hardDegree = 42,
		gymID = 5
	},
	[80421] = {
		id = 80421,
		gymID = 5,
		hardDegree = 43,
		weight = 1,
		specialEff = {
			{
				{
					15
				},
				1,
				0,
				"7%"
			},
			{
				{
					15
				},
				8,
				0,
				"10%"
			}
		}
	},
	[80422] = {
		gymID = 5,
		weatherDesc = "#L10#Eternal Thunderstorm Weather#L0#\n[Thunderstorm] (Electric skill damage increased. At the end of each round, a falling lightning strikes a random target on the field, causing tons of damage (Electric Pokémon have chance to absorb the damage), non-electric type Pokémon have chance to be [Paralysis] )",
		id = 80422,
		specialEffDesc = "What do you think you are fighting with?",
		hardDegree = 43,
		weight = 2
	},
	[80423] = {
		id = 80423,
		hardDegree = 43,
		gymID = 5
	},
	[80424] = {
		id = 80424,
		hardDegree = 43,
		gymID = 5
	},
	[80425] = {
		id = 80425,
		hardDegree = 43,
		gymID = 5
	},
	[80426] = {
		id = 80426,
		hardDegree = 43,
		gymID = 5
	},
	[80431] = {
		id = 80431,
		deployNum = 2,
		lastJump = 42,
		hardDegree = 44,
		deployType = 3,
		weight = 1,
		gymID = 5,
		specialEff = {
			{
				{
					15
				},
				1,
				0,
				"8%"
			},
			{
				{
					15
				},
				22,
				0,
				1000
			}
		}
	},
	[80432] = {
		weatherDesc = "[Thunderstorm] (Electric skill damage increased. At the end of each round, a falling lightning strikes a random target on the field, causing tons of damage (Electric Pokémon have chance to absorb the damage), non-electric type Pokémon have chance to be [Paralysis] )",
		lastJump = 42,
		id = 80432,
		hardDegree = 44,
		gymID = 5,
		weight = 1,
		specialEff = {
			{
				{
					5
				},
				1,
				0,
				"8%"
			},
			{
				{
					5
				},
				5,
				0,
				1000
			}
		}
	},
	[80433] = {
		weatherDesc = "[Thunderstorm] (Electric skill damage increased. At the end of each round, a falling lightning strikes a random target on the field, causing tons of damage (Electric Pokémon have chance to absorb the damage), non-electric type Pokémon have chance to be [Paralysis] )",
		lastJump = 42,
		id = 80433,
		hardDegree = 44,
		gymID = 5,
		weight = 1,
		specialEff = {
			{
				{
					5
				},
				1,
				0,
				"8%"
			},
			{
				{
					5
				},
				5,
				0,
				10000
			}
		}
	},
	[80434] = {
		id = 80434,
		hardDegree = 44,
		gymID = 5,
		lastJump = 42
	},
	[80435] = {
		id = 80435,
		hardDegree = 44,
		gymID = 5,
		lastJump = 42
	},
	[80436] = {
		id = 80436,
		hardDegree = 44,
		gymID = 5,
		lastJump = 42
	},
	[80441] = {
		id = 80441,
		lastJump = 43,
		historyJump = 42,
		hardDegree = 45,
		gymID = 5,
		weight = 1,
		specialEff = {
			{
				{
					15
				},
				1,
				0,
				"10%"
			},
			{
				{
					15
				},
				26,
				0,
				1000
			}
		}
	},
	[80442] = {
		weatherDesc = "[Thunderstorm] (Electric skill damage increased. At the end of each round, a falling lightning strikes a random target on the field, causing tons of damage (Electric Pokémon have chance to absorb the damage), non-electric type Pokémon have chance to be [Paralysis] )",
		lastJump = 43,
		historyJump = 42,
		hardDegree = 45,
		id = 80442,
		weight = 1,
		gymID = 5,
		specialEff = {
			{
				{
					5
				},
				1,
				0,
				"10%"
			},
			{
				{
					5
				},
				5,
				0,
				1000
			}
		}
	},
	[80443] = {
		gymID = 5,
		id = 80443,
		historyJump = 42,
		hardDegree = 45,
		lastJump = 43
	},
	[80444] = {
		gymID = 5,
		weatherDesc = "#L10#Eternal Thunderstorm Weather#L0#\n[Thunderstorm] (Electric skill damage increased. At the end of each round, a falling lightning strikes a random target on the field, causing tons of damage (Electric Pokémon have chance to absorb the damage), non-electric type Pokémon have chance to be [Paralysis] )",
		lastJump = 43,
		historyJump = 42,
		hardDegree = 45,
		id = 80444,
		weight = 1,
		specialEffDesc = "Hats are not for cuteness, but our bond\n#F20# \n#F40##C0xFFDEAD# Tips: In fact, hats are the source of my strength."
	},
	[80445] = {
		gymID = 5,
		id = 80445,
		historyJump = 42,
		hardDegree = 45,
		lastJump = 43
	},
	[80446] = {
		gymID = 5,
		id = 80446,
		historyJump = 42,
		hardDegree = 45,
		lastJump = 43
	},
	[80451] = {
		id = 80451,
		weight = 100,
		gymID = 5,
		npc = true
	},
	[80501] = {
		id = 80501,
		gymID = 6,
		hardDegree = 51,
		weight = 1,
		specialEff = {
			{
				{
					16
				},
				1,
				0,
				"5%"
			},
			{
				{
					16
				},
				26,
				0,
				1000
			}
		}
	},
	[80502] = {
		id = 80502,
		gymID = 6,
		hardDegree = 51,
		weight = 1,
		specialEff = {
			{
				{
					14
				},
				1,
				0,
				"5%"
			},
			{
				{
					14
				},
				26,
				0,
				1000
			}
		}
	},
	[80503] = {
		id = 80503,
		gymID = 6,
		hardDegree = 51,
		weight = 1,
		specialEff = {
			{
				{
					16,
					14
				},
				1,
				0,
				"5%"
			},
			{
				{
					16,
					14
				},
				17,
				0,
				500
			}
		}
	},
	[80504] = {
		id = 80504,
		hardDegree = 51,
		gymID = 6
	},
	[80505] = {
		id = 80505,
		hardDegree = 51,
		gymID = 6
	},
	[80506] = {
		id = 80506,
		hardDegree = 51,
		gymID = 6
	},
	[80511] = {
		weatherDesc = "[Dusk] (single round day, double round night)\n[Day] (no special effects)\n[Night] (non-Ghost and Dark type Pokémon damage reduced, Ghosts are immune to #C0x3D8A99#Sp. DMG#C0x5B545B #, Dark type Pokémon ultimate skill resistance raise greatly)",
		id = 80511,
		gymID = 6,
		hardDegree = 52,
		weight = 1,
		specialEff = slot2[80511]
	},
	[80512] = {
		weatherDesc = "[Dusk] (single round day, double round night)\n[Day] (no special effects)\n[Night] (non-Ghost and Dark type Pokémon damage reduced, Ghosts are immune to #C0x3D8A99#P. DMG#C0x5B545B #, Dark type Pokémon ultimate skill resistance raise greatly)",
		id = 80512,
		gymID = 6,
		hardDegree = 52,
		weight = 1,
		specialEff = slot2[80512]
	},
	[80513] = {
		id = 80513,
		hardDegree = 52,
		gymID = 6
	},
	[80514] = {
		id = 80514,
		hardDegree = 52,
		gymID = 6
	},
	[80515] = {
		id = 80515,
		hardDegree = 52,
		gymID = 6
	},
	[80516] = {
		id = 80516,
		hardDegree = 52,
		gymID = 6
	},
	[80521] = {
		id = 80521,
		gymID = 6,
		hardDegree = 53,
		weight = 1,
		specialEff = slot2[80521]
	},
	[80522] = {
		id = 80522,
		gymID = 6,
		hardDegree = 53,
		weight = 1,
		specialEff = {
			{
				{
					14
				},
				1,
				0,
				"7%"
			},
			{
				{
					14
				},
				13,
				0,
				"10%"
			}
		}
	},
	[80523] = {
		id = 80523,
		hardDegree = 53,
		gymID = 6
	},
	[80524] = {
		specialEffDesc = "The biggest enemy is yourself!",
		gymID = 6,
		id = 80524,
		hardDegree = 53,
		weight = 1,
		specialEff = slot2[80524]
	},
	[80525] = {
		id = 80525,
		hardDegree = 53,
		gymID = 6
	},
	[80526] = {
		id = 80526,
		hardDegree = 53,
		gymID = 6
	},
	[80531] = {
		weatherDesc = "[Dusk] (single round day, double round night)\n[Day] (no special effects)\n[Night] (non-Ghost and Dark type Pokémon damage reduced, Ghosts are immune to Sp. DMG, Dark type Pokémon ultimate skill resistance raise greatly)",
		lastJump = 52,
		id = 80531,
		hardDegree = 54,
		gymID = 6,
		weight = 1,
		specialEff = {
			{
				{
					16
				},
				1,
				0,
				"8%"
			},
			{
				{
					16
				},
				14,
				0,
				500
			}
		}
	},
	[80532] = {
		id = 80532,
		lastJump = 52,
		gymID = 6,
		hardDegree = 54,
		weight = 1,
		specialEff = {
			{
				{
					14
				},
				1,
				0,
				"8%"
			},
			{
				{
					14
				},
				26,
				0,
				500
			}
		}
	},
	[80533] = {
		id = 80533,
		lastJump = 52,
		gymID = 6,
		hardDegree = 54,
		weight = 1,
		specialEff = {
			{
				{
					14
				},
				1,
				0,
				"8%"
			}
		}
	},
	[80534] = {
		id = 80534,
		hardDegree = 54,
		gymID = 6,
		lastJump = 52
	},
	[80535] = {
		id = 80535,
		hardDegree = 54,
		gymID = 6,
		lastJump = 52
	},
	[80536] = {
		id = 80536,
		hardDegree = 54,
		gymID = 6,
		lastJump = 52
	},
	[80541] = {
		deployNum = 3,
		deployCardNumLimit = 4,
		id = 80541,
		placeDesc = "Darkrai attack, P.&Sp.DEF, control rate, and control resist rate have been greatly increased.\nSleeping or nightmare Pokémon can not be awakened by attack",
		historyJump = 52,
		palce = "Nightmare Terrain:",
		lastJump = 53,
		gymID = 6,
		specialEffDesc = "True Nightmare Dungeon\nLimited to use 4 Pokémon.\nFor each attack Darkrai will reduce 9.99% of its HP limit, Darkrai HP limit reduces to 1 most.",
		hardDegree = 55,
		deployType = 3,
		weight = 1
	},
	[80542] = {
		hardDegree = 55,
		deployNum = 3,
		id = 80542,
		gymID = 6,
		lastJump = 53,
		specialEffDesc = "True•Hell Dungeon\n Ally able to deploy three teams",
		historyJump = 52,
		deployType = 3,
		weight = 1
	},
	[80543] = {
		gymID = 6,
		id = 80543,
		historyJump = 52,
		hardDegree = 55,
		lastJump = 53
	},
	[80544] = {
		gymID = 6,
		id = 80544,
		historyJump = 52,
		hardDegree = 55,
		lastJump = 53
	},
	[80545] = {
		gymID = 6,
		id = 80545,
		historyJump = 52,
		hardDegree = 55,
		lastJump = 53
	},
	[80546] = {
		gymID = 6,
		id = 80546,
		historyJump = 52,
		hardDegree = 55,
		lastJump = 53
	},
	[80551] = {
		id = 80551,
		weight = 100,
		gymID = 6,
		npc = true
	},
	[80601] = {
		id = 80601,
		gymID = 7,
		hardDegree = 61,
		weight = 1,
		specialEff = {
			{
				{
					17
				},
				1,
				0,
				"5%"
			},
			{
				{
					17
				},
				25,
				0,
				500
			}
		}
	},
	[80602] = {
		specialEffDesc = "\nOMG!!!!My Caterpie evolved into Rayquaza!!!",
		gymID = 7,
		id = 80602,
		hardDegree = 61,
		weight = 2,
		specialEff = {
			{
				{
					15
				},
				1,
				0,
				"10%"
			}
		}
	},
	[80603] = {
		id = 80603,
		palce = "Toxic Spikes Terrain:",
		placeDesc = "Non-Poison type Pokémon loses a certain amount of HP every round",
		hardDegree = 61,
		gymID = 7,
		weight = 1,
		specialEff = {
			{
				{
					8
				},
				1,
				0,
				"5%"
			},
			{
				{
					8
				},
				10,
				0,
				"5%"
			}
		}
	},
	[80604] = {
		id = 80604,
		hardDegree = 61,
		gymID = 7
	},
	[80605] = {
		id = 80605,
		hardDegree = 61,
		gymID = 7
	},
	[80606] = {
		id = 80606,
		hardDegree = 61,
		gymID = 7
	},
	[80611] = {
		specialEffDesc = "\n Ultimate Evolution",
		gymID = 7,
		id = 80611,
		hardDegree = 62,
		weight = 1,
		specialEff = {
			{
				{
					12
				},
				1,
				0,
				"6%"
			}
		}
	},
	[80612] = {
		id = 80612,
		palce = "Toxic Spikes Terrain:",
		placeDesc = "Non-Poison type Pokémon loses a certain amount of HP every round",
		hardDegree = 62,
		gymID = 7,
		weight = 1,
		specialEff = slot2[80612]
	},
	[80613] = {
		id = 80613,
		palce = "Toxic Spikes Terrain:",
		placeDesc = "Non-Poison type Pokémon loses a certain amount of HP every round",
		hardDegree = 62,
		gymID = 7,
		weight = 1,
		specialEff = slot2[80613]
	},
	[80614] = {
		id = 80614,
		hardDegree = 62,
		gymID = 7
	},
	[80615] = {
		id = 80615,
		hardDegree = 62,
		gymID = 7
	},
	[80616] = {
		id = 80616,
		hardDegree = 62,
		gymID = 7
	},
	[80621] = {
		id = 80621,
		gymID = 7,
		hardDegree = 63,
		weight = 1,
		specialEff = {
			{
				{
					17,
					12
				},
				1,
				0,
				"7%"
			},
			{
				{
					17,
					12
				},
				15,
				0,
				500
			}
		}
	},
	[80622] = {
		id = 80622,
		palce = "Toxic Spikes Terrain:",
		placeDesc = "Non-Poison type Pokémon loses a certain amount of HP every round",
		hardDegree = 63,
		gymID = 7,
		weight = 1,
		specialEff = {
			{
				{
					8
				},
				1,
				0,
				"7%"
			},
			{
				{
					8
				},
				7,
				0,
				"10%"
			}
		}
	},
	[80623] = {
		hardDegree = 63,
		id = 80623,
		placeDesc = "Non-Poison type Pokémon loses a certain amount of HP every round",
		palce = "Toxic Spikes Terrain:",
		gymID = 7
	},
	[80624] = {
		id = 80624,
		hardDegree = 63,
		gymID = 7
	},
	[80625] = {
		id = 80625,
		hardDegree = 63,
		gymID = 7
	},
	[80626] = {
		id = 80626,
		hardDegree = 63,
		gymID = 7
	},
	[80631] = {
		id = 80631,
		lastJump = 62,
		gymID = 7,
		hardDegree = 64,
		weight = 1,
		specialEff = {
			{
				{
					14,
					17
				},
				1,
				0,
				"8%"
			},
			{
				{
					14,
					17
				},
				22,
				0,
				500
			},
			{
				{
					14,
					17
				},
				23,
				0,
				500
			}
		}
	},
	[80632] = {
		specialEffDesc = "\nIt’s Zerg Rush Time!!!\nVolcarona will summon a Volcarona that inherits 60% of its own status every round",
		gymID = 7,
		id = 80632,
		hardDegree = 64,
		lastJump = 62,
		specialEff = {
			{
				{
					12
				},
				1,
				0,
				"8%"
			},
			{
				{
					12
				},
				26,
				0,
				500
			}
		}
	},
	[80633] = {
		id = 80633,
		lastJump = 62,
		gymID = 7,
		hardDegree = 64,
		weight = 1,
		specialEff = {
			{
				{
					17
				},
				1,
				0,
				"8%"
			},
			{
				{
					17
				},
				23,
				0,
				500
			}
		}
	},
	[80634] = {
		id = 80634,
		lastJump = 62,
		placeDesc = "Non-Poison type Pokémon loses a certain amount of HP every round",
		hardDegree = 64,
		palce = "Toxic Spikes Terrain:",
		weight = 1,
		gymID = 7,
		specialEff = {
			{
				{
					8
				},
				1,
				0,
				"8%"
			},
			{
				{
					8
				},
				17,
				0,
				500
			}
		}
	},
	[80635] = {
		id = 80635,
		hardDegree = 64,
		gymID = 7,
		lastJump = 62
	},
	[80636] = {
		id = 80636,
		hardDegree = 64,
		gymID = 7,
		lastJump = 62
	},
	[80641] = {
		id = 80641,
		lastJump = 63,
		historyJump = 62,
		hardDegree = 65,
		gymID = 7,
		weight = 1,
		specialEff = {
			{
				{
					17
				},
				1,
				0,
				"10%"
			},
			{
				{
					17
				},
				25,
				0,
				1000
			},
			{
				{
					17
				},
				24,
				0,
				1000
			}
		}
	},
	[80642] = {
		specialEffDesc = [[

Fire skill damage bonus, burning damage and type restraint damage greatly increase.
Volcarona can invite up to 5 targets into battle.
If you want to break Zerg army, use fire attack]],
		lastJump = 63,
		historyJump = 62,
		hardDegree = 65,
		gymID = 7,
		weight = 1,
		id = 80642,
		specialEff = {
			{
				{
					12
				},
				1,
				0,
				"10%"
			},
			{
				{
					12
				},
				13,
				0,
				"10%"
			}
		}
	},
	[80643] = {
		gymID = 7,
		id = 80643,
		historyJump = 63,
		hardDegree = 65,
		lastJump = 63
	},
	[80644] = {
		specialEffDesc = "\nJirachi will be awakened from the Sleeping Cocoon after 7 turns",
		lastJump = 63,
		historyJump = 63,
		hardDegree = 65,
		gymID = 7,
		weight = 1,
		id = 80644,
		specialEff = {
			{
				{
					17
				},
				17,
				0,
				1000
			},
			{
				{
					17
				},
				19,
				0,
				1000
			}
		}
	},
	[80645] = {
		gymID = 7,
		id = 80645,
		historyJump = 63,
		hardDegree = 65,
		lastJump = 63
	},
	[80646] = {
		gymID = 7,
		id = 80646,
		historyJump = 63,
		hardDegree = 65,
		lastJump = 63
	},
	[80651] = {
		id = 80651,
		weight = 100,
		gymID = 7,
		npc = true
	},
	[80701] = {
		id = 80701,
		palce = "Spiritual Terrain:",
		placeDesc = "Force auto combat",
		hardDegree = 71,
		gymID = 8,
		weight = 1,
		specialEff = {
			{
				{
					11
				},
				1,
				0,
				"5%"
			},
			{
				{
					11
				},
				23,
				0,
				1000
			}
		}
	},
	[80702] = {
		weatherDesc = "[Fog] (all unit reduces large amount of hit rate)",
		id = 80702,
		gymID = 8,
		hardDegree = 71,
		weight = 1,
		specialEff = {
			{
				{
					18
				},
				1,
				0,
				"5%"
			},
			{
				{
					18
				},
				22,
				0,
				1000
			}
		}
	},
	[80703] = {
		id = 80703,
		gymID = 8,
		hardDegree = 71,
		weight = 1,
		specialEff = {
			{
				{
					11,
					18
				},
				1,
				0,
				"5%"
			},
			{
				{
					11,
					18
				},
				22,
				0,
				1000
			}
		}
	},
	[80704] = {
		id = 80704,
		hardDegree = 71,
		gymID = 8
	},
	[80705] = {
		id = 80705,
		hardDegree = 71,
		gymID = 8
	},
	[80706] = {
		id = 80706,
		hardDegree = 71,
		gymID = 8
	},
	[80711] = {
		id = 80711,
		palce = "Spiritual Terrain:",
		placeDesc = "Force auto combat",
		hardDegree = 72,
		gymID = 8,
		weight = 1,
		specialEff = {
			{
				{
					11
				},
				1,
				0,
				"6%"
			},
			{
				{
					11
				},
				17,
				0,
				1000
			},
			{
				{
					11
				},
				19,
				0,
				1000
			}
		}
	},
	[80712] = {
		id = 80712,
		gymID = 8,
		hardDegree = 72,
		weight = 1,
		specialEff = {
			{
				{
					11
				},
				1,
				0,
				"6%"
			},
			{
				{
					11
				},
				5,
				0,
				10000
			}
		}
	},
	[80713] = {
		id = 80713,
		hardDegree = 72,
		gymID = 8
	},
	[80714] = {
		id = 80714,
		hardDegree = 72,
		gymID = 8
	},
	[80715] = {
		id = 80715,
		hardDegree = 72,
		gymID = 8
	},
	[80716] = {
		id = 80716,
		hardDegree = 72,
		gymID = 8
	},
	[80721] = {
		specialEffDesc = "\nHuman scientific power can create its body, but it cannot create a gentle heart",
		palce = "Spiritual Terrain:",
		placeDesc = "Force auto combat",
		hardDegree = 73,
		gymID = 8,
		weight = 1,
		id = 80721,
		specialEff = {
			{
				{
					11
				},
				1,
				0,
				"7%"
			},
			{
				{
					11
				},
				12,
				0,
				1000
			}
		}
	},
	[80722] = {
		gymID = 8,
		specialEffDesc = "Jigglypuff's ability has been greatly improved",
		palce = "Misty Terrain:",
		placeDesc = "Dragon type Pokémon damage reduced by 20%\nFairy type Pokémon immune control effect",
		hardDegree = 73,
		id = 80722,
		weight = 1
	},
	[80723] = {
		id = 80723,
		hardDegree = 73,
		gymID = 8
	},
	[80724] = {
		id = 80724,
		hardDegree = 73,
		gymID = 8
	},
	[80725] = {
		id = 80725,
		hardDegree = 73,
		gymID = 8
	},
	[80726] = {
		id = 80726,
		hardDegree = 73,
		gymID = 8
	},
	[80731] = {
		weatherDesc = "[Fog] (all unit reduces large amount of hit rate)",
		lastJump = 72,
		id = 80731,
		hardDegree = 74,
		gymID = 8,
		weight = 1,
		specialEff = {
			{
				{
					18
				},
				1,
				0,
				"8%"
			},
			{
				{
					18
				},
				28,
				0,
				1000
			}
		}
	},
	[80732] = {
		id = 80732,
		lastJump = 72,
		gymID = 8,
		hardDegree = 74,
		weight = 1,
		specialEff = {
			{
				{
					11
				},
				1,
				0,
				"8%"
			},
			{
				{
					11
				},
				16,
				0,
				500
			}
		}
	},
	[80733] = {
		specialEffDesc = [[
Greatly increase control rate of all enemies in the first three rounds
#F20# 
#F40#House of Gardevoir
#F20# 
#F40#Do you want to be my enemy?]],
		lastJump = 72,
		gymID = 8,
		hardDegree = 74,
		id = 80733,
		weight = 1,
		specialEff = {
			{
				{
					11,
					18
				},
				1,
				0,
				"8%"
			}
		}
	},
	[80734] = {
		id = 80734,
		hardDegree = 74,
		gymID = 8,
		lastJump = 72
	},
	[80735] = {
		id = 80735,
		hardDegree = 74,
		gymID = 8,
		lastJump = 72
	},
	[80736] = {
		id = 80736,
		hardDegree = 74,
		gymID = 8,
		lastJump = 72
	},
	[80741] = {
		palce = "Misty Terrain:",
		hardDegree = 75,
		id = 80741,
		placeDesc = "Dragon type Pokémon damage reduced by 20%\nFairy type Pokémon immune control effect",
		gymID = 8,
		lastJump = 72,
		specialEffDesc = "All enemy basic skills have no cooldown.\nWhen Metagross first collects 4 bar of anger, it will release its Ultimate Skill twice in a row",
		historyJump = 72,
		weight = 1
	},
	[80742] = {
		gymID = 8,
		id = 80742,
		historyJump = 72,
		hardDegree = 75,
		lastJump = 73
	},
	[80743] = {
		gymID = 8,
		id = 80743,
		historyJump = 72,
		hardDegree = 75,
		lastJump = 73
	},
	[80744] = {
		hardDegree = 75,
		deployNum = 4,
		id = 80744,
		gymID = 8,
		lastJump = 73,
		specialEffDesc = [[
True•Hoopa and the Clash of Ages
 Hoopa will summon corresponding Pokémon according to opponent deploy number
 When unbound kill target, power of Hoopa will be restrain by Prison Bottle, last for 3 round, and permanent Vulnerability 40%(able to stack)
Tips: Halo is very fragile and able to be attack]],
		historyJump = 72,
		deployType = 3,
		weight = 1
	},
	[80745] = {
		gymID = 8,
		id = 80745,
		historyJump = 72,
		hardDegree = 75,
		lastJump = 73
	},
	[80746] = {
		gymID = 8,
		id = 80746,
		historyJump = 72,
		hardDegree = 75,
		lastJump = 73
	},
	[80751] = {
		id = 80751,
		weight = 100,
		gymID = 8,
		npc = true
	},
	__default = {
		__index = {
			deployCardNumLimit = 6,
			deployNum = 1,
			npc = false,
			weatherDesc = "",
			palce = "",
			lastJump = 0,
			placeDesc = "",
			specialEffDesc = "",
			historyJump = 0,
			deployType = 1,
			weight = 0,
			deployNatureLimit = ({
				default = slot0[1]
			}).default,
			specialEff = slot2.default
		}
	}
}

return csv.gym.gate
