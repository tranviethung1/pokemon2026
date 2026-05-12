return {
	isExclusive = function (slot0)
		slot1 = false
		slot2 = false

		if (type(slot0.dbId) == "table" and slot0.dbId[1] or slot0.dbId) and gGameModel.held_items:find(slot3) and slot4:read("card_db_id") then
			slot1 = true
		end

		if csv.held_item.items[slot0.csvId] and itertools.size(slot4.exclusiveCards) > 0 then
			slot2 = true
		end

		return slot1, slot2
	end,
	insertColor = function (slot0, slot1, slot2, slot3, slot4, slot5)
		for slot13, slot14 in ipairs(slot8) do
			if (slot4 and true or not slot4) and (slot3 or 1) <= slot13 and slot13 < #string.split(slot0, "%s") then
				slot7 = "" .. slot14 .. slot1 .. "%s" .. (slot5 or "#C0x5B545B#")

				if slot4 then
					slot6 = false
				end
			else
				slot7 = slot7 .. slot14 .. "%s"
			end
		end

		return string.sub(slot7, 1, string.len(slot7) - 2)
	end,
	getRellyAdvance = function (slot0, slot1)
		if not csv.held_item.items[slot0] or not slot1 then
			return slot1
		end

		slot3 = {}

		for slot7 = 1, math.huge do
			if not slot2["effect" .. slot7] or slot2["effect" .. slot7] == 0 then
				break
			end

			for slot12, slot13 in ipairs(slot2[string.format("effect%dLevelAdvSeq", slot7)]) do
				table.insert(slot3, slot13)
			end
		end

		if itertools.include(slot3, slot1) then
			return slot1
		end

		table.sort(slot3)

		slot5 = slot1

		for slot9, slot10 in ipairs(slot3) do
			if slot1 < slot10 then
				slot5 = slot3[slot9 - 1]

				break
			end
		end

		return slot5
	end,
	insertSkillDescColor = function (slot0, slot1, slot2)
		slot4 = ""

		for slot8, slot9 in pairs(string.split(slot0, "$")) do
			if string.find(clone(slot9), "skillLevel") then
				slot12 = ""

				if slot3[slot8 + 1] and string.find(slot3[slot8 + 1], "^%%") then
					slot12 = "%"
					slot3[slot8 + 1] = string.gsub(slot3[slot8 + 1], "^%%", "")
				end

				slot10 = string.format("%s$%s$%s%s", slot1, slot10, slot12, slot2)
			end

			slot4 = slot4 .. slot10
		end

		return slot4
	end,
	getStrinigByData = function (slot0, slot1)
		slot2 = slot1.cfg
		uv3 = "cfg"
		slot4 = slot2["effect" .. slot0]
		slot5 = slot2[string.format("effect%dLevelAdvSeq", slot0)]
		slot6 = 0
		slot7 = slot3.getRellyAdvance(slot1.csvId, slot1.advance) + 1
		slot8 = csvSize(slot5)

		for slot12, slot13 in ipairs(slot5) do
			if slot3 < slot13 then
				slot6 = slot12 - 1

				break
			elseif slot3 == slot13 or slot12 == slot8 then
				slot6 = slot12

				break
			end
		end

		slot10 = csv.held_item.effect[slot4]
		slot13 = 1

		if slot10.exclusiveCards[1] then
			slot15 = csv.cards[slot10.exclusiveCards[1]]

			table.insert({}, slot15.name)

			slot19 = game.NATURE_TABLE[csv.unit[slot15.unitID].natureType]
			uv19 = "cfg"
			slot11 = slot19.insertColor(slot10.desc, ui.ATTRCOLOR[slot19], true, slot13, true)
			slot13 = slot13 + 1
		end

		slot14 = "#C0x60c456#"

		if slot10.type == 1 then
			for slot18 = 1, 100 do
				if not slot10["attrNum" .. slot18] then
					break
				end

				table.insert(slot12, dataEasy.getAttrValueString(slot10["attrType" .. slot18], slot10["attrNum" .. slot18][slot6]))
			end
		elseif slot10.type == 2 then
			slot14 = ui.QUALITY_OUTLINE_COLOR[1]
			slot16 = csv.skill[slot10.skillID]
			uv16 = "cfg"

			table.insert(slot12, eval.doMixedFormula(slot16.insertSkillDescColor(dataEasy.getSkillDesc(slot16), "#C0x60c456#", "#C0x5B545B#"), {
				skillLevel = slot7,
				math = math
			}))
		end

		uv15 = "cfg"

		if #slot12 <= 0 and string.find(slot15.insertColor(slot11, slot14, false, slot13, false), "%%s") then
			return
		end

		return string.format(slot11, unpack(slot12))
	end,
	getCardNameColor = function (slot0)
		slot3, slot4 = dataEasy.getQuality(gGameModel.cards:find(slot0):read("advance"))

		for slot10, slot11 in ipairs({
			"r",
			"g",
			"b"
		}) do
			slot6 = "#C0x" .. string.sub(string.format("%#x", ui.COLORS.QUALITY_OUTLINE[slot3][slot11]), 3, 4)
		end

		return slot6 .. "#", slot4
	end
}
