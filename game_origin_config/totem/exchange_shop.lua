slot0 = {
	{
		__size = 0
	},
	__size = 5,
	[12] = {
		__size = 1,
		coin18 = 50
	},
	[57] = {
		__size = 1,
		coin18 = 200
	},
	[98] = {
		__size = 1,
		coin18 = 500
	},
	[113] = {
		__size = 1,
		coin18 = 2500
	}
}
slot1 = {
	[1304] = slot0[113],
	[1305] = slot0[113],
	[1140] = slot0[57],
	[1307] = slot0[113],
	[1301] = slot0[113],
	[1302] = slot0[113],
	[1303] = slot0[113],
	[1308] = slot0[113],
	[1306] = slot0[113],
	[1314] = slot0[113],
	[1313] = slot0[113],
	[1312] = slot0[113],
	[1311] = slot0[113],
	[1310] = slot0[113],
	[1309] = slot0[113],
	[1128] = slot0[57],
	[1129] = slot0[57],
	[1120] = slot0[57],
	[1121] = slot0[57],
	[1122] = slot0[57],
	[1123] = slot0[57],
	[1124] = slot0[57],
	[1125] = slot0[57],
	[1126] = slot0[57],
	[1127] = slot0[57],
	[1018] = slot0[12],
	[1019] = slot0[12],
	[1014] = slot0[12],
	[1015] = slot0[12],
	[1016] = slot0[12],
	[1017] = slot0[12],
	[1010] = slot0[12],
	[1011] = slot0[12],
	[1012] = slot0[12],
	[1013] = slot0[12],
	[1139] = slot0[57],
	[1138] = slot0[57],
	[1133] = slot0[57],
	[1132] = slot0[57],
	[1131] = slot0[57],
	[1130] = slot0[57],
	[1137] = slot0[57],
	[1136] = slot0[57],
	[1135] = slot0[57],
	[1134] = slot0[57],
	[1009] = slot0[12],
	[1008] = slot0[12],
	[1007] = slot0[12],
	[1006] = slot0[12],
	[1005] = slot0[12],
	[1004] = slot0[12],
	[1003] = slot0[12],
	[1002] = slot0[12],
	[1001] = slot0[12],
	default = slot0[1],
	[1038] = slot0[12],
	[1039] = slot0[12],
	[1032] = slot0[12],
	[1033] = slot0[12],
	[1030] = slot0[12],
	[1031] = slot0[12],
	[1036] = slot0[12],
	[1037] = slot0[12],
	[1034] = slot0[12],
	[1035] = slot0[12],
	[1212] = slot0[98],
	[1213] = slot0[98],
	[1210] = slot0[98],
	[1211] = slot0[98],
	[1214] = slot0[98],
	[1025] = slot0[12],
	[1024] = slot0[12],
	[1027] = slot0[12],
	[1026] = slot0[12],
	[1021] = slot0[12],
	[1020] = slot0[12],
	[1023] = slot0[12],
	[1022] = slot0[12],
	[1029] = slot0[12],
	[1028] = slot0[12],
	[1106] = slot0[57],
	[1107] = slot0[57],
	[1104] = slot0[57],
	[1105] = slot0[57],
	[1102] = slot0[57],
	[1103] = slot0[57],
	[1101] = slot0[57],
	[1108] = slot0[57],
	[1109] = slot0[57],
	[1209] = slot0[98],
	[1208] = slot0[98],
	[1205] = slot0[98],
	[1204] = slot0[98],
	[1207] = slot0[98],
	[1206] = slot0[98],
	[1201] = slot0[98],
	[1203] = slot0[98],
	[1202] = slot0[98],
	[1111] = slot0[57],
	[1110] = slot0[57],
	[1113] = slot0[57],
	[1112] = slot0[57],
	[1115] = slot0[57],
	[1114] = slot0[57],
	[1117] = slot0[57],
	[1116] = slot0[57],
	[1119] = slot0[57],
	[1118] = slot0[57],
	[1043] = slot0[12],
	[1042] = slot0[12],
	[1041] = slot0[12],
	[1040] = slot0[12],
	[1044] = slot0[12]
}
csv.totem.exchange_shop = {
	__size = 116,
	[101] = {
		limitType = 3,
		id = 101,
		group = 2,
		limitTimes = 5,
		costMap = {
			__size = 1,
			coin18 = 30
		},
		itemMap = {
			[8811.0] = 1,
			__size = 1
		}
	},
	[102] = {
		limitType = 3,
		id = 102,
		group = 2,
		limitTimes = 5,
		costMap = {
			__size = 1,
			coin18 = 120
		},
		itemMap = {
			[8812.0] = 1,
			__size = 1
		}
	},
	[103] = {
		limitType = 3,
		id = 103,
		group = 2,
		limitTimes = 3,
		costMap = {
			__size = 1,
			coin18 = 300
		},
		itemMap = {
			[8813.0] = 1,
			__size = 1
		}
	},
	[104] = {
		limitType = 3,
		id = 104,
		group = 2,
		limitTimes = 1,
		costMap = {
			__size = 1,
			coin18 = 1200
		},
		itemMap = {
			[8814.0] = 1,
			__size = 1
		}
	},
	[1001] = {
		limitType = 4,
		limitTimes = 8,
		id = 1001,
		costMap = slot1[1001],
		itemMap = {
			[8301.0] = 1,
			__size = 1
		}
	},
	[1002] = {
		limitType = 4,
		limitTimes = 8,
		id = 1002,
		costMap = slot1[1002],
		itemMap = {
			[8302.0] = 1,
			__size = 1
		}
	},
	[1003] = {
		limitType = 4,
		limitTimes = 8,
		id = 1003,
		costMap = slot1[1003],
		itemMap = {
			[8303.0] = 1,
			__size = 1
		}
	},
	[1004] = {
		limitType = 4,
		limitTimes = 8,
		id = 1004,
		costMap = slot1[1004],
		itemMap = {
			[8304.0] = 1,
			__size = 1
		}
	},
	[1005] = {
		limitType = 4,
		limitTimes = 8,
		id = 1005,
		costMap = slot1[1005],
		itemMap = {
			[8305.0] = 1,
			__size = 1
		}
	},
	[1006] = {
		limitType = 4,
		limitTimes = 8,
		id = 1006,
		costMap = slot1[1006],
		itemMap = {
			[8306.0] = 1,
			__size = 1
		}
	},
	[1007] = {
		limitType = 4,
		limitTimes = 8,
		id = 1007,
		costMap = slot1[1007],
		itemMap = {
			[8307.0] = 1,
			__size = 1
		}
	},
	[1008] = {
		limitType = 4,
		limitTimes = 8,
		id = 1008,
		costMap = slot1[1008],
		itemMap = {
			[8308.0] = 1,
			__size = 1
		}
	},
	[1009] = {
		limitType = 4,
		limitTimes = 8,
		id = 1009,
		costMap = slot1[1009],
		itemMap = {
			[8309.0] = 1,
			__size = 1
		}
	},
	[1010] = {
		limitType = 4,
		limitTimes = 8,
		id = 1010,
		costMap = slot1[1010],
		itemMap = {
			[8310.0] = 1,
			__size = 1
		}
	},
	[1011] = {
		limitType = 4,
		limitTimes = 8,
		id = 1011,
		costMap = slot1[1011],
		itemMap = {
			[8311.0] = 1,
			__size = 1
		}
	},
	[1012] = {
		limitType = 4,
		limitTimes = 8,
		id = 1012,
		costMap = slot1[1012],
		itemMap = {
			[8312.0] = 1,
			__size = 1
		}
	},
	[1013] = {
		limitType = 4,
		limitTimes = 8,
		id = 1013,
		costMap = slot1[1013],
		itemMap = {
			[8313.0] = 1,
			__size = 1
		}
	},
	[1014] = {
		limitType = 4,
		limitTimes = 8,
		id = 1014,
		costMap = slot1[1014],
		itemMap = {
			[8314.0] = 1,
			__size = 1
		}
	},
	[1015] = {
		limitType = 4,
		limitTimes = 8,
		id = 1015,
		costMap = slot1[1015],
		itemMap = {
			[8315.0] = 1,
			__size = 1
		}
	},
	[1016] = {
		limitType = 4,
		limitTimes = 8,
		id = 1016,
		costMap = slot1[1016],
		itemMap = {
			[8316.0] = 1,
			__size = 1
		}
	},
	[1017] = {
		limitType = 4,
		limitTimes = 8,
		id = 1017,
		costMap = slot1[1017],
		itemMap = {
			[8317.0] = 1,
			__size = 1
		}
	},
	[1018] = {
		limitType = 4,
		limitTimes = 8,
		id = 1018,
		costMap = slot1[1018],
		itemMap = {
			[8318.0] = 1,
			__size = 1
		}
	},
	[1019] = {
		limitType = 4,
		limitTimes = 8,
		id = 1019,
		costMap = slot1[1019],
		itemMap = {
			[8319.0] = 1,
			__size = 1
		}
	},
	[1020] = {
		limitType = 4,
		limitTimes = 8,
		id = 1020,
		costMap = slot1[1020],
		itemMap = {
			__size = 1,
			[8320.0] = 1
		}
	},
	[1021] = {
		limitType = 4,
		limitTimes = 8,
		id = 1021,
		costMap = slot1[1021],
		itemMap = {
			__size = 1,
			[8321.0] = 1
		}
	},
	[1022] = {
		limitType = 4,
		limitTimes = 8,
		id = 1022,
		costMap = slot1[1022],
		itemMap = {
			__size = 1,
			[8322.0] = 1
		}
	},
	[1023] = {
		limitType = 4,
		limitTimes = 8,
		id = 1023,
		costMap = slot1[1023],
		itemMap = {
			__size = 1,
			[8323.0] = 1
		}
	},
	[1024] = {
		limitType = 4,
		limitTimes = 8,
		id = 1024,
		costMap = slot1[1024],
		itemMap = {
			__size = 1,
			[8324.0] = 1
		}
	},
	[1025] = {
		limitType = 4,
		limitTimes = 8,
		id = 1025,
		costMap = slot1[1025],
		itemMap = {
			__size = 1,
			[8325.0] = 1
		}
	},
	[1026] = {
		limitType = 4,
		limitTimes = 8,
		id = 1026,
		costMap = slot1[1026],
		itemMap = {
			__size = 1,
			[8326.0] = 1
		}
	},
	[1027] = {
		limitType = 4,
		limitTimes = 8,
		id = 1027,
		costMap = slot1[1027],
		itemMap = {
			__size = 1,
			[8327.0] = 1
		}
	},
	[1028] = {
		limitType = 4,
		limitTimes = 8,
		id = 1028,
		costMap = slot1[1028],
		itemMap = {
			__size = 1,
			[8328.0] = 1
		}
	},
	[1029] = {
		limitType = 4,
		limitTimes = 8,
		id = 1029,
		costMap = slot1[1029],
		itemMap = {
			__size = 1,
			[8329.0] = 1
		}
	},
	[1030] = {
		limitType = 4,
		limitTimes = 8,
		id = 1030,
		costMap = slot1[1030],
		itemMap = {
			__size = 1,
			[8330.0] = 1
		}
	},
	[1031] = {
		limitType = 4,
		limitTimes = 8,
		id = 1031,
		costMap = slot1[1031],
		itemMap = {
			__size = 1,
			[8331.0] = 1
		}
	},
	[1032] = {
		limitType = 4,
		limitTimes = 8,
		id = 1032,
		costMap = slot1[1032],
		itemMap = {
			__size = 1,
			[8332.0] = 1
		}
	},
	[1033] = {
		limitType = 4,
		limitTimes = 8,
		id = 1033,
		costMap = slot1[1033],
		itemMap = {
			__size = 1,
			[8333.0] = 1
		}
	},
	[1034] = {
		limitType = 4,
		limitTimes = 8,
		id = 1034,
		costMap = slot1[1034],
		itemMap = {
			__size = 1,
			[8334.0] = 1
		}
	},
	[1035] = {
		limitType = 4,
		limitTimes = 8,
		id = 1035,
		costMap = slot1[1035],
		itemMap = {
			__size = 1,
			[8335.0] = 1
		}
	},
	[1036] = {
		limitType = 4,
		limitTimes = 8,
		id = 1036,
		costMap = slot1[1036],
		itemMap = {
			__size = 1,
			[8336.0] = 1
		}
	},
	[1037] = {
		limitType = 4,
		limitTimes = 8,
		id = 1037,
		costMap = slot1[1037],
		itemMap = {
			__size = 1,
			[8337.0] = 1
		}
	},
	[1038] = {
		limitType = 4,
		limitTimes = 8,
		id = 1038,
		costMap = slot1[1038],
		itemMap = {
			__size = 1,
			[8338.0] = 1
		}
	},
	[1039] = {
		limitType = 4,
		limitTimes = 8,
		id = 1039,
		costMap = slot1[1039],
		itemMap = {
			__size = 1,
			[8339.0] = 1
		}
	},
	[1040] = {
		limitType = 4,
		limitTimes = 8,
		id = 1040,
		costMap = slot1[1040],
		itemMap = {
			__size = 1,
			[8340.0] = 1
		}
	},
	[1041] = {
		limitType = 4,
		limitTimes = 8,
		id = 1041,
		costMap = slot1[1041],
		itemMap = {
			__size = 1,
			[8341.0] = 1
		}
	},
	[1042] = {
		limitType = 4,
		limitTimes = 8,
		id = 1042,
		costMap = slot1[1042],
		itemMap = {
			__size = 1,
			[8342.0] = 1
		}
	},
	[1043] = {
		limitType = 4,
		limitTimes = 8,
		id = 1043,
		costMap = slot1[1043],
		itemMap = {
			__size = 1,
			[8343.0] = 1
		}
	},
	[1044] = {
		limitType = 4,
		limitTimes = 8,
		id = 1044,
		costMap = slot1[1044],
		itemMap = {
			__size = 1,
			[8344.0] = 1
		}
	},
	[1101] = {
		limitType = 4,
		limitTimes = 8,
		id = 1101,
		costMap = slot1[1101],
		itemMap = {
			__size = 1,
			[8401.0] = 1
		}
	},
	[1102] = {
		limitType = 4,
		limitTimes = 8,
		id = 1102,
		costMap = slot1[1102],
		itemMap = {
			__size = 1,
			[8402.0] = 1
		}
	},
	[1103] = {
		limitType = 4,
		limitTimes = 8,
		id = 1103,
		costMap = slot1[1103],
		itemMap = {
			__size = 1,
			[8403.0] = 1
		}
	},
	[1104] = {
		limitType = 4,
		limitTimes = 8,
		id = 1104,
		costMap = slot1[1104],
		itemMap = {
			__size = 1,
			[8404.0] = 1
		}
	},
	[1105] = {
		limitType = 4,
		limitTimes = 8,
		id = 1105,
		costMap = slot1[1105],
		itemMap = {
			__size = 1,
			[8405.0] = 1
		}
	},
	[1106] = {
		limitType = 4,
		limitTimes = 8,
		id = 1106,
		costMap = slot1[1106],
		itemMap = {
			__size = 1,
			[8406.0] = 1
		}
	},
	[1107] = {
		limitType = 4,
		limitTimes = 8,
		id = 1107,
		costMap = slot1[1107],
		itemMap = {
			__size = 1,
			[8407.0] = 1
		}
	},
	[1108] = {
		limitType = 4,
		limitTimes = 8,
		id = 1108,
		costMap = slot1[1108],
		itemMap = {
			__size = 1,
			[8408.0] = 1
		}
	},
	[1109] = {
		limitType = 4,
		limitTimes = 8,
		id = 1109,
		costMap = slot1[1109],
		itemMap = {
			__size = 1,
			[8409.0] = 1
		}
	},
	[1110] = {
		limitType = 4,
		limitTimes = 8,
		id = 1110,
		costMap = slot1[1110],
		itemMap = {
			__size = 1,
			[8410.0] = 1
		}
	},
	[1111] = {
		limitType = 4,
		limitTimes = 8,
		id = 1111,
		costMap = slot1[1111],
		itemMap = {
			__size = 1,
			[8411.0] = 1
		}
	},
	[1112] = {
		limitType = 4,
		limitTimes = 8,
		id = 1112,
		costMap = slot1[1112],
		itemMap = {
			__size = 1,
			[8412.0] = 1
		}
	},
	[1113] = {
		limitType = 4,
		limitTimes = 8,
		id = 1113,
		costMap = slot1[1113],
		itemMap = {
			__size = 1,
			[8413.0] = 1
		}
	},
	[1114] = {
		limitType = 4,
		limitTimes = 8,
		id = 1114,
		costMap = slot1[1114],
		itemMap = {
			__size = 1,
			[8414.0] = 1
		}
	},
	[1115] = {
		limitType = 4,
		limitTimes = 8,
		id = 1115,
		costMap = slot1[1115],
		itemMap = {
			__size = 1,
			[8415.0] = 1
		}
	},
	[1116] = {
		limitType = 4,
		limitTimes = 8,
		id = 1116,
		costMap = slot1[1116],
		itemMap = {
			[8416.0] = 1,
			__size = 1
		}
	},
	[1117] = {
		limitType = 4,
		limitTimes = 8,
		id = 1117,
		costMap = slot1[1117],
		itemMap = {
			[8417.0] = 1,
			__size = 1
		}
	},
	[1118] = {
		limitType = 4,
		limitTimes = 8,
		id = 1118,
		costMap = slot1[1118],
		itemMap = {
			[8418.0] = 1,
			__size = 1
		}
	},
	[1119] = {
		limitType = 4,
		limitTimes = 8,
		id = 1119,
		costMap = slot1[1119],
		itemMap = {
			[8419.0] = 1,
			__size = 1
		}
	},
	[1120] = {
		limitType = 4,
		limitTimes = 8,
		id = 1120,
		costMap = slot1[1120],
		itemMap = {
			[8420.0] = 1,
			__size = 1
		}
	},
	[1121] = {
		limitType = 4,
		limitTimes = 8,
		id = 1121,
		costMap = slot1[1121],
		itemMap = {
			[8421.0] = 1,
			__size = 1
		}
	},
	[1122] = {
		limitType = 4,
		limitTimes = 8,
		id = 1122,
		costMap = slot1[1122],
		itemMap = {
			[8422.0] = 1,
			__size = 1
		}
	},
	[1123] = {
		limitType = 4,
		limitTimes = 8,
		id = 1123,
		costMap = slot1[1123],
		itemMap = {
			[8423.0] = 1,
			__size = 1
		}
	},
	[1124] = {
		limitType = 4,
		limitTimes = 8,
		id = 1124,
		costMap = slot1[1124],
		itemMap = {
			[8424.0] = 1,
			__size = 1
		}
	},
	[1125] = {
		limitType = 4,
		limitTimes = 8,
		id = 1125,
		costMap = slot1[1125],
		itemMap = {
			[8425.0] = 1,
			__size = 1
		}
	},
	[1126] = {
		limitType = 4,
		limitTimes = 8,
		id = 1126,
		costMap = slot1[1126],
		itemMap = {
			[8426.0] = 1,
			__size = 1
		}
	},
	[1127] = {
		limitType = 4,
		limitTimes = 8,
		id = 1127,
		costMap = slot1[1127],
		itemMap = {
			[8427.0] = 1,
			__size = 1
		}
	},
	[1128] = {
		limitType = 4,
		limitTimes = 8,
		id = 1128,
		costMap = slot1[1128],
		itemMap = {
			[8428.0] = 1,
			__size = 1
		}
	},
	[1129] = {
		limitType = 4,
		limitTimes = 8,
		id = 1129,
		costMap = slot1[1129],
		itemMap = {
			[8429.0] = 1,
			__size = 1
		}
	},
	[1130] = {
		limitType = 4,
		limitTimes = 8,
		id = 1130,
		costMap = slot1[1130],
		itemMap = {
			[8430.0] = 1,
			__size = 1
		}
	},
	[1131] = {
		limitType = 4,
		limitTimes = 8,
		id = 1131,
		costMap = slot1[1131],
		itemMap = {
			[8431.0] = 1,
			__size = 1
		}
	},
	[1132] = {
		limitType = 4,
		limitTimes = 8,
		id = 1132,
		costMap = slot1[1132],
		itemMap = {
			[8432.0] = 1,
			__size = 1
		}
	},
	[1133] = {
		limitType = 4,
		limitTimes = 8,
		id = 1133,
		costMap = slot1[1133],
		itemMap = {
			[8433.0] = 1,
			__size = 1
		}
	},
	[1134] = {
		limitType = 4,
		limitTimes = 8,
		id = 1134,
		costMap = slot1[1134],
		itemMap = {
			[8434.0] = 1,
			__size = 1
		}
	},
	[1135] = {
		limitType = 4,
		limitTimes = 8,
		id = 1135,
		costMap = slot1[1135],
		itemMap = {
			[8435.0] = 1,
			__size = 1
		}
	},
	[1136] = {
		limitType = 4,
		limitTimes = 8,
		id = 1136,
		costMap = slot1[1136],
		itemMap = {
			[8436.0] = 1,
			__size = 1
		}
	},
	[1137] = {
		limitType = 4,
		limitTimes = 8,
		id = 1137,
		costMap = slot1[1137],
		itemMap = {
			[8437.0] = 1,
			__size = 1
		}
	},
	[1138] = {
		limitType = 4,
		limitTimes = 8,
		id = 1138,
		costMap = slot1[1138],
		itemMap = {
			[8438.0] = 1,
			__size = 1
		}
	},
	[1139] = {
		limitType = 4,
		limitTimes = 8,
		id = 1139,
		costMap = slot1[1139],
		itemMap = {
			[8439.0] = 1,
			__size = 1
		}
	},
	[1140] = {
		limitType = 4,
		limitTimes = 8,
		id = 1140,
		costMap = slot1[1140],
		itemMap = {
			[8440.0] = 1,
			__size = 1
		}
	},
	[1201] = {
		limitType = 4,
		limitTimes = 5,
		id = 1201,
		costMap = slot1[1201],
		itemMap = {
			[8501.0] = 1,
			__size = 1
		}
	},
	[1202] = {
		limitType = 4,
		limitTimes = 5,
		id = 1202,
		costMap = slot1[1202],
		itemMap = {
			[8502.0] = 1,
			__size = 1
		}
	},
	[1203] = {
		limitType = 4,
		limitTimes = 5,
		id = 1203,
		costMap = slot1[1203],
		itemMap = {
			[8503.0] = 1,
			__size = 1
		}
	},
	[1204] = {
		limitType = 4,
		limitTimes = 5,
		id = 1204,
		costMap = slot1[1204],
		itemMap = {
			[8504.0] = 1,
			__size = 1
		}
	},
	[1205] = {
		limitType = 4,
		limitTimes = 5,
		id = 1205,
		costMap = slot1[1205],
		itemMap = {
			[8505.0] = 1,
			__size = 1
		}
	},
	[1206] = {
		limitType = 4,
		limitTimes = 5,
		id = 1206,
		costMap = slot1[1206],
		itemMap = {
			[8506.0] = 1,
			__size = 1
		}
	},
	[1207] = {
		limitType = 4,
		limitTimes = 5,
		id = 1207,
		costMap = slot1[1207],
		itemMap = {
			[8507.0] = 1,
			__size = 1
		}
	},
	[1208] = {
		limitType = 4,
		limitTimes = 5,
		id = 1208,
		costMap = slot1[1208],
		itemMap = {
			[8508.0] = 1,
			__size = 1
		}
	},
	[1209] = {
		limitType = 4,
		limitTimes = 5,
		id = 1209,
		costMap = slot1[1209],
		itemMap = {
			[8509.0] = 1,
			__size = 1
		}
	},
	[1210] = {
		limitType = 4,
		limitTimes = 5,
		id = 1210,
		costMap = slot1[1210],
		itemMap = {
			[8510.0] = 1,
			__size = 1
		}
	},
	[1211] = {
		limitType = 4,
		limitTimes = 5,
		id = 1211,
		costMap = slot1[1211],
		itemMap = {
			[8511.0] = 1,
			__size = 1
		}
	},
	[1212] = {
		limitType = 4,
		limitTimes = 5,
		id = 1212,
		costMap = slot1[1212],
		itemMap = {
			__size = 1,
			[8512.0] = 1
		}
	},
	[1213] = {
		limitType = 4,
		limitTimes = 5,
		id = 1213,
		costMap = slot1[1213],
		itemMap = {
			__size = 1,
			[8513.0] = 1
		}
	},
	[1214] = {
		limitType = 4,
		limitTimes = 5,
		id = 1214,
		costMap = slot1[1214],
		itemMap = {
			__size = 1,
			[8514.0] = 1
		}
	},
	[1301] = {
		limitType = 4,
		limitTimes = 2,
		id = 1301,
		costMap = slot1[1301],
		itemMap = {
			__size = 1,
			[8601.0] = 1
		}
	},
	[1302] = {
		limitType = 4,
		limitTimes = 2,
		id = 1302,
		costMap = slot1[1302],
		itemMap = {
			__size = 1,
			[8602.0] = 1
		}
	},
	[1303] = {
		limitType = 4,
		limitTimes = 2,
		id = 1303,
		costMap = slot1[1303],
		itemMap = {
			__size = 1,
			[8603.0] = 1
		}
	},
	[1304] = {
		limitType = 4,
		limitTimes = 2,
		id = 1304,
		costMap = slot1[1304],
		itemMap = {
			__size = 1,
			[8604.0] = 1
		}
	},
	[1305] = {
		limitType = 4,
		limitTimes = 2,
		id = 1305,
		costMap = slot1[1305],
		itemMap = {
			__size = 1,
			[8605.0] = 1
		}
	},
	[1306] = {
		limitType = 4,
		limitTimes = 2,
		id = 1306,
		costMap = slot1[1306],
		itemMap = {
			__size = 1,
			[8606.0] = 1
		}
	},
	[1307] = {
		limitType = 4,
		limitTimes = 2,
		id = 1307,
		costMap = slot1[1307],
		itemMap = {
			__size = 1,
			[8607.0] = 1
		}
	},
	[1308] = {
		limitType = 4,
		limitTimes = 2,
		id = 1308,
		costMap = slot1[1308],
		itemMap = {
			[8608.0] = 1,
			__size = 1
		}
	},
	[1309] = {
		limitType = 4,
		limitTimes = 2,
		id = 1309,
		costMap = slot1[1309],
		itemMap = {
			[8609.0] = 1,
			__size = 1
		}
	},
	[1310] = {
		limitType = 4,
		limitTimes = 2,
		id = 1310,
		costMap = slot1[1310],
		itemMap = {
			[8610.0] = 1,
			__size = 1
		}
	},
	[1311] = {
		limitType = 4,
		limitTimes = 2,
		id = 1311,
		costMap = slot1[1311],
		itemMap = {
			[8611.0] = 1,
			__size = 1
		}
	},
	[1312] = {
		limitType = 4,
		limitTimes = 2,
		id = 1312,
		costMap = slot1[1312],
		itemMap = {
			[8612.0] = 1,
			__size = 1
		}
	},
	[1313] = {
		limitType = 4,
		limitTimes = 2,
		id = 1313,
		costMap = slot1[1313],
		itemMap = {
			[8613.0] = 1,
			__size = 1
		}
	},
	[1314] = {
		limitType = 4,
		limitTimes = 2,
		id = 1314,
		costMap = slot1[1314],
		itemMap = {
			[8614.0] = 1,
			__size = 1
		}
	},
	__default = {
		__index = {
			limitType = 0,
			beginDate = 0,
			group = 1,
			showUnable = false,
			vipStart = 0,
			endDate = 20990101,
			exchangeLimit = -1,
			limitTimes = 0,
			regainHour = 0,
			sortValue = 0,
			costMap = slot1.default,
			itemMap = ({
				default = slot0[1]
			}).default,
			languages = {
				"cn",
				"br",
				"en",
				"vn",
				"th",
				"kr",
				"id"
			},
			levelRange = {
				1,
				150
			}
		}
	}
}

return csv.totem.exchange_shop
