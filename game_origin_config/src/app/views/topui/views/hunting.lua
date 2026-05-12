slot0 = require("app.views.topui.config")
slot2 = class("TopuiHuntingAreaView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_hunting_area.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.huntingArea
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

function slot2.onHuntingAreaClick(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.hunting) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.hunting))

		return
	end

	slot2, slot3 = gGameUI:getTopStackUI()

	if slot3 ~= "city.adventure.hunting.view" and slot3 ~= "city.adventure.hunting.route" and not gGameUI:goBackInStackUI("city.adventure.hunting.view") then
		gGameApp:requestServer("/game/hunting/main", function (slot0)
			gGameUI:stackUI("city.adventure.hunting.view", nil, {
				full = true
			})
		end)
	end
end

return slot2
