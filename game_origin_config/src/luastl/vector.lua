slot0 = math.abs
slot1 = isRef
slot3 = class("CVector", require("luastl.stlbase"))
globals.CVector = slot3

function slot3.ctor(slot0)
	uv1 = "ctor"

	slot1.ctor(slot0)
	slot0:clear()
end

function slot3.clear(slot0)
	if slot0.m then
		for slot4, slot5 in ipairs(slot0.m) do
			uv6 = "m"

			if slot6(slot5) then
				slot5:autorelease()
			end
		end
	end

	slot0.m = {}
end

function slot3.push_back(slot0, slot1)
	uv2 = "retain"

	if slot2(slot1) then
		slot1:retain()
	end

	table.insert(slot0.m, slot1)
end

function slot3.pop_back(slot0)
	slot2 = slot0
	uv2 = "back"

	if slot2(slot0.back(slot2)) then
		slot1:autorelease()
	end

	return table.remove(slot0.m)
end

function slot3.push_front(slot0, slot1)
	uv2 = "retain"

	if slot2(slot1) then
		slot1:retain()
	end

	table.insert(slot0.m, 1, slot1)
end

function slot3.pop_front(slot0)
	uv1 = "m"

	if slot1(slot0.m[1]) then
		slot0.m[1]:autorelease()
	end

	return table.remove(slot0.m, 1)
end

function slot3.find(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.m) do
		if slot6 == slot1 then
			return slot5
		end
	end
end

function slot3.at(slot0, slot1)
	return slot0.m[slot1]
end

function slot3.front(slot0)
	if slot0:empty() then
		return nil
	end

	return slot0.m[1]
end

function slot3.back(slot0)
	if slot0:empty() then
		return nil
	end

	return slot0.m[slot0:size()]
end

function slot3.size(slot0)
	return table.length(slot0.m)
end

function slot3.empty(slot0)
	return table.length(slot0.m) == 0
end

function slot3.insert(slot0, slot1, slot2)
	uv3 = "retain"

	if slot3(slot2) then
		slot2:retain()
	end

	table.insert(slot0.m, slot1, slot2)
end

function slot3.update(slot0, slot1, slot2)
	slot0.m[slot1] = slot2
end

function slot3.sort(slot0, slot1)
	table.sort(slot0.m, slot1)
end

function slot3.erase(slot0, slot1)
	if slot1 < 1 or slot0:size() < slot1 then
		return false
	end

	slot3 = slot0.m
	uv3 = "size"

	if slot3(table.remove(slot3, slot1)) then
		slot2:autorelease()
	end

	return slot2
end

function slot3.eraseList(slot0, slot1)
	if slot1 == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot6 <= slot0:size() and slot0.m[slot6] then
			uv7 = "pairs"

			if slot7(slot0.m[slot6]) then
				slot0.m[slot6]:autorelease()
			end

			slot0.m[slot6] = nil
		end
	end

	slot2 = 1

	for slot6, slot7 in pairs(slot0.m) do
		if slot7 ~= nil then
			slot0.m[slot2] = slot7

			if slot6 ~= slot2 then
				slot0.m[slot6] = nil
			end

			slot2 = slot2 + 1
		end
	end
end

function slot3.assign(slot0, slot1)
	if type(slot1) ~= "table" then
		error("CVector:assign need table")

		return
	end

	slot0:clear()

	for slot5, slot6 in pairs(slot1) do
		uv7 = "type"

		if slot7(slot6) then
			slot6:retain()
		end

		table.insert(slot0.m, slot6)
	end
end

function slot3.pairs(slot0)
	return ipairs(slot0.m)
end

function slot3.ipairs(slot0)
	return ipairs(slot0.m)
end

function slot3.data(slot0)
	return slot0.m
end

function slot3.equal(slot0, slot1)
	if slot0:size() ~= slot1:size() then
		return false
	end

	for slot5, slot6 in ipairs(slot0.m) do
		if slot6 ~= slot1.m[slot5] then
			return false
		end
	end

	return true
end

function slot3.slice(slot0, slot1, slot2, slot3)
	uv4 = "new"

	if slot0:empty() or slot3 == 0 then
		return slot4.new()
	end

	if slot3 == nil then
		slot3 = slot2 - slot1 >= 0 and 1 or -1
	end

	if (slot2 - slot1) * slot3 < 0 then
		uv6 = "empty"
		slot6 = slot0:size() - slot6(slot2 - slot1)

		if slot1 * (slot3 > 0 and slot1 + slot6 or slot1 - slot6) < 0 then
			slot2 = slot2 + (slot3 > 0 and 1 or -1)
		end
	end

	for slot9 = slot1, slot2, slot3 do
		if slot9 < 0 then
			slot4:push_back(slot0.m[1 + slot9 % slot5])
		elseif slot9 > 0 then
			slot4:push_back(slot0.m[1 + (slot9 - 1) % slot5])
		end
	end

	return slot4
end

return slot3
