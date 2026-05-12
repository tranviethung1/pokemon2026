slot0 = require("app.views.topui.config")
slot2 = class("TopuiTownView", require("app.views.topui.base"))
slot3 = {
	normalFactory1 = 5,
	normalFactory2 = 3,
	orderFactory1 = 6,
	exploration1 = 7,
	normalFactory3 = 4
}
slot2.RESOURCE_FILENAME = "topui_town.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.town
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
end

function slot2.onTdPanelClick(slot0)
	uv3 = "checkBuildingLock"

	if not slot0:checkBuildingLock(slot3.normalFactory1) then
		return
	end

	slot1, slot2 = gGameUI:getTopStackUI()

	if slot2 ~= "city.town.normal_factory" then
		uv8 = "checkBuildingLock"

		gGameUI:stackUI("city.town.normal_factory", nil, {
			full = true
		}, slot8.normalFactory1, 1)
	end
end

function slot2.onMcPanelClick(slot0)
	uv3 = "checkBuildingLock"

	if not slot0:checkBuildingLock(slot3.normalFactory3) then
		return
	end

	slot1, slot2 = gGameUI:getTopStackUI()

	if slot2 ~= "city.town.normal_factory" then
		uv8 = "checkBuildingLock"

		gGameUI:stackUI("city.town.normal_factory", nil, {
			full = true
		}, slot8.normalFactory3, 1)
	end
end

function slot2.onGjgPanelClick(slot0)
	uv3 = "checkBuildingLock"

	if not slot0:checkBuildingLock(slot3.normalFactory2) then
		return
	end

	slot1, slot2 = gGameUI:getTopStackUI()

	if slot2 ~= "city.town.normal_factory" then
		uv8 = "checkBuildingLock"

		gGameUI:stackUI("city.town.normal_factory", nil, {
			full = true
		}, slot8.normalFactory2, 1)
	end
end

function slot2.checkBuildingLock(slot0, slot1)
	if not (gGameModel.town:read("buildings")[slot1] or {}).level then
		gGameUI:showTip(gLanguageCsv.townTopuiClickLockTip)

		return false
	end

	return true
end

return slot2
