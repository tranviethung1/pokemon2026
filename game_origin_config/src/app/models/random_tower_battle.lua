slot1 = class("RandomTowerBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.randomTower

function slot1.getData(slot0)
	uv1 = "getData"
	slot1 = slot1.getData(slot0)
	slot1.actions = slot0.actions

	if not slot1.gamemodel_data then
		uv2 = "actions"
		slot2 = slot2.getGameModelData(slot0)
	end

	slot1.gamemodel_data = slot2

	return slot1
end

function slot1.getGameModelData(slot0)
	return {
		buffs = table.getraw(gGameModel.random_tower:read("buffs")),
		skill_used = table.getraw(gGameModel.random_tower:read("skill_used")),
		enemy_states = table.getraw(gGameModel.random_tower:read("enemy_states")),
		card_states = table.getraw(gGameModel.random_tower:read("card_states")),
		room_info = table.getraw(gGameModel.random_tower:read("room_info"))
	}
end

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

return slot1
