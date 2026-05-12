slot0 = class("BuffNodeManager", BuffNodeManager)
AutoChessBattle.BuffNodeManager = slot0

function slot0.trigger(slot0, slot1)
	slot2 = slot0.nodes[slot1]

	if slot0.times[slot1] then
		slot0.times[slot1].value = slot0.times[slot1].value - 1
	end

	return slot2
end
