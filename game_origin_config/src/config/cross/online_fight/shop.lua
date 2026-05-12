slot0 = {
	{
		__size = 0
	},
	__size = 6,
	[5] = {
		__size = 1,
		coin12 = 1000
	},
	[6] = {
		150,
		150
	},
	[10] = {
		__size = 1,
		coin12 = 800
	},
	[32] = {
		__size = 1,
		coin12 = 8000
	},
	[49] = {
		__size = 1,
		coin12 = 100000
	}
}
slot1 = {
	[201] = slot0[6],
	[630] = slot0[6],
	[620] = slot0[6],
	[600] = slot0[6],
	[211] = slot0[6],
	[610] = slot0[6],
	[241] = slot0[6],
	[231] = slot0[6],
	[221] = slot0[6]
}
slot2 = {
	[201] = slot0[5],
	[775] = slot0[32],
	[751] = slot0[32],
	[620] = slot0[5],
	[771] = slot0[32],
	[211] = slot0[5],
	[761] = slot0[32],
	[777] = slot0[32],
	default = slot0[1],
	[1111] = slot0[49],
	[831] = slot0[5],
	[241] = slot0[10],
	[1101] = slot0[49],
	[811] = slot0[5],
	[821] = slot0[5],
	[231] = slot0[10],
	[221] = slot0[5]
}
csv.cross.online_fight.shop = {
	__size = 30,
	[201] = {
		topScore = 500,
		id = 201,
		itemMap = {
			[21901.0] = 5,
			__size = 1
		},
		costMap = slot2[201],
		levelRange = slot1[201]
	},
	[211] = {
		topScore = 500,
		id = 211,
		itemMap = {
			[23001.0] = 5,
			__size = 1
		},
		costMap = slot2[211],
		levelRange = slot1[211]
	},
	[221] = {
		topScore = 500,
		id = 221,
		itemMap = {
			__size = 1,
			[22231.0] = 5
		},
		costMap = slot2[221],
		levelRange = slot1[221]
	},
	[231] = {
		id = 231,
		itemMap = {
			[23141.0] = 5,
			__size = 1
		},
		costMap = slot2[231],
		levelRange = slot1[231]
	},
	[241] = {
		id = 241,
		itemMap = {
			[23411.0] = 5,
			__size = 1
		},
		costMap = slot2[241],
		levelRange = slot1[241]
	},
	[600] = {
		id = 600,
		itemMap = {
			__size = 1,
			[15.0] = 2
		},
		costMap = {
			__size = 1,
			coin12 = 200
		},
		levelRange = slot1[600]
	},
	[610] = {
		id = 610,
		itemMap = {
			__size = 1,
			[514.0] = 30
		},
		costMap = {
			__size = 1,
			coin12 = 500
		},
		levelRange = slot1[610]
	},
	[620] = {
		id = 620,
		itemMap = {
			[5000.0] = 40,
			__size = 1
		},
		costMap = slot2[620],
		levelRange = slot1[620]
	},
	[630] = {
		id = 630,
		itemMap = {
			__size = 1,
			[529.0] = 100
		},
		costMap = {
			__size = 1,
			coin12 = 300
		},
		levelRange = slot1[630]
	},
	[701] = {
		limitType = 3,
		limitTimes = 1,
		id = 701,
		topScore = 1200,
		itemMap = {
			__size = 1,
			[6059.0] = 1
		},
		costMap = {
			__size = 1,
			coin12 = 360000
		}
	},
	[711] = {
		limitType = 3,
		limitTimes = 1,
		id = 711,
		topScore = 1200,
		itemMap = {
			__size = 1,
			[993.0] = 1
		},
		costMap = {
			__size = 1,
			coin12 = 80000
		}
	},
	[715] = {
		limitType = 3,
		limitTimes = 30,
		id = 715,
		topScore = 800,
		itemMap = {
			[23631.0] = 1,
			__size = 1
		},
		costMap = {
			__size = 1,
			coin12 = 6000
		}
	},
	[721] = {
		limitType = 3,
		limitTimes = 4,
		id = 721,
		topScore = 600,
		itemMap = {
			[501.0] = 1,
			__size = 1
		},
		costMap = {
			__size = 1,
			coin12 = 15000
		}
	},
	[731] = {
		limitType = 3,
		limitTimes = 1,
		id = 731,
		topScore = 600,
		itemMap = {
			[2152.0] = 1,
			__size = 1
		},
		costMap = {
			__size = 1,
			coin12 = 36000
		}
	},
	[741] = {
		limitType = 3,
		limitTimes = 3,
		id = 741,
		topScore = 600,
		itemMap = {
			[962.0] = 1,
			__size = 1
		},
		costMap = {
			__size = 1,
			coin12 = 24000
		}
	},
	[751] = {
		limitType = 3,
		limitTimes = 15,
		id = 751,
		topScore = 400,
		itemMap = {
			__size = 1,
			[502.0] = 1
		},
		costMap = slot2[751]
	},
	[755] = {
		limitType = 3,
		limitTimes = 50,
		id = 755,
		topScore = 400,
		itemMap = {
			[20641.0] = 3,
			__size = 1
		},
		costMap = {
			__size = 1,
			coin12 = 10000
		}
	},
	[761] = {
		limitType = 3,
		limitTimes = 50,
		id = 761,
		topScore = 200,
		itemMap = {
			__size = 1,
			[22241.0] = 3
		},
		costMap = slot2[761]
	},
	[771] = {
		limitType = 3,
		limitTimes = 50,
		id = 771,
		topScore = 200,
		itemMap = {
			[22401.0] = 3,
			__size = 1
		},
		costMap = slot2[771]
	},
	[775] = {
		limitType = 3,
		limitTimes = 50,
		id = 775,
		topScore = 200,
		itemMap = {
			__size = 1,
			[22471.0] = 3
		},
		costMap = slot2[775]
	},
	[777] = {
		limitType = 3,
		limitTimes = 50,
		id = 777,
		topScore = 200,
		itemMap = {
			[21771.0] = 3,
			__size = 1
		},
		costMap = slot2[777]
	},
	[781] = {
		limitType = 3,
		limitTimes = 20,
		id = 781,
		itemMap = {
			gold = 200000,
			__size = 1
		},
		costMap = {
			__size = 1,
			coin12 = 3600
		}
	},
	[791] = {
		limitType = 3,
		limitTimes = 20,
		id = 791,
		itemMap = {
			__size = 1,
			[15.0] = 10
		},
		costMap = {
			__size = 1,
			coin12 = 3000
		}
	},
	[801] = {
		limitType = 3,
		limitTimes = 20,
		id = 801,
		itemMap = {
			__size = 1,
			[4000.0] = 50
		},
		costMap = {
			__size = 1,
			coin12 = 1500
		}
	},
	[811] = {
		limitType = 3,
		limitTimes = 20,
		id = 811,
		itemMap = {
			[452.0] = 20,
			__size = 1
		},
		costMap = slot2[811]
	},
	[821] = {
		limitType = 3,
		limitTimes = 20,
		id = 821,
		itemMap = {
			__size = 1,
			[850.0] = 80
		},
		costMap = slot2[821]
	},
	[831] = {
		limitType = 3,
		limitTimes = 20,
		id = 831,
		itemMap = {
			__size = 1,
			[851.0] = 40
		},
		costMap = slot2[831]
	},
	[1101] = {
		limitType = 4,
		limitTimes = 1,
		id = 1101,
		topScore = 1000,
		itemMap = {
			[2217.0] = 1,
			__size = 1
		},
		costMap = slot2[1101]
	},
	[1111] = {
		limitType = 4,
		limitTimes = 1,
		id = 1111,
		topScore = 2000,
		itemMap = {
			[2218.0] = 1,
			__size = 1
		},
		costMap = slot2[1111]
	},
	[1121] = {
		limitType = 4,
		limitTimes = 1,
		id = 1121,
		topScore = 1000,
		itemMap = {
			__size = 1,
			[30318.0] = 1
		},
		costMap = {
			__size = 1,
			coin12 = 150000
		}
	},
	__default = {
		__index = {
			regainHour = 0,
			exchangeLimit = -1,
			limitType = 0,
			limitTimes = 0,
			topScore = 0,
			vipStart = 0,
			endDate = 20990101,
			showUnable = false,
			beginDate = 0,
			itemMap = ({
				default = slot0[1]
			}).default,
			costMap = slot2.default,
			levelRange = {
				1,
				150
			},
			languages = {
				"cn",
				"vn",
				"en",
				"kr",
				"br",
				"id",
				"th",
				"es",
				"tw"
			}
		}
	}
}

return csv.cross.online_fight.shop
