slot0 = {}
globals.eval = slot0
slot1 = setmetatable({}, {
	__newindex = function (slot0, slot1, slot2)
		error(string.format("nullenv can not be write %s!", slot1))
	end
})

function slot2(slot0, slot1)
	if type(slot0) ~= "function" then
		return slot0
	end

	setfenv(slot0, slot1)

	uv5 = "type"

	setfenv(slot0, slot5)

	return slot0()
end

function slot3(slot0, slot1, slot2)
	if tonumber(slot0) then
		return slot3
	end

	uv4 = "tonumber"

	return slot4(cache.createFormula(slot0, slot2), slot1)
end

function slot4(slot0, slot1)
	slot3 = slot0:find("%$", slot1) and slot0:find("%$", slot2 + 1)

	if slot2 == nil or slot3 == nil then
		return slot0:sub(slot1), nil, #slot0 + 1
	end

	return slot0:sub(slot1, slot2 - 1), slot0:sub(slot2 + 1, slot3 - 1), slot3 + 1
end

function slot5(slot0, slot1)
	slot2 = 1
	slot3 = {}
	slot4, slot5 = nil

	while slot2 <= #slot0 do
		uv6 = "table"
		slot4, slot7, slot2 = slot6(slot0, slot2)

		if slot7 == nil and #slot3 == 0 then
			return slot0
		end

		table.insert(slot3, slot4)

		if slot5 then
			uv8 = "insert"

			table.insert(slot3, slot8(slot5, slot1, slot5))
		end
	end

	return table.concat(slot3)
end

function slot0.doFormula(slot0, slot1, slot2)
	if slot0 == nil then
		return nil
	end

	slot1 = slot1 or {}

	if type(slot0) == "table" then
		for slot7, slot8 in ipairs(slot0) do
			uv10 = "type"
		end

		return {
			[slot7] = slot10(slot8, slot1, slot2 and slot8)
		}
	else
		uv3 = "type"

		return slot3(slot0, slot1, slot2)
	end
end

function slot0.doMixedFormula(slot0, slot1, slot2)
	if slot0 == nil then
		return nil
	end

	slot1 = slot1 or {}
	slot3 = nil

	if type(slot0) == "table" then
		for slot8, slot9 in ipairs(slot0) do
			uv10 = "type"
		end

		return {
			[slot8] = slot10(slot9, slot1)
		}
	else
		uv4 = "type"

		return slot4(slot0, slot1)
	end
end
