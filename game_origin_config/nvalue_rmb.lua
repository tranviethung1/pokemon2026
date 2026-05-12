slot0 = {
	__size = 0
}
csv.nvalue_rmb = {
	{
		id = 1,
		totalCostRmb = 2000
	},
	{
		id = 2,
		totalCostRmb = 4000,
		locknum = 1
	},
	{
		id = 3,
		totalCostRmb = 8000,
		locknum = 2
	},
	{
		id = 4,
		totalCostRmb = 20000,
		locknum = 3
	},
	{
		id = 5,
		totalCostRmb = 40000,
		locknum = 4
	},
	{
		id = 6,
		locknum = 5
	},
	__size = 6,
	__default = {
		__index = {
			probLimit = 0.1,
			probEffectInterval = 25,
			locknum = 0,
			probInit = 0.05,
			totalCostRmb = 80000,
			probStep = 0.005,
			probMiniTimes = 20
		}
	}
}

return csv.nvalue_rmb
