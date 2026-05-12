slot0 = {
	__size = 0
}
csv.fishing.rod = {
	{
		name = "Starter fishing rod",
		name_en = "Starter fishing rod",
		itemId = 7000,
		needLv = 1,
		res = "rod_0",
		name_vn = "Vara de pesca inicial",
		name_th = "คันเบ็ดเริ่มต้น",
		id = 1,
		cost = {
			gold = 100000,
			__size = 1
		}
	},
	{
		name = "Junior fishing rod",
		extraProbability = 0.02,
		name_en = "Junior fishing rod",
		itemId = 7001,
		extraSpeed = 0.05,
		needLv = 3,
		res = "rod_1",
		name_vn = "Vara de pesca júnior",
		name_th = "คันเบ็ดเด็ก",
		id = 2,
		extraZone = 1.1,
		lowerSpeed = 0.05,
		cost = {
			gold = 500000,
			__size = 1
		}
	},
	{
		name = "Veteran fishing rod",
		extraProbability = 0.04,
		name_en = "Veteran fishing rod",
		lowerWait = 0.1,
		extraSpeed = 0.1,
		needLv = 6,
		itemId = 7002,
		res = "rod_2",
		name_vn = "Vara de pesca veterana",
		name_th = "คันเบ็ดทหารผ่านศึก",
		id = 3,
		extraZone = 1.2,
		lowerSpeed = 0.1,
		cost = {
			gold = 1000000,
			__size = 1
		}
	},
	{
		name = "Advanced fishing rod",
		extraProbability = 0.06,
		name_en = "Advanced fishing rod",
		lowerWait = 0.15,
		extraSpeed = 0.15,
		needLv = 10,
		itemId = 7003,
		res = "rod_3",
		name_vn = "Vara de pesca avançada",
		name_th = "คันเบ็ดขั้นสูง",
		id = 4,
		extraZone = 1.3,
		lowerSpeed = 0.15,
		cost = {
			gold = 3000000,
			__size = 1
		}
	},
	{
		name = "Premium fishing rod",
		extraProbability = 0.08,
		name_en = "Premium fishing rod",
		lowerWait = 0.2,
		extraSpeed = 0.2,
		needLv = 15,
		itemId = 7004,
		res = "rod_4",
		name_vn = "Vara de pesca premium",
		name_th = "คันเบ็ดพรีเมี่ยม",
		id = 5,
		extraZone = 1.4,
		lowerSpeed = 0.2,
		cost = {
			gold = 5000000,
			__size = 1
		}
	},
	{
		itemId = 7005,
		name_en = "Swift Fishing Rod",
		name_vn = "Vara de pesca rápida",
		name_th = "คันเบ็ดตกปลา",
		id = 6,
		name = "Swift Fishing Rod",
		res = "rod_5",
		needLv = 20
	},
	{
		itemId = 7006,
		name_en = "Refined fishing rod",
		name_vn = "Vara de pesca refinada",
		name_th = "คันเบ็ดอย่างดี",
		id = 7,
		name = "Refined fishing rod",
		res = "rod_6",
		needLv = 20
	},
	{
		itemId = 7007,
		name_en = "Charm fishing rod",
		name_vn = "Vara de pesca de charme",
		name_th = "คันเบ็ดเสน่ห์",
		id = 8,
		name = "Charm fishing rod",
		res = "rod_7",
		needLv = 20
	},
	{
		name = "Easy fishing rod",
		extraProbability = 0.15,
		name_en = "Easy fishing rod",
		itemId = 7008,
		needLv = 3,
		res = "rod_8",
		name_vn = "Vara de pesca fácil",
		name_th = "คันเบ็ดตกปลาแบบง่ายๆ",
		id = 9,
		cost = {
			__size = 1,
			rmb = 880
		}
	},
	__size = 9,
	__default = {
		__index = {
			name_en = "",
			extraProbability = 0,
			name = "",
			lowerWait = 0,
			extraSpeed = 0,
			needLv = 0,
			itemId = 0,
			res = "",
			name_vn = "",
			name_th = "",
			extraZone = 0,
			lowerSpeed = 0,
			cost = {
				__size = 0
			}
		}
	}
}

return csv.fishing.rod
