slot0 = {
	__size = 0
}
csv.cross.union_fight.fail_fix = {
	{
		id = 1,
		hpFix = "5%"
	},
	{
		hpFix = "10%",
		id = 2,
		times = 20
	},
	{
		hpFix = "30%",
		id = 3,
		times = 30
	},
	{
		hpFix = "80%",
		id = 4,
		times = 80
	},
	__size = 4,
	__default = {
		__index = {
			hpFix = "",
			times = 10
		}
	}
}

return csv.cross.union_fight.fail_fix
