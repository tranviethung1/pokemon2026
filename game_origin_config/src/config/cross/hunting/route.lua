slot0 = {
	{
		__size = 0
	},
	__size = 35,
	[3] = {
		101001
	},
	[4] = {
		101002
	},
	[5] = {
		101011
	},
	[6] = {
		101003
	},
	[7] = {
		__size = 1,
		libs = {
			22109,
			22113
		}
	},
	[8] = {
		__size = 1,
		libs = {
			22110,
			22106,
			22106,
			22106,
			22106,
			22106
		}
	},
	[9] = {
		101004
	},
	[10] = {
		101012
	},
	[11] = {
		101005
	},
	[12] = {
		__size = 1,
		libs = {
			22109,
			22113,
			22118
		}
	},
	[13] = {
		__size = 1,
		libs = {
			22110,
			22107,
			22107,
			22107,
			22107,
			22107
		}
	},
	[14] = {
		101006,
		101013
	},
	[15] = {
		101007
	},
	[16] = {
		101008
	},
	[17] = {
		101014
	},
	[18] = {
		__size = 1,
		libs = {
			22110,
			22108,
			22108,
			22108,
			22108,
			22108,
			22108
		}
	},
	[19] = {
		101021
	},
	[20] = {
		102001
	},
	[21] = {
		102002
	},
	[22] = {
		102011
	},
	[23] = {
		102003
	},
	[24] = {
		__size = 1,
		libs = {
			22111,
			22114
		}
	},
	[25] = {
		__size = 1,
		libs = {
			22112,
			22106,
			22106,
			22106,
			22106,
			22106,
			22106
		}
	},
	[26] = {
		102004
	},
	[27] = {
		102012
	},
	[28] = {
		102005
	},
	[29] = {
		__size = 1,
		libs = {
			22111,
			22114,
			22119
		}
	},
	[30] = {
		__size = 1,
		libs = {
			22112,
			22107,
			22107,
			22107,
			22107,
			22107,
			22107
		}
	},
	[31] = {
		102006,
		102013
	},
	[32] = {
		102014
	},
	[33] = {
		102007
	},
	[34] = {
		102021
	},
	[35] = {
		__size = 1,
		libs = {
			22112,
			22108,
			22108,
			22108,
			22108,
			22108,
			22108,
			22108
		}
	},
	[36] = {
		102022
	}
}
slot1 = {
	slot0[3],
	slot0[4],
	[115] = slot0[36],
	[111] = slot0[32],
	[110] = slot0[31],
	[113] = slot0[34],
	[112] = slot0[33],
	[2013] = slot0[33],
	[3] = slot0[5],
	[4] = slot0[6],
	[7] = slot0[10],
	[6] = slot0[9],
	[1014] = slot0[17],
	[8] = slot0[11],
	[2017] = slot0[36],
	[1017] = slot0[19],
	[1010] = slot0[14],
	[2010] = slot0[31],
	[1012] = slot0[15],
	[1013] = slot0[16],
	[108] = slot0[28],
	[2014] = slot0[34],
	[102] = slot0[21],
	[103] = slot0[22],
	[101] = slot0[20],
	[106] = slot0[26],
	[107] = slot0[27],
	[104] = slot0[23],
	[11] = slot0[15],
	[10] = slot0[14],
	[13] = slot0[17],
	[12] = slot0[16],
	[15] = slot0[19],
	[2002] = slot0[21],
	[2003] = slot0[22],
	[2001] = slot0[20],
	[2006] = slot0[26],
	[2007] = slot0[27],
	[2004] = slot0[23],
	[1008] = slot0[11],
	[1007] = slot0[10],
	[1006] = slot0[9],
	[2008] = slot0[28],
	[1004] = slot0[6],
	[1003] = slot0[5],
	[1002] = slot0[4],
	[1001] = slot0[3],
	[2012] = slot0[32]
}
slot2 = {
	[2016] = slot0[35],
	[14] = slot0[18],
	default = slot0[1],
	[114] = slot0[35],
	[109] = slot0[30],
	[5] = slot0[8],
	[1009] = slot0[13],
	[2005] = slot0[25],
	[9] = slot0[13],
	[1005] = slot0[8],
	[2009] = slot0[30],
	[1016] = slot0[18],
	[105] = slot0[25]
}
slot3 = {
	[2016] = slot0[29],
	[14] = slot0[12],
	default = slot0[1],
	[114] = slot0[29],
	[109] = slot0[29],
	[5] = slot0[7],
	[1009] = slot0[12],
	[2005] = slot0[24],
	[9] = slot0[12],
	[1005] = slot0[7],
	[2009] = slot0[29],
	[1016] = slot0[12],
	[105] = slot0[24]
}
csv.cross.hunting.route = {
	{
		id = 1,
		gateIDs = slot1[1]
	},
	{
		id = 2,
		gateIDs = slot1[2]
	},
	{
		id = 3,
		gateIDs = slot1[3]
	},
	{
		id = 4,
		supplyGroup = 1,
		type = 4,
		gateIDs = slot1[4]
	},
	{
		id = 5,
		type = 2,
		boxDropLibs = slot3[5],
		boxDropLibs2 = slot2[5]
	},
	{
		id = 6,
		historyCanPass = 3,
		lastCanPass = 3,
		gateIDs = slot1[6]
	},
	{
		id = 7,
		historyCanPass = 3,
		lastCanPass = 3,
		gateIDs = slot1[7]
	},
	{
		supplyGroup = 1,
		type = 4,
		id = 8,
		historyCanPass = 3,
		lastCanPass = 4,
		gateIDs = slot1[8]
	},
	{
		historyCanPass = 4,
		type = 2,
		id = 9,
		lastCanPass = 5,
		boxDropLibs = slot3[9],
		boxDropLibs2 = slot2[9]
	},
	{
		type = 4,
		id = 10,
		historyCanPass = 4,
		lastCanPass = 6,
		gateIDs = slot1[10]
	},
	{
		id = 11,
		historyCanPass = 4,
		lastCanPass = 7,
		gateIDs = slot1[11]
	},
	{
		supplyGroup = 2,
		type = 4,
		id = 12,
		historyCanPass = 4,
		lastCanPass = 8,
		gateIDs = slot1[12]
	},
	{
		id = 13,
		historyCanPass = 6,
		lastCanPass = 8,
		gateIDs = slot1[13]
	},
	{
		historyCanPass = 6,
		type = 2,
		id = 14,
		lastCanPass = 8,
		boxDropLibs = slot3[14],
		boxDropLibs2 = slot2[14]
	},
	{
		id = 15,
		historyCanPass = 6,
		lastCanPass = 10,
		gateIDs = slot1[15]
	},
	__size = 64,
	[101] = {
		routeTag = 2,
		id = 101,
		gateIDs = slot1[101]
	},
	[102] = {
		routeTag = 2,
		id = 102,
		gateIDs = slot1[102]
	},
	[103] = {
		routeTag = 2,
		id = 103,
		gateIDs = slot1[103]
	},
	[104] = {
		routeTag = 2,
		type = 4,
		id = 104,
		supplyGroup = 1,
		gateIDs = slot1[104]
	},
	[105] = {
		routeTag = 2,
		type = 2,
		id = 105,
		boxDropLibs = slot3[105],
		boxDropLibs2 = slot2[105]
	},
	[106] = {
		routeTag = 2,
		id = 106,
		historyCanPass = 3,
		lastCanPass = 3,
		gateIDs = slot1[106]
	},
	[107] = {
		routeTag = 2,
		id = 107,
		historyCanPass = 3,
		lastCanPass = 3,
		gateIDs = slot1[107]
	},
	[108] = {
		routeTag = 2,
		type = 4,
		id = 108,
		supplyGroup = 1,
		historyCanPass = 3,
		lastCanPass = 4,
		gateIDs = slot1[108]
	},
	[109] = {
		routeTag = 2,
		historyCanPass = 3,
		type = 2,
		id = 109,
		lastCanPass = 4,
		boxDropLibs = slot3[109],
		boxDropLibs2 = slot2[109]
	},
	[110] = {
		routeTag = 2,
		type = 4,
		id = 110,
		historyCanPass = 4,
		lastCanPass = 6,
		gateIDs = slot1[110]
	},
	[111] = {
		routeTag = 2,
		id = 111,
		historyCanPass = 4,
		lastCanPass = 6,
		gateIDs = slot1[111]
	},
	[112] = {
		routeTag = 2,
		type = 4,
		id = 112,
		supplyGroup = 2,
		historyCanPass = 4,
		lastCanPass = 7,
		gateIDs = slot1[112]
	},
	[113] = {
		routeTag = 2,
		id = 113,
		historyCanPass = 6,
		lastCanPass = 7,
		gateIDs = slot1[113]
	},
	[114] = {
		routeTag = 2,
		historyCanPass = 6,
		type = 2,
		id = 114,
		lastCanPass = 8,
		boxDropLibs = slot3[114],
		boxDropLibs2 = slot2[114]
	},
	[115] = {
		routeTag = 2,
		id = 115,
		historyCanPass = 6,
		lastCanPass = 8,
		gateIDs = slot1[115]
	},
	[1001] = {
		id = 1001,
		version = 1001,
		gateIDs = slot1[1001]
	},
	[1002] = {
		id = 1002,
		version = 1001,
		gateIDs = slot1[1002]
	},
	[1003] = {
		id = 1003,
		version = 1001,
		gateIDs = slot1[1003]
	},
	[1004] = {
		supplyGroup = 1,
		version = 1001,
		type = 4,
		id = 1004,
		gateIDs = slot1[1004]
	},
	[1005] = {
		type = 2,
		id = 1005,
		version = 1001,
		boxDropLibs = slot3[1005],
		boxDropLibs2 = slot2[1005]
	},
	[1006] = {
		version = 1001,
		id = 1006,
		historyCanPass = 3,
		lastCanPass = 3,
		gateIDs = slot1[1006]
	},
	[1007] = {
		version = 1001,
		id = 1007,
		historyCanPass = 3,
		lastCanPass = 3,
		gateIDs = slot1[1007]
	},
	[1008] = {
		supplyGroup = 1,
		version = 1001,
		type = 4,
		id = 1008,
		historyCanPass = 3,
		lastCanPass = 4,
		gateIDs = slot1[1008]
	},
	[1009] = {
		historyCanPass = 4,
		type = 2,
		id = 1009,
		version = 1001,
		lastCanPass = 5,
		boxDropLibs = slot3[1009],
		boxDropLibs2 = slot2[1009]
	},
	[1010] = {
		version = 1001,
		type = 4,
		id = 1010,
		historyCanPass = 4,
		lastCanPass = 6,
		gateIDs = slot1[1010]
	},
	[1011] = {
		version = 1001,
		type = 3,
		id = 1011,
		supplyGroup = 2,
		historyCanPass = 4,
		lastCanPass = 6
	},
	[1012] = {
		version = 1001,
		id = 1012,
		historyCanPass = 4,
		lastCanPass = 7,
		gateIDs = slot1[1012]
	},
	[1013] = {
		supplyGroup = 2,
		version = 1001,
		type = 4,
		id = 1013,
		historyCanPass = 4,
		lastCanPass = 8,
		gateIDs = slot1[1013]
	},
	[1014] = {
		version = 1001,
		id = 1014,
		historyCanPass = 6,
		lastCanPass = 8,
		gateIDs = slot1[1014]
	},
	[1015] = {
		version = 1001,
		type = 3,
		id = 1015,
		supplyGroup = 2,
		historyCanPass = 6,
		lastCanPass = 8
	},
	[1016] = {
		historyCanPass = 6,
		type = 2,
		id = 1016,
		version = 1001,
		lastCanPass = 8,
		boxDropLibs = slot3[1016],
		boxDropLibs2 = slot2[1016]
	},
	[1017] = {
		version = 1001,
		id = 1017,
		historyCanPass = 6,
		lastCanPass = 10,
		gateIDs = slot1[1017]
	},
	[2001] = {
		routeTag = 2,
		id = 2001,
		version = 2001,
		gateIDs = slot1[2001]
	},
	[2002] = {
		routeTag = 2,
		id = 2002,
		version = 2001,
		gateIDs = slot1[2002]
	},
	[2003] = {
		routeTag = 2,
		id = 2003,
		version = 2001,
		gateIDs = slot1[2003]
	},
	[2004] = {
		routeTag = 2,
		version = 2001,
		type = 4,
		id = 2004,
		supplyGroup = 1,
		gateIDs = slot1[2004]
	},
	[2005] = {
		routeTag = 2,
		type = 2,
		id = 2005,
		version = 2001,
		boxDropLibs = slot3[2005],
		boxDropLibs2 = slot2[2005]
	},
	[2006] = {
		routeTag = 2,
		version = 2001,
		id = 2006,
		historyCanPass = 3,
		lastCanPass = 3,
		gateIDs = slot1[2006]
	},
	[2007] = {
		routeTag = 2,
		version = 2001,
		id = 2007,
		historyCanPass = 3,
		lastCanPass = 3,
		gateIDs = slot1[2007]
	},
	[2008] = {
		routeTag = 2,
		version = 2001,
		type = 4,
		id = 2008,
		supplyGroup = 1,
		historyCanPass = 3,
		lastCanPass = 4,
		gateIDs = slot1[2008]
	},
	[2009] = {
		routeTag = 2,
		historyCanPass = 3,
		type = 2,
		id = 2009,
		version = 2001,
		lastCanPass = 4,
		boxDropLibs = slot3[2009],
		boxDropLibs2 = slot2[2009]
	},
	[2010] = {
		routeTag = 2,
		version = 2001,
		type = 4,
		id = 2010,
		historyCanPass = 4,
		lastCanPass = 6,
		gateIDs = slot1[2010]
	},
	[2011] = {
		routeTag = 2,
		version = 2001,
		type = 3,
		id = 2011,
		supplyGroup = 2,
		historyCanPass = 4,
		lastCanPass = 6
	},
	[2012] = {
		routeTag = 2,
		version = 2001,
		id = 2012,
		historyCanPass = 4,
		lastCanPass = 6,
		gateIDs = slot1[2012]
	},
	[2013] = {
		routeTag = 2,
		version = 2001,
		type = 4,
		id = 2013,
		supplyGroup = 2,
		historyCanPass = 4,
		lastCanPass = 7,
		gateIDs = slot1[2013]
	},
	[2014] = {
		routeTag = 2,
		version = 2001,
		id = 2014,
		historyCanPass = 6,
		lastCanPass = 7,
		gateIDs = slot1[2014]
	},
	[2015] = {
		routeTag = 2,
		version = 2001,
		type = 3,
		id = 2015,
		supplyGroup = 2,
		historyCanPass = 6,
		lastCanPass = 7
	},
	[2016] = {
		routeTag = 2,
		historyCanPass = 6,
		type = 2,
		id = 2016,
		version = 2001,
		lastCanPass = 8,
		boxDropLibs = slot3[2016],
		boxDropLibs2 = slot2[2016]
	},
	[2017] = {
		routeTag = 2,
		version = 2001,
		id = 2017,
		historyCanPass = 6,
		lastCanPass = 8,
		gateIDs = slot1[2017]
	},
	__default = {
		__index = {
			version = 0,
			type = 1,
			historyCanPass = 0,
			lastCanPass = 0,
			routeTag = 1,
			supplyGroup = 0,
			boxDropLibs = slot3.default,
			boxDropLibs2 = slot2.default,
			gateIDs = {}
		}
	}
}

return csv.cross.hunting.route
