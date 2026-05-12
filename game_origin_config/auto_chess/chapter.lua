slot0 = {
	[8] = {
		221
	},
	[9] = {
		100001
	},
	[11] = {
		{
			300001,
			300002,
			300003
		},
		{
			400101,
			400021,
			400022,
			400023,
			400024,
			400025,
			400033
		},
		{
			200002,
			200002,
			200003,
			200004,
			200004,
			200005,
			200006,
			200007
		}
	},
	[12] = {
		100006,
		200008,
		100006,
		0,
		100007,
		0,
		300004,
		100008,
		0,
		100009
	},
	[13] = {
		{
			300005,
			300006,
			300007
		},
		{
			400201,
			400301,
			400021,
			400022,
			400023,
			400024,
			400025,
			400026,
			400027,
			400031,
			400032,
			400033,
			400034
		},
		{
			200002,
			200003,
			200004,
			200005,
			200006,
			200007
		}
	},
	[14] = {
		100010,
		200008,
		0,
		100010,
		200011,
		100012,
		0,
		100010,
		300004,
		100011,
		0,
		100013
	},
	[15] = {
		{
			300008,
			300009,
			300010
		},
		{
			400021,
			400022,
			400023,
			400024,
			400025,
			400026,
			400027,
			400028,
			400029,
			400030,
			400031,
			400032,
			400033,
			400035
		},
		{
			200002,
			200003,
			200004,
			200005,
			200006,
			200007
		}
	},
	[16] = {
		201
	},
	[17] = {
		400015
	},
	[20] = {
		{
			300001,
			300002,
			300003
		},
		{
			400101,
			400021,
			400022,
			400023,
			400024,
			400025,
			400033
		},
		{
			200002,
			200003,
			200004,
			200005,
			200006,
			200007
		}
	}
}
csv.auto_chess.chapter = {
	__size = 45,
	[1001] = {
		id = 1001,
		fake = true,
		must = {
			1001
		}
	},
	[1002] = {
		id = 1002,
		fake = true,
		must = {
			1002
		}
	},
	[1003] = {
		id = 1003,
		fake = true,
		must = {
			1003
		}
	},
	[1004] = {
		id = 1004,
		fake = true,
		must = {
			1004
		}
	},
	[1005] = {
		id = 1005,
		fake = true,
		must = {
			1005
		}
	},
	[11] = {
		id = 11,
		fake = true,
		chooseSkill = true,
		must = {
			114,
			300004,
			200003,
			100010,
			100010,
			100010,
			100010
		}
	},
	[12] = {
		id = 12,
		fake = true,
		must = {
			211
		}
	},
	[13] = {
		id = 13,
		fake = true,
		must = slot0[8]
	},
	[14] = {
		id = 14,
		fake = true,
		must = slot0[9]
	},
	[15] = {
		id = 15,
		bg = "lushi/img_zzq_bg.png",
		must = {
			114,
			100002,
			200008,
			0,
			100004,
			0,
			300004,
			100003,
			0,
			100005
		},
		random = slot0[11]
	},
	[16] = {
		id = 16,
		chooseSkill = true,
		bg = "lushi/img_zzq_bg2.png",
		must = slot0[12],
		random = slot0[13]
	},
	[17] = {
		jump = 113,
		id = 17,
		bg = "lushi/img_zzq_bg3.png",
		must = slot0[14],
		random = slot0[15]
	},
	[18] = {
		id = 18,
		bg = "lushi/img_zzq_bg4.png",
		fake = true,
		must = slot0[8]
	},
	[21] = {
		id = 21,
		fake = true,
		must = slot0[16]
	},
	[22] = {
		id = 22,
		fake = true,
		must = slot0[16]
	},
	[23] = {
		id = 23,
		fake = true,
		must = slot0[17]
	},
	[24] = {
		id = 24,
		fake = true,
		must = slot0[9]
	},
	[25] = {
		id = 25,
		bg = "lushi/img_zzq_bg.png",
		must = {
			100002,
			200008,
			0,
			100004,
			0,
			300004,
			100003,
			0,
			100005
		},
		random = slot0[11]
	},
	[26] = {
		id = 26,
		chooseSkill = true,
		bg = "lushi/img_zzq_bg2.png",
		must = slot0[12],
		random = slot0[13]
	},
	[27] = {
		jump = 113,
		id = 27,
		bg = "lushi/img_zzq_bg3.png",
		must = slot0[14],
		random = slot0[15]
	},
	[28] = {
		id = 28,
		bg = "lushi/img_zzq_bg4.png",
		fake = true,
		must = slot0[8]
	},
	[31] = {
		id = 31,
		fake = true,
		must = slot0[16]
	},
	[32] = {
		id = 32,
		fake = true,
		must = slot0[16]
	},
	[33] = {
		id = 33,
		fake = true,
		must = slot0[17]
	},
	[34] = {
		id = 34,
		fake = true,
		must = slot0[9]
	},
	[35] = {
		id = 35,
		bg = "lushi/img_zzq_bg.png",
		must = {
			100002,
			200009,
			0,
			100004,
			0,
			300004,
			100003,
			0,
			100005
		},
		random = slot0[20]
	},
	[36] = {
		id = 36,
		chooseSkill = true,
		bg = "lushi/img_zzq_bg2.png",
		must = {
			100006,
			200009,
			100006,
			0,
			100007,
			0,
			300004,
			100008,
			0,
			100009
		},
		random = slot0[13]
	},
	[37] = {
		jump = 113,
		id = 37,
		bg = "lushi/img_zzq_bg3.png",
		must = {
			100010,
			200009,
			0,
			100010,
			200011,
			100012,
			0,
			100010,
			300004,
			100011,
			0,
			100013
		},
		random = slot0[15]
	},
	[38] = {
		id = 38,
		bg = "lushi/img_zzq_bg4.png",
		fake = true,
		must = slot0[8]
	},
	[41] = {
		id = 41,
		fake = true,
		must = slot0[16]
	},
	[42] = {
		id = 42,
		fake = true,
		must = slot0[16]
	},
	[43] = {
		id = 43,
		fake = true,
		must = slot0[17]
	},
	[44] = {
		id = 44,
		fake = true,
		must = slot0[9]
	},
	[45] = {
		id = 45,
		bg = "lushi/img_zzq_bg.png",
		must = {
			100002,
			200012,
			0,
			100004,
			0,
			300004,
			100003,
			0,
			100005
		},
		random = slot0[20]
	},
	[46] = {
		id = 46,
		chooseSkill = true,
		bg = "lushi/img_zzq_bg2.png",
		must = {
			100006,
			200012,
			100006,
			0,
			100007,
			0,
			300004,
			100008,
			0,
			100009
		},
		random = slot0[13]
	},
	[47] = {
		jump = 113,
		id = 47,
		bg = "lushi/img_zzq_bg3.png",
		must = {
			100010,
			200012,
			0,
			100010,
			200011,
			100012,
			0,
			100010,
			300004,
			100011,
			0,
			100013
		},
		random = slot0[15]
	},
	[48] = {
		id = 48,
		bg = "lushi/img_zzq_bg4.png",
		fake = true,
		must = slot0[8]
	},
	[51] = {
		id = 51,
		fake = true,
		must = slot0[16]
	},
	[52] = {
		id = 52,
		fake = true,
		must = slot0[16]
	},
	[53] = {
		id = 53,
		fake = true,
		must = slot0[17]
	},
	[54] = {
		id = 54,
		fake = true,
		must = slot0[9]
	},
	[55] = {
		id = 55,
		bg = "lushi/img_zzq_bg.png",
		must = {
			100002,
			200014,
			0,
			100004,
			0,
			300004,
			100003,
			0,
			100005
		},
		random = slot0[20]
	},
	[56] = {
		id = 56,
		chooseSkill = true,
		bg = "lushi/img_zzq_bg2.png",
		must = {
			100006,
			200014,
			100006,
			0,
			100007,
			0,
			300004,
			100008,
			0,
			100009
		},
		random = slot0[13]
	},
	[57] = {
		jump = 113,
		id = 57,
		bg = "lushi/img_zzq_bg3.png",
		must = {
			100010,
			200014,
			0,
			100010,
			200011,
			100012,
			0,
			100010,
			300004,
			100011,
			0,
			100013
		},
		random = slot0[15]
	},
	[58] = {
		id = 58,
		bg = "lushi/img_zzq_bg4.png",
		fake = true,
		must = slot0[8]
	},
	__default = {
		__index = {
			jump = 112,
			fake = false,
			chooseSkill = false,
			bg = "",
			must = {},
			random = {}
		}
	}
}

return csv.auto_chess.chapter
