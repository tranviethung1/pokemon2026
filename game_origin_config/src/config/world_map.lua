slot0 = {
	__size = 6,
	[10] = {
		8,
		16,
		24
	},
	[15] = {
		10,
		20,
		30
	},
	[52] = {
		0,
		0,
		9
	},
	[57] = {
		0,
		0,
		12
	},
	[62] = {
		0,
		0,
		15
	},
	[99] = {
		0,
		0,
		6
	}
}
slot1 = {
	[216] = slot0[52],
	[217] = slot0[52],
	[214] = slot0[99],
	[132] = slot0[62],
	[212] = slot0[99],
	[213] = slot0[99],
	[211] = slot0[99],
	[134] = slot0[62],
	[228] = slot0[62],
	[218] = slot0[52],
	[219] = slot0[52],
	[115] = slot0[62],
	[114] = slot0[57],
	[117] = slot0[62],
	[116] = slot0[62],
	[111] = slot0[52],
	[136] = slot0[62],
	[113] = slot0[57],
	[112] = slot0[52],
	[234] = slot0[62],
	[235] = slot0[62],
	[236] = slot0[62],
	[237] = slot0[62],
	[119] = slot0[62],
	[118] = slot0[62],
	[229] = slot0[62],
	[233] = slot0[62],
	[24] = slot0[15],
	[25] = slot0[15],
	[26] = slot0[15],
	[27] = slot0[15],
	[20] = slot0[15],
	[21] = slot0[15],
	[22] = slot0[15],
	[23] = slot0[15],
	[230] = slot0[62],
	[28] = slot0[15],
	[29] = slot0[15],
	[226] = slot0[57],
	[231] = slot0[62],
	[135] = slot0[62],
	[232] = slot0[62],
	[36] = slot0[15],
	[227] = slot0[57],
	[120] = slot0[62],
	[121] = slot0[62],
	[122] = slot0[62],
	[123] = slot0[62],
	[124] = slot0[62],
	[125] = slot0[62],
	[126] = slot0[62],
	[127] = slot0[62],
	[128] = slot0[62],
	[129] = slot0[62],
	[225] = slot0[57],
	[224] = slot0[57],
	[223] = slot0[57],
	[222] = slot0[57],
	[221] = slot0[57],
	[220] = slot0[52],
	[133] = slot0[62],
	[13] = slot0[10],
	[15] = slot0[15],
	[14] = slot0[10],
	[17] = slot0[15],
	[16] = slot0[15],
	[19] = slot0[15],
	[18] = slot0[15],
	[31] = slot0[15],
	[30] = slot0[15],
	[37] = slot0[15],
	[131] = slot0[62],
	[35] = slot0[15],
	[34] = slot0[15],
	[33] = slot0[15],
	[130] = slot0[62],
	[215] = slot0[99],
	[32] = slot0[15],
	[137] = slot0[62]
}
csv.world_map = {
	{
		isWorldEnter = true,
		res = "SJDT_1.json",
		id = 1,
		openLevel = 1,
		seq = {
			11,
			12,
			13,
			14,
			15,
			16,
			17,
			18,
			19,
			20,
			21,
			22,
			23,
			24,
			25,
			26,
			27,
			28,
			29,
			30,
			31,
			32,
			33,
			34,
			35
		}
	},
	__size = 82,
	[11] = {
		name_en = "Pallet Town",
		ownerId = 1,
		name = "Pallet Town",
		heroMapId = 111,
		nightmareMapId = 211,
		openLevel = 1,
		res = "GKDT_ptgk1.json",
		name_th = "Pallet Town",
		id = 11,
		baseMap = "city/gate/map/img_zxz.png",
		chapterType = 1,
		seq = {
			10101,
			10102,
			10103,
			10104,
			10105
		},
		starAwardConds = {
			0,
			6,
			15
		},
		starAwardIDs = {
			0,
			1111,
			1112
		}
	},
	[12] = {
		name_en = "Mysterious Tribe",
		ownerId = 1,
		name = "Mysterious Tribe",
		heroMapId = 112,
		nightmareMapId = 212,
		openLevel = 1,
		res = "GKDT_ptgk2.json",
		name_th = "Mysterious Tribe",
		id = 12,
		baseMap = "city/gate/map/img_smbl.png",
		chapterType = 1,
		seq = {
			10201,
			10202,
			10203,
			10204,
			10205,
			10206
		},
		starAwardConds = {
			0,
			9,
			18
		},
		starAwardIDs = {
			0,
			1121,
			1122
		}
	},
	[13] = {
		name_en = "Abandoned City",
		ownerId = 1,
		name = "Abandoned City",
		heroMapId = 113,
		nightmareMapId = 213,
		openLevel = 1,
		res = "GKDT_ptgk3.json",
		name_th = "Abandoned City",
		id = 13,
		baseMap = "city/gate/map/img_fqcs.png",
		chapterType = 1,
		seq = {
			10301,
			10302,
			10303,
			10304,
			10305,
			10306,
			10307,
			10308
		},
		starAwardConds = slot1[13],
		starAwardIDs = {
			1131,
			1132,
			1133
		}
	},
	[14] = {
		name_en = "Resort Island",
		ownerId = 1,
		name = "Resort Island",
		heroMapId = 114,
		nightmareMapId = 214,
		openLevel = 1,
		res = "GKDT_ptgk4.json",
		name_th = "Resort Island",
		id = 14,
		baseMap = "city/gate/map/img_djd.png",
		chapterType = 1,
		seq = {
			10401,
			10402,
			10403,
			10404,
			10405,
			10406,
			10407,
			10408
		},
		starAwardConds = slot1[14],
		starAwardIDs = {
			1141,
			1142,
			1143
		}
	},
	[15] = {
		name_en = "Sandgem Town",
		ownerId = 1,
		name = "Sandgem Town",
		heroMapId = 115,
		nightmareMapId = 215,
		openLevel = 1,
		res = "GKDT_ptgk5.json",
		name_th = "Sandgem Town",
		id = 15,
		baseMap = "city/gate/map/img_xbxz.png",
		chapterType = 1,
		seq = {
			10501,
			10502,
			10503,
			10504,
			10505,
			10506,
			10507,
			10508,
			10509,
			10510
		},
		starAwardConds = slot1[15],
		starAwardIDs = {
			1151,
			1152,
			1153
		}
	},
	[16] = {
		name_en = "Snow Field",
		ownerId = 1,
		name = "Snow Field",
		heroMapId = 116,
		nightmareMapId = 216,
		openLevel = 26,
		res = "GKDT_ptgk6.json",
		name_th = "Snow Field",
		id = 16,
		baseMap = "city/gate/map/img_spcj.png",
		chapterType = 1,
		seq = {
			10601,
			10602,
			10603,
			10604,
			10605,
			10606,
			10607,
			10608,
			10609,
			10610
		},
		starAwardConds = slot1[16],
		starAwardIDs = {
			1161,
			1162,
			1163
		}
	},
	[17] = {
		name_en = "Poni Island",
		ownerId = 1,
		name = "Poni Island",
		heroMapId = 117,
		nightmareMapId = 217,
		openLevel = 30,
		res = "GKDT_ptgk7.json",
		name_th = "Poni Island",
		id = 17,
		baseMap = "city/gate/map/img_bnd.png",
		chapterType = 1,
		seq = {
			10701,
			10702,
			10703,
			10704,
			10705,
			10706,
			10707,
			10708,
			10709,
			10710
		},
		starAwardConds = slot1[17],
		starAwardIDs = {
			1171,
			1172,
			1173
		}
	},
	[18] = {
		name_en = "Ula'Ula Island",
		ownerId = 1,
		name = "Ula'Ula Island",
		heroMapId = 118,
		nightmareMapId = 218,
		openLevel = 33,
		res = "GKDT_ptgk8.json",
		name_th = "Ula'Ula Island",
		id = 18,
		baseMap = "city/gate/map/img_gbxs.png",
		chapterType = 1,
		seq = {
			10801,
			10802,
			10803,
			10804,
			10805,
			10806,
			10807,
			10808,
			10809,
			10810
		},
		starAwardConds = slot1[18],
		starAwardIDs = {
			1181,
			1182,
			1183
		}
	},
	[19] = {
		name_en = "Akala Island",
		ownerId = 1,
		name = "Akala Island",
		heroMapId = 119,
		nightmareMapId = 219,
		openLevel = 37,
		res = "GKDT_ptgk9.json",
		name_th = "Akala Island",
		id = 19,
		baseMap = "city/gate/map/img_akld.png",
		chapterType = 1,
		seq = {
			10901,
			10902,
			10903,
			10904,
			10905,
			10906,
			10907,
			10908,
			10909,
			10910
		},
		starAwardConds = slot1[19],
		starAwardIDs = {
			1191,
			1192,
			1193
		}
	},
	[20] = {
		name_en = "Melemele Island",
		ownerId = 1,
		name = "Melemele Island",
		heroMapId = 120,
		nightmareMapId = 220,
		openLevel = 40,
		res = "GKDT_ptgk10.json",
		name_th = "Melemele Island",
		id = 20,
		baseMap = "city/gate/map/img_mlmld.png",
		chapterType = 1,
		seq = {
			11001,
			11002,
			11003,
			11004,
			11005,
			11006,
			11007,
			11008,
			11009,
			11010
		},
		starAwardConds = slot1[20],
		starAwardIDs = {
			1201,
			1202,
			1203
		}
	},
	[21] = {
		name_en = "Trainers Academy",
		ownerId = 1,
		name = "Trainers Academy",
		heroMapId = 121,
		nightmareMapId = 221,
		openLevel = 45,
		res = "GKDT_ptgk11.json",
		name_th = "Trainers Academy",
		id = 21,
		baseMap = "city/gate/map/img_alldqxx.png",
		chapterType = 1,
		seq = {
			11101,
			11102,
			11103,
			11104,
			11105,
			11106,
			11107,
			11108,
			11109,
			11110
		},
		starAwardConds = slot1[21],
		starAwardIDs = {
			1211,
			1212,
			1213
		}
	},
	[22] = {
		name_en = "Hau'Oli City",
		ownerId = 1,
		name = "Hau'Oli City",
		heroMapId = 122,
		nightmareMapId = 222,
		openLevel = 50,
		res = "GKDT_ptgk12.json",
		name_th = "Hau'Oli City",
		id = 22,
		baseMap = "city/gate/map/img_llajdhz.png",
		chapterType = 1,
		seq = {
			11201,
			11202,
			11203,
			11204,
			11205,
			11206,
			11207,
			11208,
			11209,
			11210
		},
		starAwardConds = slot1[22],
		starAwardIDs = {
			1221,
			1222,
			1223
		}
	},
	[23] = {
		name_en = "Battle In Mining Area",
		ownerId = 1,
		name = "Battle In Mining Area",
		heroMapId = 123,
		nightmareMapId = 223,
		openLevel = 55,
		res = "GKDT_ptgk13.json",
		name_th = "Battle In Mining Area",
		id = 23,
		baseMap = "city/gate/map/img_dzktq.png",
		chapterType = 1,
		seq = {
			11301,
			11302,
			11303,
			11304,
			11305,
			11306,
			11307,
			11308,
			11309,
			11310
		},
		starAwardConds = slot1[23],
		starAwardIDs = {
			1231,
			1232,
			1233
		}
	},
	[24] = {
		name_en = "Ecruteak City",
		ownerId = 1,
		name = "Ecruteak City",
		heroMapId = 124,
		nightmareMapId = 224,
		openLevel = 60,
		res = "GKDT_ptgk13.json",
		name_th = "Ecruteak City",
		id = 24,
		baseMap = "city/gate/map/img_yzs.png",
		chapterType = 1,
		seq = {
			11401,
			11402,
			11403,
			11404,
			11405,
			11406,
			11407,
			11408,
			11409,
			11410
		},
		starAwardConds = slot1[24],
		starAwardIDs = {
			1241,
			1242,
			1243
		}
	},
	[25] = {
		name_en = "Ancient Altar",
		ownerId = 1,
		name = "Ancient Altar",
		heroMapId = 125,
		nightmareMapId = 225,
		openLevel = 65,
		res = "GKDT_ptgk13.json",
		name_th = "Ancient Altar",
		id = 25,
		baseMap = "city/gate/map/img_jt.png",
		chapterType = 1,
		seq = {
			11501,
			11502,
			11503,
			11504,
			11505,
			11506,
			11507,
			11508,
			11509,
			11510
		},
		starAwardConds = slot1[25],
		starAwardIDs = {
			1251,
			1252,
			1253
		}
	},
	[26] = {
		name_en = "Icy Cold Plains",
		ownerId = 1,
		name = "Icy Cold Plains",
		heroMapId = 126,
		nightmareMapId = 226,
		openLevel = 70,
		res = "GKDT_ptgk13.json",
		name_th = "Icy Cold Plains",
		id = 26,
		baseMap = "city/gate/map/img_by.png",
		chapterType = 1,
		seq = {
			11601,
			11602,
			11603,
			11604,
			11605,
			11606,
			11607,
			11608,
			11609,
			11610
		},
		starAwardConds = slot1[26],
		starAwardIDs = {
			1261,
			1262,
			1263
		}
	},
	[27] = {
		name_en = "Amusement Park",
		ownerId = 1,
		name = "Amusement Park",
		heroMapId = 127,
		nightmareMapId = 227,
		openLevel = 75,
		res = "GKDT_ptgk13.json",
		name_th = "Amusement Park",
		id = 27,
		baseMap = "city/gate/map/img_yly.png",
		chapterType = 1,
		seq = {
			11701,
			11702,
			11703,
			11704,
			11705,
			11706,
			11707,
			11708,
			11709,
			11710
		},
		starAwardConds = slot1[27],
		starAwardIDs = {
			1271,
			1272,
			1273
		}
	},
	[28] = {
		name_en = "Breeder Academy",
		ownerId = 1,
		name = "Breeder Academy",
		heroMapId = 128,
		nightmareMapId = 228,
		openLevel = 80,
		res = "GKDT_ptgk13.json",
		name_th = "Breeder Academy",
		id = 28,
		baseMap = "city/gate/map/img_syjxx.png",
		chapterType = 1,
		seq = {
			11801,
			11802,
			11803,
			11804,
			11805,
			11806,
			11807,
			11808,
			11809,
			11810
		},
		starAwardConds = slot1[28],
		starAwardIDs = {
			1281,
			1282,
			1283
		}
	},
	[29] = {
		name_en = "Circus",
		ownerId = 1,
		name = "Circus",
		heroMapId = 129,
		nightmareMapId = 229,
		openLevel = 85,
		res = "GKDT_ptgk13.json",
		name_th = "Circus",
		id = 29,
		baseMap = "city/gate/map/img_mxt.png",
		chapterType = 1,
		seq = {
			11901,
			11902,
			11903,
			11904,
			11905,
			11906,
			11907,
			11908,
			11909,
			11910
		},
		starAwardConds = slot1[29],
		starAwardIDs = {
			1291,
			1292,
			1293
		}
	},
	[30] = {
		name_en = "Shadow Mountain",
		ownerId = 1,
		name = "Shadow Mountain",
		heroMapId = 130,
		nightmareMapId = 230,
		openLevel = 90,
		res = "GKDT_ptgk13.json",
		name_th = "Shadow Mountain",
		id = 30,
		baseMap = "city/gate/map/img_ays.png",
		chapterType = 1,
		seq = {
			12001,
			12002,
			12003,
			12004,
			12005,
			12006,
			12007,
			12008,
			12009,
			12010
		},
		starAwardConds = slot1[30],
		starAwardIDs = {
			1301,
			1302,
			1303
		}
	},
	[31] = {
		name_en = "Aromatherapy City",
		ownerId = 1,
		name = "Aromatherapy City",
		heroMapId = 131,
		nightmareMapId = 231,
		openLevel = 95,
		res = "GKDT_ptgk13.json",
		name_th = "Aromatherapy City",
		id = 31,
		baseMap = "city/gate/map/img_xxs.png",
		chapterType = 1,
		seq = {
			12101,
			12102,
			12103,
			12104,
			12105,
			12106,
			12107,
			12108,
			12109,
			12110
		},
		starAwardConds = slot1[31],
		starAwardIDs = {
			1311,
			1312,
			1313
		}
	},
	[32] = {
		name_en = "Dry Leaves",
		ownerId = 1,
		name = "Dry Leaves",
		heroMapId = 132,
		nightmareMapId = 232,
		openLevel = 100,
		res = "GKDT_ptgk13.json",
		name_th = "Dry Leaves",
		id = 32,
		baseMap = "city/gate/map/img_kys.png",
		chapterType = 1,
		seq = {
			12201,
			12202,
			12203,
			12204,
			12205,
			12206,
			12207,
			12208,
			12209,
			12210
		},
		starAwardConds = slot1[32],
		starAwardIDs = {
			1321,
			1322,
			1323
		}
	},
	[111] = {
		name_en = "Pallet Town",
		ownerId = 1,
		name = "Pallet Town",
		openLevel = 1,
		res = "GKDT_ptgk1.json",
		name_th = "Pallet Town",
		id = 111,
		baseMap = "city/gate/map/img_zxz.png",
		chapterType = 2,
		seq = {
			20101,
			20102,
			20103
		},
		starAwardConds = slot1[111],
		starAwardIDs = {
			0,
			0,
			1501
		}
	},
	[112] = {
		name_en = "Mysterious Tribe",
		ownerId = 1,
		name = "Mysterious Tribe",
		openLevel = 1,
		res = "GKDT_ptgk2.json",
		name_th = "Mysterious Tribe",
		id = 112,
		baseMap = "city/gate/map/img_smbl.png",
		chapterType = 2,
		seq = {
			20201,
			20202,
			20203
		},
		starAwardConds = slot1[112],
		starAwardIDs = {
			0,
			0,
			1511
		}
	},
	[113] = {
		name_en = "Abandoned City",
		ownerId = 1,
		name = "Abandoned City",
		openLevel = 1,
		res = "GKDT_ptgk3.json",
		name_th = "Abandoned City",
		id = 113,
		baseMap = "city/gate/map/img_fqcs.png",
		chapterType = 2,
		seq = {
			20301,
			20302,
			20303,
			20304
		},
		starAwardConds = slot1[113],
		starAwardIDs = {
			0,
			0,
			1521
		}
	},
	[114] = {
		name_en = "Resort Island",
		ownerId = 1,
		name = "Resort Island",
		openLevel = 1,
		res = "GKDT_ptgk4.json",
		name_th = "Resort Island",
		id = 114,
		baseMap = "city/gate/map/img_djd.png",
		chapterType = 2,
		seq = {
			20401,
			20402,
			20403,
			20404
		},
		starAwardConds = slot1[114],
		starAwardIDs = {
			0,
			0,
			1531
		}
	},
	[115] = {
		name_en = "Sandgem Town",
		ownerId = 1,
		name = "Sandgem Town",
		openLevel = 1,
		res = "GKDT_ptgk5.json",
		name_th = "Sandgem Town",
		id = 115,
		baseMap = "city/gate/map/img_xbxz.png",
		chapterType = 2,
		seq = {
			20501,
			20502,
			20503,
			20504,
			20505
		},
		starAwardConds = slot1[115],
		starAwardIDs = {
			0,
			0,
			1541
		}
	},
	[116] = {
		name_en = "Snow Field",
		ownerId = 1,
		name = "Snow Field",
		openLevel = 26,
		res = "GKDT_ptgk6.json",
		name_th = "Snow Field",
		id = 116,
		baseMap = "city/gate/map/img_spcj.png",
		chapterType = 2,
		seq = {
			20601,
			20602,
			20603,
			20604,
			20605
		},
		starAwardConds = slot1[116],
		starAwardIDs = {
			0,
			0,
			1551
		}
	},
	[117] = {
		name_en = "Poni Island",
		ownerId = 1,
		name = "Poni Island",
		openLevel = 30,
		res = "GKDT_ptgk7.json",
		name_th = "Poni Island",
		id = 117,
		baseMap = "city/gate/map/img_bnd.png",
		chapterType = 2,
		seq = {
			20701,
			20702,
			20703,
			20704,
			20705
		},
		starAwardConds = slot1[117],
		starAwardIDs = {
			0,
			0,
			1561
		}
	},
	[118] = {
		name_en = "Ula'Ula Island",
		ownerId = 1,
		name = "Ula'Ula Island",
		openLevel = 33,
		res = "GKDT_ptgk8.json",
		name_th = "Ula'Ula Island",
		id = 118,
		baseMap = "city/gate/map/img_gbxs.png",
		chapterType = 2,
		seq = {
			20801,
			20802,
			20803,
			20804,
			20805
		},
		starAwardConds = slot1[118],
		starAwardIDs = {
			0,
			0,
			1571
		}
	},
	[119] = {
		name_en = "Akala Island",
		ownerId = 1,
		name = "Akala Island",
		openLevel = 37,
		res = "GKDT_ptgk9.json",
		name_th = "Akala Island",
		id = 119,
		baseMap = "city/gate/map/img_akld.png",
		chapterType = 2,
		seq = {
			20901,
			20902,
			20903,
			20904,
			20905
		},
		starAwardConds = slot1[119],
		starAwardIDs = {
			0,
			0,
			1581
		}
	},
	[120] = {
		name_en = "Melemele Island",
		ownerId = 1,
		name = "Melemele Island",
		openLevel = 40,
		res = "GKDT_ptgk10.json",
		name_th = "Melemele Island",
		id = 120,
		baseMap = "city/gate/map/img_mlmld.png",
		chapterType = 2,
		seq = {
			21001,
			21002,
			21003,
			21004,
			21005
		},
		starAwardConds = slot1[120],
		starAwardIDs = {
			0,
			0,
			1591
		}
	},
	[121] = {
		name_en = "Trainers Academy",
		ownerId = 1,
		name = "Trainers Academy",
		openLevel = 45,
		res = "GKDT_ptgk11.json",
		name_th = "Trainers Academy",
		id = 121,
		baseMap = "city/gate/map/img_alldqxx.png",
		chapterType = 2,
		seq = {
			21101,
			21102,
			21103,
			21104,
			21105
		},
		starAwardConds = slot1[121],
		starAwardIDs = {
			0,
			0,
			1601
		}
	},
	[122] = {
		name_en = "Hau'Oli City",
		ownerId = 1,
		name = "Hau'Oli City",
		openLevel = 50,
		res = "GKDT_ptgk12.json",
		name_th = "Hau'Oli City",
		id = 122,
		baseMap = "city/gate/map/img_llajdhz.png",
		chapterType = 2,
		seq = {
			21201,
			21202,
			21203,
			21204,
			21205
		},
		starAwardConds = slot1[122],
		starAwardIDs = {
			0,
			0,
			1611
		}
	},
	[123] = {
		name_en = "Battle In Mining Area",
		ownerId = 1,
		name = "Battle In Mining Area",
		openLevel = 55,
		res = "GKDT_ptgk13.json",
		name_th = "Battle In Mining Area",
		id = 123,
		baseMap = "city/gate/map/img_dzktq.png",
		chapterType = 2,
		seq = {
			21301,
			21302,
			21303,
			21304,
			21305
		},
		starAwardConds = slot1[123],
		starAwardIDs = {
			0,
			0,
			1621
		}
	},
	[124] = {
		name_en = "Ecruteak City",
		ownerId = 1,
		name = "Ecruteak City",
		openLevel = 60,
		res = "GKDT_ptgk13.json",
		name_th = "Ecruteak City",
		id = 124,
		baseMap = "city/gate/map/img_yzs.png",
		chapterType = 2,
		seq = {
			21401,
			21402,
			21403,
			21404,
			21405
		},
		starAwardConds = slot1[124],
		starAwardIDs = {
			0,
			0,
			1631
		}
	},
	[125] = {
		name_en = "Ancient Altar",
		ownerId = 1,
		name = "Ancient Altar",
		openLevel = 65,
		res = "GKDT_ptgk13.json",
		name_th = "Ancient Altar",
		id = 125,
		baseMap = "city/gate/map/img_jt.png",
		chapterType = 2,
		seq = {
			21501,
			21502,
			21503,
			21504,
			21505
		},
		starAwardConds = slot1[125],
		starAwardIDs = {
			0,
			0,
			1641
		}
	},
	[126] = {
		name_en = "Icy Cold Plains",
		ownerId = 1,
		name = "Icy Cold Plains",
		openLevel = 70,
		res = "GKDT_ptgk13.json",
		name_th = "Icy Cold Plains",
		id = 126,
		baseMap = "city/gate/map/img_by.png",
		chapterType = 2,
		seq = {
			21601,
			21602,
			21603,
			21604,
			21605
		},
		starAwardConds = slot1[126],
		starAwardIDs = {
			0,
			0,
			1651
		}
	},
	[127] = {
		name_en = "Amusement Park",
		ownerId = 1,
		name = "Amusement Park",
		openLevel = 75,
		res = "GKDT_ptgk13.json",
		name_th = "Amusement Park",
		id = 127,
		baseMap = "city/gate/map/img_yly.png",
		chapterType = 2,
		seq = {
			21701,
			21702,
			21703,
			21704,
			21705
		},
		starAwardConds = slot1[127],
		starAwardIDs = {
			0,
			0,
			1661
		}
	},
	[128] = {
		name_en = "Breeder Academy",
		ownerId = 1,
		name = "Breeder Academy",
		openLevel = 80,
		res = "GKDT_ptgk13.json",
		name_th = "Breeder Academy",
		id = 128,
		baseMap = "city/gate/map/img_syjxx.png",
		chapterType = 2,
		seq = {
			21801,
			21802,
			21803,
			21804,
			21805
		},
		starAwardConds = slot1[128],
		starAwardIDs = {
			0,
			0,
			1671
		}
	},
	[129] = {
		name_en = "Circus",
		ownerId = 1,
		name = "Circus",
		openLevel = 85,
		res = "GKDT_ptgk13.json",
		name_th = "Circus",
		id = 129,
		baseMap = "city/gate/map/img_mxt.png",
		chapterType = 2,
		seq = {
			21901,
			21902,
			21903,
			21904,
			21905
		},
		starAwardConds = slot1[129],
		starAwardIDs = {
			0,
			0,
			1681
		}
	},
	[130] = {
		name_en = "Shadow Mountain",
		ownerId = 1,
		name = "Shadow Mountain",
		openLevel = 90,
		res = "GKDT_ptgk13.json",
		name_th = "Shadow Mountain",
		id = 130,
		baseMap = "city/gate/map/img_ays.png",
		chapterType = 2,
		seq = {
			22001,
			22002,
			22003,
			22004,
			22005
		},
		starAwardConds = slot1[130],
		starAwardIDs = {
			0,
			0,
			1691
		}
	},
	[131] = {
		name_en = "Aromatherapy City",
		ownerId = 1,
		name = "Aromatherapy City",
		openLevel = 95,
		res = "GKDT_ptgk13.json",
		name_th = "Aromatherapy City",
		id = 131,
		baseMap = "city/gate/map/img_xxs.png",
		chapterType = 2,
		seq = {
			22101,
			22102,
			22103,
			22104,
			22105
		},
		starAwardConds = slot1[131],
		starAwardIDs = {
			0,
			0,
			1701
		}
	},
	[132] = {
		name_en = "Dry Leaves",
		ownerId = 1,
		name = "Dry Leaves",
		openLevel = 100,
		res = "GKDT_ptgk13.json",
		name_th = "Dry Leaves",
		id = 132,
		baseMap = "city/gate/map/img_kys.png",
		chapterType = 2,
		seq = {
			22201,
			22202,
			22203,
			22204,
			22205
		},
		starAwardConds = slot1[132],
		starAwardIDs = {
			0,
			0,
			1711
		}
	},
	[211] = {
		name_en = "Pallet Town",
		ownerId = 1,
		name = "Pallet Town",
		openLevel = 47,
		res = "GKDT_ptgk1.json",
		name_th = "Pallet Town",
		id = 211,
		baseMap = "city/gate/map/img_zxz.png",
		chapterType = 3,
		seq = {
			30101,
			30102
		},
		starAwardConds = slot1[211],
		starAwardIDs = {
			0,
			0,
			6501
		}
	},
	[212] = {
		name_en = "Mysterious Tribe",
		ownerId = 1,
		name = "Mysterious Tribe",
		openLevel = 48,
		res = "GKDT_ptgk2.json",
		name_th = "Mysterious Tribe",
		id = 212,
		baseMap = "city/gate/map/img_smbl.png",
		chapterType = 3,
		seq = {
			30201,
			30202
		},
		starAwardConds = slot1[212],
		starAwardIDs = {
			0,
			0,
			6511
		}
	},
	[213] = {
		name_en = "Abandoned City",
		ownerId = 1,
		name = "Abandoned City",
		openLevel = 49,
		res = "GKDT_ptgk3.json",
		name_th = "Abandoned City",
		id = 213,
		baseMap = "city/gate/map/img_fqcs.png",
		chapterType = 3,
		seq = {
			30301,
			30302
		},
		starAwardConds = slot1[213],
		starAwardIDs = {
			0,
			0,
			6521
		}
	},
	[214] = {
		name_en = "Resort Island",
		ownerId = 1,
		name = "Resort Island",
		openLevel = 50,
		res = "GKDT_ptgk4.json",
		name_th = "Resort Island",
		id = 214,
		baseMap = "city/gate/map/img_djd.png",
		chapterType = 3,
		seq = {
			30401,
			30402
		},
		starAwardConds = slot1[214],
		starAwardIDs = {
			0,
			0,
			6531
		}
	},
	[215] = {
		name_en = "Sandgem Town",
		ownerId = 1,
		name = "Sandgem Town",
		openLevel = 51,
		res = "GKDT_ptgk5.json",
		name_th = "Sandgem Town",
		id = 215,
		baseMap = "city/gate/map/img_xbxz.png",
		chapterType = 3,
		seq = {
			30501,
			30502
		},
		starAwardConds = slot1[215],
		starAwardIDs = {
			0,
			0,
			6541
		}
	},
	[216] = {
		name_en = "Snow Field",
		ownerId = 1,
		name = "Snow Field",
		openLevel = 52,
		res = "GKDT_ptgk5.json",
		name_th = "Snow Field",
		id = 216,
		baseMap = "city/gate/map/img_spcj.png",
		chapterType = 3,
		seq = {
			30601,
			30602,
			30603
		},
		starAwardConds = slot1[216],
		starAwardIDs = {
			0,
			0,
			6551
		}
	},
	[217] = {
		name_en = "Poni Island",
		ownerId = 1,
		name = "Poni Island",
		openLevel = 53,
		res = "GKDT_ptgk5.json",
		name_th = "Poni Island",
		id = 217,
		baseMap = "city/gate/map/img_bnd.png",
		chapterType = 3,
		seq = {
			30701,
			30702,
			30703
		},
		starAwardConds = slot1[217],
		starAwardIDs = {
			0,
			0,
			6561
		}
	},
	[218] = {
		name_en = "Ula'Ula Island",
		ownerId = 1,
		name = "Ula'Ula Island",
		openLevel = 54,
		res = "GKDT_ptgk5.json",
		name_th = "Ula'Ula Island",
		id = 218,
		baseMap = "city/gate/map/img_gbxs.png",
		chapterType = 3,
		seq = {
			30801,
			30802,
			30803
		},
		starAwardConds = slot1[218],
		starAwardIDs = {
			0,
			0,
			6571
		}
	},
	[219] = {
		name_en = "Akala Island",
		ownerId = 1,
		name = "Akala Island",
		openLevel = 55,
		res = "GKDT_ptgk1.json",
		name_th = "Akala Island",
		id = 219,
		baseMap = "city/gate/map/img_akld.png",
		chapterType = 3,
		seq = {
			30901,
			30902,
			30903
		},
		starAwardConds = slot1[219],
		starAwardIDs = {
			0,
			0,
			6581
		}
	},
	[220] = {
		name_en = "Melemele Island",
		ownerId = 1,
		name = "Melemele Island",
		openLevel = 55,
		res = "GKDT_ptgk2.json",
		name_th = "Melemele Island",
		id = 220,
		baseMap = "city/gate/map/img_mlmld.png",
		chapterType = 3,
		seq = {
			31001,
			31002,
			31003
		},
		starAwardConds = slot1[220],
		starAwardIDs = {
			0,
			0,
			6591
		}
	},
	[221] = {
		name_en = "Trainers Academy",
		ownerId = 1,
		name = "Trainers Academy",
		openLevel = 60,
		res = "GKDT_ptgk3.json",
		name_th = "Trainers Academy",
		id = 221,
		baseMap = "city/gate/map/img_alldqxx.png",
		chapterType = 3,
		seq = {
			31101,
			31102,
			31103,
			31104
		},
		starAwardConds = slot1[221],
		starAwardIDs = {
			0,
			0,
			6601
		}
	},
	[222] = {
		name_en = "Hau'Oli City",
		ownerId = 1,
		name = "Hau'Oli City",
		openLevel = 60,
		res = "GKDT_ptgk4.json",
		name_th = "Hau'Oli City",
		id = 222,
		baseMap = "city/gate/map/img_llajdhz.png",
		chapterType = 3,
		seq = {
			31201,
			31202,
			31203,
			31204
		},
		starAwardConds = slot1[222],
		starAwardIDs = {
			0,
			0,
			6611
		}
	},
	[223] = {
		name_en = "Battle In Mining Area",
		ownerId = 1,
		name = "Battle In Mining Area",
		openLevel = 60,
		res = "GKDT_ptgk5.json",
		name_th = "Battle In Mining Area",
		id = 223,
		baseMap = "city/gate/map/img_dzktq.png",
		chapterType = 3,
		seq = {
			31301,
			31302,
			31303,
			31304
		},
		starAwardConds = slot1[223],
		starAwardIDs = {
			0,
			0,
			6621
		}
	},
	[224] = {
		name_en = "Ecruteak City",
		ownerId = 1,
		name = "Ecruteak City",
		openLevel = 65,
		res = "GKDT_ptgk5.json",
		name_th = "Ecruteak City",
		id = 224,
		baseMap = "city/gate/map/img_yzs.png",
		chapterType = 3,
		seq = {
			31401,
			31402,
			31403,
			31404
		},
		starAwardConds = slot1[224],
		starAwardIDs = {
			0,
			0,
			6631
		}
	},
	[225] = {
		name_en = "Ancient Altar",
		ownerId = 1,
		name = "Ancient Altar",
		openLevel = 65,
		res = "GKDT_ptgk5.json",
		name_th = "Ancient Altar",
		id = 225,
		baseMap = "city/gate/map/img_jt.png",
		chapterType = 3,
		seq = {
			31501,
			31502,
			31503,
			31504
		},
		starAwardConds = slot1[225],
		starAwardIDs = {
			0,
			0,
			6641
		}
	},
	[226] = {
		name_en = "Icy Cold Plains",
		ownerId = 1,
		name = "Icy Cold Plains",
		openLevel = 70,
		res = "GKDT_ptgk5.json",
		name_th = "Icy Cold Plains",
		id = 226,
		baseMap = "city/gate/map/img_by.png",
		chapterType = 3,
		seq = {
			31601,
			31602,
			31603,
			31604
		},
		starAwardConds = slot1[226],
		starAwardIDs = {
			0,
			0,
			6651
		}
	},
	[227] = {
		name_en = "Amusement Park",
		ownerId = 1,
		name = "Amusement Park",
		openLevel = 75,
		res = "GKDT_ptgk5.json",
		name_th = "Amusement Park",
		id = 227,
		baseMap = "city/gate/map/img_yly.png",
		chapterType = 3,
		seq = {
			31701,
			31702,
			31703,
			31704
		},
		starAwardConds = slot1[227],
		starAwardIDs = {
			0,
			0,
			6661
		}
	},
	[228] = {
		name_en = "Breeder Academy",
		ownerId = 1,
		name = "Breeder Academy",
		openLevel = 80,
		res = "GKDT_ptgk5.json",
		name_th = "Breeder Academy",
		id = 228,
		baseMap = "city/gate/map/img_syjxx.png",
		chapterType = 3,
		seq = {
			31801,
			31802,
			31803,
			31804,
			31805
		},
		starAwardConds = slot1[228],
		starAwardIDs = {
			0,
			0,
			6671
		}
	},
	[229] = {
		name_en = "Circus",
		ownerId = 1,
		name = "Circus",
		openLevel = 85,
		res = "GKDT_ptgk5.json",
		name_th = "Circus",
		id = 229,
		baseMap = "city/gate/map/img_mxt.png",
		chapterType = 3,
		seq = {
			31901,
			31902,
			31903,
			31904,
			31905
		},
		starAwardConds = slot1[229],
		starAwardIDs = {
			0,
			0,
			6681
		}
	},
	[230] = {
		name_en = "Shadow Mountain",
		ownerId = 1,
		name = "Shadow Mountain",
		openLevel = 90,
		res = "GKDT_ptgk13.json",
		name_th = "Shadow Mountain",
		id = 230,
		baseMap = "city/gate/map/img_ays.png",
		chapterType = 3,
		seq = {
			32001,
			32002,
			32003,
			32004,
			32005
		},
		starAwardConds = slot1[230],
		starAwardIDs = {
			0,
			0,
			6691
		}
	},
	[231] = {
		name_en = "Aromatherapy City",
		ownerId = 1,
		name = "Aromatherapy City",
		openLevel = 95,
		res = "GKDT_ptgk13.json",
		name_th = "Aromatherapy City",
		id = 231,
		baseMap = "city/gate/map/img_xxs.png",
		chapterType = 3,
		seq = {
			32101,
			32102,
			32103,
			32104,
			32105
		},
		starAwardConds = slot1[231],
		starAwardIDs = {
			0,
			0,
			6701
		}
	},
	[232] = {
		name_en = "Dry Leaves",
		ownerId = 1,
		name = "Dry Leaves",
		openLevel = 100,
		res = "GKDT_ptgk13.json",
		name_th = "Dry Leaves",
		id = 232,
		baseMap = "city/gate/map/img_kys.png",
		chapterType = 3,
		seq = {
			32201,
			32202,
			32203,
			32204,
			32205
		},
		starAwardConds = slot1[232],
		starAwardIDs = {
			0,
			0,
			6711
		}
	},
	[33] = {
		name_en = "Sandgem Town",
		ownerId = 1,
		name = "Sandgem Town",
		heroMapId = 133,
		nightmareMapId = 233,
		openLevel = 105,
		res = "GKDT_ptgk5.json",
		name_th = "Sandgem Town",
		id = 33,
		baseMap = "city/gate/map/img_shz.png",
		chapterType = 1,
		seq = {
			12301,
			12302,
			12303,
			12304,
			12305,
			12306,
			12307,
			12308,
			12309,
			12310
		},
		starAwardConds = slot1[33],
		starAwardIDs = {
			1331,
			1332,
			1333
		}
	},
	[34] = {
		name_en = "Lostlorn Forest",
		ownerId = 1,
		name = "Lostlorn Forest",
		heroMapId = 134,
		nightmareMapId = 234,
		openLevel = 110,
		res = "GKDT_ptgk5.json",
		name_th = "Lostlorn Forest",
		id = 34,
		baseMap = "city/gate/map/img_mssl.png",
		chapterType = 1,
		seq = {
			12401,
			12402,
			12403,
			12404,
			12405,
			12406,
			12407,
			12408,
			12409,
			12410
		},
		starAwardConds = slot1[34],
		starAwardIDs = {
			1341,
			1342,
			1343
		}
	},
	[35] = {
		name_en = "Floccesy Town",
		ownerId = 1,
		name = "Floccesy Town",
		heroMapId = 135,
		nightmareMapId = 235,
		openLevel = 115,
		res = "GKDT_ptgk5.json",
		name_th = "Floccesy Town",
		id = 35,
		baseMap = "city/gate/map/img_fxz.png",
		chapterType = 1,
		seq = {
			12501,
			12502,
			12503,
			12504,
			12505,
			12506,
			12507,
			12508,
			12509,
			12510
		},
		starAwardConds = slot1[35],
		starAwardIDs = {
			1351,
			1352,
			1353
		}
	},
	[36] = {
		name_en = "Lumiose City",
		ownerId = 1,
		name = "Lumiose City",
		heroMapId = 136,
		nightmareMapId = 236,
		openLevel = 120,
		res = "GKDT_ptgk5.json",
		name_th = "Lumiose City",
		id = 36,
		baseMap = "city/gate/map/img_mals.png",
		chapterType = 1,
		seq = {
			12601,
			12602,
			12603,
			12604,
			12605,
			12606,
			12607,
			12608,
			12609,
			12610
		},
		starAwardConds = slot1[36],
		starAwardIDs = {
			1361,
			1362,
			1363
		}
	},
	[37] = {
		name_en = "Snowwind Town",
		ownerId = 1,
		name = "Snowwind Town",
		heroMapId = 137,
		nightmareMapId = 237,
		openLevel = 125,
		res = "GKDT_ptgk5.json",
		name_th = "Snowwind Town",
		id = 37,
		baseMap = "city/gate/map/img_xfz.png",
		chapterType = 1,
		seq = {
			12701,
			12702,
			12703,
			12704,
			12705,
			12706,
			12707,
			12708,
			12709,
			12710
		},
		starAwardConds = slot1[37],
		starAwardIDs = {
			1371,
			1372,
			1373
		}
	},
	[133] = {
		name_en = "Sandgem Town",
		ownerId = 1,
		name = "Sandgem Town",
		openLevel = 105,
		res = "GKDT_ptgk5.json",
		name_th = "Sandgem Town",
		id = 133,
		baseMap = "city/gate/map/img_shz.png",
		chapterType = 2,
		seq = {
			22301,
			22302,
			22303,
			22304,
			22305
		},
		starAwardConds = slot1[133],
		starAwardIDs = {
			0,
			0,
			1721
		}
	},
	[134] = {
		name_en = "Lostlorn Forest",
		ownerId = 1,
		name = "Lostlorn Forest",
		openLevel = 110,
		res = "GKDT_ptgk5.json",
		name_th = "Lostlorn Forest",
		id = 134,
		baseMap = "city/gate/map/img_mssl.png",
		chapterType = 2,
		seq = {
			22401,
			22402,
			22403,
			22404,
			22405
		},
		starAwardConds = slot1[134],
		starAwardIDs = {
			0,
			0,
			1731
		}
	},
	[135] = {
		name_en = "Floccesy Town",
		ownerId = 1,
		name = "Floccesy Town",
		openLevel = 115,
		res = "GKDT_ptgk5.json",
		name_th = "Floccesy Town",
		id = 135,
		baseMap = "city/gate/map/img_fxz.png",
		chapterType = 2,
		seq = {
			22501,
			22502,
			22503,
			22504,
			22505
		},
		starAwardConds = slot1[135],
		starAwardIDs = {
			0,
			0,
			1741
		}
	},
	[136] = {
		name_en = "Lumiose City",
		ownerId = 1,
		name = "Lumiose City",
		openLevel = 120,
		res = "GKDT_ptgk5.json",
		name_th = "Lumiose City",
		id = 136,
		baseMap = "city/gate/map/img_mals.png",
		chapterType = 2,
		seq = {
			22601,
			22602,
			22603,
			22604,
			22605
		},
		starAwardConds = slot1[136],
		starAwardIDs = {
			0,
			0,
			1751
		}
	},
	[137] = {
		name_en = "Snowwind Town",
		ownerId = 1,
		name = "Snowwind Town",
		openLevel = 125,
		res = "GKDT_ptgk5.json",
		name_th = "Snowwind Town",
		id = 137,
		baseMap = "city/gate/map/img_xfz.png",
		chapterType = 2,
		seq = {
			22701,
			22702,
			22703,
			22704,
			22705
		},
		starAwardConds = slot1[137],
		starAwardIDs = {
			0,
			0,
			1761
		}
	},
	[233] = {
		name_en = "Sandgem Town",
		ownerId = 1,
		name = "Sandgem Town",
		openLevel = 105,
		res = "GKDT_ptgk5.json",
		name_th = "Sandgem Town",
		id = 233,
		baseMap = "city/gate/map/img_shz.png",
		chapterType = 3,
		seq = {
			32301,
			32302,
			32303,
			32304,
			32305
		},
		starAwardConds = slot1[233],
		starAwardIDs = {
			0,
			0,
			6721
		}
	},
	[234] = {
		name_en = "Lostlorn Forest",
		ownerId = 1,
		name = "Lostlorn Forest",
		openLevel = 110,
		res = "GKDT_ptgk5.json",
		name_th = "Lostlorn Forest",
		id = 234,
		baseMap = "city/gate/map/img_mssl.png",
		chapterType = 3,
		seq = {
			32401,
			32402,
			32403,
			32404,
			32405
		},
		starAwardConds = slot1[234],
		starAwardIDs = {
			0,
			0,
			6731
		}
	},
	[235] = {
		name_en = "Floccesy Town",
		ownerId = 1,
		name = "Floccesy Town",
		openLevel = 115,
		res = "GKDT_ptgk5.json",
		name_th = "Floccesy Town",
		id = 235,
		baseMap = "city/gate/map/img_fxz.png",
		chapterType = 3,
		seq = {
			32501,
			32502,
			32503,
			32504,
			32505
		},
		starAwardConds = slot1[235],
		starAwardIDs = {
			0,
			0,
			6741
		}
	},
	[236] = {
		name_en = "Lumiose City",
		ownerId = 1,
		name = "Lumiose City",
		openLevel = 120,
		res = "GKDT_ptgk5.json",
		name_th = "Lumiose City",
		id = 236,
		baseMap = "city/gate/map/img_mals.png",
		chapterType = 3,
		seq = {
			32601,
			32602,
			32603,
			32604,
			32605
		},
		starAwardConds = slot1[236],
		starAwardIDs = {
			0,
			0,
			6751
		}
	},
	[237] = {
		name_en = "Snowwind Town",
		ownerId = 1,
		name = "Snowwind Town",
		openLevel = 125,
		res = "GKDT_ptgk5.json",
		name_th = "Snowwind Town",
		id = 237,
		baseMap = "city/gate/map/img_xfz.png",
		chapterType = 3,
		seq = {
			32701,
			32702,
			32703,
			32704,
			32705
		},
		starAwardConds = slot1[237],
		starAwardIDs = {
			0,
			0,
			6761
		}
	},
	__default = {
		__index = {
			name = "",
			name_en = "",
			name_th = "",
			isWorldEnter = false,
			seq = {}
		}
	}
}

return csv.world_map
