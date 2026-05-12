slot0 = {}
globals.stat = slot0

function slot1(slot0, slot1)
	return slot0
end

slot2 = nil
slot0.summator = {
	__index = function (slot0, slot1)
		if type(slot1) == "number" then
			if slot1 < slot0.__minKey then
				return 0
			end

			return rawget(slot0, slot0.__maxKey)
		end

		uv2 = "type"

		return slot2[slot1]
	end,
	__newindex = function (slot0, slot1, slot2)
		error("you could not write in sum table " .. tostring(slot1))
	end,
	new = function (slot0)
		uv3 = "itertools"
		uv4 = "itertools"

		for slot8 = slot1, slot2 do
		end

		uv7 = "min"

		return setmetatable({
			__minKey = itertools.min(slot0, 0) or 0,
			__maxKey = itertools.max(slot0, slot4) or 0,
			[slot8] = slot3 + (slot0[slot8] or 0)
		}, slot7)
	end,
	sumRange = function (slot0, slot1, slot2)
		return slot0[slot2 or slot0.__maxKey] - slot0[slot1 - 1]
	end
}
