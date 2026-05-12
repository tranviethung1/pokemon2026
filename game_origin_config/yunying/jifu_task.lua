slot0 = {
	{
		__size = 0
	},
	__size = 1
}
csv.yunying.jifu_task = {
	__size = 16,
	[101] = {
		desc_en = "Challenge Common Stage 600 times",
		desc = "Challenge Common Stage 600 times",
		boardID = 1,
		goTo = "10000",
		desc_th = "ท้าทาย Common Stage 600 ครั้ง",
		taskType = 29,
		huodongID = 10011,
		taskParam = 600,
		id = 101,
		award = {
			gold = 100000,
			stamina = 30,
			__size = 2
		}
	},
	[102] = {
		desc_en = "Ascend Pokémon 50 times",
		desc = "Ascend Pokémon 50 times",
		boardID = 2,
		goTo = "strengthen-advance",
		desc_th = "ขึ้นโปเกมอน 50 ครั้ง",
		taskType = 35,
		huodongID = 10011,
		taskParam = 50,
		id = 102,
		award = {
			[503.0] = 3,
			gold = 100000,
			__size = 2
		}
	},
	[103] = {
		desc = "Clear 7F of Aether Paradise 3 times",
		desc_th = "เคลียร์ 7F ของ Aether Paradise 3 ครั้ง",
		boardID = 3,
		desc_en = "Clear 7F of Aether Paradise 3 times",
		goTo = "randomTower",
		taskType = 112,
		huodongID = 10011,
		taskParam = 3,
		id = 103,
		taskSpecialParam = {
			[3.0] = 7,
			__size = 1
		},
		award = {
			gold = 100000,
			[519.0] = 2,
			__size = 2
		}
	},
	[104] = {
		desc_en = "Login for 5 days",
		desc = "Login for 5 days",
		boardID = 4,
		desc_th = "เข้าสู่ระบบเป็นเวลา 5 วัน",
		taskType = 17,
		huodongID = 10011,
		taskParam = 5,
		id = 104,
		award = {
			gold = 100000,
			__size = 2,
			[520.0] = 1
		}
	},
	[105] = {
		desc_en = "Spent 20,000,000 Coins in total",
		desc = "Spent 20,000,000 Coins in total",
		boardID = 5,
		desc_th = "ใช้ไปทั้งหมด 20,000,000 เหรียญ",
		taskType = 20,
		huodongID = 10011,
		taskParam = 20000000,
		id = 105,
		award = {
			gold = 100000,
			__size = 2,
			[901.0] = 10
		}
	},
	[106] = {
		desc_en = "Drawing with Diamonds 30 times",
		desc = "Drawing with Diamonds 30 times",
		boardID = 6,
		goTo = "drawCard-diamond",
		desc_th = "วาดเพชร30ครั้ง",
		taskType = 50,
		huodongID = 10011,
		taskParam = 30,
		id = 106,
		award = {
			gold = 100000,
			__size = 2,
			[850.0] = 50
		}
	},
	[107] = {
		desc_en = "Challenge Elite Stage 150 times",
		desc = "Challenge Elite Stage 150 times",
		boardID = 7,
		goTo = "20000",
		desc_th = "ท้าทาย Elite Stage 150 ครั้ง",
		taskType = 30,
		huodongID = 10011,
		taskParam = 150,
		id = 107,
		award = {
			gold = 100000,
			__size = 2,
			[851.0] = 50
		}
	},
	[108] = {
		desc = "Complete Rank S or higher Dispatch 25 times",
		desc_th = "สำเร็จ Rank S หรือสูงกว่า Dispatch 25 ครั้ง",
		boardID = 8,
		desc_en = "Complete Rank S or higher Dispatch 25 times",
		goTo = "dispatchTask",
		taskType = 86,
		huodongID = 10011,
		taskParam = 25,
		id = 108,
		taskSpecialParam = {
			__size = 1,
			[25.0] = 4
		},
		award = {
			[5000.0] = 10,
			gold = 100000,
			__size = 2
		}
	},
	[109] = {
		desc_en = "Upgrade Pokémon 200 times",
		desc = "Upgrade Pokémon 200 times",
		boardID = 9,
		goTo = "strengthen-1",
		desc_th = "อัพเกรดโปเกมอน 200 ครั้ง",
		taskType = 36,
		huodongID = 10011,
		taskParam = 200,
		id = 109,
		award = {
			gold = 100000,
			__size = 2,
			[930.0] = 10
		}
	},
	[110] = {
		desc_en = "Spent 3,000 Diamonds in total",
		desc = "Spent 3,000 Diamonds in total",
		boardID = 10,
		desc_th = "ใช้ไปทั้งหมด 3,000 เพชร",
		taskType = 21,
		huodongID = 10011,
		taskParam = 3000,
		id = 110,
		award = {
			gold = 100000,
			__size = 2,
			[529.0] = 500
		}
	},
	[111] = {
		desc_en = "Purchase Stamina 20 times",
		desc = "Purchase Stamina 20 times",
		boardID = 11,
		goTo = "gainStamina",
		desc_th = "ซื้อความแข็งแกร่ง 20 ครั้ง",
		taskType = 26,
		huodongID = 10011,
		taskParam = 20,
		id = 111,
		award = {
			gold = 100000,
			[902.0] = 5,
			__size = 2
		}
	},
	[112] = {
		desc_en = "Join Fortune 60 times",
		desc = "Join Fortune 60 times",
		boardID = 12,
		goTo = "gainGold",
		desc_th = "เข้าร่วมฟอร์จูน 60 ครั้ง",
		taskType = 18,
		huodongID = 10011,
		taskParam = 60,
		id = 112,
		award = {
			gold = 100000,
			coin1 = 1000,
			__size = 2
		}
	},
	[113] = {
		desc_en = "Fight in the Arena 50 times",
		desc = "Fight in the Arena 50 times",
		boardID = 13,
		goTo = "arena",
		desc_th = "ต่อสู้ในอารีน่า 50 ครั้ง",
		taskType = 41,
		huodongID = 10011,
		taskParam = 50,
		id = 113,
		award = {
			gold = 100000,
			__size = 2,
			coin2 = 1000
		}
	},
	[114] = {
		desc_en = "Upgrade Skill 200 times",
		desc = "Upgrade Skill 200 times",
		boardID = 14,
		goTo = "strengthen-5",
		desc_th = "อัพเกรดสกิล 200 ครั้ง",
		taskType = 34,
		huodongID = 10011,
		taskParam = 200,
		id = 114,
		award = {
			coin3 = 1000,
			gold = 100000,
			__size = 2
		}
	},
	[115] = {
		desc_en = "Donate to Guild 40 times",
		desc = "Donate to Guild 40 times",
		boardID = 15,
		goTo = "union",
		desc_th = "บริจาคให้กิลด์ 40 ครั้ง",
		taskType = 55,
		huodongID = 10011,
		taskParam = 40,
		id = 115,
		award = {
			talent_point = 2,
			gold = 100000,
			__size = 2
		}
	},
	[116] = {
		desc_en = "Star up Pokémon 20 times",
		desc = "Star up Pokémon 20 times",
		boardID = 16,
		goTo = "strengthen-4",
		desc_th = "ติดดาวโปเกมอน 20 ครั้ง",
		taskType = 37,
		huodongID = 10011,
		taskParam = 20,
		id = 116,
		award = {
			gold = 100000,
			[19.0] = 3,
			__size = 2
		}
	},
	__default = {
		__index = {
			desc_en = "",
			desc = "",
			boardID = 0,
			desc_th = "",
			goTo = "",
			taskType = 0,
			huodongID = 0,
			taskParam = 9999,
			taskSpecialParam = ({
				default = slot0[1]
			}).default,
			award = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.yunying.jifu_task
