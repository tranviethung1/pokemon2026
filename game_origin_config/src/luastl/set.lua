slot0 = class("CSet", require("luastl.map"))
globals.CSet = slot0

function slot0.insert(slot0, slot1)
	return CMap.insert(slot0, slot1, true)
end

function slot0.find(slot0, slot1, slot2)
	return CMap.find(slot0, slot1, false)
end

function slot0.equal(slot0, slot1)
	return CMap.equal(slot0, slot1)
end

return slot0
