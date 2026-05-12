slot0 = 13
slot1 = require("app.views.city.card.embattle.embattle_card_list")
slot2 = class("EmbattleCardList", slot1)
slot2.RESOURCE_FILENAME = "common_battle_card_list.json"
slot2.RESOURCE_BINDING = clone(rawget(slot1, "RESOURCE_BINDING"))

function slot2.initItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot4.battle > 0 and 1 or 0

	if slot4.inMeteor then
		slot5 = 1
	end

	bind.extend(slot1, slot2, {
		class = "card_icon",
		props = {
			unitId = slot4.unit_id,
			advance = slot4.advance,
			rarity = slot4.rarity,
			star = slot4.star,
			dbid = slot4.dbid,
			grayState = slot5,
			levelProps = {
				data = slot4.level
			},
			onNode = function (slot0)
				slot0:xy(-2, -2)
			end
		}
	})

	if slot4.battle >= 1 then
		slot2:get("textNote"):show()
	else
		slot2:get("textNote"):hide()
	end

	if slot4.inMeteor then
		slot2:get("textNote"):text(gLanguageCsv.inMeteorites)
		slot2:get("textNote"):show()
	end

	uiEasy.addTextEffect1(slot2:get("textNote"))
	slot2:onTouch(functools.partial(slot1.clickCell, slot4))
end

function slot2.initAllCards(slot0)
	idlereasy.any({
		slot0.battleCardsData,
		slot0.cards
	}, function (slot0, slot1, slot2)
		slot3 = {
			{},
			{},
			{}
		}
		slot4 = {}

		for slot8, slot9 in pairs(slot1) do
			for slot13, slot14 in pairs(slot9) do
				if gGameModel.cards:find(slot14.dbid) then
					slot17 = slot15
					slot16 = slot15.read(slot17, "card_id", "skin_id", "fighting_point", "level", "star", "advance", "created_time")
					uv17 = "pairs"
					uv26 = "pairs"

					if slot17.limtFunc(slot14.dbid, slot16.card_id, slot16.skin_id, slot16.fighting_point, slot16.level, slot16.star, slot16.advance, slot16.created_time, slot26:getBattle(slot13)) then
						slot3[slot8] = slot3[slot8] or {}
						slot3[slot8][slot13] = slot14
						slot4[slot14.dbid] = 1
					end
				else
					slot3[slot8] = slot3[slot8] or {}
					slot3[slot8][slot13] = slot14
					slot4[slot14.dbid] = 1
				end
			end
		end

		slot6 = nil

		for slot10, slot11 in ipairs(slot2) do
			slot12 = gGameModel.cards:find(slot11)
			slot14 = slot12
			slot13 = slot12.read(slot14, "card_id", "skin_id", "fighting_point", "level", "star", "advance", "created_time")
			uv14 = "pairs"
			slot15 = slot11
			uv23 = "pairs"
			uv15 = "pairs"

			dataEasy.tryCallFunc(slot15.cardList, "updatePreloadCenterIndex")

			if slot10 == #slot2 then
				uv14 = "pairs"
				slot14 = slot14.allCardDatas
				slot14 = slot14.update

				slot14(slot14, {
					[slot11] = slot14.limtFunc(slot15, slot13.card_id, slot13.skin_id, slot13.fighting_point, slot13.level, slot13.star, slot13.advance, slot13.created_time, slot23:getBattle(slot4[slot11]))
				})

				uv14 = "pairs"

				slot14.clientBattleCards:set(slot3, true)
			end
		end
	end)
end

return slot2
