slot0 = require("app.views.topui.config")
slot2 = class("TopuiFragmentView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_fragment.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.fragment
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

return slot2
