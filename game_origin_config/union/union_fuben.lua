slot0 = {
	{
		__size = 0
	},
	__size = 9,
	[3] = {
		gold = 100000,
		[951.0] = 1,
		[932.0] = 10,
		__size = 3
	},
	[4] = {
		coin3 = 50,
		[5000.0] = 2,
		[900.0] = 3,
		__size = 4,
		gold = 10000
	},
	[5] = {
		gold = 100000,
		rmb = 100,
		__size = 2
	},
	[15] = {
		gold = 120000,
		[951.0] = 1,
		[932.0] = 15,
		__size = 3
	},
	[43] = {
		[5000.0] = 90,
		[501.0] = 1,
		[932.0] = 90,
		__size = 3
	},
	[52] = {
		[5000.0] = 110,
		[501.0] = 1,
		[932.0] = 110,
		__size = 3
	},
	[77] = {
		coin3 = 50,
		gold = 10000,
		[900.0] = 3,
		__size = 4,
		[5000.0] = 2
	},
	[78] = {
		gold = 100000,
		rmb = 100,
		__size = 2
	}
}
slot1 = {
	default = slot0[1],
	[25] = slot0[43],
	[30] = slot0[52],
	[28] = slot0[52],
	[23] = slot0[43]
}
slot2 = {
	slot0[3],
	slot0[3],
	default = slot0[1],
	[3] = slot0[3],
	[5] = slot0[3],
	[4] = slot0[3],
	[9] = slot0[15],
	[8] = slot0[15]
}
slot3 = {
	slot0[5],
	slot0[5],
	[54] = slot0[78],
	[42] = slot0[78],
	[48] = slot0[78],
	[43] = slot0[78],
	default = slot0[1],
	[49] = slot0[78],
	[52] = slot0[78],
	[53] = slot0[78],
	[24] = slot0[5],
	[25] = slot0[5],
	[26] = slot0[5],
	[27] = slot0[5],
	[20] = slot0[5],
	[21] = slot0[5],
	[22] = slot0[5],
	[23] = slot0[5],
	[46] = slot0[78],
	[47] = slot0[78],
	[44] = slot0[78],
	[45] = slot0[78],
	[28] = slot0[5],
	[29] = slot0[5],
	[40] = slot0[78],
	[41] = slot0[78],
	[3] = slot0[5],
	[5] = slot0[5],
	[4] = slot0[5],
	[7] = slot0[5],
	[6] = slot0[5],
	[9] = slot0[5],
	[8] = slot0[5],
	[51] = slot0[78],
	[39] = slot0[5],
	[38] = slot0[5],
	[11] = slot0[5],
	[10] = slot0[5],
	[13] = slot0[5],
	[12] = slot0[5],
	[15] = slot0[5],
	[14] = slot0[5],
	[17] = slot0[5],
	[16] = slot0[5],
	[19] = slot0[5],
	[18] = slot0[5],
	[31] = slot0[5],
	[30] = slot0[5],
	[37] = slot0[5],
	[36] = slot0[5],
	[35] = slot0[5],
	[34] = slot0[5],
	[33] = slot0[5],
	[55] = slot0[78],
	[32] = slot0[5],
	[50] = slot0[78]
}
slot4 = {
	slot0[4],
	slot0[4],
	[54] = slot0[77],
	[42] = slot0[77],
	[48] = slot0[77],
	[43] = slot0[77],
	default = slot0[1],
	[49] = slot0[77],
	[52] = slot0[77],
	[53] = slot0[77],
	[24] = slot0[4],
	[25] = slot0[4],
	[26] = slot0[4],
	[27] = slot0[4],
	[20] = slot0[4],
	[21] = slot0[4],
	[22] = slot0[4],
	[23] = slot0[4],
	[46] = slot0[77],
	[47] = slot0[77],
	[44] = slot0[77],
	[45] = slot0[77],
	[28] = slot0[4],
	[29] = slot0[4],
	[40] = slot0[77],
	[41] = slot0[77],
	[3] = slot0[4],
	[5] = slot0[4],
	[4] = slot0[4],
	[7] = slot0[4],
	[6] = slot0[4],
	[9] = slot0[4],
	[8] = slot0[4],
	[51] = slot0[77],
	[39] = slot0[4],
	[38] = slot0[4],
	[11] = slot0[4],
	[10] = slot0[4],
	[13] = slot0[4],
	[12] = slot0[4],
	[15] = slot0[4],
	[14] = slot0[4],
	[17] = slot0[4],
	[16] = slot0[4],
	[19] = slot0[4],
	[18] = slot0[4],
	[31] = slot0[4],
	[30] = slot0[4],
	[37] = slot0[4],
	[36] = slot0[4],
	[35] = slot0[4],
	[34] = slot0[4],
	[33] = slot0[4],
	[55] = slot0[77],
	[32] = slot0[4],
	[50] = slot0[77]
}
csv.union.union_fuben = {
	{
		gateID = 1000,
		name = "Venusaur",
		name_en = "Venusaur",
		name_vn = "Venusaur",
		desc_th = "Venusaur ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Venusaur seems to have gotten more powerful",
		desc = "Venusaur seems to have gotten more powerful",
		name_th = "Venusaur",
		id = 1,
		desc_vn = "Venusaur parece ter ficado mais forte",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 20,
			[932.0] = 20,
			__size = 3
		},
		repeatAward = slot2[1],
		challengeAward = slot4[1],
		killAward = slot3[1]
	},
	{
		gateID = 1001,
		name = "Charizard",
		name_en = "Charizard",
		name_vn = "Charizard",
		desc_th = "Charizard ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Charizard seems to have gotten more powerful",
		desc = "Charizard seems to have gotten more powerful",
		name_th = "Charizard",
		id = 2,
		desc_vn = "Charizard parece ter ficado mais forte",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 20,
			[932.0] = 20,
			__size = 3
		},
		repeatAward = slot2[2],
		challengeAward = slot4[2],
		killAward = slot3[2]
	},
	{
		gateID = 1002,
		name = "Blastoise",
		name_en = "Blastoise",
		name_vn = "Blastoise",
		desc_th = "Blastoise ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Blastoise seems to have gotten more powerful",
		desc = "Blastoise seems to have gotten more powerful",
		name_th = "Blastoise",
		id = 3,
		desc_vn = "Blastoise parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 25,
			__size = 3,
			[932.0] = 25,
			[502.0] = 1
		},
		repeatAward = slot2[3],
		challengeAward = slot4[3],
		killAward = slot3[3]
	},
	{
		gateID = 1003,
		name = "Alakazam",
		name_en = "Alakazam",
		name_vn = "Alakazam",
		desc_th = "Alakazam ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Alakazam seems to have gotten more powerful",
		desc = "Alakazam seems to have gotten more powerful",
		name_th = "Alakazam",
		id = 4,
		desc_vn = "Alakazam parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 25,
			rmb = 100,
			[932.0] = 25,
			__size = 3
		},
		repeatAward = slot2[4],
		challengeAward = slot4[4],
		killAward = slot3[4]
	},
	{
		gateID = 1004,
		name = "Delphox",
		name_en = "Delphox",
		name_vn = "Delphox",
		desc_th = "Delphox ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Delphox seems to have gotten more powerful",
		desc = "Delphox seems to have gotten more powerful",
		name_th = "Delphox",
		id = 5,
		desc_vn = "Delphox parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 30,
			[501.0] = 1,
			[932.0] = 30,
			__size = 3
		},
		repeatAward = slot2[5],
		challengeAward = slot4[5],
		killAward = slot3[5]
	},
	{
		gateID = 1005,
		name = "Greninja",
		name_en = "Greninja",
		name_vn = "Greninja",
		desc_th = "Greninja ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Greninja seems to have gotten more powerful",
		desc = "Greninja seems to have gotten more powerful",
		name_th = "Greninja",
		id = 6,
		desc_vn = "Greninja parece ter ficado mais forte",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 30,
			[932.0] = 30,
			__size = 3
		},
		repeatAward = {
			gold = 110000,
			[951.0] = 1,
			[932.0] = 10,
			__size = 3
		},
		challengeAward = slot4[6],
		killAward = slot3[6]
	},
	{
		gateID = 1006,
		name = "Electivire",
		name_en = "Electivire",
		name_vn = "Electivire",
		desc_th = "Electivir ดูเหมือนจะมีพลังมากขึ้น",
		desc_en = "Electivire seems to have gotten more powerful",
		desc = "Electivire seems to have gotten more powerful",
		name_th = "Electivire",
		id = 7,
		desc_vn = "Electivire parece ter ficado mais forte",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 35,
			[932.0] = 35,
			__size = 3
		},
		repeatAward = {
			gold = 110000,
			[951.0] = 1,
			[932.0] = 15,
			__size = 3
		},
		challengeAward = slot4[7],
		killAward = slot3[7]
	},
	{
		gateID = 1007,
		name = "Gengar",
		name_en = "Gengar",
		name_vn = "Gengar",
		desc_th = "Gengar ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Gengar seems to have gotten more powerful",
		desc = "Gengar seems to have gotten more powerful",
		name_th = "Gengar",
		id = 8,
		desc_vn = "Gengar parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 35,
			__size = 3,
			[932.0] = 35,
			[502.0] = 1
		},
		repeatAward = slot2[8],
		challengeAward = slot4[8],
		killAward = slot3[8]
	},
	{
		gateID = 1008,
		name = "Gyarados",
		name_en = "Gyarados",
		name_vn = "Gyarados",
		desc_th = "Gyarados ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Gyarados seems to have gotten more powerful",
		desc = "Gyarados seems to have gotten more powerful",
		name_th = "Gyarados",
		id = 9,
		desc_vn = "Gyarados parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 40,
			rmb = 100,
			[932.0] = 40,
			__size = 3
		},
		repeatAward = slot2[9],
		challengeAward = slot4[9],
		killAward = slot3[9]
	},
	{
		gateID = 1009,
		name = "Dragonite",
		name_en = "Dragonite",
		name_vn = "Dragonite",
		desc_th = "Dragonite ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Dragonite seems to have gotten more powerful",
		desc = "Dragonite seems to have gotten more powerful",
		name_th = "Dragonite",
		id = 10,
		desc_vn = "Dragonite parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 40,
			[501.0] = 1,
			[932.0] = 40,
			__size = 3
		},
		repeatAward = {
			gold = 130000,
			[951.0] = 1,
			[932.0] = 15,
			__size = 3
		},
		challengeAward = slot4[10],
		killAward = slot3[10]
	},
	{
		gateID = 1010,
		name = "Articuno",
		name_en = "Articuno",
		name_vn = "Articuno",
		desc_th = "Articuno ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Articuno seems to have gotten more powerful",
		desc = "Articuno seems to have gotten more powerful",
		name_th = "Articuno",
		id = 11,
		desc_vn = "Articuno parece ter ficado mais forte",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 50,
			[932.0] = 50,
			__size = 3
		},
		repeatAward = {
			gold = 130000,
			[951.0] = 1,
			[932.0] = 20,
			__size = 3
		},
		challengeAward = slot4[11],
		killAward = slot3[11]
	},
	{
		gateID = 1011,
		name = "Zapdos",
		name_en = "Zapdos",
		name_vn = "Zapdos",
		desc_th = "Zapdos ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Zapdos seems to have gotten more powerful",
		desc = "Zapdos seems to have gotten more powerful",
		name_th = "Zapdos",
		id = 12,
		desc_vn = "Zapdos parece ter ficado mais forte",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 50,
			[932.0] = 50,
			__size = 3
		},
		repeatAward = {
			gold = 140000,
			[951.0] = 1,
			[932.0] = 20,
			__size = 3
		},
		challengeAward = slot4[12],
		killAward = slot3[12]
	},
	{
		gateID = 1012,
		name = "Moltres",
		name_en = "Moltres",
		name_vn = "Moltres",
		desc_th = "Moltres ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Moltres seems to have gotten more powerful",
		desc = "Moltres seems to have gotten more powerful",
		name_th = "Moltres",
		id = 13,
		desc_vn = "Moltres parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 50,
			__size = 3,
			[932.0] = 50,
			[502.0] = 1
		},
		repeatAward = {
			gold = 150000,
			[951.0] = 1,
			[932.0] = 20,
			__size = 3
		},
		challengeAward = slot4[13],
		killAward = slot3[13]
	},
	{
		gateID = 1013,
		name = "Sceptile",
		name_en = "Sceptile",
		name_vn = "Sceptile",
		desc_th = "Sceptile ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Sceptile seems to have gotten more powerful",
		desc = "Sceptile seems to have gotten more powerful",
		name_th = "Sceptile",
		id = 14,
		desc_vn = "Sceptile parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 60,
			rmb = 100,
			[932.0] = 60,
			__size = 3
		},
		repeatAward = {
			gold = 160000,
			[951.0] = 1,
			[932.0] = 20,
			__size = 3
		},
		challengeAward = slot4[14],
		killAward = slot3[14]
	},
	{
		gateID = 1014,
		name = "Slaking",
		name_en = "Slaking",
		name_vn = "Slaking",
		desc_th = "Slaking ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Slaking seems to have gotten more powerful",
		desc = "Slaking seems to have gotten more powerful",
		name_th = "Slaking",
		id = 15,
		desc_vn = "Slaking parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 60,
			[501.0] = 1,
			[932.0] = 60,
			__size = 3
		},
		repeatAward = {
			gold = 170000,
			[951.0] = 1,
			[932.0] = 25,
			__size = 3
		},
		challengeAward = slot4[15],
		killAward = slot3[15]
	},
	{
		gateID = 1015,
		name = "Emboar",
		name_en = "Emboar",
		name_vn = "Emboar",
		desc_th = "Emboar ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Emboar seems to have gotten more powerful",
		desc = "Emboar seems to have gotten more powerful",
		name_th = "Emboar",
		id = 16,
		desc_vn = "Emboar parece ter ficado mais forte",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 60,
			[932.0] = 60,
			__size = 3
		},
		repeatAward = {
			gold = 180000,
			[951.0] = 2,
			[932.0] = 25,
			__size = 3
		},
		challengeAward = slot4[16],
		killAward = slot3[16]
	},
	{
		gateID = 1016,
		name = "Raikou",
		name_en = "Raikou",
		name_vn = "Raikou",
		desc_th = "Raikou ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Raikou seems to have gotten more powerful",
		desc = "Raikou seems to have gotten more powerful",
		name_th = "Raikou",
		id = 17,
		desc_vn = "Raikou parece ter ficado mais forte",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 70,
			[932.0] = 70,
			__size = 3
		},
		repeatAward = {
			gold = 190000,
			[951.0] = 2,
			[932.0] = 25,
			__size = 3
		},
		challengeAward = slot4[17],
		killAward = slot3[17]
	},
	{
		gateID = 1017,
		name = "Entei",
		name_en = "Entei",
		name_vn = "Entei",
		desc_th = "Entei ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Entei seems to have gotten more powerful",
		desc = "Entei seems to have gotten more powerful",
		name_th = "Entei",
		id = 18,
		desc_vn = "Entei parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 70,
			[501.0] = 1,
			[932.0] = 70,
			__size = 3
		},
		repeatAward = {
			gold = 200000,
			[951.0] = 2,
			[932.0] = 25,
			__size = 3
		},
		challengeAward = slot4[18],
		killAward = slot3[18]
	},
	{
		gateID = 1018,
		name = "Suicune",
		name_en = "Suicune",
		name_vn = "Suicune",
		desc_th = "Suicune ดูเหมือนว่าจะแข็งแกร่งขึ้น",
		desc_en = "Suicune seems to have gotten more powerful",
		desc = "Suicune seems to have gotten more powerful",
		name_th = "Suicune",
		id = 19,
		desc_vn = "Suicune parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 70,
			rmb = 100,
			[932.0] = 70,
			__size = 3
		},
		repeatAward = {
			gold = 210000,
			[951.0] = 2,
			[932.0] = 30,
			__size = 3
		},
		challengeAward = slot4[19],
		killAward = slot3[19]
	},
	{
		gateID = 1019,
		name = "Mew",
		name_en = "Mew",
		name_vn = "Mew",
		desc_th = "ดูเหมือน Mew จะแข็งแกร่งขึ้น",
		desc_en = "Mew seems to have gotten more powerful",
		desc = "Mew seems to have gotten more powerful",
		name_th = "Mew",
		id = 20,
		desc_vn = "Mew parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 80,
			[501.0] = 1,
			[932.0] = 80,
			__size = 3
		},
		repeatAward = {
			gold = 220000,
			[951.0] = 2,
			[932.0] = 30,
			__size = 3
		},
		challengeAward = slot4[20],
		killAward = slot3[20]
	},
	{
		gateID = 1020,
		name = "Mewtwo",
		name_en = "Mewtwo",
		name_vn = "Mewtwo",
		desc_th = "มิวทูดูแข็งแกร่งขึ้น",
		desc_en = "Mewtwo seems to have gotten more powerful",
		desc = "Mewtwo seems to have gotten more powerful",
		name_th = "Mewtwo",
		id = 21,
		desc_vn = "Mewtwo parece ter ficado mais forte",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 80,
			[932.0] = 80,
			__size = 3
		},
		repeatAward = {
			gold = 230000,
			[951.0] = 2,
			[932.0] = 30,
			__size = 3
		},
		challengeAward = slot4[21],
		killAward = slot3[21]
	},
	{
		gateID = 1021,
		name = "Magnezone",
		name_en = "Magnezone",
		name_vn = "Magnezone",
		desc_th = "Magnezone ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Magnezone seems to have gotten more powerful",
		desc = "Magnezone seems to have gotten more powerful",
		name_th = "Magnezone",
		id = 22,
		desc_vn = "Magnezone parece ter ficado mais forte",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 80,
			[932.0] = 80,
			__size = 3
		},
		repeatAward = {
			gold = 240000,
			[951.0] = 2,
			[932.0] = 35,
			__size = 3
		},
		challengeAward = slot4[22],
		killAward = slot3[22]
	},
	{
		gateID = 1022,
		name = "Rhyperior",
		name_en = "Rhyperior",
		name_vn = "Rhyperior",
		desc_th = "Rhyperior ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Rhyperior seems to have gotten more powerful",
		desc = "Rhyperior seems to have gotten more powerful",
		name_th = "Rhyperior",
		id = 23,
		desc_vn = "Rhyperior parece ter ficado mais forte",
		firstAward = slot1[23],
		repeatAward = {
			gold = 250000,
			[951.0] = 2,
			[932.0] = 35,
			__size = 3
		},
		challengeAward = slot4[23],
		killAward = slot3[23]
	},
	{
		gateID = 1023,
		name = "Scizor",
		name_en = "Scizor",
		name_vn = "Scizor",
		desc_th = "Scizor ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Scizor seems to have gotten more powerful",
		desc = "Scizor seems to have gotten more powerful",
		name_th = "Scizor",
		id = 24,
		desc_vn = "Scizor parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 90,
			rmb = 100,
			[932.0] = 90,
			__size = 3
		},
		repeatAward = {
			gold = 260000,
			[951.0] = 2,
			[932.0] = 35,
			__size = 3
		},
		challengeAward = slot4[24],
		killAward = slot3[24]
	},
	{
		gateID = 1024,
		name = "Magmortar",
		name_en = "Magmortar",
		name_vn = "Magmortar",
		desc_th = "Magmortar ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Magmortar seems to have gotten more powerful",
		desc = "Magmortar seems to have gotten more powerful",
		name_th = "Magmortar",
		id = 25,
		desc_vn = "Magmortar parece ter ficado mais forte",
		firstAward = slot1[25],
		repeatAward = {
			gold = 270000,
			[951.0] = 2,
			[932.0] = 40,
			__size = 3
		},
		challengeAward = slot4[25],
		killAward = slot3[25]
	},
	{
		gateID = 1025,
		name = "Ampharos",
		name_en = "Ampharos",
		name_vn = "Ampharos",
		desc_th = "อัมพารอสดูแข็งแกร่งขึ้น",
		desc_en = "Ampharos seems to have gotten more powerful",
		desc = "Ampharos seems to have gotten more powerful",
		name_th = "Ampharos",
		id = 26,
		desc_vn = "Ampharos parece ter ficado mais forte",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 100,
			[932.0] = 100,
			__size = 3
		},
		repeatAward = {
			gold = 280000,
			[951.0] = 2,
			[932.0] = 40,
			__size = 3
		},
		challengeAward = slot4[26],
		killAward = slot3[26]
	},
	{
		gateID = 1026,
		name = "Heracross",
		name_en = "Heracross",
		name_vn = "Heracross",
		desc_th = "เฮราครอสดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Heracross seems to have gotten more powerful",
		desc = "Heracross seems to have gotten more powerful",
		name_th = "Heracross",
		id = 27,
		desc_vn = "Heracross parece ter ficado mais forte",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 100,
			[932.0] = 100,
			__size = 3
		},
		repeatAward = {
			gold = 290000,
			[951.0] = 2,
			[932.0] = 40,
			__size = 3
		},
		challengeAward = slot4[27],
		killAward = slot3[27]
	},
	{
		gateID = 1027,
		name = "Weavile",
		name_en = "Weavile",
		name_vn = "Weavile",
		desc_th = "ดูเหมือนว่าวีวิลจะแข็งแกร่งขึ้น",
		desc_en = "Weavile seems to have gotten more powerful",
		desc = "Weavile seems to have gotten more powerful",
		name_th = "Weavile",
		id = 28,
		desc_vn = "Weavile parece ter ficado mais forte",
		firstAward = slot1[28],
		repeatAward = {
			gold = 300000,
			[951.0] = 2,
			[932.0] = 40,
			__size = 3
		},
		challengeAward = slot4[28],
		killAward = slot3[28]
	},
	{
		gateID = 1028,
		name = "Houndoom",
		name_en = "Houndoom",
		name_vn = "Houndoom",
		desc_th = "Houndoom ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Houndoom seems to have gotten more powerful",
		desc = "Houndoom seems to have gotten more powerful",
		name_th = "Houndoom",
		id = 29,
		desc_vn = "Houndoom parece ter ficado mais forte",
		firstAward = {
			[5000.0] = 110,
			rmb = 100,
			[932.0] = 110,
			__size = 3
		},
		repeatAward = {
			gold = 310000,
			[951.0] = 2,
			[932.0] = 40,
			__size = 3
		},
		challengeAward = slot4[29],
		killAward = slot3[29]
	},
	{
		gateID = 1029,
		name = "Tyranitar",
		name_en = "Tyranitar",
		name_vn = "Tyranitar",
		desc_th = "Tyranitar ดูเหมือนจะแข็งแกร่งขึ้น",
		desc_en = "Tyranitar seems to have gotten more powerful",
		desc = "Tyranitar seems to have gotten more powerful",
		name_th = "Tyranitar",
		id = 30,
		desc_vn = "Tyranitar parece ter ficado mais forte",
		firstAward = slot1[30],
		repeatAward = {
			gold = 320000,
			[951.0] = 2,
			[932.0] = 40,
			__size = 3
		},
		challengeAward = slot4[30],
		killAward = slot3[30]
	},
	{
		gateID = 1030,
		name = "Reggie Locke",
		name_en = "Reggie Locke",
		name_vn = "Reggie Locke",
		desc_th = "Reggie Rock seems to have gained stronger abilities",
		desc_en = "Reggie Rock seems to have gained stronger abilities",
		desc = "Reggie Rock seems to have gained stronger abilities",
		name_th = "Reggie Locke",
		id = 31,
		desc_vn = "Reggie Rock seems to have gained stronger abilities",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 120,
			[932.0] = 120,
			__size = 3
		},
		repeatAward = {
			gold = 330000,
			[951.0] = 3,
			[932.0] = 45,
			__size = 3
		},
		challengeAward = slot4[31],
		killAward = slot3[31]
	},
	{
		gateID = 1031,
		name = "Regis",
		name_en = "Regis",
		name_vn = "Regis",
		desc_th = "Regice seems to have gained stronger abilities",
		desc_en = "Regice seems to have gained stronger abilities",
		desc = "Regice seems to have gained stronger abilities",
		name_th = "Regis",
		id = 32,
		desc_vn = "Regice seems to have gained stronger abilities",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 120,
			[932.0] = 120,
			__size = 3
		},
		repeatAward = {
			gold = 340000,
			[951.0] = 3,
			[932.0] = 45,
			__size = 3
		},
		challengeAward = slot4[32],
		killAward = slot3[32]
	},
	{
		gateID = 1032,
		name = "Regischiru",
		name_en = "Regischiru",
		name_vn = "Regischiru",
		desc_th = "Regischiru seems to have gained stronger abilities",
		desc_en = "Regischiru seems to have gained stronger abilities",
		desc = "Regischiru seems to have gained stronger abilities",
		name_th = "Regischiru",
		id = 33,
		desc_vn = "Regischiru seems to have gained stronger abilities",
		firstAward = {
			[5000.0] = 120,
			[501.0] = 1,
			[932.0] = 120,
			__size = 3
		},
		repeatAward = {
			gold = 350000,
			[951.0] = 3,
			[932.0] = 45,
			__size = 3
		},
		challengeAward = slot4[33],
		killAward = slot3[33]
	},
	{
		gateID = 1033,
		name = "Big steel snake",
		name_en = "Big steel snake",
		name_vn = "Big steel snake",
		desc_th = "The big steel snake seems to have gained stronger abilities",
		desc_en = "The big steel snake seems to have gained stronger abilities",
		desc = "The big steel snake seems to have gained stronger abilities",
		name_th = "Big steel snake",
		id = 34,
		desc_vn = "The big steel snake seems to have gained stronger abilities",
		firstAward = {
			[5000.0] = 130,
			rmb = 100,
			[932.0] = 130,
			__size = 3
		},
		repeatAward = {
			gold = 360000,
			[951.0] = 3,
			[932.0] = 45,
			__size = 3
		},
		challengeAward = slot4[34],
		killAward = slot3[34]
	},
	{
		gateID = 1034,
		name = "Metagross",
		name_en = "Metagross",
		name_vn = "Metagross",
		desc_th = "Metagross seems to have gained stronger abilities",
		desc_en = "Metagross seems to have gained stronger abilities",
		desc = "Metagross seems to have gained stronger abilities",
		name_th = "Metagross",
		id = 35,
		desc_vn = "Metagross seems to have gained stronger abilities",
		firstAward = {
			[5000.0] = 130,
			[501.0] = 1,
			[932.0] = 130,
			__size = 3
		},
		repeatAward = {
			gold = 370000,
			[951.0] = 3,
			[932.0] = 45,
			__size = 3
		},
		challengeAward = slot4[35],
		killAward = slot3[35]
	},
	{
		gateID = 1035,
		name = "Double Ax Battle Dragon",
		name_en = "Double Ax Battle Dragon",
		name_vn = "Double Ax Battle Dragon",
		desc_th = "The dual-axe dragon seems to have gained stronger abilities",
		desc_en = "The dual-axe dragon seems to have gained stronger abilities",
		desc = "The dual-axe dragon seems to have gained stronger abilities",
		name_th = "Double Ax Battle Dragon",
		id = 36,
		desc_vn = "The dual-axe dragon seems to have gained stronger abilities",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 140,
			[932.0] = 140,
			__size = 3
		},
		repeatAward = {
			gold = 380000,
			[951.0] = 3,
			[932.0] = 50,
			__size = 3
		},
		challengeAward = slot4[36],
		killAward = slot3[36]
	},
	{
		gateID = 1036,
		name = "Lucario",
		name_en = "Lucario",
		name_vn = "Lucario",
		desc_th = "Lucario seems to have gained stronger abilities",
		desc_en = "Lucario seems to have gained stronger abilities",
		desc = "Lucario seems to have gained stronger abilities",
		name_th = "Lucario",
		id = 37,
		desc_vn = "Lucario seems to have gained stronger abilities",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 140,
			[932.0] = 140,
			__size = 3
		},
		repeatAward = {
			gold = 390000,
			[951.0] = 3,
			[932.0] = 50,
			__size = 3
		},
		challengeAward = slot4[37],
		killAward = slot3[37]
	},
	{
		gateID = 1037,
		name = "Kyogre",
		name_en = "Kyogre",
		name_vn = "Kyogre",
		desc_th = "Kyogre seems to have gained stronger abilities",
		desc_en = "Kyogre seems to have gained stronger abilities",
		desc = "Kyogre seems to have gained stronger abilities",
		name_th = "Kyogre",
		id = 38,
		desc_vn = "Kyogre seems to have gained stronger abilities",
		firstAward = {
			[5000.0] = 140,
			[501.0] = 1,
			[932.0] = 140,
			__size = 3
		},
		repeatAward = {
			gold = 400000,
			[951.0] = 3,
			[932.0] = 50,
			__size = 3
		},
		challengeAward = slot4[38],
		killAward = slot3[38]
	},
	{
		gateID = 1038,
		name = "Groudon",
		name_en = "Groudon",
		name_vn = "Groudon",
		desc_th = "Groudon seems to have gained stronger abilities",
		desc_en = "Groudon seems to have gained stronger abilities",
		desc = "Groudon seems to have gained stronger abilities",
		name_th = "Groudon",
		id = 39,
		desc_vn = "Groudon seems to have gained stronger abilities",
		firstAward = {
			[5000.0] = 150,
			rmb = 100,
			[932.0] = 150,
			__size = 3
		},
		repeatAward = {
			gold = 410000,
			[951.0] = 3,
			[932.0] = 50,
			__size = 3
		},
		challengeAward = slot4[39],
		killAward = slot3[39]
	},
	{
		gateID = 1039,
		name = "Rayquaza",
		name_en = "Rayquaza",
		name_vn = "Rayquaza",
		desc_th = "Rayquaza seems to have gotten more powerful",
		desc_en = "Rayquaza seems to have gotten more powerful",
		desc = "Rayquaza seems to have gotten more powerful",
		name_th = "Rayquaza",
		id = 40,
		desc_vn = "Rayquaza seems to have gotten more powerful",
		firstAward = {
			[5000.0] = 150,
			[501.0] = 1,
			[932.0] = 150,
			__size = 3
		},
		repeatAward = {
			gold = 420000,
			[951.0] = 3,
			[932.0] = 50,
			__size = 3
		},
		challengeAward = slot4[40],
		killAward = slot3[40]
	},
	{
		gateID = 1040,
		name = "Incineroar",
		name_en = "Incineroar",
		name_vn = "Incineroar",
		desc_th = "Incineroar seems to have gotten more powerful",
		desc_en = "Incineroar seems to have gotten more powerful",
		desc = "Incineroar seems to have gotten more powerful",
		name_th = "Incineroar",
		id = 41,
		desc_vn = "Incineroar seems to have gotten more powerful",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 160,
			[932.0] = 160,
			__size = 3
		},
		repeatAward = {
			gold = 430000,
			[951.0] = 3,
			[932.0] = 55,
			__size = 3
		},
		challengeAward = slot4[41],
		killAward = slot3[41]
	},
	{
		gateID = 1041,
		name = "Latias",
		name_en = "Latias",
		name_vn = "Latias",
		desc_th = "Latias seems to have gotten more powerful",
		desc_en = "Latias seems to have gotten more powerful",
		desc = "Latias seems to have gotten more powerful",
		name_th = "Latias",
		id = 42,
		desc_vn = "Latias seems to have gotten more powerful",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 160,
			[932.0] = 160,
			__size = 3
		},
		repeatAward = {
			gold = 440000,
			[951.0] = 3,
			[932.0] = 55,
			__size = 3
		},
		challengeAward = slot4[42],
		killAward = slot3[42]
	},
	{
		gateID = 1042,
		name = "Latios",
		name_en = "Latios",
		name_vn = "Latios",
		desc_th = "Latios seems to have gotten more powerful",
		desc_en = "Latios seems to have gotten more powerful",
		desc = "Latios seems to have gotten more powerful",
		name_th = "Latios",
		id = 43,
		desc_vn = "Latios seems to have gotten more powerful",
		firstAward = {
			[5000.0] = 160,
			[501.0] = 1,
			[932.0] = 160,
			__size = 3
		},
		repeatAward = {
			gold = 450000,
			[951.0] = 3,
			[932.0] = 55,
			__size = 3
		},
		challengeAward = slot4[43],
		killAward = slot3[43]
	},
	{
		gateID = 1043,
		name = "Ho-Oh",
		name_en = "Ho-Oh",
		name_vn = "Ho-Oh",
		desc_th = "Ho-Oh seems to have gotten more powerful",
		desc_en = "Ho-Oh seems to have gotten more powerful",
		desc = "Ho-Oh seems to have gotten more powerful",
		name_th = "Ho-Oh",
		id = 44,
		desc_vn = "Ho-Oh seems to have gotten more powerful",
		firstAward = {
			[5000.0] = 170,
			rmb = 100,
			[932.0] = 170,
			__size = 3
		},
		repeatAward = {
			gold = 460000,
			[951.0] = 3,
			[932.0] = 55,
			__size = 3
		},
		challengeAward = slot4[44],
		killAward = slot3[44]
	},
	{
		gateID = 1044,
		name = "Diancie",
		name_en = "Diancie",
		name_vn = "Diancie",
		desc_th = "Diancie seems to have gotten more powerful",
		desc_en = "Diancie seems to have gotten more powerful",
		desc = "Diancie seems to have gotten more powerful",
		name_th = "Diancie",
		id = 45,
		desc_vn = "Diancie seems to have gotten more powerful",
		firstAward = {
			[5000.0] = 170,
			[501.0] = 1,
			[932.0] = 170,
			__size = 3
		},
		repeatAward = {
			gold = 470000,
			[951.0] = 3,
			[932.0] = 55,
			__size = 3
		},
		challengeAward = slot4[45],
		killAward = slot3[45]
	},
	{
		gateID = 1045,
		name = "Cobalion",
		name_en = "Cobalion",
		name_vn = "Cobalion",
		desc_th = "Cobalion seems to have gotten more powerful",
		desc_en = "Cobalion seems to have gotten more powerful",
		desc = "Cobalion seems to have gotten more powerful",
		name_th = "Cobalion",
		id = 46,
		desc_vn = "Cobalion seems to have gotten more powerful",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 180,
			[932.0] = 180,
			__size = 3
		},
		repeatAward = {
			gold = 480000,
			[951.0] = 4,
			[932.0] = 60,
			__size = 3
		},
		challengeAward = slot4[46],
		killAward = slot3[46]
	},
	{
		gateID = 1046,
		name = "Terrakion",
		name_en = "Terrakion",
		name_vn = "Terrakion",
		desc_th = "Terrakion seems to have gotten more powerful",
		desc_en = "Terrakion seems to have gotten more powerful",
		desc = "Terrakion seems to have gotten more powerful",
		name_th = "Terrakion",
		id = 47,
		desc_vn = "Terrakion seems to have gotten more powerful",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 180,
			[932.0] = 180,
			__size = 3
		},
		repeatAward = {
			gold = 490000,
			[951.0] = 4,
			[932.0] = 60,
			__size = 3
		},
		challengeAward = slot4[47],
		killAward = slot3[47]
	},
	{
		gateID = 1047,
		name = "Virizion",
		name_en = "Virizion",
		name_vn = "Virizion",
		desc_th = "Virizion seems to have gotten more powerful",
		desc_en = "Virizion seems to have gotten more powerful",
		desc = "Virizion seems to have gotten more powerful",
		name_th = "Virizion",
		id = 48,
		desc_vn = "Virizion seems to have gotten more powerful",
		firstAward = {
			[5000.0] = 180,
			[501.0] = 1,
			[932.0] = 180,
			__size = 3
		},
		repeatAward = {
			gold = 500000,
			[951.0] = 4,
			[932.0] = 60,
			__size = 3
		},
		challengeAward = slot4[48],
		killAward = slot3[48]
	},
	{
		gateID = 1048,
		name = "Reshiram",
		name_en = "Reshiram",
		name_vn = "Reshiram",
		desc_th = "Reshiram seems to have gotten more powerful",
		desc_en = "Reshiram seems to have gotten more powerful",
		desc = "Reshiram seems to have gotten more powerful",
		name_th = "Reshiram",
		id = 49,
		desc_vn = "Reshiram seems to have gotten more powerful",
		firstAward = {
			[5000.0] = 190,
			rmb = 100,
			[932.0] = 190,
			__size = 3
		},
		repeatAward = {
			gold = 510000,
			[951.0] = 4,
			[932.0] = 60,
			__size = 3
		},
		challengeAward = slot4[49],
		killAward = slot3[49]
	},
	{
		gateID = 1049,
		name = "Zekrom",
		name_en = "Zekrom",
		name_vn = "Zekrom",
		desc_th = "Zekrom seems to have gotten more powerful",
		desc_en = "Zekrom seems to have gotten more powerful",
		desc = "Zekrom seems to have gotten more powerful",
		name_th = "Zekrom",
		id = 50,
		desc_vn = "Zekrom seems to have gotten more powerful",
		firstAward = {
			[5000.0] = 190,
			[501.0] = 1,
			[932.0] = 190,
			__size = 3
		},
		repeatAward = {
			gold = 520000,
			[951.0] = 4,
			[932.0] = 60,
			__size = 3
		},
		challengeAward = slot4[50],
		killAward = slot3[50]
	},
	{
		gateID = 1050,
		name = "Mismagius",
		name_en = "Mismagius",
		name_vn = "Mismagius",
		desc_th = "Mismagius seems to have gotten more powerful",
		desc_en = "Mismagius seems to have gotten more powerful",
		desc = "Mismagius seems to have gotten more powerful",
		name_th = "Mismagius",
		id = 51,
		desc_vn = "Mismagius seems to have gotten more powerful",
		firstAward = {
			[19.0] = 2,
			[5000.0] = 200,
			[932.0] = 200,
			__size = 3
		},
		repeatAward = {
			gold = 530000,
			[951.0] = 4,
			[932.0] = 60,
			__size = 3
		},
		challengeAward = slot4[51],
		killAward = slot3[51]
	},
	{
		gateID = 1051,
		name = "Nihilego",
		name_en = "Nihilego",
		name_vn = "Nihilego",
		desc_th = "Nihilego seems to have gotten more powerful",
		desc_en = "Nihilego seems to have gotten more powerful",
		desc = "Nihilego seems to have gotten more powerful",
		name_th = "Nihilego",
		id = 52,
		desc_vn = "Nihilego seems to have gotten more powerful",
		firstAward = {
			[519.0] = 1,
			[5000.0] = 200,
			[932.0] = 200,
			__size = 3
		},
		repeatAward = {
			gold = 540000,
			[951.0] = 4,
			[932.0] = 60,
			__size = 3
		},
		challengeAward = slot4[52],
		killAward = slot3[52]
	},
	{
		gateID = 1052,
		name = "Buzzwole",
		name_en = "Buzzwole",
		name_vn = "Buzzwole",
		desc_th = "Buzzwole seems to have gotten more powerful",
		desc_en = "Buzzwole seems to have gotten more powerful",
		desc = "Buzzwole seems to have gotten more powerful",
		name_th = "Buzzwole",
		id = 53,
		desc_vn = "Buzzwole seems to have gotten more powerful",
		firstAward = {
			[5000.0] = 200,
			[501.0] = 1,
			[932.0] = 200,
			__size = 3
		},
		repeatAward = {
			gold = 550000,
			[951.0] = 4,
			[932.0] = 60,
			__size = 3
		},
		challengeAward = slot4[53],
		killAward = slot3[53]
	},
	{
		gateID = 1053,
		name = "Pheromosa",
		name_en = "Pheromosa",
		name_vn = "Pheromosa",
		desc_th = "Pheromosa seems to have gotten more powerful",
		desc_en = "Pheromosa seems to have gotten more powerful",
		desc = "Pheromosa seems to have gotten more powerful",
		name_th = "Pheromosa",
		id = 54,
		desc_vn = "Pheromosa seems to have gotten more powerful",
		firstAward = {
			[5000.0] = 210,
			rmb = 100,
			[932.0] = 210,
			__size = 3
		},
		repeatAward = {
			gold = 560000,
			[951.0] = 4,
			[932.0] = 60,
			__size = 3
		},
		challengeAward = slot4[54],
		killAward = slot3[54]
	},
	{
		gateID = 1054,
		name = "Xurkitree",
		name_en = "Xurkitree",
		name_vn = "Xurkitree",
		desc_th = "Xurkitree seems to have gotten more powerful",
		desc_en = "Xurkitree seems to have gotten more powerful",
		desc = "Xurkitree seems to have gotten more powerful",
		name_th = "Xurkitree",
		id = 55,
		desc_vn = "Xurkitree seems to have gotten more powerful",
		firstAward = {
			[5000.0] = 210,
			[501.0] = 1,
			[932.0] = 210,
			__size = 3
		},
		repeatAward = {
			gold = 570000,
			[951.0] = 4,
			[932.0] = 60,
			__size = 3
		},
		challengeAward = slot4[55],
		killAward = slot3[55]
	},
	__size = 55,
	__default = {
		__index = {
			gateID = 0,
			name_en = "",
			name = "",
			name_vn = "",
			desc_th = "",
			desc_en = "",
			desc = "",
			name_th = "",
			desc_vn = "",
			firstAward = slot1.default,
			repeatAward = slot2.default,
			challengeAward = slot4.default,
			killAward = slot3.default
		}
	}
}

return csv.union.union_fuben
