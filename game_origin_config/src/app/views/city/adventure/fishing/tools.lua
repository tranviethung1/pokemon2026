return {
	getExp = function (slot0, slot1, slot2)
		slot3 = csv.fishing.level[slot0]
		slot4 = 0
		slot5 = 0
		slot6 = 0
		slot7 = 0
		slot8 = 0
		slot9 = 0

		if slot1 ~= nil then
			if slot1[1] ~= nil then
				slot4 = slot1[1] < slot3.lowNum and slot1[1] or slot3.lowNum
				slot7 = slot1[1]
			end

			if slot1[2] ~= nil then
				slot5 = slot1[2] < slot3.middleNum and slot1[2] or slot3.middleNum
				slot8 = slot1[2]
			end

			if slot1[3] ~= nil then
				slot6 = slot1[3] < slot3.highNum and slot1[3] or slot3.highNum
				slot9 = slot1[3]
			end
		end

		if slot3.totalNum < slot7 + slot8 + slot9 then
			slot10 = slot3.totalNum
		end

		slot12 = slot3.lowNum + slot3.middleNum + slot3.highNum + slot3.totalNum + (slot3.targetNum[1] or 0)

		for slot18 = 1, slot0 do
			slot19 = csv.fishing.level[slot18]
			slot14 = slot4 + slot5 + slot6 + slot2 + (slot3.totalNum == 0 and 0 or slot10) + slot19.lowNum + slot19.middleNum + slot19.highNum + slot19.totalNum + (slot19.targetNum[1] or 0)
		end

		return slot13, slot12, slot14
	end
}
