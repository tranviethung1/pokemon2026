slot0 = {
	{
		__size = 0
	},
	__size = 2,
	[6] = {
		"cn"
	}
}
slot1 = {
	slot0[6],
	slot0[6],
	[3] = slot0[6]
}
csv.card_skin_shop = {
	{
		itemCount = 1,
		id = 1,
		itemMap = {
			__size = 1,
			[8000.0] = 1
		},
		costMap = {
			__size = 1,
			[536.0] = 80
		},
		languages = slot1[1]
	},
	{
		itemCount = 1,
		id = 2,
		position = 2,
		itemMap = {
			__size = 1,
			[8002.0] = 1
		},
		costMap = {
			__size = 1,
			[536.0] = 120
		},
		languages = slot1[2]
	},
	{
		itemCount = 1,
		id = 3,
		position = 3,
		itemMap = {
			__size = 1,
			[8004.0] = 2
		},
		costMap = {
			__size = 1,
			rmb = 998
		},
		languages = slot1[3]
	},
	__size = 3,
	__default = {
		__index = {
			vipWeight = 1,
			itemCount = 0,
			limitType = 4,
			type = 1,
			beginDate = 0,
			vipStart = 0,
			litSkinNum = 0,
			endDate = 20990101,
			exchangeLimit = -1,
			position = 1,
			showUnable = true,
			limitTimes = 1,
			itemMap = ({
				default = slot0[1]
			}).default,
			costMap = ({
				default = slot0[1]
			}).default,
			extraItem = ({
				default = slot0[1]
			}).default,
			levelRange = {
				1,
				199
			},
			languages = {
				"cn",
				"br",
				"en",
				"vn",
				"th",
				"kr"
			}
		}
	}
}

return csv.card_skin_shop
