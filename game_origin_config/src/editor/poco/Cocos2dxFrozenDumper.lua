function slot0(slot0, slot1)
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
end

slot3 = slot0(".Cocos2dxFrozenNode")
slot4 = (_G.cc or require("cc")).Director:getInstance()
slot5 = {
	__index = slot5
}

setmetatable(slot5, slot0(".sdk.AbstractDumper"))

slot5._nodes_cache = {}

function slot5.getRoot(slot0)
	slot1 = {}
	slot0._nodes_cache = slot1
	uv1 = "_nodes_cache"
	slot2 = slot1
	slot1 = slot1.getWinSize(slot2)
	uv2 = "getWinSize"
	uv4 = "_nodes_cache"

	return slot2:new(slot4:getRunningScene(), slot1.width, slot1.height)
end

function slot5.dumpHierarchyImpl(slot0, slot1, slot2)
	uv3 = "dumpHierarchyImpl"
	slot3 = slot3.dumpHierarchyImpl(slot0, slot1, slot2)

	if slot1:getAttr("_instanceId") ~= nil then
		slot0._nodes_cache[slot4] = slot1
	end

	return slot3
end

function slot5.getCachedNode(slot0, slot1)
	return slot0._nodes_cache[slot1]
end

return slot5
