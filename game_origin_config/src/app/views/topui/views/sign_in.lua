slot0 = require("app.views.topui.config")
slot2 = class("TopuiSignInView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_sign_in.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.signIn
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

function slot2.onSignInClick(slot0)
	slot1, slot2 = gGameUI:getTopStackUI()

	if slot2 ~= "city.sign_in" then
		gGameUI:stackUI("city.sign_in", nil, )
	end
end

return slot2
