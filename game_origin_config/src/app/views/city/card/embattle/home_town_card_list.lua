slot0 = 13
slot1 = game.TOWN_CARD_STATE
slot2 = {
	[slot1.REST] = gLanguageCsv.townHomeCardStatus02,
	[slot1.ALCHEMYFACTORY] = gLanguageCsv.townRestWorking,
	[slot1.PRODUCTION_THREE] = gLanguageCsv.townRestWorking,
	[slot1.PRODUCTION_FOUR] = gLanguageCsv.townRestWorking,
	[slot1.FINANCIAL_CENTER] = gLanguageCsv.townRestWorking,
	[slot1.ADVENTURE] = gLanguageCsv.townRestAdventure,
	[slot1.ANENERGIA] = gLanguageCsv.townCardEnergyNotEnough
}
slot3 = require("app.views.city.card.embattle.embattle_card_list")
slot4 = class("HomeTownEmbattleCardList", slot3)
slot4.RESOURCE_FILENAME = "common_battle_card_list.json"
slot4.RESOURCE_BINDING = clone(rawget(slot3, "RESOURCE_BINDING"))
slot4.RESOURCE_BINDING.item = nil
slot4.RESOURCE_BINDING.itemTown = "item"

function slot4.initItem(slot0, slot1, slot2, slot3, slot4)
	if (slot4.battle > 0 and 1 or 0) == 0 then
		slot5 = slot4.status > 0 and 1 or 0
	end

	bind.extend(slot1, slot2, {
		class = "card_icon",
		props = {
			unitId = slot4.unit_id,
			advance = slot4.advance,
			dbid = slot4.dbid,
			rarity = slot4.rarity,
			star = slot4.star,
			grayState = slot5,
			levelProps = {
				data = slot4.level
			},
			onNode = function (slot0)
				slot0:xy(-2, -2)
			end
		}
	})

	slot6 = slot4.energy

	if slot4.battle == 1 then
		slot2:get("textNote"):show()
		slot2:get("textNote"):text(gLanguageCsv.onlineFightBanIsPick)
	elseif slot4.status > 0 then
		slot2:get("textNote"):show()

		slot9 = "textNote"
		uv9 = "battle"

		slot2:get(slot9):text(slot9[slot4.status])
	else
		slot7 = 0

		if slot4.energy_refresh_time then
			slot6 = math.min(slot4.energy + math.max(math.floor((time.getTime() - slot4.energy_refresh_time) / 3600 * gCommonConfigCsv.townHomeEnergyRecovery), 0), slot4.max_energy)
		end

		slot2:get("textNote"):hide()
	end

	slot2:get("imgIcon"):texture("common/icon/icon_jl.png")
	uiEasy.addTextEffect1(slot2:get("textNote"))
	slot2:get("txtIcon"):text(string.format("%d/%d", slot6, slot4.max_energy))

	if slot4.status == 0 then
		slot2:onTouch(functools.partial(slot1.clickCell, slot4))
	end
end

function slot4.onFilterCards(slot0, slot1)
	return function (slot0, slot1)
		return true, slot0
	end
end

function slot4.onSortCards(slot0, slot1)
	uv2 = "onSortCards"
	slot2 = slot2.onSortCards(slot0, slot1)

	return function (slot0, slot1)
		if slot0.battle ~= slot1.battle then
			return slot1.battle < slot0.battle
		end

		if slot0.status ~= slot1.status then
			if slot0.status ~= 0 and slot1.status ~= 0 then
				return slot1.status < slot0.status
			else
				return slot0.status < slot1.status
			end
		end

		if slot0.town_skill_type ~= slot1.town_skill_type then
			return slot1.town_skill_type < slot0.town_skill_type
		end

		uv2 = "battle"

		return slot2(slot0, slot1)
	end
end

function slot4.getBattle(slot0, slot1)
	if slot1 and slot1 ~= 0 then
		return slot1 <= 6 and 1 or 2
	else
		return 0
	end
end

function slot4.adaptNode(slot0)
	slot0.cardList:size(cc.size(2000, slot0.cardList:size().height))
	slot0.cardList:x(slot0.cardList:x() - 80)
	slot0.cardList:y(slot0.cardList:y() + 10)
end

function slot4.initFilterBtn(slot0)
	slot1 = slot0.btnPanel
	slot1 = slot1.hide

	slot1(slot1)

	uv1 = "btnPanel"

	slot1.initFilterBtn(slot0)
end

function slot4.initAllCards(slot0)
	idlereasy.any({
		slot0.cards
	}, function (slot0, slot1)
		slot3 = nil

		for slot7, slot8 in ipairs(slot1) do
			slot9 = gGameModel.cards:find(slot8)
			slot11 = slot9
			slot10 = slot9.read(slot11, "card_id", "skin_id", "fighting_point", "level", "star", "advance", "created_time")
			uv11 = "ipairs"
			slot12 = slot8
			uv12 = "ipairs"

			dataEasy.tryCallFunc(slot12.cardList, "updatePreloadCenterIndex")

			if slot7 == #slot1 then
				uv11 = "ipairs"

				slot11.allCardDatas:update({
					[slot8] = slot11.limtFunc(slot12, slot10.card_id, slot10.skin_id, slot10.fighting_point, slot10.level, slot10.star, slot10.advance, slot10.created_time, 0)
				})
			end
		end
	end)
end

return slot4
