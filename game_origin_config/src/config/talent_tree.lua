slot0 = {
	__size = 0
}
csv.talent_tree = {
	{
		name = "Basic",
		name_en = "Basic",
		showLevel = 0,
		des_en = "Team's base stats",
		showLevel_kr = 0,
		des_th = "สถิติพื้นฐานของทีม",
		preTalentpoint = 0,
		showLevel_en = 0,
		name_th = "Basic",
		id = 1,
		icon = "talent/icon_jc.png",
		roleLevel = 25,
		des = "Team's base stats"
	},
	{
		name = "Normal",
		name_en = "Normal",
		showLevel = 0,
		des_en = "Stat boost for Pokémons in the team",
		showLevel_kr = 0,
		des_th = "เพิ่มสถิติโปเกมอนในทีม",
		preTalentpoint = 150,
		showLevel_en = 0,
		name_th = "Normal",
		id = 2,
		icon = "talent/icon_jj.png",
		roleLevel = 45,
		des = "Stat boost for Pokémons in the team"
	},
	{
		name = "Element",
		name_en = "Element",
		showLevel = 0,
		des_en = "Pokémon type exclusive bonus #F36##C0xf76b45#(All [Element] HP bonus are only effective for the Pokémon's primary type)",
		showLevel_kr = 0,
		des_th = "โบนัสพิเศษประเภทโปเกมอน #F36##C0xf76b45#(โบนัส [ธาตุ] HP ทั้งหมดมีผลกับประเภทหลักของโปเกมอนเท่านั้น)",
		preTalentpoint = 220,
		showLevel_en = 0,
		name_th = "Element",
		id = 3,
		icon = "talent/icon_ys.png",
		roleLevel = 65,
		des = "Pokémon type exclusive bonus #F36##C0xf76b45#(All [Element] HP bonus are only effective for the Pokémon's primary type)"
	},
	__size = 3,
	__default = {
		__index = {
			languages = {
				"cn",
				"br",
				"en",
				"vn",
				"th",
				"kr"
			}
		}
	}
}

return csv.talent_tree
