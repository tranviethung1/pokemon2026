slot0 = cc.load("mvc").ViewBase
slot1 = class("ContractCommonSuccessView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.develop.contract.tools")
slot3 = 0.08
slot1.RESOURCE_FILENAME = "contract_common_success.json"
slot1.RESOURCE_BINDING = {
	centerPos = "centerPos",
	titlePos = "titlePos",
	centerPanel = "centerPanel",
	["centerPanel.list"] = "list",
	bg = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	["centerPanel.advanceTipPanel.advanceTip"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(255, 127, 0, 255)
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot2 = slot1 or {}
	slot0.dbid = slot2.dbid
	slot0.cb = slot2.cb

	slot0:setCenterPanel()
	uiEasy.setTitleEffect(slot0.centerPos, "xjiesuan_tupozi")
end

function slot1.setCenterPanel(slot0)
	slot1 = gGameModel.contracts:find(slot0.dbid):read("advance", "contract_id", "level")
	slot3 = slot1.contract_id
	slot2 = csv.contract.contract[slot3]
	uv3 = "gGameModel"
	uv4 = "gGameModel"
	slot4 = slot1.contract_id.getAttrData(slot1.contract_id, {
		level = slot1.level,
		advance = slot1.advance
	})
	slot5 = {}
	slot6 = false

	for slot10, slot11 in ipairs(slot3.getAttrData(slot4, {
		level = slot1.level,
		advance = slot1.advance - 1
	})) do
		if slot11.num < slot4[slot10].num then
			slot6 = true
			slot11.addNum = slot4[slot10].num - slot11.num
		end

		table.insert(slot5, slot11)
	end

	slot7 = slot0.centerPanel:multiget("title", "item1", "item2", "name1", "name2", "advance1", "advance2", "imgArrow", "attrList", "attrSubList", "attrItem", "advanceTipPanel")

	itertools.invoke({
		slot7.attrList,
		slot7.advanceTipPanel
	}, "visible", slot6)
	itertools.invoke({
		slot7.title,
		slot0.list
	}, "visible", not slot6)

	if slot6 then
		bind.extend(slot0, slot7.attrList, {
			class = "tableview",
			props = {
				columnSize = 2,
				data = slot5,
				item = slot7.attrSubList,
				cell = slot7.attrItem,
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:multiget("imgIcon", "txtName", "txtNum", "txtAdd", "imgTo").imgIcon:visible(slot3.sortKey ~= nil)
					slot4.txtName:text(getLanguageAttr(slot3.attr))
					slot4.txtNum:text(" " .. dataEasy.getAttrValueString(slot3.attr, slot3.num))

					if slot3.sortKey ~= nil then
						slot4.imgIcon:texture(ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot3.attr]])
					else
						slot4.txtName:x(slot4.imgIcon:box().x)
					end

					itertools.invoke({
						slot4.txtAdd,
						slot4.imgTo
					}, "visible", slot3.addNum ~= nil)

					if slot3.addNum then
						slot4.txtAdd:text(dataEasy.getAttrValueString(slot3.attr, slot3.addNum + slot3.num))
					end

					adapt.oneLinePos(slot4.txtName, {
						slot4.txtNum,
						slot4.imgTo,
						slot4.txtAdd
					}, {
						cc.p(10, 0),
						cc.p(10, 0),
						cc.p(10, 0)
					})
				end
			}
		})
	else
		uv8 = "gGameModel"

		slot7.title:visible(slot8.getLinkData(slot1.contract_id, {
			advance = slot1.advance
		}) ~= nil)

		if slot8 then
			beauty.textScroll({
				isRich = true,
				list = slot0.list,
				strs = slot8
			})
		end
	end

	slot7.name1:text(slot2.name)
	slot7.name2:text(slot2.name)
	slot7.advance1:text("+" .. slot1.advance - 1)
	slot7.advance2:text("+" .. slot1.advance)
	slot7.advance1:visible(slot1.advance - 1 > 0)
	text.addEffect(slot7.name1, {
		color = ui.COLORS.QUALITY[slot2.quality]
	})
	text.addEffect(slot7.name2, {
		color = ui.COLORS.QUALITY[slot2.quality]
	})
	text.addEffect(slot7.advance1, {
		color = ui.COLORS.QUALITY[slot2.quality]
	})
	text.addEffect(slot7.advance2, {
		color = ui.COLORS.QUALITY[slot2.quality]
	})

	for slot11 = 1, 2 do
		bind.extend(slot0, slot7["item" .. slot11], {
			class = "icon_key",
			props = {
				data = {
					key = slot1.contract_id
				},
				specialKey = {
					lv = slot1.level
				},
				onNode = function (slot0)
					slot0:setTouchEnabled(false)
				end
			}
		})

		uv13 = "contracts"

		uiEasy.setExecuteSequence(slot12, {
			delayTime = slot13 * (slot11 == 1 and 0.1 or 2)
		})
		adapt.oneLinePos(slot7["name" .. slot11], slot7["advance" .. slot11], cc.p(30, 0))

		if slot11 == 2 then
			uv19 = "contracts"

			uiEasy.setExecuteSequence({
				slot7.imgArrow
			}, {
				delayTime = slot19
			})
		end
	end
end

function slot1.onClose(slot0)
	if slot0.cb then
		slot0:addCallbackOnExit(slot0.cb)
	end

	uv1 = "cb"

	slot1.onClose(slot0)
end

return slot1
