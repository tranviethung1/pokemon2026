slot0 = {
	{},
	__size = 1
}
csv.newbie_init = {
	{
		id = 1,
		gold = 50000,
		cards = {
			{
				id = 1,
				character = 5,
				__size = 3,
				nvalue = {
					speed = 16,
					specialDamage = 16,
					hp = 16,
					damage = 16,
					specialDefence = 16,
					defence = 16,
					__size = 6
				}
			},
			{
				id = 11,
				character = 5,
				__size = 3,
				nvalue = {
					speed = 16,
					specialDamage = 16,
					hp = 16,
					damage = 16,
					specialDefence = 16,
					defence = 16,
					__size = 6
				}
			},
			{
				id = 21,
				character = 5,
				__size = 3,
				nvalue = {
					speed = 16,
					specialDamage = 16,
					hp = 16,
					damage = 16,
					specialDefence = 16,
					defence = 16,
					__size = 6
				}
			}
		},
		items = {
			[5000.0] = 5,
			__size = 3,
			[30101.0] = 1,
			[11.0] = 10
		},
		figures = {
			1,
			2
		}
	},
	__size = 1,
	__default = {
		__index = {
			rmb = 0,
			gold = 0,
			cards = ({
				default = slot0[1]
			}).default,
			defaultCards = ({
				default = slot0[1]
			}).default,
			items = {
				__size = 0
			},
			figures = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.newbie_init
