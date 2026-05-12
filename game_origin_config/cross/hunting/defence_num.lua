slot0 = {
	__size = 0
}
csv.cross.hunting.defence_num = {
	{
		id = 1,
		openDays = {
			0,
			100
		}
	},
	{
		id = 2,
		openDays = {
			100,
			200
		}
	},
	{
		id = 3,
		deployNum = 300,
		openDays = {
			200,
			300
		}
	},
	{
		id = 4,
		deployNum = 300,
		openDays = {
			300,
			400
		}
	},
	{
		id = 5,
		deployNum = 400,
		openDays = {
			400,
			800
		}
	},
	{
		id = 6,
		deployNum = 400,
		openDays = {
			800,
			99999999
		}
	},
	__size = 6,
	__default = {
		__index = {
			deployNum = 200,
			openDays = {}
		}
	}
}

return csv.cross.hunting.defence_num
