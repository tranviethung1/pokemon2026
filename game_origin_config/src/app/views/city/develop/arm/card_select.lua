slot0 = class("ArmCardSelectView", Dialog)
slot1 = require("app.views.city.develop.arm.tools")
slot0.RESOURCE_FILENAME = "arm_card_select.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	["down.textNote"] = "textNote",
	innerList = "innerList",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				asyncPreload = 12,
				data = bindHelper.self("cardDatas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:get("head"), {
						class = "card_icon",
						props = {
							unitId = slot3.unitID,
							advance = slot3.advance,
							dbid = slot3.dbid,
							star = slot3.star,
							rarity = slot3.rarity,
							levelProps = {
								data = slot3.level
							}
						}
					})
					slot1:get("textName"):text(csv.cards[slot3.cardID].name)
					slot1:get("textFightPoint"):text(slot3.fightPoint)
					slot1:get("imgTick"):visible(slot3.isSel)
					slot1:get("imgMask"):visible(slot3.isSel)
					slot1:get("panelUsing"):hide()

					if slot3.usingArmID then
						slot1:get("panelUsing"):show()
						slot1:get("panelUsing.icon"):texture(ui.ATTR_ICON[slot3.usingArmID])
						slot1:get("textNote"):y(slot1:get("textFightPoint"):y() + 20)
						slot1:get("textFightPoint"):y(slot1:get("textFightPoint"):y() + 20)
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onCellClick")
			}
		}
	},
	down = {
		varname = "down",
		binds = {
			event = "visible",
			idler = bindHelper.self("isShowDown")
		}
	},
	["down.btnOk"] = {
		varname = "btnOk",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSure")
			}
		}
	},
	tipPanel = {
		binds = {
			event = "visible",
			idler = bindHelper.self("showEmpty")
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.armID = slot1
	slot0.showEmpty = idler.new(false)
	slot0.cardDatas = idlers.newWithMap({})
	slot0.isShowDown = idler.new(false)
	slot0.stage = gGameModel.role:getIdler("arms_stage"):read()[slot1] or 0
	uv2 = "armID"

	for slot6, slot7 in pairs(slot2.getArmAllCards(slot1)) do
		uv8 = "armID"
		slot7.isSel = slot8.getSpriteArm(slot7.markID) == slot0.armID

		if slot8 and slot8 ~= slot0.armID then
			slot7.usingArmID = slot8
		end
	end

	slot0.cardDatas:update(slot2)
	slot0.list:size(1665, 850)
	slot0.list:y(slot0.list:y() + 100)
	idlereasy.when(slot0.cardDatas, function ()
		uv0 = "updateDownPanel"

		slot0:updateDownPanel()
	end)
	Dialog.onCreate(slot0)
end

function slot0.onCellClick(slot0, slot1, slot2, slot3)
	for slot8, slot9 in slot0.cardDatas:pairs() do
		if slot9:read().isSel then
			slot4 = 0 + 1
		end
	end

	uv5 = "cardDatas"
	slot5 = slot5.getArmMaxCardNum(slot0.armID)

	if not slot3.isSel and slot5 <= slot4 then
		gGameUI:showTip(string.format(gLanguageCsv.selectedmax, slot5))

		return
	end

	if slot3.usingArmID and not slot3.isSel then
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			clearFast = true,
			cb = function ()
				uv0 = "cardDatas"
				slot0 = slot0.cardDatas
				slot1 = slot0
				uv2 = "atproxy"
				uv1 = "k"
				slot0.atproxy(slot1, slot2.k).isSel = not slot1.isSel
			end,
			title = gLanguageCsv.spaceTips,
			content = string.format(gLanguageCsv.armUsingTip, gLanguageCsv[game.NATURE_TABLE[slot3.usingArmID]], gLanguageCsv[game.NATURE_TABLE[slot3.usingArmID]]),
			dialogParams = {
				clickClose = false
			}
		})
	else
		slot6()
	end
end

function slot0.updateDownPanel(slot0)
	slot0.showEmpty:set(slot0.cardDatas:size() == 0)

	slot3 = slot0.cardDatas:size() ~= 0

	slot0.isShowDown:set(slot3)

	uv3 = "showEmpty"

	slot0.textNote:text(string.format(gLanguageCsv.armUnlockStageTip, math.min(slot0.stage + 1, slot3.getArmMaxStage(slot0.armID)))):show()

	uv2 = "showEmpty"
	slot3 = {}

	for slot7 = 1, #slot2.getNextStageUnlockData(slot0.armID) do
		for slot12, slot13 in slot0.cardDatas:pairs() do
			if slot13:read().isSel and slot2[slot7].needStar <= slot13.star and slot13.rarity == slot2[slot7].needRarity then
				slot8 = 0 + 1
			end
		end

		table.insert(slot3, {
			str = string.format(gLanguageCsv.armStageUnlockDescRich, gLanguageCsv[game.NATURE_TABLE[slot0.armID]], slot2[slot7].needStar, gLanguageTxtRarity[slot2[slot7].needRarity]) .. (gLanguageCsv.symbolBracketLeft .. (slot8 < slot2[slot7].needNum and "#C0xF13B54#" or "#C0x00C220#") .. string.format("%s/%s", slot8, slot2[slot7].needNum) .. "#C0x5b545b#" .. gLanguageCsv.symbolBracketRight) .. "  "
		})
	end

	if not itertools.isempty(slot3) then
		beauty.textScroll({
			fontSize = 40,
			margin = 5,
			isRich = true,
			list = slot0.down:get("list"),
			strs = slot3
		})
	else
		slot0.textNote:hide()
	end
end

function slot0.onSure(slot0)
	slot1 = {}

	for slot5, slot6 in slot0.cardDatas:pairs() do
		if slot6:read().isSel then
			table.insert(slot1, slot6.markID)
		end
	end

	gGameApp:requestServer("/game/role/arms/cards/place", function (slot0)
		uv1 = "onClose"

		slot1:onClose()
	end, slot0.armID, slot1)
end

function slot0.onClose(slot0)
	Dialog.onClose(slot0)
end

return slot0
