slot0 = require("app.views.city.develop.contract.tools")
slot1 = class("ContractGridUnlockView", Dialog)
slot1.RESOURCE_FILENAME = "contract_grid_unlock.json"
slot1.RESOURCE_BINDING = {
	["baseNode.bg"] = "bg",
	["baseNode.title1"] = "title1",
	baseNode = "baseNode",
	["baseNode.title"] = "title",
	["baseNode.list"] = "list",
	["baseNode.xingxing1"] = "xingxing1",
	["baseNode.txtInfo"] = "txtInfo",
	["baseNode.listCondition"] = "listCondition",
	["baseNode.xingxing2"] = "xingxing2",
	["baseNode.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["baseNode.btnOk"] = {
		varname = "btnOk",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOk")
			}
		}
	},
	["baseNode.btnOk.title"] = {
		varname = "btnTitle",
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

function slot1.onCreate(slot0, slot1, slot2)
	slot0.unlockCb = slot2
	slot0.idx = slot1.idx
	slot0.selectCardDBID = slot1.selectCardDBID

	adapt.oneLinePos(slot0.title, slot0.title1, cc.p(5, 0), "left")

	slot3 = true
	slot0.canUnlock = slot3
	uv3 = "unlockCb"

	slot0.listCondition:hide()

	if slot0:getConditionStr(slot3.getCardPlan(slot0.selectCardDBID, slot0.idx)) then
		slot0.listCondition:show()
		beauty.textScroll({
			fontSize = 40,
			isRich = true,
			list = slot0.listCondition,
			strs = "#C0x5B545B#" .. slot4
		})
	end

	slot0.list:visible(csvSize(slot3.cfg.cost) > 0)

	slot6 = gLanguageCsv.contractUnlockTip2

	if (gGameModel.cards:find(slot0.selectCardDBID):read("contracts") or {})[slot0.idx] and slot8[slot0.idx].unlock ~= nil then
		slot0.btnTitle:text(gLanguageCsv.contractUnlockTip3)
		slot0.list:visible(false)
	end

	if slot3.hasCost and csvSize(slot5) > 0 then
		slot9 = {}

		for slot13, slot14 in csvMapPairs(slot5) do
			if dataEasy.getNumByKey(slot13) < slot14 then
				slot0.canUnlock = false
			end

			table.insert(slot9, {
				key = slot13,
				num = slot15,
				targetNum = slot14
			})
		end

		uiEasy.createItemsToList(slot0, slot0.list, slot9, {
			onAfterBuild = function (slot0)
				slot0:adaptTouchEnabled():setItemAlignCenter()
			end
		})
	end

	slot0.txtInfo:text(gLanguageCsv.contractUnlockTip1)
	Dialog.onCreate(slot0)
end

function slot1.getConditionStr(slot0, slot1)
	slot4 = nil

	if slot1.cfg.unlockType ~= 0 then
		slot5 = slot1.cfg.conditionArg

		if slot3 == 1 then
			slot0.canUnlock = slot5 <= gGameModel.cards:find(slot0.selectCardDBID):read("level")
			slot4 = string.format(gLanguageCsv.contractGridUnlockTip, gLanguageCsv.level) .. (slot0.canUnlock and "#C0x60C456#" or "#C0xF76B45#") .. string.format(" %s/%s", slot6, slot5) .. string.format(gLanguageCsv.brackets, slot0.canUnlock and gLanguageCsv.complete or gLanguageCsv.unFinish)
		elseif slot3 == 2 then
			slot0.canUnlock = slot5 <= slot2:read("star")
			slot4 = string.format(gLanguageCsv.contractGridUnlockTip, gLanguageCsv.star) .. (slot0.canUnlock and "#C0x60C456#" or "#C0xF76B45#") .. string.format(" %s/%s", slot6, slot5) .. string.format(gLanguageCsv.brackets, slot0.canUnlock and gLanguageCsv.complete or gLanguageCsv.unFinish)
		elseif slot3 == 3 then
			slot0.canUnlock = slot5 <= slot2:read("advance")
			slot7, slot8 = dataEasy.getQuality(slot5)
			slot4 = string.format(gLanguageCsv.contractGridUnlockTip, gLanguageCsv.advance) .. slot9 .. " " .. string.format("%s%s%s", ui.QUALITY_OUTLINE_COLOR[slot7], gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot7]], slot8) .. (slot0.canUnlock and "#C0x60C456#" or "#C0xF76B45#") .. string.format(gLanguageCsv.brackets, slot0.canUnlock and gLanguageCsv.complete or gLanguageCsv.unFinish)
		elseif slot3 == 4 then
			slot7, slot8 = dataEasy.getCurMaxStage(slot0.selectCardDBID)
			slot0.canUnlock = slot5 <= slot7 * 100 + slot8
			slot4 = string.format(gLanguageCsv.contractGridUnlockTip, gLanguageCsv.zawake) .. (slot0.canUnlock and "#C0x60C456#" or "#C0xF76B45#") .. " " .. (gLanguageCsv.effortAdvance .. gLanguageCsv["symbolRome" .. math.floor(slot5 / 100)]) .. string.format(gLanguageCsv.brackets, slot0.canUnlock and gLanguageCsv.complete or gLanguageCsv.unFinish)
		end
	end

	return slot4
end

function slot1.onClickOk(slot0)
	if slot0.canUnlock then
		gGameApp:requestServer("/game/contract/pos/unlock", function (slot0)
			uv1 = "unlockCb"

			if slot1.unlockCb then
				uv1 = "unlockCb"
				uv4 = "unlockCb"
				uv5 = "unlockCb"

				slot1:addCallbackOnExit(functools.partial(slot4.unlockCb, slot5.idx))
			end

			uv1 = "unlockCb"

			slot1:onCloseFast()
		end, slot0.selectCardDBID, slot0.idx)
	else
		gGameUI:showTip(gLanguageCsv.contractGridUnlockNoCondition)
	end
end

return slot1
