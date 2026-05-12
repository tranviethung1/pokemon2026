slot0 = require("app.views.topui.config")
slot2 = class("TopuiCrossMineView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_cross_mine.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.crossMine
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)

	slot0.sign = slot1.sign
end

return slot2
