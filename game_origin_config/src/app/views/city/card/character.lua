slot0 = class("CardCharacterView", Dialog)

function slot1(slot0, slot1)
	slot0:setString(slot1)

	if slot1 == 0.9 then
		text.addEffect(slot0, {
			color = cc.c4b(241, 59, 84, 255)
		})
	elseif slot1 == 1.1 then
		text.addEffect(slot0, {
			color = cc.c4b(96, 196, 86, 255)
		})
	else
		text.addEffect(slot0, {
			color = cc.c4b(91, 84, 91, 255)
		})
	end
end

slot0.RESOURCE_FILENAME = "card_character.json"
slot0.RESOURCE_BINDING = {
	imgMark = "imgMark",
	subList = "characterSubList",
	item = "characterItem",
	titleTxt = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.RED
				}
			}
		}
	},
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "characterList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				asyncPreload = 27,
				columnSize = 9,
				data = bindHelper.self("characterData"),
				item = bindHelper.self("characterSubList"),
				cell = bindHelper.self("characterItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("select"):visible(slot3.select == true)
					slot1:get("img"):visible(slot3.showCurr == true)

					if slot0:getIdx(slot2).col % 2 ~= 0 then
						slot1:get("bg"):hide()
					end

					slot1:get("name"):setString(slot3.name or "")

					for slot8 = 1, 5 do
						uv9 = "get"

						slot9(slot1:get("txt" .. slot8), slot3["txt" .. slot8] or "")
					end
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot3 = {
		7,
		9,
		8,
		10,
		13
	}
	slot4 = {}
	slot5 = csv.cards[slot1].chaRecom

	for slot9, slot10 in ipairs(csv.character) do
		slot11 = {
			name = slot10.name,
			showCurr = slot9 == slot2,
			["txt" .. slot15] = string.match(slot10.attrMap[slot16], "%d+") / 100
		}

		for slot15, slot16 in ipairs(slot3) do
			if slot10.attrMap and slot10.attrMap[slot16] then
				-- Nothing
			else
				slot11["txt" .. slot15] = "-"
			end
		end

		for slot15, slot16 in pairs(slot5) do
			if slot16 == slot9 then
				slot11.select = true
			end
		end

		table.insert(slot4, slot11)
	end

	for slot9 = 1, 27 do
		if #slot4 < 27 then
			table.insert(slot4, {})
		else
			break
		end
	end

	slot0.characterData = slot4

	Dialog.onCreate(slot0)
end

return slot0
