slot0 = class("ItemDetailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "common_item_detail.json"
slot0.RESOURCE_BINDING = {
	["baseNode.textNum"] = "textNum",
	["baseNode.content"] = "contentLabel",
	baseNode = "baseNode",
	["baseNode.name"] = "nodeName",
	["baseNode.list"] = "list",
	["baseNode.icon"] = {
		varname = "icon",
		binds = {
			event = "extend",
			class = "icon_key",
			props = {
				noListener = true,
				data = bindHelper.self("data"),
				onNode = function (slot0)
					slot0:alignCenter(slot0:size())
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:getResourceNode():setTouchEnabled(false)

	slot2 = slot1.key
	slot0.data = {
		key = slot2,
		num = slot1.num
	}
	slot4 = true

	if game.ITEM_EXP_HASH[slot2] then
		slot4 = false
	elseif csv.items[slot2] and game.ITEM_NUM_HIDE_TYPE_HASH[csv.items[slot2].type] then
		slot4 = false
	elseif csv.items[slot2] and csv.items[slot2].showNum == false then
		slot4 = false
	end

	slot5, slot6 = uiEasy.setIconName(slot2, slot3, {
		node = slot0.nodeName
	})

	slot0.nodeName:setFontName(ui.FONT_PATH)
	slot0.nodeName:setTextColor(slot6.color)

	if matchLanguage({
		"en"
	}) then
		adapt.setTextAdaptWithSize(slot0.nodeName, {
			vertical = "center",
			size = cc.size(425, 144)
		})
	else
		adapt.setTextScaleWithWidth(slot0.nodeName, nil, 410)
	end

	slot0.textNum:visible(slot4)

	if not slot4 then
		slot0.nodeName:y(slot0.nodeName:y() - 50)
	else
		slot0.textNum:text(gLanguageCsv.have .. ": " .. mathEasy.getShortNumber(dataEasy.getNumByKey(slot2), 2))
	end

	if dataEasy.isFurnitureItem(slot2) and dataEasy.isTownVisitUnlock() then
		slot0.icon:scale(0.8)
		slot0.textNum:y(slot0.textNum:y() + 30)
		slot0.textNum:clone():show():addTo(slot0.textNum:parent(), slot0.textNum:z()):xy(slot0.textNum:x(), slot0.textNum:y() - 60):text(gLanguageCsv.townHomeDecorate .. dataEasy.getCfgByKey(slot2).decorativeness)
	end

	slot0:initText()
end

function slot0.initText(slot0)
	beauty.textScroll({
		isRich = true,
		list = slot0.list,
		strs = "#C0x5B545B#" .. uiEasy.getIconDesc(slot0.data.key, slot0.data.num)
	})
end

function slot0.hitTestPanel(slot0, slot1)
	if slot0.list:isTouchEnabled() then
		slot2 = slot0.baseNode
		slot3 = slot2:box()
		slot4 = slot2:parent():convertToWorldSpace(cc.p(slot3.x, slot3.y))
		slot3.x = slot4.x
		slot3.y = slot4.y

		return cc.rectContainsPoint(slot3, slot1)
	end

	return false
end

return slot0
