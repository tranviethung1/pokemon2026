slot1 = class("FriendBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.friendFight

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

return slot1
