slot0 = class("FramePre", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.singleCallCache = {}
	slot0.keysCache = {}
end

function slot0.onNewBattleRound(slot0, slot1)
end

function slot0.onClose(slot0)
end

function slot0.onUpdateOver(slot0)
	slot0.singleCallCache = {}
end

function slot0.onSingleCallInFrame(slot0, slot1, slot2, slot3, slot4)
	if not slot0.singleCallCache[slot1] then
		slot0.singleCallCache[slot1] = {}
	end

	if table.length(slot0.singleCallCache[slot1]) > 0 then
		slot5 = nil

		for slot9, slot10 in ipairs(slot0.singleCallCache[slot1]) do
			slot11 = true

			for slot15, slot16 in ipairs(slot2) do
				if not (slot11 and slot3(slot4[slot16], slot10[slot16], slot16)) then
					break
				end
			end

			if slot11 then
				return false
			end
		end
	end

	table.insert(slot0.singleCallCache[slot1], slot4)

	return true
end

function slot0.onFrameOnceEffect(slot0, slot1)
	if not slot0.keysCache.onceEffect then
		slot0.keysCache.onceEffect = itertools.keys(slot1)
	end

	if slot0:onSingleCallInFrame("onceEffect", slot0.keysCache.onceEffect, function (slot0, slot1, slot2)
		if slot2 == "offsetPos" then
			return slot0.x == slot1.x and slot0.y == slot1.y
		elseif (slot2 == "delay" or slot2 == "lifetime") and slot1 == nil and slot0 == 0 then
			return true
		end

		return slot0 == slot1
	end, slot1) then
		slot0.parent:onEventEffect(nil, "onceEffect", slot1)
	end
end

return slot0
