slot0 = {
	{
		__size = 0
	},
	{},
	__size = 20,
	[5] = {
		0,
		0,
		0,
		1,
		1,
		1
	},
	[7] = {
		0,
		1,
		0,
		1,
		0,
		1
	},
	[18] = {
		0,
		1,
		0,
		0,
		1,
		0
	},
	[35] = {
		1,
		0,
		1,
		1,
		1,
		1
	},
	[40] = {
		1,
		0,
		1,
		0,
		0,
		0
	},
	[47] = {
		1,
		0,
		1,
		0,
		1,
		0
	},
	[111] = {
		0,
		0,
		0,
		1,
		0,
		1
	},
	[153] = {
		710001,
		710002,
		710003,
		710004,
		710005,
		710006,
		710008,
		710009,
		710011,
		710012,
		710013,
		710014,
		710015,
		710016,
		710017,
		710018,
		710019,
		710020,
		710021,
		710022,
		710023,
		710024,
		710027,
		710028,
		710029,
		710031,
		710032,
		710033
	},
	[156] = {
		__size = 2,
		x = 407,
		y = 1138
	},
	[159] = {
		__size = 2,
		x = 915,
		y = 1095
	},
	[162] = {
		__size = 2,
		x = 1770,
		y = 1197
	},
	[165] = {
		__size = 2,
		x = 2263,
		y = 1003
	},
	[169] = {
		__size = 2,
		x = 2193,
		y = 479
	},
	[172] = {
		__size = 2,
		x = 1644,
		y = 309
	},
	[176] = {
		__size = 2,
		x = 429,
		y = 339
	},
	[180] = {
		__size = 2,
		x = 652,
		y = 752
	},
	[184] = {
		__size = 2,
		x = 1149,
		y = 562
	},
	[188] = {
		__size = 2,
		x = 1422,
		y = 843
	}
}
slot1 = {
	[6011] = slot0[159],
	[5011] = slot0[159],
	[5001] = slot0[156],
	[5061] = slot0[176],
	[6001] = slot0[156],
	[5021] = slot0[162],
	[5091] = slot0[188],
	[5081] = slot0[184],
	[5031] = slot0[165],
	[6041] = slot0[169],
	[6061] = slot0[176],
	[6071] = slot0[180],
	[6091] = slot0[188],
	[6021] = slot0[162],
	[6031] = slot0[165],
	[5071] = slot0[180],
	[6051] = slot0[172],
	[5051] = slot0[172],
	[5041] = slot0[169],
	[6081] = slot0[184]
}
slot4 = {
	[5011] = slot0[153],
	[5001] = slot0[153],
	[5021] = slot0[153],
	[5091] = slot0[153],
	[5031] = slot0[153],
	default = slot0[2],
	[5071] = slot0[153],
	[5051] = slot0[153]
}
slot5 = {
	[4081] = slot0[35],
	[1081] = slot0[47],
	[5011] = slot0[47],
	[3061] = slot0[35],
	[3001] = slot0[5],
	[110] = slot0[7],
	[4021] = slot0[47],
	[5071] = slot0[47],
	[6081] = slot0[35],
	[1051] = slot0[35],
	[4061] = slot0[5],
	[4041] = slot0[18],
	[6001] = slot0[5],
	[4001] = slot0[5],
	[6041] = slot0[5],
	[5041] = slot0[5],
	[2031] = slot0[5],
	[6021] = slot0[47],
	[2071] = slot0[47],
	[1031] = slot0[5],
	[2011] = slot0[47],
	[6061] = slot0[18],
	[5001] = slot0[5],
	[5061] = slot0[18],
	[5021] = slot0[47],
	[3071] = slot0[111],
	[108] = slot0[7],
	[102] = slot0[7],
	[101] = slot0[5],
	[106] = slot0[7],
	[104] = slot0[7],
	[3051] = slot0[111],
	[1041] = slot0[5],
	[1021] = slot0[5],
	[4051] = slot0[35],
	[2041] = slot0[5],
	[1061] = slot0[40],
	[3081] = slot0[40],
	[4011] = slot0[111],
	[3011] = slot0[35],
	[4071] = slot0[47],
	[2021] = slot0[40],
	[6071] = slot0[47],
	[6031] = slot0[35],
	[5081] = slot0[35],
	[1001] = slot0[18]
}
csv.summer_challenge.gates = {
	__size = 70,
	[101] = {
		openDay = 1,
		floor = 1,
		scene = "csv.stage.summer",
		id = 101,
		beforePlot = 1,
		deployLock = slot5[101],
		monsterIDs = {
			101,
			102,
			103
		}
	},
	[102] = {
		openDay = 1,
		floor = 2,
		scene = "csv.stage.summer",
		id = 102,
		deployLock = slot5[102],
		monsterIDs = {
			111,
			112,
			113
		}
	},
	[103] = {
		openDay = 1,
		floor = 3,
		id = 103,
		scene = "csv.stage.summer",
		monsterIDs = {
			121,
			122,
			123
		}
	},
	[104] = {
		openDay = 2,
		floor = 4,
		scene = "csv.stage.summer",
		id = 104,
		deployLock = slot5[104],
		monsterIDs = {
			131,
			132,
			133
		}
	},
	[105] = {
		openDay = 2,
		floor = 5,
		id = 105,
		scene = "csv.stage.summer",
		monsterIDs = {
			141,
			142,
			143
		}
	},
	[106] = {
		openDay = 2,
		floor = 6,
		scene = "csv.stage.summer",
		id = 106,
		deployLock = slot5[106],
		monsterIDs = {
			151,
			152,
			153
		}
	},
	[107] = {
		openDay = 3,
		floor = 7,
		id = 107,
		scene = "csv.stage.summer",
		monsterIDs = {
			161,
			162,
			163
		}
	},
	[108] = {
		openDay = 3,
		floor = 8,
		scene = "csv.stage.summer",
		id = 108,
		deployLock = slot5[108],
		monsterIDs = {
			171,
			172,
			173
		}
	},
	[109] = {
		openDay = 3,
		floor = 9,
		id = 109,
		scene = "csv.stage.summer",
		monsterIDs = {
			181,
			182,
			183
		}
	},
	[110] = {
		openDay = 3,
		floor = 10,
		scene = "csv.stage.summer",
		id = 110,
		deployLock = slot5[110],
		monsterIDs = {
			191,
			192,
			193
		}
	},
	[1001] = {
		openDay = 1,
		name = "Botanical Garden",
		reviewPlot = "After passing the test, you got a green slate with #L10##C0x57D700#Jumpluff pattern #C0x5B545B##L0#.",
		gateSeq = 1,
		desc = "Level effect: stealth cancels the cooldown; Shaymin is permanently forbidden to heal; the healing rate of other Pokémon is greatly increased. \nVictory condition: defeat Shaymin",
		scene = "csv.stage.summer",
		floor = 1,
		id = 1001,
		beforePlot = 1001,
		cards = {
			100001,
			100002,
			100003,
			100004,
			100005,
			100006,
			100007,
			100011,
			100012,
			100013
		},
		deployLock = slot5[1001],
		monsterIDs = {
			1001
		},
		award = {
			__size = 4,
			[500.0] = 1,
			[6394.0] = 15,
			gold = 50000,
			[21771.0] = 6
		}
	},
	[1011] = {
		openDay = 1,
		name = "Igloo",
		reviewPlot = "After passing the test, you got a blue slate painted with #L10##C0x00CED7#Staryu pattern #C0x5B545B##L0#.",
		gateSeq = 1,
		desc = "Level effect: The frozen target becomes unselectable, and you will fail if all of your allies are frozen; enemy will increase the control rate every round. \nVictory condition: win the battle",
		scene = "csv.stage.summer",
		floor = 2,
		gateIcon = "activity/summer_challenge/btn_2zn_11.png",
		id = 1011,
		cards = {
			100101,
			100102,
			100113,
			100104,
			100115,
			100106,
			100107,
			100118,
			100119,
			100110
		},
		deployLock = {
			0,
			0,
			0,
			0,
			1,
			0
		},
		monsterIDs = {
			1011
		},
		award = {
			[527.0] = 2,
			__size = 4,
			[6394.0] = 15,
			gold = 60000,
			[21771.0] = 7
		}
	},
	[1021] = {
		openDay = 1,
		name = "Mirror City",
		reviewPlot = "After passing the test, you got a white slate painted with #L10##C0xAEAEA8# Caterpie pattern #C0x5B545B##L0#.",
		gateSeq = 1,
		desc = "Level effect: Enemy will become a mirror image, and the enemy will be healed when attacked by the mirror target. \nVictory condition: win the battle",
		scene = "csv.stage.summer",
		floor = 3,
		gateIcon = "activity/summer_challenge/btn_2zn_11.png",
		id = 1021,
		cards = {
			100201,
			100202,
			100203,
			100211,
			100205,
			100212,
			100208
		},
		deployLock = slot5[1021],
		monsterIDs = {
			1021
		},
		award = {
			__size = 4,
			rmb = 100,
			[6394.0] = 15,
			gold = 70000,
			[21771.0] = 8
		}
	},
	[1031] = {
		openDay = 2,
		name = "Fire Island",
		reviewPlot = "After passing the test, you got a red slate painted with #L10##C0xEE2417#Oddish pattern #C0x5B545B##L0#.",
		gateSeq = 1,
		desc = "Level effect: Each Charizard have different abilities, try to survive! \nVictory condition: still alive at the beginning of round 7",
		scene = "csv.stage.summer",
		floor = 4,
		id = 1031,
		cards = {
			100311,
			100302,
			100313,
			100304,
			100305,
			100316,
			100307,
			100318,
			100309,
			100310
		},
		deployLock = slot5[1031],
		monsterIDs = {
			1031
		},
		award = {
			__size = 5,
			[851.0] = 400,
			[6394.0] = 15,
			gold = 80000,
			[21771.0] = 9,
			[850.0] = 200
		}
	},
	[1041] = {
		openDay = 2,
		name = "Illusion",
		reviewPlot = "After passing the test, you got a purple slate painted with #L10##C0xC817EE# Machamp pattern #C0x5B545B##L0#.",
		gateSeq = 1,
		desc = "Level effect: Alakazam hides himself among the illusions, find him! When Alakazam is in danger, he will shift himself with another illusion.\nVictory condition: defeat the true Alakazam",
		scene = "csv.stage.summer",
		floor = 5,
		id = 1041,
		cards = {
			100401,
			100402,
			100403,
			100404,
			100405,
			100406,
			100407,
			100408,
			100409,
			100410
		},
		deployLock = slot5[1041],
		monsterIDs = {
			1041
		},
		award = {
			__size = 4,
			[6394.0] = 15,
			gold = 90000,
			[21771.0] = 10,
			[529.0] = 1000
		}
	},
	[1051] = {
		openDay = 2,
		name = "Ferris Wheel",
		reviewPlot = "After passing the test, you got a yellow slate painted with #L10##C0xEEE017#Goldeen pattern #C0x5B545B##L0#.",
		scene = "csv.stage.summer",
		gateSeq = 1,
		desc = "Level effect: The naughty Hoopa loves to lie, find out the Hoopa who tells the truth can get clues. \nVictory condition: defeat all Hoopa who tells the truth",
		floor = 6,
		id = 1051,
		autoCards = {
			__size = 1,
			[100502.0] = 2
		},
		deployLock = slot5[1051],
		monsterIDs = {
			1051
		},
		award = {
			__size = 4,
			[6394.0] = 15,
			[501.0] = 2,
			gold = 100000,
			[21771.0] = 11
		}
	},
	[1061] = {
		openDay = 3,
		name = "Rescue",
		reviewPlot = "After driving away the teen hooligans, you rescued the injured Feebas and temporarily subdued it in the Pokéball.",
		scene = "csv.stage.summer",
		gateSeq = 1,
		desc = "Level effect: protect the injured Feebas. \nVictory condition: win the game and Feebas survive",
		floor = 7,
		id = 1061,
		autoCards = {
			__size = 1,
			[100611.0] = 2
		},
		cards = {
			100621,
			100602,
			100603,
			100624,
			100605,
			100606,
			100607,
			100608,
			100609,
			100610
		},
		deployLock = slot5[1061],
		monsterIDs = {
			1061
		},
		award = {
			__size = 4,
			[6394.0] = 15,
			[972.0] = 1,
			gold = 110000,
			[21771.0] = 12
		}
	},
	[1071] = {
		openDay = 3,
		name = "Treasure Land",
		reviewPlot = "After solving the mystery in the desert, you found a beautiful statue of Milotic.",
		scene = "csv.stage.summer",
		id = 1071,
		gateSeq = 1,
		desc = "Level effect: The colorful pillars seem to be related to the previously obtained slate. What does the pattern on the slate represent? \nVictory condition: win the game",
		floor = 8,
		autoCards = {
			[100704.0] = 4,
			[100703.0] = 3,
			[100702.0] = 2,
			[100701.0] = 1,
			__size = 6,
			[100706.0] = 6,
			[100705.0] = 5
		},
		monsterIDs = {
			1071
		},
		award = {
			__size = 4,
			[6394.0] = 15,
			gold = 120000,
			[21771.0] = 13,
			[502.0] = 6
		}
	},
	[1081] = {
		openDay = 3,
		name = "Snatch",
		reviewPlot = "The statue o fMilotic was snatched by the Team Rockets. In the process of retaking the statue of Milotic, you accidentally fell out of the airship...",
		roundLimit = 1,
		gateSeq = 1,
		desc = "Level effect: Be careful, don't break the statue of Milotic. \nVictory condition: win the game within one round and the statue of Milotic is not broken",
		scene = "csv.stage.summer",
		floor = 9,
		id = 1081,
		cards = {
			100801,
			100802,
			100803,
			100804,
			100805,
			100806,
			100807,
			100808,
			100809,
			100810
		},
		deployLock = slot5[1081],
		monsterIDs = {
			1081
		},
		award = {
			__size = 4,
			[962.0] = 2,
			[6394.0] = 15,
			gold = 130000,
			[21771.0] = 14
		}
	},
	[1091] = {
		openDay = 3,
		name = "Temple",
		reviewPlot = "With the help of Milotic, you defeated the Team Rockets and won the final victory of the Summer Adventure Explore event!",
		scene = "csv.stage.summer",
		gateSeq = 1,
		desc = "Level effect: Fight the Team Rockets with Milotic! \nVictory condition: win the game",
		floor = 10,
		id = 1091,
		autoCards = {
			[100911.0] = 0,
			__size = 1
		},
		cards = {
			100901,
			100902,
			100903,
			100904,
			100905,
			100916,
			100907,
			100908,
			100909,
			100910
		},
		deployLock = {
			1,
			0,
			0,
			0,
			1,
			0
		},
		monsterIDs = {
			1091
		},
		award = {
			__size = 5,
			[21771.0] = 15,
			[6394.0] = 30,
			[973.0] = 1,
			gold = 140000,
			[2419.0] = 1
		}
	},
	[2001] = {
		openDay = 1,
		name = "First encounter with Slowpoke",
		reviewPlot = "In the middle of the valley, you found an ancient stone tablet, engraved with the legend of the Slowking",
		roundLimit = 1,
		gateSeq = 2,
		desc = "Stage Effects：Slowpoke takes significantly less active attack damage. \nVictory Condition: Defeat all the Slowpoke within a limited time",
		scene = "csv.stage.summer",
		floor = 1,
		gateIcon = "activity/summer_challenge/btn_2zn_1.png",
		id = 2001,
		cards = {
			200001,
			200002,
			200003,
			200004,
			200005,
			200006,
			200007,
			200008,
			200009,
			200010
		},
		monsterIDs = {
			2001
		},
		award = {
			__size = 4,
			[500.0] = 1,
			[6393.0] = 15,
			gold = 100000,
			[20321.0] = 5
		}
	},
	[2011] = {
		openDay = 1,
		name = "Slowking Legend",
		reviewPlot = "With the help of you, one Slowpoke obtained the King's token in the middle of the valley successfully",
		roundLimit = 2,
		gateSeq = 2,
		desc = "Stage Effect: Shellder's shell HP boosted. \nVictory Condition: Defeat all the Shellder within a limited time",
		scene = "csv.stage.summer",
		floor = 2,
		gateIcon = "activity/summer_challenge/btn_2zn_2.png",
		id = 2011,
		cards = {
			200101,
			200102,
			200103,
			200104,
			200105,
			200106,
			200107,
			200108,
			200109,
			200110
		},
		deployLock = slot5[2011],
		monsterIDs = {
			2011
		},
		award = {
			__size = 4,
			[6393.0] = 15,
			[901.0] = 20,
			gold = 120000,
			[20321.0] = 5
		}
	},
	[2021] = {
		openDay = 2,
		reviewPlot = "You managed to drive Team Rocket away temporarily...",
		roundLimit = 5,
		gateSeq = 2,
		desc = "Stage Effect: Protect Slowpoke. \nVictory Condition: Protect Slowpoke and defeat enemies",
		scene = "csv.stage.summer",
		name = "Team Rocket is coming",
		floor = 3,
		id = 2021,
		gateIcon = "activity/summer_challenge/btn_2zn_3.png",
		autoCards = {
			[200211.0] = 2,
			__size = 1
		},
		cards = {
			200201,
			200202,
			200203,
			200204,
			200205,
			200206,
			200207,
			200208,
			200209,
			200210
		},
		deployLock = slot5[2021],
		monsterIDs = {
			2021
		},
		award = {
			__size = 4,
			[519.0] = 2,
			[6393.0] = 15,
			gold = 140000,
			[20321.0] = 5
		}
	},
	[2031] = {
		openDay = 2,
		name = "Evolve! Slowking",
		reviewPlot = "In a blaze of light, the Slowpoke wearing the King's Rock successfully evolved into the Slowking.",
		scene = "csv.stage.summer",
		roundLimit = 3,
		gateSeq = 2,
		desc = "Stage Effect: Boosted trigger chance of King's Rock, Slowpoke can heal itself. \nVictory Condition: Defeat all the Slowpoke with King's Rock",
		floor = 4,
		gateIcon = "activity/summer_challenge/btn_2zn_4.png",
		id = 2031,
		autoCards = {
			__size = 3,
			[200301.0] = 1,
			[200303.0] = 3,
			[200302.0] = 2
		},
		deployLock = slot5[2031],
		monsterIDs = {
			2031
		},
		award = {
			[527.0] = 2,
			__size = 4,
			[6393.0] = 15,
			gold = 160000,
			[20321.0] = 5
		}
	},
	[2041] = {
		openDay = 3,
		name = "Relic of Fire",
		reviewPlot = "You have successfully solved the riddle of Moltres and got the Relic of Fire.",
		scene = "csv.stage.summer",
		roundLimit = 1,
		gateSeq = 2,
		desc = "Stage Effect: Light and darkness form, the fire is burning brightly. \nVictory Condition: Light all the torches",
		floor = 5,
		gateIcon = "activity/summer_challenge/btn_2zn_5.png",
		id = 2041,
		autoCards = {
			[200403.0] = 3,
			[200401.0] = 1,
			[200402.0] = 2,
			__size = 3
		},
		deployLock = slot5[2041],
		monsterIDs = {
			2041
		},
		award = {
			__size = 4,
			rmb = 128,
			[6393.0] = 20,
			gold = 180000,
			[20321.0] = 7
		}
	},
	[2051] = {
		openDay = 3,
		name = "Relic of Electricity",
		reviewPlot = "You have successfully solved the riddle of Zapdos and got the Relic of Electricity.",
		scene = "csv.stage.summer",
		roundLimit = 3,
		gateSeq = 2,
		desc = "Stage Effect: Electrode flows, Positive and negative electrode neutralize. \nVictory Condition: Defeat all the enemies",
		floor = 6,
		gateIcon = "activity/summer_challenge/btn_2zn_6.png",
		id = 2051,
		autoCards = {
			__size = 6,
			[200505.0] = 5,
			[200504.0] = 4,
			[200501.0] = 1,
			[200503.0] = 3,
			[200502.0] = 2,
			[200506.0] = 6
		},
		monsterIDs = {
			2051
		},
		award = {
			[503.0] = 3,
			__size = 4,
			[6393.0] = 20,
			gold = 200000,
			[20321.0] = 7
		}
	},
	[2061] = {
		openDay = 3,
		name = "Relic of Ice",
		reviewPlot = "You have successfully solved the riddle of Articuno and got the Relic of Relic of Ice.",
		roundLimit = 1,
		gateSeq = 2,
		desc = "Stage Effect: Deep and shallow frozen soil, the relic of Ice Cave. \nVictory Condition: Break all the ice without breaking relice",
		scene = "csv.stage.summer",
		floor = 7,
		gateIcon = "activity/summer_challenge/btn_2zn_7.png",
		id = 2061,
		cards = {
			200601,
			200602,
			200603,
			200604,
			200605,
			200606,
			200607,
			200608,
			200609,
			200610
		},
		monsterIDs = {
			2061
		},
		award = {
			__size = 4,
			[6393.0] = 20,
			[520.0] = 3,
			gold = 220000,
			[20321.0] = 7
		}
	},
	[2071] = {
		openDay = 4,
		name = "Song pf Lugia",
		reviewPlot = "Slowking finishes playing, Lugia rises from the sea……",
		scene = "csv.stage.summer",
		gateSeq = 2,
		desc = "Stage Effect: The Slowking plays 1 layer for each action, 5 layers can play Song of Lugia. \nVictory Condition: Protect Slowking and play the song of Lugia",
		floor = 8,
		gateIcon = "activity/summer_challenge/btn_2zn_8.png",
		id = 2071,
		autoCards = {
			__size = 1,
			[200711.0] = 2
		},
		cards = {
			200701,
			200702,
			200703,
			200704,
			200705,
			200706,
			200707,
			200708,
			200709,
			200710
		},
		deployLock = slot5[2071],
		monsterIDs = {
			2071
		},
		award = {
			__size = 4,
			[6393.0] = 30,
			[521.0] = 3,
			gold = 240000,
			[20321.0] = 10
		}
	},
	[2081] = {
		openDay = 4,
		name = "Lugia is coming",
		reviewPlot = "With the help of Team Rocket and Lugia, You have successfully calmed the anger of the uncontrollable Three Legendary Birds",
		roundLimit = 3,
		gateSeq = 2,
		desc = "Stage Effect: Three Legendary Birds improved ability greatly, Lugia will weaken Three Legendary Birds randomly. \nVictory Condition： Defeat the uncontrollable Three Legendary Birds",
		scene = "csv.stage.summer",
		floor = 9,
		id = 2081,
		gateIcon = "activity/summer_challenge/btn_2zn_9.png",
		autoCards = {
			__size = 2,
			[200811.0] = 0,
			[200812.0] = 0
		},
		cards = {
			200801,
			200802,
			200803,
			200804,
			200805,
			200806,
			200807,
			200808,
			200809,
			200810
		},
		monsterIDs = {
			2081
		},
		award = {
			__size = 4,
			[6393.0] = 30,
			[501.0] = 2,
			gold = 260000,
			[20321.0] = 10
		}
	},
	[2091] = {
		openDay = 4,
		name = "Farewell to Team Rocket",
		reviewPlot = "After all this, the environment around the lake gradually returned to the original...",
		scene = "csv.stage.summer",
		gateSeq = 2,
		desc = "Stage Effect: Say goodbye to Rocket Team! \nVictory Condition：Defeat Team Rocket",
		floor = 10,
		gateIcon = "activity/summer_challenge/btn_2zn_10.png",
		id = 2091,
		autoCards = {
			__size = 1,
			[200911.0] = 0
		},
		cards = {
			200901,
			200902,
			200903,
			200904,
			200905,
			200906,
			200907,
			200908,
			200909,
			200910
		},
		monsterIDs = {
			2091
		},
		award = {
			__size = 5,
			gold = 280000,
			[6393.0] = 30,
			[974.0] = 1,
			[20321.0] = 10,
			[2430.0] = 1
		}
	},
	[3001] = {
		openDay = 1,
		name = "New partner, Oshawott!",
		reviewPlot = "You got an Oshawott from Professor Aurea Juniper, and Oshawott seems willing to be your companion.",
		scene = "csv.stage.summer",
		roundLimit = 1,
		gateSeq = 3,
		desc = "Stage Effect: Get an Oshawott from the Doctor's Research Institute! \nVictory Condition: Defeat Oshawott",
		floor = 1,
		id = 3001,
		gateIcon = "activity/summer_challenge/btn_bksy_1.png",
		autoCards = {
			[300002.0] = 2,
			[300001.0] = 1,
			__size = 3,
			[300003.0] = 3
		},
		deployLock = slot5[3001],
		monsterIDs = {
			3001
		},
		award = {
			__size = 5,
			rmb = 100,
			[6394.0] = 20,
			[20211.0] = 10,
			gold = 50000,
			[22491.0] = 6
		},
		iconPos = {
			__size = 2,
			x = 264,
			y = 1212
		}
	},
	[3011] = {
		openDay = 1,
		name = "Dream Oshawott",
		reviewPlot = "Oshawott fell in love with Osharina, but met a powerful rival, you need to help it train to win back its love.",
		scene = "csv.stage.summer",
		gateSeq = 3,
		desc = "Stage Effect: The Battle of the Rivals' First Encounter! At the beginning of the battle, you can choose one effect for the enemy, and gain the remaining two effects for yourself. \nVictory Condition: Defeat Oshawott with Dewott",
		floor = 2,
		gateIcon = "activity/summer_challenge/btn_bksy_2.png",
		id = 3011,
		autoCards = {
			[300101.0] = 2,
			__size = 1
		},
		deployLock = slot5[3011],
		monsterIDs = {
			3011
		},
		award = {
			__size = 5,
			[5000.0] = 10,
			[6394.0] = 22,
			[20211.0] = 10,
			gold = 60000,
			[22491.0] = 7
		},
		iconPos = {
			__size = 2,
			x = 804,
			y = 998
		}
	},
	[3021] = {
		openDay = 2,
		name = "Balance special training",
		reviewPlot = "Oshawott successfully passed Balance special training.",
		roundLimit = 3,
		gateSeq = 3,
		desc = "Stage Effect: Keep balance! If the number of both sides is different in the first two big rounds, it will fail. \nVictory Condition: Defeat all enemies",
		scene = "csv.stage.summer",
		isFullManual = true,
		floor = 3,
		id = 3021,
		gateIcon = "activity/summer_challenge/btn_bksy_3.png",
		cards = {
			300201,
			300202,
			300203,
			300204,
			300205,
			300206,
			300207,
			300208,
			300209,
			300210
		},
		monsterIDs = {
			3021
		},
		award = {
			__size = 5,
			[22491.0] = 8,
			[6394.0] = 24,
			[20211.0] = 12,
			gold = 70000,
			[502.0] = 5
		},
		iconPos = {
			__size = 2,
			x = 204,
			y = 671
		}
	},
	[3031] = {
		openDay = 2,
		name = "Agility special training",
		reviewPlot = "Oshawott successfully passed Agility special training.",
		scene = "csv.stage.summer",
		roundLimit = 1,
		gateSeq = 3,
		desc = "Stage Effect: Special training for dexterous evasion, if you are attacked three times, you will fail! \nVictory Condition: Being attacked less than 3 times",
		floor = 4,
		gateIcon = "activity/summer_challenge/btn_bksy_4.png",
		id = 3031,
		autoCards = {
			__size = 6,
			[300305.0] = 0,
			[300302.0] = 0,
			[300303.0] = 0,
			[300304.0] = 0,
			[300306.0] = 0,
			[300301.0] = 0
		},
		monsterIDs = {
			3031
		},
		award = {
			__size = 5,
			[6394.0] = 26,
			[501.0] = 1,
			[20211.0] = 12,
			gold = 80000,
			[22491.0] = 9
		},
		iconPos = {
			__size = 2,
			x = 428,
			y = 274
		}
	},
	[3041] = {
		openDay = 3,
		name = "Strength special training",
		reviewPlot = "Oshawott successfully passed Strength special training.",
		scene = "csv.stage.summer",
		gateSeq = 3,
		desc = "Stage Effect: Special training for strength control, only those defeated by Oshawott count! \nVictory Condition: Defeat 6 enemies by Oshawott",
		floor = 5,
		gateIcon = "activity/summer_challenge/btn_bksy_5.png",
		id = 3041,
		autoCards = {
			__size = 1,
			[300401.0] = 0
		},
		cards = {
			300411,
			300402,
			300403,
			300404,
			300405,
			300406,
			300407,
			300408,
			300409,
			300410
		},
		monsterIDs = {
			3041
		},
		award = {
			[527.0] = 2,
			__size = 5,
			[6394.0] = 28,
			[20211.0] = 15,
			gold = 90000,
			[22491.0] = 10
		},
		iconPos = {
			__size = 2,
			x = 1308,
			y = 335
		}
	},
	[3051] = {
		openDay = 3,
		name = "Endurance special training",
		reviewPlot = "Oshawott successfully passed Endurance special training.",
		gateSeq = 3,
		desc = "Stage Effect: Endurance training, all allies cannot move actively, and the enemy's Crit Rate increases! \nVictory Condition: Defeat all enemies",
		scene = "csv.stage.summer",
		floor = 6,
		gateIcon = "activity/summer_challenge/btn_bksy_6.png",
		id = 3051,
		cards = {
			300501,
			300502,
			300503,
			300504,
			300505,
			300506,
			300507,
			300508,
			300509,
			300510,
			300511,
			300512,
			300513,
			300515,
			300516,
			300517,
			300518,
			300519
		},
		deployLock = slot5[3051],
		monsterIDs = {
			3051
		},
		award = {
			__size = 5,
			[112.0] = 10,
			[6394.0] = 30,
			[20211.0] = 15,
			gold = 100000,
			[22491.0] = 11
		},
		iconPos = {
			__size = 2,
			x = 2262,
			y = 366
		}
	},
	[3061] = {
		openDay = 3,
		name = "Precision special training",
		reviewPlot = "Oshawott successfully passed Precision special training.",
		scene = "csv.stage.summer",
		roundLimit = 1,
		gateSeq = 3,
		desc = "Stage Effect: Scalchop will fly back to Oshawott's hand when breaking the ice cube, and its skills will be replaced with stage-specific skills. \nVictory Condition: Break all ice cubes within a limited time",
		floor = 7,
		id = 3061,
		gateIcon = "activity/summer_challenge/btn_bksy_7.png",
		autoCards = {
			__size = 1,
			[300601.0] = 2
		},
		deployLock = slot5[3061],
		monsterIDs = {
			3061
		},
		award = {
			[152.0] = 10,
			__size = 5,
			[6394.0] = 32,
			[20211.0] = 18,
			gold = 110000,
			[22491.0] = 12
		},
		iconPos = {
			__size = 2,
			x = 2364,
			y = 1142
		}
	},
	[3071] = {
		openDay = 4,
		name = "Speed special training",
		reviewPlot = "Oshawott successfully passed Speed special training.",
		scene = "csv.stage.summer",
		gateSeq = 3,
		desc = "Stage Effect: After the unit dies, it will be revived with full HP and rage, and move forward 1 meter each time it moves. \nVictory Condition: The first team to advance 50 meters in total wins",
		floor = 8,
		id = 3071,
		gateIcon = "activity/summer_challenge/btn_bksy_8.png",
		autoCards = {
			__size = 1,
			[300711.0] = 2
		},
		cards = {
			300707,
			300708,
			300709,
			300710,
			300712,
			300713,
			300714,
			300715,
			300716,
			300717,
			300701,
			300702,
			300703,
			300704,
			300705,
			300706
		},
		deployLock = slot5[3071],
		monsterIDs = {
			3071
		},
		award = {
			__size = 5,
			[20211.0] = 18,
			[6394.0] = 34,
			[521.0] = 2,
			gold = 120000,
			[22491.0] = 13
		},
		iconPos = {
			__size = 2,
			x = 1888,
			y = 940
		}
	},
	[3081] = {
		openDay = 4,
		name = "Scalchop King Battle!",
		reviewPlot = "Oshawott defeated its rival in the tournament, but lost completely in love",
		scene = "csv.stage.summer",
		gateSeq = 3,
		desc = "Stage Effect: Cheerleaders will provide Dewott with different effects. After the cheerleaders are defeated, immediately revive and be stunned for 1 round. \nVictory Condition: Defeat the enemy Dewott",
		floor = 9,
		id = 3081,
		gateIcon = "activity/summer_challenge/btn_bksy_9.png",
		autoCards = {
			__size = 1,
			[300801.0] = 2
		},
		cards = {
			300802,
			300803,
			300804,
			300805,
			300806,
			300807,
			300808,
			300809,
			300810,
			300811,
			300812,
			300813,
			300814,
			300815,
			300816,
			300817
		},
		deployLock = slot5[3081],
		monsterIDs = {
			3081
		},
		award = {
			__size = 5,
			gold = 130000,
			[6394.0] = 36,
			[20211.0] = 20,
			[7303.0] = 1,
			[22491.0] = 14
		},
		iconPos = {
			__size = 2,
			x = 1396,
			y = 750
		}
	},
	[3091] = {
		openDay = 4,
		name = "Troublemaker Team Rocket",
		reviewPlot = "After defeating Team Rocket hand in hand, Oshawott finally came out of the pain of lovelorn. This world is not only about love, but also sincere friendship, which is worth protecting!",
		id = 3091,
		floor = 10,
		gateSeq = 3,
		desc = "Stage Effect: Team Rocket is making trouble again! \nVictory Condition: Defeat Team Rocket",
		scene = "csv.stage.summer",
		gateIcon = "activity/summer_challenge/btn_bksy_10.png",
		cards = {
			300901,
			300902,
			300903,
			300904,
			300905,
			300906,
			300907,
			300908,
			300909,
			300910,
			300911,
			300912,
			300913,
			300914,
			300915,
			300916,
			300917,
			300918,
			300919,
			300920
		},
		monsterIDs = {
			3091
		},
		award = {
			[2435.0] = 1,
			[20211.0] = 25,
			[6394.0] = 38,
			[973.0] = 1,
			gold = 140000,
			__size = 6,
			[22491.0] = 15
		},
		iconPos = {
			__size = 2,
			x = 1330,
			y = 1244
		}
	},
	[4001] = {
		openDay = 1,
		floor = 1,
		gateIcon = "activity/summer_challenge/btn_23znq_1.png",
		roundLimit = 1,
		gateSeq = 4,
		scene = "csv.stage.summer",
		id = 4001,
		deployLock = slot5[4001],
		monsterIDs = {
			4001
		},
		iconPos = {
			__size = 2,
			x = 330,
			y = 638
		}
	},
	[4011] = {
		openDay = 1,
		floor = 2,
		gateIcon = "activity/summer_challenge/btn_23znq_2.png",
		roundLimit = 1,
		gateSeq = 4,
		scene = "csv.stage.summer",
		id = 4011,
		deployLock = slot5[4011],
		monsterIDs = {
			4011
		},
		iconPos = {
			__size = 2,
			x = 426,
			y = 1130
		}
	},
	[4021] = {
		openDay = 2,
		floor = 3,
		gateIcon = "activity/summer_challenge/btn_23znq_3.png",
		gateSeq = 4,
		scene = "csv.stage.summer",
		id = 4021,
		deployLock = slot5[4021],
		monsterIDs = {
			4021
		},
		iconPos = {
			__size = 2,
			x = 978,
			y = 1074
		}
	},
	[4031] = {
		openDay = 2,
		floor = 4,
		gateIcon = "activity/summer_challenge/btn_23znq_4.png",
		roundLimit = 5,
		gateSeq = 4,
		scene = "csv.stage.summer",
		id = 4031,
		monsterIDs = {
			4031
		},
		iconPos = {
			__size = 2,
			x = 1478,
			y = 1232
		}
	},
	[4041] = {
		openDay = 3,
		floor = 5,
		gateIcon = "activity/summer_challenge/btn_23znq_5.png",
		roundLimit = 1,
		gateSeq = 4,
		scene = "csv.stage.summer",
		id = 4041,
		deployLock = slot5[4041],
		monsterIDs = {
			4041
		},
		iconPos = {
			__size = 2,
			x = 2008,
			y = 1068
		}
	},
	[4051] = {
		openDay = 3,
		floor = 6,
		gateIcon = "activity/summer_challenge/btn_23znq_6.png",
		roundLimit = 5,
		gateSeq = 4,
		scene = "csv.stage.summer",
		id = 4051,
		deployLock = slot5[4051],
		monsterIDs = {
			4051
		},
		iconPos = {
			__size = 2,
			x = 2336,
			y = 584
		}
	},
	[4061] = {
		openDay = 3,
		floor = 7,
		gateIcon = "activity/summer_challenge/btn_23znq_7.png",
		roundLimit = 5,
		gateSeq = 4,
		scene = "csv.stage.summer",
		id = 4061,
		deployLock = slot5[4061],
		monsterIDs = {
			4061
		},
		iconPos = {
			__size = 2,
			x = 1890,
			y = 254
		}
	},
	[4071] = {
		openDay = 4,
		floor = 8,
		gateIcon = "activity/summer_challenge/btn_23znq_8.png",
		roundLimit = 1,
		gateSeq = 4,
		scene = "csv.stage.summer",
		id = 4071,
		deployLock = slot5[4071],
		monsterIDs = {
			4071
		},
		iconPos = {
			__size = 2,
			x = 1654,
			y = 710
		}
	},
	[4081] = {
		openDay = 4,
		floor = 9,
		gateIcon = "activity/summer_challenge/btn_23znq_9.png",
		roundLimit = 2,
		gateSeq = 4,
		scene = "csv.stage.summer",
		id = 4081,
		deployLock = slot5[4081],
		monsterIDs = {
			4081
		},
		iconPos = {
			__size = 2,
			x = 994,
			y = 546
		}
	},
	[4091] = {
		openDay = 4,
		floor = 10,
		scene = "csv.stage.summer",
		id = 4091,
		gateSeq = 4,
		gateIcon = "activity/summer_challenge/btn_23znq_10.png",
		monsterIDs = {
			4091
		},
		iconPos = {
			__size = 2,
			x = 560,
			y = 261
		}
	},
	[5001] = {
		openDay = 1,
		name = "Mine",
		reviewPlot = "You encountered two researchers in the mine.",
		gateSeq = 5,
		desc = "Stage Effect: Pass through a mine.\nVictory condition: Win the battle.",
		scene = "csv.stage.summer",
		floor = 1,
		gateIcon = "activity/summer_challenge/btn_xrtz_1.png",
		id = 5001,
		cards = slot4[5001],
		deployLock = slot5[5001],
		monsterIDs = {
			5001
		},
		award = {
			__size = 4,
			[500.0] = 1,
			[6394.0] = 15,
			gold = 50000,
			[24561.0] = 6
		},
		iconPos = slot1[5001]
	},
	[5011] = {
		openDay = 1,
		name = "Researchers",
		reviewPlot = "You helped the researchers excavate precious fossils.",
		gateSeq = 5,
		desc = "Stage Effect: Do not damage precious fossils.\nVictory condition: Clear the soil layer and excavate the fossils.",
		scene = "csv.stage.summer",
		floor = 2,
		gateIcon = "activity/summer_challenge/btn_xrtz_2.png",
		id = 5011,
		cards = slot4[5011],
		deployLock = slot5[5011],
		monsterIDs = {
			5011
		},
		award = {
			[527.0] = 2,
			__size = 4,
			[6394.0] = 15,
			gold = 60000,
			[24561.0] = 7
		},
		iconPos = slot1[5011]
	},
	[5021] = {
		openDay = 2,
		name = "Troublemaker Team Rocket",
		reviewPlot = "You successfully scared away the Rocket team.",
		roundLimit = 6,
		gateSeq = 5,
		desc = "Stage Effect: The Rocket team is causing trouble again!\nVictory condition: You know it.",
		scene = "csv.stage.summer",
		floor = 3,
		id = 5021,
		gateIcon = "activity/summer_challenge/btn_xrtz_3.png",
		cards = slot4[5021],
		deployLock = slot5[5021],
		monsterIDs = {
			5021
		},
		award = {
			__size = 4,
			rmb = 100,
			[6394.0] = 15,
			gold = 70000,
			[24561.0] = 8
		},
		iconPos = slot1[5021]
	},
	[5031] = {
		openDay = 2,
		name = "Fossil Research",
		reviewPlot = "You successfully revived an ancient spirit with the fossil.",
		id = 5031,
		floor = 4,
		gateSeq = 5,
		desc = "Stage Effect: All color will change when be attacked.\nVictory condition: Turn all fossils into the same color.",
		scene = "csv.stage.summer",
		gateIcon = "activity/summer_challenge/btn_xrtz_4.png",
		cards = slot4[5031],
		monsterIDs = {
			5031
		},
		award = {
			[152.0] = 15,
			[151.0] = 150,
			[6394.0] = 15,
			__size = 5,
			gold = 80000,
			[24561.0] = 9
		},
		iconPos = slot1[5031]
	},
	[5041] = {
		openDay = 3,
		name = "Ah woo! Delicious head.",
		reviewPlot = "The Dracovish seems to have no malicious intent.",
		scene = "csv.stage.summer",
		roundLimit = 4,
		gateSeq = 5,
		desc = "Stage Effect: The Dracovish seems to be interested in your head. \nVictory conditions: Survive 3 rounds",
		floor = 5,
		id = 5041,
		gateIcon = "activity/summer_challenge/btn_xrtz_5.png",
		autoCards = {
			__size = 3,
			[810403.0] = 1,
			[810401.0] = 2,
			[810404.0] = 3
		},
		deployLock = slot5[5041],
		monsterIDs = {
			5041
		},
		award = {
			__size = 4,
			[6394.0] = 15,
			gold = 90000,
			[24561.0] = 10,
			[529.0] = 1000
		},
		iconPos = slot1[5041]
	},
	[5051] = {
		openDay = 3,
		name = "Desert Adventure",
		reviewPlot = "You crossed a desert filled with quicksand.",
		roundLimit = 6,
		gateSeq = 5,
		desc = "Stage Effect: [Quicksand] will kill the target at the end of the big round. Attacking the counterpoint stone pillar 3 times can release the [Quicksand] in this position. \nVictory condition: Survive 5 rounds",
		scene = "csv.stage.summer",
		floor = 6,
		gateIcon = "activity/summer_challenge/btn_xrtz_6.png",
		id = 5051,
		cards = slot4[5051],
		monsterIDs = {
			5051
		},
		award = {
			__size = 4,
			[6394.0] = 15,
			[501.0] = 2,
			gold = 100000,
			[24561.0] = 11
		},
		iconPos = slot1[5051]
	},
	[5061] = {
		openDay = 3,
		name = "Lost in the Green Wilderness",
		reviewPlot = "You passed through a forest entangled with vines.",
		gateSeq = 5,
		desc = "Stage Effects: stealth cancels cooldown; permanent abstinence from Shaymin; The healing rate of other elves has increased significantly.\nVictory conditions: Defeat Shaymin",
		scene = "csv.stage.summer",
		floor = 7,
		gateIcon = "activity/summer_challenge/btn_xrtz_7.png",
		id = 5061,
		cards = {
			100001,
			100002,
			100003,
			100004,
			100005,
			100006,
			100007,
			100008,
			100009,
			100010
		},
		deployLock = slot5[5061],
		monsterIDs = {
			5061
		},
		award = {
			__size = 5,
			[111.0] = 200,
			[6394.0] = 15,
			[112.0] = 40,
			gold = 110000,
			[24561.0] = 12
		},
		iconPos = slot1[5061]
	},
	[5071] = {
		openDay = 4,
		name = "Desire to Swim",
		reviewPlot = "You and your companions had a pleasant afternoon in the water.",
		scene = "csv.stage.summer",
		gateSeq = 5,
		desc = "Stage Effect: Let the Dracovish and his companions play happily in the water, and it will fail if the Dracovish dies. \nVictory Conditions: Victory in battle",
		floor = 8,
		id = 5071,
		gateIcon = "activity/summer_challenge/btn_xrtz_8.png",
		autoCards = {
			[810701.0] = 2,
			__size = 1
		},
		cards = slot4[5071],
		deployLock = slot5[5071],
		monsterIDs = {
			5071
		},
		award = {
			__size = 4,
			[6394.0] = 15,
			gold = 120000,
			[24561.0] = 13,
			[502.0] = 6
		},
		iconPos = slot1[5071]
	},
	[5081] = {
		openDay = 4,
		name = "Best Friends",
		reviewPlot = "The Dracovish and the Sirfetch'd became good friends.",
		scene = "csv.stage.summer",
		roundLimit = 4,
		gateSeq = 5,
		desc = "Stage Effects: The Dracovish skill is replaced with a stage-specific skill, and the corresponding attack can be immune to damage.\nVictory condition: Survive 4 rounds",
		floor = 9,
		id = 5081,
		gateIcon = "activity/summer_challenge/btn_xrtz_9.png",
		autoCards = {
			[810801.0] = 2,
			__size = 1
		},
		deployLock = slot5[5081],
		monsterIDs = {
			5081
		},
		award = {
			__size = 4,
			[6394.0] = 15,
			[973.0] = 1,
			gold = 130000,
			[24561.0] = 14
		},
		iconPos = slot1[5081]
	},
	[5091] = {
		openDay = 4,
		name = "Ultimate Showdown",
		reviewPlot = "The Dracovish defeated the Ace Charizard.",
		scene = "csv.stage.summer",
		gateSeq = 5,
		desc = "Stage Effect: Duel Ace Charizard! Charizard skills are replaced with stage-specific skills. \nVictory conditions: Defeat all enemies",
		floor = 10,
		gateIcon = "activity/summer_challenge/btn_xrtz_10.png",
		id = 5091,
		autoCards = {
			__size = 1,
			[810901.0] = 0
		},
		cards = slot4[5091],
		monsterIDs = {
			5091
		},
		award = {
			__size = 5,
			[7304.0] = 1,
			[6394.0] = 30,
			[2451.0] = 1,
			gold = 140000,
			[24561.0] = 15
		},
		iconPos = slot1[5091]
	},
	[6001] = {
		openDay = 1,
		floor = 1,
		gateIcon = "activity/summer_challenge/btn_23znq_1.png",
		gateSeq = 6,
		scene = "csv.stage.summer",
		id = 6001,
		deployLock = slot5[6001],
		monsterIDs = {
			6001
		},
		iconPos = slot1[6001]
	},
	[6011] = {
		openDay = 1,
		floor = 2,
		gateIcon = "activity/summer_challenge/btn_23znq_2.png",
		roundLimit = 1,
		gateSeq = 6,
		scene = "csv.stage.summer",
		id = 6011,
		deployLock = {
			0,
			0,
			1,
			1,
			1,
			1
		},
		monsterIDs = {
			6011
		},
		iconPos = slot1[6011]
	},
	[6021] = {
		openDay = 2,
		floor = 3,
		gateIcon = "activity/summer_challenge/btn_23znq_3.png",
		gateSeq = 6,
		scene = "csv.stage.summer",
		id = 6021,
		deployLock = slot5[6021],
		monsterIDs = {
			6021
		},
		iconPos = slot1[6021]
	},
	[6031] = {
		openDay = 2,
		floor = 4,
		gateIcon = "activity/summer_challenge/btn_23znq_4.png",
		roundLimit = 2,
		gateSeq = 6,
		scene = "csv.stage.summer",
		id = 6031,
		deployLock = slot5[6031],
		monsterIDs = {
			6031
		},
		iconPos = slot1[6031]
	},
	[6041] = {
		openDay = 3,
		floor = 5,
		gateIcon = "activity/summer_challenge/btn_23znq_5.png",
		gateSeq = 6,
		scene = "csv.stage.summer",
		id = 6041,
		deployLock = slot5[6041],
		monsterIDs = {
			6041
		},
		iconPos = slot1[6041]
	},
	[6051] = {
		openDay = 3,
		floor = 6,
		scene = "csv.stage.summer",
		id = 6051,
		gateSeq = 6,
		gateIcon = "activity/summer_challenge/btn_23znq_6.png",
		monsterIDs = {
			6051
		},
		iconPos = slot1[6051]
	},
	[6061] = {
		openDay = 3,
		floor = 7,
		gateIcon = "activity/summer_challenge/btn_23znq_7.png",
		gateSeq = 6,
		scene = "csv.stage.summer",
		id = 6061,
		deployLock = slot5[6061],
		monsterIDs = {
			6061
		},
		iconPos = slot1[6061]
	},
	[6071] = {
		openDay = 4,
		floor = 8,
		gateIcon = "activity/summer_challenge/btn_23znq_8.png",
		gateSeq = 6,
		scene = "csv.stage.summer",
		id = 6071,
		deployLock = slot5[6071],
		monsterIDs = {
			6071
		},
		iconPos = slot1[6071]
	},
	[6081] = {
		openDay = 4,
		floor = 9,
		gateIcon = "activity/summer_challenge/btn_23znq_9.png",
		gateSeq = 6,
		scene = "csv.stage.summer",
		id = 6081,
		deployLock = slot5[6081],
		monsterIDs = {
			6081
		},
		iconPos = slot1[6081]
	},
	[6091] = {
		openDay = 4,
		floor = 10,
		scene = "csv.stage.summer",
		id = 6091,
		gateSeq = 6,
		gateIcon = "activity/summer_challenge/btn_23znq_10.png",
		monsterIDs = {
			6091
		},
		iconPos = slot1[6091]
	},
	__default = {
		__index = {
			name = "",
			reviewPlot = "",
			deployDesc = "",
			desc = "",
			gateSeq = 0,
			beforeRes = "",
			isFullManual = false,
			gateIcon = "",
			openDay = 0,
			floor = 0,
			roundLimit = 10,
			beforePlotRepeat = false,
			scene = "csv.stage.city",
			autoCards = ({
				default = slot0[1]
			}).default,
			cards = slot4.default,
			deployLock = {
				0,
				0,
				0,
				0,
				0,
				0
			},
			winCondition = ({
				default = slot0[1]
			}).default,
			monsterIDs = ({
				default = slot0[2]
			}).default,
			award = ({
				default = slot0[1]
			}).default,
			iconPos = {
				__size = 2,
				x = 0,
				y = 0
			}
		}
	}
}

return csv.summer_challenge.gates
