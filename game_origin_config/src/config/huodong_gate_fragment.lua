slot0 = {
	{},
	{
		60301,
		60302,
		60303,
		60304,
		60305,
		60306,
		60307
	},
	__size = 12,
	[5] = {
		1,
		2,
		3,
		4,
		5,
		6,
		7
	},
	[6] = {
		60321,
		60322,
		60323,
		60324,
		60325,
		60326,
		60327
	},
	[10] = {
		60341,
		60342,
		60343,
		60344,
		60345,
		60346,
		60347
	},
	[14] = {
		60361,
		60362,
		60363,
		60364,
		60365,
		60366,
		60367
	},
	[17] = {
		60381,
		60382,
		60383,
		60384,
		60385,
		60386,
		60387
	},
	[21] = {
		60401,
		60402,
		60403,
		60404,
		60405,
		60406,
		60407
	},
	[25] = {
		60411,
		60412,
		60413,
		60414,
		60415,
		60416,
		60417
	},
	[28] = {
		60421,
		60422,
		60423,
		60424,
		60425,
		60426,
		60427
	},
	[31] = {
		60431,
		60432,
		60433,
		60434,
		60435,
		60436,
		60437
	},
	[34] = {
		60441,
		60442,
		60443,
		60444,
		60445,
		60446,
		60447
	}
}
slot2 = {
	slot0[2],
	slot0[6],
	[10] = slot0[34],
	default = slot0[1],
	[3] = slot0[10],
	[5] = slot0[17],
	[4] = slot0[14],
	[7] = slot0[25],
	[6] = slot0[21],
	[9] = slot0[31],
	[8] = slot0[28]
}
slot3 = {
	slot0[2],
	slot0[6],
	[10] = slot0[34],
	default = slot0[1],
	[3] = slot0[10],
	[5] = slot0[17],
	[4] = slot0[14],
	[7] = slot0[25],
	[6] = slot0[21],
	[9] = slot0[31],
	[8] = slot0[28]
}
slot4 = {
	slot0[2],
	slot0[6],
	[10] = slot0[34],
	default = slot0[1],
	[3] = slot0[10],
	[5] = slot0[17],
	[4] = slot0[14],
	[7] = slot0[25],
	[6] = slot0[21],
	[9] = slot0[31],
	[8] = slot0[28]
}
slot5 = {
	slot0[2],
	slot0[6],
	[10] = slot0[34],
	default = slot0[1],
	[3] = slot0[10],
	[5] = slot0[17],
	[4] = slot0[14],
	[7] = slot0[25],
	[6] = slot0[21],
	[9] = slot0[31],
	[8] = slot0[28]
}
slot7 = {
	slot0[5],
	[10] = slot0[5],
	default = slot0[1],
	[4] = slot0[5],
	[7] = slot0[5],
	[9] = slot0[5],
	[8] = slot0[5]
}
csv.huodong_gate_fragment = {
	{
		cd = 2,
		id = 1,
		gateGroup = slot5[1],
		gateGroup_tw = slot3[1],
		gateGroup_en = slot2[1],
		gateGroup_kr = slot4[1],
		markIDs = {
			271,
			261,
			751,
			131,
			1241,
			2011
		},
		dropItems = {
			{
				20271,
				1,
				100
			},
			{
				20261,
				1,
				100
			},
			{
				20751,
				1,
				100
			},
			{
				20131,
				1,
				100
			},
			{
				21241,
				1,
				100
			},
			{
				22011,
				1,
				100
			}
		},
		date = slot7[1]
	},
	{
		cd = 2,
		id = 2,
		gateGroup = slot5[2],
		gateGroup_tw = slot3[2],
		gateGroup_en = slot2[2],
		gateGroup_kr = slot4[2],
		markIDs = {
			1221,
			91,
			11,
			1421,
			731,
			2481
		},
		dropItems = {
			{
				21221,
				1,
				100
			},
			{
				20091,
				1,
				100
			},
			{
				20011,
				1,
				100
			},
			{
				21421,
				1,
				100
			},
			{
				20731,
				1,
				100
			},
			{
				22481,
				1,
				100
			}
		},
		date = {
			1,
			2,
			3,
			4,
			5
		}
	},
	{
		id = 3,
		cd = 2,
		randomValue = 200,
		gateGroup = slot5[3],
		gateGroup_tw = slot3[3],
		gateGroup_en = slot2[3],
		gateGroup_kr = slot4[3],
		markIDs = {
			471,
			391,
			721,
			1611,
			1291,
			3291
		},
		dropItems = {
			{
				20471,
				1,
				100
			},
			{
				20391,
				1,
				100
			},
			{
				20721,
				1,
				100
			},
			{
				21611,
				1,
				100
			},
			{
				21291,
				1,
				100
			},
			{
				23291,
				1,
				100
			}
		},
		date = {
			4,
			5,
			6,
			7
		}
	},
	{
		cd = 2,
		id = 4,
		gateGroup = slot5[4],
		gateGroup_tw = slot3[4],
		gateGroup_en = slot2[4],
		gateGroup_kr = slot4[4],
		markIDs = {
			1171,
			301,
			1,
			3541,
			21,
			1231
		},
		dropItems = {
			{
				21171,
				1,
				100
			},
			{
				20301,
				1,
				100
			},
			{
				20001,
				1,
				100
			},
			{
				23541,
				1,
				100
			},
			{
				20021,
				1,
				100
			},
			{
				21231,
				1,
				100
			}
		},
		date = slot7[4]
	},
	{
		cd = 2,
		id = 5,
		gateGroup = slot5[5],
		gateGroup_tw = slot3[5],
		gateGroup_en = slot2[5],
		gateGroup_kr = slot4[5],
		markIDs = {
			631,
			3281,
			791,
			741,
			3301,
			691
		},
		dropItems = {
			{
				20631,
				1,
				100
			},
			{
				23281,
				1,
				100
			},
			{
				20791,
				1,
				100
			},
			{
				20741,
				1,
				100
			},
			{
				23301,
				1,
				100
			},
			{
				20691,
				1,
				100
			}
		},
		date = {
			5,
			6,
			7
		}
	},
	{
		id = 6,
		cd = 1,
		randomValue = 300,
		gateGroup = slot5[6],
		gateGroup_tw = slot3[6],
		gateGroup_en = slot2[6],
		gateGroup_kr = slot4[6],
		markIDs = {
			1251,
			591,
			2271,
			3471,
			601,
			331
		},
		dropItems = {
			{
				21251,
				1,
				100
			},
			{
				20591,
				1,
				100
			},
			{
				22271,
				1,
				100
			},
			{
				23471,
				1,
				100
			},
			{
				20601,
				1,
				100
			},
			{
				20331,
				1,
				100
			}
		},
		date = {
			6,
			7
		}
	},
	{
		id = 7,
		cd = 1,
		randomValue = 300,
		gateGroup = slot5[7],
		gateGroup_tw = slot3[7],
		gateGroup_en = slot2[7],
		gateGroup_kr = slot4[7],
		markIDs = {
			51,
			801,
			2631,
			1841,
			3351,
			3411
		},
		dropItems = {
			{
				20051,
				1,
				100
			},
			{
				20801,
				1,
				100
			},
			{
				22631,
				1,
				100
			},
			{
				21841,
				1,
				100
			},
			{
				23351,
				1,
				100
			},
			{
				23411,
				1,
				100
			}
		},
		date = slot7[7]
	},
	{
		id = 8,
		cd = 1,
		randomValue = 300,
		gateGroup = slot5[8],
		gateGroup_tw = slot3[8],
		gateGroup_en = slot2[8],
		gateGroup_kr = slot4[8],
		markIDs = {
			461,
			1441,
			2871,
			1071,
			3141,
			1391
		},
		dropItems = {
			{
				20461,
				1,
				100
			},
			{
				21441,
				1,
				100
			},
			{
				22871,
				1,
				100
			},
			{
				21071,
				1,
				100
			},
			{
				23141,
				1,
				100
			},
			{
				21391,
				1,
				100
			}
		},
		date = slot7[8]
	},
	{
		id = 9,
		cd = 1,
		randomValue = 300,
		gateGroup = slot5[9],
		gateGroup_tw = slot3[9],
		gateGroup_en = slot2[9],
		gateGroup_kr = slot4[9],
		markIDs = {
			481,
			2071,
			3011,
			3501,
			1501,
			571
		},
		dropItems = {
			{
				20481,
				1,
				100
			},
			{
				22071,
				1,
				100
			},
			{
				23011,
				1,
				100
			},
			{
				23501,
				1,
				100
			},
			{
				21501,
				1,
				100
			},
			{
				20571,
				1,
				100
			}
		},
		date = slot7[9]
	},
	{
		id = 10,
		cd = 2,
		randomValue = 200,
		gateGroup = slot5[10],
		gateGroup_tw = slot3[10],
		gateGroup_en = slot2[10],
		gateGroup_kr = slot4[10],
		markIDs = {
			551,
			2301,
			3341,
			3431,
			1811,
			3021
		},
		dropItems = {
			{
				20551,
				1,
				100
			},
			{
				22301,
				1,
				100
			},
			{
				23341,
				1,
				100
			},
			{
				23431,
				1,
				100
			},
			{
				21811,
				1,
				100
			},
			{
				23021,
				1,
				100
			}
		},
		date = slot7[10]
	},
	__size = 10,
	__default = {
		__index = {
			cd = 0,
			randomValue = 100,
			gateGroup = slot5.default,
			gateGroup_tw = slot3.default,
			gateGroup_en = slot2.default,
			gateGroup_kr = slot4.default,
			markIDs = ({
				default = slot0[1]
			}).default,
			dropItems = ({
				default = slot0[1]
			}).default,
			date = slot7.default
		}
	}
}

return csv.huodong_gate_fragment
