slot0 = require("app.views.topui.config")
slot2 = class("TopuiTownLumberView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_town_lumber.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.lumber
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

function slot2.onLumberClick(slot0)
	slot1, slot2 = gGameUI:getTopStackUI()

	if slot2 ~= "city.town.normal_factory" then
		gGameUI:stackUI("city.town.normal_factory", nil, {
			full = true
		}, 4, 1)
	end
end

return slot2
