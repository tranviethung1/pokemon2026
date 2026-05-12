slot0 = class("ContractExchangeDetailView", Dialog)
slot1 = require("app.views.city.develop.contract.tools")
slot0.RESOURCE_FILENAME = "contract_exchange_detail.json"
slot0.RESOURCE_BINDING = {
	["leftPanel.tip"] = "tip",
	["rightPanel.getPanel.list"] = "getList",
	["leftPanel.attrPanel.item"] = "attrItem",
	["rightPanel.conditionPanel.list"] = "conditionList",
	["leftPanel.attrPanel.subList"] = "attrSubList",
	["leftPanel.name"] = "leftName",
	["rightPanel.times"] = "times",
	["leftPanel.linkPanel"] = "linkPanel",
	["leftPanel.fetterPanel"] = "fetterPanel",
	["leftPanel.list"] = "list",
	["leftPanel.attrPanel"] = "attrPanel",
	["rightPanel.getPanel"] = "getPanel",
	["leftPanel.iconPanel"] = "iconPanel",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["rightPanel.btnExchange"] = {
		varname = "btnExchange",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onExchangeClick")
			}
		}
	},
	["rightPanel.btnExchange.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)
	slot0.list:setScrollBarEnabled(false)

	slot0.exchangeId = slot1
	slot2 = csv.contract.activate_book[slot1]
	slot0.cfg = slot2
	slot0.id = slot2.contractCsvID

	slot0:updateLeftPanel()
	slot0:updateRightPanel()
end

function slot0.updateLeftPanel(slot0)
	bind.extend(slot0, slot0.iconPanel, {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot0.id
			},
			onNode = function (slot0)
				slot0:scale(0.9)
			end
		}
	})

	slot1 = dataEasy.getCfgByKey(slot0.id)

	slot0.leftName:text(slot1.name)
	slot0.tip:visible(not slot1.canExpend)

	slot2 = text.addEffect

	slot2(slot0.leftName, {
		color = ui.COLORS.QUALITY[slot1.quality]
	})

	uv2 = "bind"
	slot2 = slot2.getAttrData(slot0.id)

	slot0.attrPanel:hide()

	slot3 = slot0.attrPanel:clone():show()
	slot4 = slot3:get("list")

	bind.extend(slot0, slot4, {
		class = "tableview",
		props = {
			columnSize = 2,
			data = slot2,
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

	slot5 = slot3:get("subList"):height() * math.ceil(itertools.size(slot2) / 2)
	slot6 = slot5 - slot4:height()

	slot4:height(slot5):y(slot4:y() - slot6)
	slot4:setTouchEnabled(false)
	setContentSizeOfAnchor(slot3, cc.size(slot3:width(), slot3:height() + slot6))
	slot0.list:pushBackCustomItem(slot3)
	slot0.linkPanel:hide()

	slot7 = slot0.linkPanel:clone()
	slot8 = slot7
	slot7 = slot7.show(slot8)
	uv8 = "bind"

	if slot8.getLinkData(slot0.id) then
		uv9 = "bind"

		slot9.adaptPanel(slot7, slot8)
		slot0.list:pushBackCustomItem(slot7)
	end

	slot9 = slot0.fetterPanel
	slot9 = slot9.hide

	slot9(slot9)

	uv9 = "bind"
	slot9, slot10 = slot9.getFetterData(slot0.id, {
		isActive = true
	})

	if slot9 then
		slot11 = slot0.fetterPanel:clone()
		slot12 = slot11
		slot11 = slot11.show(slot12)
		uv12 = "bind"

		slot12.adaptPanel(slot11, slot9, slot10, slot0)
		slot0.list:pushBackCustomItem(slot11)
	end
end

function slot0.updateRightPanel(slot0)
	slot1 = {}
	slot0.conditionReach = true

	for slot5 = 1, math.huge do
		if slot0.cfg["targetType" .. slot5] and slot6 ~= 0 then
			slot7 = gGameModel.role:getContractTaskProgress(slot6, slot0.cfg["targetArg" .. slot5], slot0.cfg["targetParam" .. slot5])

			if slot7[1] < slot7[2] then
				slot0.conditionReach = false
			end

			table.insert(slot1, "#C0x5B545B#" .. slot0.cfg["targetDesc" .. slot5] .. gLanguageCsv.symbolBracketLeft .. string.format("%d/%d", slot7[1], slot7[2]) .. gLanguageCsv.symbolBracketRight .. (slot7[2] <= slot7[1] and "#C0x60C456#" or "#C0xF13B54#") .. string.format(gLanguageCsv.brackets, slot7[2] <= slot7[1] and gLanguageCsv.complete or gLanguageCsv.unFinish))
		else
			break
		end
	end

	beauty.textScroll({
		isRich = true,
		list = slot0.conditionList,
		strs = slot1
	})
	slot0.getPanel:get("text"):visible(slot0.cfg.onlyShow == 0)
	slot0.getList:visible(slot0.cfg.onlyShow == 0)
	slot0.times:visible(slot0.cfg.onlyShow == 0)

	slot2 = dataEasy.getItemData(slot0.cfg.costItems)

	for slot6, slot7 in csvMapPairs(slot0.cfg.costContractMap) do
		table.insert(slot2, {
			key = ui.CONTRACT_QUALITY_ITEM[slot6],
			num = slot7
		})
	end

	slot3 = slot0.getList:getContentSize()

	slot0.getList:setContentSize(cc.size(slot3.width + 100, slot3.height))
	slot0.getList:x(slot0.getList:x() - 100)
	uiEasy.createItemsToList(slot0, slot0.getList, slot2, {
		onAfterBuild = function ()
			uv0 = "getList"

			slot0.getList:setItemAlignCenter()
		end
	})

	slot0.exchangeTimes = gGameModel.role:getIdler("contract_books")

	idlereasy.when(slot0.exchangeTimes, function (slot0, slot1)
		uv3 = "math"
		uv4 = "math"
		slot3 = slot3.cfg.exchangeTimes - (slot1[slot4.exchangeId] or 0)
		slot2 = math.max(slot3, 0)
		uv3 = "math"
		slot3.leftTimes = slot2
		uv3 = "math"
		uv8 = "math"

		slot3.times:text(string.format(gLanguageCsv.contractExchangeTimes, slot2, slot8.cfg.exchangeTimes))

		slot3 = 1

		if slot2 > 0 then
			uv4 = "math"

			if slot4.conditionReach then
				slot3 = 1
			end
		else
			slot3 = 3
		end

		uv4 = "math"

		if slot4.cfg.onlyShow == 1 then
			slot3 = 2
		end

		uv5 = "math"
		uv6 = "math"

		uiEasy.setBtnShader(slot5.btnExchange, slot6.btnExchange:get("text"), slot3)
	end)
end

function slot0.onExchangeClick(slot0)
	if slot0.leftTimes <= 0 then
		gGameUI:showTip(gLanguageCsv.contractExchangeLimited)

		return
	end

	if not slot0.conditionReach then
		gGameUI:showTip(gLanguageCsv.contractExchangeConditionTip)

		return
	end

	gGameUI:stackUI("city.develop.contract.exchange_buy", nil, , slot0.exchangeId)
end

return slot0
