function slot0(slot0, slot1, slot2, slot3, slot4)
	bind.extend(slot0, slot2:get("head"), {
		class = "card_icon",
		props = {
			cardId = slot3,
			rarity = csv.unit[csv.cards[slot3].unitID].rarity,
			grayState = slot4 and 0 or 2,
			onNode = function (slot0)
				slot0:scale(0.8)
			end
		}
	})
	text.addEffect(slot2:get("textName"), {
		color = slot4 and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.NORMAL.GRAY
	})
	slot2:get("textName"):text(slot5.name)
	slot2:get("textName"):setFontSize(30)
	adapt.setTextScaleWithWidth(slot2:get("textName"), nil, 180)
	slot1:get("list"):pushBackCustomItem(slot2)
	slot1:get("list"):adaptTouchEnabled()
end

slot1 = class("HandBookFetterView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "handbook_fetter.json"
slot1.RESOURCE_BINDING = {
	roleItem = "roleItem",
	item = "item",
	["baseNode.tip"] = "tip",
	["baseNode.textName"] = "nodeName",
	["baseNode.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("fetterDatas"),
				subItem = bindHelper.self("roleItem"),
				cardId = bindHelper.self("cardIdIdler"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:removeChildByName("richtext")
					slot1:get("list"):setScrollBarEnabled(false)
					slot1:get("list"):removeAllItems()

					slot5 = slot1:get("title.imgBg")

					slot1:get("title.textName"):text(csv.fetter[slot3.id].name)

					if matchLanguage({
						"en"
					}) then
						slot5:size(slot6:size().width + 50, slot5:size().height)
						slot1:get("title"):anchorPoint(0, 0.5)
						slot5:anchorPoint(0, 0.5)
						slot6:anchorPoint(0, 0.5)
						slot1:get("title"):x(slot1:get("title"):x() - 328)
						slot6:x(slot6:x() + 25)
						adapt.oneLinePos(slot6, slot1:get("textTip"), cc.p(-100, 0))
					else
						adapt.setTextScaleWithWidth(slot1:get("title.textName"), nil, 300)
					end

					slot7 = {}
					slot8 = false
					slot9 = true

					for slot13, slot14 in ipairs(slot4.cards) do
						slot16 = slot3.pokedex[slot14] ~= nil

						table.insert(slot7, {
							id = slot3.cardDatas[csv.cards[slot14].cardMarkID] or slot14,
							state = slot16
						})

						if not slot16 then
							slot9 = false
						end
					end

					for slot13, slot14 in ipairs(slot7) do
						uv15 = "removeChildByName"

						slot15(slot0, slot1, slot0.subItem:clone():show(), slot14.id, slot14.state)
					end

					slot10 = "common/box/box_jb_00.png"
					slot11 = "common/box/tag__jb_01.png"
					slot12 = cc.c4b(166, 151, 149, 255)

					if slot9 then
						slot10 = "common/box/box_jb_01.png"
						slot11 = "common/box/tag__jb_00.png"
						slot12 = cc.c4b(229, 103, 92, 255)
					end

					slot1:get("imgBg"):texture(slot10)
					slot1:get("title.imgBg"):texture(slot11)
					text.addEffect(slot1:get("title.textName"), {
						outline = {
							size = 3,
							color = slot12
						}
					})
					slot1:get("textTip"):visible(not slot9)

					slot13 = {}
					slot14 = slot9 and "#C0xF76B45#" or ""

					for slot18, slot19 in csvPairs(slot4.attrMap) do
						table.insert(slot13, string.format("#C0x5B545B#%s" .. gLanguageCsv.improve .. " %s", getLanguageAttr(slot18), dataEasy.getAttrValueString(slot18, slot19)))
					end

					slot16 = rich.createWithWidth(table.concat(slot13, " "), 40, nil, 1000):setAnchorPoint(cc.p(0, 0.5)):xy(38, 244):addTo(slot1, 10, "richtext")
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.cardIdIdler = slot1.selCardId()
	slot0.fetterDatas = idlers.newWithMap({})

	idlereasy.any({
		slot0.cardDatas,
		slot0.cardIdIdler,
		slot0.pokedex
	}, function (slot0, slot1, slot2, slot3)
		slot4 = csv.cards[slot2]
		slot5 = {}
		slot6 = {}

		for slot10, slot11 in ipairs(slot1) do
			if gGameModel.cards:find(slot11) and (not slot6[csv.cards[slot12:read("card_id")].cardMarkID] or slot15 < slot13) then
				slot6[slot14] = slot13
			end
		end

		for slot11 = 1, csvSize(slot4.fetterList) do
			slot5[slot11] = {
				id = slot4.fetterList[slot11],
				cardDatas = slot6,
				pokedex = slot3
			}
		end

		uv8 = "csv"
		slot8 = slot8.fetterDatas
		slot8 = slot8.update

		slot8(slot8, slot5)

		uv8 = "csv"

		slot8.tip:visible(slot7 <= 0)

		slot9 = csv.unit[slot4.unitID]

		table.insert({}, slot9.natureType)

		if slot9.natureType2 then
			table.insert(slot8, slot9.natureType2)
		end
	end)
end

function slot1.initModel(slot0)
	slot0.cardDatas = gGameModel.role:getIdler("cards")
	slot0.pokedex = gGameModel.role:getIdler("pokedex")
end

return slot1
