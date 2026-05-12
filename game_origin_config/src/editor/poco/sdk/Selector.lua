slot1 = function (slot0, slot1)
	slot2 = nil
	slot3 = slot0
	slot4 = 1

	while true do
		if string.byte(slot0, slot4) ~= 46 then
			if slot2 and #slot2 > 0 then
				slot3 = table.concat(slot2, ".") .. "." .. string.sub(slot0, slot4)
			end

			break
		end

		slot4 = slot4 + 1

		if not slot2 then
			if not slot1 then
				slot5, slot1 = debug.getlocal(3, 1)
			end

			slot2 = string.split(slot1, ".")
		end

		table.remove(slot2, #slot2)
	end

	return require(slot3)
end(".DefaultMatcher")

function slot2(slot0, slot1)
	for slot5, slot6 in ipairs(slot0) do
		if slot6 == slot1 then
			return true
		end
	end

	return false
end

slot3 = {
	__index = slot3
}

function slot3.new(slot0, slot1, slot2)
	slot3 = {}
	uv6 = "setmetatable"

	setmetatable(slot3, slot6)

	slot3.dumper = slot1

	if not slot2 then
		uv4 = "dumper"
	end

	slot3.matcher = slot4

	return slot3
end

function slot3.getRoot(slot0)
	return slot0.dumper:getRoot()
end

function slot3.select(slot0, slot1, slot2)
	if slot2 == nil then
		slot2 = false
	end

	return slot0:selectImpl(slot1, slot2, slot0:getRoot(), 9999, true, true)
end

function slot3.selectImpl(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot3 == nil then
		return {}
	end

	slot8, slot9 = unpack(slot1)

	if slot8 == ">" or slot8 == "/" then
		slot10 = {
			slot3
		}

		for slot14, slot15 in ipairs(slot9) do
			slot16 = {}

			for slot20, slot21 in ipairs(slot10) do
				slot22 = slot4

				if slot8 == "/" and slot14 ~= 1 then
					slot22 = 1
				end

				slot26 = true
				slot27 = slot21
				_res = slot0:selectImpl(slot15, slot26, slot27, slot22, slot5, false)

				for slot26, slot27 in ipairs(_res) do
					uv28 = "unpack"

					if not slot28(slot16, slot27) then
						table.insert(slot16, slot27)
					end
				end
			end

			slot10 = slot16
		end

		slot7 = slot10
	elseif slot8 == "-" then
		slot10, slot11 = unpack(slot9)
		slot16 = slot3
		slot17 = slot4

		for slot16, slot17 in ipairs(slot0:selectImpl(slot10, slot2, slot16, slot17, slot5, slot6)) do
			slot21 = slot2
			slot22 = slot17:getParent()
			sibling_result = slot0:selectImpl(slot11, slot21, slot22, 1, slot5, slot6)

			for slot21, slot22 in ipairs(sibling_result) do
				uv23 = "unpack"

				if not slot23(slot7, slot22) then
					table.insert(slot7, slot22)
				end
			end
		end
	elseif slot8 == "index" then
		slot10, slot11 = unpack(slot9)
		slot7 = {
			slot0:selectImpl(slot10, slot2, slot3, slot4, slot5, slot6)[slot11 + 1]
		}
	elseif slot8 == "^" then
		slot10, slot11 = unpack(slot9)

		if #slot0:selectImpl(slot10, false, slot3, slot4, slot5, slot6) > 0 and slot12[1]:getParent() ~= nil then
			slot7 = {
				slot13
			}
		end
	else
		slot0:_selectTraverse(slot1, slot3, slot7, slot2, slot4, slot5, slot6)
	end

	return slot7
end

function slot3._selectTraverse(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot6 and not slot2:getAttr("visible") then
		return false
	end

	if slot0.matcher:match(slot1, slot2) and slot7 then
		uv8 = "getAttr"

		if not slot8(slot3, slot2) then
			table.insert(slot3, slot2)
		end

		if not slot4 then
			return true
		end
	end

	if slot5 == 0 then
		return false
	end

	for slot11, slot12 in ipairs(slot2:getChildren()) do
		if slot0:_selectTraverse(slot1, slot12, slot3, slot4, slot5 - 1, slot6, true) then
			return true
		end
	end

	return false
end

return slot3
