slot0 = require("app.views.city.adventure.auto_chess.tools")
slot1 = class("AutoChessCardBagView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "auto_chess_sprite_bag.json"
slot1.RESOURCE_BINDING = {
	["cardPanel.cardNode"] = "cardNode",
	["cardPanel.subList"] = "subList",
	cardPanel = "cardPanel",
	["cardPanel.cardList"] = {
		varname = "cardList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				asyncPreload = 21,
				data = bindHelper.self("listData"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("cardNode"),
				columnSize = bindHelper.self("columnSize"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.unlock ~= slot1.unlock then
						return slot0.unlock
					end

					if slot0.cardType ~= slot1.cardType then
						return slot0.cardType < slot1.cardType
					end

					return slot0.id < slot1.id
				end,
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("lock"):visible(not slot3.unlock)
					bind.extend(slot0, slot1:get("card"), {
						class = "auto_chess_card1",
						props = {
							id = slot3.id,
							star = slot3.star,
							grayState = slot3.unlock and 0 or 1,
							onNode = function (slot0)
								slot3 = 0.6

								slot0:scale(slot3)

								uv3 = "scale"

								slot0:alignCenter(slot3:get("card"):size())
							end
						}
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, realIndex, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onCardClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "PARTNER",
		title = gLanguageCsv.autoChessCardBag
	})

	slot0.listData = idlers.new({})
	slot0.figureID = slot1
	slot0.figureData = gGameModel.auto_chess:read("trainers")[slot1]

	slot0:initData()

	slot2, slot3 = adapt.centerWithScreen({
		"left",
		nil,
		false
	}, {
		"right",
		nil,
		false
	}, {
		itemWidth = slot0.cardNode:width()
	}, {
		{
			slot0.cardList,
			"width"
		},
		{
			slot0.cardList,
			"pos",
			"left"
		}
	})
	slot0.columnSize = 5 + slot3
end

function slot1.initData(slot0)
	slot1 = {}

	for slot5, slot6 in orderCsvPairs(csv.auto_chess.trainer[slot0.figureID].cards) do
		uv7 = "orderCsvPairs"
		slot7, slot8 = slot7.getCardType(slot5)

		table.insert(slot1, {
			star = 1,
			id = slot5,
			unlock = slot6 <= slot0.figureData.level,
			unlockLevel = slot6,
			type = slot7,
			cardType = slot8
		})
	end

	slot0.listData:update(slot1)
end

function slot1.onCardClick(slot0, slot1, slot2, slot3, slot4)
	gGameUI:stackUI("city.adventure.auto_chess.card_detail", nil, {
		blackLayer = true,
		clickClose = true
	}, slot4, 1)
end

return slot1
