slot0 = 6

function slot2(slot0, slot1, slot2)
	if not slot0 and not slot1 then
		return
	end

	slot3 = slot0
	slot4 = slot1

	if not slot0 then
		slot0 = "- - - -"
		slot3 = slot2 and "0%" or "0"
	end

	if not slot1 then
		slot1 = "- - - -"
		slot4 = slot2 and "0%" or "0"
	end

	slot4 = tonumber(slot2 and string.sub(slot4, 1, #slot4 - 1) or slot4)

	if tonumber(slot2 and string.sub(slot3, 1, #slot3 - 1) or slot3) > 0 then
		slot0 = "+" .. slot0
	end

	if slot4 > 0 then
		slot1 = "+" .. slot1
	end

	slot6 = "- - - -"

	if slot3 - slot4 > 0 then
		slot6 = "+" .. slot5
	elseif slot5 < 0 then
		slot6 = slot5
	end

	if slot2 then
		slot6 = slot6 .. "%"
	end

	return {
		slot0,
		slot1,
		slot5,
		slot6
	}
end

return {
	isDress = function (slot0)
		if slot0 and gGameModel.chips:find(slot0) and slot1:read("card_db_id") then
			return true
		end

		return false
	end,
	isChipPlan = function (slot0)
		if type(slot0) ~= "table" then
			slot0 = {
				slot0
			}
		end

		slot1 = {}

		for slot6, slot7 in pairs(gGameModel.role:read("chip_plans")) do
			for slot11, slot12 in pairs(slot7.chips or {}) do
				slot1[slot12] = true
			end
		end

		for slot6, slot7 in pairs(slot0) do
			if slot1[slot7] then
				return true
			end
		end

		return false
	end,
	getSuitRes = function (slot0, slot1)
		if slot1 and slot1[1][3] and not slot1[2][3] then
			slot2 = string.gsub(gChipSuitCsv[slot0][2][2].suitIcon, "0.png", "1.png")
		end

		return slot2
	end,
	setAttrCollect = function (slot0, slot1)
		for slot5 = 1, table.maxn(slot1) do
			if slot1[slot5] then
				slot0[slot5] = slot0[slot5] or {}

				for slot9, slot10 in pairs(slot1[slot5]) do
					slot0[slot5][slot9] = dataEasy.attrAddition(slot0[slot5][slot9], slot10)
				end
			end
		end

		return slot0
	end,
	setAttrAddition = function (slot0, slot1, slot2, slot3, slot4)
		slot5 = nil

		for slot9 = 1, math.huge do
			if slot1[string.format("attrType%d", slot9)] and slot10 ~= 0 then
				if slot2 then
					slot11 = slot1[string.format("attrNum%d", slot9)][slot2 + 1]
				end

				slot14 = string.find(dataEasy.getAttrValueString(slot10, slot11), "%%") and 2 or 1

				if slot3 then
					uv15 = "math"

					if not slot15.ignoreAttr(slot10) then
						if slot5 then
							errorInWindows("配置异常，csv.chip.chips[%d] 副属性不能显示 %s(%s), %s(%s)", slot4.chipId, game.ATTRDEF_TABLE[slot5], slot5, game.ATTRDEF_TABLE[slot10], slot10)
						else
							if slot2 then
								slot5 = slot10
							end

							slot15 = clone(slot4 or {})
							slot15.key = slot10
							slot15.val = slot12

							table.insert(slot0, slot15)
						end
					end
				else
					slot0[slot14][slot10] = dataEasy.attrAddition(slot0[slot14][slot10], slot12)
				end
			else
				break
			end
		end

		return slot0
	end,
	getAttrByChipId = function (slot0)
		slot3 = {}

		if csv.chip.chips[slot0].mainAttr and slot4 ~= 0 then
			uv5 = "csv"

			slot5.setAttrAddition({}, gChipMainAttrCsv[slot4][1], nil, true)
		end

		slot5 = slot1.startNum + slot1.acquiredLimit

		for slot9 = 1, slot1.startNum do
			table.insert(slot3, {
				name = gLanguageCsv.randomAttributes,
				val = gLanguageCsv.chipDetailInfo01
			})
		end

		for slot9 = 1, slot1.acquiredLimit do
			table.insert(slot3, {
				name = gLanguageCsv.randomAttributes,
				val = string.format(gLanguageCsv.nLvUnlock, slot1.acquiredLevels[slot9])
			})
		end

		return slot2, slot3
	end,
	getAttr = function (slot0, slot1, slot2, slot3)
		slot4 = gGameModel.chips:find(slot0):read("chip_id", "level", "now")
		slot8 = slot2 and {} or {
			{},
			{}
		}

		if csv.chip.chips[slot4.chip_id].mainAttr and slot9 ~= 0 then
			uv10 = "gGameModel"

			slot10.setAttrAddition(slot2 and {} or {
				{},
				{}
			}, gChipMainAttrCsv[slot9][slot1 or slot4.level], nil, slot2)
		end

		for slot14, slot15 in ipairs(slot4.now or {}) do
			uv16 = "gGameModel"

			slot16.setAttrAddition(slot8, csv.chip.libs[slot15[1]], slot15[3], slot2, {
				chipId = slot4.chip_id,
				now = slot15
			})
		end

		if slot2 and slot3 then
			for slot15 = 1, slot6.startNum + slot6.acquiredLimit - itertools.size(slot10) do
				table.insert(slot8, {
					name = gLanguageCsv.randomAttributes,
					val = string.format(gLanguageCsv.nLvUnlock, slot6.acquiredLevels[slot6.acquiredLimit - slot11 + slot15])
				})
			end
		end

		return slot7, slot8
	end,
	getAttrs = function (slot0)
		slot1 = {
			{},
			{}
		}
		slot2 = {
			{},
			{}
		}
		slot3 = slot0

		if type(slot0) ~= "table" then
			slot3 = gGameModel.cards:find(slot0):read("chip")
		end

		for slot7, slot8 in pairs(slot3) do
			uv9 = "type"
			slot9, slot10 = slot9.getAttr(slot8)
			uv11 = "type"
			slot11 = slot11.setAttrCollect

			slot11(slot1, slot9)

			uv11 = "type"

			slot11.setAttrCollect(slot2, slot10)
		end

		return slot1, slot2
	end,
	getComplateSuitAttrByCard = function (slot0)
		slot1 = {}
		uv2 = "getSuitAttrByCard"

		for slot6, slot7 in pairs(slot2.getSuitAttrByCard(slot0)) do
			table.insert(slot1, {
				suitId = slot6,
				data = {
					slot7[1],
					slot7[2]
				}
			})

			if slot7[3] then
				uv13 = "pairs"

				table.insert(slot1, {
					suitId = slot6,
					data = {
						slot7[3],
						{
							4,
							slot13,
							false
						}
					}
				})
			end
		end

		return slot1
	end,
	getSuitAttrByCard = function (slot0)
		slot1 = {}
		slot2 = {}
		slot3 = slot0

		if type(slot0) ~= "table" then
			slot3 = gGameModel.cards:find(slot0):read("chip")
		end

		slot4 = {}
		slot5 = {}
		slot6 = {}

		for slot10, slot11 in pairs(slot3) do
			slot13 = csv.chip.chips[gGameModel.chips:find(slot11):read("chip_id")]
			slot15 = slot13.quality
			slot4[slot14] = slot4[slot13.suitID] or {}

			if slot1[slot14] == nil then
				uv18 = "type"
				uv18 = "type"
				slot1[slot14] = {
					{
						2,
						slot18,
						false
					},
					{
						4,
						slot18,
						false
					}
				}
			end

			slot4[slot14][slot15] = slot4[slot14][slot15] or 0
			slot4[slot14][slot15] = slot4[slot14][slot15] + 1
			slot6[slot13.pos] = {
				isSelect = false,
				quality = slot15,
				suitID = slot14
			}
		end

		function slot7(slot0, slot1, slot2)
			for slot6 = 1, 2 do
				uv8 = "pairs"

				for slot10, slot11 in pairs(slot8) do
					if slot0 <= slot11.quality and not slot11.isSelect and slot11.suitID == slot2 then
						uv12 = "quality"
						slot12[slot10] = slot1
						slot11.isSelect = true

						break
					end
				end
			end
		end

		uv8 = "type"

		for slot12, slot13 in pairs(slot4) do
			slot14 = 0
			uv15 = "type"

			for slot18 = slot15, 1, -1 do
				if slot14 + (slot13[slot18] or 0) >= 2 and slot1[slot12][1][3] == false then
					slot1[slot12][1] = {
						2,
						slot18,
						true
					}

					slot7(slot18, 1, slot12)
				end

				if slot14 >= 4 and slot1[slot12][2][3] == false then
					slot1[slot12][2] = {
						4,
						slot18,
						true
					}

					slot7(slot18, 2, slot12)
				end

				if slot14 == 6 then
					slot1[slot12][3] = {
						2,
						slot18,
						true
					}

					slot7(slot18, 3, slot12)

					break
				end
			end

			if slot14 < 2 then
				slot1[slot12] = nil
			end
		end

		return slot1, slot5
	end,
	getSuitAttrByChip = function (slot0)
		slot1 = gGameModel.chips:find(slot0)
		slot5 = csv.chip.chips[slot1:read("chip_id")].quality

		if not slot1:read("card_db_id") then
			return {
				{
					2,
					slot5,
					false
				},
				{
					4,
					slot5,
					false
				}
			}
		end

		uv7 = "gGameModel"
		slot7, slot8 = slot7.getSuitAttrByCard(slot2)

		if not slot7[slot4.suitID] or not slot8[slot4.pos] then
			return {
				{
					2,
					slot5,
					false
				},
				{
					4,
					slot5,
					false
				}
			}
		end

		for slot14, slot15 in pairs(slot9) do
			if slot15[3] == false then
				slot15[2] = slot5
			end
		end

		slot10[1] = slot9[math.floor((slot8[slot4.pos] - 1) / 2) * 2 + 1] or slot10[1]
		slot10[2] = slot9[slot11 + 1] or slot10[2]

		return slot10
	end,
	getSuitAttrStr = function (slot0, slot1)
		slot2, slot3, slot4 = unpack(slot1)

		if gChipSuitCsv[slot0][slot3][slot2].skillID ~= 0 then
			slot6 = string.format("#L10##F40#%s%s #L0#", slot4 and "#C0xFF5B545B#" or "#C0xFFB7B09E#", string.format(slot2 < 4 and gLanguageCsv.chipNSuitAttr or gLanguageCsv.chipNSuitAttrEffect, slot2, gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot3]])) .. " "
			slot8 = dataEasy.getSkillDesc(csv.skill[slot5.skillID])

			if not slot4 then
				for slot13, slot14 in ipairs(string.split(slot8, "#")) do
					if slot13 % 2 == 1 then
						slot6 = slot6 .. slot14
					end
				end
			else
				slot6 = slot6 .. slot8
			end
		else
			for slot11 = 1, math.huge do
				if slot5["attrType" .. slot11] and slot12 ~= 0 then
					if slot4 then
						slot6 = string.format("%s %s #C0xFF5C9970#+%s#C0xFF5B545B#", slot6, getLanguageAttr(slot12), dataEasy.getAttrValueString(slot12, slot5["attrNum" .. slot11]))
					else
						slot6 = string.format("%s %s +%s", slot6, getLanguageAttr(slot12), slot13)
					end
				else
					break
				end
			end
		end

		return slot6
	end,
	getResonanceAttr = function (slot0)
		slot1 = 1
		slot2 = 2
		slot3 = {}
		slot4 = slot0

		if type(slot0) ~= "table" then
			slot4 = gGameModel.cards:find(slot0):read("chip")
		end

		for slot9, slot10 in pairs(gChipResonanceCsv) do
			if ({
				{
					getVal = function (slot0)
						return csv.chip.chips[gGameModel.chips:find(slot0):read("chip_id")].quality
					end,
					func = function (slot0, slot1, slot2)
						for slot7, slot8 in pairs(slot0) do
							if slot2 <= slot7 then
								slot3 = 0 + slot8
							end
						end

						return slot1 <= slot3
					end
				},
				{
					getVal = function (slot0)
						return gGameModel.chips:find(slot0):read("level")
					end,
					func = function (slot0, slot1, slot2)
						for slot7, slot8 in pairs(slot0) do
							if slot2 <= slot7 then
								slot3 = 0 + slot8
							end
						end

						return slot1 <= slot3
					end
				}
			})[slot9] then
				slot11 = {}

				for slot15, slot16 in pairs(slot4) do
					slot11[slot17] = (slot11[slot5[slot9].getVal(slot16)] or 0) + 1
				end

				for slot15, slot16 in pairs(slot10) do
					for slot20, slot21 in ipairs(slot16) do
						if slot5[slot9].func(slot11, slot21.param[1], slot21.param[2]) then
							table.insert(slot3, {
								slot21.id,
								slot21.groupID
							})

							break
						end
					end
				end
			end
		end

		return slot3
	end,
	ignoreAttr = function (slot0)
		return itertools.include({
			game.ATTRDEF_ENUM_TABLE.specialDamage,
			game.ATTRDEF_ENUM_TABLE.specialDefence,
			game.ATTRDEF_ENUM_TABLE.specialDefenceIgnore
		}, slot0)
	end,
	getAttrName = function (slot0)
		if slot0 == game.ATTRDEF_ENUM_TABLE.damage then
			return gLanguageCsv.attrDoubleAttack
		end

		if slot0 == game.ATTRDEF_ENUM_TABLE.defence then
			return gLanguageCsv.attrDoubleDefence
		end

		if slot0 == game.ATTRDEF_ENUM_TABLE.defenceIgnore then
			return gLanguageCsv.attrDoubleDefenceIgnore
		end

		if slot0 == 0 then
			return gLanguageCsv.basicAttribute
		end

		return getLanguageAttr(slot0)
	end,
	getBaseAttr = function (slot0)
		slot1 = {
			[slot7] = 0
		}
		slot2 = {}

		for slot6, slot7 in pairs(game.ONESELF_NATURE_ENUM_TABLE) do
			-- Nothing
		end

		for slot6, slot7 in ipairs(slot0) do
			if slot1[slot7.key] == 0 then
				slot1[slot7.key] = slot7.val
			else
				table.insert(slot2, slot7)
			end
		end

		slot4 = true

		for slot8, slot9 in pairs(slot1) do
			if -1 == -1 then
				slot3 = slot9
			elseif slot3 ~= slot9 or slot3 == 0 then
				slot4 = false

				break
			end
		end

		if slot4 then
			table.insert(slot2, {
				key = 0,
				base = true,
				val = slot3
			})

			return slot2
		end

		return slot0
	end,
	getAttrsValue = function (slot0)
		if type(slot0) ~= "table" then
			slot0 = {
				slot0
			}
		end

		uv1 = "type"
		slot1, slot2 = slot1.getAttrs(slot0)
		uv3 = "type"

		slot3.setAttrCollect(slot1, slot2)

		return slot1
	end,
	getAttrsValueCmp = function (slot0, slot1)
		uv2 = "getAttrsValue"
		slot3 = slot0
		slot2 = slot2.getAttrsValue(slot3)
		uv3 = "getAttrsValue"
		slot3 = slot3.getAttrsValue(slot1)
		slot4 = {
			{},
			{}
		}

		for slot8 = 1, 2 do
			if slot2[slot8] then
				for slot12, slot13 in pairs(slot2[slot8]) do
					uv16 = "pairs"
					slot4[slot8][slot12] = slot16(slot13, slot3[slot8] and slot3[slot8][slot12], slot8 == 2)
				end
			end

			if slot3[slot8] then
				for slot12, slot13 in pairs(slot3[slot8]) do
					if not (slot2[slot8] and slot2[slot8][slot12]) then
						uv16 = "pairs"
						slot4[slot8][slot12] = slot16(slot14, slot13, slot8 == 2)
					end
				end
			end
		end

		return slot4
	end,
	getCardDBID = function (slot0)
		if itertools.size(slot0) == 0 then
			return
		end

		for slot5, slot6 in ipairs(gGameModel.role:read("cards")) do
			if itertools.size(gGameModel.cards:find(slot6):read("chip")) > 0 and itertools.equal(slot8, slot0) then
				return slot6
			end
		end
	end,
	getRuleContext = function (slot0)
		slot1 = adaptContext
		slot2 = {
			slot1.clone(slot0.title, function (slot0)
				slot0:get("text"):text(gLanguageCsv.chipRule)
			end),
			slot1.noteText(124601, 124605)
		}
		slot8 = 124608

		table.insert({}, {
			sign = true,
			key = csv.note[124606].fmt,
			main = csv.note[124607].fmt,
			sec = csv.note[slot8].fmt
		})

		slot4 = 124609

		for slot8 = 1, 6 do
			table.insert(slot3, {
				sign = false,
				key = slot8,
				main = csv.note[slot4 + 2 * slot8 - 2].fmt,
				sec = csv.note[slot4 + 2 * slot8 - 1].fmt
			})
		end

		for slot8 = 1, 7 do
			table.insert(slot2, slot1.clone(slot0.panelChip, function (slot0)
				slot2 = slot0
				slot3 = "txtLocation"
				slot1 = slot0.multiget(slot2, slot3, "imgLocation", "txtMain", "txtSec", "img01", "img02")
				uv2 = "multiget"
				uv3 = "txtLocation"

				if slot2[slot3].sign then
					slot1.txtLocation:x(40)
					slot1.txtSec:x(1000)
					slot1.imgLocation:hide()
				else
					slot1.imgLocation:show()
					slot1.imgLocation:rotate(60 * (slot2.key - 1))
				end

				slot1.txtLocation:text(slot2.key)
				slot1.txtMain:text(slot2.main)

				slot3 = slot1.txtSec
				slot3 = slot3.text

				slot3(slot3, slot2.sec)

				uv3 = "txtLocation"

				if slot3 > 1 and matchLanguage({
					"en",
					"kr"
				}) then
					slot3 = checkLanguage("en") and 27 or 30

					slot1.txtMain:setFontSize(slot3)
					slot1.txtSec:setFontSize(slot3)
				end

				slot1.img01:visible(slot2.sign)
				slot1.img02:visible(slot2.sign)
			end))
		end

		return slot2
	end
}
