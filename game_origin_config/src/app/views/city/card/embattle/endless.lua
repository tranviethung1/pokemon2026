slot0 = require("app.views.city.card.embattle.base")
slot1 = class("CardEmbattleEndLessView", slot0)
slot1.RESOURCE_FILENAME = "card_embattle.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))

function slot1.initParams(slot0, slot1)
	uv2 = "initParams"

	slot2.initParams(slot0, slot1)

	slot0.limitInfo = slot1.limitInfo or {}
end

function slot1.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot10, slot11 = csvNext(slot0.limitInfo)
	slot12 = itertools.map(slot11 or {}, function (slot0, slot1)
		return slot1, 1
	end)
	slot14 = csv.unit[csv.cards[slot2].unitID]

	if not slot10 or slot10 > 2 and slot10 < 7 or slot10 == 1 and (slot12[slot14.natureType] or slot12[slot14.natureType2]) or slot10 == 2 and not slot12[slot14.natureType] and not slot12[slot14.natureType2] then
		uv15 = "csvNext"

		return slot15.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	else
		return nil
	end
end

return slot1
