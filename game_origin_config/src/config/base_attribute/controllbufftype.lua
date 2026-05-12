slot0 = {
	__size = 0
}
csv.base_attribute.controllbufftype = {
	{
		id = 1,
		controllBuffType = "stun"
	},
	{
		id = 2,
		controllBuffType = "sleepy"
	},
	{
		id = 3,
		controllBuffType = "confusion"
	},
	{
		id = 4,
		controllBuffType = "silence"
	},
	{
		id = 5,
		controllBuffType = "sneer"
	},
	{
		id = 6,
		controllBuffType = "freeze"
	},
	{
		id = 7,
		controllBuffType = "leave",
		unlock = false
	},
	{
		id = 8,
		controllBuffType = "changeImage",
		unlock = false
	},
	{
		id = 9,
		controllBuffType = "kongju"
	},
	__size = 9,
	__default = {
		__index = {
			unlock = true
		}
	}
}

return csv.base_attribute.controllbufftype
