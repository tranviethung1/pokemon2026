slot0 = {
	__size = 3,
	[3] = {
		coin3 = 20,
		gold = 5000,
		__size = 2
	},
	[4] = {
		coin3 = 50,
		gold = 20000,
		__size = 2
	},
	[5] = {
		coin3 = 200,
		gold = 50000,
		__size = 2
	}
}
slot1 = {
	slot0[3],
	slot0[3],
	[3] = slot0[3],
	[5] = slot0[4],
	[4] = slot0[4],
	[7] = slot0[5],
	[6] = slot0[5],
	[9] = slot0[4],
	[8] = slot0[5]
}
csv.union.union_task = {
	{
		targetType = 20,
		desc_th = "ใช้ 200,000 เหรียญ",
		userType = 1,
		targetArg = 200000,
		desc_en = "Spend 200000 coins",
		sortID = 10,
		desc = "Spend 200000 coins",
		id = 1,
		contrib = 30,
		desc_vn = "Gaste 200.000 moedas",
		targetDisplay = "200000",
		award = slot1[1]
	},
	{
		targetType = 56,
		desc_th = "เร่งการฝึกโปเกมอนของสมาชิกสหภาพ 3 ครั้ง",
		userType = 1,
		targetArg = 3,
		desc_en = "Accelerate a union member's Pokémon training 3 times",
		sortID = 11,
		desc = "Accelerate a union member's Pokémon training 3 times",
		id = 2,
		contrib = 30,
		desc_vn = "Acelere o treinamento Pokémon de um membro do sindicato 3 vezes",
		targetDisplay = "3",
		award = slot1[2]
	},
	{
		targetType = 55,
		desc_th = "บริจาคให้สหภาพ 5 ครั้ง",
		userType = 1,
		targetArg = 5,
		desc_en = "Donate to union 5 times",
		sortID = 12,
		desc = "Donate to union 5 times",
		id = 3,
		contrib = 30,
		desc_vn = "Doe para o sindicato 5 vezes",
		targetDisplay = "5",
		award = slot1[3]
	},
	{
		targetType = 59,
		desc_th = "ท้าทายดันเจี้ยนดันเจี้ยนทั้งหมด 12 ครั้ง",
		userType = 1,
		type = 2,
		targetArg = 12,
		desc_en = "Challenge union Dungeon 12 times in total",
		desc = "Challenge union Dungeon 12 times in total",
		sortID = 102,
		id = 4,
		contrib = 200,
		desc_vn = "Desafie a masmorra da união 12 vezes no total",
		targetDisplay = "12",
		award = slot1[4]
	},
	{
		targetType = 28,
		desc_th = "ใช้พลังงานทั้งหมด 1,500 พลังงาน",
		userType = 1,
		type = 2,
		targetArg = 1500,
		desc_en = "Consumes 1,500 energy in total",
		desc = "Consumes 1,500 energy in total",
		sortID = 103,
		id = 5,
		contrib = 200,
		desc_vn = "Consome 1.500 energia no total",
		targetDisplay = "1500",
		award = slot1[5]
	},
	{
		targetType = 75,
		desc_th = "สมาชิกทุกคนได้รับคะแนนผลงานรวม 7,500 คะแนน",
		userType = 2,
		type = 2,
		targetArg = 7500,
		desc_en = "All members achieve a total of 7,500 contribution points",
		desc = "All members achieve a total of 7,500 contribution points",
		sortID = 201,
		id = 6,
		contrib = 1000,
		desc_vn = "Todos os membros atingem um total de 7.500 pontos de contribuição",
		targetDisplay = "7500",
		award = slot1[6]
	},
	{
		targetType = 21,
		desc_th = "สมาชิกทั้งหมดใช้จ่าย 50,000 เพชร",
		userType = 2,
		type = 2,
		targetArg = 50000,
		desc_en = "All members spend 50,000 diamonds in total",
		desc = "All members spend 50,000 diamonds in total",
		sortID = 202,
		id = 7,
		contrib = 1000,
		desc_vn = "Todos os membros gastam 50.000 diamantes no total",
		targetDisplay = "50000",
		award = slot1[7]
	},
	{
		targetType = 59,
		desc_th = "Challenge union Dungeon รวม 200 ครั้ง",
		userType = 2,
		type = 2,
		targetArg = 200,
		desc_en = "Challenge union Dungeon a total of 200 times",
		desc = "Challenge union Dungeon a total of 200 times",
		sortID = 203,
		id = 8,
		contrib = 1000,
		desc_vn = "Desafie a masmorra da união um total de 200 vezes",
		targetDisplay = "200",
		award = slot1[8]
	},
	{
		targetType = 98,
		desc_th = "เศษของขวัญที่ Wishing Center ทั้งหมด 10 ครั้ง",
		userType = 1,
		type = 2,
		targetArg = 10,
		desc_en = "Gift shards at Wishing Center 10 times in total",
		desc = "Gift shards at Wishing Center 10 times in total",
		sortID = 101,
		id = 9,
		contrib = 200,
		desc_vn = "Fragmentos de presente no Wishing Center 10 vezes no total",
		targetDisplay = "10",
		award = slot1[9]
	},
	__size = 9,
	__default = {
		__index = {
			desc_th = "",
			targetType = 1,
			type = 1,
			desc_en = "",
			sortID = 999,
			desc = "",
			contrib = 1,
			desc_vn = "",
			targetDisplay = "",
			languages = {
				"cn",
				"tw",
				"en",
				"vn",
				"kr"
			},
			award = {
				__size = 0
			}
		}
	}
}

return csv.union.union_task
