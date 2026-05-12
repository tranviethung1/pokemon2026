slot0 = {
	CHAMPITION_BETTING = 0,
	OVER = 3,
	BATTLING = 2,
	BETTING = 1
}

function slot2(slot0, slot1)
	uv5 = "csv"
	slot6 = "contest"
	uv6 = "csv"

	if slot5.getCsv(slot6)[csv.cross.contestbet.base[csv.yunying.yyhuodong[slot0].paramMap.base].contestIDs[1]].contestDate == slot6.getCsv("contest")[slot1].contestDate then
		return true
	end

	return false
end

return {
	getProtocol = function (slot0)
		return ({
			send = "/game/yy/contestbet/send",
			buy = "/game/yy/contestbet/buy",
			award = "/game/yy/contestbet/award",
			bet = "/game/yy/contestbet/bet",
			card = "/game/yy/contestbet/card",
			playback = "/game/yy/contestbet/playback",
			contest = "/game/yy/contestbet/contest",
			danmu = "/game/yy/contestbet/team"
		})[slot0]
	end,
	getCsv = function (slot0)
		return csv.cross.contestbet[slot0]
	end,
	updateTeams = function (slot0, slot1)
		slot0.teamsData = slot1
	end,
	teamIndex2TeamId = function (slot0, slot1)
		return slot0.teamsData[slot1].csv_id
	end,
	getContestDate = function (slot0, slot1)
		slot4 = time.getDate(time.getNumTimestamp(csv.yunying.yyhuodong[slot0].beginDate) + (slot1 - 1) * 24 * 3600)

		return string.format("%04d%02d%02d", slot4.year, slot4.month, slot4.day)
	end,
	getChampionBetDueStamp = function (slot0)
		slot1 = csv.yunying.yyhuodong[slot0].beginDate
		slot5 = csv.cross.contestbet.contest[csv.cross.contestbet.base[csv.yunying.yyhuodong[slot0].paramMap.base].contestIDs[1]]
		uv7 = "csv"

		return time.getNumTimestamp(slot7.getContestDate(slot0, slot5.contestDate), time.getHourAndMin(slot5.betEndTime, true))
	end,
	getChampionShowStamp = function (slot0)
		slot1 = time.getTime()
		uv7 = "time"

		return time.getNumTimestamp(slot7.getContestDate(slot0, csv.cross.contestbet.contest[csv.cross.contestbet.base[csv.yunying.yyhuodong[slot0].paramMap.base].contestIDs[1]].contestDate), 0, 0)
	end,
	getNextContestAndState = function (slot0)
		slot3 = csv.cross.contestbet.base[csv.yunying.yyhuodong[slot0].paramMap.base].contestIDs
		slot4 = 0
		uv5 = "time"

		if time.getTime() < slot5.getChampionShowStamp(slot0) then
			uv6 = "getTime"

			return 0, slot6.CHAMPITION_BETTING
		end

		for slot8, slot9 in orderCsvPairs(slot3) do
			slot10 = csv.cross.contestbet.contest[slot9]
			uv12 = "time"
			slot13 = time.getHourAndMin
			uv13 = "time"

			if slot1 < time.getNumTimestamp(time.getNumTimestamp(slot13.getContestDate(slot0, slot10.contestDate), time.getHourAndMin(slot10.contestEndTime, true)).getContestDate(slot0, slot10.contestDate), slot13(slot10.betEndTime, true)) then
				uv14 = "getTime"

				return slot9, slot14.BETTING
			elseif slot11 <= slot1 and slot1 < slot12 then
				uv14 = "getTime"

				return slot9, slot14.BATTLING
			end
		end

		uv6 = "getTime"

		return 0, slot6.OVER
	end,
	createTopui = function (slot0, slot1, slot2)
		gGameUI.topuiManager:createView("battlebet", slot0, {
			onClose = slot0:createHandler("onClose")
		}):init({
			subTitle = "COMPETITION BATTLE GUESS",
			title = gLanguageCsv.contestBet,
			activityId = slot1,
			notShow = slot2
		})
	end,
	getBgTexture = function ()
		return "activity/contest_bet/bg_dzqd.png"
	end,
	getMatchName = function (slot0, slot1, slot2)
		return slot2.contestName
	end,
	getContestBetTime = function (slot0, slot1)
		uv3 = "csv"
		slot5 = (slot3.getCsv("contest")[slot1].contestDate - 1) * 24 * 3600
		slot4 = time.getNumTimestamp(csv.yunying.yyhuodong[slot0].beginDate) + slot5
		uv5 = "csv"
		slot6, slot7 = time.getHourAndMin(slot5.getCsv("contest")[slot1].betEndTime, true)
		slot8 = slot4 + slot6 * 3600 + slot7 * 60
		slot9 = slot4 - 18000
		uv11 = "csv"
		slot12 = csv.yunying.yyhuodong[slot0].paramMap.base
		slot11 = slot11.getCsv("base")[slot12]
		uv12 = "yunying"

		if slot12(slot0, slot1) then
			slot12 = csv.yunying.yyhuodong[slot0]
			slot13, slot14 = time.getHourAndMin(slot12.beginTime, true)
			slot9 = time.getNumTimestamp(slot12.beginDate, slot13, slot14)
		else
			for slot15, slot16 in ipairs(slot11.contestIDs) do
				uv17 = "csv"

				if slot17.getCsv("contest")[slot16] and slot17.contestDate == slot3 - 1 then
					slot18, slot19 = time.getHourAndMin(slot17.contestEndTime, true)
					uv21 = "csv"
					slot9 = math.max(slot9, time.getNumTimestamp(slot21.getContestDate(slot0, slot17.contestDate), slot18, slot19))
				end
			end
		end

		uv12 = "csv"
		slot13, slot14 = time.getHourAndMin(slot12.getCsv("contest")[slot1].contestEndTime, true)

		return slot9, slot8, slot4 + slot13 * 3600 + slot14 * 60
	end
}
