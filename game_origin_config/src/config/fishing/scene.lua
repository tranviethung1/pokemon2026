slot0 = {
	{},
	__size = 1
}
csv.fishing.scene = {
	{
		name = "Tidal Coast",
		name_en = "Tidal Coast",
		lock = 1,
		res = "fishing/diaoyu_cj_shatan.skel",
		name_vn = "Costa das marés",
		name_th = "ชายฝั่งน้ำขึ้นน้ำลง",
		id = 1,
		priview = {
			1,
			2,
			3,
			4,
			101,
			102,
			201,
			202
		},
		characterPos = {
			460,
			-160
		}
	},
	{
		needLv = 4,
		name_en = "Silent Swamp",
		name = "Silent Swamp",
		lock = 1,
		res = "fishing/diaoyu_cj_miwu.skel",
		name_vn = "Pântano Silencioso",
		name_th = "บึงเงียบ",
		id = 2,
		priview = {
			5,
			6,
			7,
			8,
			103,
			104,
			203,
			204
		},
		characterPos = {
			560,
			-100
		}
	},
	{
		needLv = 10,
		name_en = "Nile Valley",
		name = "Nile Valley",
		lock = 1,
		res = "fishing/diaoyuchangjing3.skel",
		name_vn = "Vale do Nilo",
		name_th = "หุบเขาไนล์",
		id = 3,
		priview = {
			9,
			10,
			11,
			105,
			106,
			107,
			205,
			206
		},
		characterPos = {
			660,
			-160
		}
	},
	__size = 4,
	[999] = {
		name = "Fishing Contest",
		name_en = "Fishing Contest",
		lock = 1,
		type = 2,
		res = "fishing/diaoyu_cj_shatan.skel",
		name_vn = "Concurso de Pesca",
		name_th = "การแข่งขันตกปลา",
		id = 999,
		priview = {
			1,
			3,
			5,
			7,
			10,
			101,
			103,
			106,
			201,
			203,
			206,
			9999
		},
		characterPos = {
			360,
			-240
		}
	},
	__default = {
		__index = {
			res = "",
			name = "",
			name_en = "",
			type = 1,
			lock = 0,
			needLv = 1,
			name_vn = "",
			name_th = "",
			priview = ({
				default = slot0[1]
			}).default,
			characterPos = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.fishing.scene
