slot0 = {
	__size = 5,
	[8] = {
		gold = 200000,
		rmb = 50,
		[6394.0] = 10,
		__size = 3
	},
	[9] = {
		[503.0] = 1,
		gold = 200000,
		[6394.0] = 5,
		__size = 3
	},
	[10] = {
		gold = 200000,
		__size = 3,
		[6394.0] = 5,
		[520.0] = 1
	},
	[11] = {
		gold = 200000,
		[519.0] = 1,
		[6394.0] = 5,
		__size = 3
	},
	[12] = {
		[527.0] = 1,
		gold = 200000,
		[6394.0] = 5,
		__size = 3
	}
}
slot1 = {
	[217] = slot0[8],
	[203] = slot0[8],
	[205] = slot0[10],
	[204] = slot0[9],
	[210] = slot0[8],
	[206] = slot0[11],
	[211] = slot0[9],
	[214] = slot0[12],
	[207] = slot0[12],
	[212] = slot0[10],
	[220] = slot0[8],
	[223] = slot0[8],
	[213] = slot0[11]
}
csv.yunying.volleyball_tasks = {
	__size = 28,
	[101] = {
		targetType = 101,
		title_en = "Daily wins",
		huodongID = 1000,
		targetArg = 1,
		id = 101,
		title = "Daily wins",
		title_th = "ชัยชนะรายวัน",
		award = {
			__size = 3,
			[951.0] = 3,
			[6394.0] = 5,
			rmb = 10
		}
	},
	[102] = {
		targetType = 101,
		title_en = "Daily wins",
		huodongID = 1000,
		targetArg = 3,
		id = 102,
		title = "Daily wins",
		title_th = "ชัยชนะรายวัน",
		award = {
			[5000.0] = 10,
			rmb = 10,
			[6394.0] = 5,
			__size = 3
		}
	},
	[103] = {
		targetType = 102,
		title_en = "Daily score",
		huodongID = 1000,
		targetArg = 10,
		id = 103,
		title = "Daily score",
		title_th = "คะแนนรายวัน",
		award = {
			__size = 3,
			rmb = 10,
			[6394.0] = 5,
			[930.0] = 10
		}
	},
	[104] = {
		targetType = 103,
		title_en = "Number of games played daily",
		huodongID = 1000,
		targetArg = 3,
		id = 104,
		title = "Number of games played daily",
		title_th = "จำนวนเกมที่เล่นทุกวัน",
		award = {
			__size = 3,
			rmb = 10,
			[901.0] = 10,
			[6394.0] = 5
		}
	},
	[201] = {
		targetArg = 5,
		targetType = 201,
		type = 2,
		title = "Player wins",
		title_th = "ผู้เล่นชนะ",
		title_en = "Player wins",
		huodongID = 1000,
		id = 201,
		award = {
			gold = 200000,
			__size = 3,
			[6394.0] = 5,
			[502.0] = 2
		}
	},
	[202] = {
		targetArg = 10,
		targetType = 201,
		type = 2,
		title = "Player wins",
		title_th = "ผู้เล่นชนะ",
		title_en = "Player wins",
		huodongID = 1000,
		id = 202,
		award = {
			gold = 200000,
			__size = 3,
			[6394.0] = 5,
			[521.0] = 2
		}
	},
	[203] = {
		targetArg = 20,
		targetType = 201,
		type = 2,
		title = "Player wins",
		title_th = "ผู้เล่นชนะ",
		title_en = "Player wins",
		huodongID = 1000,
		id = 203,
		award = slot1[203]
	},
	[204] = {
		type = 2,
		targetArg = 1,
		targetArg2 = 11852,
		targetType = 202,
		title = "Defeat Glalie",
		title_th = "ปราบ Glalie",
		title_en = "Defeat Glalie",
		huodongID = 1000,
		id = 204,
		award = slot1[204]
	},
	[205] = {
		type = 2,
		targetArg = 1,
		targetArg2 = 92,
		targetType = 202,
		title = "Defeat Pikachu",
		title_th = "ปราบปิกาจู",
		title_en = "Defeat Pikachu",
		huodongID = 1000,
		id = 205,
		award = slot1[205]
	},
	[206] = {
		type = 2,
		targetArg = 1,
		targetArg2 = 221,
		targetType = 202,
		title = "Defeat Psyduck",
		title_th = "ปราบ Psyduck",
		title_en = "Defeat Psyduck",
		huodongID = 1000,
		id = 206,
		award = slot1[206]
	},
	[207] = {
		type = 2,
		targetArg = 1,
		targetArg2 = 2242,
		targetType = 202,
		title = "Defeat Lucario",
		title_th = "เอาชนะลูคาริโอ",
		title_en = "Defeat Lucario",
		huodongID = 1000,
		id = 207,
		award = slot1[207]
	},
	[208] = {
		targetArg = 3,
		targetType = 203,
		type = 2,
		title = "Out of bounds by mistake",
		title_th = "ออกนอกขอบเขตโดยไม่ได้ตั้งใจ",
		title_en = "Out of bounds by mistake",
		huodongID = 1000,
		id = 208,
		award = {
			gold = 200000,
			[6394.0] = 5,
			[901.0] = 10,
			__size = 3
		}
	},
	[209] = {
		targetArg = 6,
		targetType = 203,
		type = 2,
		title = "Out of bounds by mistake",
		title_th = "ออกนอกขอบเขตโดยไม่ได้ตั้งใจ",
		title_en = "Out of bounds by mistake",
		huodongID = 1000,
		id = 209,
		award = {
			gold = 200000,
			[902.0] = 10,
			[6394.0] = 5,
			__size = 3
		}
	},
	[210] = {
		targetArg = 10,
		targetType = 203,
		type = 2,
		title = "Out of bounds by mistake",
		title_th = "ออกนอกขอบเขตโดยไม่ได้ตั้งใจ",
		title_en = "Out of bounds by mistake",
		huodongID = 1000,
		id = 210,
		award = slot1[210]
	},
	[211] = {
		type = 2,
		targetArg = 1,
		targetArg2 = 92,
		targetType = 204,
		title = "Win by using Pikachu",
		title_th = "ชนะโดยใช้ปิกาจู",
		title_en = "Win by using Pikachu",
		huodongID = 1000,
		id = 211,
		award = slot1[211]
	},
	[212] = {
		type = 2,
		targetArg = 1,
		targetArg2 = 21,
		targetType = 204,
		title = "Win by using Squirtle",
		title_th = "ชนะโดยใช้ Squirtle",
		title_en = "Win by using Squirtle",
		huodongID = 1000,
		id = 212,
		award = slot1[212]
	},
	[213] = {
		type = 2,
		targetArg = 1,
		targetArg2 = 893,
		targetType = 204,
		title = "Win by using Azumarill",
		title_th = "ชนะโดยใช้ Azumarill",
		title_en = "Win by using Azumarill",
		huodongID = 1000,
		id = 213,
		award = slot1[213]
	},
	[214] = {
		type = 2,
		targetArg = 1,
		targetArg2 = 502,
		targetType = 204,
		title = "Win by using Chansey",
		title_th = "ชนะโดยใช้ Chansey",
		title_en = "Win by using Chansey",
		huodongID = 1000,
		id = 214,
		award = slot1[214]
	},
	[215] = {
		targetArg = 10,
		targetType = 205,
		type = 2,
		title = "Participated games",
		title_th = "เกมส์ที่เข้าร่วม",
		title_en = "Participated games",
		huodongID = 1000,
		id = 215,
		award = {
			[5000.0] = 30,
			gold = 200000,
			[6394.0] = 5,
			__size = 3
		}
	},
	[216] = {
		targetArg = 20,
		targetType = 205,
		type = 2,
		title = "Participated games",
		title_th = "เกมส์ที่เข้าร่วม",
		title_en = "Participated games",
		huodongID = 1000,
		id = 216,
		award = {
			gold = 200000,
			__size = 3,
			[6394.0] = 5,
			[930.0] = 30
		}
	},
	[217] = {
		targetArg = 40,
		targetType = 205,
		type = 2,
		title = "Participated games",
		title_th = "เกมส์ที่เข้าร่วม",
		title_en = "Participated games",
		huodongID = 1000,
		id = 217,
		award = slot1[217]
	},
	[218] = {
		targetArg = 3,
		targetType = 206,
		type = 2,
		title = "Use skills to slow down enemies",
		title_th = "ใช้ทักษะเพื่อทำให้ศัตรูช้าลง",
		title_en = "Use skills to slow down enemies",
		huodongID = 1000,
		id = 218,
		award = {
			gold = 200000,
			__size = 3,
			[6394.0] = 5,
			[850.0] = 200
		}
	},
	[219] = {
		targetArg = 6,
		targetType = 206,
		type = 2,
		title = "Use skills to slow down enemies",
		title_th = "ใช้ทักษะเพื่อทำให้ศัตรูช้าลง",
		title_en = "Use skills to slow down enemies",
		huodongID = 1000,
		id = 219,
		award = {
			gold = 200000,
			__size = 3,
			[6394.0] = 5,
			[851.0] = 100
		}
	},
	[220] = {
		targetArg = 10,
		targetType = 206,
		type = 2,
		title = "Use skills to slow down enemies",
		title_th = "ใช้ทักษะเพื่อทำให้ศัตรูช้าลง",
		title_en = "Use skills to slow down enemies",
		huodongID = 1000,
		id = 220,
		award = slot1[220]
	},
	[221] = {
		targetArg = 3,
		targetType = 207,
		type = 2,
		title = "Use skills to defeat opponents",
		title_th = "ใช้ทักษะเพื่อเอาชนะคู่ต่อสู้",
		title_en = "Use skills to defeat opponents",
		huodongID = 1000,
		id = 221,
		award = {
			gold = 200000,
			[451.0] = 100,
			[6394.0] = 5,
			__size = 3
		}
	},
	[222] = {
		targetArg = 6,
		targetType = 207,
		type = 2,
		title = "Use skills to defeat opponents",
		title_th = "ใช้ทักษะเพื่อเอาชนะคู่ต่อสู้",
		title_en = "Use skills to defeat opponents",
		huodongID = 1000,
		id = 222,
		award = {
			[452.0] = 50,
			gold = 200000,
			[6394.0] = 5,
			__size = 3
		}
	},
	[223] = {
		targetArg = 10,
		targetType = 207,
		type = 2,
		title = "Use skills to defeat opponents",
		title_th = "ใช้ทักษะเพื่อเอาชนะคู่ต่อสู้",
		title_en = "Use skills to defeat opponents",
		huodongID = 1000,
		id = 223,
		award = slot1[223]
	},
	[224] = {
		targetArg = 23,
		targetType = 208,
		type = 2,
		title = "Complete all cumulative tasks",
		title_th = "ทำภารกิจสะสมทั้งหมดให้เสร็จสิ้น",
		title_en = "Complete all cumulative tasks",
		huodongID = 1000,
		id = 224,
		award = {
			gold = 200000,
			rmb = 100,
			[6394.0] = 15,
			__size = 3
		}
	},
	__default = {
		__index = {
			type = 1,
			targetType = 1,
			targetArg2 = 0,
			targetArg = 0,
			title = "",
			title_th = "404",
			title_en = "404",
			huodongID = 0,
			award = {
				__size = 0
			}
		}
	}
}

return csv.yunying.volleyball_tasks
