slot0 = {
	{
		__size = 0
	},
	{
		__size = 5,
		height = 12,
		width = 12,
		y = 6,
		wallHeight = 5,
		x = 6
	},
	{
		maxScale = 0.8,
		minScale = 0.4,
		k = 0.5,
		__size = 4,
		maxNum = 50
	},
	{
		__size = 5,
		height = 15,
		width = 15,
		y = 6,
		wallHeight = 5,
		x = 6
	},
	{
		__size = 5,
		height = 18,
		width = 18,
		y = 6,
		wallHeight = 5,
		x = 6
	},
	{
		__size = 5,
		height = 21,
		width = 21,
		y = 6,
		wallHeight = 5,
		x = 6
	},
	{
		__size = 2,
		height = 5,
		width = 12
	},
	{
		__size = 2,
		height = 5,
		width = 15
	},
	{
		__size = 2,
		height = 5,
		width = 18
	},
	{
		__size = 2,
		height = 5,
		width = 21
	},
	__size = 10
}
slot1 = {
	slot0[2],
	slot0[4],
	[1019] = slot0[9],
	default = slot0[1],
	[20] = slot0[6],
	[3] = slot0[5],
	[5] = slot0[2],
	[4] = slot0[6],
	[7] = slot0[5],
	[6] = slot0[4],
	[9] = slot0[2],
	[8] = slot0[6],
	[1016] = slot0[10],
	[1017] = slot0[7],
	[1010] = slot0[8],
	[1011] = slot0[9],
	[1012] = slot0[10],
	[1013] = slot0[7],
	[1014] = slot0[8],
	[1015] = slot0[9],
	[1018] = slot0[8],
	[1020] = slot0[10],
	[11] = slot0[5],
	[10] = slot0[4],
	[13] = slot0[2],
	[12] = slot0[6],
	[15] = slot0[5],
	[14] = slot0[4],
	[17] = slot0[2],
	[16] = slot0[6],
	[19] = slot0[5],
	[18] = slot0[4],
	[1009] = slot0[7],
	[1008] = slot0[10],
	[1007] = slot0[9],
	[1006] = slot0[8],
	[1005] = slot0[7],
	[1004] = slot0[10],
	[1003] = slot0[9],
	[1002] = slot0[8],
	[1001] = slot0[7]
}
slot2 = {
	slot0[3],
	slot0[3],
	[11] = slot0[3],
	[13] = slot0[3],
	[12] = slot0[3],
	[15] = slot0[3],
	[14] = slot0[3],
	[17] = slot0[3],
	[10] = slot0[3],
	[19] = slot0[3],
	[18] = slot0[3],
	[16] = slot0[3],
	[20] = slot0[3],
	default = slot0[1],
	[3] = slot0[3],
	[5] = slot0[3],
	[4] = slot0[3],
	[7] = slot0[3],
	[6] = slot0[3],
	[9] = slot0[3],
	[8] = slot0[3]
}
csv.homeland.wall_floor = {
	{
		type = 1,
		res = "home/floor1000.tmx",
		furnId = 50001,
		roomID = 1,
		id = 1,
		size = slot1[1],
		attr = slot2[1]
	},
	{
		type = 1,
		res = "home/floor1001.tmx",
		furnId = 50001,
		roomID = 2,
		id = 2,
		size = slot1[2],
		attr = slot2[2]
	},
	{
		type = 1,
		res = "home/floor1002.tmx",
		furnId = 50001,
		roomID = 3,
		id = 3,
		size = slot1[3],
		attr = slot2[3]
	},
	{
		type = 1,
		res = "home/floor1003.tmx",
		furnId = 50001,
		roomID = 4,
		id = 4,
		size = slot1[4],
		attr = slot2[4]
	},
	{
		type = 1,
		res = "home/floor1010.tmx",
		furnId = 50002,
		roomID = 1,
		id = 5,
		size = slot1[5],
		attr = slot2[5]
	},
	{
		type = 1,
		res = "home/floor1011.tmx",
		furnId = 50002,
		roomID = 2,
		id = 6,
		size = slot1[6],
		attr = slot2[6]
	},
	{
		type = 1,
		res = "home/floor1012.tmx",
		furnId = 50002,
		roomID = 3,
		id = 7,
		size = slot1[7],
		attr = slot2[7]
	},
	{
		type = 1,
		res = "home/floor1013.tmx",
		furnId = 50002,
		roomID = 4,
		id = 8,
		size = slot1[8],
		attr = slot2[8]
	},
	{
		type = 1,
		res = "home/floor1020.tmx",
		furnId = 50003,
		roomID = 1,
		id = 9,
		size = slot1[9],
		attr = slot2[9]
	},
	{
		type = 1,
		res = "home/floor1021.tmx",
		furnId = 50003,
		roomID = 2,
		id = 10,
		size = slot1[10],
		attr = slot2[10]
	},
	{
		type = 1,
		res = "home/floor1022.tmx",
		furnId = 50003,
		roomID = 3,
		id = 11,
		size = slot1[11],
		attr = slot2[11]
	},
	{
		type = 1,
		res = "home/floor1023.tmx",
		furnId = 50003,
		roomID = 4,
		id = 12,
		size = slot1[12],
		attr = slot2[12]
	},
	{
		type = 1,
		res = "home/floor1030.tmx",
		furnId = 50004,
		roomID = 1,
		id = 13,
		size = slot1[13],
		attr = slot2[13]
	},
	{
		type = 1,
		res = "home/floor1031.tmx",
		furnId = 50004,
		roomID = 2,
		id = 14,
		size = slot1[14],
		attr = slot2[14]
	},
	{
		type = 1,
		res = "home/floor1032.tmx",
		furnId = 50004,
		roomID = 3,
		id = 15,
		size = slot1[15],
		attr = slot2[15]
	},
	{
		type = 1,
		res = "home/floor1033.tmx",
		furnId = 50004,
		roomID = 4,
		id = 16,
		size = slot1[16],
		attr = slot2[16]
	},
	{
		type = 1,
		res = "home/floor1040.tmx",
		furnId = 50005,
		roomID = 1,
		id = 17,
		size = slot1[17],
		attr = slot2[17]
	},
	{
		type = 1,
		res = "home/floor1041.tmx",
		furnId = 50005,
		roomID = 2,
		id = 18,
		size = slot1[18],
		attr = slot2[18]
	},
	{
		type = 1,
		res = "home/floor1042.tmx",
		furnId = 50005,
		roomID = 3,
		id = 19,
		size = slot1[19],
		attr = slot2[19]
	},
	{
		type = 1,
		res = "home/floor1043.tmx",
		furnId = 50005,
		roomID = 4,
		id = 20,
		size = slot1[20],
		attr = slot2[20]
	},
	__size = 40,
	[1001] = {
		type = 2,
		res = "home/wall2020.tmx",
		furnId = 51001,
		roomID = 1,
		id = 1001,
		size = slot1[1001]
	},
	[1002] = {
		type = 2,
		res = "home/wall2021.tmx",
		furnId = 51001,
		roomID = 2,
		id = 1002,
		size = slot1[1002]
	},
	[1003] = {
		type = 2,
		res = "home/wall2022.tmx",
		furnId = 51001,
		roomID = 3,
		id = 1003,
		size = slot1[1003]
	},
	[1004] = {
		type = 2,
		res = "home/wall2023.tmx",
		furnId = 51001,
		roomID = 4,
		id = 1004,
		size = slot1[1004]
	},
	[1005] = {
		type = 2,
		res = "home/wall2010.tmx",
		furnId = 51002,
		roomID = 1,
		id = 1005,
		size = slot1[1005]
	},
	[1006] = {
		type = 2,
		res = "home/wall2011.tmx",
		furnId = 51002,
		roomID = 2,
		id = 1006,
		size = slot1[1006]
	},
	[1007] = {
		type = 2,
		res = "home/wall2012.tmx",
		furnId = 51002,
		roomID = 3,
		id = 1007,
		size = slot1[1007]
	},
	[1008] = {
		type = 2,
		res = "home/wall2013.tmx",
		furnId = 51002,
		roomID = 4,
		id = 1008,
		size = slot1[1008]
	},
	[1009] = {
		type = 2,
		res = "home/wall2000.tmx",
		furnId = 51003,
		roomID = 1,
		id = 1009,
		size = slot1[1009]
	},
	[1010] = {
		type = 2,
		res = "home/wall2001.tmx",
		furnId = 51003,
		roomID = 2,
		id = 1010,
		size = slot1[1010]
	},
	[1011] = {
		type = 2,
		res = "home/wall2002.tmx",
		furnId = 51003,
		roomID = 3,
		id = 1011,
		size = slot1[1011]
	},
	[1012] = {
		type = 2,
		res = "home/wall2003.tmx",
		furnId = 51003,
		roomID = 4,
		id = 1012,
		size = slot1[1012]
	},
	[1013] = {
		type = 2,
		res = "home/wall2030.tmx",
		furnId = 51004,
		roomID = 1,
		id = 1013,
		size = slot1[1013]
	},
	[1014] = {
		type = 2,
		res = "home/wall2031.tmx",
		furnId = 51004,
		roomID = 2,
		id = 1014,
		size = slot1[1014]
	},
	[1015] = {
		type = 2,
		res = "home/wall2032.tmx",
		furnId = 51004,
		roomID = 3,
		id = 1015,
		size = slot1[1015]
	},
	[1016] = {
		type = 2,
		res = "home/wall2033.tmx",
		furnId = 51004,
		roomID = 4,
		id = 1016,
		size = slot1[1016]
	},
	[1017] = {
		type = 2,
		res = "home/wall2040.tmx",
		furnId = 51005,
		roomID = 1,
		id = 1017,
		size = slot1[1017]
	},
	[1018] = {
		type = 2,
		res = "home/wall2041.tmx",
		furnId = 51005,
		roomID = 2,
		id = 1018,
		size = slot1[1018]
	},
	[1019] = {
		type = 2,
		res = "home/wall2042.tmx",
		furnId = 51005,
		roomID = 3,
		id = 1019,
		size = slot1[1019]
	},
	[1020] = {
		type = 2,
		res = "home/wall2043.tmx",
		furnId = 51005,
		roomID = 4,
		id = 1020,
		size = slot1[1020]
	},
	__default = {
		__index = {
			size = slot1.default,
			attr = slot2.default
		}
	}
}

return csv.homeland.wall_floor
