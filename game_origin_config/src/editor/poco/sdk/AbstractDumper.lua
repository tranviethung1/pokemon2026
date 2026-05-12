slot0 = {
	__index = slot0,
	getRoot = function (slot0)
	end,
	dumpHierarchy = function (slot0, slot1)
	end
}
slot1 = {
	__index = slot1
}

setmetatable(slot1, slot0)

function slot1.dumpHierarchy(slot0, slot1)
	if slot1 == nil then
		slot1 = true
	end

	return slot0:dumpHierarchyImpl(slot0:getRoot(), slot1)
end

function slot1.dumpHierarchyImpl(slot0, slot1, slot2)
	if slot1 == nil then
		return nil
	end

	if slot2 == nil then
		slot2 = true
	end

	slot3 = slot1:enumerateAttrs()
	slot4 = {}
	slot5 = {}

	for slot9, slot10 in ipairs(slot1:getChildren()) do
		if not slot2 or slot10:getAttr("visible") then
			table.insert(slot5, slot0:dumpHierarchyImpl(slot10, slot2))
		end
	end

	if #slot5 > 0 then
		slot4.children = slot5
	end

	slot4.name = slot3.name or slot1:getAttr("name")
	slot4.payload = slot3

	return slot4
end

return slot1
