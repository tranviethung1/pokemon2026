slot0 = {
	__size = 2,
	[3] = {
		{
			0,
			2,
			1
		},
		{
			2,
			5,
			0.9
		},
		{
			5,
			10,
			0.7
		},
		{
			10,
			15,
			0.5
		}
	},
	[4] = {
		gold = 10000,
		__size = 2,
		libs = {
			21001
		}
	}
}
slot1 = {
	slot0[4],
	slot0[4],
	[3] = slot0[4],
	[5] = slot0[4],
	[4] = slot0[4]
}
slot2 = {
	slot0[3],
	slot0[3],
	[3] = slot0[3],
	[5] = slot0[3],
	[4] = slot0[3]
}
csv.union_qa.qa_type = {
	{
		score = 10,
		desc_vn = "404",
		type = 1,
		desc_th = "ข้อความ Q&A ความยาก 1",
		desc_en = "Text Q&A Difficulty 1",
		desc = "文本问答难度1",
		id = 1,
		desc_tw = "文本問答難度1",
		desc_kr = "404",
		scoreUp = slot2[1],
		award = slot1[1]
	},
	{
		score = 20,
		desc_vn = "404",
		type = 2,
		desc_th = "ข้อความ Q&A ความยาก 2",
		desc_en = "Text Q&A Difficulty 2",
		desc = "文本问答难度2",
		id = 2,
		desc_tw = "文本問答難度2",
		desc_kr = "404",
		scoreUp = slot2[2],
		award = slot1[2]
	},
	{
		score = 30,
		desc_vn = "404",
		type = 3,
		desc_th = "ข้อความ Q&A ความยาก 3",
		desc_en = "Text Q&A Difficulty 3",
		desc = "文本问答难度3",
		id = 3,
		desc_tw = "文本問答難度3",
		desc_kr = "404",
		scoreUp = slot2[3],
		award = slot1[3]
	},
	{
		score = 30,
		desc_vn = "404",
		type = 4,
		desc_th = "ดูภาพตอบคำถามนี้",
		desc_en = "Look at the picture answer this question",
		desc = "看图问答",
		id = 4,
		desc_tw = "看圖問答",
		desc_kr = "404",
		scoreUp = slot2[4],
		award = slot1[4]
	},
	{
		score = 50,
		desc_vn = "404",
		type = 5,
		desc_th = "เกมสนุก",
		desc_en = "Fun game",
		desc = "小游戏",
		id = 5,
		desc_tw = "小遊戲",
		desc_kr = "404",
		scoreUp = slot2[5],
		award = slot1[5]
	},
	__size = 5,
	__default = {
		__index = {
			score = 0,
			desc_th = "",
			desc_vn = "",
			limitTime = 15,
			desc_en = "",
			desc = "",
			choiceNum = 4,
			desc_tw = "",
			desc_kr = "",
			scoreUp = {},
			award = {
				__size = 0
			}
		}
	}
}

return csv.union_qa.qa_type
