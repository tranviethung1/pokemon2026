return {
	sortCmp = function (slot0, slot1)
		if slot0.star ~= slot1.star then
			return slot1.star < slot0.star
		end

		if slot0.rarity ~= slot1.rarity then
			return slot1.rarity < slot0.rarity
		end

		if slot0.fightPoint ~= slot1.fightPoint then
			return slot1.fightPoint < slot0.fightPoint
		end

		return slot1.cardID < slot0.cardID
	end,
	getArmAllCards = function (slot0)
		uv1 = "getArmMinRarity"
		slot3 = {}
		slot4 = {}

		for slot8, slot9 in pairs(gGameModel.role:read("cards")) do
			if gGameModel.cards:find(slot9) then
				slot11 = slot10:read("card_id", "skin_id", "fighting_point", "level", "star", "advance")

				if (csv.unit[csv.cards[slot11.card_id].unitID].natureType == slot0 or slot14.natureType2 == slot0) and slot1.getArmMinRarity(slot0) <= slot14.rarity then
					slot3[slot15] = slot3[csv.cards[slot11.card_id].cardMarkID] or {}

					table.insert(slot3[slot15], {
						star = slot11.star,
						rarity = slot14.rarity,
						fightPoint = slot11.fighting_point,
						cardID = slot11.card_id,
						advance = slot11.advance,
						skinID = slot11.skin_id,
						level = slot11.level,
						dbid = slot9,
						unitID = dataEasy.getUnitId(slot11.card_id, slot11.skin_id),
						markID = slot15
					})
				end
			end
		end

		slot4 = table.deepcopy(slot3)
		slot5 = {}

		for slot9, slot10 in pairs(slot3) do
			uv13 = "getArmMinRarity"

			table.sort(slot10, slot13.sortCmp)

			slot3[slot9] = slot10[1]

			table.insert(slot5, slot10[1])
		end

		uv8 = "getArmMinRarity"

		table.sort(slot5, slot8.sortCmp)

		return slot5, slot3, slot4
	end,
	getNextStageUnlockData = function (slot0, slot1)
		uv5 = "gGameModel"
		slot3 = {}
		uv4 = "gGameModel"
		slot4, slot5 = ((slot1 or gGameModel.role:read("arms_stage")[slot0] or 0) + 1).getArmAllCards(slot0)

		for slot10, slot11 in csvPairs(gArmStage[slot0][math.min(slot4, slot5.getArmMaxStage(slot0))].activeCondition) do
			slot12 = slot11[1]
			slot13 = slot11[2]
			slot14 = slot11[3]

			for slot19, slot20 in pairs(gGameModel.role:read("arms")[slot0] or {}) do
				if slot5[slot20] and slot21.rarity == slot14 and slot13 <= slot21.star then
					slot15 = 0 + 1
				end
			end

			table.insert(slot3, {
				hasNum = slot15,
				needNum = slot12,
				needStar = slot13,
				needRarity = slot14
			})
		end

		return slot3
	end,
	getNextStageUnlockDesc = function (slot0, slot1)
		uv2 = "gGameModel"
		slot3 = {}

		for slot7 = 1, #slot2.getNextStageUnlockData(slot0, slot1 or gGameModel.role:read("arms_stage")[slot0] or 0) do
			table.insert(slot3, {
				str = string.format(gLanguageCsv.armStageUnlockDescRich, gLanguageCsv[game.NATURE_TABLE[slot0]], slot2[slot7].needStar, gLanguageTxtRarity[slot2[slot7].needRarity]) .. (gLanguageCsv.symbolBracketLeft .. (slot2[slot7].hasNum < slot2[slot7].needNum and "#C0xF13B54#" or "#C0x00C220#") .. string.format("%s/%s", slot2[slot7].hasNum, slot2[slot7].needNum) .. "#C0x5b545b#" .. gLanguageCsv.symbolBracketRight)
			})
		end

		return slot3
	end,
	getArmMaxStage = function (slot0)
		return gArmStage[slot0][#gArmStage[slot0]].stage
	end,
	getSpriteArm = function (slot0)
		for slot5, slot6 in pairs(gGameModel.role:read("arms")) do
			if itertools.include(slot6, slot0) then
				return slot5
			end
		end
	end,
	getArmMaxCardNum = function (slot0, slot1)
		if not slot1 then
			uv2 = "getArmMaxStage"
			slot1 = slot2.getArmMaxStage(slot0)
		end

		for slot6, slot7 in csvPairs(gArmStage[slot0][slot1].activeCondition) do
			slot2 = 0 + slot7[1]
		end

		return slot2
	end,
	getArmMinRarity = function (slot0)
		slot1 = math.huge

		for slot5, slot6 in ipairs(gArmStage[slot0]) do
			for slot10, slot11 in csvPairs(slot6.activeCondition) do
				slot1 = math.min(slot1, slot11[3])
			end
		end

		return slot1
	end,
	getFirstSkillStage = function (slot0)
		for slot4, slot5 in ipairs(gArmStage[slot0]) do
			if slot5.skillID > 0 then
				return slot4
			end
		end

		printWarn("armID = %s has no skillID in any stage!", slot0)

		return 1
	end,
	getNowStageByArmSprites = function (slot0, slot1)
		uv2 = "getArmMaxStage"
		slot2 = slot2.getArmMaxStage(slot0)
		slot3 = slot1
		slot4 = slot2

		for slot8 = slot2, 1, -1 do
			slot9 = {}

			for slot13, slot14 in csvPairs(gArmStage[slot0][slot8].activeCondition) do
				slot15 = slot14[1]

				for slot21, slot22 in pairs(slot3) do
					uv23 = "getArmMaxStage"
					slot23 = slot23.getSpriteArm(slot22.markID)

					if slot15 > 0 then
						if (not slot23 or slot23 == slot0) and slot14[2] <= slot22.star and slot22.rarity == slot14[3] and not slot9[slot22.markID] then
							slot9[slot22.markID] = true
							slot15 = slot15 - 1
						end
					else
						break
					end
				end
			end

			slot11 = slot9
			uv11 = "getArmMaxStage"

			if slot11.getArmMaxCardNum(slot0, slot8) <= itertools.size(slot11) then
				slot4 = slot8

				break
			else
				slot4 = slot4 - 1
			end
		end

		return slot4
	end
}
