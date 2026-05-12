slot0 = class("ContractDetailsView", cc.load("mvc").ViewBase)
slot1 = require("app.views.city.develop.contract.tools")
slot0.RESOURCE_FILENAME = "common_contract_details.json"
slot0.RESOURCE_BINDING = {
	["baseNode.attrPanel"] = "attrPanel",
	["baseNode.txtLevel"] = "txtLevel",
	["baseNode.bg"] = "bg",
	["baseNode.linkPanel"] = "linkPanel",
	["baseNode.attrPanel.subList"] = "attrSubList",
	baseNode = "baseNode",
	["baseNode.bg1"] = "bg1",
	["baseNode.list"] = "list",
	["baseNode.name"] = "contractName",
	["baseNode.fetterPanel"] = "fetterPanel",
	["baseNode.itemNode"] = "itemNode",
	["baseNode.attrPanel.item"] = "attrItem",
	["baseNode.level"] = "level"
}

function slot0.onCreate(slot0, slot1)
	slot0.params = slot1

	slot0.list:setScrollBarEnabled(false)
	slot0.list:removeAllChildren()

	slot2 = nil
	slot2 = (not slot1.dbId or gGameModel.contracts:find(dbid):read("contract_id")) and slot1.key

	bind.extend(slot0, slot0.itemNode, {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot2
			}
		}
	})
	uiEasy.setIconName(slot2, nil, {
		node = slot0.baseNode:get("name")
	})
	slot0.baseNode:get("level"):text(1)

	slot4 = adapt.oneLinePos

	slot4(slot0.baseNode:get("txtLevel"), slot0.baseNode:get("level"), cc.p(5, 0))

	uv4 = "params"
	slot4 = slot4.getAttrData(slot2)

	slot0.attrPanel:hide()

	slot5 = slot0.attrPanel:clone():show()
	slot6 = slot5:get("list")

	bind.extend(slot0, slot6, {
		class = "tableview",
		props = {
			columnSize = 2,
			data = slot4,
			item = slot0.attrSubList,
			cell = slot0.attrItem,
			onCell = function (slot0, slot1, slot2, slot3)
				slot1:multiget("icon", "text").icon:visible(slot3.sortKey ~= nil)
				slot4.text:text(getLanguageAttr(slot3.attr) .. " +" .. dataEasy.getAttrValueString(slot3.attr, slot3.num))

				if slot3.sortKey ~= nil then
					slot4.icon:texture(ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot3.attr]])
				else
					slot4.text:x(slot4.icon:box().x)
				end
			end
		}
	})

	slot7 = slot5:get("subList"):height() * math.ceil(itertools.size(slot4) / 2)
	slot8 = slot7 - slot6:height()

	slot6:height(slot7):y(slot6:y() - slot8)
	slot6:setTouchEnabled(false)
	setContentSizeOfAnchor(slot5, cc.size(slot5:width(), slot5:height() + slot8))
	slot0.list:pushBackCustomItem(slot5)
	slot0.linkPanel:hide()

	slot9 = slot0.linkPanel:clone()
	slot10 = slot9
	slot9 = slot9.show(slot10)
	uv10 = "params"

	if slot10.getLinkData(slot2) then
		uv11 = "params"

		slot11.adaptPanel(slot9, slot10)
		slot0.list:pushBackCustomItem(slot9)
	end

	slot11 = slot0.fetterPanel
	slot11 = slot11.hide

	slot11(slot11)

	uv11 = "params"

	if slot11.getFetterData(slot2, {
		isActive = true
	}) then
		slot12 = slot0.fetterPanel:clone()
		slot13 = slot12
		slot12 = slot12.show(slot13)
		uv13 = "params"

		slot13.adaptPanel(slot12, slot11)
		slot0.list:pushBackCustomItem(slot12)
	end

	slot13 = cc.clampf(slot0.list:getInnerItemSize().height, 200, 1000) - slot0.list:height()

	slot0.list:height(slot0.list:height() + slot13)
	slot0.list:y(slot0.list:y() - slot13)
	slot0.bg1:height(slot0.bg1:height() + slot13)
	slot0.bg:height(slot0.bg:height() + slot13)
	setContentSizeOfAnchor(slot0.baseNode, cc.size(slot0.baseNode:width(), slot0.baseNode:height() + slot13))
	slot0.baseNode:y(720 + slot0.baseNode:height() / 2)
	slot0.list:adaptTouchEnabled()
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
