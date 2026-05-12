slot2 = class("TopuiCraftView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_union_answer.json"
slot2.RESOURCE_BINDING = maptools.extend({
	require("app.views.topui.config").title
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

return slot2
