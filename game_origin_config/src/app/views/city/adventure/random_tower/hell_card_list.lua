slot0 = require("app.views.city.card.embattle.fake_card_list")
slot1 = class("HellRandomTowerCardList", slot0)
slot1.RESOURCE_FILENAME = "common_battle_card_list.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))

function slot1.initAllCards(slot0)
	slot2 = itertools.map(slot0.battleCardsData:read(), function (slot0, slot1)
		return slot1, slot0
	end)

	for slot9, slot10 in pairs(gGameModel.hell_random_tower:read("prepare_cards")) do
		slot14 = csv.cards[csv.hell_random_tower.cards[slot9].cardID].unitID

		if slot2[slot9] and slot2[slot9] > 0 then
			-- Nothing
		end
	end

	dataEasy.tryCallFunc(slot0.cardList, "updatePreloadCenterIndex")
	slot0.allCardDatas:update({
		[slot14] = slot0.limtFunc({
			inBattle = 0,
			card_id = slot11.cardID,
			level = slot11.level,
			star = slot11.star,
			advance = slot11.advance,
			csvID = slot9,
			unit_id = slot14,
			markID = slot12.cardMarkID,
			skin_id = slot10
		})
	})
	slot0.clientBattleCards:set({
		[slot2[slot9]] = slot14
	}, true)
end

function slot1.initItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot2:size()
	slot6 = slot4.battle > 0 and 1 or 0

	if slot4.inMeteor then
		slot6 = 1
	end

	bind.extend(slot1, slot2, {
		class = "card_icon",
		props = {
			unitId = slot4.unit_id,
			advance = slot4.advance,
			rarity = slot4.rarity,
			dbid = slot4.dbid,
			star = slot4.star,
			grayState = slot6,
			levelProps = {
				data = slot4.level
			},
			onNode = function (slot0)
				slot0:xy(-4, -4)
			end
		}
	})
	slot2:get("textNote"):visible(slot4.battle == 1)

	if slot4.inMeteor then
		slot7:text(gLanguageCsv.inMeteorites)
		slot7:show()
	end

	uiEasy.addTextEffect1(slot7)
	slot2:get("hpBar"):show():get("bar"):setPercent(slot4.states[1] * 100)
	slot2:get("mpBar"):show():get("bar"):setPercent(slot4.states[2] * 100)

	if slot4.states[1] > 0 then
		slot2:onTouch(functools.partial(slot1.clickCell, slot4))
	else
		slot2:get("deadMask"):show()
	end
end

function slot1.onSortCards(slot0, slot1)
	uv2 = "onSortCards"
	slot2 = slot2.onSortCards(slot0, slot1)

	return function (slot0, slot1)
		slot3 = slot1.states

		if slot0.states[1] <= 0 then
			return false
		end

		if slot3[1] <= 0 then
			return true
		end

		uv4 = "states"

		return slot4(slot0, slot1)
	end
end

return slot1
