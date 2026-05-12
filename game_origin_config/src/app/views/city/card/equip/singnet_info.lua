slot0 = {
	STAR = 1,
	AWAKE = 2
}
slot1 = 50
slot2 = 5

function slot3(slot0, slot1)
	slot2 = csv.equips[slot0.equip_id]
	slot3 = nil
	slot4, slot5 = dataEasy.getQuality(slot0.advance)

	slot1:text((slot0.awake ~= 0 and slot2.name1 .. gLanguageCsv["symbolRome" .. slot0.awake] or slot2.name0) .. slot5)
	text.addEffect(slot1, {
		color = slot4 == 1 and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.QUALITY[slot4]
	})
end

slot4 = class("signetInfo", Dialog)
slot4.RESOURCE_FILENAME = "card_equip_signet_info.json"
slot4.RESOURCE_BINDING = {
	["baseNode.name"] = "panelName",
	item = "item",
	["baseNode.degree"] = "degree",
	baseNode = "baseNode",
	["baseNode.tip"] = "tip",
	["baseNode.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("advanceDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("text1", "condition", "detail")

					slot4.text1:text(gLanguageCsv.signetInfoBeiDong .. slot2)
					slot4.condition:text("(" .. slot3.condition .. ")")
					slot4.detail:text(slot3.attrDetail)

					slot9 = cc.size(730, 100)

					adapt.setTextAdaptWithSize(slot4.detail, {
						margin = 0,
						vertical = "center",
						maxLine = 2,
						horizontal = "left",
						size = slot9
					})

					slot6 = slot4.detail:getVirtualRenderer():getStringNumLines()
					uv9 = "multiget"

					slot4.detail:height(slot9 * slot6)

					slot10 = slot1
					uv10 = "multiget"

					slot1:height(slot1.height(slot10) + slot10 * (slot6 - 2))

					slot9 = slot4.text1
					slot10 = slot9
					uv10 = "multiget"

					slot4.text1:y(slot9.y(slot10) + slot10 * (slot6 - 2))

					slot9 = slot4.condition
					slot10 = slot9
					uv10 = "multiget"

					slot4.condition:y(slot9.y(slot10) + slot10 * (slot6 - 2))

					slot9 = slot4.detail
					slot10 = slot9
					uv10 = "multiget"

					slot4.detail:y(slot9.y(slot10) + slot10 * (slot6 - 2) / 2)
					adapt.oneLinePos(slot4.text1, slot4.condition, cc.p(10, 0))

					if slot3.advance <= slot3.signetAdvance and not slot3.visible then
						slot4.detail:color(cc.c3b(91, 84, 91))
						slot4.condition:visible(false)
					end
				end
			}
		}
	},
	["baseNode.icon"] = {
		varname = "equip",
		binds = {
			event = "extend",
			class = "equip_icon",
			props = {
				data = bindHelper.self("leftData"),
				onNode = function (slot0)
					slot0:multiget("star", "txtLv", "txtLvNum", "imgArrow").imgArrow:visible(false)
				end
			}
		}
	}
}

function slot4.onCreate(slot0, slot1)
	slot0.item:hide()
	slot0.list:size(840, 972)

	slot0.leftData = slot1
	uv3 = "item"

	slot1.equip_id(slot0.leftData, slot0.panelName)

	slot3 = {}

	slot0.tip:text(gLanguageCsv.signetInfoTip)

	for slot7 = 1, csv.equips[slot3].signetAdvanceMax do
		for slot11, slot12 in csvPairs(csv.base_attribute.equip_signet_advance) do
			if slot1.signet_advance == slot2.signetAdvanceMax then
				if slot12.advanceIndex == slot2.advanceIndex and slot12.advanceLevel == slot1.signet_advance - 1 then
					uv17 = "hide"

					slot0.degree:text(slot12.advanceName .. " " .. slot17 .. gLanguageCsv.signetLevelSpecialEn)
				end
			elseif slot12.advanceIndex == slot2.advanceIndex and slot12.advanceLevel == slot1.signet_advance then
				uv19 = "hide"

				slot0.degree:text(slot12.advanceName .. " " .. slot1.signet - slot1.signet_advance * slot19 .. " " .. gLanguageCsv.signetLevelSpecialEn)
			end

			if slot12.advanceIndex == slot2.advanceIndex and slot12.advanceLevel == slot7 then
				slot13 = nil
				slot14 = {}

				for slot18 = 1, math.huge do
					if not slot12["attrType" .. slot18] or slot19 == 0 then
						break
					end

					table.insert(slot14, {
						name = gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot19])],
						num = dataEasy.getAttrValueString(slot19, slot12["attrNum" .. slot18])
					})
				end

				for slot19 = 1, #slot14 do
					slot15 = "" .. slot14[slot19].name .. "+" .. slot14[slot19].num .. "  "
				end

				slot16 = false
				slot17 = nil
				uv19 = "list"

				if slot12.advanceLimitType == slot19.STAR then
					slot17 = string.format(gLanguageCsv.needEquipStar, slot12.advanceLimitNum)

					if slot1.star < slot12.advanceLimitNum then
						slot16 = true
					end
				else
					uv19 = "list"

					if slot12.advanceLimitType == slot19.AWAKE then
						slot17 = gLanguageCsv.needEquipAwake .. gLanguageCsv["symbolRome" .. slot12.advanceLimitNum]

						if slot1.awake < slot12.advanceLimitNum then
							slot16 = true
						end
					end
				end

				for slot22, slot23 in csvMapPairs(slot12.sceneType) do
					if slot22 < table.getn(slot12.sceneType) then
						slot18 = "" .. gLanguageCsv[game.SCENE_TYPE_STRING_TABLE[slot23]] .. gLanguageCsv.signetAnd
					end
				end

				table.insert(slot3, {
					advance = slot7,
					condition = slot17,
					attrDetail = string.format(gLanguageCsv.signetInfoIn, slot18) .. slot15,
					signetAdvance = slot1.signet_advance,
					visible = slot16
				})
			end
		end
	end

	slot0.advanceDatas = slot3

	slot0.list:xy(20, 50)
	slot0.list:size(750, 570)
	Dialog.onCreate(slot0, {
		noBlackLayer = true,
		clickClose = true
	})
end

return slot4
