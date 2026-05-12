slot0 = require("app.views.topui.config")
slot2 = class("TopuiCityView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_city.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.gold,
	slot0.diamond,
	slot0.stamina,
	slot0.redfox
})

function slot2.onCreate(slot0)
	uv1 = "onCreate"

	slot1.onCreate(slot0, {
		"stamina",
		"redfox"
	})
end

return slot2
