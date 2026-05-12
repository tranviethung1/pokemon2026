slot0 = 0.08

function slot1(slot0, slot1)
	slot2 = csv.equips[slot0.equip_id]
	slot3 = nil
	slot4, slot5 = dataEasy.getQuality(slot0.advance)

	slot1:text((slot0.awake ~= 0 and slot2.name1 .. gLanguageCsv["symbolRome" .. slot0.awake] or slot2.name0) .. slot5)
	text.addEffect(slot1, {
		color = slot4 == 1 and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.QUALITY[slot4]
	})
end

slot3 = class("CardEquipSuccessView", cc.load("mvc").ViewBase)
slot4 = require("app.views.city.card.equip.view")
slot3.RESOURCE_FILENAME = "card_equip_success.json"
slot3.RESOURCE_BINDING = {
	["potentialPanel.rightPos"] = "rightPotentialPos",
	["potentialPanel.leftPos"] = "leftPotentialPos",
	fight2 = "fight2",
	fightBg = "fightBg",
	limitTip = "limitTip",
	potentialPanel = "potentialPanel",
	["starPanel.leftPos"] = "leftPos",
	icon = "icon",
	item1 = "item1",
	fight1 = "fight1",
	centerPos = "centerPos",
	["starPanel.rightPos"] = "rightPos",
	item2 = "item2",
	starPanel = "starPanel",
	item3 = "item3",
	textBD = "textBD",
	equip1 = {
		varname = "equip1",
		binds = {
			event = "extend",
			class = "equip_icon",
			props = {
				data = bindHelper.self("leftData"),
				onNode = function (slot0)
					slot1 = slot0:multiget("star", "txtLv", "txtLvNum", "imgArrow")

					itertools.invoke({
						slot1.star,
						slot1.txtLv,
						slot1.txtLvNum,
						slot1.imgArrow
					}, "hide")
				end
			}
		}
	},
	equip2 = {
		varname = "equip2",
		binds = {
			event = "extend",
			class = "equip_icon",
			props = {
				data = bindHelper.self("rightData"),
				onNode = function (slot0)
					slot1 = slot0:multiget("star", "txtLv", "txtLvNum", "imgArrow")

					itertools.invoke({
						slot1.star,
						slot1.txtLv,
						slot1.txtLvNum,
						slot1.imgArrow
					}, "hide")
				end
			}
		}
	},
	["potentialPanel.leftPos.textNote"] = {
		varname = "leftPotentialText",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = cc.c3b(179, 68, 48)
				}
			}
		}
	},
	["potentialPanel.rightPos.textNote"] = {
		varname = "righttPotentialText",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = cc.c3b(179, 68, 48)
				}
			}
		}
	},
	bg = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	}
}

