slot1 = class("UnionFightBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.unionFight
slot1.OmitEmpty = false

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

return slot1
