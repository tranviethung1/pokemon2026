slot1 = class("CrossUnionFightBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.crossUnionFight
slot1.OmitEmpty = false

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

function slot1.getData(slot0)
	uv1 = "getData"
	slot1 = slot1.getData(slot0)
	slot1.battleType = slot0.battle_type
	slot1.battleTimes = slot0.battle_times
	slot1.defenceBattleTimes = slot0.defence_battle_times
	slot1.failTimes = slot0.fail_times
	slot1.defenceFailTimes = slot0.defence_fail_times

	return slot1
end

return slot1