function slot3.onCreate(slot0, slot1)
	audio.playEffectWithWeekBGM("advance_suc.mp3")

	slot0.leftData = slot1.leftItem
	slot0.rightData = slot1.rightItem
	slot0.cb = slot1.cb
	slot2 = {}
	slot3 = "xjiesuan_tupozi"

	if slot1.type == "star" then
		slot3 = "xjiesuan_shengxingzi"

		slot0:setStar(slot0.leftPos, slot0.leftData.star)

		slot7 = slot0.rightData.star

		slot0:setStar(slot0.rightPos, slot7)
		uiEasy.setExecuteSequence(slot0.leftPos)

		uv7 = "audio"

		uiEasy.setExecuteSequence(slot0.rightPos, {
			delayTime = slot7 * 2
		})
	end

	if slot1.type == "ability" then
		slot0.leftPotentialText:text(slot0.leftData.ability)
		slot0.righttPotentialText:text(slot0.rightData.ability)
		uiEasy.setExecuteSequence(slot0.leftPotentialPos)

		uv7 = "audio"

		uiEasy.setExecuteSequence(slot0.rightPotentialPos, {
			delayTime = slot7 * 2
		})

		slot3 = "xjiesuan_shengxingzi"
	end

	if slot1.type == "awake" then
		slot3 = "xjiesuan_juexingzi"
	end

	slot4 = slot0.item3
	slot5 = slot4
	slot4 = slot4.multiget(slot5, "name1", "name2")
	uv5 = "playEffectWithWeekBGM"

	slot5(slot0.leftData, slot4.name1)

	uv5 = "playEffectWithWeekBGM"

	slot5(slot0.rightData, slot4.name2)

	if slot1.type == "signet" then
		slot3 = "xjiesuan_keyinzi"

		slot4.name1:text(slot1.leftQuality)
		slot4.name2:text(slot1.rightQuality)
	end

	slot0.textBD:visible(false)

	if slot1.type == "signetAdvance" then
		slot0.rightData = slot1.leftItem

		slot4.name1:text(slot1.leftQuality)
		slot4.name2:text(slot1.rightQuality)

		if slot1.isMax then
			slot4.name2:text(slot1.leftQuality)
		end

		if slot1.limitTip ~= 0 then
			slot0.textBD:text(slot1.textBD)
			slot0.limitTip:text("(" .. slot1.limitTip .. ")"):visible(true)
			text.addEffect(slot0.textBD, {
				color = cc.c4b(183, 176, 158, 255)
			})
		else
			slot0.textBD:text(slot1.textBD)
			slot0.limitTip:visible(false)
			text.addEffect(slot0.textBD, {
				color = cc.c4b(96, 196, 86, 255)
			})
		end

		slot0.textBD:visible(true)
	end

	uiEasy.setExecuteSequence(slot4.name1)

	uv8 = "audio"
	slot8 = slot8 * 2

	uiEasy.setExecuteSequence(slot4.name2, {
		delayTime = slot8
	})
	uiEasy.setExecuteSequence(slot0.equip1)

	uv8 = "audio"
	slot8 = slot8 * 2

	uiEasy.setExecuteSequence(slot0.equip2, {
		delayTime = slot8
	})

	uv8 = "audio"

	uiEasy.setExecuteSequence(slot0.icon, {
		delayTime = slot8
	})
	uiEasy.setTitleEffect(slot0.centerPos, slot3)

	slot5 = gGameModel.cards:find(slot1.cardDbid)

	slot0.fight1:text(slot1.fight)

	slot9 = slot5

	slot0.fight2:text(slot5.read(slot9, "fighting_point"))

	uv9 = "audio"
	slot9 = slot9 * 3

	uiEasy.setExecuteSequence(slot0.fightBg, {
		delayTime = slot9
	})

	uv9 = "audio"
	slot9 = slot9 * 4

	uiEasy.setExecuteSequence(slot0.fight1, {
		delayTime = slot9
	})

	uv9 = "audio"

	uiEasy.setExecuteSequence(slot0.fight2, {
		delayTime = slot9 * 5
	})
	slot0.starPanel:visible(slot1.type == "star")
	slot0.potentialPanel:visible(slot1.type == "ability")
	slot0.leftPotentialPos:visible(slot0.leftData.ability == 0)

	for slot9 = 1, 2 do
		uv11 = "advance_suc.mp3"
		slot11, slot12, slot13 = slot11.getAttrNum(slot1.leftItem, slot9, slot1.type == "quick" and "advance" or slot1.type)

		if slot1.type == "quick" then
			slot14 = nil
			uv15 = "advance_suc.mp3"
			slot14, slot13 = slot15.getAttrNum(slot1.rightItem, slot9, slot1.type)
		elseif slot1.type == "signetAdvance" and slot1.signetAdvanceData[slot9] then
			slot12 = slot1.signetAdvanceData[slot9].num1
			slot13 = slot1.signetAdvanceData[slot9].num2
		end

		slot14 = slot0["item" .. slot9]:multiget("note", "name1", "name2", "icon", "arrow")

		if slot11 ~= 0 and slot13 ~= 0 then
			slot14.note:text(gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot11])] .. ":")

			slot18 = slot13

			if type(slot12) == "number" then
				slot17 = math.round(slot12)
			end

			if type(slot18) == "number" then
				slot18 = math.round(slot13)
			end

			slot14.name1:text("+" .. slot17)

			slot19 = slot14.name2
			slot19 = slot19.text

			slot19(slot19, "+" .. slot18)

			uv19 = "audio"

			if ui.ATTR_LOGO[slot15] then
				slot14.icon:texture(ui.ATTR_LOGO[slot15])
				adapt.oneLinePos(slot14.note, slot14.icon, cc.p(30, 0), "right")
				uiEasy.setExecuteSequence(slot14.icon, {
					delayTime = slot19 * (5 + slot9)
				})
			else
				slot14.icon:hide()
			end

			uiEasy.setExecuteSequence(slot14.note, {
				delayTime = slot19
			})

			uv23 = "audio"
			slot23 = slot19 + slot23

			uiEasy.setExecuteSequence(slot14.name1, {
				delayTime = slot23
			})

			uv23 = "audio"
			slot23 = slot19 + slot23 * 2

			uiEasy.setExecuteSequence(slot14.arrow, {
				delayTime = slot23
			})

			uv23 = "audio"

			uiEasy.setExecuteSequence(slot14.name2, {
				delayTime = slot19 + slot23 * 3
			})
		else
			itertools.invoke({
				slot14.note,
				slot14.name1,
				slot14.name2,
				slot14.icon,
				slot14.arrow
			}, "hide")
		end
	end
end

function slot3.setStar(slot0, slot1, slot2)
	if slot2 > 0 then
		for slot6 = 1, slot2 do
			ccui.ImageView:create("city/card/equip/icon_star.png"):xy(99 - 15 * (slot2 + 1 - 2 * slot6), 20):addTo(slot1, 4, "star"):scale(0.8)
		end
	end
end

function slot3.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot3
