csv.field_buff_relation = {
	__size = 10,
	[11] = {
		id = 11,
		type = 1,
		weatherType = 11,
		restrain = {
			12
		}
	},
	[12] = {
		id = 12,
		type = 1,
		weatherType = 12,
		restrain = {
			13
		}
	},
	[13] = {
		id = 13,
		type = 1,
		weatherType = 13,
		restrain = {
			11
		}
	},
	[14] = {
		id = 14,
		type = 1,
		weatherType = 14,
		restrain = {
			15
		}
	},
	[15] = {
		id = 15,
		type = 1,
		weatherType = 15
	},
	[21] = {
		type = 1,
		weatherType = 21,
		id = 21,
		level = 2,
		restrain = {
			22
		}
	},
	[22] = {
		type = 1,
		weatherType = 22,
		id = 22,
		level = 2,
		restrain = {
			23
		}
	},
	[23] = {
		type = 1,
		weatherType = 23,
		id = 23,
		level = 2,
		restrain = {
			21
		}
	},
	[25] = {
		id = 25,
		level = 2,
		type = 1,
		weatherType = 25
	},
	[30] = {
		id = 30,
		level = 3,
		type = 1,
		weatherType = 30
	},
	__default = {
		__index = {
			level = 1,
			restrain = {}
		}
	}
}

return csv.field_buff_relation
