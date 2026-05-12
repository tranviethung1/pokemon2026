slot0 = class("StarSwapDetailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "star_swap_info.json"
slot0.RESOURCE_BINDING = {
	sevenPanel = "sevenPanel",
	["sevenPanel.bg"] = "bg"
}

function slot0.onCreate(slot0, slot1)
	slot0.bg:height(rich.createWithWidth(string.format(gLanguageCsv.starSwapNoUseTip, dataEasy.getCfgByKey(slot1).name, dataEasy.getNumByKey(slot1)), 34, nil, 430):anchorPoint(0.5, 0.5):addTo(slot0.sevenPanel):xy(260, 100):height() + 50)
end

return slot0
