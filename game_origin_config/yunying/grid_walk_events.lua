slot0 = {
	__size = 1,
	[7] = {
		__size = 1,
		num = 3
	}
}
slot1 = {
	[3] = slot0[7],
	[5] = slot0[7]
}
csv.yunying.grid_walk_events = {
	{
		name = "Wheel Of Fortune",
		name_en = "Wheel Of Fortune",
		name_tw = "Wheel Of Fortune",
		name_kr = "Wheel Of Fortune",
		name_th = "Wheel Of Fortune",
		desc_en = "Randomly get a small reward when you stop on the grid",
		trigger = 2,
		desc = "Randomly get a small reward when you stop on the grid",
		desc_vn = "Randomly get a small reward when you stop on the grid",
		name_vn = "Wheel Of Fortune",
		id = 1,
		desc_th = "Randomly get a small reward when you stop on the grid",
		desc_tw = "Randomly get a small reward when you stop on the grid",
		desc_kr = "Randomly get a small reward when you stop on the grid",
		params = {
			__size = 1,
			items = {
				{
					8116,
					1,
					80
				},
				{
					27001,
					1,
					150
				},
				{
					8111,
					1,
					110
				},
				{
					6393,
					3,
					150
				},
				{
					8114,
					1,
					140
				},
				{
					8102,
					5,
					150
				},
				{
					"gold",
					20000,
					150
				},
				{
					8112,
					1,
					150
				}
			}
		},
		resources = {
			"icon_bg2.png",
			"icon_xyzp.png"
		}
	},
	{
		desc_vn = "Gain a small penalty when parking on a grid",
		name_en = "Bad Luck Card",
		name_tw = "Bad Luck Card",
		name_kr = "Bad Luck Card",
		type = 2,
		desc_th = "Gain a small penalty when parking on a grid",
		name = "Bad Luck Card",
		desc = "Gain a small penalty when parking on a grid",
		desc_tw = "Gain a small penalty when parking on a grid",
		desc_en = "Gain a small penalty when parking on a grid",
		trigger = 2,
		name_vn = "Bad Luck Card",
		name_th = "Bad Luck Card",
		id = 2,
		desc_kr = "Gain a small penalty when parking on a grid",
		params = {
			__size = 1,
			items = {
				{
					8102,
					1,
					100
				},
				{
					8102,
					2,
					200
				},
				{
					8115,
					1,
					150
				},
				{
					8102,
					4,
					200
				},
				{
					8117,
					1,
					150
				},
				{
					8113,
					1,
					150
				},
				{
					8114,
					1,
					150
				}
			}
		},
		resources = {
			"icon_bg8.png",
			"icon_eyk.png"
		}
	},
	{
		desc_vn = "Get Explorer Medal +3 when you land on a grid",
		name_en = "Explorer Medal+",
		name_tw = "Explorer Medal+",
		name_kr = "Explorer Medal+",
		type = 3,
		desc_th = "Get Explorer Medal +3 when you land on a grid",
		name = "Explorer Medal+",
		desc = "Get Explorer Medal +3 when you land on a grid",
		desc_tw = "Get Explorer Medal +3 when you land on a grid",
		desc_en = "Get Explorer Medal +3 when you land on a grid",
		trigger = 2,
		name_vn = "Explorer Medal+",
		name_th = "Explorer Medal+",
		id = 3,
		desc_kr = "Get Explorer Medal +3 when you land on a grid",
		params = slot1[3],
		resources = {
			"icon_bg4.png",
			"icon_hz.png"
		}
	},
	{
		desc_vn = "When stopping on the grid, the Explorer Medal -1 will be deducted",
		name_en = "Explorer Medal -",
		name_tw = "Explorer Medal -",
		name_kr = "Explorer Medal -",
		type = 4,
		desc_th = "When stopping on the grid, the Explorer Medal -1 will be deducted",
		name = "Explorer Medal -",
		desc = "When stopping on the grid, the Explorer Medal -1 will be deducted",
		desc_tw = "When stopping on the grid, the Explorer Medal -1 will be deducted",
		desc_en = "When stopping on the grid, the Explorer Medal -1 will be deducted",
		trigger = 2,
		name_vn = "Explorer Medal -",
		name_th = "Explorer Medal -",
		id = 4,
		desc_kr = "When stopping on the grid, the Explorer Medal -1 will be deducted",
		params = {
			__size = 1,
			num = 1
		},
		resources = {
			"icon_bg1.png",
			"icon_hz.png"
		}
	},
	{
		desc_vn = "After stopping on the grid, you can move forward 3 grids",
		name_en = "Leap Grid",
		name_tw = "Leap Grid",
		name_kr = "Leap Grid",
		type = 5,
		desc_th = "After stopping on the grid, you can move forward 3 grids",
		name = "Leap Grid",
		desc = "After stopping on the grid, you can move forward 3 grids",
		desc_tw = "After stopping on the grid, you can move forward 3 grids",
		desc_en = "After stopping on the grid, you can move forward 3 grids",
		trigger = 2,
		name_vn = "Leap Grid",
		name_th = "Leap Grid",
		id = 5,
		desc_kr = "After stopping on the grid, you can move forward 3 grids",
		params = slot1[5],
		resources = {
			"icon_bg5.png",
			"icon_bg6.png",
			"icon_bg7.png"
		}
	},
	{
		desc_vn = "You can buy a product once when you pass or stop on the grid",
		name_en = "Shop",
		name_tw = "Shop",
		name_kr = "Shop",
		type = 6,
		desc_th = "You can buy a product once when you pass or stop on the grid",
		name = "Shop",
		desc = "You can buy a product once when you pass or stop on the grid",
		desc_tw = "You can buy a product once when you pass or stop on the grid",
		desc_en = "You can buy a product once when you pass or stop on the grid",
		trigger = 1,
		name_vn = "Shop",
		name_th = "Shop",
		id = 6,
		desc_kr = "You can buy a product once when you pass or stop on the grid",
		params = {
			__size = 1,
			num = 0.6
		},
		resources = {
			"icon_bg3.png"
		}
	},
	{
		desc_vn = "Passing or stopping on the grid will get super big rewards!",
		name_en = "Treasure Chest",
		name_tw = "Treasure Chest",
		name_kr = "Treasure Chest",
		type = 99,
		desc_th = "Passing or stopping on the grid will get super big rewards!",
		name = "Treasure Chest",
		desc = "Passing or stopping on the grid will get super big rewards!",
		desc_tw = "Passing or stopping on the grid will get super big rewards!",
		desc_en = "Passing or stopping on the grid will get super big rewards!",
		trigger = 1,
		name_vn = "Treasure Chest",
		name_th = "Treasure Chest",
		id = 7,
		desc_kr = "Passing or stopping on the grid will get super big rewards!",
		params = {
			__size = 2,
			dist = 34,
			awards = {
				__size = 1,
				libs = {
					10111,
					10112,
					10113,
					10114,
					10115
				}
			}
		},
		resources = {
			"icon_bg9.png"
		}
	},
	__size = 7,
	__default = {
		__index = {
			desc_vn = "",
			name_en = "",
			name_tw = "",
			name_kr = "",
			type = 1,
			desc_th = "",
			name = "",
			desc = "",
			huodongID = 1001,
			desc_tw = "",
			desc_en = "",
			trigger = 0,
			name_vn = "",
			name_th = "",
			desc_kr = "",
			params = {
				__size = 0
			},
			resources = {}
		}
	}
}

return csv.yunying.grid_walk_events
