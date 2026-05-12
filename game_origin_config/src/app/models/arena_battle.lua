slot1 = class("ArenaBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.arena

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

return slot1
