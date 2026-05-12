slot2 = {
	__index = slot2,
	comparators = {
		["attr="] = {
			compare = function (slot0, slot1, slot2)
				return slot1 == slot2
			end
		},
		["attr.*="] = {
			compare = function (slot0, slot1, slot2)
				if slot1 == nil or slot2 == nil then
					return false
				end

				return string.match(slot1, slot2) ~= nil
			end
		}
	}
}

function slot2.match(slot0, slot1, slot2)
	slot3, slot4 = unpack(slot1)

	if slot3 == "or" then
		for slot8, slot9 in ipairs(slot4) do
			if slot0:match(slot9, slot2) then
				return true
			end
		end

		return false
	end

	if slot3 == "and" then
		for slot8, slot9 in ipairs(slot4) do
			if not slot0:match(slot9, slot2) then
				return false
			end
		end

		return true
	end

	comparator = slot0.comparators[slot3]

	if comparator ~= nil then
		slot5, slot6 = unpack(slot4)

		return comparator:compare(slot2:getAttr(slot5), slot6)
	end

	return false
end

return slot2
