slot0 = {
	up = 1,
	down = 2,
	change = 3
}
slot1 = {
	gLanguageCsv.spaceInlay,
	gLanguageCsv.spaceDischarge,
	gLanguageCsv.spaceReplace
}
slot3 = class("ChipDetailsView", cc.load("mvc").ViewBase)
slot4 = require("app.views.city.card.chip.tools")
slot3.RESOURCE_FILENAME = "chip_details.json"
slot3.RESOURCE_BINDING = {
	panel = "panel",
	["panel.btnChange"] = {
		varname = "btnChange",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
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
	},
	["panel.btnStrength.txt"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.cb = slot1.cb
	slot0.chipDBID = slot1.dbId
	slot0.cardDBID = slot1.cardDBID
	slot0.plan = slot1.plan
	slot0.subDBID = slot1.subDBID
	slot0.showExp = slot1.showExp
	slot0.dataRefresh = slot1.dataRefresh
	slot0.chipIdx = csv.chip.chips[gGameModel.chips:find(slot0.chipDBID):read("chip_id", "card_db_id", "level").chip_id].pos

	slot0.panel:get("btnChange"):hide()
	slot0.panel:get("btnStrength"):hide()

	if slot0.cardDBID then
		if slot0.cardDBID == slot3.card_db_id then
			uv5 = "cb"
			slot0.changeType = slot5.down
		else
			if not slot0.subDBID then
				slot0.subDBID = gGameModel.cards:find(slot0.cardDBID):read("chip")[slot0.chipIdx]
			end

			if slot0.subDBID then
				uv5 = "cb"
				slot0.changeType = slot5.change
			else
				uv5 = "cb"
				slot0.changeType = slot5.up
			end
		end
	elseif slot0.plan then
		if slot0.chipDBID == slot0.plan:read()[slot0.chipIdx] then
			uv6 = "cb"
			slot0.changeType = slot6.down
		else
			slot0.subDBID = slot5[slot0.chipIdx]

			if slot0.subDBID then
				uv6 = "cb"
				slot0.changeType = slot6.change
			else
				uv6 = "cb"
				slot0.changeType = slot6.up
			end
		end
	end

	if slot1.justShow then
		slot0.changeType = nil
	end

	if slot0.changeType then
		slot0.panel:get("btnChange"):show()
		slot0.panel:get("btnStrength"):show()

		slot7 = "txt"
		uv7 = "chipDBID"

		slot0.btnChange:get(slot7):text(slot7[slot0.changeType])
	end

	if slot1.pos then
		slot5 = slot1.pos.x

		slot0.panel:x(slot1.align == "right" and slot5 + slot0.panel:width() / 2 or slot5 - slot0.panel:width() / 2)
	end

	slot5 = true

	idlereasy.any(slot2:multigetIdler("level", "now", "locked"), function ()
		uv0 = "setPanel"
		slot0 = slot0.setPanel
		uv2 = "setPanel"
		uv3 = "setPanel"

		slot0(slot0, slot2.panel, slot3.chipDBID)

		uv0 = "panel"

		if not slot0 then
			uv0 = "setPanel"

			if slot0.dataRefresh then
				uv0 = "setPanel"

				slot0.dataRefresh()
			end
		end
	end)

	slot5 = false

	if slot0.subDBID then
		slot7 = slot0.panel:clone():addTo(slot0.panel:parent()):xy(slot0.panel:x() + slot0.panel:width() + 10, slot0.panel:y())

		slot7:get("btnChange"):hide()
		slot7:get("btnStrength"):hide()
		idlereasy.any(gGameModel.chips:find(slot0.subDBID):multigetIdler("level", "now", "locked"), function ()
			uv0 = "setPanel"
			uv2 = "subDBID"
			uv3 = "setPanel"

			slot0:setPanel(slot2, slot3.subDBID)
		end)
	end
end

function slot3.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

function slot3.onChangeClick(slot0)
	if slot0.cardDBID then
		slot1 = -1
		uv3 = "cardDBID"

		if slot0.changeType ~= slot3.down then
			slot1 = slot0.chipDBID
		end

		gGameApp:requestServer("/game/card/chip/change", function (slot0)
			uv1 = "changeType"
			uv2 = "up"

			if slot1.changeType == slot2.up then
				gGameUI:showTip(gLanguageCsv.inlaySuccess)
			else
				uv1 = "changeType"
				uv2 = "up"

				if slot1.changeType == slot2.down then
					gGameUI:showTip(gLanguageCsv.dischargeSuccess)
				else
					gGameUI:showTip(gLanguageCsv.exchange2Success)
				end
			end

			uv1 = "changeType"

			slot1:onClose()
		end, slot0.cardDBID, {
			[slot0.chipIdx] = slot1
		})
	else
		slot0.plan:modify(function (slot0)
			uv1 = "chipIdx"
			slot1 = slot1.chipIdx
			uv2 = "chipIdx"
			uv3 = "changeType"

			if slot2.changeType ~= slot3.down then
				uv2 = "chipIdx"

				if not slot2.chipDBID then
					slot2 = nil
				end
			end

			slot0[slot1] = slot2

			return true, slot0
		end)

		if slot0.dataRefresh then
			slot0.dataRefresh()
		end

		slot0:onClose()
	end
end

function slot3.setPanel(slot0, slot1, slot2)
	slot3 = slot1:multiget("bg", "bg2", "lock", "icon", "name", "level", "noEquip", "equip", "cardName", "gainExpText", "gainExp", "list", "attrItem", "lineItem", "suitItem", "btnChange", "btnStrength")
	slot5 = gGameModel.chips:find(slot2):read("chip_id", "card_db_id", "level", "level_exp", "locked")
	slot6 = csv.chip.chips[slot5.chip_id]

	bind.extend(slot0, slot3.icon, {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot5.chip_id,
				dbId = slot5.card_db_id
			},
			specialKey = {
				lv = slot5.level
			},
			onNode = function (slot0)
				slot0:get("defaultLv"):hide()
			end
		}
	})
	uiEasy.setIconName(slot5.chip_id, 0, {
		node = slot3.name
	})
	slot3.level:text(gLanguageCsv.textLv .. slot5.level)
	slot3.noEquip:hide()
	slot3.equip:hide()
	slot3.cardName:hide()
	slot3.lock:texture(slot5.locked and "city/card/chip/btn_lock.png" or "city/card/chip/btn_unlock.png")
	bind.touch(slot0, slot3.lock, {
		methods = {
			ended = functools.partial(slot0.onLockClick, slot0, slot2)
		}
	})
	slot3.gainExpText:hide()
	slot3.gainExp:hide()

	if slot0.showExp then
		slot3.gainExpText:show()
		slot3.gainExp:show()
		adapt.oneLinePos(slot3.gainExpText, slot3.gainExp)
		slot3.gainExp:text(slot0.showExp)
	elseif slot5.card_db_id then
		slot3.equip:show()
		slot3.cardName:show()

		slot7 = gGameModel.cards:find(slot5.card_db_id)

		uiEasy.setIconName("card", slot7:read("card_id"), {
			space = true,
			node = slot3.cardName,
			advance = slot7:read("advance")
		})
		adapt.oneLinePos(slot3.equip, slot3.cardName, cc.p(10, 0), "left")
	else
		slot3.noEquip:show()
	end

	slot3.list:removeAllChildren()

	slot7 = slot3.list
	slot7 = slot7.setScrollBarEnabled

	slot7(slot7, false)

	uv7 = "multiget"
	slot7, slot8 = slot7.getAttr(slot2, nil, true, true)
	slot9 = false

	for slot13, slot14 in ipairs(slot7) do
		uv16 = "multiget"

		if not slot16.ignoreAttr(slot14.key) then
			slot9 = true
			slot17 = slot3.attrItem:clone()
			slot18 = slot17
			slot17 = slot17.show(slot18)
			uv18 = "multiget"

			slot17:get("key"):text(slot18.getAttrName(slot15))
			slot17:get("val"):text("+" .. slot14.val)
			adapt.oneLinePos(slot17:get("key"), slot17:get("val"), cc.p(2, 0))
			slot3.list:pushBackCustomItem(slot17)
		end
	end

	if slot9 then
		slot3.list:pushBackCustomItem(slot3.lineItem:clone():show())
	end

	slot9 = false

	for slot13, slot14 in ipairs(slot8) do
		if not slot14.key then
			slot16 = slot3.attrItem:clone():show()

			slot16:get("key"):text(slot14.name)
			slot16:get("val"):text(slot14.val)
			text.addEffect(slot16:get("key"), {
				color = ui.COLORS.NORMAL.GRAY
			})
			text.addEffect(slot16:get("val"), {
				color = ui.COLORS.NORMAL.GRAY
			})
			adapt.oneLinePos(slot16:get("key"), slot16:get("val"), cc.p(20, 0))
			slot3.list:pushBackCustomItem(slot16)
		else
			uv16 = "multiget"

			if not slot16.ignoreAttr(slot15) then
				slot9 = true
				slot17 = slot3.attrItem:clone()
				slot18 = slot17
				slot17 = slot17.show(slot18)
				uv18 = "multiget"

				slot17:get("key"):text(slot18.getAttrName(slot15))
				slot17:get("val"):text("+" .. slot14.val)
				adapt.oneLinePos(slot17:get("key"), slot17:get("val"), cc.p(20, 0))
				slot3.list:pushBackCustomItem(slot17)
			end
		end
	end

	if slot9 then
		slot3.list:pushBackCustomItem(slot3.lineItem:clone():show())
	end

	slot10 = {}
	uv11 = "multiget"

	for slot15, slot16 in ipairs(slot11.getSuitAttrByChip(slot2)) do
		uv17 = "multiget"

		table.insert(slot10, {
			str = slot17.getSuitAttrStr(slot6.suitID, slot16)
		})
	end

	slot12 = slot3.suitItem:clone():show()
	slot13, slot14 = beauty.textScroll({
		isRich = true,
		margin = 10,
		list = slot12:get("list"),
		strs = slot10
	})

	slot13:height(slot14)
	slot13:setTouchEnabled(false)
	slot12:height(slot14)
	slot3.list:pushBackCustomItem(slot12)

	slot15 = slot3.btnChange:visible() and 0 or 124
	slot16 = cc.clampf(slot3.list:getInnerItemSize().height, 420, 590 + slot15)
	slot17 = 590 - slot16

	slot3.list:height(slot16):y(180 + slot17)
	slot3.bg2:height(642 - slot17)
	slot3.bg:height(1030 - slot17 - slot15)
	slot3.btnChange:y(90 + slot17)
	slot3.btnStrength:y(90 + slot17)

	if dataEasy.isUnlock(gUnlockCsv.chipPlan) then
		slot1:removeChildByName("planNamesBg")
		slot1:removeChildByName("planNames")

		slot18 = {}

		for slot23, slot24 in pairs(gGameModel.role:read("chip_plans")) do
			for slot28, slot29 in pairs(slot24.chips or {}) do
				if slot29 == slot2 then
					table.insert(slot18, slot24.name)

					break
				end
			end
		end

		if #slot18 > 0 then
			slot21, slot22 = beauty.textScroll({
				isRich = true,
				size = cc.size(slot3.bg:width() - 2 * 60, 0),
				strs = "#C0xFFFCED##L00100000##LOC0xF13B54#" .. gLanguageCsv.chipUsedInPlans .. " #C0xFFFF66##L00100000##LOC0xF13B54#" .. table.concat(slot18, ", ")
			})

			slot21:setTouchEnabled(math.min(slot22, 120) < slot22)
			slot21:height(slot23)
			slot21:xy(slot3.bg:box().x + slot20, slot3.bg:box().y - slot23 - 10):addTo(slot1, 2, "planNames")

			slot24 = ccui.Scale9Sprite:create()

			slot24:initWithFile(cc.rect(243, 17, 1, 1), "city/card/chip/bg_red.png")
			slot24:size(slot3.bg:width() + 140, slot23 + 40):anchorPoint(0.5, 1):xy(slot3.bg:box().x + slot3.bg:width() / 2, slot3.bg:box().y + 10):addTo(slot1, 1, "planNamesBg")
		end
	end
end

function slot3.onStrengthClick(slot0)
	gGameUI:stackUI("city.card.chip.advance", nil, {
		full = true
	}, slot0.chipDBID)
end

function slot3.onLockClick(slot0, slot1)
	gGameApp:requestServer("/game/card/chip/locked/switch", function ()
		uv2 = "gGameModel"

		if gGameModel.chips:find(slot2):read("locked") then
			gGameUI:showTip(gLanguageCsv.chipLocked)
		end
	end, slot1)
end

return slot3
