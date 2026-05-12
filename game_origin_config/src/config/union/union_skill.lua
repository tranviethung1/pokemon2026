slot0 = {
	__size = 0
}
csv.union.union_skill = {
	{
		name = "Source of life",
		name_en = "Source of life",
		name_vn = "Fonte da vida",
		name_th = "Source of life",
		id = 1,
		icon = "common/icon/union_skill/icon_sm.png"
	},
	{
		name = "P. ATK Learning",
		name_en = "P. ATK Learning",
		name_vn = "Ataque Físico aprendido",
		name_th = "P. ATK Learning",
		id = 2,
		icon = "common/icon/union_skill/icon_bs.png",
		attrType = 7,
		sort = 2
	},
	{
		name = "SP. ATK Learning",
		name_en = "SP. ATK Learning",
		name_vn = "Ataque Mágico aprendido",
		name_th = "SP. ATK Learning",
		id = 3,
		icon = "common/icon/union_skill/icon_bj.png",
		attrType = 8,
		sort = 3
	},
	{
		name = "P.DEF Boost",
		name_en = "P.DEF Boost",
		name_vn = "Poder de Defesa Física aumentado",
		name_th = "P.DEF Boost",
		id = 4,
		icon = "common/icon/union_skill/icon_wf.png",
		attrType = 9,
		sort = 4
	},
	{
		name = "SP.DEF Boost",
		name_en = "SP.DEF Boost",
		name_vn = "Poder de Defesa Mágica aumentado",
		name_th = "SP.DEF Boost",
		id = 5,
		icon = "common/icon/union_skill/icon_tf.png",
		attrType = 10,
		sort = 5
	},
	{
		name = "Physical Training",
		name_en = "Physical Training",
		needGuildLv = 6,
		name_vn = "Treinamento físico",
		name_th = "Physical Training",
		id = 6,
		icon = "common/icon/union_skill/icon_sm.png",
		sort = 6,
		preSkill = {
			1,
			10
		}
	},
	{
		name = "Strength Training",
		name_en = "Strength Training",
		attrType = 7,
		needGuildLv = 6,
		name_vn = "Treinamento de força",
		name_th = "Strength Training",
		id = 7,
		icon = "common/icon/union_skill/icon_bs.png",
		sort = 7,
		preSkill = {
			2,
			10
		}
	},
	{
		name = "Strengthening Willpower",
		name_en = "Strengthening Willpower",
		attrType = 8,
		needGuildLv = 6,
		name_vn = "Fortalecimento da Força de Vontade",
		name_th = "Strengthening Willpower",
		id = 8,
		icon = "common/icon/union_skill/icon_bj.png",
		sort = 8,
		preSkill = {
			3,
			10
		}
	},
	{
		name = "Strong and Healthy Physique",
		name_en = "Strong and Healthy Physique",
		attrType = 9,
		needGuildLv = 6,
		name_vn = "Físico Forte e Saudável",
		name_th = "Strong and Healthy Physique",
		id = 9,
		icon = "common/icon/union_skill/icon_wf.png",
		sort = 9,
		preSkill = {
			4,
			10
		}
	},
	{
		name = "Spirit Training",
		name_en = "Spirit Training",
		attrType = 10,
		needGuildLv = 6,
		name_vn = "Treinamento Espiritual",
		name_th = "Spirit Training",
		id = 10,
		icon = "common/icon/union_skill/icon_tf.png",
		sort = 10,
		preSkill = {
			5,
			10
		}
	},
	{
		name = "Defense Training",
		name_en = "Defense Training",
		attrType = 17,
		needGuildLv = 8,
		name_vn = "Treinamento de Defesa",
		name_th = "Defense Training",
		id = 11,
		icon = "common/icon/union_skill/icon_tg.png",
		sort = 11
	},
	{
		name = "Enhance resistance",
		name_en = "Enhance resistance",
		attrType = 19,
		needGuildLv = 8,
		name_vn = "Aumente a resistência",
		name_th = "Enhance resistance",
		id = 12,
		icon = "common/icon/union_skill/icon_tg.png",
		sort = 12
	},
	{
		name = "Improve healing effect",
		name_en = "Improve healing effect",
		attrType = 28,
		needGuildLv = 8,
		name_vn = "Melhorar o efeito de cura",
		name_th = "Improve healing effect",
		id = 13,
		icon = "common/icon/union_skill/icon_sm.png",
		sort = 14
	},
	{
		name = "Enhance critical hit damage",
		name_en = "Enhance critical hit damage",
		attrType = 14,
		needGuildLv = 8,
		name_vn = "Aumente o dano de acerto crítico",
		name_th = "Enhance critical hit damage",
		id = 14,
		icon = "common/icon/union_skill/icon_wg.png",
		sort = 15
	},
	{
		name = "Enhance critical hit damage",
		name_en = "Enhance critical hit damage",
		attrType = 15,
		needGuildLv = 8,
		name_vn = "Aumente o dano de acerto crítico",
		name_th = "Enhance critical hit damage",
		id = 15,
		icon = "common/icon/union_skill/icon_wg.png",
		sort = 16
	},
	{
		name = "Crit Resistance ↓",
		name_en = "Crit Resistance ↓",
		attrType = 16,
		needGuildLv = 8,
		name_vn = "Resistência a Críticos reduzida ↓",
		name_th = "Crit Resistance ↓",
		id = 16,
		icon = "common/icon/union_skill/icon_tf.png",
		sort = 17
	},
	{
		name = "Resistance rate ↓",
		name_en = "Resistance rate ↓",
		attrType = 18,
		needGuildLv = 8,
		name_vn = "Taxa de resistência reduzida↓",
		name_th = "Resistance rate ↓",
		id = 17,
		icon = "common/icon/union_skill/icon_bs.png",
		sort = 13
	},
	__size = 17,
	__default = {
		__index = {
			name_en = "",
			name = "",
			attrNatureType = 0,
			attrType = 1,
			needGuildLv = 0,
			name_vn = "",
			name_th = "",
			icon = "config/item/icon_bsdmz.png",
			sort = 1,
			preSkill = {}
		}
	}
}

return csv.union.union_skill
