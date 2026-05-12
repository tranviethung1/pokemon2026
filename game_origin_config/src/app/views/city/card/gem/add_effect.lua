slot0 = class("GemAddEffectView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "gem_add_effect.json"
slot0.RESOURCE_BINDING = {
	itemList = "itemList",
	effect = "effect",
	noItem = "noItem",
	item2 = "item2",
	harm = "harm",
	suitPanel = "suitPanel",
	suitItem = "suitItem",
	list = "list",
	imgBg = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	resonance = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnResonance")
			}
		}
	},
	["resonance.title"] = {
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						color = ui.COLORS.NORMAL.WHITE
					}
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.cardDbid = slot1
	slot0.index = slot2
	slot0.pushSuitNum = 0

	slot0.list:setScrollBarEnabled(false)
	slot0.itemList:setScrollBarEnabled(false)
	slot0.suitPanel:get("suitList"):setScrollBarEnabled(false)

	function slot3(slot0)
		uv1 = "item2"
		slot1 = slot1.item2:clone():show()

		slot1:get("title"):text(slot0)

		slot2 = slot1:get("title"):x()

		slot1:get("right"):x(slot1:get("title"):width() / 2 + 40 + slot2)

		slot3 = slot1:get("left")
		slot3 = slot3.x

		slot3(slot3, -slot1:get("title"):width() / 2 - 40 + slot2)

		uv3 = "item2"

		slot3.list:pushBackCustomItem(slot1)
	end

	slot3(gLanguageCsv.basicAttribute)
	slot0:onAttrData()
	slot3(gLanguageCsv.resonanceAttr)
	slot0:onSuitData()
	slot3(gLanguageCsv.indexAttr)
	slot0:onIndexData()
	slot0.list:adaptTouchEnabled()
end

