slot0 = require("app.views.topui.config")
slot2 = class("TopuiCrossUnionAdventureView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_cross_union_adventure.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.crossUnionAdventure
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

function slot2.onCrossUnionAdventureClick(slot0)
	if not slot0.sign then
		jumpEasy.jumpTo("crossUnionAdventure")
	end
end

return slot2
