slot0 = 0.08
slot1 = require("app.views.city.card.helditem.tools")

function slot2(slot0, slot1, slot2, slot3)
	slot5 = csv.held_item.advance_attrs[slot2]

	return slot0.attrNumRates[slot3] * slot5["attrRate" .. slot0.advanceAttrSeq][slot3] * (csv.held_item.level_attrs[slot1]["attrNum" .. slot0.strengthAttrSeq][slot3] + slot5["attrNum" .. slot0.advanceAttrSeq][slot3])
end

function slot3(slot0, slot1, slot2)
	bind.extend(slot0, slot1, {
		class = "icon_key",
		props = {
			data = {
				key = slot2.csvId,
				csvId = slot2.csvId,
				dbId = slot2.dbId
			},
			specialKey = {
				lv = slot2.lv
			},
			onNode = function (slot0)
				slot0:setTouchEnabled(false)
			end
		}
	})
end

function slot4(slot0, slot1, slot2)
	slot0:show()

	slot3 = csv.held_item.items[slot1]
	slot3.advance = slot2
	slot3.csvId = slot1
	uv5 = "show"
	slot7 = rich.createByStr("#C0x5B545B#" .. table.concat({
		slot5.getStrinigByData(2, {
			cfg = slot3
		})
	}, "\n"), 40, nil):anchorPoint(0, 0.5):xy(220, 23):addTo(slot0, 10, "attrText")

	slot7:formatText()
	adapt.oneLinePos(slot7, slot0:get("arrow"), cc.p(8, 2), "left")
end

slot5 = class("HeldItemCommonSuccessView", cc.load("mvc").ViewBase)
slot5.RESOURCE_FILENAME = "held_item_common_success.json"
slot5.RESOURCE_BINDING = {
	centerPos = "centerPos",
	titlePos = "titlePos",
	item = "item",
	centerPanel = "centerPanel",
	descNote = "descNote",
	["centerPanel.subList"] = "subList",
	bg = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	["centerPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				asyncPreload = 6,
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("note", "txt1", "txt2", "icon", "iconArrow")

					slot4.note:setString(slot3.note)
					slot4.txt1:setString(math.floor(slot3.txt1))
					slot4.txt2:setString(math.floor(slot3.txt2))
					slot4.icon:loadTexture(slot3.icon)
					adapt.oneLinePos(slot4.note, slot4.txt1, cc.p(13, 0))
					adapt.oneLinePos(slot4.txt1, slot4.iconArrow, cc.p(6, 0))

					slot10 = 0

					adapt.oneLinePos(slot4.iconArrow, slot4.txt2, cc.p(6, slot10))

					slot6 = slot0
					uv6 = "multiget"
					slot6 = slot6 * (3 + slot0.getIdx(slot6, slot2).k)

					uiEasy.setExecuteSequence({
						slot4.icon,
						slot4.note
					}, {
						delayTime = slot6
					})

					uv10 = "multiget"
					slot10 = slot6 + slot10

					uiEasy.setExecuteSequence(slot4.txt1, {
						delayTime = slot10
					})

					uv10 = "multiget"
					slot10 = slot6 + slot10 * 2

					uiEasy.setExecuteSequence(slot4.iconArrow, {
						delayTime = slot10
					})

					uv10 = "multiget"

					uiEasy.setExecuteSequence(slot4.txt2, {
						delayTime = slot6 + slot10 * 3
					})
				end
			}
		}
	}
}

