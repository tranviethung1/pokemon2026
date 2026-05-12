slot0 = require("app.views.topui.config")
slot2 = class("TopuiTownExplorationView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_town_exploration.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.exploration
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

function slot2.onExplorationClick(slot0)
	if not (gGameModel.town:read("buildings")[game.TOWN_CARD_STATE.PRODUCTION_FOUR] or {}).level then
		gGameUI:showTip(gLanguageCsv.townTopuiClickLockTip)

		return
	end

	slot3, slot4 = gGameUI:getTopStackUI()

	if slot4 ~= "city.town.normal_factory" then
		gGameUI:stackUI("city.town.normal_factory", nil, {
			full = true
		}, game.TOWN_CARD_STATE.PRODUCTION_FOUR, 1)
	end
end

return slot2
