slot0 = {
	{
		0,
		0,
		0,
		0,
		0,
		0
	},
	__size = 1
}
csv.experience.list = {
	{
		id = 1
	},
	__size = 1,
	__default = {
		__index = {
			defence = 1,
			damage = 1,
			handBookIsShow = true,
			speed = 1,
			specialDamage = 1,
			specialDefence = 1,
			limitIsShow = false,
			hpMax = 1,
			enemydeployLock = ({
				default = slot0[1]
			}).default,
			autoCards = {
				__size = 0
			},
			cards = {},
			languages = {
				"cn",
				"br",
				"en",
				"vn",
				"th",
				"kr",
				"id"
			},
			passiveSkillList = {
				61201
			},
			enemyRandomCards = {
				200221,
				200221,
				200221,
				200221,
				200221,
				200221
			},
			deployLock = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.experience.list
