slot0 = {
	__size = 19,
	[2] = {
		gold = 10000,
		__size = 1
	},
	[3] = {
		gold = 20000,
		__size = 1
	},
	[4] = {
		__size = 1,
		rmb = 30
	},
	[5] = {
		__size = 1,
		rmb = 60
	},
	[6] = {
		__size = 1,
		[11.0] = 10
	},
	[7] = {
		[12.0] = 5,
		__size = 1
	},
	[8] = {
		[13.0] = 3,
		__size = 1
	},
	[9] = {
		__size = 1,
		[14.0] = 2
	},
	[10] = {
		__size = 1,
		[451.0] = 1
	},
	[11] = {
		[452.0] = 1,
		__size = 1
	},
	[12] = {
		[900.0] = 2,
		__size = 1
	},
	[13] = {
		[901.0] = 1,
		__size = 1
	},
	[14] = {
		__size = 1,
		[100.0] = 1
	},
	[15] = {
		__size = 1,
		rmb = 20
	},
	[16] = {
		gold = 5000,
		__size = 1
	},
	[17] = {
		__size = 1,
		rmb = 10
	},
	[18] = {
		__size = 1,
		[11.0] = 5
	},
	[19] = {
		[12.0] = 3,
		__size = 1
	},
	[20] = {
		[13.0] = 2,
		__size = 1
	}
}
slot1 = {
	slot0[2],
	slot0[3],
	[308] = slot0[9],
	[212] = slot0[13],
	[213] = slot0[14],
	[210] = slot0[11],
	[211] = slot0[12],
	[313] = slot0[14],
	[312] = slot0[13],
	[311] = slot0[12],
	[310] = slot0[11],
	[404] = slot0[15],
	[111] = slot0[12],
	[110] = slot0[11],
	[113] = slot0[14],
	[112] = slot0[13],
	[509] = slot0[10],
	[407] = slot0[20],
	[508] = slot0[9],
	[405] = slot0[18],
	[403] = slot0[17],
	[406] = slot0[19],
	[3] = slot0[4],
	[5] = slot0[6],
	[4] = slot0[5],
	[7] = slot0[8],
	[6] = slot0[7],
	[9] = slot0[10],
	[8] = slot0[9],
	[504] = slot0[15],
	[505] = slot0[18],
	[502] = slot0[2],
	[302] = slot0[2],
	[409] = slot0[10],
	[402] = slot0[2],
	[201] = slot0[2],
	[309] = slot0[10],
	[203] = slot0[15],
	[202] = slot0[3],
	[205] = slot0[6],
	[204] = slot0[4],
	[207] = slot0[8],
	[206] = slot0[7],
	[209] = slot0[10],
	[208] = slot0[9],
	[301] = slot0[16],
	[303] = slot0[17],
	[304] = slot0[15],
	[305] = slot0[18],
	[306] = slot0[19],
	[307] = slot0[20],
	[501] = slot0[16],
	[108] = slot0[9],
	[109] = slot0[10],
	[507] = slot0[20],
	[102] = slot0[3],
	[103] = slot0[4],
	[101] = slot0[2],
	[106] = slot0[7],
	[107] = slot0[8],
	[104] = slot0[5],
	[105] = slot0[6],
	[11] = slot0[12],
	[10] = slot0[11],
	[13] = slot0[14],
	[12] = slot0[13],
	[401] = slot0[16],
	[512] = slot0[13],
	[503] = slot0[17],
	[410] = slot0[11],
	[411] = slot0[12],
	[412] = slot0[13],
	[413] = slot0[14],
	[511] = slot0[12],
	[510] = slot0[11],
	[513] = slot0[14],
	[408] = slot0[9],
	[506] = slot0[19]
}
csv.pwflop_award = {
	{
		showWeight = 150,
		id = 1,
		group = "W1",
		weight = 200,
		award = slot1[1]
	},
	{
		showWeight = 150,
		id = 2,
		group = "W1",
		weight = 200,
		award = slot1[2]
	},
	{
		id = 3,
		group = "W1",
		award = slot1[3]
	},
	{
		id = 4,
		group = "W1",
		award = slot1[4]
	},
	{
		showWeight = 100,
		id = 5,
		group = "W1",
		weight = 100,
		award = slot1[5]
	},
	{
		showWeight = 80,
		id = 6,
		group = "W1",
		weight = 80,
		award = slot1[6]
	},
	{
		showWeight = 40,
		id = 7,
		group = "W1",
		weight = 40,
		award = slot1[7]
	},
	{
		showWeight = 20,
		id = 8,
		group = "W1",
		weight = 20,
		award = slot1[8]
	},
	{
		showWeight = 60,
		id = 9,
		group = "W1",
		weight = 60,
		award = slot1[9]
	},
	{
		showWeight = 60,
		id = 10,
		group = "W1",
		weight = 60,
		award = slot1[10]
	},
	{
		showWeight = 60,
		id = 11,
		group = "W1",
		weight = 60,
		award = slot1[11]
	},
	{
		showWeight = 60,
		id = 12,
		group = "W1",
		weight = 60,
		award = slot1[12]
	},
	{
		showWeight = 60,
		id = 13,
		group = "W1",
		weight = 60,
		award = slot1[13]
	},
	__size = 78,
	[101] = {
		showWeight = 150,
		id = 101,
		group = "W2",
		weight = 200,
		award = slot1[101]
	},
	[102] = {
		showWeight = 150,
		id = 102,
		group = "W2",
		weight = 200,
		award = slot1[102]
	},
	[103] = {
		id = 103,
		group = "W2",
		award = slot1[103]
	},
	[104] = {
		id = 104,
		group = "W2",
		award = slot1[104]
	},
	[105] = {
		showWeight = 100,
		id = 105,
		group = "W2",
		weight = 100,
		award = slot1[105]
	},
	[106] = {
		showWeight = 80,
		id = 106,
		group = "W2",
		weight = 80,
		award = slot1[106]
	},
	[107] = {
		showWeight = 40,
		id = 107,
		group = "W2",
		weight = 40,
		award = slot1[107]
	},
	[108] = {
		showWeight = 20,
		id = 108,
		group = "W2",
		weight = 20,
		award = slot1[108]
	},
	[109] = {
		showWeight = 60,
		id = 109,
		group = "W2",
		weight = 60,
		award = slot1[109]
	},
	[110] = {
		showWeight = 60,
		id = 110,
		group = "W2",
		weight = 60,
		award = slot1[110]
	},
	[111] = {
		showWeight = 60,
		id = 111,
		group = "W2",
		weight = 60,
		award = slot1[111]
	},
	[112] = {
		showWeight = 60,
		id = 112,
		group = "W2",
		weight = 60,
		award = slot1[112]
	},
	[113] = {
		showWeight = 60,
		id = 113,
		group = "W2",
		weight = 60,
		award = slot1[113]
	},
	[201] = {
		showWeight = 150,
		id = 201,
		group = "W3",
		weight = 200,
		award = slot1[201]
	},
	[202] = {
		showWeight = 150,
		id = 202,
		group = "W3",
		weight = 200,
		award = slot1[202]
	},
	[203] = {
		id = 203,
		group = "W3",
		award = slot1[203]
	},
	[204] = {
		id = 204,
		group = "W3",
		award = slot1[204]
	},
	[205] = {
		showWeight = 100,
		id = 205,
		group = "W3",
		weight = 100,
		award = slot1[205]
	},
	[206] = {
		showWeight = 80,
		id = 206,
		group = "W3",
		weight = 80,
		award = slot1[206]
	},
	[207] = {
		showWeight = 40,
		id = 207,
		group = "W3",
		weight = 40,
		award = slot1[207]
	},
	[208] = {
		showWeight = 20,
		id = 208,
		group = "W3",
		weight = 20,
		award = slot1[208]
	},
	[209] = {
		showWeight = 60,
		id = 209,
		group = "W3",
		weight = 60,
		award = slot1[209]
	},
	[210] = {
		showWeight = 60,
		id = 210,
		group = "W3",
		weight = 60,
		award = slot1[210]
	},
	[211] = {
		showWeight = 60,
		id = 211,
		group = "W3",
		weight = 60,
		award = slot1[211]
	},
	[212] = {
		showWeight = 60,
		id = 212,
		group = "W3",
		weight = 60,
		award = slot1[212]
	},
	[213] = {
		showWeight = 60,
		id = 213,
		group = "W3",
		weight = 60,
		award = slot1[213]
	},
	[301] = {
		showWeight = 150,
		id = 301,
		group = "L1",
		weight = 200,
		award = slot1[301]
	},
	[302] = {
		showWeight = 150,
		id = 302,
		group = "L1",
		weight = 200,
		award = slot1[302]
	},
	[303] = {
		id = 303,
		group = "L1",
		award = slot1[303]
	},
	[304] = {
		showWeight = 0,
		id = 304,
		group = "L1",
		weight = 0,
		award = slot1[304]
	},
	[305] = {
		showWeight = 100,
		id = 305,
		group = "L1",
		weight = 100,
		award = slot1[305]
	},
	[306] = {
		showWeight = 80,
		id = 306,
		group = "L1",
		weight = 80,
		award = slot1[306]
	},
	[307] = {
		showWeight = 40,
		id = 307,
		group = "L1",
		weight = 40,
		award = slot1[307]
	},
	[308] = {
		showWeight = 0,
		id = 308,
		group = "L1",
		weight = 0,
		award = slot1[308]
	},
	[309] = {
		showWeight = 60,
		id = 309,
		group = "L1",
		weight = 60,
		award = slot1[309]
	},
	[310] = {
		showWeight = 0,
		id = 310,
		group = "L1",
		weight = 0,
		award = slot1[310]
	},
	[311] = {
		showWeight = 60,
		id = 311,
		group = "L1",
		weight = 60,
		award = slot1[311]
	},
	[312] = {
		showWeight = 0,
		id = 312,
		group = "L1",
		weight = 0,
		award = slot1[312]
	},
	[313] = {
		showWeight = 0,
		id = 313,
		group = "L1",
		weight = 0,
		award = slot1[313]
	},
	[401] = {
		showWeight = 150,
		id = 401,
		group = "L2",
		weight = 200,
		award = slot1[401]
	},
	[402] = {
		showWeight = 150,
		id = 402,
		group = "L2",
		weight = 200,
		award = slot1[402]
	},
	[403] = {
		id = 403,
		group = "L2",
		award = slot1[403]
	},
	[404] = {
		showWeight = 0,
		id = 404,
		group = "L2",
		weight = 0,
		award = slot1[404]
	},
	[405] = {
		showWeight = 100,
		id = 405,
		group = "L2",
		weight = 100,
		award = slot1[405]
	},
	[406] = {
		showWeight = 80,
		id = 406,
		group = "L2",
		weight = 80,
		award = slot1[406]
	},
	[407] = {
		showWeight = 40,
		id = 407,
		group = "L2",
		weight = 40,
		award = slot1[407]
	},
	[408] = {
		showWeight = 0,
		id = 408,
		group = "L2",
		weight = 0,
		award = slot1[408]
	},
	[409] = {
		showWeight = 60,
		id = 409,
		group = "L2",
		weight = 60,
		award = slot1[409]
	},
	[410] = {
		showWeight = 0,
		id = 410,
		group = "L2",
		weight = 0,
		award = slot1[410]
	},
	[411] = {
		showWeight = 60,
		id = 411,
		group = "L2",
		weight = 60,
		award = slot1[411]
	},
	[412] = {
		showWeight = 0,
		id = 412,
		group = "L2",
		weight = 0,
		award = slot1[412]
	},
	[413] = {
		showWeight = 0,
		id = 413,
		group = "L2",
		weight = 0,
		award = slot1[413]
	},
	[501] = {
		showWeight = 150,
		id = 501,
		group = "L3",
		weight = 200,
		award = slot1[501]
	},
	[502] = {
		showWeight = 150,
		id = 502,
		group = "L3",
		weight = 200,
		award = slot1[502]
	},
	[503] = {
		id = 503,
		group = "L3",
		award = slot1[503]
	},
	[504] = {
		showWeight = 0,
		id = 504,
		group = "L3",
		weight = 0,
		award = slot1[504]
	},
	[505] = {
		showWeight = 100,
		id = 505,
		group = "L3",
		weight = 100,
		award = slot1[505]
	},
	[506] = {
		showWeight = 80,
		id = 506,
		group = "L3",
		weight = 80,
		award = slot1[506]
	},
	[507] = {
		showWeight = 40,
		id = 507,
		group = "L3",
		weight = 40,
		award = slot1[507]
	},
	[508] = {
		showWeight = 0,
		id = 508,
		group = "L3",
		weight = 0,
		award = slot1[508]
	},
	[509] = {
		showWeight = 60,
		id = 509,
		group = "L3",
		weight = 60,
		award = slot1[509]
	},
	[510] = {
		showWeight = 0,
		id = 510,
		group = "L3",
		weight = 0,
		award = slot1[510]
	},
	[511] = {
		showWeight = 60,
		id = 511,
		group = "L3",
		weight = 60,
		award = slot1[511]
	},
	[512] = {
		showWeight = 0,
		id = 512,
		group = "L3",
		weight = 0,
		award = slot1[512]
	},
	[513] = {
		showWeight = 0,
		id = 513,
		group = "L3",
		weight = 0,
		award = slot1[513]
	},
	__default = {
		__index = {
			group = "",
			weight = 10,
			showWeight = 10,
			award = {
				__size = 0
			}
		}
	}
}

return csv.pwflop_award
