slot1 = class("ContractInfoView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.develop.contract.tools")
slot1.RESOURCE_FILENAME = "contract_detail.json"
slot1.RESOURCE_BINDING = {
	["panel.list"] = "list",
	["panel.attrPanel"] = "attrPanel",
	["panel.itemNode"] = "itemNode",
	["panel.name"] = "contractName",
	["panel.level"] = "level",
	panel = "panel",
	["panel.attrPanel.subList"] = "attrSubList",
	["panel.gainExpText"] = "gainExpText",
	["panel.attrPanel.item"] = "attrItem",
	["panel.tip"] = "tip",
	["panel.fetterPanel"] = "fetterPanel",
	["panel.txtLevel"] = "txtLevel",
	["panel.linkPanel"] = "linkPanel",
	["panel.bg"] = "bg",
	["panel.gainExp"] = "gainExp",
	["panel.btnLock"] = {
		varname = "btnLock",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onLockClick")
			}
		}
	},
	["panel.btnChange.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["panel.btnChange"] = {
		varname = "btnChange",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
			}
		}
	},
	["panel.btnStrength.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["panel.btnStrength"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStrengthClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.list:setScrollBarEnabled(false)

	slot0.params = slot1
	slot0.cb = slot1.cb
	slot4 = true

	idlereasy.any(gGameModel.contracts:find(slot1.dbid):multigetIdler("locked", "sum_exp", "level", "advance"), function ()
		uv0 = "updateData"
		slot0 = slot0.updateData

		slot0(slot0)

		uv0 = "dataRefresh"

		if not slot0 then
			uv0 = "updateData"

			if slot0.dataRefresh then
				uv0 = "updateData"

				slot0.dataRefresh()
			end
		end
	end)

	slot4 = false

	slot0.gainExpText:hide()
	slot0.gainExp:hide()

	if slot1.showExp then
		slot0.gainExpText:show()
		slot0.gainExp:show()
		slot0.gainExp:text(slot1.showExp)
		adapt.oneLinePos(slot0.gainExpText, slot0.gainExp)
		slot0.txtLevel:y((slot0.contractName:y() + slot0.gainExpText:y()) / 2)
		slot0.level:y(slot0.txtLevel:y())
	end

	if not slot1.selectCardDBID then
		slot0.panel:get("btnChange"):hide()
		slot0.panel:get("btnStrength"):hide()

		slot5 = -130

		setContentSizeOfAnchor(slot0.panel, cc.size(slot0.panel:width(), slot0.panel:height() + slot5))
		slot0.panel:y(slot0.panel:y() + slot5 / 2)
		slot0.bg:height(slot0.bg:height() + slot5)
	end

	if slot1.pos then
		slot5 = slot1.pos.x

		slot0.panel:x(slot1.align == "right" and slot5 + slot0.panel:width() / 2 or slot5 - slot0.panel:width() / 2)
	end

	slot0.tip:visible(not dataEasy.getCfgByKey(slot2:read("contract_id")).canExpend)
end

function slot1.updateData(slot0)
	slot0.list:removeAllChildren()

	slot2 = gGameModel.contracts:find(slot0.params.dbid)
	slot3 = slot2:read("contract_id")

	bind.extend(slot0, slot0.itemNode, {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot3
			}
		}
	})
	uiEasy.setIconName(slot3, nil, {
		node = slot0.panel:get("name"),
		advance = slot2:read("advance")
	})
	slot0.panel:get("level"):text(slot2:read("level"))
	adapt.oneLinePos(slot0.panel:get("txtLevel"), slot0.panel:get("level"), cc.p(5, 0))

	slot7 = slot0.btnLock:get("img")
	slot7 = slot7.texture

	slot7(slot7, slot2:read("locked") and "city/card/chip/btn_lock.png" or "city/card/chip/btn_unlock.png")

	uv7 = "params"
	slot7 = slot7.getAttrData(slot3, {
		level = slot4,
		advance = slot5
	})

	slot0.attrPanel:hide()

	slot8 = slot0.attrPanel:clone():show()
	slot9 = slot8:get("list")

	bind.extend(slot0, slot9, {
		class = "tableview",
		props = {
			columnSize = 2,
			data = slot7,
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

	slot10 = slot8:get("subList"):height() * math.ceil(itertools.size(slot7) / 2)
	slot11 = slot10 - slot9:height()

	slot9:height(slot10):y(slot9:y() - slot11)
	slot9:setTouchEnabled(false)
	setContentSizeOfAnchor(slot8, cc.size(slot8:width(), slot8:height() + slot11))
	slot0.list:pushBackCustomItem(slot8)
	slot0.linkPanel:hide()

	slot12 = slot0.linkPanel:clone()
	slot13 = slot12
	slot12 = slot12.show(slot13)
	uv13 = "params"

	if slot13.getLinkData(slot3, {
		advance = slot5
	}) then
		uv14 = "params"

		slot14.adaptPanel(slot12, slot13)
		slot0.list:pushBackCustomItem(slot12)
	end

	slot14 = slot0.fetterPanel
	slot14 = slot14.hide

	slot14(slot14)

	uv14 = "params"
	slot14, slot15 = slot14.getFetterData(slot3, {
		dbid = slot1
	})

	if slot14 then
		slot16 = slot0.fetterPanel:clone()
		slot17 = slot16
		slot16 = slot16.show(slot17)
		uv17 = "params"

		slot17.adaptPanel(slot16, slot14, slot15, slot0)
		slot0.list:pushBackCustomItem(slot16)
	end
end

function slot1.onLockClick(slot0)
	gGameApp:requestServer("/game/contract/locked", function ()
		uv2 = "gGameModel"

		if gGameModel.contracts:find(slot2.params.dbid):read("locked") then
			gGameUI:showTip(gLanguageCsv.contractLocked)
		end
	end, slot0.params.dbid)
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

function slot1.onChangeClick(slot0)
	slot1 = slot0.params

	slot0:addCallbackOnExit(function ()
		uv5 = "gGameUI"

		gGameUI:stackUI("city.develop.contract.change", nil, , slot5)
	end)
	slot0:onClose()
end

function slot1.onStrengthClick(slot0)
	slot1 = slot0.params

	slot0:addCallbackOnExit(function ()
		uv5 = "gGameUI"

		gGameUI:stackUI("city.develop.contract.strength", nil, , slot5, 2)
	end)
	slot0:onClose()
end

return slot1
