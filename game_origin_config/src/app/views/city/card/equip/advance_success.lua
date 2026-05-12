slot0 = 0.08
slot2 = class("CardEquipAdvanceSuccessView", cc.load("mvc").ViewBase)
slot3 = {
	"#C0x5B545B#",
	"#C0x5C9970#",
	"#C0x3D8A99#",
	"#C0x8A5C99#",
	"#C0xE69900#",
	"#C0xE67422#"
}
slot2.RESOURCE_FILENAME = "card_equip_advance_success.json"
slot2.RESOURCE_BINDING = {
	centerPos = "centerPos",
	name2 = "name2",
	pos = "pos",
	txt1 = "txt1",
	name1 = "name1",
	cardImg = "cardImg",
	bg = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
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
						slot1.txtLv,
						slot1.txtLvNum,
						slot1.imgArrow
					}, "hide")
				end
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	uiEasy.setTitleEffect(slot0.centerPos, "xjiesuan_juexingzi")

	slot0.leftData = slot1
	slot2 = clone(slot1)
	slot2.awake = slot1.awake + 1
	slot0.rightData = slot2
	slot7 = slot1.awake or 0
	slot9 = slot7 + 1
	slot10 = slot3.name1 .. gLanguageCsv["symbolRome" .. slot9]
	slot11, slot12 = dataEasy.getQuality(slot1.advance)

	slot0.name1:text(slot7 == 0 and slot3.name0 or slot3.name1 .. gLanguageCsv["symbolRome" .. slot7])
	slot0.name2:text(slot10)
	text.addEffect(slot0.name1, {
		color = ui.COLORS.QUALITY[slot11]
	})

	slot15 = {
		color = ui.COLORS.QUALITY[slot11]
	}

	text.addEffect(slot0.name2, slot15)

	uv15 = "uiEasy"
	slot17 = gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[csv.equips[slot1.equip_id].awakeAttrType1])]
	slot17 = 0

	rich.createWithWidth(string.format(gLanguageCsv.equipAwakeDetail, slot15[slot11], slot10, slot17, slot3.awakeAttrNum1[slot3.awakeMax <= slot9 and slot3.awakeMax or slot9 + 1]), 40, nil, 1000):anchorPoint(cc.p(0, 0.5)):addTo(slot0.pos):xy(0, slot17)
	uiEasy.setExecuteSequence(slot0.name1)
	uiEasy.setExecuteSequence(slot0.equip1)

	uv17 = "setTitleEffect"

	uiEasy.setExecuteSequence(slot0.cardImg, {
		delayTime = slot17
	})

	uv17 = "setTitleEffect"
	slot17 = slot17 * 2

	uiEasy.setExecuteSequence(slot0.name2, {
		delayTime = slot17
	})

	uv17 = "setTitleEffect"
	slot17 = slot17 * 2

	uiEasy.setExecuteSequence(slot0.equip2, {
		delayTime = slot17
	})

	uv17 = "setTitleEffect"
	slot17 = slot17 * 3

	uiEasy.setExecuteSequence(slot0.pos, {
		delayTime = slot17
	})

	uv17 = "setTitleEffect"

	uiEasy.setExecuteSequence(slot0.txt1, {
		delayTime = slot17 * 4
	})
end

function slot2.setStar(slot0, slot1, slot2)
	for slot6 = 1, slot2 do
		ccui.ImageView:create("city/card/equip/icon_star.png"):xy(99 - 15 * (slot2 + 1 - 2 * slot6), 20):addTo(slot1, 4, "star"):scale(1)
	end
end

function slot2.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot2
