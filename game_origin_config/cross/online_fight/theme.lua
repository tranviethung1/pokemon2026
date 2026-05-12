slot0 = {
	{
		__size = 0
	},
	__size = 1
}
csv.cross.online_fight.theme = {
	{
		desc_vn = "Full anger at the start",
		desc_kr = "시작 때 분노치 가득",
		id = 1,
		desc_en = "Full anger at the start",
		desc_tw = "Full anger at the start",
		desc = "Full anger at the start",
		skills = {
			__size = 1,
			[78001.0] = 1
		}
	},
	{
		desc_vn = "Infinitely basic skills",
		desc_kr = "무한 스킬",
		id = 2,
		desc_en = "Infinitely basic skills",
		desc_tw = "Infinitely basic skills",
		desc = "Infinitely basic skills",
		skills = {
			[78002.0] = 1,
			__size = 1
		}
	},
	{
		desc_vn = "Quick anger regeneration",
		desc_kr = "분노 쾌속 회복",
		id = 3,
		desc_en = "Quick anger regeneration",
		desc_tw = "Quick anger regeneration",
		desc = "Quick anger regeneration",
		skills = {
			__size = 1,
			[78003.0] = 1
		}
	},
	{
		desc_vn = "Type restraint increase",
		desc_kr = "자연속성 억제 심화",
		id = 4,
		desc_en = "Type restraint increase",
		desc_tw = "Type restraint increase",
		desc = "Type restraint increase",
		skills = {
			[78004.0] = 1,
			__size = 1
		}
	},
	{
		desc_vn = "Only lusing A card and below",
		desc_kr = "A카드 및 이하만 사용 가능",
		id = 5,
		desc_en = "Only lusing A card and below",
		desc_tw = "Only lusing A card and below",
		desc = "Only lusing A card and below",
		rarityLimit = {
			nil,
			nil,
			0,
			0,
			__size = 2
		}
	},
	{
		desc_vn = "Only using S card and below",
		desc_kr = "S카드 및 이하만 사용 가능",
		id = 6,
		desc_en = "Only using S card and below",
		desc_tw = "Only using S card and below",
		desc = "Only using S card and below",
		rarityLimit = {
			[4.0] = 0,
			__size = 1
		}
	},
	{
		desc_vn = "Only 2 S cards can be used",
		desc_kr = "S카드 2장만 사용 가능",
		id = 7,
		desc_en = "Only 2 S cards can be used",
		desc_tw = "Only 2 S cards can be used",
		desc = "Only 2 S cards can be used",
		rarityLimit = {
			[3.0] = 2,
			__size = 1
		}
	},
	__size = 7,
	__default = {
		__index = {
			desc_vn = "",
			desc_kr = "",
			desc_en = "",
			desc_tw = "",
			desc = "",
			skills = ({
				default = slot0[1]
			}).default,
			rarityLimit = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.cross.online_fight.theme