function slot5.onCreate(slot0, slot1)
	slot0.dbId = slot1.dbId

	slot0:initModel()

	slot0.attrDatas = idlers.new()
	slot3 = {}

	for slot7, slot8 in ipairs(csv.held_item.items[slot0.heldItemId].attrTypes) do
		slot10 = game.ATTRDEF_TABLE[slot8]
		slot12 = "attr" .. string.caption(slot10)
		uv12 = "dbId"
		slot12 = slot12(slot2, slot1.level, slot1.advance, slot7)
		uv12 = "dbId"

		table.insert(slot3, {
			note = gLanguageCsv[slot12],
			txt1 = slot12,
			txt2 = slot12(slot2, slot0.newLevel, slot0.newAdvance, slot7),
			icon = ui.ATTR_LOGO[slot10]
		})
	end

	slot0.attrDatas:update(slot3)
	slot0:setCenterPanel(slot2, slot1.level, slot1.advance, 1, slot1.typ)
	slot0:setCenterPanel(slot2, slot0.newLevel, slot0.newAdvance, 2, slot1.typ)

	slot4 = "xjiesuan_qianghuazi"

	if slot1.typ == "advance" then
		slot4 = "xjiesuan_tupozi"
	end

	uiEasy.setTitleEffect(slot0.centerPos, slot4)
	slot0.descNote:hide()

	if slot2.effect2LevelAdvSeq[1] == slot0.newAdvance and slot1.typ == "advance" then
		slot5 = slot0.descNote
		slot5 = slot5.show

		slot5(slot5)

		uv5 = "initModel"

		slot5(slot0.descNote, slot0.heldItemId, slot0.newAdvance)

		slot7 = slot0.centerPos
		slot8 = slot7

		slot0.centerPanel:y(slot7.y(slot8) + 40)

		uv8 = "csv"

		uiEasy.setExecuteSequence(slot0.descNote, {
			delayTime = slot8 * 5
		})
	end

	slot0:setFight(slot1.fight, slot1.cardDbId)
end

function slot5.initModel(slot0)
	slot2 = gGameModel.held_items:find(slot0.dbId):read("held_item_id", "advance", "level", "card_db_id")
	slot0.heldItemId = slot2.held_item_id
	slot0.newLevel = slot2.level
	slot0.newAdvance = slot2.advance
	slot0.cardDbId = slot2.card_db_id
end

function slot5.setCenterPanel(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0.centerPanel:multiget("card1", "card2", "name1", "name2", "level1", "level2", "cardImg")
	slot7 = slot6["card" .. slot4]
	slot8 = slot6["name" .. slot4]
	slot9 = slot6["level" .. slot4]
	slot10 = gLanguageCsv.textLv .. slot2

	if slot5 == "advance" then
		slot10 = slot3 > 0 and "+" .. slot3 or ""
	end

	slot9:text(slot10)
	slot8:text(slot1.name)
	text.addEffect(slot8, {
		color = ui.COLORS.QUALITY[slot1.quality]
	})
	text.addEffect(slot9, {
		color = ui.COLORS.QUALITY[slot1.quality]
	})
	adapt.oneLineCenterPos(cc.p(slot7:x(), slot8:y()), {
		slot8,
		slot9
	}, cc.p(8, 0))

	uv11 = "centerPanel"

	slot11(slot0, slot7, {
		csvId = slot0.heldItemId,
		isExc = csvSize(slot1.exclusiveCards) > 0,
		lv = slot2,
		dbId = slot0.dbId
	})

	uv11 = "multiget"
	slot11 = slot11 * (slot4 == 1 and 0.1 or 2)

	uiEasy.setExecuteSequence(slot7, {
		delayTime = slot11
	})
	uiEasy.setExecuteSequence(slot8, {
		delayTime = slot11
	})
	uiEasy.setExecuteSequence(slot9, {
		delayTime = slot11
	})

	if slot4 == 2 then
		uv15 = "multiget"

		uiEasy.setExecuteSequence({
			slot6.cardImg
		}, {
			delayTime = slot15
		})
	end
end

function slot5.setFight(slot0, slot1, slot2)
	slot3 = slot0.centerPanel:multiget("fight1", "fight2", "fightBg")

	if slot2 == nil then
		itertools.invoke({
			slot3.fight1,
			slot3.fight2,
			slot3.fightBg
		}, "hide")
	else
		slot3.fight1:text(slot1)
		slot3.fight2:text(gGameModel.cards:find(slot2):read("fighting_point"))

		uv8 = "centerPanel"
		slot8 = slot8 * 3

		uiEasy.setExecuteSequence(slot3.fightBg, {
			delayTime = slot8
		})

		uv8 = "centerPanel"
		slot8 = slot8 * 4

		uiEasy.setExecuteSequence(slot3.fight1, {
			delayTime = slot8
		})

		uv8 = "centerPanel"

		uiEasy.setExecuteSequence(slot3.fight2, {
			delayTime = slot8 * 5
		})
	end
end

return slot5
