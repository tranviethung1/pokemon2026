slot0 = {
	__size = 0
}
csv.yunying.skyscraper_tasks = {
	{
		label = "Built 25 floors today",
		huodongID = 1,
		params = 25,
		id = 1,
		label_en = "Built 25 floors today",
		points = 25,
		label_th = "บรรลุ 25 ชั้นวันนี้",
		award = {
			[5000.0] = 10,
			gold = 100000,
			__size = 3,
			[850.0] = 100
		}
	},
	{
		label = "Built 75 floors today",
		huodongID = 1,
		params = 75,
		id = 2,
		label_en = "Built 75 floors today",
		points = 25,
		label_th = "บรรลุ 75 ชั้นวันนี้",
		award = {
			gold = 150000,
			[502.0] = 1,
			__size = 3,
			[930.0] = 10
		}
	},
	__size = 6,
	[5] = {
		label_en = "Achieved 800 pts in rating today",
		type = 2,
		label = "Achieved 800 pts in rating today",
		label_th = "ได้คะแนน 800 แต้มในวันนี้",
		huodongID = 1,
		params = 800,
		id = 5,
		points = 25,
		award = {
			gold = 100000,
			[451.0] = 100,
			[5000.0] = 10,
			__size = 3
		}
	},
	[6] = {
		label_en = "Achieved 1,600 pts in rating today",
		type = 2,
		label = "Achieved 1,600 pts in rating today",
		label_th = "วันนี้ได้คะแนนถึง 1,600 แต้ม",
		huodongID = 1,
		params = 1600,
		id = 6,
		points = 25,
		award = {
			gold = 150000,
			stamina = 30,
			__size = 3,
			[930.0] = 10
		}
	},
	[9] = {
		label_en = "Received Perfect Rank on Building 8 times today",
		type = 3,
		label = "Received Perfect Rank on Building 8 times today",
		label_th = "ได้รับอันดับที่สมบูรณ์แบบในการสร้าง 8 ครั้งในวันนี้",
		huodongID = 1,
		params = 8,
		id = 9,
		points = 25,
		award = {
			[5000.0] = 10,
			[850.0] = 50,
			__size = 3,
			[930.0] = 10
		}
	},
	[10] = {
		label_en = "Received Perfect Rank on Building 20 times today",
		type = 3,
		label = "Received Perfect Rank on Building 20 times today",
		label_th = "ได้รับอันดับที่สมบูรณ์แบบในการสร้าง 20 ครั้งในวันนี้",
		huodongID = 1,
		params = 20,
		id = 10,
		points = 25,
		award = {
			[5000.0] = 15,
			[850.0] = 50,
			__size = 3,
			[930.0] = 15
		}
	},
	__default = {
		__index = {
			label_en = "",
			params = 0,
			huodongID = 1001,
			type = 1,
			label = "",
			points = 0,
			label_th = "",
			award = {
				__size = 0
			}
		}
	}
}

return csv.yunying.skyscraper_tasks
