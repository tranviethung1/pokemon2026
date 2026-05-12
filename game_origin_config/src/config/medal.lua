slot0 = {
	{
		__size = 0
	},
	__size = 12,
	[5] = {
		__size = 2,
		x = 15,
		y = 0
	},
	[6] = {
		gold = 1000000,
		stamina = 150,
		__size = 2
	},
	[14] = {
		gold = 1000000,
		coin16 = 1000,
		__size = 2
	},
	[19] = {
		__size = 2,
		x = 0,
		y = -10
	},
	[20] = {
		__size = 2,
		rmb = 100,
		[502.0] = 5
	},
	[21] = {
		feelLevel = 500,
		__size = 1
	},
	[23] = {
		__size = 2,
		rmb = 100,
		[521.0] = 2
	},
	[25] = {
		__size = 2,
		coin12 = 50000,
		rmb = 100
	},
	[26] = {
		gold = 1000000,
		__size = 2,
		[502.0] = 3
	},
	[40] = {
		gold = 1000000,
		[519.0] = 3,
		__size = 2
	},
	[44] = {
		gold = 1000000,
		__size = 2,
		[59003.0] = 3
	}
}
slot1 = {
	[1321] = slot0[19],
	[1222] = slot0[5],
	[1221] = slot0[5],
	[1121] = slot0[19],
	[1351] = slot0[5],
	[1331] = slot0[19],
	[1361] = slot0[5],
	[1291] = slot0[19],
	[1011] = slot0[5],
	[1001] = slot0[5]
}
slot2 = {
	default = slot0[1],
	[1132] = slot0[21],
	[1131] = slot0[21]
}
slot3 = {
	[1141] = slot0[20],
	[1222] = slot0[25],
	[1081] = slot0[14],
	[1121] = slot0[14],
	[1261] = slot0[26],
	[1201] = slot0[23],
	default = slot0[1],
	[1321] = slot0[40],
	[1161] = slot0[23],
	[1351] = slot0[44],
	[1091] = slot0[14],
	[1221] = slot0[25],
	[1191] = slot0[23],
	[1301] = slot0[23],
	[1371] = slot0[20],
	[1251] = slot0[26],
	[1291] = slot0[23],
	[1011] = slot0[6],
	[1231] = slot0[26],
	[1171] = slot0[23],
	[1331] = slot0[40],
	[1131] = slot0[20],
	[1151] = slot0[20],
	[1281] = slot0[23],
	[1311] = slot0[23],
	[1021] = slot0[6],
	[1341] = slot0[40],
	[1181] = slot0[23],
	[1241] = slot0[26],
	[1361] = slot0[44]
}
csv.medal = {
	__size = 40,
	[1001] = {
		showShadow = 1,
		hidedesc = "Complete daily quests to get the largest chest, which is very important for trainers to cultivate Pokémons, stick to it for about 100 days, and the mission will be completed!",
		targetArg = 150,
		targetType = 1,
		attrType1 = 1,
		medalID = 1,
		desc = "Claim the highest activity chest in daily quests for a total of 150 days daily.",
		type = 2,
		res = "city/medal/icon/medal_1.png",
		medalName = "Chests, not one less",
		id = 1001,
		attrNum1 = "800",
		sort = 1,
		award = {
			__size = 2,
			rmb = 100,
			[453.0] = 200
		},
		pos = slot1[1001]
	},
	[1011] = {
		showShadow = 1,
		attrNum2 = "300",
		targetArg = 200,
		targetType = 2,
		attrType1 = 7,
		medalID = 2,
		desc = "Total sign-in reaches 200 days",
		type = 1,
		res = "city/medal/icon/medal_8.png",
		attrType2 = 8,
		id = 1011,
		medalName = "Insist... will get victory!",
		attrNum1 = "300",
		sort = 1,
		award = slot3[1011],
		pos = slot1[1011]
	},
	[1021] = {
		showShadow = 1,
		attrNum2 = "200",
		targetArg = 150,
		desc = "Daily use of Tolom - Daily Assistant up to 150 days",
		attrType1 = 9,
		medalID = 3,
		hidedesc = "My image is displayed on the main interface, click I can bring convenience to you, if you want to use me every day, about 100 days, you can come to receive the mission reward",
		targetType = 3,
		res = "city/medal/icon/medal_4.png",
		attrType2 = 10,
		type = 2,
		id = 1021,
		medalName = "Right-hand man",
		attrNum1 = "200",
		sort = 1,
		award = slot3[1021]
	},
	[1031] = {
		showShadow = 1,
		targetType = 4,
		targetArg = 1000,
		type = 1,
		attrType1 = 1,
		medalID = 4,
		desc = "Total draw 1000 times by diamonds in Runestone.",
		medalName = "What's in the Runestone Prize Pool?",
		res = "city/medal/icon/medal_6.png",
		id = 1031,
		attrNum1 = "1120",
		sort = 1,
		award = {
			__size = 2,
			[531.0] = 5,
			[529.0] = 2000
		}
	},
	[1041] = {
		showShadow = 1,
		attrNum2 = "420",
		targetArg = 1000,
		targetType = 5,
		attrType1 = 7,
		medalID = 5,
		desc = "Total draw 1000 times by diamonds in Rift Totem.",
		type = 1,
		res = "city/medal/icon/medal_18.png",
		attrType2 = 8,
		id = 1041,
		medalName = "What's in the Totem Prize pool?",
		attrNum1 = "420",
		sort = 1,
		award = {
			gold = 1000000,
			[541.0] = 5,
			__size = 2
		},
		pos = {
			__size = 2,
			x = -22,
			y = 0
		}
	},
	[1051] = {
		showShadow = 1,
		targetType = 6,
		targetArg = 1000,
		type = 1,
		attrType1 = 1,
		medalID = 6,
		desc = "Total draw 1000 times by diamonds in Chip.",
		res = "city/medal/icon/medal_22.png",
		medalName = "What's in the chip prize pool?",
		id = 1051,
		attrNum1 = "1120",
		sort = 1,
		award = {
			__size = 2,
			[121.0] = 5,
			[124.0] = 20
		},
		pos = {
			__size = 2,
			x = 20,
			y = 0
		}
	},
	[1061] = {
		showShadow = 1,
		attrNum2 = "420",
		targetArg = 10,
		desc = "The runestones, explorers, totems, chips, and any of the above draw cards reach the upper limit of the day, and a total of 10 times",
		attrType1 = 7,
		medalID = 7,
		hidedesc = "Runestones, explorers, totems, chips, and diamonds must always be pumped! When the number of draws is completed on both hands, the task is naturally completed, and... What if something good can come out?",
		targetType = 7,
		res = "city/medal/icon/medal_21.png",
		attrType2 = 8,
		type = 2,
		id = 1061,
		medalName = "Infinite!",
		attrNum1 = "420",
		sort = 1,
		award = {
			[503.0] = 3,
			[541.0] = 3,
			__size = 4,
			[520.0] = 3,
			[531.0] = 3
		}
	},
	[1071] = {
		showShadow = 1,
		attrNum2 = "420",
		targetArg = 500,
		desc = "Challenge and succeed in Aether Paradise <Hard Enemy>gameplay, the cumulative times reach 500",
		attrType1 = 7,
		medalID = 10,
		hidedesc = "In the Aether Paradise, bring out the strongest Pokémon and defeat the difficult enemy with your own hands (emphasis added)! I will record your victories, keep patience, after hundreds of victories, the medal of honor will belong to you!",
		targetType = 10,
		res = "city/medal/icon/medal_9.png",
		attrType2 = 8,
		type = 2,
		id = 1071,
		medalName = "It's that strong",
		attrNum1 = "420",
		sort = 1,
		award = {
			gold = 1000000,
			__size = 2,
			coin2 = 5000
		}
	},
	[1081] = {
		hidedesc = "Decorator magazine wrote that if you want to improve the taste of the home, you need to continue to broaden your horizons. Well... Makes sense! Let's try it for a month, there are multiple leaderboards in the visit, and the top ten players on each list have to check it out, or they have to reach the same number of visits to claim the rewards",
		targetArg = 30,
		targetType = 11,
		type = 2,
		attrType1 = 9,
		medalID = 11,
		desc = "In the home, visit 30 cabins of different players every day for a total of 30 days",
		medalName = "Social cattle",
		sort = 1,
		showShadow = 1,
		attrNum2 = "280",
		attrType2 = 10,
		res = "city/medal/icon/medal_12.png",
		id = 1081,
		attrNum1 = "280",
		award = slot3[1081],
		targetArgSpecial = {
			__size = 1,
			roleNum = 30
		}
	},
	[1091] = {
		showShadow = 1,
		targetType = 12,
		targetArg = 150,
		type = 3,
		attrType1 = 1,
		medalID = 12,
		desc = "Home - Party, a total of 150 interactions (atmosphere group, meme or barrage sending) within the party",
		medalName = "The strongest group",
		res = "city/medal/icon/medal_2.png",
		id = 1091,
		attrNum1 = "960",
		sort = 1,
		award = slot3[1091]
	},
	[1101] = {
		showShadow = 1,
		attrNum2 = "420",
		targetArg = 150,
		targetType = 13,
		attrType1 = 7,
		medalID = 13,
		desc = "A total of 150 days of wishes have been made in the Union -wishing center",
		type = 1,
		res = "city/medal/icon/medal_17.png",
		attrType2 = 8,
		medalName = "As I please",
		id = 1101,
		attrNum1 = "420",
		sort = 1,
		award = {
			[59002.0] = 5,
			gold = 1000000,
			__size = 2
		}
	},
	[1111] = {
		showShadow = 1,
		targetType = 14,
		targetArg = 5,
		type = 3,
		attrType1 = 1,
		medalID = 14,
		desc = "As an old player, participate in the reunion event and bind the returning player missions up to 5 times",
		medalName = "Old tool man",
		res = "city/medal/icon/medal_11.png",
		id = 1111,
		attrNum1 = "960",
		sort = 1,
		award = {
			gold = 1000000,
			rmb = 100,
			__size = 2
		}
	},
	[1121] = {
		hidedesc = "Although the building to be upgraded has no function, it occupies the C position of the home layout and is closely related to other buildings",
		medalID = 16,
		targetType = 16,
		type = 2,
		targetArg = 10,
		attrType1 = 9,
		desc = "Home - The city center has a building rating of 10",
		medalName = "Infrastructure enthusiasts",
		sort = 1,
		showShadow = 1,
		attrNum2 = "240",
		attrType2 = 10,
		res = "city/medal/icon/medal_10.png",
		id = 1121,
		attrNum1 = "240",
		award = slot3[1121],
		targetArgSpecial = {
			buildingID = 1,
			__size = 1
		},
		pos = slot1[1121]
	},
	[1131] = {
		hidedesc = "The love of the elves is piled up with delicious and shiny jewelry, let me see how popular you are",
		targetArg = 20,
		targetType = 18,
		type = 2,
		attrType1 = 7,
		medalID = 18,
		desc = "Own 20 Pokémons with a friendship level of at least 500",
		medalName = "Everyone loves me!",
		sort = 1,
		showShadow = 0.5,
		attrNum2 = "420",
		attrType2 = 8,
		res = "city/medal/icon/medal_3.png",
		id = 1131,
		attrNum1 = "420",
		award = slot3[1131],
		targetArgSpecial = slot2[1131]
	},
	[1132] = {
		hidedesc = "The love of the elves is piled up with delicious and shiny jewelry, let me see how popular you are",
		targetArg = 50,
		targetType = 18,
		type = 2,
		attrType1 = 9,
		medalID = 18,
		desc = "Own 50 Pokémons with a friendship level of at least 500",
		medalName = "Everyone loves me!",
		sort = 2,
		showShadow = 1,
		attrNum2 = "320",
		attrType2 = 10,
		res = "city/medal/icon/medal_3.png",
		id = 1132,
		attrNum1 = "320",
		award = {
			__size = 2,
			rmb = 100,
			[502.0] = 10
		},
		targetArgSpecial = slot2[1132]
	},
	[1141] = {
		showShadow = 1,
		targetTextShow = -1,
		targetArg = 1,
		targetType = 19,
		attrType1 = 1,
		medalID = 19,
		desc = "Reached No. 1 in the regular Union Pokémon Quizzes",
		type = 1,
		res = "city/medal/icon/medal_19.png",
		medalName = "I'm a genius!",
		id = 1141,
		attrNum1 = "1120",
		sort = 1,
		award = slot3[1141]
	},
	[1151] = {
		showShadow = 1,
		attrNum2 = "420",
		targetArg = 1,
		desc = "Won No. 1 in regular fishing contests",
		attrType1 = 7,
		medalID = 20,
		targetTextShow = -1,
		targetType = 20,
		res = "city/medal/icon/medal_24.png",
		attrType2 = 8,
		type = 1,
		id = 1151,
		medalName = "Senior angler",
		attrNum1 = "420",
		sort = 1,
		award = slot3[1151]
	},
	[1161] = {
		showShadow = 1,
		attrNum2 = "320",
		targetArg = 3,
		desc = "Ranked in the top 3 (including 3rd place) in the final  regular Cross-Server Indigo Plateau Conference competition.",
		attrType1 = 9,
		medalID = 21,
		targetTextShow = -1,
		targetType = 21,
		res = "city/medal/icon/medal_35.png",
		attrType2 = 10,
		type = 1,
		id = 1161,
		medalName = "King · Cross-server Indigo Plateau",
		attrNum1 = "320",
		sort = 1,
		award = slot3[1161]
	},
	[1171] = {
		showShadow = 1,
		targetTextShow = -1,
		targetArg = 10,
		targetType = 22,
		attrType1 = 1,
		medalID = 22,
		desc = "Ranked in the top 10 (including 10th place) in the final any mode in the regular PvP Arena competition.",
		type = 1,
		res = "city/medal/icon/medal_34.png",
		medalName = "King · Match",
		id = 1171,
		attrNum1 = "1280",
		sort = 1,
		award = slot3[1171]
	},
	[1181] = {
		showShadow = 1,
		attrNum2 = "480",
		targetArg = 3,
		desc = "Ranked in the top 3 (including 3rd place) in the regular Cross-Server Bussiness Street competition.",
		attrType1 = 7,
		medalID = 23,
		targetTextShow = -1,
		targetType = 23,
		res = "city/medal/icon/medal_36.png",
		attrType2 = 8,
		type = 1,
		id = 1181,
		medalName = "King · Business Street",
		attrNum1 = "480",
		sort = 1,
		award = slot3[1181]
	},
	[1191] = {
		showShadow = 1,
		attrNum2 = "320",
		targetArg = 12,
		desc = "Ranked in the top 12 (including 12th place) in the final World Championship.",
		attrType1 = 9,
		medalID = 24,
		targetTextShow = -1,
		targetType = 24,
		res = "city/medal/icon/medal_37.png",
		attrType2 = 10,
		type = 1,
		id = 1191,
		medalName = "King · World Championship",
		attrNum1 = "320",
		sort = 1,
		award = slot3[1191]
	},
	[1201] = {
		showShadow = 1,
		targetTextShow = -1,
		targetArg = 10,
		targetType = 25,
		attrType1 = 1,
		medalID = 25,
		desc = "Ranked in the top 10 (including 10th place) in the the regular Cross-Server Arena competition.",
		type = 1,
		res = "city/medal/icon/medal_38.png",
		medalName = "King · Cross-server Arena",
		id = 1201,
		attrNum1 = "1280",
		sort = 1,
		award = slot3[1201]
	},
	[1211] = {
		showShadow = 1,
		attrNum2 = "480",
		targetArg = 290000,
		targetType = 26,
		attrType1 = 7,
		medalID = 26,
		desc = "Blessing attribute cultivation in a single event in Cross-server Mall costs 290,000 Resource Coins",
		type = 3,
		res = "city/medal/icon/medal_33.png",
		attrType2 = 8,
		medalName = "Single-handedly",
		id = 1211,
		attrNum1 = "480",
		sort = 1,
		award = {
			gold = 1000000,
			__size = 2,
			coin13 = 50000
		}
	},
	[1221] = {
		showShadow = 0.5,
		attrNum2 = "280",
		targetArg = 8,
		targetType = 27,
		attrType1 = 9,
		medalID = 27,
		desc = "Won 8 consecutive battles in any mode during a single season of the PvP Arena competition.",
		type = 1,
		res = "city/medal/icon/medal_23.png",
		attrType2 = 10,
		id = 1221,
		medalName = "Always wins and always cools",
		attrNum1 = "280",
		sort = 1,
		award = slot3[1221],
		pos = slot1[1221]
	},
	[1222] = {
		showShadow = 1,
		targetType = 27,
		targetArg = 16,
		type = 1,
		attrType1 = 1,
		medalID = 27,
		desc = "Won 16 consecutive battles in any mode during a single season of the PvP Arena competition.",
		res = "city/medal/icon/medal_23.png",
		medalName = "Always wins and always cools",
		id = 1222,
		attrNum1 = "1120",
		sort = 2,
		award = slot3[1222],
		pos = slot1[1222]
	},
	[1231] = {
		medalID = 28,
		targetArg = 50,
		targetType = 28,
		type = 3,
		attrType1 = 9,
		desc = "Won 50 battles using Zapdos in Fair Mode of the PvP Arena competition (cumulative, not limited to a single season).",
		medalName = "Lightning! Thundering!!",
		sort = 1,
		showShadow = 1,
		attrNum2 = "240",
		attrType2 = 10,
		res = "city/medal/icon/medal_5.png",
		id = 1231,
		attrNum1 = "240",
		award = slot3[1231],
		targetArgSpecial = {
			__size = 1,
			cardMarkIDs = {
				3201
			}
		},
		pos = {
			__size = 2,
			x = 5,
			y = -15
		}
	},
	[1241] = {
		showShadow = 1,
		targetType = 28,
		targetArg = 30,
		type = 1,
		attrType1 = 1,
		medalID = 29,
		desc = "Won 30 battles while using Moltres, Zapdos, and Articuno simultaneously in Fair Mode of the PvP Arena competition (cumulative, not limited to a single season).",
		res = "city/medal/icon/medal_14.png",
		medalName = "The Legendary Birds !",
		id = 1241,
		attrNum1 = "960",
		sort = 1,
		award = slot3[1241],
		targetArgSpecial = {
			__size = 1,
			cardMarkIDs = {
				721,
				731,
				741
			}
		},
		pos = {
			__size = 2,
			x = -5,
			y = -5
		}
	},
	[1251] = {
		medalID = 31,
		targetArg = 30,
		targetType = 28,
		type = 1,
		attrType1 = 9,
		desc = "Won 30 battles while using Regice, Registeel, and Regirock simultaneously in Fair Mode of the PvP Arena competition (cumulative, not limited to a single season).",
		medalName = "The Legendary Titans!",
		sort = 1,
		showShadow = 1,
		attrNum2 = "240",
		attrType2 = 10,
		res = "city/medal/icon/medal_16.png",
		id = 1251,
		attrNum1 = "240",
		award = slot3[1251],
		targetArgSpecial = {
			__size = 1,
			cardMarkIDs = {
				1911,
				1921,
				1931
			}
		},
		pos = {
			__size = 2,
			x = -5,
			y = -7
		}
	},
	[1261] = {
		showShadow = 1,
		targetType = 28,
		targetArg = 50,
		type = 1,
		attrType1 = 1,
		medalID = 32,
		desc = "Won 50 battles using Lucario in Fair Mode of the PvP Arena competition (cumulative, not limited to a single season).",
		res = "city/medal/icon/medal_13.png",
		medalName = "Handsome! Lucario",
		id = 1261,
		attrNum1 = "960",
		sort = 1,
		award = slot3[1261],
		targetArgSpecial = {
			__size = 1,
			cardMarkIDs = {
				2241
			}
		},
		pos = {
			__size = 2,
			x = 0,
			y = 8
		}
	},
	[1271] = {
		showShadow = 1,
		attrNum2 = "360",
		targetArg = 10,
		targetType = 29,
		attrType1 = 7,
		medalID = 33,
		desc = "Grabbed 10 boss kills in Cross-server Mall (cumulatively, not a single season)",
		type = 1,
		res = "city/medal/icon/medal_20.png",
		attrType2 = 8,
		id = 1271,
		medalName = "Only fast is not broken",
		attrNum1 = "360",
		sort = 1,
		award = {
			gold = 1000000,
			__size = 2,
			coin13 = 100000
		},
		pos = {
			__size = 2,
			x = 35,
			y = 0
		}
	},
	[1281] = {
		desc = "Pokémon with 12 stars at the same time: Meow, Ekans, Koffing, Victreebel, Mareanie, Mimic Q",
		targetArg = 12,
		targetType = 41,
		type = 1,
		attrType1 = 7,
		medalID = 43,
		targetTextShow = 6,
		medalName = "Team Rocket Star Group",
		sort = 1,
		showShadow = 1,
		attrNum2 = "480",
		attrType2 = 8,
		res = "city/medal/icon/medal_7.png",
		id = 1281,
		attrNum1 = "480",
		award = slot3[1281],
		targetArgSpecial = {
			__size = 1,
			cardMarkIDs = {
				211,
				81,
				481,
				281,
				3771,
				3961
			}
		}
	},
	[1291] = {
		medalID = 44,
		desc = "Pokémon with 8 stars at the same time: Ash's Greninja, Lucario, Mimic Q, Charizard, Garchomp, Rayquaza, Metagross, Gengar",
		targetType = 41,
		type = 1,
		targetArg = 8,
		attrType1 = 9,
		targetTextShow = 8,
		medalName = "Vote for the popularity king",
		sort = 1,
		showShadow = 1,
		attrNum2 = "240",
		attrType2 = 10,
		res = "city/medal/icon/medal_32.png",
		id = 1291,
		attrNum1 = "240",
		award = slot3[1291],
		targetArgSpecial = {
			__size = 1,
			cardMarkIDs = {
				7011,
				2241,
				3961,
				11,
				2231,
				1981,
				1391,
				391
			}
		},
		pos = slot1[1291]
	},
	[1301] = {
		showShadow = 1,
		attrNum2 = "280",
		targetArg = 48,
		targetType = 35,
		attrType1 = 9,
		medalID = 49,
		desc = "Obtain 48 avatars",
		type = 3,
		res = "city/medal/icon/medal_31.png",
		attrType2 = 10,
		id = 1301,
		medalName = "Versatile trainer",
		attrNum1 = "280",
		sort = 1,
		award = slot3[1301],
		pos = {
			__size = 2,
			x = 0,
			y = 5
		}
	},
	[1311] = {
		showShadow = 1,
		targetType = 36,
		targetArg = 100,
		type = 3,
		attrType1 = 1,
		medalID = 50,
		desc = "Obtain 100 avatar frames",
		medalName = "A hundred persons are needed",
		res = "city/medal/icon/medal_30.png",
		id = 1311,
		attrNum1 = "1120",
		sort = 1,
		award = slot3[1311]
	},
	[1321] = {
		hidedesc = "Remember the classic original Gosanjia? Go to Elite Dungeon to practice them! As for the mission... Naturally, you have to watch them win dozens of times before you can give you the medal",
		medalID = 51,
		targetType = 37,
		type = 2,
		targetArg = 30,
		attrType1 = 7,
		desc = "In the Elite Dungeon, use Squirtle, Charmander, and Bulbasaur to win battles 30 times at the same time",
		medalName = "The 1st partner Pokémon",
		sort = 1,
		showShadow = 1,
		attrNum2 = "360",
		attrType2 = 8,
		res = "city/medal/icon/medal_27.png",
		id = 1321,
		attrNum1 = "360",
		award = slot3[1321],
		targetArgSpecial = {
			__size = 1,
			cardMarkIDs = {
				21,
				11,
				1
			}
		},
		pos = slot1[1321]
	},
	[1331] = {
		hidedesc = "How the second generation of the royal family performs in the difficult dungeon, I also want to see it~ The task is very conscientious, and the same requirements as the first generation are enough!",
		medalID = 52,
		targetType = 37,
		type = 2,
		targetArg = 30,
		attrType1 = 9,
		desc = "In the Elite Dungeon, use Chikorita, Cyndaquil, and Totodile to win 30 battles at the same time",
		medalName = "The 2nd partner Pokémon",
		sort = 1,
		showShadow = 1,
		attrNum2 = "240",
		attrType2 = 10,
		res = "city/medal/icon/medal_28.png",
		id = 1331,
		attrNum1 = "240",
		award = slot3[1331],
		targetArgSpecial = {
			__size = 1,
			cardMarkIDs = {
				781,
				791,
				801
			}
		},
		pos = slot1[1331]
	},
	[1341] = {
		showShadow = 1,
		hidedesc = "Three generations of royal families, difficult dungeons... You know, well, you should know which 3 Pokémons, right?",
		targetArg = 30,
		targetType = 37,
		attrType1 = 1,
		medalID = 53,
		desc = "In the Elite Dungeon, use Treecko, Torchic, and Mudkip to fight 30 times at the same time",
		type = 2,
		res = "city/medal/icon/medal_29.png",
		medalName = "The 3rd partner Pokémon",
		id = 1341,
		attrNum1 = "960",
		sort = 1,
		award = slot3[1341],
		targetArgSpecial = {
			__size = 1,
			cardMarkIDs = {
				1291,
				1301,
				1311
			}
		}
	},
	[1351] = {
		showShadow = 1,
		targetType = 40,
		targetArg = 5,
		type = 1,
		attrType1 = 1,
		medalID = 56,
		desc = "Clear the level 5 times without losing any Pokémon on the normal route in the Adventure-Safari Zone (no resurrection rescue is allowed)",
		res = "city/medal/icon/medal_25.png",
		medalName = "No one less",
		id = 1351,
		attrNum1 = "960",
		sort = 1,
		award = slot3[1351],
		pos = slot1[1351]
	},
	[1361] = {
		showShadow = 1,
		attrNum2 = "360",
		targetArg = 5,
		targetType = 42,
		attrType1 = 7,
		medalID = 57,
		desc = "Clear 5 levels without losing any Pokémon on the advanced route in the Adventure-Safari Zone (no resurrection rescue will be allowed)",
		type = 1,
		res = "city/medal/icon/medal_26.png",
		attrType2 = 8,
		id = 1361,
		medalName = "The danger cannot be less!",
		attrNum1 = "360",
		sort = 1,
		award = slot3[1361],
		pos = slot1[1361]
	},
	[1371] = {
		showShadow = 1,
		targetType = 43,
		targetArg = 2,
		type = 1,
		attrType1 = 1,
		medalID = 58,
		desc = "In the home-party, the game participated in the party has won the highest evaluation of Spot on  a total of 2 times",
		res = "city/medal/icon/medal_52.png",
		medalName = "The dart god",
		id = 1371,
		attrNum1 = "960",
		sort = 1,
		award = slot3[1371],
		pos = {
			__size = 2,
			x = 0,
			y = -7
		}
	},
	__default = {
		__index = {
			attrType2 = 0,
			hidedesc = "",
			targetType = 0,
			type = 0,
			targetTextShow = 0,
			attrType1 = 0,
			medalID = 0,
			desc = "",
			targetArg = 0,
			attrType3 = 0,
			attrNum3 = "",
			medalName = "",
			sort = 0,
			showShadow = 0.1,
			attrNum2 = "",
			res = "",
			attrNum1 = "",
			award = slot3.default,
			targetArgSpecial = slot2.default,
			languages = {
				"cn",
				"br",
				"en",
				"vn",
				"th",
				"kr",
				"id"
			},
			pos = {
				__size = 2,
				x = 0,
				y = 0
			}
		}
	}
}

return csv.medal
