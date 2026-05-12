slot0 = 13
slot1 = require("app.views.city.card.embattle.embattle_card_list")
slot2 = class("EmbattleCardList3", slot1)
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
			cardId = slot4.card_id,
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

	if slot4.battle == 0 then
		slot2:get("textNote"):hide()
	else
		slot2:get("textNote"):show()
		slot2:get("textNote"):text(gLanguageCsv.team .. gLanguageCsv["symbolNumber" .. slot4.battle])
	end

	if slot4.inMeteor then
		slot2:get("textNote"):show()
		slot2:get("textNote"):text(gLanguageCsv.inMeteor)
	end

	uiEasy.addTextEffect1(slot2:get("textNote"))
	slot2:onTouch(functools.partial(slot1.clickCell, slot4))
end

function slot2.onSortCards(slot0, slot1)
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

function slot2.getBattle(slot0, slot1)
	if slot1 and slot1 ~= 0 then
		return math.ceil(slot1 / 6)
	else
		return 0
	end
end

return slot2
