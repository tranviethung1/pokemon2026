slot0 = {
	__size = 2,
	[2] = {
		1
	},
	[10] = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		0.9,
		0.9,
		0.8,
		0.7,
		0.6,
		0.5,
		0.3,
		0.2,
		0.1
	}
}
slot1 = {
	[11] = slot0[10],
	[10] = slot0[10],
	[13] = slot0[10],
	[12] = slot0[10],
	[15] = slot0[10],
	[14] = slot0[10],
	[17] = slot0[10],
	[16] = slot0[10],
	[19] = slot0[10],
	[18] = slot0[10],
	default = slot0[2],
	[7] = slot0[10],
	[9] = slot0[10],
	[8] = slot0[10]
}
slot2 = {
	[11] = slot0[10],
	[10] = slot0[10],
	[13] = slot0[10],
	[12] = slot0[10],
	[15] = slot0[10],
	[14] = slot0[10],
	[17] = slot0[10],
	[16] = slot0[10],
	[19] = slot0[10],
	[18] = slot0[10],
	default = slot0[2],
	[7] = slot0[10],
	[9] = slot0[10],
	[8] = slot0[10]
}
slot3 = {
	[11] = slot0[10],
	[10] = slot0[10],
	[13] = slot0[10],
	[12] = slot0[10],
	[15] = slot0[10],
	[14] = slot0[10],
	[17] = slot0[10],
	[16] = slot0[10],
	[19] = slot0[10],
	[18] = slot0[10],
	default = slot0[2],
	[7] = slot0[10],
	[9] = slot0[10],
	[8] = slot0[10]
}
slot4 = {
	[11] = slot0[10],
	[10] = slot0[10],
	[13] = slot0[10],
	[12] = slot0[10],
	[15] = slot0[10],
	[14] = slot0[10],
	[17] = slot0[10],
	[16] = slot0[10],
	[19] = slot0[10],
	[18] = slot0[10],
	default = slot0[2],
	[7] = slot0[10],
	[9] = slot0[10],
	[8] = slot0[10]
}
csv.cross.online_fight.newbie_protect = {
	{
		unlimitedNewbieWinN = 1.8,
		unlimitedNewbieFailT = 20,
		limitedNewbieWinT = 20,
		unlimitedNewbieFailN = 0,
		limitedNewbieWinN = 1.8,
		unlimitedNewbieWinT = 20,
		limitedNewbieFailT = 20,
		id = 1,
		limitedNewbieFailN = 0,
		range = {
			0,
			51
		}
	},
	{
		unlimitedNewbieWinN = 1.8,
		unlimitedNewbieFailT = 15,
		limitedNewbieWinT = 15,
		unlimitedNewbieFailN = 0,
		limitedNewbieWinN = 1.8,
		unlimitedNewbieWinT = 15,
		limitedNewbieFailT = 15,
		id = 2,
		limitedNewbieFailN = 0,
		range = {
			51,
			101
		}
	},
	{
		unlimitedNewbieWinN = 1.8,
		unlimitedNewbieFailT = 10,
		limitedNewbieWinT = 10,
		unlimitedNewbieFailN = 0,
		limitedNewbieWinN = 1.8,
		unlimitedNewbieWinT = 10,
		limitedNewbieFailT = 10,
		id = 3,
		limitedNewbieFailN = 0,
		range = {
			101,
			201
		}
	},
	{
		unlimitedNewbieWinN = 1.8,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.2,
		limitedNewbieWinN = 1.8,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 4,
		limitedNewbieFailN = 0.2,
		range = {
			201,
			301
		}
	},
	{
		unlimitedNewbieWinN = 1.65,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.3,
		limitedNewbieWinN = 1.65,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 5,
		limitedNewbieFailN = 0.3,
		range = {
			301,
			401
		}
	},
	{
		unlimitedNewbieWinN = 1.5,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.35,
		limitedNewbieWinN = 1.5,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 6,
		limitedNewbieFailN = 0.4,
		range = {
			401,
			501
		}
	},
	{
		unlimitedNewbieWinN = 1.5,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.4,
		limitedNewbieWinN = 1.5,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 7,
		limitedNewbieFailN = 0.4,
		range = {
			501,
			601
		},
		unlimitedRepeatMatchWinFix = slot1[7],
		unlimitedRepeatMatchFailFix = slot2[7],
		limitedRepeatMatchWinFix = slot3[7],
		limitedRepeatMatchFailFix = slot4[7]
	},
	{
		unlimitedNewbieWinN = 1.4,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.45,
		limitedNewbieWinN = 1.4,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 8,
		limitedNewbieFailN = 0.5,
		range = {
			601,
			701
		},
		unlimitedRepeatMatchWinFix = slot1[8],
		unlimitedRepeatMatchFailFix = slot2[8],
		limitedRepeatMatchWinFix = slot3[8],
		limitedRepeatMatchFailFix = slot4[8]
	},
	{
		unlimitedNewbieWinN = 1.4,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.5,
		limitedNewbieWinN = 1.4,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 9,
		limitedNewbieFailN = 0.5,
		range = {
			701,
			851
		},
		unlimitedRepeatMatchWinFix = slot1[9],
		unlimitedRepeatMatchFailFix = slot2[9],
		limitedRepeatMatchWinFix = slot3[9],
		limitedRepeatMatchFailFix = slot4[9]
	},
	{
		unlimitedNewbieWinN = 1.35,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.55,
		limitedNewbieWinN = 1.35,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 10,
		limitedNewbieFailN = 0.6,
		range = {
			851,
			1001
		},
		unlimitedRepeatMatchWinFix = slot1[10],
		unlimitedRepeatMatchFailFix = slot2[10],
		limitedRepeatMatchWinFix = slot3[10],
		limitedRepeatMatchFailFix = slot4[10]
	},
	{
		unlimitedNewbieWinN = 1.35,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.55,
		limitedNewbieWinN = 1.3,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 11,
		limitedNewbieFailN = 0.6,
		range = {
			1001,
			1151
		},
		unlimitedRepeatMatchWinFix = slot1[11],
		unlimitedRepeatMatchFailFix = slot2[11],
		limitedRepeatMatchWinFix = slot3[11],
		limitedRepeatMatchFailFix = slot4[11]
	},
	{
		unlimitedNewbieWinN = 1.3,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.6,
		limitedNewbieWinN = 1.3,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 12,
		limitedNewbieFailN = 0.6,
		range = {
			1151,
			1351
		},
		unlimitedRepeatMatchWinFix = slot1[12],
		unlimitedRepeatMatchFailFix = slot2[12],
		limitedRepeatMatchWinFix = slot3[12],
		limitedRepeatMatchFailFix = slot4[12]
	},
	{
		unlimitedNewbieWinN = 1.3,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.6,
		limitedNewbieWinN = 1.25,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 13,
		limitedNewbieFailN = 0.7,
		range = {
			1351,
			1551
		},
		unlimitedRepeatMatchWinFix = slot1[13],
		unlimitedRepeatMatchFailFix = slot2[13],
		limitedRepeatMatchWinFix = slot3[13],
		limitedRepeatMatchFailFix = slot4[13]
	},
	{
		unlimitedNewbieWinN = 1.25,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.65,
		limitedNewbieWinN = 1.25,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 14,
		limitedNewbieFailN = 0.7,
		range = {
			1551,
			1751
		},
		unlimitedRepeatMatchWinFix = slot1[14],
		unlimitedRepeatMatchFailFix = slot2[14],
		limitedRepeatMatchWinFix = slot3[14],
		limitedRepeatMatchFailFix = slot4[14]
	},
	{
		unlimitedNewbieWinN = 1.25,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.7,
		limitedNewbieWinN = 1.25,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 15,
		limitedNewbieFailN = 0.7,
		range = {
			1751,
			2001
		},
		unlimitedRepeatMatchWinFix = slot1[15],
		unlimitedRepeatMatchFailFix = slot2[15],
		limitedRepeatMatchWinFix = slot3[15],
		limitedRepeatMatchFailFix = slot4[15]
	},
	{
		unlimitedNewbieWinN = 1.2,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.75,
		limitedNewbieWinN = 1.2,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 16,
		range = {
			2001,
			2251
		},
		unlimitedRepeatMatchWinFix = slot1[16],
		unlimitedRepeatMatchFailFix = slot2[16],
		limitedRepeatMatchWinFix = slot3[16],
		limitedRepeatMatchFailFix = slot4[16]
	},
	{
		unlimitedNewbieWinN = 1.2,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		limitedNewbieWinN = 1.2,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 17,
		range = {
			2251,
			2501
		},
		unlimitedRepeatMatchWinFix = slot1[17],
		unlimitedRepeatMatchFailFix = slot2[17],
		limitedRepeatMatchWinFix = slot3[17],
		limitedRepeatMatchFailFix = slot4[17]
	},
	{
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 0.9,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 18,
		limitedNewbieFailN = 0.9,
		range = {
			2501,
			2801
		},
		unlimitedRepeatMatchWinFix = slot1[18],
		unlimitedRepeatMatchFailFix = slot2[18],
		limitedRepeatMatchWinFix = slot3[18],
		limitedRepeatMatchFailFix = slot4[18]
	},
	{
		unlimitedNewbieWinN = 1,
		unlimitedNewbieFailT = 0,
		limitedNewbieWinT = 0,
		unlimitedNewbieFailN = 1,
		limitedNewbieWinN = 1,
		unlimitedNewbieWinT = 0,
		limitedNewbieFailT = 0,
		id = 19,
		limitedNewbieFailN = 1,
		range = {
			2801,
			99999
		},
		unlimitedRepeatMatchWinFix = slot1[19],
		unlimitedRepeatMatchFailFix = slot2[19],
		limitedRepeatMatchWinFix = slot3[19],
		limitedRepeatMatchFailFix = slot4[19]
	},
	__size = 19,
	__default = {
		__index = {
			unlimitedNewbieWinN = 1.1,
			unlimitedNewbieFailT = 0.1,
			limitedNewbieWinT = 0.1,
			unlimitedNewbieFailN = 0.8,
			limitedNewbieWinN = 1.1,
			unlimitedNewbieWinT = 0.1,
			limitedNewbieFailT = 0.1,
			limitedNewbieFailN = 0.8,
			range = {},
			unlimitedRepeatMatchWinFix = slot1.default,
			unlimitedRepeatMatchFailFix = slot2.default,
			limitedRepeatMatchWinFix = slot3.default,
			limitedRepeatMatchFailFix = slot4.default
		}
	}
}

return csv.cross.online_fight.newbie_protect
