slot0 = {
	{},
	__size = 1
}
csv.cross.supremacy.elite = {
	__size = 1,
	[101] = {
		id = 101,
		day = 1,
		invalidMarkIDs = {
			721,
			731,
			741
		}
	},
	__default = {
		__index = {
			day = 0,
			invalidMarkIDs = ({
				default = slot0[1]
			}).default,
			invalidMegaCardIDs = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.cross.supremacy.elite
