slot0 = require("app.views.topui.config")
slot2 = class("TopuiCaptureView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_capture.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.capture
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)

	slot0.items = gGameModel.role:getIdler("items")

	idlereasy.when(slot0.items, function (slot0, slot1)
		uv2 = "num1"
		slot2 = slot2.num1
		slot2 = slot2.text

		slot2(slot2, mathEasy.getShortNumber(slot1[game.SPRITE_BALL_ID.normal] or 0, 2))

		uv2 = "num1"
		slot2 = slot2.num2
		slot2 = slot2.text

		slot2(slot2, mathEasy.getShortNumber(slot1[game.SPRITE_BALL_ID.hero] or 0, 2))

		uv2 = "num1"

		slot2.num3:text(mathEasy.getShortNumber(slot1[game.SPRITE_BALL_ID.nightmare] or 0, 2))
	end)
end

return slot2
