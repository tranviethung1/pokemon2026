return {
	SPROPKEY = 9000,
	SPLUSPROPKEY = 9001,
	SNOUSEPROPKEY = 9002,
	SPLUSNOUSEPROPKEY = 9003,
	isCardAid = function (slot0, slot1, slot2)
		if not dataEasy.getIsStarAidState(slot0) then
			if slot1 then
				if csv.unit[csv.cards[gGameModel.cards:find(slot0):read("card_id")].unitID].rarity == csv.unit[csv.cards[gGameModel.cards:find(slot1):read("card_id")].unitID].rarity and slot6:read("star") ~= slot3:read("star") then
					return true
				end
			elseif itertools.include(slot2, slot5.rarity) then
				return true
			end
		end

		return false
	end,
	isCardExchange = function (slot0, slot1)
		slot2 = gGameModel.cards:find(slot0)

		if not dataEasy.getIsStarAidState(slot0) then
			if slot1 then
				slot5 = slot2:read("star")
				slot6 = gGameModel.cards:find(slot1)
				slot7 = slot6:read("star")
				slot10 = gCommonConfigCsv.cardStarSwapMinimumStarNumber

				if csv.unit[csv.cards[slot2:read("card_id")].unitID].rarity == csv.unit[csv.cards[slot6:read("card_id")].unitID].rarity and slot7 ~= slot5 and (slot7 < slot10 and slot10 <= slot5 or slot10 <= slot7) then
					return true
				end
			elseif itertools.include({
				3,
				4
			}, slot4.rarity) then
				slot8 = "card_star_swap_times"
				uv8 = "gGameModel"
				uv9 = "gGameModel"
				slot9 = slot9.SNOUSEPROPKEY
				slot7 = dataEasy.getNumByKey(slot8.SPROPKEY) + dataEasy.getNumByKey(slot9)
				uv9 = "gGameModel"
				uv10 = "gGameModel"

				if slot4.rarity == 3 and (gGameModel.role:read(slot8)[3] and slot7 + slot6[3] + math.floor(math.max(0, time.getTime() - gGameModel.role:read("card_star_swap_times_cd")[3]) / (gCommonConfigCsv.cardStarSwapRaritySTimesCD * 3600)) or slot7 + gCommonConfigCsv.cardStarSwapRaritySDefaultTimes) > 0 or slot4.rarity == 4 and dataEasy.getNumByKey(slot9.SPLUSPROPKEY) + dataEasy.getNumByKey(slot10.SPLUSNOUSEPROPKEY) > 0 then
					return true
				end

				return false
			end
		end

		return false
	end,
	getSelectCard = function (slot0, slot1, slot2, slot3)
		slot4 = {}

		for slot11, slot12 in ipairs(gGameModel.role:read("cards")) do
			if not itertools.include(slot1, slot12) and slot15.megaIndex <= 0 and slot15.cardType ~= 2 then
				if slot0 == 2 then
					uv17 = "csv"

					if not slot17.isCardExchange(slot12, slot2) and slot0 == 1 then
						uv17 = "csv"

						if slot17.isCardAid(slot12, slot2, slot3) then
							slot17 = slot13:read("skin_id")

							table.insert(slot4, {
								isSel = false,
								id = slot14,
								unitId = dataEasy.getUnitId(slot14, slot17),
								rarity = csv.unit[csv.cards[gGameModel.cards:find(slot12):read("card_id")].unitID].rarity,
								fight = slot13:read("fighting_point"),
								level = slot13:read("level"),
								star = slot13:read("star"),
								advance = slot13:read("advance"),
								skinId = slot17,
								dbid = slot12,
								markId = slot15.cardMarkID,
								cardType = slot15.cardType
							})
						end
					end
				end
			end
		end

		return slot4
	end,
	getAidCardData = function (slot0)
		if not gGameModel.cards:find(slot0) then
			return {}
		end

		slot2 = slot1:read("card_id")
		slot5 = csv.cards[slot2]
		slot7 = slot1:read("skin_id")

		return {
			isSel = false,
			id = slot2,
			unitId = dataEasy.getUnitId(slot2, slot7),
			rarity = csv.unit[slot5.unitID].rarity,
			fight = slot1:read("fighting_point"),
			level = slot1:read("level"),
			star = slot1:read("star"),
			advance = slot1:read("advance"),
			skinId = slot7,
			dbid = slot0,
			markId = slot5.cardMarkID,
			cardType = slot5.cardType
		}
	end,
	getCostList = function (slot0, slot1, slot2)
		slot4 = {}
		slot5 = {}
		slot6 = true

		for slot10, slot11 in orderCsvPairs(csv.card_star_swap_cost) do
			if slot11.type == (slot0 == 2 and 0 or 1) and slot11.rarity == slot1 and slot2 == slot11.reachStar then
				for slot15, slot16 in csvMapPairs(slot11.costItem) do
					slot17 = dataEasy.getNumByKey(slot15)

					table.insert(slot4, {
						key = slot15,
						targetNum = slot16,
						num = slot17
					})

					if slot17 < slot16 then
						slot6 = false

						table.insert(slot5, dataEasy.getCfgByKey(slot15).name .. "*" .. slot16)
					end
				end
			end
		end

		return slot4, slot6, slot5
	end,
	getStarData = function (slot0)
		slot1 = {}

		for slot6 = 1, 6 do
			slot7 = "city/card/star_swap/icon_star_xjzh.png"

			if slot6 <= slot0 then
				slot7 = slot6 <= slot0 - 6 and "common/icon/icon_star_z.png" or "common/icon/icon_star.png"
			end

			table.insert(slot1, {
				icon = slot7
			})
		end

		return slot1
	end,
	getReceiveCount = function (slot0)
		slot0 = slot0 or gGameModel.role:read("card_star_swap_times_deliver_record")

		for slot5, slot6 in orderCsvPairs(csv.card_star_swap_times_deliver) do
			if not slot0 or not slot0[slot5] then
				slot7, slot8 = time.getHourAndMin(slot6.time)
				slot10, slot11 = time.getHourAndMin(slot6.endTime)
				slot15 = time.getTime()
				slot16 = gGameModel.role:read("created_time")

				if matchLanguageForce(slot6.languages) and time.getNumTimestamp(slot6.date, slot7, slot8) <= slot15 and slot15 <= time.getNumTimestamp(slot6.endDate, slot10, slot11) and slot16 <= time.getNumTimestamp(slot6.validRoleCreatedLatestDate) and time.getNumTimestamp(slot6.validRoleCreatedEarliestDate) <= slot16 and ((slot6.type == 3 or slot6.type == 2) and slot6.param <= gGameModel.role:read("level") or slot6.type == 1 and slot6.param <= gGameModel.role:read("vip_level")) then
					slot1 = 0 + 1
				end
			end
		end

		return slot1
	end
}
