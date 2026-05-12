slot0 = require("app.views.topui.config")
slot2 = class("TopuiChipView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_chip.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.rightTopPanel,
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.chip
})

function slot2.onCreate(slot0, slot1)
	slot2 = slot0.rightTopPanel:get("coin8Panel.btnAdd")
	slot2 = slot2.hide

	slot2(slot2)

	uv2 = "rightTopPanel"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

return slot2
