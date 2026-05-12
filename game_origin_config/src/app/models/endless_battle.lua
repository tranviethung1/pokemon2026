slot1 = class("EndlessBattle", require("app.models.battle"))

function slot1.getData(slot0)
	uv1 = "getData"
	slot1 = slot1.getData(slot0)
	slot1.actions = slot0.actions

	return slot1
end

function slot1.sceneConf(slot0, slot1)
	return csv.endless_tower_scene[slot1]
end

function slot1.getPreDataForEnd(slot0, slot1)
	return {
		isFirst = gGameModel.role:read("endless_tower_max_gate") and slot2 < slot0.gate_id or false
	}
end

return slot1
