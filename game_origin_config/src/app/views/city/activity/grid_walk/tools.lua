slot0 = {
	MOVE_TIME = 0.6,
	HISTORY_MAX = 6,
	BADGE_ID = 8102,
	MAP = {
		{
			1,
			9
		},
		{
			2,
			9
		},
		{
			3,
			9
		},
		{
			4,
			9
		},
		{
			4,
			10
		},
		{
			4,
			11
		},
		{
			5,
			11
		},
		{
			6,
			11
		},
		{
			7,
			11
		},
		{
			8,
			11
		},
		{
			9,
			11
		},
		{
			10,
			11
		},
		{
			11,
			11
		},
		{
			12,
			11
		},
		{
			12,
			10
		},
		{
			12,
			9
		},
		{
			12,
			8
		},
		{
			11,
			8
		},
		{
			10,
			8
		},
		{
			9,
			8
		},
		{
			9,
			7
		},
		{
			9,
			6
		},
		{
			9,
			5
		},
		{
			10,
			5
		},
		{
			11,
			5
		},
		{
			12,
			5
		},
		{
			12,
			4
		},
		{
			12,
			3
		},
		{
			12,
			2
		},
		{
			11,
			2
		},
		{
			10,
			2
		},
		{
			9,
			2
		},
		{
			9,
			1
		},
		{
			8,
			1
		},
		{
			7,
			1
		},
		{
			6,
			1
		},
		{
			5,
			1
		},
		{
			4,
			1
		},
		{
			3,
			1
		},
		{
			2,
			1
		},
		{
			1,
			1
		},
		{
			1,
			2
		},
		{
			1,
			3
		},
		{
			2,
			3
		},
		{
			3,
			3
		},
		{
			4,
			3
		},
		{
			4,
			4
		},
		{
			4,
			5
		},
		{
			3,
			5
		},
		{
			2,
			5
		},
		{
			1,
			5
		},
		{
			1,
			6
		},
		{
			1,
			7
		},
		{
			1,
			8
		}
	},
	EVENTS = {
		reduce = 4,
		shop = 6,
		jump = 5,
		increase = 3,
		goodLuck = 1,
		treasures = 99,
		badLuck = 2
	},
	ITEMS = {
		medalDice = 8114,
		randomCard = 8116,
		normanlDice = 8112,
		strangeDice = 8113,
		steeringCard = 8117,
		voucher = 8111,
		sprintCard = 8115
	}
}
slot1 = 322
slot2 = 380
slot0.DICE_ID = {
	slot0.ITEMS.normanlDice,
	slot0.ITEMS.strangeDice,
	slot0.ITEMS.medalDice
}
slot0.CARD_ID = {
	slot0.ITEMS.sprintCard,
	slot0.ITEMS.randomCard,
	slot0.ITEMS.steeringCard
}
slot0.CARDSBAG_ID = {
	slot0.ITEMS.sprintCard,
	slot0.ITEMS.randomCard,
	slot0.ITEMS.steeringCard,
	slot0.ITEMS.voucher
}

function slot0.getCfgByIndexFromMap(slot0, slot1)
	for slot5, slot6 in csvPairs(csv.yunying.grid_walk_map) do
		if slot0 == slot6.index and slot1 == slot6.huodongID then
			return slot6, slot5
		end
	end
end

function slot0.getCfgByEventFromEvents(slot0, slot1)
	for slot5, slot6 in csvPairs(csv.yunying.grid_walk_events) do
		if slot0 == slot6.type and slot1 == slot6.huodongID then
			return slot6, slot5
		end
	end
end

function slot0.getMapPos(slot0)
	slot1 = {}
	uv3 = "ipairs"

	for slot5, slot6 in ipairs(slot3.MAP) do
		uv7 = "MAP"
		slot8 = slot0.width / 2
		uv8 = "width"

		table.insert(slot1, {
			slot7 + slot6[1] * slot0.width - slot8,
			slot8 + slot6[2] * slot0.height - slot0.height / 2
		})
	end

	return slot1
end

function slot0.getNextTowardsUp(slot0, slot1)
	uv2 = "MAP"
	slot2 = slot2.MAP[slot0]
	slot3 = slot0 + 1 > 54 and slot0 + 1 - 54 or slot0 + 1

	if slot1 == -1 then
		slot3 = slot0 - 1 < 1 and slot0 - 1 + 54 or slot0 - 1
	end

	uv4 = "MAP"
	slot4 = slot4.MAP[slot3]

	return {
		slot4[1] - slot2[1],
		slot4[2] - slot2[2]
	}
end

