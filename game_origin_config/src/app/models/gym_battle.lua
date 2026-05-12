slot1 = class("GymBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.gym

function slot1.init(slot0, slot1)
	uv2 = "init"

	slot2.init(slot0, slot1)

	slot3 = slot1.gate_id
	uv3 = "csv"
	slot3.MultipGroup = false

	if csv.gym.gate[slot3].deployType == game.DEPLOY_TYPE.WheelType then
		slot0.cards = slot0:transform(slot2.deployNum, slot2.deployCardNumLimit, slot0.cards)

		if slot0.defence_cards then
			slot0.defence_cards = slot0:transform(slot4, slot3, slot0.defence_cards)
		end

		uv5 = "csv"
		slot5.MultipGroup = true
	end

	return slot0
end

function slot1.transform(slot0, slot1, slot2, slot3)
	slot4 = {
		[slot8] = {}
	}

	for slot8 = 1, slot1 do
	end

	for slot8, slot9 in maptools.order_pairs(slot3) do
		slot4[math.ceil(slot8 / 6)][slot8 % 6 == 0 and 6 or slot8 % 6] = slot9
	end

	return slot4
end

function slot1.getPreDataForEnd(slot0, slot1)
	slot2 = {}
	slot3 = {}

	for slot8 = 1, 6 do
		if (slot0.MultipGroup and slot1[1][1] or slot1)[slot8] then
			table.insert(slot3, {
				id = slot8,
				unitId = slot9.roleId,
				level = slot9.level,
				advance = slot9.advance,
				star = slot9.star,
				rarity = csv.unit[slot9.roleId].rarity,
				cardId = slot0.MultipGroup and slot9.cardId
			})
		end
	end

	slot2.cardsInfo = slot3
	slot2.drop = slot0.drop
	slot2.roleInfo = {
		level = gGameModel.role:read("level"),
		level_exp = gGameModel.role:read("level_exp"),
		sum_exp = gGameModel.role:read("sum_exp")
	}
	slot2.dungeonStar = gGameModel.role:read("gate_star")[slot0.gate_id] and slot5.star or 0

	return slot2
end

return slot1
