return {
	bossType = function (slot0, slot1, slot2)
		slot3 = "#I"
		slot4 = "-60-56#"
		slot6 = slot0.specialLimitParameter

		if ({
			function ()
				uv0 = "rarities"

				for slot5, slot6 in csvMapPairs(slot0.rarities or {}) do
					uv8 = ""
					uv10 = "csvMapPairs"
					slot1 = "" .. slot8 .. ui.RARITY_ICON[slot6] .. slot10 .. " "
				end

				uv3 = "ui"
				slot2 = string.format(slot3.desc, slot1)
				uv2 = "RARITY_ICON"

				slot2(slot2)
			end,
			function ()
				uv0 = "natureTypes"

				for slot5, slot6 in csvMapPairs(slot0.natureTypes or {}) do
					uv8 = ""
					uv10 = "csvMapPairs"
					slot1 = "" .. slot8 .. ui.ATTR_ICON[slot6] .. slot10
				end

				uv3 = "ui"
				slot2 = string.format(slot3.desc, slot1)
				uv2 = "ATTR_ICON"

				slot2(slot2)
			end,
			function ()
				uv0 = "rarities"
				uv1 = "rarities"
				slot1 = slot1.count or 0

				for slot6, slot7 in csvMapPairs(slot0.rarities or {}) do
					uv9 = "count"
					uv11 = ""
					slot2 = "" .. slot9 .. ui.RARITY_ICON[slot7] .. slot11 .. " "
				end

				uv4 = "csvMapPairs"
				slot3 = string.format(slot4.desc, slot2, slot1)
				uv3 = "ui"

				slot3(slot3)
			end,
			function ()
				uv0 = "cardIDs"
				slot2 = csv.cards

				for slot6, slot7 in csvMapPairs(slot0.cardIDs or {}) do
					slot1 = "" .. csv.cards[slot7].name .. ","
				end

				uv4 = ""
				slot3 = string.format(slot4.desc, slot1)
				uv3 = "csv"

				slot3(slot3)
			end,
			function ()
				uv2 = ""

				for slot4, slot5 in csvMapPairs(slot2.cardIDs) do
					slot7 = ""
					uv7 = ""

					if slot4 ~= #slot7.cardIDs then
						slot0 = slot7 .. csv.cards[slot5].name .. gLanguageCsv.pauseMark
					end
				end

				uv1 = "csvMapPairs"
				uv2 = ""
				slot2 = slot2.skillIDs[1]
				uv5 = "cardIDs"
				slot5 = slot5.desc
				uv5 = "csv"

				slot5(string.format(slot5, slot0, slot1.gateName, csv.skill[slot2].skillName), slot2)
			end,
			function ()
				uv2 = ""

				for slot4, slot5 in csvMapPairs(slot2.cardIDs) do
					slot7 = ""
					uv7 = ""

					if slot4 ~= #slot7.cardIDs then
						slot0 = slot7 .. csv.cards[slot5].name .. gLanguageCsv.pauseMark
					end
				end

				uv1 = "csvMapPairs"
				uv2 = ""
				slot2 = slot2.skillIDs[1]
				uv5 = "cardIDs"
				slot5 = slot5.desc
				uv5 = "csv"

				slot5(string.format(slot5, slot0, slot1.gateName, csv.skill[slot2].skillName), slot2)
			end,
			function ()
				uv2 = ""

				for slot4, slot5 in csvMapPairs(slot2.rarities) do
					slot0 = string.format("%s#I%s-64-60# ", "", ui.RARITY_ICON[slot5])
				end

				uv1 = "csvMapPairs"
				uv2 = ""
				slot2 = slot2.skillIDs[1]
				uv5 = "rarities"
				slot5 = slot5.desc
				uv7 = ""
				uv5 = "string"

				slot5(string.format(slot5, slot0, slot7.count, slot1.gateName, csv.skill[slot2].skillName), slot2)
			end,
			function ()
				uv2 = ""

				for slot4, slot5 in csvMapPairs(slot2.natureTypes) do
					slot0 = string.format("%s#I%s-64-60# ", "", ui.ATTR_ICON[slot5])
				end

				uv1 = "csvMapPairs"
				uv2 = ""
				slot2 = slot2.skillIDs[1]
				uv5 = "natureTypes"
				slot5 = slot5.desc
				uv7 = ""
				uv5 = "string"

				slot5(string.format(slot5, slot0, slot7.count, slot1.gateName, csv.skill[slot2].skillName), slot2)
			end,
			function ()
				uv2 = ""

				for slot4, slot5 in csvMapPairs(slot2.natureTypes) do
					slot0 = string.format("%s#I%s-64-60# ", "", ui.ATTR_ICON[slot5])
				end

				uv1 = "csvMapPairs"
				uv2 = ""
				slot2 = slot2.skillIDs[1]
				uv5 = "natureTypes"
				slot5 = slot5.desc
				uv5 = "string"

				slot5(string.format(slot5, slot0, slot1.gateName, csv.skill[slot2].skillName), slot2)
			end
		})[slot0.specialLimitType] then
			slot7[slot5]()
		end
	end
}
