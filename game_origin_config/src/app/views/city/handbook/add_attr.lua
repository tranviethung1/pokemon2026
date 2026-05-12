slot0 = class("HandbookAttrAddView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "handbook_attadd.json"
slot0.RESOURCE_BINDING = {
	["panel.item"] = "item",
	["panel.innerList"] = "innerList",
	panel = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	["panel.list"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = game.ATTRDEF_TABLE[slot2]

					slot1:get("textName"):text(gLanguageCsv["attr" .. string.caption(slot3.key)])
					adapt.setTextScaleWithWidth(slot1:get("textNum"), "+" .. mathEasy.getPreciseDecimal(slot3.val, 2) .. "%", 160)
					slot1:get("imgIcon"):texture(ui.ATTR_LOGO[slot3.key])
					adapt.oneLinePos(slot1:get("imgIcon"), slot1:get("textName"), cc.p(8, 0), "left")
					adapt.oneLinePos(slot1:get("textName"), slot1:get("textNum"), nil, "left")
				end,
				dataOrderCmp = function (slot0, slot1)
					return slot0.idx < slot1.idx
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:initModel()
	gGameModel.handbook:getIdlerOrigin("isNew"):set(false)

	slot2 = {
		{
			val = 0,
			idx = 1,
			key = "hp"
		},
		[7] = {
			val = 0,
			idx = 2,
			key = "damage"
		},
		[8] = {
			val = 0,
			idx = 3,
			key = "specialDamage"
		},
		[9] = {
			val = 0,
			idx = 4,
			key = "defence"
		},
		[10] = {
			val = 0,
			idx = 5,
			key = "specialDefence"
		},
		[13] = {
			val = 0,
			idx = 6,
			key = "speed"
		}
	}

	for slot6, slot7 in pairs(slot0.pokedex:read()) do
		if gHandbookCsv[slot6] then
			for slot12 = 1, math.huge do
				if not slot8["attrType" .. slot12] then
					break
				end

				slot14, slot15 = dataEasy.parsePercentStr(slot8["attrValue" .. slot12])
				slot2[slot13].val = slot2[slot13].val + mathEasy.getPreciseDecimal(slot14, 2)
			end
		end
	end

	slot3 = {}

	for slot7, slot8 in ipairs(slot0.cards:read()) do
		slot9 = gGameModel.cards:find(slot8)
		slot13 = csv.cards[slot9:read("card_id")].cardMarkID
		slot15, slot16 = dataEasy.parsePercentStr(gPokedexDevelop[slot13][slot9:read("star")].attrValue1)
		slot15 = mathEasy.getPreciseDecimal(slot15, 2)
		slot3[slot13] = slot3[slot13] or {
			typ = slot14.attrType1,
			val = slot15
		}

		if slot3[slot13].val < slot15 then
			slot3[slot13].val = slot15
		end
	end

	for slot7, slot8 in pairs(slot3) do
		slot2[slot8.typ].val = slot2[slot8.typ].val + slot8.val
	end

	slot0.attrDatas = idlers.newWithMap(slot2)
end

function slot0.initModel(slot0)
	slot0.pokedex = gGameModel.role:getIdler("pokedex")
	slot0.cards = gGameModel.role:getIdler("cards")
end

return slot0
