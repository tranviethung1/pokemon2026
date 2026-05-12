function battleCsv.getFixedOrPercent(slot0)
	slot1 = 0
	slot2 = 0

	if slot0 then
		if string.find(slot0, "%%") then
			slot2 = tonumber(string.sub(slot0, 1, slot3 - 1)) / 100
		else
			slot1 = slot0
		end
	end

	return slot1, slot2
end

function battleCsv.hasBuffGroup(slot0, slot1)
	if slot0 then
		for slot5, slot6 in ipairs(slot0) do
			if slot6[slot1] then
				return true, slot5
			end
		end
	end

	return false, nil
end
