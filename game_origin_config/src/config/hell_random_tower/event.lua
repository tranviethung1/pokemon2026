slot0 = {
	{
		__size = 0
	},
	__size = 13,
	[8] = {
		__size = 1,
		buff = {
			214
		}
	},
	[11] = {
		__size = 1,
		buff = {
			201
		}
	},
	[17] = {
		__size = 1,
		buff = {
			2
		}
	},
	[18] = {
		fight = 10001,
		__size = 1
	},
	[19] = {
		fight = 10002,
		__size = 1
	},
	[20] = {
		fight = 10003,
		__size = 1
	},
	[21] = {
		fight = 10004,
		__size = 1
	},
	[22] = {
		fight = 10005,
		__size = 1
	},
	[23] = {
		fight = 10006,
		__size = 1
	},
	[24] = {
		__size = 1,
		items = {
			gold = 10000,
			__size = 1
		}
	},
	[26] = {
		__size = 1,
		buff = {
			212,
			213
		}
	},
	[27] = {
		__size = 1,
		buff = {
			200,
			211
		}
	}
}
slot2 = {
	[10] = slot0[8],
	[3003] = slot0[21],
	[14] = slot0[11],
	default = slot0[1],
	[2003] = slot0[26],
	[2006] = slot0[27],
	[2007] = slot0[26],
	[2004] = slot0[8],
	[2005] = slot0[27],
	[9] = slot0[8],
	[8] = slot0[8],
	[1013] = slot0[21]
}
slot3 = {
	[11] = slot0[11],
	[10] = slot0[11],
	[3003] = slot0[20],
	[2002] = slot0[24],
	[3001] = slot0[18],
	[16] = slot0[17],
	[3002] = slot0[19],
	[3004] = slot0[22],
	[3005] = slot0[23],
	default = slot0[1],
	[2003] = slot0[24],
	[2001] = slot0[24],
	[2006] = slot0[8],
	[7] = slot0[8],
	[2005] = slot0[8],
	[1014] = slot0[22],
	[1015] = slot0[23],
	[2009] = slot0[17],
	[1011] = slot0[18],
	[1012] = slot0[19],
	[1013] = slot0[20]
}
csv.hell_random_tower.event = {
	{
		choice1 = "404",
		name = "404",
		group = 11,
		id = 1,
		limit = 2,
		desc = "404",
		result1 = {
			__size = 1,
			buff = {
				200
			}
		}
	},
	{
		choice1 = "404",
		name = "404",
		group = 12,
		id = 2,
		limit = 1,
		desc = "404",
		result1 = {
			__size = 1,
			buff = {
				1021
			}
		}
	},
	{
		choice1 = "404",
		name = "404",
		group = 13,
		id = 3,
		limit = 1,
		desc = "404",
		result1 = {
			__size = 1,
			buff = {
				201,
				1022
			}
		}
	},
	{
		id = 4,
		name = "404",
		limit = 2,
		group = 21
	},
	{
		id = 5,
		name = "404",
		group = 22,
		limit = 1,
		result1 = {
			__size = 1,
			buff = {
				200,
				1121
			}
		}
	},
	{
		id = 6,
		name = "404",
		group = 23,
		limit = 1,
		result1 = {
			__size = 1,
			buff = {
				201,
				1122
			}
		}
	},
	{
		id = 7,
		group = 31,
		limit = 2,
		result1 = slot3[7]
	},
	{
		id = 8,
		group = 32,
		limit = 1,
		result1 = {
			__size = 1,
			buff = {
				201,
				1221
			}
		},
		result2 = slot2[8]
	},
	{
		id = 9,
		group = 33,
		limit = 1,
		result1 = {
			__size = 1,
			buff = {
				202,
				1221
			}
		},
		result2 = slot2[9]
	},
	{
		id = 10,
		group = 41,
		limit = 2,
		result1 = slot3[10],
		result2 = slot2[10]
	},
	{
		id = 11,
		group = 42,
		limit = 1,
		result1 = slot3[11],
		result2 = {
			__size = 1,
			buff = {
				1321
			}
		}
	},
	{
		group = 43,
		id = 12,
		limit = 1,
		result2 = {
			__size = 1,
			buff = {
				201,
				1321
			}
		}
	},
	{
		id = 13,
		group = 51,
		limit = 2,
		result1 = {
			__size = 1,
			buff = {
				1421
			}
		}
	},
	{
		group = 52,
		id = 14,
		limit = 1,
		result2 = slot2[14]
	},
	{
		id = 15,
		group = 53,
		limit = 1,
		result1 = {
			__size = 1,
			buff = {
				202
			}
		},
		result2 = {
			__size = 1,
			buff = {
				1422
			}
		}
	},
	{
		id = 16,
		group = 99,
		result1 = slot3[16]
	},
	__size = 36,
	[1011] = {
		id = 1011,
		group = 11,
		result1 = slot3[1011]
	},
	[1012] = {
		id = 1012,
		group = 21,
		result1 = slot3[1012]
	},
	[1013] = {
		id = 1013,
		group = 31,
		result1 = slot3[1013],
		result2 = slot2[1013]
	},
	[1014] = {
		id = 1014,
		group = 41,
		result1 = slot3[1014]
	},
	[1015] = {
		id = 1015,
		group = 51,
		result1 = slot3[1015]
	},
	[2001] = {
		id = 2001,
		result1 = slot3[2001]
	},
	[2002] = {
		id = 2002,
		result1 = slot3[2002],
		result2 = {
			__size = 1,
			items = {
				gold = 20000,
				__size = 1
			}
		}
	},
	[2003] = {
		choice2 = "Hide",
		resultDesc1 = "Snorlax continues to fall asleep, a treasure chest seems to be placed behind him",
		id = 2003,
		choice1 = "Console him",
		resultDesc2 = "Snorlax is raging, it gives out a loud roar that frightens you. P.ATK and SP.ATK is reduced by 10%, the rage points of the Pokémons on the battlefield reduce as well.",
		desc = "You accidentally awakened the sleeping Snorlax",
		result1 = slot3[2003],
		result2 = slot2[2003]
	},
	[2004] = {
		group = 2,
		id = 2004,
		result2 = slot2[2004]
	},
	[2005] = {
		resultDesc3 = "You've escaped from Jigglypuff's power",
		name = "Jigglypuff's Song",
		group = 2,
		resultDesc1 = "You fell asleep soundly and got enough rest. HP of Pokémons recovers by 20%",
		resultDesc2 = "Jigglypuff is very angry and used Double Slap. HP of all battling Pokémons reduces but gained rage value",
		desc = "Saw a Jigglypuff getting ready to sing",
		choice2 = "Stop it",
		choice1 = "Listen to it singing",
		id = 2005,
		choice3 = "Run away",
		result1 = slot3[2005],
		result2 = slot2[2005]
	},
	[2006] = {
		resultDesc3 = "But it was too late to flee, the allied Pokémons are affected by Jigglypuff and their HP recovery rate and rage level have reduced",
		name = "Jigglypuff's Song",
		group = 2,
		resultDesc1 = "You fell asleep soundly and got enough rest. HP of Pokémons recovers by 20%",
		resultDesc2 = "Jigglypuff is very angry and used Double Slap. HP of all battling Pokémons reduces but gained rage value",
		desc = "Saw a Jigglypuff getting ready to sing",
		choice2 = "Stop it",
		choice1 = "Listen to it singing",
		id = 2006,
		choice3 = "Run away",
		result1 = slot3[2006],
		result3 = {
			__size = 1,
			buff = {
				214,
				203
			}
		},
		result2 = slot2[2006]
	},
	[2007] = {
		choice2 = "Wake it up",
		group = 3,
		choice1 = "Wake it up",
		id = 2007,
		resultDesc1 = "Slaking left unwillingly",
		resultDesc2 = "Slaking makes a counterattack, reducing the attack bonus of all Pokémons by 5%",
		desc = "A giant Slaking has blocked their path, it seems to be sleeping soundly",
		result2 = slot2[2007]
	},
	[2008] = {
		resultDesc1 = "Slaking wakes up and gives you a smooch. You receive his blessings - All enemies are silenced for 1 turn at the beginning of the next battle",
		group = 4,
		resultDesc2 = "Slaking ran away as it is afraid of pain, but there seemed to be a bunch of strange items underneath it.",
		desc = "A giant Slaking has blocked their path, it seems to be sleeping soundly",
		choice2 = "Wake it up",
		choice1 = "Wake it up",
		id = 2008,
		result1 = {
			__size = 1,
			buff = {
				301
			}
		},
		result2 = {
			__size = 1,
			items = {
				gold = 15000,
				__size = 1
			}
		}
	},
	[2009] = {
		id = 2009,
		group = 4,
		result1 = slot3[2009]
	},
	[3001] = {
		id = 3001,
		group = 6,
		result1 = slot3[3001]
	},
	[3002] = {
		id = 3002,
		group = 6,
		result1 = slot3[3002]
	},
	[3003] = {
		id = 3003,
		group = 6,
		result1 = slot3[3003],
		result2 = slot2[3003]
	},
	[3004] = {
		id = 3004,
		group = 6,
		result1 = slot3[3004]
	},
	[3005] = {
		id = 3005,
		group = 6,
		result1 = slot3[3005]
	},
	[3006] = {
		id = 3006,
		group = 6,
		result1 = {
			fight = 10007,
			__size = 1
		}
	},
	__default = {
		__index = {
			onlyOne = false,
			name = "",
			choice2 = "",
			resultDesc1 = "",
			resultDesc2 = "",
			desc = "",
			res = "",
			choice1 = "",
			resultDesc3 = "",
			limit = 999,
			group = 1,
			choice3 = "",
			result1 = slot3.default,
			battleOptions = {},
			result3 = ({
				default = slot0[1]
			}).default,
			result2 = slot2.default
		}
	}
}

return csv.hell_random_tower.event
