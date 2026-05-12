slot1 = class("BattleBetBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.battlebet

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

function slot1.getData(slot0)
	uv1 = "DefaultGateID"
	slot0.DefaultGateID = slot1.DefaultGateID

	if slot0.type == 2 then
		slot0.DefaultGateID = game.GATE_TYPE.contestbet
	end

	uv1 = "type"
	slot2 = slot1.getData(slot0).roleOut
	slot3 = csv.cross.battlebet.teams[slot0.left_team]
	slot4 = csv.cross.battlebet.teams[slot0.right_team]

	if slot0.type == 2 then
		slot3 = csv.cross.contestbet.teams[slot0.left_team]
		slot4 = csv.cross.contestbet.teams[slot0.right_team]
	end

	slot5 = slot2[slot3.captainID].cardCsvId
	slot6 = slot2[slot4.captainID].cardCsvId
	slot1.levels = {
		slot2[slot3.captainID].level,
		slot2[6 + slot4.captainID].level
	}
	slot1.names = {
		slot3.name,
		slot4.name
	}
	slot1.logos = {
		slot3.logoID or 1,
		slot4.logoID or 1
	}

	return slot1
end

return slot1
