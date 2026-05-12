slot0 = {
	__size = 5,
	[2] = {
		__size = 1,
		[453.0] = 50
	},
	[3] = {
		__size = 1,
		[453.0] = 120
	},
	[4] = {
		__size = 1,
		[453.0] = 150
	},
	[5] = {
		__size = 1,
		[453.0] = 200
	},
	[6] = {
		__size = 1,
		[453.0] = 260
	}
}
slot1 = {
	slot0[2],
	slot0[2],
	[11] = slot0[5],
	[10] = slot0[4],
	[13] = slot0[6],
	[12] = slot0[5],
	[14] = slot0[6],
	[3] = slot0[2],
	[5] = slot0[2],
	[4] = slot0[2],
	[7] = slot0[3],
	[9] = slot0[4],
	[8] = slot0[3]
}
csv.trainer.attr_skills = {
	{
		name = "HP",
		name_en = "HP",
		name_pt = "HP",
		attrType1 = 1,
		trainerLevel = 12,
		name_vn = "HP",
		id = 1,
		levelMax = 200,
		attrValue = "260",
		upCost = slot1[1]
	},
	{
		name = "P.ATK",
		name_en = "P.ATK",
		name_pt = "P.ATK",
		attrType1 = 7,
		trainerLevel = 12,
		name_vn = "P.ATK",
		id = 2,
		levelMax = 200,
		attrValue = "96",
		upCost = slot1[2]
	},
	{
		name = "SP. ATK",
		name_en = "SP. ATK",
		name_pt = "SP. ATK",
		attrType1 = 8,
		trainerLevel = 12,
		name_vn = "SP. ATK",
		id = 3,
		levelMax = 200,
		attrValue = "96",
		upCost = slot1[3]
	},
	{
		name = "P.DEF",
		name_en = "P.DEF",
		name_pt = "P.DEF",
		attrType1 = 9,
		trainerLevel = 12,
		name_vn = "P.DEF",
		id = 4,
		levelMax = 200,
		attrValue = "38",
		upCost = slot1[4]
	},
	{
		name = "SP.DEF",
		name_en = "SP.DEF",
		name_pt = "SP.DEF",
		attrType1 = 10,
		trainerLevel = 12,
		name_vn = "SP.DEF",
		id = 5,
		levelMax = 200,
		attrValue = "38",
		upCost = slot1[5]
	},
	__size = 13,
	[7] = {
		name = "Critical hit",
		name_en = "Critical hit",
		totalAttrLevel = 150,
		name_pt = "Critical hit",
		attrType1 = 14,
		trainerLevel = 12,
		name_vn = "Critical hit",
		id = 7,
		levelMax = 50,
		attrValue = "10",
		upCost = slot1[7]
	},
	[8] = {
		name = "CRI RES",
		name_en = "CRI RES",
		totalAttrLevel = 150,
		name_pt = "CRI RES",
		attrType1 = 16,
		trainerLevel = 12,
		name_vn = "CRI RES",
		id = 8,
		levelMax = 50,
		attrValue = "10",
		upCost = slot1[8]
	},
	[9] = {
		name = "PVP ATK bonus",
		name_en = "PVP ATK bonus",
		totalAttrLevel = 200,
		name_pt = "PVP ATK bonus",
		attrType1 = 92,
		trainerLevel = 12,
		name_vn = "PVP ATK bonus",
		id = 9,
		levelMax = 50,
		attrValue = "10",
		upCost = slot1[9]
	},
	[10] = {
		name = "PVP DMG reduction",
		name_en = "PVP DMG reduction",
		totalAttrLevel = 200,
		name_pt = "PVP DMG reduction",
		attrType1 = 93,
		trainerLevel = 12,
		name_vn = "PVP DMG reduction",
		id = 10,
		levelMax = 50,
		attrValue = "10",
		upCost = slot1[10]
	},
	[11] = {
		name = "Block Rate",
		name_en = "Block Rate",
		totalAttrLevel = 480,
		name_pt = "Block Rate",
		attrType1 = 17,
		trainerLevel = 12,
		name_vn = "Block Rate",
		id = 11,
		levelMax = 50,
		attrValue = "10",
		upCost = slot1[11]
	},
	[12] = {
		name = "Block Break Rate",
		name_en = "Block Break Rate",
		totalAttrLevel = 480,
		name_pt = "Block Break Rate",
		attrType1 = 18,
		trainerLevel = 12,
		name_vn = "Block Break Rate",
		id = 12,
		levelMax = 50,
		attrValue = "10",
		upCost = slot1[12]
	},
	[13] = {
		name = "Ult Skill DMG",
		name_en = "Ult Skill DMG",
		totalAttrLevel = 720,
		name_pt = "Ult Skill DMG",
		attrType1 = 24,
		trainerLevel = 12,
		name_vn = "Ult Skill DMG",
		id = 13,
		levelMax = 50,
		attrValue = "10",
		upCost = slot1[13]
	},
	[14] = {
		name = "Ult Skill RES",
		name_en = "Ult Skill RES",
		totalAttrLevel = 720,
		name_pt = "Ult Skill RES",
		attrType1 = 25,
		trainerLevel = 12,
		name_vn = "Ult Skill RES",
		id = 14,
		levelMax = 50,
		attrValue = "10",
		upCost = slot1[14]
	},
	__default = {
		__index = {
			icon = "",
			name = "",
			trainerLevel = 1,
			totalAttrLevel = 0,
			levelMax = 10,
			desc = "",
			attrValue = "",
			upCost = {
				__size = 0
			}
		}
	}
}

return csv.trainer.attr_skills
