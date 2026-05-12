return {
	equipGem = function (slot0, slot1, slot2, slot3)
		uv4 = "isSlotLocked"

		if slot4.isSlotLocked(slot0, slot1) then
			gGameUI:showTip(gLanguageCsv.notUnlock)

			return
		end

		slot6 = gGameModel.gems:find(slot2):read("gem_id")
		slot5 = dataEasy.getCfgByKey(slot6)
		uv6 = "isSlotLocked"
		slot6 = slot6.suitTypeMap(slot0)

		if not gGameModel.gems:find(slot2):read("card_db_id") and slot6[slot5.suitID] and slot6[slot5.suitID][slot5.suitNo] or slot6[slot4] then
			gGameUI:showTip(gLanguageCsv.sameGemID)

			return
		end

		gGameApp:requestServer("/game/gem/equip", function (slot0)
			uv1 = "gGameUI"

			if slot1 then
				uv1 = "gGameUI"

				slot1()
			end

			gGameUI:showTip(gLanguageCsv.inlaySuccess)
		end, slot0, slot2, slot1)
	end,
	swapGem = function (slot0, slot1, slot2)
		uv3 = "isSlotLocked"

		if slot3.isSlotLocked(slot0, slot1) then
			gGameUI:showTip(gLanguageCsv.notUnlock)

			return
		end

		slot5 = dataEasy.getCfgByKey(gGameModel.gems:find(slot2):read("gem_id"))
		slot6 = gGameModel.gems:find(gGameModel.cards:find(slot0):read("gems")[slot1])
		slot7 = slot6
		uv7 = "isSlotLocked"
		slot7 = slot7.suitTypeMap(slot6.read(slot7, "card_db_id"))

		if not gGameModel.gems:find(slot2):read("card_db_id") and slot7[slot5.suitID] and slot7[slot5.suitID][slot5.suitNo] and slot7[slot5.suitID][slot5.suitNo] ~= slot1 or slot7[slot4] then
			gGameUI:showTip(gLanguageCsv.sameGemID)

			return
		end

		gGameApp:requestServer("/game/gem/swap", function ()
			gGameUI:showTip(gLanguageCsv.exchange2Success)
		end, slot3, slot2)
	end,
	unEquipGem = function (slot0, slot1)
		gGameApp:requestServer("/game/gem/unload", function ()
			gGameUI:showTip(gLanguageCsv.dischargeSuccess)
		end, {
			gGameModel.cards:find(slot0):read("gems")[slot1]
		})
	end,
	suitTypeMap = function (slot0)
		slot2 = {}

		for slot6, slot7 in pairs(gGameModel.cards:find(slot0):read("gems")) do
			if dataEasy.getCfgByKey(gGameModel.gems:find(slot7):read("gem_id")).suitID and slot9.suitNo then
				if not slot2[slot9.suitID] then
					slot2[slot9.suitID] = {}
				end

				slot2[slot9.suitID][slot9.suitNo] = slot6
			else
				slot2[slot8] = slot6
			end
		end

		return slot2
	end,
	isSlotLocked = function (slot0, slot1)
		if gGemPosCsv[csv.cards[gGameModel.cards:find(slot0):read("card_id")].gemPosSeqID][slot1].openCondition[1] == 1 then
			if gGameModel.role:read("level") < slot3[2] then
				return true, string.format(gLanguageCsv.openLv, slot3[2])
			end
		elseif slot3[1] == 2 then
			slot4, slot5 = dataEasy.getQuality(slot3[2])

			return true, string.format(gLanguageCsv.openAdvance, gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot4]] .. slot5)
		end

		return false
	end,
	moveGem = function (slot0, slot1, slot2, slot3)
		uv4 = "isSlotLocked"

		if slot4.isSlotLocked(slot0, slot1) then
			gGameUI:showTip(gLanguageCsv.notUnlock)

			if slot3 then
				slot3()
			end

			return
		end

		gGameApp:requestServer("/game/gem/pos/change", function ()
			gGameUI:showTip(gLanguageCsv.exchange2Success)
		end, slot2, slot1)
	end
}
