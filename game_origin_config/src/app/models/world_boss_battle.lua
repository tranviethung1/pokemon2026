slot1 = class("WorldBossBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.worldBoss

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

function slot1.getData(slot0)
	uv1 = "getData"
	slot1 = slot1.getData(slot0)
	slot1.boss_damage_max = gGameModel.daily_record:read("boss_damage_max")
	slot1.actions = slot0.actions
	slot1.activityID = slot0.activityID

	return slot1
end

function slot1.getLimitDamage(slot0)
	for slot5, slot6 in pairs(slot0.card_attrs) do
		slot1 = 0 + slot6.fighting_point
	end

	return slot1 * gCommonConfigCsv.worldBossMaxDamageMultiple
end

return slot1
