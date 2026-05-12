slot0 = {
	[2] = {
		__size = 2,
		height = 5100,
		width = 8200
	}
}
csv.cross.union_adventure.theme = {
	{
		map = 1,
		name = "Ancient Forest",
		sceneScale = 1.2,
		tmx = "caodi.tmx",
		wholeMapScale = 0.297,
		id = 1,
		weight = 100,
		events = {
			1
		},
		sceneSize = slot0[2]
	},
	{
		map = 2,
		outcomeRule = 2,
		name = "Thunderous Realm",
		weight = 100,
		id = 2,
		sceneScale = 1.5,
		tmx = "caodi.tmx",
		events = {
			1,
			3
		}
	},
	{
		map = 3,
		outcomeRule = 2,
		name = "Rainbow-cutting Rain",
		sceneScale = 1.3,
		tmx = "caodi.tmx",
		wholeMapScale = 0.368,
		id = 3,
		weight = 100,
		events = {
			1,
			4
		}
	},
	{
		map = 4,
		name = "Ember Incineration",
		sceneScale = 1.2,
		simpleMapRes = "city/union/cross_union_adventure/map/img_luxian_d1.png",
		edgeRes = "city/union/cross_union_adventure/map/img_fenzhuolumian.png",
		tmx = "fenzhuo.tmx",
		wholeMapScale = 0.297,
		id = 4,
		weight = 100,
		events = {
			1,
			2
		},
		sceneSize = slot0[2]
	},
	{
		map = 5,
		name = "Apocalyptic Winter",
		simpleMapRes = "city/union/cross_union_adventure/map/img_luxian_d2.png",
		sceneScale = 1,
		tmx = "shuangxue.tmx",
		wholeMapScale = 0.299,
		id = 5,
		weight = 100,
		events = {
			1,
			6
		},
		sceneSize = slot0[2]
	},
	{
		map = 6,
		outcomeRule = 2,
		name = "Specter of Vengeance",
		simpleMapRes = "city/union/cross_union_adventure/map/img_luxian_d3.png",
		sceneScale = 0.95,
		edgeRes = "city/union/cross_union_adventure/map/img_guizhoulumian.png",
		tmx = "guizhou.tmx",
		wholeMapScale = 0.298,
		id = 6,
		weight = 100,
		events = {
			1,
			5
		},
		sceneSize = slot0[2]
	},
	{
		id = 7,
		name = "Kirigakure Trek",
		map = 7
	},
	__size = 9,
	[-1] = {
		map = -1,
		wholeMapScale = 0.2,
		simpleMapScale = 0.1,
		id = -1
	},
	[-2] = {
		map = -1,
		outcomeRule = 2,
		id = -2
	},
	__default = {
		__index = {
			map = 0,
			outcomeRule = 1,
			simpleMapScale = 0.06,
			simpleMapRes = "city/union/cross_union_adventure/map/img_luxian_d.png",
			edgeRes = "city/union/cross_union_adventure/map/img_lumian.png",
			sceneScale = 1.6,
			tmx = "caodi.tmx",
			wholeMapScale = 0.4,
			weight = 0,
			events = {},
			sceneSize = {
				__size = 2,
				height = 3800,
				width = 8200
			}
		}
	}
}

return csv.cross.union_adventure.theme
