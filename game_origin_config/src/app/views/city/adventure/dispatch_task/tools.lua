function slot1(slot0, slot1)
	slot3 = rich.createByStr(slot0, matchLanguage({
		"kr"
	}) and 36 or 40, nil, , cc.p(0, 0.5)):anchorPoint(0, 0.5):addTo(slot1, 6)

	slot3:formatText()
	slot3:y(slot3:size().height / 2)
end

slot2 = {
	{
		name = "star",
		note = gLanguageCsv.manyStars
	},
	{
		name = "advance",
		note = gLanguageCsv.manyClasses
	},
	{
		name = "rarity",
		note = gLanguageCsv.manyQualifications
	}
}

function slot3(slot0, slot1, slot2, slot3)
	slot4 = ui.COLORS.NORMAL.DEFAULT

	if slot3 ~= 2 then
		slot4 = slot2 and ui.COLORS.NORMAL.FRIEND_GREEN or ui.COLORS.NORMAL.ALERT_ORANGE
	end

	text.addEffect(slot0, {
		color = slot4
	})

	if slot1 ~= "" then
		slot0:text(slot1)
	end
end

function slot4(slot0, slot1, slot2, slot3)
	slot0:removeAllChildren()

	if slot3 ~= 2 then
		uv5 = "removeAllChildren"

		slot5(slot0, string.format(gLanguageCsv.troopsOnTheBattlefield, slot2.cardNums), slot2.cardNums <= slot1, slot3)
	else
		slot0:text("")

		slot5 = "#C0x5b545b#" .. gLanguageCsv.troopsOnTheBattlefield
		uv5 = "string"

		slot5(string.format(slot5, "#C0xF76B45#" .. slot2.cardNums .. "#C0x5b545b#"), slot0)
	end
end

function slot5(slot0, slot1, slot2, slot3)
	slot4 = slot0.removeAllChildren

	slot4(slot0)

	uv4 = "removeAllChildren"
	slot4 = slot4[slot2.condition1].name
	slot5, slot6 = csvNext(slot2.condition1Arg)
	slot7 = "#C0xF76B45#"
	slot8 = "#C0x5b545b#"

	if slot3 ~= 2 then
		slot9 = slot6 <= slot1 and "#C0x60C456#" or "#C0xF76B45#"
		slot7 = slot9
		slot8 = slot9
	end

	slot9 = slot7 .. slot5 .. slot8

	if slot4 == "advance" then
		slot10, slot11 = dataEasy.getQuality(slot5, true)
		slot9 = ui.QUALITY_OUTLINE_COLOR[slot10] .. (gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot10]] .. slot11) .. slot8
	end

	slot11 = slot0

	slot0.text(slot11, "")

	slot10 = nil
	uv11 = "removeAllChildren"
	slot11 = slot11[slot2.condition1].note
	uv12 = "condition1"

	slot12((slot4 == "rarity" or string.format(slot8 .. gLanguageCsv.conditionsForBattle, slot7 .. slot6 .. slot8, string.format(slot11, slot9))) and string.format(slot8 .. slot11, string.format("#I%s-60-60#", ui.RARITY_ICON[slot5]), slot7 .. slot6 .. slot8), slot0)
end