function slot0.getTowardsUp(slot0, slot1)
	uv2 = "MAP"
	slot2 = slot2.MAP[slot0]

	if slot1 == 1 then
		for slot6 = slot0 + 1, math.huge do
			uv8 = "MAP"

			if slot2[1] ~= slot8.MAP[slot6 > 54 and slot6 - 54 or slot6][1] then
				return slot2[1] < slot8[1] and 1 or -1
			end
		end
	else
		for slot6 = slot0 - 1, -54, -1 do
			uv8 = "MAP"

			if slot2[1] ~= slot8.MAP[slot6 < 1 and slot6 + 54 or slot6][1] then
				return slot2[1] < slot8[1] and 1 or -1
			end
		end
	end
end

function slot0.getOutPosByIndex(slot0)
	uv1 = "MAP"
	uv3 = "MAP"
	uv5 = "MAP"

	if slot1.MAP[slot0][1] == slot3.MAP[slot0 - 1 < 1 and 54 or slot0 - 1][1] and slot1[1] == slot5.MAP[slot0 + 1 > 54 and 1 or slot0 + 1][1] then
		if slot1[1] > 6 then
			return {
				-1,
				0
			}
		else
			return {
				1,
				0
			}
		end
	elseif slot1[2] == slot3[2] and slot1[2] == slot5[2] then
		return {
			0,
			1
		}
	elseif slot1[2] < slot3[2] or slot1[2] < slot5[2] then
		return {
			0,
			-1
		}
	elseif slot3[2] < slot1[2] or slot5[2] < slot1[2] then
		return {
			0,
			1
		}
	elseif slot1[1] < slot3[1] or slot1[1] < slot5[1] then
		return {
			-1,
			0
		}
	elseif slot3[1] < slot1[1] or slot5[1] < slot1[1] then
		return {
			1,
			0
		}
	end
end

function slot0.getLabelFromEvent(slot0, slot1)
	slot2 = ""

	if slot0.csv_id == 0 then
		return gLanguageCsv.gridWalkHistory0
	elseif slot0.is_event then
		slot5 = csv.yunying.grid_walk_events[slot3]
		uv8 = ""

		if slot5.type == slot8.EVENTS.goodLuck then
			slot7 = slot5.params.items[slot0.params.outcome + 1]

			return string.format(gLanguageCsv.gridWalkHistory1, dataEasy.getCfgByKey(slot7[1]).name, slot7[2])
		else
			uv8 = ""

			if slot5.type == slot8.EVENTS.badLuck then
				slot7 = slot6.items[slot0.params.outcome + 1]

				return string.format(gLanguageCsv.gridWalkHistory2, slot7[2], dataEasy.getCfgByKey(slot7[1]).name)
			else
				uv8 = ""

				if slot5.type == slot8.EVENTS.increase then
					return string.format(gLanguageCsv.gridWalkHistory3, slot6.num, slot6.num)
				else
					uv8 = ""

					if slot5.type == slot8.EVENTS.reduce then
						return string.format(gLanguageCsv.gridWalkHistory4, slot6.num, slot6.num)
					else
						uv8 = ""

						if slot5.type == slot8.EVENTS.jump then
							return string.format(gLanguageCsv.gridWalkHistory5, slot6.num)
						else
							uv8 = ""

							if slot5.type == slot8.EVENTS.shop then
								if slot0.params.bought and slot0.params.bought > 0 then
									return gLanguageCsv.gridWalkHistory61
								else
									return gLanguageCsv.gridWalkHistory62
								end
							else
								uv8 = ""

								if slot5.type == slot8.EVENTS.treasures then
									return gLanguageCsv.gridWalkHistory99
								end
							end
						end
					end
				end
			end
		end
	else
		uv5 = ""

		if slot3 ~= slot5.ITEMS.normanlDice then
			uv5 = ""

			if slot3 ~= slot5.ITEMS.strangeDice then
				uv5 = ""

				if slot3 == slot5.ITEMS.medalDice then
					if slot1 then
						uv7 = ""

						if slot1.csv_id == slot7.ITEMS.sprintCard then
							uv7 = ""
							slot5 = slot0.params.outcome + dataEasy.getCfgByKey(slot7.ITEMS.sprintCard).specialArgsMap.steps
						end
					end

					return string.format(gLanguageCsv.gridWalkHistory8, dataEasy.getCfgByKey(slot3).name, slot5)
				else
					return string.format(gLanguageCsv.gridWalkHistory7, dataEasy.getCfgByKey(slot3).name)
				end
			end
		end
	end

	return slot2
end

return slot0
