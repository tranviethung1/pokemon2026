slot0 = require("app.views.topui.config")
slot2 = class("TopuiTitleView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_default.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.rightTopPanel
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
	slot0.rightTopPanel:hide()
end

return slot2
