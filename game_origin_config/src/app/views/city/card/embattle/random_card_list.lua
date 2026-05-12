slot0 = require("app.views.city.card.embattle.embattle_card_list")
slot1 = class("EmbattleCardList", slot0)
slot1.RESOURCE_FILENAME = "common_battle_card_list.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))

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
