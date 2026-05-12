slot0 = class("NatureAttrInfoView", Dialog)
slot0.RESOURCE_FILENAME = "card_nature_attr.json"
slot0.RESOURCE_BINDING = {
	curFlag = "curFlag",
	item = "item",
	topList = "topList",
	textNote2 = "textNote2",
	rightList = "rightList",
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
			class = "listview",
			props = {
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("curFlag"),
				natureTypes = bindHelper.self("natureTypes"),
				cell = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot10 = game.NATURE_ENUM_TABLE[slot3.key]

					slot1:get("imgIcon"):visible(itertools.include(slot0.natureTypes, slot10))

					slot6 = {}

					for slot10, slot11 in ipairs(game.NATURE_TABLE) do
						table.insert(slot6, slot3.data[slot11])
					end

					bind.extend(slot0, slot1:get("list"), {
						class = "listview",
						props = {
							data = slot6,
							item = slot0.cell,
							onItem = function (slot0, slot1, slot2, slot3)
								slot1:get("textNote"):text(slot3)

								slot4 = ui.COLORS.NORMAL.DEFAULT

								if slot3 > 1 then
									slot4 = ui.COLORS.NORMAL.FRIEND_GREEN
								elseif slot3 < 1 then
									slot4 = ui.COLORS.NORMAL.RED
								elseif slot3 == 0 then
									slot4 = ui.COLORS.NORMAL.ALERT_ORANGE
								end

								text.addEffect(slot1:get("textNote"), {
									color = slot4
								})
							end
						}
					})
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.rightList:setScrollBarEnabled(false)
	slot0.topList:setScrollBarEnabled(false)
	adapt.setAutoText(slot0.textNote2, slot0.textNote2:text(), nil)

	slot0.cardId = gGameModel.cards:find(slot1):read("card_id")
	slot4 = csv.unit[csv.cards[slot0.cardId].unitID]
	slot0.natureTypes = {
		slot4.natureType
	}

	if slot4.natureType2 then
		table.insert(slot0.natureTypes, slot4.natureType2)
	end

	slot0.attrDatas = idlers.newWithMap({})
	slot5 = {}

	for slot9, slot10 in orderCsvPairs(csv.base_attribute.nature_matrix) do
		table.insert(slot5, {
			key = game.NATURE_TABLE[slot9],
			data = slot10
		})
	end

	slot0.attrDatas:update(slot5)
	Dialog.onCreate(slot0)
end

return slot0
