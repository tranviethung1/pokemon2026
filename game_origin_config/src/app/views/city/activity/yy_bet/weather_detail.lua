slot0 = class("WeatherDetailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "yybet_weather_detail.json"
slot0.RESOURCE_BINDING = {
	["node.imgBg"] = "imgBg",
	node = "panel",
	["node.textName"] = "textName",
	["node.list"] = "list"
}

function slot0.initTools(slot0)
	slot0.tools = require("app.views.city.activity.yy_bet.tools")
end

function slot0.onCreate(slot0, slot1, slot2)
	slot0:initTools()

	slot3 = slot0.tools.getCsv("contest")[slot1]
	slot4 = slot3.weatherDesc
	slot5 = slot3.weatherDetail
	slot7, slot8 = beauty.textScroll({
		fontSize = 40,
		isRich = true,
		list = slot0.list,
		strs = "#C0x5B545B#" .. slot3.weatherDetail
	})
	slot9 = cc.clampf(slot8, 250, 750) - 250

	slot0.imgBg:size(slot0.imgBg:size().width, slot0.imgBg:size().height + slot9)
	slot7:size(slot7:size().width, 250 + slot9)
	slot7:y(slot7:y() - slot9)
end

return slot0
