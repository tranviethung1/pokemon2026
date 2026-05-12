slot0 = require("app.views.city.card.embattle.fake_card_list")
slot1 = class("HellRandomTowerReadyCardList", slot0)
slot1.RESOURCE_FILENAME = "common_battle_card_list.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))

function slot1.onCreate(slot0, slot1, slot2)
	slot0.panelNum = slot1.panelNum
	slot3 = slot1.readyData
	slot0.readyData = slot3
	uv3 = "panelNum"

	slot3.onCreate(slot0, slot1, slot2)

	slot3 = {
		slot0.clientBattleCards,
		slot1.sortSign
	}

	for slot7, slot8 in ipairs(slot0.readyData) do
		table.insert(slot3, slot8.data)
	end

	idlereasy.any(slot3, function ()
		uv1 = "performWithDelay"

		performWithDelay(slot1, function ()
			uv1 = "dataEasy"

			dataEasy.tryCallFunc(slot1.cardList, "filterSortItems", true)
		end, 0)
	end)
end

function slot1.initAllCards(slot0, slot1)
	slot1 = slot1 or csv.hell_random_tower.cards

	idlereasy.any({
		slot0.battleCardsData,
		slot0.cards
	}, function (slot0, slot1, slot2)
		uv3 = "getAllData"
		slot5 = slot1
		uv7 = "dataEasy"
		slot4 = dataEasy.tryCallFunc
		uv5 = "getAllData"

		slot4(slot5.cardList, "updatePreloadCenterIndex")

		uv4 = "getAllData"

		slot4.allCardDatas:update(slot3:getAllData(slot5, slot2, slot7))

		slot4 = {
			[slot10] = slot11
		}
		slot6 = slot1.readyData or {}

		for slot10, slot11 in pairs(slot1.clientBattleCards or {}) do
			if slot3[slot11] then
				-- Nothing
			end
		end

		for slot10, slot11 in pairs(slot6) do
			for slot15, slot16 in pairs(slot11) do
				if slot3[slot16] then
					uv17 = "getAllData"
					slot17.readyData[slot10].data:proxy()[slot15].unitID = slot16
				end
			end
		end

		uv7 = "getAllData"

		slot7.clientBattleCards:set(slot4, true)
	end)
end

function slot1.initItem(slot0, slot1, slot2, slot3, slot4)
	uv5 = "initItem"

	slot5.initItem(slot0, slot1, slot2, slot3, slot4)
	slot2:get("textNote"):visible(slot4.battle > 0)

	if slot4.battle <= math.ceil(slot0.panelNum / 6) then
		slot5:text(gLanguageCsv.inTheTeam)
	else
		slot5:text(gLanguageCsv.stateReady)
	end
end

function slot1.onSortCards(slot0, slot1)
	uv2 = "onSortCards"
	slot2 = slot2.onSortCards(slot0, slot1)

	return function (slot0, slot1)
		if slot0.battle ~= slot1.battle then
			if slot0.battle ~= 0 and slot1.battle ~= 0 then
				return slot0.battle < slot1.battle
			end

			return slot1.battle <= slot0.battle
		end

		uv2 = "battle"

		return slot2(slot0, slot1)
	end
end

return slot1
