slot0 = {
	__size = 3,
	[2] = {
		[66016.0] = 1,
		__size = 1
	},
	[3] = {
		__size = 1,
		[66017.0] = 1
	},
	[4] = {
		__size = 2,
		[66017.0] = 1,
		[66016.0] = 1
	}
}
slot1 = {
	slot0[2],
	slot0[3],
	[11] = slot0[2],
	[21] = slot0[3],
	[31] = slot0[4],
	[3] = slot0[4]
}
csv.scene_story_choices = {
	{
		text = "Golden apple",
		startStoryID = 3000007,
		text_en = "Golden apple",
		id = 1,
		text_th = "Golden apple",
		skills = slot1[1]
	},
	{
		text = "Silver apple",
		startStoryID = 3000009,
		text_en = "Silver apple",
		id = 2,
		text_th = "Silver apple",
		skills = slot1[2]
	},
	{
		text = "Rotten apple",
		startStoryID = 3000011,
		text_en = "Rotten apple",
		id = 3,
		text_th = "Rotten apple",
		skills = slot1[3]
	},
	__size = 22,
	[11] = {
		text = "Golden Apple 2",
		startStoryID = 11,
		text_en = "Golden Apple 2",
		id = 11,
		text_th = "Golden Apple 2",
		skills = slot1[11]
	},
	[21] = {
		text = "Silver Apple 2",
		startStoryID = 21,
		text_en = "Silver Apple 2",
		id = 21,
		text_th = "Silver Apple 2",
		skills = slot1[21]
	},
	[31] = {
		text = "Rotten apple 2",
		startStoryID = 31,
		text_en = "Rotten apple 2",
		id = 31,
		text_th = "Rotten apple 2",
		skills = slot1[31]
	},
	[100001] = {
		text = "Go left",
		startStoryID = 100007,
		text_en = "Go left",
		id = 100001,
		text_th = "Go left",
		skills = {
			[50000001.0] = 1,
			__size = 1
		}
	},
	[100002] = {
		text = "Go right",
		startStoryID = 100009,
		text_en = "Go right",
		id = 100002,
		text_th = "Go right"
	},
	[100101] = {
		text = "I choose you! Squirtle! Use water to unfreeze",
		startStoryID = 100105,
		text_en = "I choose you! Squirtle! Use water to unfreeze",
		id = 100101,
		text_th = "ฉันเลือกเธอ! Squirtle! ใช้น้ำเพื่อคลายน้ำแข็ง"
	},
	[100102] = {
		text = "I choose you! Charmander! Use fire to unfreeze!",
		startStoryID = 100107,
		text_en = "I choose you! Charmander! Use fire to unfreeze!",
		id = 100102,
		text_th = "ฉันเลือกคุณ! Charmander ใช้ไฟเพื่อคลายน้ำแข็ง!",
		skills = {
			[50000002.0] = 1,
			__size = 1
		}
	},
	[100601] = {
		text = "Heals the Feebas first",
		startStoryID = 100612,
		text_en = "Heals the Feebas first",
		id = 100601,
		text_th = "รักษา Feebas ก่อน",
		skills = {
			[50000011.0] = 1,
			__size = 1
		}
	},
	[100602] = {
		text = "Chasing off teen hooligan first",
		startStoryID = 100614,
		text_en = "Chasing off teen hooligan first",
		id = 100602,
		text_th = "ไล่ล่าวัยรุ่นหัวไม้ก่อน",
		skills = {
			[50000012.0] = 1,
			__size = 1
		}
	},
	[400101] = {
		text = "Dodge boost",
		text_en = "Dodge boost",
		id = 400101,
		text_th = "Dodge boost",
		skills = {
			__size = 1,
			[60000101.0] = 1
		}
	},
	[400102] = {
		text = "Crit boost",
		text_en = "Crit boost",
		id = 400102,
		text_th = "Crit boost",
		skills = {
			__size = 1,
			[60000102.0] = 1
		}
	},
	[400103] = {
		text = "Block boost",
		text_en = "Block boost",
		id = 400103,
		text_th = "Block boost",
		skills = {
			__size = 1,
			[60000103.0] = 1
		}
	},
	[612044] = {
		text = "I want to be Poliwrath!",
		startStoryID = 612046,
		text_en = "I want to be Poliwrath!",
		id = 612044,
		text_th = "I want to be Poliwrath!"
	},
	[612045] = {
		text = "I want to be Politoed!",
		startStoryID = 612051,
		text_en = "I want to be Politoed!",
		id = 612045,
		text_th = "I want to be Politoed!"
	},
	[700001] = {
		id = 700001,
		startStoryID = 700003,
		skills = {
			[70000101.0] = 1,
			__size = 1
		}
	},
	[700002] = {
		id = 700002,
		startStoryID = 700005,
		skills = {
			[70000201.0] = 1,
			__size = 1
		}
	},
	[700501] = {
		id = 700501,
		skills = {
			__size = 1,
			[70050100.0] = 1
		}
	},
	[700502] = {
		id = 700502,
		skills = {
			__size = 1,
			[70050200.0] = 1
		}
	},
	[700503] = {
		id = 700503,
		skills = {
			__size = 1,
			[70050300.0] = 1
		}
	},
	__default = {
		__index = {
			text = "",
			startStoryID = 0,
			text_en = "",
			text_th = "",
			skills = {
				__size = 0
			}
		}
	}
}

return csv.scene_story_choices
