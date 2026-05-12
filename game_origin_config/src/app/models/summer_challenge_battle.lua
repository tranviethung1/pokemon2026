slot1 = class("SummerChallengeBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.summerChallenge
slot1.MultipGroup = true

function slot1.getData(slot0)
	uv1 = "getData"
	slot1 = slot1.getData(slot0)
	slot1.gateID = slot0.gateID
	slot1.monsterIDs = slot0.monsterIDs
	slot1.actions = slot0.actions
	slot1.choices = slot0.choices

	return slot1
end

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

return slot1
