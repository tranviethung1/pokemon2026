slot0 = {
	{},
	{
		__size = 0
	},
	{
		__size = 2,
		x = 0,
		y = 0
	},
	__size = 6,
	[6] = {
		[152.0] = 10,
		__size = 4,
		gold = 100000,
		[151.0] = 300,
		[529.0] = 600
	},
	[24] = {
		__size = 2,
		x = 510,
		y = 450
	},
	[35] = {
		[152.0] = 12,
		__size = 4,
		gold = 100000,
		[151.0] = 360,
		[529.0] = 720
	}
}
slot1 = {
	slot0[6],
	slot0[6],
	default = slot0[2],
	[3] = slot0[6],
	[5] = slot0[35],
	[4] = slot0[6],
	[7] = slot0[35],
	[6] = slot0[35],
	[8] = slot0[35]
}
slot5 = {
	default = slot0[3],
	[3] = slot0[24],
	[6] = slot0[24]
}
csv.gym.gym = {
	{
		name_en = "Viridian Gym",
		leaderAwardDesc_vn = "Recompensa para líder do Ginásio Viridian:",
		name = "Viridian Gym",
		leaderAwardDesc_en = "Reward for Viridian Gym Leader:",
		texture = "yan.png",
		crossSubAwardDesc_th = "รางวัลสำหรับสมาชิก Global Viridian Gym:",
		crossLeaderAwardDesc = "Global Viridian Gym Leader rewards:",
		npcID = 4,
		fontColor = "#C0xD2911E#",
		namePng = "txt_cq.png",
		crossLeaderAwardDesc_vn = "Recompensas do Líder Global do Ginásio de Viridian:",
		spine = "dao13_loop",
		crossLeaderAwardDesc_kr = "글로벌 상록체육관 관장:",
		crossLeaderAwardDesc_th = "รางวัล Global Viridian Gym Leader:",
		leaderAwardDesc = "Reward for Viridian Gym Leader:",
		crossSubAwardDesc_en = "Rewards for Global Viridian Gym members:",
		crossSubAwardDesc = "Rewards for Global Viridian Gym members:",
		crossLeaderAwardDesc_en = "Global Viridian Gym Leader rewards:",
		name_vn = "Ginásio de Viridian",
		name_th = "Viridian Gym",
		id = 1,
		crossSubAwardDesc_vn = "Recompensas para membros Globais do Ginásio Viridian:",
		hardDegreeID = {
			1,
			2,
			3,
			4,
			5
		},
		limitAttribute = {
			9,
			13
		},
		gateAward = slot1[1],
		leaderAward = {
			[452.0] = 30,
			[152.0] = 20,
			__size = 4,
			gold = 300000,
			[151.0] = 600
		},
		crossLeaderAward = {
			[452.0] = 100,
			[152.0] = 30,
			__size = 4,
			gold = 1000000,
			[151.0] = 900
		},
		crossSubAward = {
			[452.0] = 60,
			[152.0] = 25,
			__size = 4,
			gold = 500000,
			[151.0] = 750
		},
		posSkew = {
			__size = 2,
			x = 500,
			y = 400
		},
		pos = {
			__size = 2,
			x = 1480,
			y = 2320
		}
	},
	{
		name_en = "Snowpoint Gym",
		leaderAwardDesc_vn = "Recompensa para líder do Ginásio Snowpoint:",
		name = "Snowpoint Gym",
		leaderAwardDesc_en = "Reward for Snowpoint Gym Leader:",
		texture = "shui.png",
		crossSubAwardDesc_th = "รางวัลสำหรับสมาชิก Global Snowpoint:",
		crossLeaderAwardDesc = "Global Snowpoint Gym Leader rewards:",
		npcID = 8,
		fontColor = "#C0x078CF3#",
		namePng = "txt_qf.png",
		crossLeaderAwardDesc_vn = "Recompensas do Líder Global do Ginásio de Snowpoint:",
		spine = "dao8_loop",
		crossLeaderAwardDesc_kr = "글로벌 선단체육관 관장:",
		crossLeaderAwardDesc_th = "รางวัล Global Snowpoint Gym Leader:",
		leaderAwardDesc = "Reward for Snowpoint Gym Leader:",
		crossSubAwardDesc_en = "Rewards for Global Snowpoint members:",
		crossSubAwardDesc = "Rewards for Global Snowpoint members:",
		crossLeaderAwardDesc_en = "Global Snowpoint Gym Leader rewards:",
		name_vn = "Ginásio de Snowpoint",
		name_th = "Snowpoint Gym",
		id = 2,
		crossSubAwardDesc_vn = "Recompensas para membros Globais do Ginásio Snowpoint:",
		hardDegreeID = {
			11,
			12,
			13,
			14,
			15
		},
		limitAttribute = {
			3,
			6
		},
		gateAward = slot1[2],
		leaderAward = {
			[152.0] = 20,
			__size = 4,
			gold = 300000,
			[4000.0] = 50,
			[151.0] = 600
		},
		crossLeaderAward = {
			[152.0] = 30,
			__size = 4,
			gold = 1000000,
			[4000.0] = 150,
			[151.0] = 900
		},
		crossSubAward = {
			[152.0] = 25,
			__size = 4,
			gold = 500000,
			[4000.0] = 80,
			[151.0] = 750
		},
		posSkew = {
			__size = 2,
			x = 500,
			y = 380
		},
		pos = {
			__size = 2,
			x = 1408,
			y = 820
		}
	},
	{
		name_en = "Violet Gym",
		leaderAwardDesc_vn = "Recompensa para líder do Ginásio Violet:",
		name = "Violet Gym",
		leaderAwardDesc_en = "Reward for Violet Gym Leader:",
		texture = "cao.png",
		crossSubAwardDesc_th = "รางวัลสำหรับสมาชิก Global Violet Gym:",
		crossLeaderAwardDesc = "Global Violet Gym Leader rewards:",
		npcID = 2,
		fontColor = "#C0x2C9C1D#",
		namePng = "txt_jg.png",
		crossLeaderAwardDesc_vn = "Recompensas do Líder Global do Ginásio de Violet:",
		crossLeaderAwardDesc_kr = "글로벌 도라지체육관 관장:",
		crossLeaderAwardDesc_th = "รางวัล Global Violet Gym Leader:",
		crossSubAwardDesc_en = "Rewards for Global Violet Gym members:",
		leaderAwardDesc = "Reward for Violet Gym Leader:",
		crossLeaderAwardDesc_en = "Global Violet Gym Leader rewards:",
		crossSubAwardDesc = "Rewards for Global Violet Gym members:",
		crossSubAwardDesc_vn = "Recompensas para membros Globais do Ginásio Violet:",
		name_vn = "Ginásio de Violet",
		name_th = "Violet Gym",
		id = 3,
		hardDegreeID = {
			21,
			22,
			23,
			24,
			25
		},
		limitAttribute = {
			1,
			4,
			10
		},
		gateAward = slot1[3],
		leaderAward = {
			[152.0] = 20,
			__size = 4,
			gold = 300000,
			[151.0] = 600,
			[529.0] = 1000
		},
		crossLeaderAward = {
			[152.0] = 30,
			__size = 4,
			gold = 1000000,
			[151.0] = 900,
			[529.0] = 2000
		},
		crossSubAward = {
			[152.0] = 25,
			__size = 4,
			gold = 500000,
			[151.0] = 750,
			[529.0] = 1200
		},
		posSkew = slot5[3],
		pos = {
			__size = 2,
			x = 2427,
			y = 1601
		}
	},
	{
		name_en = "Cinnabar Gym",
		leaderAwardDesc_vn = "Recompensa para líder do Ginásio Cinnabar:",
		name = "Cinnabar Gym",
		leaderAwardDesc_en = "Reward for Cinnabar Gym Leader:",
		texture = "huo.png",
		crossSubAwardDesc_th = "รางวัลสำหรับสมาชิก Global Cinnabar Gym:",
		crossLeaderAwardDesc = "Global Cinnabar Gym Leader rewards:",
		npcID = 6,
		fontColor = "#C0xFF4810#",
		namePng = "txt_hl.png",
		crossLeaderAwardDesc_vn = "Recompensas do Líder Global do Ginásio de Cinnabar:",
		spine = "dao12_loop",
		crossLeaderAwardDesc_kr = "글로벌 홍련체육관 관장:",
		crossLeaderAwardDesc_th = "รางวัล Global Cinnabar Gym Leader:",
		leaderAwardDesc = "Reward for Cinnabar Gym Leader:",
		crossSubAwardDesc_en = "Rewards for Global Cinnabar Gym members:",
		crossSubAwardDesc = "Rewards for Global Cinnabar Gym members:",
		crossLeaderAwardDesc_en = "Global Cinnabar Gym Leader rewards:",
		name_vn = "Ginásio de Cinnabar",
		name_th = "Cinnabar Gym",
		id = 4,
		crossSubAwardDesc_vn = "Recompensas para membros Globais do Ginásio Cinnabar:",
		hardDegreeID = {
			31,
			32,
			33,
			34,
			35
		},
		limitAttribute = {
			2,
			7
		},
		gateAward = slot1[4],
		leaderAward = {
			[503.0] = 1,
			[152.0] = 20,
			__size = 4,
			gold = 300000,
			[151.0] = 600
		},
		crossLeaderAward = {
			[503.0] = 3,
			[152.0] = 30,
			__size = 4,
			gold = 1000000,
			[151.0] = 900
		},
		crossSubAward = {
			[503.0] = 2,
			[152.0] = 25,
			__size = 4,
			gold = 500000,
			[151.0] = 750
		},
		posSkew = {
			__size = 2,
			x = 520,
			y = 440
		},
		pos = {
			__size = 2,
			x = 3111,
			y = 2677
		}
	},
	{
		name_en = "Opelucid Gym",
		namePng = "txt_sl.png",
		leaderAwardDesc_vn = "Recompensa para líder do Ginásio Opelucid:",
		texture = "long.png",
		id = 5,
		leaderAwardDesc_en = "Reward for Opelucid Gym Leader:",
		crossSubAwardDesc_th = "รางวัลสำหรับสมาชิก Global Opelucid Gym:",
		crossLeaderAwardDesc = "Global Opelucid Gym Leader rewards:",
		npcID = 7,
		fontColor = "#C0x3B4FF3#",
		preGymID = 1,
		crossLeaderAwardDesc_en = "Global Opelucid Gym Leader rewards:",
		spine = "dao10_loop",
		crossLeaderAwardDesc_vn = "Recompensas do Líder Global do Ginásio de Opelucid:",
		crossLeaderAwardDesc_kr = "글로벌 쌍용체육관 관장:",
		leaderAwardDesc = "Reward for Opelucid Gym Leader:",
		crossLeaderAwardDesc_th = "รางวัลผู้นำยิมระดับโลก Opelucid:",
		crossSubAwardDesc = "Rewards for Global Opelucid Gym members:",
		crossSubAwardDesc_en = "Rewards for Global Opelucid Gym members:",
		name_vn = "Ginásio de Opelucid",
		name_th = "Opelucid Gym",
		name = "Opelucid Gym",
		crossSubAwardDesc_vn = "Recompensas para membros Globais do Ginásio Opelucid:",
		hardDegreeID = {
			41,
			42,
			43,
			44,
			45
		},
		limitAttribute = {
			5,
			15
		},
		gateAward = slot1[5],
		leaderAward = {
			[152.0] = 24,
			[519.0] = 1,
			__size = 4,
			gold = 300000,
			[151.0] = 720
		},
		crossLeaderAward = {
			[152.0] = 36,
			[519.0] = 3,
			__size = 4,
			gold = 1000000,
			[151.0] = 1080
		},
		crossSubAward = {
			[152.0] = 30,
			[519.0] = 2,
			__size = 4,
			gold = 500000,
			[151.0] = 900
		},
		posSkew = {
			__size = 2,
			x = 530,
			y = 340
		},
		pos = {
			__size = 2,
			x = 3203,
			y = 847
		}
	},
	{
		name_en = "Ecruteak Gym",
		namePng = "txt_yz.png",
		leaderAwardDesc_vn = "Recompensa para líder do Ginásio Ecruteak:",
		texture = "e.png",
		id = 6,
		leaderAwardDesc_en = "Reward for Ecruteak Gym Leader:",
		crossSubAwardDesc_th = "รางวัลสำหรับสมาชิก Global Ecruteak Gym:",
		crossLeaderAwardDesc = "Global Ecruteak Gym Leader rewards:",
		npcID = 5,
		fontColor = "#C0x1F1D1D#",
		preGymID = 2,
		crossLeaderAwardDesc_en = "Global Ecruteak Gym Leader rewards:",
		spine = "dao7_loop",
		crossLeaderAwardDesc_vn = "Recompensas do Líder Global do Ginásio de Ecruteak:",
		crossLeaderAwardDesc_kr = "글로벌 인주체육관 관장:",
		leaderAwardDesc = "Reward for Ecruteak Gym Leader:",
		crossLeaderAwardDesc_th = "รางวัลผู้นำยิมระดับโลก Ecruteak:",
		crossSubAwardDesc = "Rewards for Global Ecruteak Gym members:",
		crossSubAwardDesc_en = "Rewards for Global Ecruteak Gym members:",
		name_vn = "Ginásio de Ecruteak",
		name_th = "Ecruteak Gym",
		name = "Ecruteak Gym",
		crossSubAwardDesc_vn = "Recompensas para membros Globais do Ginásio Ecruteak:",
		hardDegreeID = {
			51,
			52,
			53,
			54,
			55
		},
		limitAttribute = {
			14,
			16
		},
		gateAward = slot1[6],
		leaderAward = {
			[152.0] = 24,
			__size = 4,
			[520.0] = 1,
			gold = 300000,
			[151.0] = 720
		},
		crossLeaderAward = {
			[152.0] = 36,
			__size = 4,
			[520.0] = 3,
			gold = 1000000,
			[151.0] = 1080
		},
		crossSubAward = {
			[152.0] = 30,
			__size = 4,
			[520.0] = 2,
			gold = 500000,
			[151.0] = 900
		},
		posSkew = slot5[6],
		pos = {
			__size = 2,
			x = 4075,
			y = 1696
		}
	},
	{
		name_en = "Olivine Gym",
		namePng = "txt_qc.png",
		leaderAwardDesc_vn = "Recompensa para líder do Ginásio Olivine:",
		texture = "du.png",
		id = 7,
		leaderAwardDesc_en = "Reward for Olivine Gym Leader:",
		crossSubAwardDesc_th = "รางวัลสำหรับสมาชิก Global Olivine Gym:",
		crossLeaderAwardDesc = "Global Olivine Gym Leader rewards:",
		npcID = 1,
		fontColor = "#C0x9B21BC#",
		preGymID = 3,
		crossLeaderAwardDesc_en = "Global Olivine Gym Leader rewards:",
		spine = "dao11_loop",
		crossLeaderAwardDesc_vn = "Recompensas do Líder Global do Ginásio de Olivine:",
		crossLeaderAwardDesc_kr = "글로벌 담청체육관 관장:",
		leaderAwardDesc = "Reward for Olivine Gym Leader:",
		crossLeaderAwardDesc_th = "รางวัล Global Olivine Gym Leader:",
		crossSubAwardDesc = "Rewards for Global Olivine Gym members:",
		crossSubAwardDesc_en = "Rewards for Global Olivine Gym members:",
		name_vn = "Ginásio de Olivine",
		name_th = "Olivine Gym",
		name = "Olivine Gym",
		crossSubAwardDesc_vn = "Recompensas para membros Globais do Ginásio Olivine:",
		hardDegreeID = {
			61,
			62,
			63,
			64,
			65
		},
		limitAttribute = {
			8,
			12,
			17
		},
		gateAward = slot1[7],
		leaderAward = {
			[152.0] = 24,
			[151.0] = 720,
			__size = 4,
			gold = 300000,
			[531.0] = 2
		},
		crossLeaderAward = {
			[152.0] = 36,
			[151.0] = 1080,
			__size = 4,
			gold = 1000000,
			[531.0] = 4
		},
		crossSubAward = {
			[152.0] = 30,
			[151.0] = 900,
			__size = 4,
			gold = 500000,
			[531.0] = 3
		},
		posSkew = {
			__size = 2,
			x = 510,
			y = 440
		},
		pos = {
			__size = 2,
			x = 4650,
			y = 2726
		}
	},
	{
		name_en = "Laverre Gym",
		namePng = "txt_xx.png",
		leaderAwardDesc_vn = "Recompensa para líder do Ginásio Laverre:",
		texture = "yao.png",
		id = 8,
		leaderAwardDesc_en = "Reward for Laverre Gym Leader:",
		crossSubAwardDesc_th = "รางวัลสำหรับสมาชิก Global Laverre Gym:",
		crossLeaderAwardDesc = "Global Laverre Gym Leader rewards:",
		npcID = 3,
		fontColor = "#C0xFF2E5A#",
		preGymID = 4,
		crossLeaderAwardDesc_en = "Global Laverre Gym Leader rewards:",
		spine = "dao9_loop",
		crossLeaderAwardDesc_vn = "Recompensas do Líder Global do Ginásio de Laverre:",
		crossLeaderAwardDesc_kr = "글로벌 후늬체육관 관장:",
		leaderAwardDesc = "Reward for Laverre Gym Leader:",
		crossLeaderAwardDesc_th = "รางวัล Global Laverre Gym Leader:",
		crossSubAwardDesc = "Rewards for Global Laverre Gym members:",
		crossSubAwardDesc_en = "Rewards for Global Laverre Gym members:",
		name_vn = "Ginásio de Laverre",
		name_th = "Laverre Gym",
		name = "Laverre Gym",
		crossSubAwardDesc_vn = "Recompensas para membros Globais do Ginásio Laverre:",
		hardDegreeID = {
			71,
			72,
			73,
			74,
			75
		},
		limitAttribute = {
			11,
			18
		},
		gateAward = slot1[8],
		leaderAward = {
			[152.0] = 24,
			__size = 4,
			gold = 300000,
			[151.0] = 720,
			[502.0] = 2
		},
		crossLeaderAward = {
			[152.0] = 36,
			__size = 4,
			[521.0] = 3,
			gold = 1000000,
			[151.0] = 1080
		},
		crossSubAward = {
			[152.0] = 30,
			__size = 4,
			gold = 500000,
			[151.0] = 900,
			[502.0] = 3
		},
		posSkew = {
			__size = 2,
			x = 495,
			y = 430
		},
		pos = {
			__size = 2,
			x = 5082,
			y = 886
		}
	},
	__size = 8,
	__default = {
		__index = {
			name = "",
			name_en = "",
			leaderAwardDesc_vn = "",
			crossLeaderAwardDesc_en = "",
			crossLeaderAwardDesc_vn = "",
			crossLeaderAwardDesc_kr = "",
			crossSubAwardDesc_th = "",
			crossLeaderAwardDesc = "",
			crossSubAwardDesc_en = "",
			fontColor = "#C0x5B545B#",
			leaderAwardDesc_en = "",
			crossLeaderAwardDesc_th = "",
			spine = "dao6_loop",
			crossSubAwardDesc_vn = "",
			leaderAwardDesc = "",
			crossSubAwardDesc = "",
			name_vn = "",
			name_th = "",
			hardDegreeID = ({
				default = slot0[1]
			}).default,
			limitAttribute = ({
				default = slot0[1]
			}).default,
			gateAward = slot1.default,
			leaderAward = ({
				default = slot0[2]
			}).default,
			crossLeaderAward = ({
				default = slot0[2]
			}).default,
			crossSubAward = ({
				default = slot0[2]
			}).default,
			posSkew = slot5.default,
			pos = ({
				default = slot0[3]
			}).default
		}
	}
}

return csv.gym.gym
