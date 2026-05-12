slot0 = {
	__size = 2,
	[4] = {
		[21.0] = 1,
		__size = 1
	},
	[5] = {
		__size = 1,
		[101.0] = 1
	}
}
slot1 = {
	[603] = slot0[4],
	[602] = slot0[5],
	[702] = slot0[5],
	[703] = slot0[4],
	[24] = slot0[4],
	[22] = slot0[4],
	[23] = slot0[4],
	[403] = slot0[4],
	[402] = slot0[5],
	[502] = slot0[5],
	[503] = slot0[4],
	[203] = slot0[4],
	[202] = slot0[5],
	[302] = slot0[5],
	[303] = slot0[4],
	[1203] = slot0[4],
	[102] = slot0[5],
	[103] = slot0[4],
	[1202] = slot0[5],
	[902] = slot0[5],
	[903] = slot0[4],
	[1102] = slot0[5],
	[1103] = slot0[4],
	[803] = slot0[4],
	[802] = slot0[5],
	[1003] = slot0[4],
	[1002] = slot0[5]
}
csv.town.wish_draw_event = {
	{
		drawTriggerType = 4,
		drawType = "town_wish_make",
		id = 1,
		drawTriggerTimes = 1,
		lottery = {
			[3.0] = 1,
			__size = 1
		}
	},
	{
		probLimit = 1,
		drawType = "town_wish_make",
		id = 2,
		probInit = 0.25,
		startCount = 2,
		probStep = 0.15,
		drawTriggerType = 2,
		probEffectInterval = 5,
		probMiniTimes = 5,
		lottery = {
			[2.0] = 1,
			__size = 1
		}
	},
	__size = 29,
	[22] = {
		effectLimit = 1,
		drawType = "town_wish_reach",
		probEffectInterval = 999,
		probLimit = 1,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		id = 22,
		probMiniTimes = 6,
		lottery = slot1[22]
	},
	[23] = {
		effectLimit = 1,
		drawType = "town_wish_reach",
		probEffectInterval = 999,
		probLimit = 1,
		probInit = 0.1,
		startCount = 9,
		probStep = 0.05,
		drawTriggerType = 2,
		id = 23,
		probMiniTimes = 12,
		lottery = slot1[23]
	},
	[24] = {
		effectLimit = 1,
		drawType = "town_wish_reach",
		probEffectInterval = 999,
		probLimit = 1,
		probInit = 0.06,
		startCount = 20,
		probStep = 0.03,
		drawTriggerType = 2,
		id = 24,
		probMiniTimes = 20,
		lottery = slot1[24]
	},
	[102] = {
		probLimit = 1,
		drawType = "town_wish_reach10",
		id = 102,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[102]
	},
	[103] = {
		weightEnd = 0.06,
		drawTriggerType = 1,
		id = 103,
		weightStart = 0.01,
		startCount = 3,
		drawType = "town_wish_reach10",
		lottery = slot1[103]
	},
	[202] = {
		probLimit = 1,
		drawType = "town_wish_reach20",
		id = 202,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[202]
	},
	[203] = {
		weightEnd = 0.06,
		drawTriggerType = 1,
		id = 203,
		weightStart = 0.01,
		startCount = 3,
		drawType = "town_wish_reach20",
		lottery = slot1[203]
	},
	[302] = {
		probLimit = 1,
		drawType = "town_wish_reach30",
		id = 302,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[302]
	},
	[303] = {
		weightEnd = 0.09,
		drawTriggerType = 1,
		id = 303,
		weightStart = 0.015,
		startCount = 3,
		drawType = "town_wish_reach30",
		lottery = slot1[303]
	},
	[402] = {
		probLimit = 1,
		drawType = "town_wish_reach40",
		id = 402,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[402]
	},
	[403] = {
		weightEnd = 0.09,
		drawTriggerType = 1,
		id = 403,
		weightStart = 0.015,
		startCount = 3,
		drawType = "town_wish_reach40",
		lottery = slot1[403]
	},
	[502] = {
		probLimit = 1,
		drawType = "town_wish_reach50",
		id = 502,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[502]
	},
	[503] = {
		weightEnd = 0.12,
		drawTriggerType = 1,
		id = 503,
		weightStart = 0.02,
		startCount = 3,
		drawType = "town_wish_reach50",
		lottery = slot1[503]
	},
	[602] = {
		probLimit = 1,
		drawType = "town_wish_reach60",
		id = 602,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[602]
	},
	[603] = {
		weightEnd = 0.12,
		drawTriggerType = 1,
		id = 603,
		weightStart = 0.02,
		startCount = 3,
		drawType = "town_wish_reach60",
		lottery = slot1[603]
	},
	[702] = {
		probLimit = 1,
		drawType = "town_wish_reach70",
		id = 702,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[702]
	},
	[703] = {
		weightEnd = 0.15,
		drawTriggerType = 1,
		id = 703,
		weightStart = 0.025,
		startCount = 3,
		drawType = "town_wish_reach70",
		lottery = slot1[703]
	},
	[802] = {
		probLimit = 1,
		drawType = "town_wish_reach80",
		id = 802,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[802]
	},
	[803] = {
		weightEnd = 0.15,
		drawTriggerType = 1,
		id = 803,
		weightStart = 0.025,
		startCount = 3,
		drawType = "town_wish_reach80",
		lottery = slot1[803]
	},
	[902] = {
		probLimit = 1,
		drawType = "town_wish_reach90",
		id = 902,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[902]
	},
	[903] = {
		weightEnd = 0.18,
		drawTriggerType = 1,
		id = 903,
		weightStart = 0.03,
		startCount = 3,
		drawType = "town_wish_reach90",
		lottery = slot1[903]
	},
	[1002] = {
		probLimit = 1,
		drawType = "town_wish_reach100",
		id = 1002,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[1002]
	},
	[1003] = {
		weightEnd = 0.18,
		drawTriggerType = 1,
		id = 1003,
		weightStart = 0.03,
		startCount = 3,
		drawType = "town_wish_reach100",
		lottery = slot1[1003]
	},
	[1102] = {
		probLimit = 1,
		drawType = "town_wish_reach110",
		id = 1102,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[1102]
	},
	[1103] = {
		weightEnd = 0.21,
		drawTriggerType = 1,
		id = 1103,
		weightStart = 0.035,
		startCount = 3,
		drawType = "town_wish_reach110",
		lottery = slot1[1103]
	},
	[1202] = {
		probLimit = 1,
		drawType = "town_wish_reach120",
		id = 1202,
		probInit = 0.2,
		startCount = 3,
		probStep = 0.1,
		drawTriggerType = 2,
		probEffectInterval = 6,
		probMiniTimes = 6,
		lottery = slot1[1202]
	},
	[1203] = {
		weightEnd = 0.245,
		drawTriggerType = 1,
		id = 1203,
		weightStart = 0.040833333,
		startCount = 3,
		drawType = "town_wish_reach120",
		lottery = slot1[1203]
	},
	__default = {
		__index = {
			effectLimit = 0,
			drawType = "town_adventure1",
			weightStart = 0,
			probLimit = 0.2,
			drawTriggerTimes = 0,
			probInit = 0,
			probStep = 0.01,
			startCount = 0,
			weightEnd = 0,
			drawTriggerType = 0,
			probEffectInterval = 50,
			probMiniTimes = 30,
			lottery = {
				__size = 0
			}
		}
	}
}

return csv.town.wish_draw_event
