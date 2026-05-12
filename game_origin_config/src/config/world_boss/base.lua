slot0 = {
	{
		__size = 0
	},
	__size = 8,
	[3] = {
		talent_point = 1,
		rmb = 20,
		gold = 100000,
		__size = 3
	},
	[4] = {
		"config/world_boss/skill_icon/icon_1.png",
		"config/world_boss/skill_icon/icon_2.png",
		"config/world_boss/skill_icon/icon_3.png",
		"config/world_boss/skill_icon/icon_4.png"
	},
	[5] = {
		gold = 100000,
		[2103.0] = 5,
		rmb = 20,
		__size = 3
	},
	[6] = {
		"config/world_boss/skill_icon/icon_5.png",
		"config/world_boss/skill_icon/icon_6.png",
		"config/world_boss/skill_icon/icon_7.png",
		"config/world_boss/skill_icon/icon_8.png"
	},
	[7] = {
		gold = 100000,
		rmb = 20,
		__size = 3,
		[850.0] = 100
	},
	[8] = {
		"config/world_boss/skill_icon/icon_9.png",
		"config/world_boss/skill_icon/icon_10.png",
		"config/world_boss/skill_icon/icon_12.png",
		"config/world_boss/skill_icon/icon_11.png"
	},
	[9] = {
		gold = 100000,
		[451.0] = 60,
		rmb = 20,
		__size = 3
	}
}
slot1 = {
	slot0[4],
	slot0[6],
	[11] = slot0[6],
	[10] = slot0[4],
	[12] = slot0[8],
	[3] = slot0[8],
	[5] = slot0[6],
	[4] = slot0[4],
	[7] = slot0[4],
	[6] = slot0[8],
	[9] = slot0[8],
	[8] = slot0[6]
}
slot3 = {
	slot0[3],
	slot0[5],
	[11] = slot0[7],
	[12] = slot0[9],
	[10] = slot0[5],
	default = slot0[1],
	[3] = slot0[7],
	[5] = slot0[3],
	[4] = slot0[9],
	[7] = slot0[7],
	[6] = slot0[5],
	[9] = slot0[3],
	[8] = slot0[9]
}
csv.world_boss.base = {
	{
		gateID = 70001,
		bossScale = 0.9,
		baseHP = 30000000,
		huodongID = 1001,
		id = 1,
		bossID = 25001,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[1],
		skillIcon = slot1[1]
	},
	{
		gateID = 70002,
		bossScale = 1.2,
		baseHP = 30000000,
		huodongID = 1002,
		id = 2,
		bossID = 25102,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[2],
		skillIcon = slot1[2]
	},
	{
		gateID = 70003,
		bossScale = 1.2,
		baseHP = 30000000,
		huodongID = 1003,
		id = 3,
		bossID = 25202,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[3],
		skillIcon = slot1[3]
	},
	{
		gateID = 70001,
		bossScale = 0.9,
		baseHP = 30000000,
		huodongID = 1004,
		id = 4,
		bossID = 25001,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[4],
		skillIcon = slot1[4]
	},
	{
		gateID = 70002,
		bossScale = 1.2,
		baseHP = 30000000,
		huodongID = 1005,
		id = 5,
		bossID = 25102,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[5],
		skillIcon = slot1[5]
	},
	{
		gateID = 70003,
		bossScale = 1.2,
		baseHP = 30000000,
		huodongID = 1006,
		id = 6,
		bossID = 25202,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[6],
		skillIcon = slot1[6]
	},
	{
		gateID = 70001,
		bossScale = 0.9,
		baseHP = 30000000,
		huodongID = 1007,
		id = 7,
		bossID = 25001,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[7],
		skillIcon = slot1[7]
	},
	{
		gateID = 70002,
		bossScale = 1.2,
		baseHP = 30000000,
		huodongID = 1008,
		id = 8,
		bossID = 25102,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[8],
		skillIcon = slot1[8]
	},
	{
		gateID = 70003,
		bossScale = 1.2,
		baseHP = 30000000,
		huodongID = 1009,
		id = 9,
		bossID = 25202,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[9],
		skillIcon = slot1[9]
	},
	{
		gateID = 70001,
		bossScale = 0.9,
		baseHP = 30000000,
		huodongID = 1010,
		id = 10,
		bossID = 25001,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[10],
		skillIcon = slot1[10]
	},
	{
		gateID = 70002,
		bossScale = 1.2,
		baseHP = 30000000,
		huodongID = 1011,
		id = 11,
		bossID = 25102,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[11],
		skillIcon = slot1[11]
	},
	{
		gateID = 70003,
		bossScale = 1.2,
		baseHP = 30000000,
		huodongID = 1012,
		id = 12,
		bossID = 25202,
		serverTargetRes = "config/world_boss/box/bx.png",
		serverTargetAward = slot3[12],
		skillIcon = slot1[12]
	},
	__size = 12,
	__default = {
		__index = {
			gateID = 0,
			desc = "",
			bossScale = 1,
			bg = "",
			baseHP = 100000,
			huodongID = 0,
			bossID = 0,
			serverTargetAward = slot3.default,
			skillIcon = {},
			bossPos = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.world_boss.base
