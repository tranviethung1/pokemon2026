slot0 = {
	__size = 0
}
csv.world_level.bonus = {
	{
		id = 1,
		gateBonus = "20%",
		heroGateBonus = "30%",
		deltaRange = {
			3,
			6
		}
	},
	{
		id = 2,
		gateBonus = "40%",
		heroGateBonus = "50%",
		deltaRange = {
			7,
			20
		}
	},
	{
		id = 3,
		gateBonus = "50%",
		heroGateBonus = "60%",
		deltaRange = {
			21,
			99
		}
	},
	__size = 3,
	__default = {
		__index = {
			heroGateBonus = "1%",
			gateBonus = "1%",
			deltaRange = {}
		}
	}
}

return csv.world_level.bonus
