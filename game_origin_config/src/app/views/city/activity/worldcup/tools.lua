slot1 = {
	function ()
		slot1 = {
			[slot7] = true
		}
		slot3 = slot0.bet_score or {}

		for slot7, slot8 in pairs(gGameModel.role:read("worldcup").bet_wdl or {}) do
			-- Nothing
		end

		for slot7, slot8 in pairs(slot3) do
			slot1[slot7] = true
		end

		return itertools.size(slot1)
	end,
	function ()
		for slot6, slot7 in pairs(gGameModel.role:read("worldcup").bet_wdl or {}) do
			slot8 = csv.yunying.worldcup_match[slot6]
			uv10 = "gGameModel"

			if slot10.getCurTimeStamp(slot8.awardDate, slot8.awardTime) < time.getTime() and slot8.point ~= "" then
				slot10 = string.split(slot8.point, ":")
				slot11 = tonumber(slot10[1])
				slot12 = tonumber(slot10[2])

				if slot7 == 1 and slot12 < slot11 or slot7 == 0 and slot11 == slot12 or slot7 == -1 and slot11 < slot12 then
					slot0 = 0 + 1
				end
			end
		end

		return slot0
	end,
	function ()
		for slot6, slot7 in pairs(gGameModel.role:read("worldcup").bet_score or {}) do
			slot8 = csv.yunying.worldcup_match[slot6]
			uv10 = "gGameModel"

			if slot10.getCurTimeStamp(slot8.awardDate, slot8.awardTime) < time.getTime() and slot8.point ~= "" then
				slot10 = string.split(slot8.point, ":")

				if tonumber(slot10[1]) - tonumber(slot10[2]) == slot7 then
					slot0 = 0 + 1
				end
			end
		end

		return slot0
	end,
	function ()
		slot0 = 0
		slot3 = slot1.bet_score or {}
		slot4 = {
			[slot8] = true
		}

		for slot8, slot9 in pairs(gGameModel.role:read("worldcup").bet_wdl or {}) do
			-- Nothing
		end

		for slot8, slot9 in pairs(slot3) do
			slot4[slot8] = true
		end

		for slot8, slot9 in pairs(slot4) do
			if csv.yunying.worldcup_match[slot8].focus == 1 then
				slot0 = slot0 + 1
			end
		end

		return slot0
	end,
	function ()
		if ((gGameModel.role:read("worldcup").champion_bet or {})[1] or 0) ~= 0 then
			return csv.yunying.worldcup_team[slot2].finalRank
		end

		return 0
	end
}

return {
	getCurTimeStr = function (slot0, slot1)
		uv2 = "getCurTimeStamp"
		slot3 = time.getDate(slot2.getCurTimeStamp(slot0, slot1))

		return string.format(gLanguageCsv.worldcupTime, slot3.month, slot3.day, slot3.hour, slot3.min)
	end,
	getCurTimeStamp = function (slot0, slot1)
		slot2, slot3 = time.getHourAndMin(slot1, true)

		return time.getNumTimestamp(slot0, slot2, slot3) - 28800 + UNIVERSAL_TIMEDELTA
	end,
	guessPointResult = function (slot0)
		slot1 = csv.yunying.worldcup_match[slot0]
		uv3 = "csv"

		if time.getTime() - slot3.getCurTimeStamp(slot1.awardDate, slot1.awardTime) < 0 then
			return
		end

		if slot1.point == "" then
			return
		end

		slot5 = string.split(slot1.point, ":")
		slot6 = tonumber(slot5[1])
		slot7 = tonumber(slot5[2])

		if (gGameModel.role:read("worldcup").bet_wdl or {})[slot0] == 1 and slot7 < slot6 then
			return "right"
		end

		if slot4 == 0 and slot6 == slot7 then
			return "right"
		end

		if slot4 == -1 and slot6 < slot7 then
			return "right"
		end

		return "wrong"
	end,
	guessScoreResult = function (slot0)
		slot1 = csv.yunying.worldcup_match[slot0]
		uv3 = "csv"

		if time.getTime() - slot3.getCurTimeStamp(slot1.awardDate, slot1.awardTime) < 0 then
			return
		end

		if slot1.point == "" or slot1.focus ~= 1 then
			return
		end

		slot5 = string.split(slot1.point, ":")

		return (gGameModel.role:read("worldcup").bet_score or {})[slot0] == tonumber(slot5[1]) - tonumber(slot5[2])
	end,
	getAchievementCount = function (slot0)
		uv2 = "csv"

		return slot2[csv.yunying.worldcup_tasks[slot0].targetType]()
	end
}
