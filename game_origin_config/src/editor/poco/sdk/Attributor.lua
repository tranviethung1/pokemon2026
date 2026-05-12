slot0 = {
	__index = slot0,
	getAttr = function (slot0, slot1, slot2)
		slot3 = slot1

		if slot1.__isPocoNodeWrapper__ == nil then
			slot3 = slot1[1]
		end

		return slot3:getAttr(slot2)
	end,
	setAttr = function (slot0, slot1, slot2, slot3)
		slot4 = slot1

		if slot1.__isPocoNodeWrapper__ == nil then
			slot4 = slot1[1]
		end

		slot4:setAttr(slot2, slot3)
	end
}

return slot0