function slot0.onAttrData(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(gGameModel.cards:find(slot0.cardDbid):read("gems")) do
		slot8 = gGameModel.gems:find(slot7)
		slot9 = csv.gem.gem[slot8:read("gem_id")]
		slot10 = slot8:read("level")

		for slot14 = 1, math.huge do
			if slot9["attrType" .. slot14] and slot9["attrType" .. slot14] ~= 0 and slot9["attrNum" .. slot14] and slot9["attrNum" .. slot14][slot10] then
				if not slot2[slot9["attrType" .. slot14]] then
					slot2[slot9["attrType" .. slot14]] = {}

					table.insert(slot2[slot9["attrType" .. slot14]], slot9["attrNum" .. slot14][slot10])
				else
					table.insert(slot2[slot9["attrType" .. slot14]], slot9["attrNum" .. slot14][slot10])
				end
			else
				break
			end
		end
	end

	if csvSize(slot2) == 0 then
		slot3 = slot0.noItem:clone():show()

		slot3:get("txt"):text(gLanguageCsv.gemNestNotArrt1)
		slot0.list:pushBackCustomItem(slot3)
	else
		slot0:onDispose(slot2)
	end
end

function slot0.onSuitData(slot0)
	slot2 = true
	slot3 = {}

	for slot7, slot8 in pairs(gGameModel.cards:find(slot0.cardDbid):read("gems")) do
		if csv.gem.gem[gGameModel.gems:find(slot8):read("gem_id")].suitID then
			slot3[slot10.suitID] = slot3[slot10.suitID] or {}

			table.insert(slot3[slot10.suitID], {
				quality = slot10.quality
			})
		end
	end

	slot4 = {}

	for slot8, slot9 in pairs(slot3) do
		table.sort(slot9, function (slot0, slot1)
			return slot1.quality < slot0.quality
		end)

		slot10, slot11 = next(gGemSuitCsv[slot8])

		for slot15 = 1, #slot9 do
			if slot11[slot15] then
				table.insert(slot4, {
					suitID = slot8,
					suitNum = slot15,
					quality = slot9[slot15].quality
				})
			end
		end
	end

	function slot5(slot0)
		slot1 = nil

		for slot5, slot6 in ipairs(slot0) do
			if slot5 % 3 == 1 then
				uv7 = "ipairs"
				slot7 = slot7.suitPanel:clone():show()
				uv7 = "ipairs"

				slot7.list:pushBackCustomItem(slot7)
			end

			uv7 = "ipairs"
			slot7 = slot7.suitItem:clone():show()

			slot7:get("icon"):texture(ui.GEM_SUIT_ICON[slot6.suitID])
			slot7:get("num"):text("x" .. slot6.suitNum .. ":")

			slot8 = 1

			slot7:get("name"):text(string.format("%s(%s)", gGemSuitCsv[slot6.suitID][slot6.quality][slot6.suitNum].suitName, gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot6.quality]]))

			slot13 = ui.COLORS.QUALITY_DARK[slot6.quality]

			text.addEffect(slot7:get("name"), {
				color = slot13
			})

			for slot13 = 1, math.huge do
				if slot9["attrType" .. slot13] and slot9["attrType" .. slot13] ~= 0 then
					adapt.setTextAdaptWithSize(slot7:get("txt" .. slot13), {
						margin = -5,
						vertical = "center",
						maxLine = 2,
						horizontal = "center",
						str = gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot9["attrType" .. slot13]])],
						size = cc.size(230, 80)
					})
					adapt.oneLinePos(slot7:get("txt" .. slot13), slot7:get("num" .. slot13), cc.p(-30, 0))
					slot7:get("num" .. slot13):text(" +" .. dataEasy.getAttrValueString(slot9["attrType" .. slot13], slot9["attrNum" .. slot13]))

					slot8 = slot13
				else
					break
				end
			end

			if slot8 == 1 then
				for slot13 = 1, 3 do
					slot7:get("txt" .. slot13):visible(slot13 <= slot8)
					slot7:get("num" .. slot13):visible(slot13 <= slot8)
				end

				slot7:get("txt1"):y(slot7:get("txt2"):y())
				slot7:get("num1"):y(slot7:get("num2"):y())
			elseif slot8 == 2 then
				slot7:get("txt3"):visible(false)
				slot7:get("num3"):visible(false)

				for slot13 = 1, 2 do
					slot7:get("txt" .. slot13):y(slot7:get("txt" .. slot13):y() - 30)
					slot7:get("num" .. slot13):y(slot7:get("num" .. slot13):y() - 30)
				end
			end

			slot1:get("suitList"):pushBackCustomItem(slot7)

			if #slot0 < 3 then
				slot1:get("suitList"):setItemAlignCenter()
			end
		end
	end

	if #slot4 == 0 then
		slot6 = slot0.noItem:clone():show()

		slot6:get("txt"):text(gLanguageCsv.gemNestNotArrt2)
		slot0.list:pushBackCustomItem(slot6)
	else
		slot5(slot4)
	end
end

function slot0.onDispose(slot0, slot1, slot2, slot3)
	slot4 = 0
	slot5 = nil

	for slot9, slot10 in pairs(slot1) do
		slot11 = 0

		if slot2 then
			slot9 = slot10.key
			slot11 = slot10.num
		else
			for slot15, slot16 in pairs(slot10) do
				slot11 = slot11 + slot16
			end
		end

		if slot9 then
			slot12 = game.ATTRDEF_TABLE[slot9]
			slot13 = slot12
			slot15 = gLanguageCsv["attr" .. slot12:gsub("^%l", string.upper)]

			if (slot4 + 1) % 3 == 1 then
				slot0.list:pushBackCustomItem(slot0.itemList:clone():show())
			end

			if game.ATTRDEF_SHOW_NUMBER[slot9] then
				slot16 = slot0.effect:clone():show()

				slot16:get("name"):text(slot15)
				slot16:get("num"):text("+" .. slot11)
				slot16:get("icon"):texture(ui.ATTR_LOGO[slot13])

				if slot3 then
					slot16:get("icon"):visible(false)
					text.addEffect(slot16:get("num"), {
						color = ui.COLORS.NORMAL.FRIEND_GREEN
					})

					slot17 = slot16:get("name"):x() - slot16:get("icon"):x() - slot16:get("icon"):width() / 2

					slot16:get("name"):x(slot16:get("icon"):x() - slot16:get("icon"):width() / 2)
					slot16:get("num"):x(slot16:get("name"):x() + slot16:get("name"):width() + 30)
				end

				slot5:pushBackCustomItem(slot16)
			else
				slot16 = slot0.harm:clone():show()

				slot16:get("name"):text(slot15)
				slot16:get("num"):x(slot16:get("name"):width() + slot16:get("name"):x() + 20)
				slot16:get("num"):text("+" .. dataEasy.getAttrValueString(slot9, slot11))
				slot5:pushBackCustomItem(slot16)
			end
		end
	end