function slot6(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.attrList:removeAllChildren()

	for slot10, slot11 in pairs(slot1) do
		slot12 = slot2:clone():show()

		slot12:get("img"):visible(slot11.state)
		slot12:get("attrIcon"):texture(ui.ATTR_ICON[slot11.attr])
		slot12:get("attrIcon"):color((slot11.state or slot3.status == 2) and cc.c3b(255, 255, 255) or cc.c3b(150, 150, 150))

		if slot11.state then
			slot6 = 0 + 1
		end

		slot0.attrList:pushBackCustomItem(slot12)
	end

	uv8 = "attrList"

	slot8(slot0.extraCondition2, "", itertools.size(slot1) <= slot6, slot3.status)

	if slot3.extraAwardPoint == 0 then
		slot9, slot10 = csvNext(slot5.condition1Arg)
		slot8 = slot6 / slot7 * slot5.cardNatureRate + 0.05 + (slot10 <= slot4 and slot5.rate1 or 0)
	end

	slot0.gainChance:visible(slot3.status ~= 2)

	slot8 = math.floor(slot8 * 10) / 10
	uv9 = "attrList"

	slot9(slot0.gainChance, string.format(gLanguageCsv.gainChance, slot8 .. "%"), slot8 >= 60, slot3.status)
	adapt.setTextScaleWithWidth(slot0.gainChance, nil, 370)
end

return {
	setItemCondition = function (slot0, slot1, slot2, slot3)
		slot4 = slot0:multiget("condition1", "condition2", "extraCondition1", "extraCondition2", "attrList", "gainChance")
		slot5 = 0
		slot6 = 0
		slot7 = {}
		slot9 = 0
		slot10, slot11 = csvNext(slot1.cfg.condition1Arg)

		if slot3 ~= "main" then
			for slot15, slot16 in pairs(slot8.cardNatures) do
				slot7[slot16] = {
					state = false,
					attr = slot16
				}
			end

			for slot15, slot16 in ipairs(slot1.cardIDs) do
				slot17 = gGameModel.cards:find(slot16):read("card_id", "advance", "fighting_point", "star")
				slot19 = csv.unit[csv.cards[slot17.card_id].unitID]
				slot17.rarity = slot19.rarity
				slot5 = slot5 + 1
				slot6 = slot6 + slot17.fighting_point

				if slot7[slot19.natureType] then
					slot7[slot19.natureType].state = true
				end

				if slot19.natureType2 and slot7[slot19.natureType2] then
					slot7[slot19.natureType2].state = true
				end

				uv20 = "multiget"

				if slot10 <= slot17[slot20[slot8.condition1].name] then
					slot9 = slot9 + 1
				end
			end
		else
			slot5 = slot8.cardNums
			slot6 = slot1.taskData.reach_fighting_point or 0

			for slot15, slot16 in pairs(slot1.taskData.reach or {}) do
				if slot15 == 1 and slot16 == 1 then
					slot9 = slot11
				end
			end

			for slot16, slot17 in pairs(slot8.cardNatures) do
				slot7[slot17] = {
					attr = slot17,
					state = itertools.map(slot1.taskData.reach_natures or {}, function (slot0, slot1)
						return slot1, slot0
					end)[slot17] ~= nil
				}
			end
		end

		uv13 = "condition1"

		slot13(slot4.condition1, string.format(gLanguageCsv.forceRequirement, slot6, slot1.fightingPoint), slot1.fightingPoint <= slot6, slot1.status)

		uv13 = "condition2"

		slot13(slot4.condition2, slot5, slot8, slot1.status)

		uv13 = "extraCondition1"

		slot13(slot4.extraCondition1, slot9, slot8, slot1.status)

		uv13 = "extraCondition2"

		slot13(slot4, slot7, slot2, slot1, slot9, slot8)
	end,
	setRewardPanel = function (slot0, slot1, slot2, slot3, slot4)
		slot5 = {}

		for slot9, slot10 in csvMapPairs(slot2) do
			table.insert(slot5, {
				key = slot9,
				num = slot10
			})
		end

		table.sort(slot5, dataEasy.sortItemCmp)

		slot6 = 1

		for slot11, slot12 in ipairs(slot5) do
			slot13 = nil
			slot14 = slot6

			if #slot5 == 3 and slot4 == "main" then
				slot14 = slot14 == 1 and 3 or slot14 - 1
			end

			bind.extend(slot0, slot1:get(slot3 .. slot14), {
				class = "icon_key",
				props = {
					data = {
						key = slot12.key
					},
					onNode = function (slot0)
						uv1 = "main"
						slot1 = slot1 == "main" and 0.6 or 0.7

						slot0:scale(slot1)

						slot3 = slot0
						slot2 = slot0.box(slot3)
						uv3 = "scale"
						slot3 = slot3:size()
						uv5 = "box"
						uv6 = "scale"
						slot8 = "num"

						slot6:removeChildByName(slot8)

						uv8 = "box"
						slot8 = cc.p(1, 0)
						uv8 = "scale"

						text.addEffect(cc.Label:createWithTTF(slot8.num, ui.FONT_PATH, 32):align(slot8, slot3.width / 2 + slot2.width / 2 - 30 * slot1, slot3.height - slot2.height + 14 * slot1):addTo(slot8, 10, "num"), {
							outline = {
								color = ui.COLORS.QUALITY_OUTLINE[dataEasy.getCfgByKey(slot5.key).quality]
							}
						})
					end
				}
			})

			slot6 = slot6 + 1
		end

		if slot4 == "main" then
			if slot7 == 1 then
				slot1:get(slot3 .. 1):xy(slot1:get(slot3 .. 3):x(), slot1:get("bgLeft"):y() - 10)
			end

			if slot7 == 2 then
				slot1:get(slot3 .. 1):xy(slot9 - 70, slot8)
				slot1:get(slot3 .. 2):xy(slot9 + 70, slot8)
			end

			if slot7 == 3 then
				slot1:get(slot3 .. 3):xy(slot9, slot8 + 90)
				slot1:get(slot3 .. 2):xy(slot9 - 80, slot8 - 20)
				slot1:get(slot3 .. 1):xy(slot9 + 80, slot8 - 20)
			end

			slot1:get(slot3 .. 2):visible(slot7 > 1)
			slot1:get(slot3 .. 3):visible(slot7 > 2)
		else
			if slot7 == 1 then
				slot1:get(slot3 .. 1):x(slot1:get(slot3 .. 2):x())
			end

			if slot7 == 2 then
				slot8 = slot1:get(slot3 .. 2):x()

				slot1:get(slot3 .. 1):x(slot8 - 100)
				slot1:get(slot3 .. 2):x(slot8 + 100)
			end
		end
	end
}
