slot0 = require("app.views.topui.config")
slot2 = class("DispatchTaskView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_activity_dispatch.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.actionPoint
})

function slot2.onCreate(slot0, slot1)
	slot2 = slot1.actionPointKey
	uv3 = "actionPointKey"

	slot3.onCreate(slot0, {
		"title"
	}, slot1)

	slot0.items = gGameModel.role:getIdler("items")

	idlereasy.when(slot0.items, function (slot0, slot1)
		uv2 = "num1"
		uv5 = "text"

		slot2.num1:text(mathEasy.getShortNumber(slot1[slot5] or 0, 2))
	end)
end

return slot2
