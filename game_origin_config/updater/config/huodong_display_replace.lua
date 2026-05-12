slot0 = {
	{
		__size = 0
	},
	{
		__size = 1,
		loginSpine = "login/chunjiedenglu.skel"
	},
	{
		__size = 1,
		loginSpine = "login/51denglutu.skel"
	},
	{
		__size = 1,
		loginSpine = "login/denglu_qiuji.skel"
	},
	{
		__size = 1,
		loginSpine = "login/wsj_denglu.skel"
	},
	{
		__size = 1,
		loginSpine = "login/changjing.skel"
	},
	__size = 8,
	[8] = {
		__size = 1,
		loginSpine = "login/login.skel"
	},
	[9] = {
		__size = 1,
		loginSpine = "login/xjyd.skel"
	}
}
slot1 = {
	slot0[2],
	slot0[3],
	[10] = slot0[5],
	default = slot0[1],
	[3] = slot0[4],
	[5] = slot0[6],
	[4] = slot0[5],
	[7] = slot0[8],
	[6] = slot0[2],
	[9] = slot0[3],
	[8] = slot0[3]
}
slot2 = {
	slot0[2],
	slot0[3],
	[10] = slot0[5],
	default = slot0[1],
	[3] = slot0[4],
	[5] = slot0[6],
	[4] = slot0[5],
	[6] = slot0[2],
	[9] = slot0[9],
	[8] = slot0[3]
}
slot3 = {
	slot0[2],
	slot0[3],
	[10] = slot0[5],
	default = slot0[1],
	[3] = slot0[4],
	[5] = slot0[6],
	[4] = slot0[5],
	[7] = slot0[8],
	[6] = slot0[2],
	[9] = slot0[9],
	[8] = slot0[3]
}
slot4 = {
	slot0[2],
	slot0[3],
	[10] = slot0[5],
	default = slot0[1],
	[3] = slot0[4],
	[5] = slot0[6],
	[4] = slot0[5],
	[7] = slot0[8],
	[6] = slot0[2],
	[9] = slot0[3],
	[8] = slot0[3]
}
slot5 = {
	slot0[2],
	slot0[3],
	[10] = slot0[5],
	default = slot0[1],
	[3] = slot0[4],
	[5] = slot0[6],
	[4] = slot0[5],
	[7] = slot0[8],
	[6] = slot0[2],
	[9] = slot0[3],
	[8] = slot0[3]
}
csv.huodong_display_replace = {
	{
		endDate = 20200214,
		beginDate = 20200116,
		id = 1,
		clientParam = slot2[1],
		clientParam_kr = slot3[1],
		clientParam_en = slot5[1],
		clientParam_vn = slot4[1],
		clientParam_tw = slot1[1]
	},
	{
		endDate = 20200809,
		beginDate = 20200426,
		id = 2,
		clientParam = slot2[2],
		clientParam_kr = slot3[2],
		clientParam_en = slot5[2],
		clientParam_vn = slot4[2],
		clientParam_tw = slot1[2]
	},
	{
		endDate = 20201027,
		beginDate = 20200810,
		id = 3,
		clientParam = slot2[3],
		clientParam_kr = slot3[3],
		clientParam_en = slot5[3],
		clientParam_vn = slot4[3],
		clientParam_tw = slot1[3]
	},
	{
		endDate = 20201217,
		beginDate = 20201028,
		id = 4,
		clientParam = slot2[4],
		clientParam_kr = slot3[4],
		clientParam_en = slot5[4],
		clientParam_vn = slot4[4],
		clientParam_tw = slot1[4]
	},
	{
		endDate = 20210101,
		beginDate = 20201216,
		id = 5,
		clientParam = slot2[5],
		clientParam_kr = slot3[5],
		clientParam_en = slot5[5],
		clientParam_vn = slot4[5],
		clientParam_tw = slot1[5]
	},
	{
		endDate = 20210301,
		beginDate = 20210102,
		id = 6,
		clientParam = slot2[6],
		clientParam_kr = slot3[6],
		clientParam_en = slot5[6],
		clientParam_vn = slot4[6],
		clientParam_tw = slot1[6]
	},
	{
		endDate = 20210405,
		beginDate = 20210326,
		id = 7,
		clientParam = {
			__size = 1,
			loginSpine = "login/znqdl.skel"
		},
		clientParam_kr = slot3[7],
		clientParam_en = slot5[7],
		clientParam_vn = slot4[7],
		clientParam_tw = slot1[7]
	},
	{
		endDate = 20210701,
		beginDate = 20210501,
		id = 8,
		clientParam = slot2[8],
		clientParam_kr = slot3[8],
		clientParam_en = slot5[8],
		clientParam_vn = slot4[8],
		clientParam_tw = slot1[8]
	},
	{
		endDate = 20210901,
		beginDate = 20210701,
		id = 9,
		clientParam = slot2[9],
		clientParam_kr = slot3[9],
		clientParam_en = slot5[9],
		clientParam_vn = slot4[9],
		clientParam_tw = slot1[9]
	},
	{
		endDate = 20211112,
		beginDate = 20211025,
		id = 10,
		clientParam = slot2[10],
		clientParam_kr = slot3[10],
		clientParam_en = slot5[10],
		clientParam_vn = slot4[10],
		clientParam_tw = slot1[10]
	},
	__size = 10,
	__default = {
		__index = {
			beginTime = 500,
			endDate = 20250101,
			endTime = 500,
			beginDate = 20160101,
			clientParam = slot2.default,
			clientParam_kr = slot3.default,
			clientParam_en = slot5.default,
			clientParam_vn = slot4.default,
			clientParam_tw = slot1.default
		}
	}
}

return csv.huodong_display_replace
