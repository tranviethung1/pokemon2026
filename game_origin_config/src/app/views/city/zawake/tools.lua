slot1 = {
	itself = 1,
	designated = 2,
	allTeam = 3
}

return {
	STAGE_OPEN_STATE = {
		open = 1,
		preview = 2,
		close = 3
	},
	MAXLEVEL = 8,
	MAXSTAGE = 8,
	getLevelCfg = function (slot0, slot1, slot2)
		if gZawakeLevelsCsv[slot0] and gZawakeLevelsCsv[slot0][slot1] then
			return gZawakeLevelsCsv[slot0][slot1][slot2]
		end
	end,
	getResetCostItems = function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			for slot11 = 1, slot7 do
				uv12 = "pairs"

				if not slot12.getLevelCfg(slot0, slot6, slot11) then
					break
				end

				for slot16, slot17 in csvMapPairs(slot12.costItemMap) do
					slot2[slot16] = (slot2[slot16] or 0) + slot17
				end
			end
		end

		for slot6, slot7 in pairs(slot2) do
			slot2[slot6] = math.ceil(slot7 * gCommonConfigCsv.zawakeResetOneKeyRatio)
		end

		return slot2
	end,
	getCardByZawakeID = function (slot0)
		slot1 = gGameModel.role:read("pokedex")
		slot2 = gGameModel.role:read("cards")

		if cache.queryZawake({
			"getCardByZawakeID"
		}, function ()
			slot0 = {}
			slot4 = "cards"

			for slot4, slot5 in ipairs(gGameModel.role:read(slot4)) do
				slot6 = gGameModel.cards:find(slot5)

				if csv.cards[slot6:read("card_id")].zawakeID > 0 then
					slot0[slot9] = slot0[slot9] or {}

					table.insert(slot0[slot9], {
						fightPoint = slot6:read("fighting_point"),
						dbId = slot5,
						cardId = slot7
					})
				end
			end

			return slot0
		end)[slot0] then
			for slot8, slot9 in ipairs(slot3[slot0]) do
				if slot3[slot0][1].fightPoint < slot9.fightPoint then
					slot4 = slot9
				end
			end

			slot5 = slot4.cardId

			return {
				cardId = slot5,
				cfg = gCardsZawake[slot0][slot5],
				zawakeID = slot0,
				dbId = slot4.dbId
			}
		end

		for slot8, slot9 in pairs(gCardsZawake[slot0]) do
			if slot1[slot8] then
				slot4 = math.max(nil or 0, slot8)
			end
		end

		return {
			cardId = slot4,
			cfg = gCardsZawake[slot0][slot4],
			zawakeID = slot0
		}
	end,
	getFightPointMaxCard = function ()
		slot1 = {}
		slot2, slot3 = nil

		for slot7, slot8 in ipairs(gGameModel.role:read("cards")) do
			slot9 = gGameModel.cards:find(slot8)
			slot13 = "fighting_point"
			slot11 = slot9:read(slot13)
			uv13 = "gGameModel"

			if slot13.isOpenByStage(csv.cards[slot9:read("card_id")].zawakeID) and (not slot2 or slot2 < slot11) then
				slot2 = slot11
				slot3 = slot12
			end
		end

		return slot3
	end,
	getAllCards = function ()
		slot1 = gGameModel.role:read("pokedex")
		slot2 = {}
		slot3 = {}

		for slot7, slot8 in ipairs(gGameModel.role:read("cards")) do
			slot9 = gGameModel.cards:find(slot8)
			slot11 = slot9:read("fighting_point")

			if csv.cards[slot9:read("card_id")].zawakeID > 0 and slot11 > (slot3[slot12] and slot3[slot12].fightPoint or 0) then
				slot3[slot12] = {
					cardId = slot10,
					fightPoint = slot11
				}
			end
		end

		for slot7, slot8 in pairs(gCardsZawake) do
			uv9 = "gGameModel"

			if slot9.isOpenByStage(slot7) then
				if slot3[slot7] then
					slot2[slot7] = {
						cfg = gCardsZawake[slot7][slot3[slot7].cardId],
						maxFightPoint = slot3[slot7].fightPoint
					}
				else
					for slot13, slot14 in pairs(slot8) do
						if slot1[slot13] then
							slot9 = math.max(nil or 0, slot13)
						end
					end

					if slot9 then
						slot2[slot7] = {
							maxFightPoint = 0,
							cfg = gCardsZawake[slot7][slot9]
						}
					end
				end
			end
		end

		return slot2
	end,
	getAttrAddTypeStr = function (slot0, slot1)
		uv2 = "designated"

		if slot0 == slot2.designated then
			return string.format("[ %s ]", string.format(gLanguageCsv.zawakeFirstAttr, gLanguageCsv[game.NATURE_TABLE[slot1]]))
		end

		uv2 = "designated"

		if slot0 == slot2.allTeam then
			return string.format("[ %s ]", gLanguageCsv.allSprite)
		end

		return gLanguageCsv.skinBuff1
	end,
	getAttrStr = function (slot0, slot1)
		slot2 = ""
		slot3 = ""
		uv5 = ""
		slot3 = slot0.attrAddType == slot5.designated and gLanguageCsv[game.NATURE_TABLE[slot0.natureType]] .. gLanguageCsv.xi or gLanguageCsv.allElves
		slot4 = {
			[slot10] = 0
		}
		slot5 = {}

		for slot9, slot10 in pairs(game.ONESELF_NATURE_ENUM_TABLE) do
			-- Nothing
		end

		for slot9 = 1, math.huge do
			slot11 = slot0["attrNum" .. slot9]

			if slot0["attrType" .. slot9] == nil or slot10 == 0 then
				break
			end

			slot5[slot10] = slot11
			slot4[slot10] = slot11
		end

		if function ()
			slot0 = -1
			uv2 = "pairs"

			for slot4, slot5 in pairs(slot2) do
				if slot0 ~= -1 and slot0 ~= slot5 then
					return false
				end

				slot0 = slot5
			end

			return true
		end() then
			if slot1 then
				slot2 = string.format("#C0xB7B09E#%s %s+%s", slot3, gLanguageCsv.basicAttribute, slot0.attrNum1)
			else
				slot2 = string.format("#C0x5B545B#%s %s#C0x60C456#+%s", slot3, gLanguageCsv.basicAttribute, slot0.attrNum1)
			end
		else
			slot2 = slot1 and slot2 .. string.format("#C0xB7B09E#%s ", slot3) or slot2 .. string.format("#C0x5B545B#%s ", slot3)

			for slot10, slot11 in pairs(slot5) do
				slot2 = slot1 and slot2 .. string.format("#C0xB7B09E#%s+%s ", getLanguageAttr(slot10), dataEasy.getAttrValueString(slot10, slot11)) or slot2 .. string.format("#C0xB7B09E#%s+%s ", getLanguageAttr(slot10), dataEasy.getAttrValueString(slot10, slot11)) .. string.format("#C0x5B545B#%s#C0x60C456#+%s ", getLanguageAttr(slot10), dataEasy.getAttrValueString(slot10, slot11))
			end
		end

		return slot2
	end,
	getStagesCfg = function (slot0, slot1)
		uv2 = "getCardByZawakeID"

		if gZawakeStagesCsv[slot2.getCardByZawakeID(slot0).cfg.zawakeID] and gZawakeStagesCsv[slot3][slot1] then
			return gZawakeStagesCsv[slot3][slot1], slot2
		end

		error(string.format("!!!csv.zawake.stages not exist zawakeID(%s), awakeSeqID(%s)", slot3, slot1))
	end,
	isOpenByStage = function (slot0, slot1)
		if slot0 == 0 then
			return false
		end

		if not (gZawakeStagesCsv[slot0] and gZawakeStagesCsv[slot0][slot1 or 1]) then
			return false
		end

		uv4 = "gZawakeStagesCsv"

		if slot2.isOpen == slot4.STAGE_OPEN_STATE.open then
			return true
		end

		if dev.DEBUG_MODE then
			uv4 = "gZawakeStagesCsv"

			if slot2.isOpen == slot4.STAGE_OPEN_STATE.preview then
				return true
			end
		end

		return false
	end,
	isUnlockByKey = function (slot0, slot1, slot2, slot3)
		if (slot3 or -1) == -1 then
			slot5, slot6 = next(gCardsZawake[slot2])
			slot4 = slot6.cardMarkID
		end

		slot5 = cache.queryZawake({
			"isUnlockByKey"
		}, function ()
			slot0 = {
				cardMarkID = {},
				zawakeID = {}
			}
			slot4 = "cards"

			for slot4, slot5 in ipairs(gGameModel.role:read(slot4)) do
				slot8 = csv.cards[gGameModel.cards:find(slot5):read("card_id")]
				slot0.cardMarkID[slot8.cardMarkID] = slot0.cardMarkID[slot8.cardMarkID] or {}

				table.insert(slot0.cardMarkID[slot8.cardMarkID], slot6)

				slot0.zawakeID[slot8.zawakeID] = slot0.zawakeID[slot8.zawakeID] or {}

				table.insert(slot0.zawakeID[slot8.zawakeID], slot6)
			end

			return slot0
		end)
		slot6 = {}
		slot6 = slot3 ~= -1 and (slot5.cardMarkID[slot3] or {}) or slot5.zawakeID[slot2] or {}

		function slot7(slot0, slot1, slot2, slot3, slot4)
			uv6 = "ipairs"

			for slot8, slot9 in ipairs(slot6) do
				slot10 = slot9:read(slot0)

				if slot2 then
					for slot15, slot16 in pairs(slot10) do
						if slot4 then
							slot11 = 0 + (slot3 and slot16[slot3] or slot16) + slot16[slot4] or 0
						end
					end

					if slot1 <= slot11 then
						return true
					end
				elseif slot1 <= slot10 then
					return true
				end
			end

			return false
		end

		if slot0 == "goodFeel" then
			if slot1 <= ((gGameModel.role:read("card_feels")[slot4] or {}).level or 0) then
				return true
			end
		elseif slot0 == "equipStarSum" then
			return slot7("equips", slot1, true, "star", "ability")
		elseif slot0 == "equipAwakeSum" then
			return slot7("equips", slot1, true, "awake")
		elseif slot0 == "equipSignetAdvanceSum" then
			return slot7("equips", slot1, true, "signet_advance")
		elseif slot0 == "zawakeStage" then
			for slot14, slot15 in ipairs(slot6) do
				if slot1 % 100 <= (((gGameModel.role:read("zawake") or {})[csv.cards[slot15:read("card_id")].zawakeID] or {})[math.floor(slot1 / 100)] or -1) then
					return true
				end
			end
		elseif slot0 == "star" then
			return slot7("star", slot1)
		elseif slot0 == "nvalueSum" then
			return slot7("nvalue", slot1, true)
		elseif slot0 == "advance" then
			return slot7("advance", slot1)
		elseif slot0 == "effort" then
			return slot7("effort_advance", slot1)
		elseif slot0 == "gemQuality" then
			for slot11, slot12 in ipairs(slot6) do
				if slot1 <= dataEasy.getGemQualityIndex(slot12) then
					return true
				end
			end
		end

		return false
	end,
	getLabelByLimit = function (slot0, slot1, slot2)
		slot3 = "#C0xF76B45#" .. gLanguageCsv.notFinished

		if slot2 then
			slot3 = " #Icity/card/evolution/logo_tick1.png-0.8#"
		end

		slot4 = slot1

		if slot0 == "advance" then
			slot5, slot6 = dataEasy.getQuality(slot1, true)
			slot4 = ui.QUALITY_OUTLINE_COLOR[slot5] .. gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot5]] .. slot6
		else
			if slot0 == "zawakeStage" then
				if slot1 % 100 > 0 then
					slot4 = gLanguageCsv.effortAdvance .. gLanguageCsv["symbolRome" .. math.floor(slot1 / 100)] .. "- " .. slot1 % 100
				end
			elseif slot0 == "effort" then
				slot4 = gLanguageCsv.effortAdvance .. dataEasy.getRomanNumeral(slot1)
			elseif slot0 == "star" then
				slot4 = "x" .. slot4
			end

			slot4 = slot2 and "#C0x60C456#" .. slot4 or "#C0xF76B45#" .. slot4
		end

		return string.format(gLanguageCsv["zawakeAttr" .. string.caption(slot0)], slot4) .. slot3
	end,
	getActiveCondition = function (slot0, slot1, slot2)
		if csvSize(slot2.extraAttrs) == 0 and slot2.skillID == 0 and csvSize(slot2.nvalue) == 0 then
			return
		end

		slot3 = {}
		slot4 = {}
		slot5 = true

		for slot9, slot10 in csvMapPairs(slot2.activeReq) do
			uv11 = "csvSize"
			slot13 = slot10
			slot11 = slot11.isUnlockByKey(slot9, slot13, slot0)
			uv13 = "csvSize"

			table.insert(slot4, "#C0x5B545B#·" .. slot13.getLabelByLimit(slot9, slot10, slot11))

			if slot11 == false then
				slot5 = false
			end
		end

		return slot5, slot4
	end,
	isUnlockByStage = function (slot0, slot1)
		slot2 = {}
		slot3 = {}
		slot4 = true

		for slot8 = 1, 2 do
			slot9 = {}
			slot10 = gLanguageCsv.zawakeSelf
			slot11 = true

			if slot0["unlockType" .. slot8] ~= -1 then
				uv13 = "gLanguageCsv"
				slot10 = string.format(gLanguageCsv.series, slot13.getMinCardCfgByMarkID(slot12).name)
				slot11 = false
			end

			for slot16, slot17 in csvMapPairs(slot0["unlockLimit" .. slot8]) do
				uv18 = "gLanguageCsv"
				slot18 = slot18.isUnlockByKey(slot16, slot17, slot1, slot12)

				if slot16 == "star" and not slot18 then
					slot4 = false
				end

				table.insert(slot9, {
					key = slot16,
					val = slot17,
					state = slot18
				})
			end

			if itertools.size(slot9) > 0 then
				slot3[slot12] = {
					firstText = slot10,
					data = slot9,
					isSelf = slot11
				}
			end
		end

		slot5 = true

		for slot9, slot10 in pairs(slot3) do
			for slot14, slot15 in pairs(slot10.data) do
				uv18 = "gLanguageCsv"

				table.insert(slot2, "#C0x5B545B#·" .. slot10.firstText .. slot18.getLabelByLimit(slot15.key, slot15.val, slot15.state))

				if slot15.state == false then
					slot5 = false
				end
			end
		end

		return slot5, slot2, slot4
	end,
	getStageIsUnlock = function (slot0, slot1)
		slot2 = os.clock()
		uv3 = "os"
		slot5 = slot1
		slot3, slot4 = slot3.getStagesCfg(slot0, slot5)
		uv5 = "os"
		slot5, slot6, slot7 = slot5.isUnlockByStage(slot3, slot0)

		return slot5, slot7
	end,
	canAwake = function (slot0, slot1, slot2)
		if slot0 == 0 then
			return false
		end

		uv3 = "isOpenByStage"

		if not slot3.isOpenByStage(slot0, slot1) then
			return false
		end

		uv3 = "isOpenByStage"
		slot3 = slot3.getLevelCfg(slot0, slot1, slot2)

		if slot2 <= (((gGameModel.role:read("zawake") or {})[slot0] or {})[slot1] or 0) then
			return false
		end

		uv7 = "isOpenByStage"

		if slot7.isPreUnlockByState(slot0, slot1) and slot3 then
			if slot1 ~= 1 or slot2 ~= 1 then
				if slot2 - 1 == 0 then
					slot8 = slot1 - 1
					uv10 = "isOpenByStage"
					slot9 = slot10.MAXLEVEL
				end

				if slot9 > (slot5[slot8] or 0) then
					return false
				end
			end

			for slot11, slot12 in csvMapPairs(slot3.costItemMap) do
				if dataEasy.getNumByKey(slot11) < slot12 then
					return false
				end
			end
		else
			return false
		end

		return true
	end,
	getSkillCfg = function (slot0, slot1)
		if not slot1 or slot1 == 0 or slot0 == 0 then
			return
		end

		uv2 = "getCardByZawakeID"
		slot4 = {}

		for slot8, slot9 in csvMapPairs(slot2.getCardByZawakeID(slot0).cfg.skillList) do
			if csv.skill[slot9].zawakeEffect[1] and slot10 == slot1 then
				table.insert(slot4, {
					cfg = csv.skill[slot9],
					id = slot9,
					cardId = slot2.cardId
				})
			end
		end

		if #slot4 > 0 then
			return slot4
		end

		printInfo("zawakeSkillID(%s) was not in cards zawakeID(%s)", slot1, slot0)
	end,
	getMinCardCfgByMarkID = function (slot0)
		for slot4, slot5 in pairs(gCardsCsv[slot0][1]) do
			return slot5
		end
	end,
	getMaxStageLevel = function (slot0)
		slot2, slot3 = nil

		for slot7, slot8 in pairs((gGameModel.role:read("zawake") or {})[slot0] or {}) do
			if (not slot2 or slot2 < slot7) and slot8 > 0 then
				slot2 = slot7
				slot3 = slot8
			end
		end

		return slot2, slot3
	end,
	isPreUnlockByState = function (slot0, slot1)
		slot2 = true
		slot3 = true

		for slot7 = 1, slot1 do
			uv8 = "getStageIsUnlock"
			slot8, slot9 = slot8.getStageIsUnlock(slot0, slot7)

			if not slot9 then
				slot3 = false
			end

			if not slot8 then
				slot2 = false
			end
		end

		uv4 = "getStageIsUnlock"
		slot5 = {}
		slot7 = gLanguageCsv.zawakeSelf

		if slot4.getStagesCfg(slot0, slot1).unlockType1 ~= -1 then
			uv8 = "getStageIsUnlock"
			slot7 = string.format(gLanguageCsv.series, slot8.getMinCardCfgByMarkID(slot6).name)
		end

		for slot11, slot12 in csvMapPairs(slot4.unlockLimit1) do
			uv13 = "getStageIsUnlock"
			slot16 = slot0
			uv16 = "getStageIsUnlock"

			table.insert(slot5, "#C0x5B545B#·" .. slot7 .. slot16.getLabelByLimit(slot11, slot12, slot13.isUnlockByKey(slot11, slot12, slot16, slot6, slot1)))
		end

		return slot2, slot5, slot3
	end
}
