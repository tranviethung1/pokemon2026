slot1 = class("GymLeaderBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.gymLeader

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

return slot1
