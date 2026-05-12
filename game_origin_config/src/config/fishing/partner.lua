slot0 = {
	__size = 1,
	[3] = {
		__size = 1,
		rmb = 300
	}
}
slot1 = {
	[3] = slot0[3],
	[2] = slot0[3],
	[4] = slot0[3]
}
csv.fishing.partner = {
	{
		name_en = "Psyduck",
		name = "Psyduck",
		unitId = 221,
		name_pt = "Psyduck",
		desc_en = "Dorky little cutie",
		desc_th = "Dorky น้อยน่ารัก",
		desc = "Dorky little cutie",
		scale = 1.4,
		needLv = 3,
		id = 1,
		desc_vn = "Docinho fofo",
		cost = {
			gold = 500000,
			__size = 1
		}
	},
	{
		name_en = "Pikachu",
		name = "Pikachu",
		unitId = 92,
		name_pt = "Pikachu",
		desc_en = "Do not discharge electricity into water",
		desc_th = "ห้ามปล่อยไฟฟ้าลงน้ำ",
		desc = "Do not discharge electricity into water",
		scale = 1.4,
		needLv = 5,
		id = 2,
		desc_vn = "Não descarregue eletricidade na água",
		cost = slot1[2]
	},
	{
		name_en = "Bulbasaur",
		name = "Bulbasaur",
		unitId = 1,
		name_pt = "Bulbasaur",
		desc_en = "Maybe could help spread some seeds as bait?",
		desc_th = "อาจช่วยกระจายเมล็ดพืชเป็นเหยื่อได้?",
		desc = "Maybe could help spread some seeds as bait?",
		scale = 1.4,
		needLv = 7,
		id = 3,
		desc_vn = "Talvez pudesse ajudar a espalhar algumas sementes como isca?",
		cost = slot1[3]
	},
	{
		name_en = "Squirtle",
		name = "Squirtle",
		unitId = 21,
		name_pt = "Squirtle",
		desc_en = "Would it be faster to let it catch fish?",
		desc_th = "ปล่อยให้จับปลาเร็วกว่านี้ไหม?",
		desc = "Would it be faster to let it catch fish?",
		scale = 1.4,
		needLv = 9,
		id = 4,
		desc_vn = "Seria mais rápido deixá-lo pegar peixes?",
		cost = slot1[4]
	},
	__size = 4,
	__default = {
		__index = {
			name_en = "",
			actMode = 0,
			unitId = 0,
			name_pt = "",
			desc_en = "",
			desc_th = "",
			desc = "",
			spcialEffect = "",
			needLv = 0,
			spcialEffectDesc = "",
			actRate = 0,
			name = "",
			scale = 1,
			desc_vn = "",
			cost = {
				__size = 0
			}
		}
	}
}

return csv.fishing.partner
