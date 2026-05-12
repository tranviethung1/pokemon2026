slot0 = {
	{
		__size = 0
	},
	{
		__size = 1,
		gym_talent_point = 15
	},
	{
		__size = 1,
		gym_talent_point = 20
	},
	__size = 6,
	[5] = {
		__size = 1,
		gym_talent_point = 30
	},
	[7] = {
		__size = 1,
		gym_talent_point = 5
	},
	[8] = {
		__size = 1,
		gym_talent_point = 10
	}
}
slot1 = {
	slot0[5],
	slot0[5],
	default = slot0[1],
	[3] = slot0[5],
	[5] = slot0[5],
	[4] = slot0[5]
}
slot2 = {
	[0] = slot0[5],
	slot0[3],
	slot0[3],
	default = slot0[1],
	[3] = slot0[3],
	[5] = slot0[3],
	[4] = slot0[3]
}
slot3 = {
	[0] = slot0[2],
	slot0[7],
	slot0[7],
	default = slot0[1],
	[3] = slot0[7],
	[5] = slot0[7],
	[4] = slot0[7]
}
slot4 = {
	slot0[2],
	slot0[2],
	default = slot0[1],
	[3] = slot0[2],
	[5] = slot0[2],
	[4] = slot0[2]
}
slot5 = {
	[0] = slot0[3],
	slot0[8],
	slot0[8],
	default = slot0[1],
	[3] = slot0[8],
	[5] = slot0[8],
	[4] = slot0[8]
}
csv.gym.talent_cost = {
	[0] = {
		id = 0,
		cost1 = slot3[0],
		cost2 = slot5[0],
		cost3 = {
			__size = 1,
			gym_talent_point = 25
		},
		cost4 = slot2[0],
		cost5 = {
			__size = 1,
			gym_talent_point = 40
		}
	},
	{
		id = 1,
		cost1 = slot3[1],
		cost2 = slot5[1],
		cost3 = slot4[1],
		cost4 = slot2[1],
		cost5 = slot1[1]
	},
	{
		id = 2,
		cost1 = slot3[2],
		cost2 = slot5[2],
		cost3 = slot4[2],
		cost4 = slot2[2],
		cost5 = slot1[2]
	},
	{
		id = 3,
		cost1 = slot3[3],
		cost2 = slot5[3],
		cost3 = slot4[3],
		cost4 = slot2[3],
		cost5 = slot1[3]
	},
	{
		id = 4,
		cost1 = slot3[4],
		cost2 = slot5[4],
		cost3 = slot4[4],
		cost4 = slot2[4],
		cost5 = slot1[4]
	},
	{
		id = 5,
		cost1 = slot3[5],
		cost2 = slot5[5],
		cost3 = slot4[5],
		cost4 = slot2[5],
		cost5 = slot1[5]
	},
	__size = 6,
	__default = {
		__index = {
			cost1 = slot3.default,
			cost2 = slot5.default,
			cost3 = slot4.default,
			cost4 = slot2.default,
			cost5 = slot1.default
		}
	}
}

return csv.gym.talent_cost
