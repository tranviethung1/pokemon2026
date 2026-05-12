slot0 = require("app.views.city.activity.brave_challenge.adapt")
slot2 = class("BraveChallengeBattle", require("app.models.battle"))
slot2.DefaultGateID = game.GATE_TYPE.braveChallenge

function slot2.getData(slot0)
	uv1 = "getData"
	slot1 = slot1.getData(slot0)
	slot1.floorID = slot0.floorID
	slot1.actions = slot0.actions

	if not slot1.gamemodel_data then
		uv2 = "floorID"
		slot2 = slot2.getGameModelData(slot0)
	end

	slot1.gamemodel_data = slot2
	uv2 = "actions"
	slot1.battleEndUrl = slot2.url("battleEnd")

	return slot1
end

function slot2.getGameModelData(slot0)
	slot1 = {
		cards = {}
	}

	for slot5, slot6 in ipairs(slot0.cards) do
		if slot0.cards_status[slot6] then
			slot1.cards[slot6] = slot0.cards_status[slot6]
		end
	end

	slot1.monsters = {}

	for slot5, slot6 in pairs(slot0.defence_cards) do
		if slot0.monsters_status[slot6] then
			slot1.monsters[slot6] = slot0.monsters_status[slot6]
		end
	end

	return slot1
end

function slot2.getPreDataForEnd(slot0, slot1)
	return {}
end

return slot2
