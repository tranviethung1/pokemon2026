function slot0(slot0, slot1, slot2, slot3, slot4)
	bind.extend(slot0, slot2:get("icon"), {
		class = "card_icon",
		props = {
			cardId = slot3,
			rarity = csv.unit[csv.cards[slot3].unitID].rarity,
			grayState = slot4 and 0 or 2,
			onNode = function (slot0)
				slot0:xy(-4, -4)
			end
		}
	})
	text.addEffect(slot2:get("name"), {
		color = slot4 and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.NORMAL.GRAY
	})
	slot2:get("name"):text(slot5.name)
	slot2:get("mask"):visible(false)
	slot1:get("list"):pushBackCustomItem(slot2)
	slot1:get("list"):adaptTouchEnabled()
end

slot1 = class("CardFetterView", Dialog)
slot1.RESOURCE_FILENAME = "card_fetter.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	subItem = "subItem",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	infoBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onFetterInfo")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("fetterDatas"),
				cardId = bindHelper.self("cardId"),
				subItem = bindHelper.self("subItem"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = slot0.subItem

					table.insert({}, {
						state = true,
						id = slot0.cardId
					})

					for slot12, slot13 in ipairs(csv.fetter[slot3.id].cards) do
						table.insert(slot8, {
							id = slot3.cardDatas[slot13] or slot13,
							state = gGameModel.role:read("pokedex")[slot13] ~= nil
						})
					end

					slot1:get("bg"):texture(string.format("city/card/system/fetter/box_pop_panel%d.png", slot3.isShow and 7 or 5))
					slot1:get("titleBg"):texture(string.format("city/card/system/fetter/box_pop_panel%d.png", slot3.isShow and 8 or 6))
					slot1:get("title1"):text(slot6.name)

					if matchLanguage({
						"en"
					}) then
						adapt.setTextAdaptWithSize(slot9, {
							vertical = "center",
							horizontal = "center",
							size = cc.size(380, 200)
						})
					end

					slot1:get("title2"):visible(not slot3.isShow)
					slot1:get("txtPos"):removeAllChildren()

					slot10 = {}

					for slot14, slot15 in ipairs(slot8) do
						uv16 = "cardId"

						slot16(slot0, slot1, slot5:clone():show(), slot15.id, slot15.state)
					end

					slot11 = 0
					slot12 = csvSize(slot6.attrMap)
					slot13 = slot3.isShow and "#C0xF76B45#" or ""

					if matchLanguage({
						"en"
					}) then
						slot14 = "#C0x5B545B#%s%s%s %s " .. "\n"
					end

					for slot18, slot19 in csvPairs(slot6.attrMap) do
						table.insert(slot10, string.format(slot14, getLanguageAttr(slot18), gLanguageCsv.improve, slot13, dataEasy.getAttrValueString(slot18, slot19)))

						if slot11 + 1 < slot12 then
							table.insert(slot10, "\n")
						end
					end

					slot18 = rich.createWithWidth(table.concat(slot10, ""), matchLanguage({
						"en"
					}) and 35 or 44, nil, matchLanguage({
						"kr"
					}) and 470 or 350, 24)

					slot18:setAnchorPoint(cc.p(0, 0.5))
					slot1:get("txtPos"):addChild(slot18)
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.cardId = slot2
	slot0.fetterDatas = slot1

	slot0.item:get("list"):setScrollBarEnabled(false)
	Dialog.onCreate(slot0)
end

function slot1.onClose(slot0)
	if slot0._closecb then
		slot0._closecb()
	end

	return Dialog.onClose(slot0)
end

function slot1.onFetterInfo(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 860
	})
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.fetterInfo)
		end),
		slot2.noteText(54001, 54003)
	}
end

return slot1
