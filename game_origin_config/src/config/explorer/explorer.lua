slot0 = {
	__size = 5,
	[2] = {},
	[7] = {
		3,
		6,
		9,
		12
	},
	[12] = {
		__size = 3,
		x = 840,
		scale = 2.9,
		y = 150
	},
	[16] = {
		3,
		6,
		9,
		12,
		15
	},
	[24] = {
		29,
		30,
		31,
		32,
		33
	}
}
slot2 = {
	[3] = slot0[12],
	[6] = slot0[12]
}
slot3 = {
	default = slot0[2],
	[5] = slot0[24]
}
slot4 = {
	slot0[7],
	slot0[7],
	default = slot0[2],
	[3] = slot0[16],
	[5] = slot0[16],
	[4] = slot0[16],
	[7] = slot0[16],
	[6] = slot0[16],
	[9] = slot0[16],
	[8] = slot0[16]
}
slot5 = {
	default = slot0[2],
	[9] = slot0[24]
}
csv.explorer.explorer = {
	{
		id = 1,
		name_en = "Rhydon Armored Vehicle",
		res = "tiejiaxiniulvdaiche/tiejiaxiniulvdaiche.skel",
		name = "Rhydon Armored Vehicle",
		simpleIcon = "config/explorer/img_tjxn.png",
		advanceCostSeq = 2,
		name_vn = "Veículo blindado Rhydon",
		townShowRes = "config/explorer/icon_tjxnldc.png",
		townSkill = 2001,
		quality = 2,
		coordinate = {
			__size = 3,
			x = 850,
			scale = 3.3,
			y = 210
		},
		componentIDs = {
			1,
			2,
			3
		},
		effect = {
			1,
			2
		},
		extraEff = {
			3,
			4,
			5,
			6
		},
		extraEffCod = slot4[1]
	},
	{
		id = 2,
		name_en = "Armored vehicle component",
		res = "dajialvdaiche/dajialvdaiche.skel",
		name = "Armored vehicle component",
		simpleIcon = "config/explorer/img_djldc.png",
		advanceCostSeq = 2,
		name_vn = "Componente de veículo blindado",
		townShowRes = "config/explorer/icon_djldc.png",
		townSkill = 2011,
		quality = 2,
		coordinate = {
			__size = 3,
			x = 850,
			scale = 3,
			y = 210
		},
		componentIDs = {
			4,
			5,
			6
		},
		effect = {
			7,
			8
		},
		extraEff = {
			9,
			10,
			11,
			12
		},
		extraEffCod = slot4[2]
	},
	{
		id = 3,
		name_en = "Catfish Boat",
		res = "chuan/nianyuwangtanxianqi.skel",
		name = "Catfish Boat",
		simpleIcon = "config/explorer/img_txq1_1.png",
		advanceCostSeq = 3,
		name_vn = "Barco de peixe-gato",
		townShowRes = "config/explorer/icon_nyc.png",
		bg = "tanxianqibeijing/tanxianqibeijing_shui.skel",
		townSkill = 2021,
		quality = 3,
		coordinate = slot2[3],
		componentIDs = {
			7,
			8,
			9
		},
		effect = {
			13,
			14
		},
		extraEff = {
			15,
			16,
			17,
			18,
			19
		},
		extraEffCod = slot4[3]
	},
	{
		id = 4,
		name_en = "Heracross' chariot",
		res = "helakeluosizhanche/helakeluosizhanche.skel",
		name = "Heracross' chariot",
		simpleIcon = "config/explorer/img_hlkls_1.png",
		advanceCostSeq = 3,
		name_vn = "Carruagem de Heracross",
		townShowRes = "config/explorer/icon_hlklszc.png",
		townSkill = 2031,
		quality = 3,
		coordinate = {
			__size = 3,
			x = 840,
			scale = 3,
			y = 250
		},
		componentIDs = {
			10,
			11,
			12
		},
		effect = {
			20,
			21
		},
		extraEff = {
			22,
			23,
			24,
			25,
			26
		},
		extraEffCod = slot4[4]
	},
	{
		id = 5,
		name_en = "Unicorn crawler",
		res = "longtoudishutanceqi/longtoudishutangceqi.skel",
		name = "Unicorn crawler",
		simpleIcon = "config/explorer/img_ltds.png",
		advanceCostSeq = 3,
		name_vn = "Rastreador de unicórnio",
		townShowRes = "config/explorer/icon_ltdszdcjqx.png",
		townSkill = 2041,
		quality = 3,
		coordinate = {
			__size = 3,
			x = 860,
			scale = 2.5,
			y = 240
		},
		componentIDs = {
			13,
			14,
			15
		},
		effect = {
			27,
			28
		},
		extraEff = slot3[5],
		extraEffCod = slot4[5]
	},
	{
		id = 6,
		res = "dudufeixingqi/dudufeixingqi.skel",
		name_en = "Doduo's Scanner",
		bg = "tanxianqibeijing/tanxianqibeijing_shui.skel",
		quality = 4,
		advanceCostSeq = 4,
		name_vn = "Escaneador do Doduo",
		townShowRes = "config/explorer/icon_ddtcq.png",
		townSkill = 2051,
		name = "Doduo's Scanner",
		coordinate = slot2[6],
		componentIDs = {
			16,
			17,
			18,
			19
		},
		effect = {
			34,
			35
		},
		extraEff = {
			36,
			37,
			38,
			39,
			40
		},
		extraEffCod = slot4[6]
	},
	{
		id = 7,
		name_en = "Poliwhirl Explorer Device",
		res = "wenxiangwatangceqi/wenxiangwatanceqi.skel",
		name = "Poliwhirl Explorer Device",
		simpleIcon = "config/explorer/img_txq2_1.png",
		advanceCostSeq = 4,
		name_vn = "Dispositivo Explorador Poligiro",
		townShowRes = "config/explorer/icon_wxwtcq.png",
		bg = "tanxianqibeijing/tanxianqibeijing_shui.skel",
		townSkill = 2061,
		quality = 4,
		coordinate = {
			__size = 3,
			x = 840,
			scale = 3,
			y = 150
		},
		componentIDs = {
			20,
			21,
			22,
			23
		},
		effect = {
			41,
			42
		},
		extraEff = {
			43,
			44,
			45,
			46,
			47
		},
		extraEffCod = slot4[7]
	},
	{
		id = 8,
		name_en = "Pseudo-legendary Aircraft",
		res = "gaioukafeixingqi/gaioukafeixingqi.skel",
		name = "Pseudo-legendary Aircraft",
		simpleIcon = "config/explorer/img_gok_1.png",
		advanceCostSeq = 5,
		name_vn = "Aeronave pseudo-lendária",
		townShowRes = "config/explorer/icon_gokfxq.png",
		bg = "tanxianqibeijing/tanxianqibeijing_shui.skel",
		townSkill = 2071,
		quality = 5,
		coordinate = {
			__size = 3,
			x = 780,
			scale = 3.2,
			y = 180
		},
		componentIDs = {
			24,
			25,
			26,
			27,
			28
		},
		effect = {
			48,
			49
		},
		extraEff = {
			50,
			51,
			52,
			53,
			54
		},
		extraEffCod = slot4[8]
	},
	{
		id = 9,
		name_en = "Volcanion Airship",
		res = "boerkainienfeichuan/boerkainienfeichuan.skel",
		name = "Volcanion Airship",
		simpleIcon = "config/explorer/img_bekne_1.png",
		advanceCostSeq = 5,
		name_vn = "Dirigível Volcanico",
		townShowRes = "config/explorer/icon_beknefc.png",
		townSkill = 2081,
		quality = 5,
		coordinate = {
			__size = 3,
			x = 840,
			scale = 2.9,
			y = 100
		},
		componentIDs = slot5[9],
		effect = {
			55,
			56
		},
		extraEff = {
			57,
			58,
			59,
			60,
			61
		},
		extraEffCod = slot4[9]
	},
	__size = 9,
	__default = {
		__index = {
			res = "config/explorer/test_qpp.png",
			quality = 1,
			bg = "tanxianqibeijing/tanxianqibeijing.skel",
			simpleIcon = "config/explorer/img_txq3_1.png",
			townSkill = 0,
			advanceCostSeq = 1,
			townShowRes = "",
			levelMax = 20,
			coordinate = {
				__size = 0
			},
			componentIDs = slot5.default,
			effect = ({
				default = slot0[2]
			}).default,
			extraEff = slot3.default,
			extraEffCod = slot4.default
		}
	}
}

return csv.explorer.explorer
