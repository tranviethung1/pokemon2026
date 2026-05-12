slot0 = {
	{
		__size = 0
	},
	__size = 1
}
csv.yunying.shaved_ice_base = {
	{
		id = 1,
		huodongID = 101058,
		score = {
			10,
			5,
			1,
			1,
			1,
			__size = 5
		},
		time = {
			6,
			3,
			1,
			1,
			1,
			__size = 5
		}
	},
	__size = 1,
	__default = {
		__index = {
			huodongID = 0,
			score = ({
				default = slot0[1]
			}).default,
			time = ({
				default = slot0[1]
			}).default,
			emoji = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.yunying.shaved_ice_base
