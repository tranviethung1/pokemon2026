slot0 = {
	{
		__size = 0
	},
	__size = 6,
	[3] = {
		[8112.0] = 1,
		__size = 1
	},
	[6] = {
		__size = 4,
		gold = 300000,
		[6393.0] = 15,
		[27001.0] = 5,
		[5000.0] = 50
	},
	[7] = {
		__size = 4,
		[6393.0] = 15,
		[27001.0] = 5,
		gold = 300000,
		[930.0] = 50
	},
	[8] = {
		__size = 4,
		[16.0] = 15,
		[6393.0] = 15,
		[27001.0] = 5,
		gold = 300000
	},
	[10] = {
		__size = 4,
		[902.0] = 25,
		[6393.0] = 15,
		[27001.0] = 5,
		gold = 300000
	}
}
slot2 = {
	[11] = slot0[7],
	[10] = slot0[6],
	[12] = slot0[8],
	[15] = slot0[6],
	[14] = slot0[10],
	[17] = slot0[8],
	[16] = slot0[7],
	[19] = slot0[10],
	default = slot0[1],
	[3] = slot0[3],
	[2] = slot0[3],
	[5] = slot0[3],
	[4] = slot0[3],
	[6] = slot0[3]
}
csv.yunying.grid_walk_tasks = {
	{
		desc_vn = "Login Today",
		desc = "Login Today",
		desc_th = "Login Today",
		desc_en = "Login Today",
		taskType = 17,
		taskParam = 1,
		id = 1,
		desc_tw = "Login Today",
		desc_kr = "Login Today",
		award = {
			[8112.0] = 3,
			__size = 1
		}
	},
	{
		desc_vn = "Guild Donation 5 Times",
		desc = "Guild Donation 5 Times",
		desc_th = "Guild Donation 5 Times",
		goTo = "union",
		desc_en = "Guild Donation 5 Times",
		taskType = 55,
		taskParam = 5,
		id = 2,
		desc_tw = "Guild Donation 5 Times",
		desc_kr = "Guild Donation 5 Times",
		award = slot2[2]
	},
	{
		desc_vn = "Accumulated 5 Battles In The Arena",
		desc = "Accumulated 5 Battles In The Arena",
		desc_th = "Accumulated 5 Battles In The Arena",
		goTo = "arena",
		desc_en = "Accumulated 5 Battles In The Arena",
		taskType = 41,
		taskParam = 5,
		id = 3,
		desc_tw = "Accumulated 5 Battles In The Arena",
		desc_kr = "Accumulated 5 Battles In The Arena",
		award = slot2[3]
	},
	{
		desc_vn = "Complete A Dispatch Of S Rank Or Higher",
		desc = "Complete A Dispatch Of S Rank Or Higher",
		desc_th = "Complete A Dispatch Of S Rank Or Higher",
		desc_en = "Complete A Dispatch Of S Rank Or Higher",
		goTo = "dispatchTask",
		taskType = 86,
		taskParam = 1,
		id = 4,
		desc_tw = "Complete A Dispatch Of S Rank Or Higher",
		desc_kr = "Complete A Dispatch Of S Rank Or Higher",
		taskSpecialParam = {
			[1.0] = 4,
			__size = 1
		},
		award = slot2[4]
	},
	{
		desc_vn = "Challenge The Number Of Elite Levels 15 Times",
		desc = "Challenge The Number Of Elite Levels 15 Times",
		desc_th = "Challenge The Number Of Elite Levels 15 Times",
		goTo = "20000",
		desc_en = "Challenge The Number Of Elite Levels 15 Times",
		taskType = 30,
		taskParam = 15,
		id = 5,
		desc_tw = "Challenge The Number Of Elite Levels 15 Times",
		desc_kr = "Challenge The Number Of Elite Levels 15 Times",
		award = slot2[5]
	},
	{
		desc_vn = "Buy Stamina 2 Times",
		desc = "Buy Stamina 2 Times",
		desc_th = "Buy Stamina 2 Times",
		goTo = "gainStamina",
		desc_en = "Buy Stamina 2 Times",
		taskType = 26,
		taskParam = 2,
		id = 6,
		desc_tw = "Buy Stamina 2 Times",
		desc_kr = "Buy Stamina 2 Times",
		award = slot2[6]
	},
	{
		desc_vn = "Cumulative Consumption Of 200 Diamonds",
		desc = "Cumulative Consumption Of 200 Diamonds",
		desc_th = "Cumulative Consumption Of 200 Diamonds",
		desc_en = "Cumulative Consumption Of 200 Diamonds",
		taskType = 21,
		taskParam = 200,
		id = 7,
		desc_tw = "Cumulative Consumption Of 200 Diamonds",
		desc_kr = "Cumulative Consumption Of 200 Diamonds",
		award = {
			[8112.0] = 2,
			__size = 1
		}
	},
	__size = 17,
	[10] = {
		desc_th = "Accumulatively Trigger To Get Treasure Chest 1 Time",
		desc_vn = "Accumulatively Trigger To Get Treasure Chest 1 Time",
		desc_en = "Accumulatively Trigger To Get Treasure Chest 1 Time",
		desc = "Accumulatively Trigger To Get Treasure Chest 1 Time",
		taskParam = 1,
		id = 10,
		desc_tw = "Accumulatively Trigger To Get Treasure Chest 1 Time",
		desc_kr = "Accumulatively Trigger To Get Treasure Chest 1 Time",
		award = slot2[10]
	},
	[11] = {
		desc_th = "A Total Of 2 Triggers To Obtain Treasure Chests",
		desc_vn = "A Total Of 2 Triggers To Obtain Treasure Chests",
		desc_en = "A Total Of 2 Triggers To Obtain Treasure Chests",
		desc = "A Total Of 2 Triggers To Obtain Treasure Chests",
		taskParam = 2,
		id = 11,
		desc_tw = "A Total Of 2 Triggers To Obtain Treasure Chests",
		desc_kr = "A Total Of 2 Triggers To Obtain Treasure Chests",
		award = slot2[11]
	},
	[12] = {
		desc_th = "A Total Of 4 Triggers To Obtain Treasure Chests",
		desc_vn = "A Total Of 4 Triggers To Obtain Treasure Chests",
		desc_en = "A Total Of 4 Triggers To Obtain Treasure Chests",
		desc = "A Total Of 4 Triggers To Obtain Treasure Chests",
		taskParam = 4,
		id = 12,
		desc_tw = "A Total Of 4 Triggers To Obtain Treasure Chests",
		desc_kr = "A Total Of 4 Triggers To Obtain Treasure Chests",
		award = slot2[12]
	},
	[13] = {
		desc_th = "A Total Of 7 Treasure Chests Were Triggered",
		desc_vn = "A Total Of 7 Treasure Chests Were Triggered",
		desc_en = "A Total Of 7 Treasure Chests Were Triggered",
		desc = "A Total Of 7 Treasure Chests Were Triggered",
		taskParam = 7,
		id = 13,
		desc_tw = "A Total Of 7 Treasure Chests Were Triggered",
		desc_kr = "A Total Of 7 Treasure Chests Were Triggered",
		award = {
			__size = 4,
			[6393.0] = 15,
			[27001.0] = 5,
			gold = 300000,
			[850.0] = 100
		}
	},
	[14] = {
		desc_th = "A Total Of 10 Treasure Chests Have Been Triggered",
		desc_vn = "A Total Of 10 Treasure Chests Have Been Triggered",
		desc_en = "A Total Of 10 Treasure Chests Have Been Triggered",
		desc = "A Total Of 10 Treasure Chests Have Been Triggered",
		taskParam = 10,
		id = 14,
		desc_tw = "A Total Of 10 Treasure Chests Have Been Triggered",
		desc_kr = "A Total Of 10 Treasure Chests Have Been Triggered",
		award = slot2[14]
	},
	[15] = {
		desc_th = "A Total Of 13 Treasure Chests Were Triggered",
		desc_vn = "A Total Of 13 Treasure Chests Were Triggered",
		desc_en = "A Total Of 13 Treasure Chests Were Triggered",
		desc = "A Total Of 13 Treasure Chests Were Triggered",
		taskParam = 13,
		id = 15,
		desc_tw = "A Total Of 13 Treasure Chests Were Triggered",
		desc_kr = "A Total Of 13 Treasure Chests Were Triggered",
		award = slot2[15]
	},
	[16] = {
		desc_th = "A Total Of 16 Treasure Chests Were Triggered",
		desc_vn = "A Total Of 16 Treasure Chests Were Triggered",
		desc_en = "A Total Of 16 Treasure Chests Were Triggered",
		desc = "A Total Of 16 Treasure Chests Were Triggered",
		taskParam = 16,
		id = 16,
		desc_tw = "A Total Of 16 Treasure Chests Were Triggered",
		desc_kr = "A Total Of 16 Treasure Chests Were Triggered",
		award = slot2[16]
	},
	[17] = {
		desc_th = "A Total Of 19 Treasure Chests Were Triggered",
		desc_vn = "A Total Of 19 Treasure Chests Were Triggered",
		desc_en = "A Total Of 19 Treasure Chests Were Triggered",
		desc = "A Total Of 19 Treasure Chests Were Triggered",
		taskParam = 19,
		id = 17,
		desc_tw = "A Total Of 19 Treasure Chests Were Triggered",
		desc_kr = "A Total Of 19 Treasure Chests Were Triggered",
		award = slot2[17]
	},
	[18] = {
		desc_th = "A Total Of 22 Treasure Chests Have Been Triggered",
		desc_vn = "A Total Of 22 Treasure Chests Have Been Triggered",
		desc_en = "A Total Of 22 Treasure Chests Have Been Triggered",
		desc = "A Total Of 22 Treasure Chests Have Been Triggered",
		taskParam = 22,
		id = 18,
		desc_tw = "A Total Of 22 Treasure Chests Have Been Triggered",
		desc_kr = "A Total Of 22 Treasure Chests Have Been Triggered",
		award = {
			__size = 4,
			[6393.0] = 15,
			[27001.0] = 5,
			gold = 300000,
			[850.0] = 50
		}
	},
	[19] = {
		desc_th = "A Total Of 25 Treasure Chests Were Triggered",
		desc_vn = "A Total Of 25 Treasure Chests Were Triggered",
		desc_en = "A Total Of 25 Treasure Chests Were Triggered",
		desc = "A Total Of 25 Treasure Chests Were Triggered",
		taskParam = 25,
		id = 19,
		desc_tw = "A Total Of 25 Treasure Chests Were Triggered",
		desc_kr = "A Total Of 25 Treasure Chests Were Triggered",
		award = slot2[19]
	},
	__default = {
		__index = {
			desc_vn = "",
			desc = "",
			desc_th = "",
			desc_en = "",
			goTo = "",
			taskType = 0,
			huodongID = 1001,
			taskParam = 9999,
			desc_tw = "",
			desc_kr = "",
			taskSpecialParam = ({
				default = slot0[1]
			}).default,
			award = slot2.default
		}
	}
}

return csv.yunying.grid_walk_tasks
