slot0 = {
	{
		__size = 0
	},
	__size = 7,
	[5] = {
		gold = 12500,
		[8203.0] = 2500,
		[8202.0] = 2500,
		__size = 3
	},
	[6] = {
		__size = 1,
		libs = {
			651,
			652,
			653,
			654
		}
	},
	[11] = {
		gold = 25000,
		[8203.0] = 5000,
		[8202.0] = 5000,
		__size = 3
	},
	[16] = {
		gold = 50000,
		[8203.0] = 10000,
		[8202.0] = 10000,
		__size = 3
	},
	[21] = {
		gold = 75000,
		[8203.0] = 15000,
		[8202.0] = 15000,
		__size = 3
	},
	[26] = {
		gold = 125000,
		[8203.0] = 25000,
		[8202.0] = 25000,
		__size = 3
	}
}
slot1 = {
	[10] = slot0[5],
	[60] = slot0[16],
	[20] = slot0[5],
	[30] = slot0[11],
	[50] = slot0[16],
	[40] = slot0[11],
	default = slot0[1],
	[70] = slot0[21],
	[90] = slot0[26],
	[80] = slot0[21],
	[100] = slot0[26]
}
slot3 = {
	[10] = slot0[6],
	[60] = slot0[6],
	[20] = slot0[6],
	[30] = slot0[6],
	[50] = slot0[6],
	[40] = slot0[6],
	default = slot0[1],
	[70] = slot0[6],
	[90] = slot0[6],
	[80] = slot0[6],
	[100] = slot0[6]
}
csv.town.wish_box = {
	__size = 10,
	[10] = {
		delay = 0,
		days = 2,
		id = 10,
		unlockLevel = 1,
		awards = {
			gold = 800000,
			__size = 1
		},
		showAwards = {
			{
				"gold",
				800000
			}
		},
		cost = slot1[10],
		wishAward = slot3[10]
	},
	[20] = {
		delay = 0,
		days = 2,
		id = 20,
		unlockLevel = 1,
		awards = {
			[5000.0] = 30,
			__size = 2,
			[930.0] = 30
		},
		showAwards = {
			{
				5000,
				30
			},
			{
				930,
				30
			}
		},
		cost = slot1[20],
		wishAward = slot3[20]
	},
	[30] = {
		delay = 24,
		days = 3,
		id = 30,
		unlockLevel = 2,
		awards = {
			__size = 2,
			[851.0] = 30,
			[850.0] = 60
		},
		showAwards = {
			{
				851,
				30
			},
			{
				850,
				60
			}
		},
		cost = slot1[30],
		wishAward = slot3[30]
	},
	[40] = {
		delay = 24,
		days = 3,
		id = 40,
		unlockLevel = 2,
		awards = {
			__size = 2,
			[2103.0] = 5,
			[2102.0] = 10
		},
		showAwards = {
			{
				2103,
				5
			},
			{
				2102,
				10
			}
		},
		cost = slot1[40],
		wishAward = slot3[40]
	},
	[50] = {
		delay = 48,
		days = 4,
		id = 50,
		unlockLevel = 3,
		awards = {
			[452.0] = 50,
			[451.0] = 100,
			__size = 2
		},
		showAwards = {
			{
				452,
				50
			},
			{
				451,
				100
			}
		},
		cost = slot1[50],
		wishAward = slot3[50]
	},
	[60] = {
		delay = 48,
		days = 4,
		id = 60,
		unlockLevel = 3,
		awards = {
			__size = 1,
			[950.0] = 10
		},
		showAwards = {
			{
				950,
				10
			}
		},
		cost = slot1[60],
		wishAward = slot3[60]
	},
	[70] = {
		delay = 96,
		days = 5,
		id = 70,
		unlockLevel = 4,
		awards = {
			__size = 2,
			[4000.0] = 200,
			[520.0] = 2
		},
		showAwards = {
			{
				4000,
				200
			},
			{
				520,
				2
			}
		},
		cost = slot1[70],
		wishAward = slot3[70]
	},
	[80] = {
		delay = 96,
		days = 5,
		id = 80,
		unlockLevel = 4,
		awards = {
			__size = 2,
			[531.0] = 2,
			[529.0] = 1000
		},
		showAwards = {
			{
				529,
				1000
			},
			{
				531,
				2
			}
		},
		cost = slot1[80],
		wishAward = slot3[80]
	},
	[90] = {
		delay = 168,
		days = 6,
		id = 90,
		unlockLevel = 5,
		awards = {
			__size = 2,
			[124.0] = 5,
			[537.0] = 2
		},
		showAwards = {
			{
				124,
				5
			},
			{
				537,
				2
			}
		},
		cost = slot1[90],
		wishAward = slot3[90]
	},
	[100] = {
		delay = 168,
		days = 6,
		id = 100,
		unlockLevel = 5,
		awards = {
			__size = 2,
			[541.0] = 2,
			coin17 = 100
		},
		showAwards = {
			{
				"coin17",
				100
			},
			{
				541,
				2
			}
		},
		cost = slot1[100],
		wishAward = slot3[100]
	},
	__default = {
		__index = {
			days = 99,
			delay = 99999,
			unlockLevel = 99,
			awards = ({
				default = slot0[1]
			}).default,
			showAwards = {},
			cost = slot1.default,
			wishAward = slot3.default
		}
	}
}

return csv.town.wish_box
