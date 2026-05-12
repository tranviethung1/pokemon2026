slot0 = cc.load("mvc").ViewBase
slot1 = class("CloneBattleChooseView", Dialog)
slot1.RESOURCE_FILENAME = "clone_battle_sprite.json"
slot1.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	list = {
		varname = "cardList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				asyncPreload = 12,
				data = bindHelper.self("cardDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				dataOrderCmpGen = bindHelper.self("onSortCardList", true),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("cardItem", "name", "txtValueTitle", "txtValue", "mask")

					uiEasy.setIconName("card", slot3.id, {
						space = true,
						node = slot4.name,
						name = slot3.name,
						advance = slot3.advance
					})
					adapt.setTextAdaptWithSize(slot4.name, {
						maxLine = 2,
						vertical = "center",
						horizontal = "left",
						size = cc.size(300, slot4.name:height() * 2)
					})
					slot4.txtValue:text(slot3.fightPoint)
					adapt.oneLinePos(slot4.txtValueTitle, slot4.txtValue, cc.p(15, 0), "left")
					bind.extend(slot0, slot4.cardItem, {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							advance = slot3.advance,
							star = slot3.star,
							rarity = slot3.rarity,
							dbid = slot3.dbid,
							levelProps = {
								data = slot3.level
							},
							params = {
								starScale = 0.85,
								starInterval = 12.5
							}
						}
					})

					if slot3.inMeteor or slot3.isCur then
						slot4.mask:show()

						slot5 = slot4.mask:get("textNote")

						uiEasy.addTextEffect1(slot4.mask:get("textNote"))

						if slot3.inMeteor then
							slot5:text(gLanguageCsv.inMeteorites)
							slot5:show()
						end
					else
						slot4.mask:hide()
						bind.touch(slot0, slot1, {
							methods = {
								ended = functools.partial(slot0.itemClick, slot1, slot2, slot3)
							}
						})
					end
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemChoose")
			}
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.curSprId = slot1

	slot0:initModel()

	slot0.cardDatas = idlers.new()
	slot2 = dataEasy.getInMeteorCardsHash()

	idlereasy.any({
		slot0.cards
	}, function (slot0, slot1)
		for slot7, slot8 in ipairs(slot1) do
			slot9 = gGameModel.cards:find(slot8):read("card_id", "skin_id", "level", "star", "advance", "name", "fighting_point")
			slot10 = csv.cards[slot9.card_id]
			uv14 = "ipairs"
			slot14 = slot9.fighting_point.curSprId == slot8
			uv14 = "gGameModel"
			slot3 = 0 + 1
		end

		uv4 = "ipairs"

		slot4.cardDatas:update({
			[slot8] = {
				id = slot9.card_id,
				unitId = dataEasy.getUnitId(slot9.card_id, slot9.skin_id),
				name = slot10.name,
				rarity = csv.unit[slot10.unitID].rarity,
				level = slot9.level,
				star = slot9.star,
				dbid = slot8,
				advance = slot9.advance,
				fightPoint = slot14,
				isCur = slot14,
				inMeteor = slot14[slot8]
			}
		})
	end)
	Dialog.onCreate(slot0, {
		clickClose = true
	})
end

function slot1.initModel(slot0)
	slot0.cards = gGameModel.role:getIdler("cards")
end

function slot1.onItemChoose(slot0, slot1, slot2, slot3, slot4)
	gGameApp:requestServer("/game/clone/battle/deploy", function (slot0)
		uv1 = "onClose"

		slot1:onClose()
	end, slot4.dbid)
end

function slot1.onSortCardList(slot0, slot1)
	return function (slot0, slot1)
		if slot0.isCur then
			return true
		end

		if slot1.isCur then
			return false
		end

		return slot1.fightPoint < slot0.fightPoint
	end
end

return slot1
