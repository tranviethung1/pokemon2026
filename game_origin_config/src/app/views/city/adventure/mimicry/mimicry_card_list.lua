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
slot3 = require("app.views.city.card.embattle.fake_card_list")
slot4 = class("MimicryEmbattleCardList", slot3)
slot4.RESOURCE_FILENAME = "common_battle_card_list.json"
slot4.RESOURCE_BINDING = clone(rawget(slot3, "RESOURCE_BINDING"))

function slot4.onCreate(slot0, slot1, slot2)
	slot0.isQuick = slot1.isQuick
	slot3 = slot1.bossID
	slot0.bossID = slot3
	uv3 = "isQuick"

	slot3.onCreate(slot0, slot1, slot2)

	return slot0
end

function slot4.initAllCards(slot0)
	idlereasy.any({
		slot0.battleCardsData,
		slot0.cards
	}, function (slot0, slot1, slot2)
		uv3 = "getAllData"
		slot3 = slot3:getAllData(slot1, slot2)
		slot4 = {}
		slot5 = slot1.cards or {}
		slot6 = slot1.skins or {}
		uv7 = "getAllData"

		if not slot7.isQuick then
			slot8 = "mimicryBattleCard"
			uv8 = "getAllData"

			if not itertools.isempty(userDefault.getForeverLocalKey(slot8, {})[slot8.bossID] or {}) then
				slot5 = slot7.cards or {}
				slot6 = slot7.skins or {}
			end
		end

		for slot10, slot11 in pairs(slot5) do
			slot13 = csv.mimicry.cards[slot11] and csv.cards[slot12.cardID].unitID

			if slot12 and slot13 and slot3[slot13] then
				if slot6[slot12.cardID] then
					if csv.card_skin[slot6[slot12.cardID]] and slot15.unitIDs then
						slot4[slot10] = slot15.unitIDs[slot12.cardID]
					end
				else
					slot4[slot10] = csv.cards[slot12.cardID].unitID
				end
			end
		end

		slot7 = dataEasy.tryCallFunc
		uv8 = "getAllData"

		slot7(slot8.cardList, "updatePreloadCenterIndex")

		uv7 = "getAllData"
		slot7 = slot7.allCardDatas
		slot7 = slot7.update

		slot7(slot7, slot3)

		uv7 = "getAllData"

		slot7.clientBattleCards:set(slot4, true)
	end)
end

function slot4.getAllData(slot0, slot1, slot2)
	slot3 = itertools.map(slot1, function (slot0, slot1)
		return slot1, slot0
	end)
	slot4 = {}
	slot5 = {}

	for slot9, slot10 in ipairs(slot2) do
		slot13 = gGameModel.cards:find(slot10):read("card_id", "unit_id", "skin_id", "fighting_point", "level", "star", "advance", "created_time").card_id
		slot15 = csv.cards[slot13].megaIndex

		if not slot5[csv.cards[slot13].cardMarkID] then
			slot5[slot14] = {
				star = slot12.star
			}

			if slot15 ~= 0 then
				slot5[slot14].megaStar = slot12.star
			end
		end

		if not slot5[slot14][slot15] then
			slot5[slot14][slot15] = {
				card_id = slot12.card_id,
				fighting_point = slot12.fighting_point
			}
		else
			slot16 = slot5[slot14][slot15]
			slot17 = slot16.fighting_point

			if slot12.fighting_point > (slot16.fighting_point or 0) then
				slot17 = slot12.fighting_point
			end

			slot5[slot14][slot15] = {
				card_id = slot12.card_id,
				fighting_point = slot17
			}
		end

		slot5[slot14].star = math.max(slot12.star, slot5[slot14].star or 0)

		if slot15 ~= 0 then
			slot5[slot14].megaStar = math.max(slot12.star, slot5[slot14].megaStar or 0)
		end
	end

	slot6 = gGameModel.role:getIdler("pokedex"):read()

	for slot10, slot11 in orderCsvPairs(csv.mimicry.cards) do
		slot12 = csv.cards[slot11.cardID]
		slot14 = slot12.megaIndex
		slot15 = false
		slot16 = {}

		if gCardsMarkCsv[slot12.cardMarkID] then
			slot16 = gCardsMarkCsv[slot13].data
		end

		for slot20, slot21 in csvMapPairs(slot16) do
			if csv.cards[slot21].megaIndex == slot14 and slot6[slot21] then
				slot15 = true

				break
			end
		end

		if slot15 then
			slot17 = 0

			if slot5[slot13] and slot5[slot13].star then
				slot17 = slot14 ~= 0 and (slot5[slot13].megaStar or 0) or slot5[slot13].star
			end

			slot4[slot12.unitID] = slot0.limtFunc({
				skin_id = 0,
				card_id = slot11.cardID,
				level = slot11.level,
				star = math.max(slot17, slot11.star),
				advance = slot11.advance,
				csvID = slot10,
				unit_id = slot12.unitID,
				markID = slot13,
				inBattle = slot0:getBattle(slot3[slot11.cardID])
			})
		end
	end

	slot10 = "skins"

	for slot10, slot11 in pairs(gGameModel.role:read(slot10)) do
		for slot15, slot16 in csvMapPairs(csv.card_skin[slot10].unitIDs) do
			if slot4[csv.cards[slot15].unitID] then
				slot18 = clone(slot4[slot17])
				slot18.unit_id = slot16
				slot18.inBattle = slot0:getBattle(slot3[slot16])
				slot18.skin_id = slot10
				slot4[slot16] = slot0.limtFunc(slot18)
			end
		end
	end

	return slot4
end

return slot4
