slot0 = {
	__size = 4,
	[2] = {},
	[7] = {
		101,
		102,
		103
	},
	[9] = {
		[6.0] = 1,
		__size = 1
	},
	[13] = {
		{
			1,
			4,
			10
		},
		{
			4,
			8,
			20
		},
		{
			8,
			14,
			50
		}
	}
}
slot1 = {
	slot0[7],
	default = slot0[2],
	[102] = slot0[7],
	[103] = slot0[7],
	[101] = slot0[7],
	[104] = slot0[7]
}
slot2 = {
	slot0[9],
	[102] = slot0[9],
	[101] = slot0[9],
	[104] = slot0[9],
	[103] = slot0[9]
}
slot3 = {
	[102] = slot0[13],
	[103] = slot0[13],
	[101] = slot0[13],
	[104] = slot0[13]
}
slot5 = {
	[102] = slot0[2],
	[103] = slot0[2],
	[101] = slot0[2],
	[104] = slot0[2]
}
csv.brave_challenge.base = {
	{
		achievementID = 2415,
		mp = 0.75,
		background = "activity/brave_challenge/bg_yztz_1.png",
		goldLimit = 8000000,
		timesLimit = 5,
		sameTimes = 3,
		lastAnimation = "effect/jiesuan.skel",
		genSeqID = 1,
		id = 1,
		weightUp = 10,
		achiSeqID = 1,
		cards = {
			1,
			2
		},
		badgeCards = {
			3
		},
		monsterCards = slot1[1],
		gateSeq = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11
		},
		floorFail = slot2[1]
	},
	__size = 5,
	[101] = {
		title = "Brave",
		isStarAttrAdd = true,
		isDailyBadge = true,
		achiSeqID = 101,
		goldLimit = 3000000,
		isShowAward = true,
		addTimes = 3,
		mp = 0.75,
		timesLimit = 10,
		sameTimes = 3,
		isDailyRecover = true,
		lastAnimation = "effect/jiesuan_1.skel",
		background = "activity/brave_challenge/bg_yztz_3.png",
		genSeqID = 101,
		id = 101,
		weightUp = 10,
		isDailyUnlockCard = true,
		buyCost = slot5[101],
		cards = {
			4
		},
		badgeCards = {
			5
		},
		monsterCards = slot1[101],
		gateSeq = {
			101,
			102,
			103,
			104,
			105,
			106,
			107,
			108,
			109,
			110,
			111
		},
		floorFail = slot2[101],
		dailyWeightUp = slot3[101]
	},
	[102] = {
		title = "Legend",
		isStarAttrAdd = true,
		isDailyBadge = true,
		achiSeqID = 201,
		goldLimit = 3000000,
		isShowAward = true,
		addTimes = 3,
		mp = 0.75,
		timesLimit = 10,
		sameTimes = 3,
		isDailyRecover = true,
		lastAnimation = "effect/jiesuan_2.skel",
		background = "activity/brave_challenge/bg_yztz_3.png",
		genSeqID = 201,
		id = 102,
		weightUp = 10,
		isDailyUnlockCard = true,
		buyCost = slot5[102],
		cards = {
			6
		},
		badgeCards = {
			7
		},
		monsterCards = slot1[102],
		gateSeq = {
			201,
			202,
			203,
			204,
			205,
			206,
			207,
			208,
			209,
			210,
			211
		},
		floorFail = slot2[102],
		dailyWeightUp = slot3[102]
	},
	[103] = {
		title = "Dragon",
		isStarAttrAdd = true,
		isDailyBadge = true,
		achiSeqID = 301,
		goldLimit = 3000000,
		isShowAward = true,
		addTimes = 3,
		mp = 0.75,
		timesLimit = 10,
		sameTimes = 3,
		isDailyRecover = true,
		lastAnimation = "effect/jiesuan_3.skel",
		background = "activity/brave_challenge/bg_yztz_3.png",
		genSeqID = 301,
		id = 103,
		weightUp = 10,
		isDailyUnlockCard = true,
		buyCost = slot5[103],
		cards = {
			8
		},
		badgeCards = {
			9
		},
		monsterCards = slot1[103],
		gateSeq = {
			301,
			302,
			303,
			304,
			305,
			306,
			307,
			308,
			309,
			310,
			311
		},
		floorFail = slot2[103],
		dailyWeightUp = slot3[103]
	},
	[104] = {
		title = "Battle Chapter",
		isStarAttrAdd = true,
		isDailyBadge = true,
		achiSeqID = 401,
		goldLimit = 3000000,
		isShowAward = true,
		addTimes = 3,
		mp = 0.75,
		timesLimit = 10,
		sameTimes = 3,
		isDailyRecover = true,
		lastAnimation = "effect/jiesuan_4.skel",
		background = "activity/brave_challenge/bg_yztz_3.png",
		genSeqID = 401,
		id = 104,
		weightUp = 10,
		isDailyUnlockCard = true,
		buyCost = slot5[104],
		cards = {
			10
		},
		badgeCards = {
			11
		},
		monsterCards = slot1[104],
		gateSeq = {
			401,
			402,
			403,
			404,
			405,
			406,
			407,
			408,
			409,
			410,
			411
		},
		floorFail = slot2[104],
		dailyWeightUp = slot3[104]
	},
	__default = {
		__index = {
			isDailyBadge = false,
			achiSeqID = 0,
			weightUp = 0,
			title = "Brave Challenge",
			sameTimes = 999,
			goldLimit = 0,
			achievementID = 0,
			isShowAward = false,
			addTimes = 0,
			mp = 0,
			timesLimit = 0,
			buyTimes = 0,
			isDailyRecover = false,
			lastAnimation = "",
			background = "",
			genSeqID = 0,
			isStarAttrAdd = false,
			badgeLibID = 2001,
			isDailyUnlockCard = false,
			buyCost = {
				10,
				20,
				30
			},
			cards = ({
				default = slot0[2]
			}).default,
			badgeCards = ({
				default = slot0[2]
			}).default,
			monsterCards = slot1.default,
			gateSeq = ({
				default = slot0[2]
			}).default,
			floorFail = {
				__size = 0
			},
			dailyWeightUp = {
				{
					1,
					999,
					0
				}
			}
		}
	}
}

return csv.brave_challenge.base
