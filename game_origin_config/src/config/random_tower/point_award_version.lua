slot0 = {
	__size = 0
}
csv.random_tower.point_award_version = {
	{
		id = 1,
		languages = {
			"br",
			"en",
			"vn"
		}
	},
	{
		id = 2,
		version = 1,
		languages = {
			"cn"
		},
		servers = {
			__size = 1,
			dev = {
				1,
				3
			}
		}
	},
	{
		id = 3,
		version = 1,
		languages = {
			"cn",
			"kr"
		},
		servers = {
			__size = 4,
			kr = {
				1,
				999999
			},
			cn_qd = {
				1,
				999999
			},
			dev = {
				1,
				999999
			},
			cn = {
				1,
				999999
			}
		}
	},
	__size = 3,
	__default = {
		__index = {
			version = 0,
			languages = {
				"cn",
				"br",
				"en",
				"vn",
				"kr"
			},
			servers = {
				__size = 7,
				br = {
					1,
					999999
				},
				cn = {
					1,
					999999
				},
				cn_qd = {
					1,
					999999
				},
				vn = {
					1,
					999999
				},
				en = {
					1,
					999999
				},
				kr = {
					1,
					999999
				},
				dev = {
					1,
					999999
				}
			}
		}
	}
}

return csv.random_tower.point_award_version
