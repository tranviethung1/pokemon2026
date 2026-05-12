slot0 = {
	[4] = {
		0.6
	},
	[12] = {
		0.5,
		0.6
	},
	[13] = {
		0.6,
		0.7
	},
	[14] = {
		0.7,
		0.8
	},
	[15] = {
		0.8,
		0.9
	},
	[22] = {
		1.5,
		1.6
	},
	[23] = {
		1.6,
		1.7
	},
	[24] = {
		0,
		0.1
	},
	[25] = {
		0.55
	},
	[26] = {
		0.1,
		0.2
	},
	[30] = {
		1.5
	},
	[57] = {
		1
	}
}
csv.damage_correct = {
	{
		type = 2,
		rangeType = 2,
		id = 1,
		formulaType = 1,
		range = {
			0,
			0.24
		}
	},
	{
		type = 2,
		rangeType = 2,
		id = 2,
		formulaType = 1,
		range = {
			0.6,
			99
		}
	},
	{
		type = 2,
		rate = 0.78,
		rangeType = 2,
		id = 3,
		formulaType = 2,
		range = {
			0.24,
			0.3
		},
		args = slot0[4]
	},
	{
		type = 2,
		rate = 0.72,
		rangeType = 2,
		id = 4,
		formulaType = 2,
		range = {
			0.3,
			0.35
		},
		args = slot0[4]
	},
	{
		type = 2,
		rate = 0.66,
		rangeType = 2,
		id = 5,
		formulaType = 2,
		range = {
			0.35,
			0.4
		},
		args = slot0[4]
	},
	{
		type = 2,
		rate = 0.6,
		rangeType = 2,
		id = 6,
		formulaType = 2,
		range = {
			0.4,
			0.45
		},
		args = slot0[4]
	},
	{
		type = 2,
		rate = 0.55,
		rangeType = 2,
		id = 7,
		formulaType = 2,
		range = {
			0.45,
			0.5
		},
		args = slot0[4]
	},
	{
		type = 2,
		rate = 0.5,
		rangeType = 2,
		id = 8,
		formulaType = 2,
		range = {
			0.5,
			0.55
		},
		args = slot0[4]
	},
	{
		type = 2,
		rate = 0.4,
		rangeType = 2,
		id = 9,
		formulaType = 2,
		range = {
			0.55,
			0.6
		},
		args = slot0[4]
	},
	__size = 62,
	[99] = {
		type = 1,
		rate = 0.08,
		rangeType = 2,
		id = 99,
		formulaType = 5,
		range = {
			-99,
			0
		}
	},
	[100] = {
		id = 100,
		formulaType = 1,
		type = 1,
		range = slot0[12]
	},
	[101] = {
		id = 101,
		formulaType = 1,
		type = 1,
		range = slot0[13]
	},
	[102] = {
		id = 102,
		formulaType = 1,
		type = 1,
		range = slot0[14]
	},
	[103] = {
		id = 103,
		formulaType = 1,
		type = 1,
		range = slot0[15]
	},
	[104] = {
		id = 104,
		formulaType = 1,
		type = 1,
		range = {
			0.9,
			1
		}
	},
	[105] = {
		id = 105,
		formulaType = 1,
		type = 1,
		range = {
			1,
			1.1
		}
	},
	[106] = {
		id = 106,
		formulaType = 1,
		type = 1,
		range = {
			1.1,
			1.2
		}
	},
	[107] = {
		id = 107,
		formulaType = 1,
		type = 1,
		range = {
			1.2,
			1.3
		}
	},
	[108] = {
		id = 108,
		formulaType = 1,
		type = 1,
		range = {
			1.3,
			1.4
		}
	},
	[109] = {
		id = 109,
		formulaType = 1,
		type = 1,
		range = {
			1.4,
			1.5
		}
	},
	[110] = {
		id = 110,
		formulaType = 1,
		type = 1,
		range = slot0[22]
	},
	[111] = {
		id = 111,
		formulaType = 1,
		type = 1,
		range = slot0[23]
	},
	[112] = {
		id = 112,
		type = 1,
		rate = 0.6,
		formulaType = 2,
		range = slot0[24],
		args = slot0[25]
	},
	[113] = {
		id = 113,
		type = 1,
		rate = 0.5,
		formulaType = 2,
		range = slot0[26],
		args = slot0[25]
	},
	[114] = {
		id = 114,
		type = 1,
		rate = 0.4,
		formulaType = 2,
		range = {
			0.2,
			0.3
		},
		args = slot0[25]
	},
	[115] = {
		id = 115,
		type = 1,
		rate = 0.3,
		formulaType = 2,
		range = {
			0.3,
			0.4
		},
		args = slot0[25]
	},
	[116] = {
		id = 116,
		type = 1,
		rate = 0.2,
		formulaType = 2,
		range = {
			0.4,
			0.5
		},
		args = slot0[25]
	},
	[117] = {
		id = 117,
		type = 1,
		rate = 0.6,
		formulaType = 3,
		range = slot0[22],
		args = slot0[30]
	},
	[118] = {
		id = 118,
		type = 1,
		rate = 0.6,
		formulaType = 3,
		range = slot0[23],
		args = slot0[30]
	},
	[119] = {
		id = 119,
		type = 1,
		rate = 0.65,
		formulaType = 3,
		range = {
			1.7,
			1.8
		},
		args = slot0[30]
	},
	[120] = {
		id = 120,
		type = 1,
		rate = 0.7,
		formulaType = 3,
		range = {
			1.8,
			1.9
		},
		args = slot0[30]
	},
	[121] = {
		id = 121,
		type = 1,
		rate = 0.7,
		formulaType = 3,
		range = {
			1.9,
			2
		},
		args = slot0[30]
	},
	[122] = {
		id = 122,
		type = 1,
		rate = 0.7,
		formulaType = 3,
		range = {
			2,
			2.1
		},
		args = slot0[30]
	},
	[123] = {
		id = 123,
		type = 1,
		rate = 0.7,
		formulaType = 3,
		range = {
			2.1,
			2.2
		},
		args = slot0[30]
	},
	[124] = {
		id = 124,
		type = 1,
		rate = 0.7,
		formulaType = 3,
		range = {
			2.2,
			2.3
		},
		args = slot0[30]
	},
	[125] = {
		id = 125,
		type = 1,
		rate = 0.7,
		formulaType = 3,
		range = {
			2.3,
			2.4
		},
		args = slot0[30]
	},
	[126] = {
		id = 126,
		type = 1,
		rate = 0.7,
		formulaType = 3,
		range = {
			2.4,
			2.5
		},
		args = slot0[30]
	},
	[127] = {
		id = 127,
		type = 1,
		rate = 0.7,
		formulaType = 3,
		range = {
			2.5,
			2.6
		},
		args = slot0[30]
	},
	[128] = {
		id = 128,
		type = 1,
		rate = 0.7,
		formulaType = 3,
		range = {
			2.6,
			2.7
		},
		args = slot0[30]
	},
	[129] = {
		id = 129,
		type = 1,
		rate = 0.68,
		formulaType = 3,
		range = {
			2.7,
			2.8
		},
		args = slot0[30]
	},
	[130] = {
		id = 130,
		type = 1,
		rate = 0.65,
		formulaType = 3,
		range = {
			2.8,
			2.9
		},
		args = slot0[30]
	},
	[131] = {
		id = 131,
		type = 1,
		rate = 0.65,
		formulaType = 3,
		range = {
			2.9,
			3
		},
		args = slot0[30]
	},
	[132] = {
		id = 132,
		type = 1,
		rate = 0.65,
		formulaType = 3,
		range = {
			3,
			3.1
		},
		args = slot0[30]
	},
	[133] = {
		id = 133,
		type = 1,
		rate = 0.65,
		formulaType = 3,
		range = {
			3.1,
			3.2
		},
		args = slot0[30]
	},
	[134] = {
		id = 134,
		type = 1,
		rate = 0.65,
		formulaType = 3,
		range = {
			3.2,
			3.3
		},
		args = slot0[30]
	},
	[135] = {
		id = 135,
		type = 1,
		rate = 0.65,
		formulaType = 3,
		range = {
			3.3,
			3.4
		},
		args = slot0[30]
	},
	[136] = {
		id = 136,
		type = 1,
		rate = 0.62,
		formulaType = 3,
		range = {
			3.4,
			3.5
		},
		args = slot0[30]
	},
	[137] = {
		id = 137,
		type = 1,
		rate = 0.6,
		formulaType = 3,
		range = {
			3.5,
			3.6
		},
		args = slot0[30]
	},
	[138] = {
		id = 138,
		type = 1,
		rate = 0.6,
		formulaType = 3,
		range = {
			3.6,
			3.7
		},
		args = slot0[30]
	},
	[139] = {
		id = 139,
		type = 1,
		rate = 0.58,
		formulaType = 3,
		range = {
			3.7,
			3.8
		},
		args = slot0[30]
	},
	[140] = {
		id = 140,
		type = 1,
		rate = 0.58,
		formulaType = 3,
		range = {
			3.8,
			3.9
		},
		args = slot0[30]
	},
	[141] = {
		id = 141,
		type = 1,
		rate = 0.55,
		formulaType = 3,
		range = {
			3.9,
			4
		},
		args = slot0[30]
	},
	[142] = {
		id = 142,
		type = 1,
		rate = 0.5,
		formulaType = 3,
		range = {
			4,
			4.1
		},
		args = slot0[30]
	},
	[143] = {
		id = 143,
		type = 1,
		rate = 0.5,
		formulaType = 3,
		range = {
			4.1,
			99
		},
		args = slot0[30]
	},
	[200] = {
		type = 3,
		rangeType = 2,
		id = 200,
		formulaType = 4,
		range = {
			0.2,
			0.5
		},
		args = slot0[57]
	},
	[201] = {
		type = 3,
		rangeType = 2,
		id = 201,
		formulaType = 4,
		range = {
			0.9,
			99
		},
		args = slot0[57]
	},
	[202] = {
		type = 3,
		rangeType = 2,
		id = 202,
		formulaType = 4,
		range = slot0[24],
		args = {
			1.3,
			1.25,
			1.21
		}
	},
	[203] = {
		type = 3,
		rangeType = 2,
		id = 203,
		formulaType = 4,
		range = slot0[26],
		args = {
			1.25,
			1.21,
			1.18
		}
	},
	[204] = {
		type = 3,
		rangeType = 2,
		id = 204,
		formulaType = 4,
		range = slot0[12],
		args = {
			0.87,
			0.91,
			0.94
		}
	},
	[205] = {
		type = 3,
		rangeType = 2,
		id = 205,
		formulaType = 4,
		range = slot0[13],
		args = {
			0.83,
			0.87,
			0.91
		}
	},
	[206] = {
		type = 3,
		rangeType = 2,
		id = 206,
		formulaType = 4,
		range = slot0[14],
		args = {
			0.79,
			0.83,
			0.88
		}
	},
	[207] = {
		type = 3,
		rangeType = 2,
		id = 207,
		formulaType = 4,
		range = slot0[15],
		args = {
			0.75,
			0.79,
			0.85
		}
	},
	__default = {
		__index = {
			rate = 1,
			rangeType = 1,
			range = {},
			args = {}
		}
	}
}

return csv.damage_correct
