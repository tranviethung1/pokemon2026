slot0 = {
	__size = 4,
	[10] = {
		119,
		119,
		119,
		119,
		119,
		119
	},
	[11] = {
		__size = 2,
		branch = 1,
		level = 50
	},
	[12] = {
		1,
		1,
		0,
		0,
		0,
		0,
		0,
		0
	},
	[16] = {
		13,
		13,
		13,
		13
	}
}
slot1 = {
	[20010] = slot0[11],
	[20011] = slot0[11],
	[20012] = slot0[11],
	[20013] = slot0[11],
	[20014] = slot0[11]
}
slot2 = {
	[20011] = slot0[12],
	[20012] = slot0[12]
}
slot3 = {
	[20010] = slot0[10],
	[20011] = slot0[10],
	[20012] = slot0[10],
	[20013] = slot0[10],
	[20014] = slot0[10]
}
slot4 = {
	[20013] = slot0[16],
	[20014] = slot0[16]
}
csv.template.cards = {
	__size = 5,
	[20010] = {
		chipLevel = 20,
		heldItemAdvance = 3,
		id = 20010,
		gemLevel = 20,
		star = 5,
		skills = slot3[20010],
		abilitiesExtra = slot1[20010]
	},
	[20011] = {
		heldItemAdvance = 3,
		chipLevel = 50,
		gemLevel = 50,
		id = 20011,
		star = 6,
		skills = slot3[20011],
		zawake = slot2[20011],
		abilitiesExtra = slot1[20011],
		equips = {
			11,
			11,
			11,
			11
		}
	},
	[20012] = {
		heldItemAdvance = 3,
		chipLevel = 80,
		advance = 23,
		id = 20012,
		gemLevel = 80,
		skills = slot3[20012],
		zawake = slot2[20012],
		abilitiesExtra = slot1[20012],
		equips = {
			12,
			12,
			12,
			12
		}
	},
	[20013] = {
		heldItemAdvance = 5,
		chipLevel = 100,
		advance = 23,
		gemLevel = 100,
		id = 20013,
		star = 12,
		skills = slot3[20013],
		zawake = {
			1,
			1,
			1,
			1,
			0,
			0,
			0,
			0
		},
		abilitiesExtra = slot1[20013],
		equips = slot4[20013]
	},
	[20014] = {
		heldItemAdvance = 7,
		chipLevel = 100,
		advance = 23,
		gemLevel = 100,
		id = 20014,
		star = 12,
		skills = slot3[20014],
		zawake = {
			1,
			1,
			1,
			1,
			1,
			1,
			0,
			0
		},
		abilitiesExtra = slot1[20014],
		equips = slot4[20014]
	},
	__default = {
		__index = {
			heldItemAdvance = 0,
			contractLevel = 0,
			chipLevel = 0,
			gemLevel = 0,
			advance = 22,
			star = 8,
			level = 109,
			feelLevel = 500,
			starSkills = {
				1,
				1,
				1,
				1,
				1,
				1
			},
			skills = {
				109,
				109,
				109,
				109,
				109,
				109
			},
			zawake = {
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			},
			fetter = {},
			abilitiesExtra = {
				__size = 2,
				branch = 1,
				level = 1
			},
			effortValues = {
				speed = 160,
				specialDamage = 160,
				hp = 160,
				damage = 160,
				specialDefence = 160,
				defence = 160,
				__size = 6
			},
			equips = {
				1,
				1,
				1,
				1
			},
			abilities = {
				20,
				20,
				20,
				20,
				20,
				20,
				20,
				20,
				20,
				20
			},
			nvalue = {
				speed = 16,
				specialDamage = 16,
				hp = 16,
				damage = 16,
				specialDefence = 16,
				defence = 16,
				__size = 6
			}
		}
	}
}

return csv.template.cards
