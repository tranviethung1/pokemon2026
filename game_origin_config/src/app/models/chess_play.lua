slot0 = class("ChessPlay")

function slot0.ctor(slot0, slot1)
	slot0.game = slot1
end

function slot0.init(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end

	return slot0
end

function slot0.getData(slot0)
	return {
		battleID = slot0.id,
		randSeed = slot0.rand_seed,
		trainer = slot0.trainer,
		level = slot0.level or 1,
		cards = slot0.cards,
		skills = slot0.skills,
		stateSet = slot0.state_set,
		pvpFights = slot0.pvp_fights,
		typ = slot0.type,
		baseID = slot0.base_id,
		failProtect = slot0.fail_protect,
		newbieProtect = slot0.newbie_protect,
		patch = slot0.patch
	}
end

return slot0
