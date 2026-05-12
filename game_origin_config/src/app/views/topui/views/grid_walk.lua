slot0 = require("app.views.topui.config")
slot2 = class("TopuiGridWalkView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_grid_walk.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.gridWalk
})

function slot2.onCreate(slot0, slot1)
	slot2 = slot1.iconNum
	slot0.iconNum = slot2
	uv2 = "iconNum"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)

	slot0.items = gGameModel.role:getIdler("items")

	idlereasy.any({
		slot0.iconNum
	}, function (slot0, slot1)
		slot3 = slot1
		uv3 = "math"

		slot3.num1:text(mathEasy.getShortNumber(math.max(slot3, 0), 2))
	end)
end

return slot2
