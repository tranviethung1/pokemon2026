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

slot3 = slot0(".Cocos2dxNode")
slot4 = (_G.cc or require("cc")).Director:getInstance()
slot5 = {
	__index = slot5
}

setmetatable(slot5, slot0(".sdk.AbstractDumper"))

function slot5.getRoot(slot0)
	uv1 = "getWinSize"
	slot2 = slot1
	slot1 = slot1.getWinSize(slot2)
	uv2 = "new"
	uv4 = "getWinSize"

	return slot2:new(slot4:getRunningScene(), slot1.width, slot1.height)
end

return slot5
