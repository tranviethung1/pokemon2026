slot0 = {
	{
		__size = 2,
		x = 0,
		y = 0
	},
	__size = 4,
	[4] = {
		__size = 2,
		x = 1,
		y = 1
	},
	[5] = {
		__size = 2,
		x = -20,
		y = -160
	},
	[6] = {
		__size = 2,
		x = 1555,
		y = 700
	}
}
slot1 = {
	default = slot0[1],
	[5] = slot0[5],
	[4] = slot0[5],
	[7] = slot0[5],
	[6] = slot0[5]
}
slot2 = {
	[3] = slot0[4],
	[5] = slot0[4],
	[4] = slot0[4],
	[7] = slot0[4],
	[6] = slot0[4]
}
slot3 = {
	default = slot0[1],
	[5] = slot0[6],
	[4] = slot0[6],
	[7] = slot0[6],
	[6] = slot0[6]
}
csv.summer_challenge.base = {
	{
		achievementID = 2419,
		spine = "summer_challenge/zhounianditu_tubiaojiesuo.skel",
		id = 1,
		gateSeqID = 1,
		iconFog = "activity/summer_challenge/btn_2zn_11.png"
	},
	{
		achievementID = 2419,
		name = "Summer Adventure Explore",
		subTitle = "Summer Adventure Explore",
		id = 2,
		gateSeqID = 1,
		iconFog = "activity/summer_challenge/btn_2zn_11.png"
	},
	{
		achievementID = 2430,
		name = "Incredible Challenge",
		subTitle = "Mysterious Challenge",
		spine = "summer_challenge/zhounianditu_tubiaojiesuo.skel",
		achievementName = "呆呆传说",
		achievementText = "activity/summer_challenge/txt_2zn_ddcs.png",
		achievementBg = "activity/summer_challenge/img_2zn_tgbj.png",
		iconFog = "activity/summer_challenge/btn_2zn_11.png",
		background = "activity/summer_challenge/bg_2zn.jpg",
		id = 3,
		gateSeqID = 2,
		achievementImg = "activity/summer_challenge/img_2zn_ddcs.png",
		imgPos = {
			__size = 2,
			x = -40,
			y = 0
		},
		bgScale = slot2[3]
	},
	{
		achievementID = 2435,
		name = "Summer Adventure Explore",
		subTitle = "Summer Adventure Explore",
		spine = "summer_challenge/xiaritiaozhan_tubiaojiesuo.skel",
		achievementName = "Scalchop King",
		achievementText = "activity/summer_challenge/txt_bksy_sbbw.png",
		achievementBg = "effect/hd.skel",
		iconFog = "activity/summer_challenge/btn_bksy_11.png",
		background = "activity/summer_challenge/bg_bksy_1.jpg",
		id = 4,
		gateSeqID = 3,
		achievementImg = "activity/summer_challenge/img_bksy_sbbw.png",
		imgPos = slot1[4],
		bgScale = slot2[4],
		bgSpinePos = slot3[4]
	},
	{
		achievementID = 2446,
		name = "Incredible Challenge",
		subTitle = "Mysterious Challenge",
		spine = "summer_challenge/congyoubing_tubiaojiesuo.skel",
		achievementBg = "effect/hd.skel",
		achievementText = "activity/summer_challenge/txt_23znq_jdds.png",
		iconFog = "activity/summer_challenge/btn_2zn_11.png",
		background = "activity/summer_challenge/bg_bksy_2.jpg",
		id = 5,
		gateSeqID = 4,
		achievementImg = "activity/summer_challenge/img_23znq_jdds.png",
		imgPos = slot1[5],
		bgScale = slot2[5],
		bgSpinePos = slot3[5]
	},
	{
		achievementID = 2451,
		name = "Summer Adventure Explore",
		subTitle = "Summer Adventure Explore",
		spine = "summer_challenge/summer2023_tubiaojiesuo.skel",
		achievementBg = "effect/hd.skel",
		achievementText = "activity/summer_challenge/txt_xrtz_kgxj.png",
		iconFog = "activity/summer_challenge/btn_bksy_11.png",
		background = "activity/summer_challenge/bg_xrtz_3.jpg",
		id = 6,
		gateSeqID = 5,
		achievementImg = "activity/summer_challenge/img_xrtz_kgxj.png",
		imgPos = slot1[6],
		bgScale = slot2[6],
		bgSpinePos = slot3[6]
	},
	{
		achievementID = 2446,
		name = "Incredible Challenge",
		subTitle = "Mysterious Challenge",
		spine = "summer_challenge/congyoubing_tubiaojiesuo.skel",
		achievementBg = "effect/hd.skel",
		achievementText = "activity/summer_challenge/txt_23znq_jdds.png",
		iconFog = "activity/summer_challenge/btn_2zn_11.png",
		background = "activity/summer_challenge/bg_bksy_2.jpg",
		id = 7,
		gateSeqID = 6,
		achievementImg = "activity/summer_challenge/img_23znq_jdds.png",
		imgPos = slot1[7],
		bgScale = slot2[7],
		bgSpinePos = slot3[7]
	},
	__size = 7,
	__default = {
		__index = {
			achievementID = 0,
			name = "",
			subTitle = "",
			spine = "",
			achievementName = "",
			achievementText = "",
			achievementBg = "",
			iconFog = "",
			background = "",
			gateSeqID = 0,
			achievementImg = "",
			imgPos = slot1.default,
			bgScale = {
				__size = 2,
				x = 2,
				y = 2
			},
			bgSpinePos = slot3.default
		}
	}
}

return csv.summer_challenge.base
