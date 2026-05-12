slot1 = class("CraftBattle", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.craft
slot1.OmitEmpty = true

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

function slot1.isFinal(slot0)
	if string.find(slot0, "pre") then
		return false
	elseif string.find(slot0, "final") then
		return true
	else
		error(string.format("Server gives wrong craft battle round data:%s", slot0))
	end
end

function slot1.getData(slot0)
	uv1 = "getData"
	slot2 = slot0
	slot1 = slot1.getData(slot2)
	uv2 = "isFinal"
	slot1.isFinal = slot2.isFinal(slot0.round)
	slot1.recordResult = slot0.result

	for slot5 in ipairs(slot0.buffs) do
		slot6 = csv.craft.buffs[slot5]
		slot7 = arraytools.hash(slot6.natureTypes)
		slot9 = 0

		if string.find(slot6.attrNum, "%%") then
			slot8 = 1 + tonumber(string.sub(slot6.attrNum, 1, -2)) / 100
		else
			slot9 = tonumber(slot6.attrNum)
		end

		slot10 = game.ATTRDEF_TABLE[slot6.attrType]

		for slot14, slot15 in pairs(slot1.roleOut) do
			slot16 = csv.unit[slot15.roleId]

			if (slot7[0] or slot7[slot16.natureType] or slot7[slot16.natureType2]) and slot15[slot10] then
				slot15[slot10] = slot17 * slot8 + slot9
			end
		end
	end

	return slot1
end

return slot1
