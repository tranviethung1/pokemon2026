slot0 = {
	{
		attr = "fighting_point",
		name = gLanguageCsv.fighting
	},
	{
		attr = "level",
		name = gLanguageCsv.level
	},
	{
		attr = "rarity",
		name = gLanguageCsv.rarity
	},
	{
		attr = "star",
		name = gLanguageCsv.star
	},
	{
		attr = "getTime",
		name = gLanguageCsv.getTime
	}
}
slot1 = 13
slot2 = cc.load("mvc").ViewBase
slot3 = require("app.views.city.card.embattle.embattle_card_list")
slot4 = class("FakeCardListView", slot3)
slot4.RESOURCE_FILENAME = "common_battle_card_list.json"
slot4.RESOURCE_BINDING = clone(rawget(slot3, "RESOURCE_BINDING"))
slot4.RESOURCE_BINDING.btnPanel = "btnPanel"

function slot4.initItem(slot0, slot1, slot2, slot3, slot4)
	slot2:setName("item" .. slot1:getIdx(slot3))
	bind.extend(slot1, slot2, {
		class = "card_icon",
		props = {
			unitId = slot4.unit_id,
			advance = slot4.advance,
			rarity = slot4.rarity,
			star = slot4.star,
			grayState = slot4.battle > 0 and 1 or 0,
			levelProps = {
				data = slot4.level
			},
			onNode = function (slot0)
				slot0:xy(-4, -4)
			end
		}
	})

	slot5 = slot2:get("textNote")

	slot5:visible(slot4.battle == 1)
	uiEasy.addTextEffect1(slot5)
	slot2:onTouch(functools.partial(slot1.clickCell, slot4))
end

function slot4.onCreate(slot0, slot1, slot2)
	slot0.base = slot1.base
	slot0.battleCardsData = slot1.battleCardsData
	slot0.allCardDatas = slot1.allCardDatas
	slot0.clientBattleCards = slot1.clientBattleCards
	slot0.limtFunc = handler(slot0.base, slot1.limtFunc)
	slot0.isMovePanelExist = handler(slot0.base, slot1.isMovePanelExist)
	slot0.createMovePanel = handler(slot0.base, slot1.createMovePanel)
	slot0.deleteMovingItem = handler(slot0.base, slot1.deleteMovingItem)
	slot0.moveMovePanel = handler(slot0.base, slot1.moveMovePanel)
	slot0.onCardClick = handler(slot0.base, slot1.onCardClick)
	slot0.moveEndMovePanel = handler(slot0.base, slot1.moveEndMovePanel)

	slot0:initModel()
	slot0:initAllCards()
	slot0:adaptNode(slot2)
	slot0:initFilterBtn()
	idlereasy.when(slot0.clientBattleCards, function (slot0, slot1)
		uv3 = "performWithDelay"

		performWithDelay(slot3, function ()
			uv1 = "dataEasy"

			dataEasy.tryCallFunc(slot1.cardList, "filterSortItems", true)
		end, 0)
	end)

	return slot0
end

function slot4.onCardItemTouch(slot0, slot1, slot2, slot3)
	if slot3.name == "began" then
		slot0.moved = false
		slot0.touchBeganPos = slot3

		slot0.deleteMovingItem()
	elseif slot3.name == "moved" then
		slot4 = math.abs(slot3.x - slot0.touchBeganPos.x)
		slot5 = math.abs(slot3.y - slot0.touchBeganPos.y)

		if not slot0.moved and not slot0.isMovePanelExist() and (ui.TOUCH_MOVED_THRESHOLD <= slot4 or ui.TOUCH_MOVED_THRESHOLD <= slot5) then
			if slot5 > slot4 * 0.7 then
				slot0.createMovePanel(slot0.allCardDatas:atproxy(slot2.unit_id))
			end

			slot0.moved = true
		end

		slot0.cardList:setTouchEnabled(not slot0.isMovePanelExist())
		slot0.moveMovePanel(slot3)
	elseif slot3.name == "ended" or slot3.name == "cancelled" then
		if slot0.isMovePanelExist() == false and slot0.moved == false then
			slot0.onCardClick(slot2, true)

			return
		end

		slot0.moveEndMovePanel(slot2)
	end
end

function slot4.initAllCards(slot0)
	idlereasy.any({
		slot0.battleCardsData,
		slot0.cards
	}, function (slot0, slot1, slot2)
		for slot8, slot9 in orderCsvPairs(csv.mimicry.cards) do
			uv13 = "itertools"
			slot15 = csv.cards[slot9.cardID].unitID
			uv15 = "itertools"
		end

		slot5 = dataEasy.tryCallFunc
		uv6 = "itertools"

		slot5(slot6.cardList, "updatePreloadCenterIndex")

		uv5 = "itertools"
		slot5 = slot5.allCardDatas
		slot5 = slot5.update

		slot5(slot5, {
			[slot10.unitID] = slot13.limtFunc({
				skin_id = 0,
				card_id = slot9.cardID,
				level = slot9.level,
				star = slot9.star,
				advance = slot9.advance,
				csvID = slot8,
				unit_id = slot15,
				markID = slot10.cardMarkID,
				inBattle = slot15:getBattle(itertools.map(slot1, function (slot0, slot1)
					return slot1, slot0
				end)[slot9.cardID])
			})
		})

		uv5 = "itertools"

		slot5.clientBattleCards:set({}, true)
	end)
end

function slot4.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if slot0.battle ~= slot1.battle then
			return slot1.battle < slot0.battle
		end

		if slot0.rarity ~= slot1.rarity then
			return slot1.rarity < slot0.rarity
		end

		if slot0.star ~= slot1.star then
			return slot1.star < slot0.star
		end

		if slot0.skin_id ~= slot1.skin_id then
			return slot1.skin_id < slot0.skin_id
		end

		if slot0.level ~= slot1.level then
			return slot1.level < slot0.level
		end

		if slot0.advance ~= slot1.advance then
			return slot1.advance < slot0.advance
		end

		return slot0.card_id < slot1.card_id
	end
end

return slot4
