slot0 = require("app.views.topui.config")
slot2 = class("TopuiFishingView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_fishing.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.diamond,
	slot0.fishingGold
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

function slot2.onBtnClick(slot0)
	gGameUI:stackUI("city.adventure.fishing.sence_select", nil, )
end

return slot2
