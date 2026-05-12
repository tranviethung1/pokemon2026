slot1 = {
	OVER = 3,
	BATTLING = 2,
	BETTING = 1
}

return {
	getCsv = function (slot0)
		return csv.cross.battlebet[slot0]
	end,
	getContestDate = function (slot0, slot1)
		slot4 = time.getDate(time.getNumTimestamp(csv.yunying.yyhuodong[slot0].beginDate) + (slot1 - 1) * 24 * 3600)

		return string.format("%04d%02d%02d", slot4.year, slot4.month, slot4.day)
	end,
	getProtocol = function (slot0)
		return ({
			send = "/game/yy/battlebet/send",
			buy = "/game/yy/battlebet/buy",
			award = "/game/yy/battlebet/award",
			bet = "/game/yy/battlebet/bet",
			contest = "/game/yy/battlebet/contest",
			playback = "/game/yy/battlebet/playback"
		})[slot0]
	end,
	getNextContestAndState = function (slot0)
		slot4 = 0

		for slot8, slot9 in ipairs(csv.cross.battlebet.base[csv.yunying.yyhuodong[slot0].paramMap.base].contestIDs) do
			slot10 = csv.cross.battlebet.contest[slot9]
			uv12 = "time"
			slot13 = time.getHourAndMin
			uv13 = "time"

			if time.getTime() < time.getNumTimestamp(time.getNumTimestamp(slot13.getContestDate(slot0, slot10.contestDate), time.getHourAndMin(slot10.contestEndTime, true)).getContestDate(slot0, slot10.contestDate), slot13(slot10.betEndTime, true)) then
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
			subTitle = "BATTLE GUESS",
			title = gLanguageCsv.yyBet,
			activityId = slot1,
			notShow = slot2
		})
	end,
	getBgTexture = function ()
		return "activity/yybet/img_dzjc.png"
	end,
	getMatchName = function (slot0, slot1, slot2)
		slot3 = 1
		uv5 = "csv"

		for slot9, slot10 in orderCsvPairs(csv.cross.battlebet.contest) do
			if itertools.include(slot5.getCsv("base")[csv.yunying.yyhuodong[slot0].paramMap.base].contestIDs, slot9) then
				if slot9 == slot1 then
					break
				end

				if slot10.contestDate == slot2.contestDate then
					slot3 = slot3 + 1
				end
			end
		end

		return string.format(gLanguageCsv.unionFightRound, gLanguageCsv["symbolNumber" .. slot3])
	end,
	getContestBetTime = function (slot0, slot1)
		uv3 = "csv"
		slot3 = slot3.getCsv("contest")[slot1].contestDate
		slot5 = (slot3 - 1) * 24 * 3600
		uv5 = "csv"
		slot6, slot7 = time.getHourAndMin(slot5.getCsv("contest")[slot1].betEndTime, true)
		slot8 = time.getNumTimestamp(csv.yunying.yyhuodong[slot0].beginDate) + slot5 + slot6 * 3600 + slot7 * 60
		slot9 = 0
		uv11 = "csv"
		slot11 = slot11.getCsv("base")[csv.yunying.yyhuodong[slot0].paramMap.base]

		if slot3 > 1 then
			for slot15, slot16 in pairs(slot11.contestIDs) do
				uv17 = "csv"

				if slot17.getCsv("contest")[slot16].contestDate == slot3 - 1 then
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
