slot0 = {
	{
		__size = 0
	},
	__size = 1
}
csv.template.training = {
	{
		id = 1,
		heldItem = {
			id = 30101,
			advance = 5,
			__size = 3,
			level = 60
		},
		chip1 = {
			id = 60121,
			__size = 2,
			level = 20
		},
		gem1 = {
			id = 40121,
			__size = 2,
			level = 20
		},
		contract1 = {
			id = 81201,
			advance = 1,
			__size = 3,
			level = 15
		}
	},
	__size = 1,
	__default = {
		__index = {
			contract2 = ({
				default = slot0[1]
			}).default,
			contract4 = ({
				default = slot0[1]
			}).default,
			heldItem = ({
				default = slot0[1]
			}).default,
			gem5 = ({
				default = slot0[1]
			}).default,
			chip6 = ({
				default = slot0[1]
			}).default,
			contract3 = ({
				default = slot0[1]
			}).default,
			gem9 = ({
				default = slot0[1]
			}).default,
			gem2 = ({
				default = slot0[1]
			}).default,
			gem7 = ({
				default = slot0[1]
			}).default,
			gem8 = ({
				default = slot0[1]
			}).default,
			gem6 = ({
				default = slot0[1]
			}).default,
			gem3 = ({
				default = slot0[1]
			}).default,
			chip3 = ({
				default = slot0[1]
			}).default,
			chip2 = ({
				default = slot0[1]
			}).default,
			chip5 = ({
				default = slot0[1]
			}).default,
			chip4 = ({
				default = slot0[1]
			}).default,
			chip1 = ({
				default = slot0[1]
			}).default,
			gem1 = ({
				default = slot0[1]
			}).default,
			contract1 = ({
				default = slot0[1]
			}).default,
			gem4 = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.template.training
