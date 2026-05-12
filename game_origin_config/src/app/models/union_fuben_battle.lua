slot1 = class("UnionFubenBattle", require("app.models.battle"))

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

function slot1.getData(slot0)
	uv1 = "getData"
	slot1 = slot1.getData(slot0)
	slot1.hpMax = slot0.hpMax
	slot1.damage = slot0.damage
	slot1.actions = slot0.actions

	return slot1
end

return slot1
