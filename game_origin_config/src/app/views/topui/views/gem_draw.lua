slot0 = require("app.views.topui.config")
slot2 = class("TopuiGemDrawView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_gem_draw.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.goldGem,
	slot0.rmbGem
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

function slot2.onGoldGemClick(slot0)
	slot0:buyTickets("goldGem", "gold")
end

function slot2.onRmbGemClick(slot0)
	slot0:buyTickets("rmbGem", "rmb")
end

return slot2