end

function slot0.onIndexData(slot0)
	slot3 = {}
	slot4 = true
	slot5 = true
	slot6 = 0
	slot7 = 0

	for slot11, slot12 in orderCsvPairs(csv.gem.quality_attrs) do
		if csv.cards[gGameModel.cards:find(slot0.cardDbid):read("card_id")].gemQualitySeqID == slot12.gemQualitySeqID and slot12.qualityNum <= slot0.index then
			for slot16 = 1, math.huge do
				if slot12["attrType" .. slot16] and slot12["attrType" .. slot16] ~= 0 then
					slot18 = gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot12["attrType" .. slot16]])]

					if not slot3[1] or not slot3[2] then
						slot3[1] = slot3[1] or {}
						slot3[2] = slot3[2] or {}
						slot19, slot20 = dataEasy.parsePercentStr(slot12["attrNum" .. slot16])

						table.insert(slot3[slot20 == 1 and 1 or 2], {
							key = slot12["attrType" .. slot16],
							num = dataEasy.getAttrValueString(slot12["attrType" .. slot16], slot12["attrNum" .. slot16])
						})
					else
						slot5 = true
						slot4 = true
						slot6 = 0
						slot6 = 0
						slot19, slot20 = dataEasy.parsePercentStr(slot12["attrType" .. slot16], slot12["attrNum" .. slot16])

						if slot20 == 1 and not string.find(slot12["attrNum" .. slot16], "%%") then
							for slot25, slot26 in pairs(slot3[1]) do
								if slot12["attrType" .. slot16] == slot26.key then
									slot4 = false
									slot3[1][K2].num = slot26.num + dataEasy.getAttrValueString(slot12["attrType" .. slot16], slot12["attrNum" .. slot16])
								end
							end

							if slot4 then
								table.insert(slot3[1], {
									key = slot12["attrType" .. slot16],
									num = dataEasy.getAttrValueString(slot12["attrType" .. slot16], slot12["attrNum" .. slot16])
								})
							end
						else
							for slot25, slot26 in pairs(slot3[2]) do
								if slot12["attrType" .. slot16] == slot26.key then
									slot5 = false
									slot3[2][slot25].num = dataEasy.getPercentStr(dataEasy.parsePercentStr(slot26.num) + dataEasy.parsePercentStr(slot12["attrNum" .. slot16]), 0)
								end
							end

							if slot5 then
								table.insert(slot3[2], {
									key = slot12["attrType" .. slot16],
									num = dataEasy.getAttrValueString(slot12["attrType" .. slot16], slot12["attrNum" .. slot16])
								})
							end
						end
					end
				else
					break
				end
			end
		end
	end

	if #slot3 == 0 then
		slot8 = slot0.noItem:clone():show()

		slot8:get("txt"):text(gLanguageCsv.gemNestNotArrt3)
		slot0.list:pushBackCustomItem(slot8)
	else
		table.sort(slot3[1], function (slot0, slot1)
			return slot0.key < slot1.key
		end)
		table.sort(slot3[2], function (slot0, slot1)
			return slot0.key < slot1.key
		end)
		slot0:onDispose(slot3[1], true)
		slot0:onDispose(slot3[2], true, true)
	end
end

function slot0.btnResonance(slot0)
	gGameUI:stackUI("city.card.gem.resonance", nil, )
end

return slot0
