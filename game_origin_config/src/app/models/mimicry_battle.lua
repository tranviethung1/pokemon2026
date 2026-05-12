slot1 = class("MimicryBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.mimicry

function slot1.getData(slot0)
	uv1 = "getData"
	slot1 = slot1.getData(slot0)
	slot1.actions = slot0.actions
	slot1.boss_hp_threshold = slot0.boss_hp_threshold
	slot1.buff_ids = slot0.buff_ids
	slot1.boss_id = slot0.boss_id
	slot1.boss_limit_skills = slot0.boss_limit_skills

	return slot1
end

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

return slot1
