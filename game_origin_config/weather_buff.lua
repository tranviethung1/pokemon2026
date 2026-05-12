slot0 = {
	{},
	__size = 1
}
csv.weather_buff = {
	{
		processId = 673,
		id = 1,
		weatherId = 2
	},
	__size = 1,
	__default = {
		__index = {
			buffProb = ({
				default = slot0[1]
			}).default,
			buffValueGroup = ({
				default = slot0[1]
			}).default,
			buffLifeRound = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.weather_buff
