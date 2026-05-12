return {
	initPageItemFunc = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
		slot0.diamondDataId = slot0:getTabYYID()

		slot0.isLimitDraw:set(true)
		slot0.isCutDown:set(false)
		slot0.isFree:set(false)
		slot0.isCost:set(true)

		slot9 = "common/icon/icon_diamond.png"
		slot10 = "common/icon/icon_diamond.png"
		slot11 = csv.yunying.yyhuodong[slot0.diamondDataId].paramMap
		slot12 = slot11.RMB1
		slot13 = slot11.RMB10

		if dataEasy.getNumByKey(game.ITEM_TICKET.diamondUpCard) > 0 then
			slot9 = dataEasy.getIconResByKey(game.ITEM_TICKET.diamondUpCard)
			slot12 = string.format("%s/%s", slot14, 1)
		end

		if slot14 >= 10 then
			slot10 = dataEasy.getIconResByKey(game.ITEM_TICKET.diamondUpCard)
			slot13 = string.format("%s/%s", slot14, 10)
		end

		slot0.oneIconPath:set(slot9)
		slot0.tenIconPath:set(slot10)
		slot0.drawOnceCost:set(slot12)
		slot0.drawTenCost:set(slot13)
		slot0:initCards()
		slot0:initCountDown()
	end,
	initCards = function (slot0)
		slot1 = csv.yunying.yyhuodong[slot0.diamondDataId].clientParam.up
		slot3 = 20 + csvSize(slot1) / 4 * 25

		slot0.diamondUpCardPanel:removeAllChildren()

		slot4 = {}

		for slot8, slot9 in csvPairs(slot1) do
			table.insert(slot4, {
				id = slot9,
				rarity = csv.unit[csv.cards[slot9].unitID].rarity
			})
		end

		table.sort(slot4, function (slot0, slot1)
			return slot0.rarity < slot1.rarity
		end)

		for slot8, slot9 in csvPairs(slot4) do
			slot10 = slot0:createCard(slot9.id):addTo(slot0.diamondUpCardPanel)

			slot10:setAnchorPoint(cc.p(0.5, -2))
			slot10:xy(slot0.diamondUpCardPanel:size().width / 2 - (slot8 - (slot2 + 1) / 2) * 20, -920 + slot2 * 5 + math.abs(slot8 - (slot2 + 1) / 2) * 10)
			slot10:setRotation((slot8 - (slot2 + 1) / 2) * slot3 / slot2)
			slot10:z(5)
		end
	end,
	createCard = function (slot0, slot1)
		slot2 = slot0.cardItem:clone():show()

		slot2:show()

		slot4 = csv.unit[csv.cards[slot1].unitID]
		slot5 = slot4.rarity
		slot6 = slot4.cardShow
		slot7 = slot4.cardShowScale
		slot8 = slot4.cardShowPosC

		uiEasy.setIconName("card", slot1, {
			space = true,
			advance = 1,
			node = slot2:get("name"),
			name = slot4.name
		})
		text.addEffect(slot2:get("name"), {
			color = ui.COLORS.NORMAL.WHITE
		})
		slot2:get("bg"):texture(string.format("city/drawcard/draw/panel_card_%s.png", ({
			nil,
			"z",
			"h",
			"c"
		})[slot5]))
		slot2:get("rarity"):texture(ui.RARITY_ICON[slot5])

		if slot4.natureType2 == nil then
			slot2:get("attr1"):texture(ui.ATTR_ICON[slot4.natureType])
			slot2:get("attr2"):hide()
		else
			slot2:get("attr1"):texture(ui.ATTR_ICON[slot10])
			slot2:get("attr2"):texture(ui.ATTR_ICON[slot11]):show()
		end

		slot13 = slot2:get("bg"):size()
		slot14 = ccui.Scale9Sprite:create()

		slot14:initWithFile(cc.rect(82, 82, 1, 1), "common/icon/mask_card.png")
		slot14:size(slot13.width - 39, slot13.height - 39):alignCenter(slot13)

		slot15 = cc.Sprite:create(slot6)
		slot16 = slot15:size()
		slot17 = cc.p(slot8.x / slot7, -slot8.y / slot7)
		slot18 = cc.size(slot13.width / slot7, slot13.height / slot7)

		slot15:alignCenter(slot13):scale(slot7 + 0.2):setTextureRect(cc.rect((slot16.width - slot18.width) / 2 - slot17.x, (slot16.height - slot18.height) / 2 - slot17.y, slot18.width, slot18.height))
		slot2:removeChildByName("clipping")
		cc.ClippingNode:create(slot14):setAlphaThreshold(0.1):size(slot13):alignCenter(slot2:size()):add(slot15):addTo(slot2, 5, "clipping")

		return slot2
	end,
	initCountDown = function (slot0)
		slot1 = slot0.diamondUpCutDownPanel:get("textTime")
		slot2 = csv.yunying.yyhuodong[slot0.diamondDataId]
		slot4 = 0

		if gGameModel.role:read("yy_endtime")[slot0.diamondDataId] then
			slot4 = slot3[slot0.diamondDataId]
		else
			return
		end

		slot5 = slot0.diamondUpCutDownPanel

		bind.extend(slot0, slot1, {
			class = "cutdown_label",
			props = {
				tag = 2,
				endTime = slot4
			}
		})
	end,
	isEnoughToDrawFunc = function (slot0, slot1)
		slot3 = slot0.rmb:read()
		slot4 = csv.yunying.yyhuodong[slot0.diamondDataId].paramMap
		slot5 = slot4.RMB1
		slot6 = slot4.RMB10

		if dataEasy.getNumByKey(game.ITEM_TICKET.diamondUpCard) > 0 then
			slot5 = 1
			slot2 = slot7

			if slot7 >= 10 then
				slot6 = 10
				slot3 = slot7
			end
		end

		if slot1 then
			return slot6 <= slot3
		else
			return slot5 <= slot2
		end
	end,
	drawOneClickFunc = function (slot0)
		slot3 = csv.yunying.yyhuodong[slot0.diamondDataId].paramMap

		if dataEasy.getNumByKey(game.ITEM_TICKET.diamondUpCard) > 0 then
			function ()
				uv4 = "gGameApp"

				gGameApp:requestServer("/game/yy/award/draw", function (slot0)
					audio.pauseMusic()
					audio.playEffectWithWeekBGM("drawcard_one.mp3")

					slot1, slot2, slot3 = dataEasy.getRawTable(slot0)
					slot5 = nil
					uv7 = "audio"
					slot7 = gGameUI
					slot7 = slot7.stackUI

					slot7(slot7, "city.drawcard.result", nil, , {
						drawType = "diamond_up",
						isFree = false,
						times = 1,
						items = dataEasy.getItems(slot1, slot2),
						yyId = slot7.diamondDataId,
						cb = function ()
							uv0 = "initAward"

							slot0:initAward()
						end
					})

					uv7 = "audio"

					slot7:initAward()
				end, slot4.diamondDataId, "limit_up_rmb1")
			end()
		else
			dataEasy.sureUsingDiamonds(slot2, slot3.RMB1)
		end
	end,
	drawTenClickFunc = function (slot0)
		slot1 = false

		if dataEasy.getNumByKey(game.ITEM_TICKET.diamondUpCard) < 10 then
			slot1 = true
		end

		function slot2()
			uv4 = "gGameApp"

			gGameApp:requestServer("/game/yy/award/draw", function (slot0)
				audio.pauseMusic()
				audio.playEffectWithWeekBGM("drawcard_ten.mp3")

				slot1, slot2, slot3 = dataEasy.getRawTable(slot0)
				slot5 = nil
				uv7 = "audio"
				slot7 = gGameUI
				slot7 = slot7.stackUI

				slot7(slot7, "city.drawcard.result", nil, , {
					drawType = "diamond_up",
					isFree = false,
					times = 10,
					items = dataEasy.getItems(slot1, slot2),
					yyId = slot7.diamondDataId,
					cb = function ()
						uv0 = "initAward"

						slot0:initAward()
					end
				})

				uv7 = "audio"
				slot7 = slot7.initAward

				slot7(slot7)

				uv7 = "pauseMusic"

				if slot7 then
					userDefault.setCurrDayKey("diamondUpDrawTips", 0)
				end

				sdk.trackEvent("timedraw_10x")
			end, slot4.diamondDataId, "limit_up_rmb10")
		end

		if slot1 and (matchLanguage({
			"kr"
		}) or userDefault.getCurrDayKey("diamondUpDrawTips", 1) == 1 and dataEasy.isUnlock("diamondUpDrawTips")) then
			gGameUI:showDialog({
				isRich = true,
				clearFast = true,
				btnType = 2,
				content = string.format(gLanguageCsv.draw10CardTips, csv.yunying.yyhuodong[slot0.diamondDataId].paramMap.RMB10),
				cb = function ()
					error("Decompilation failed")
					-- Exception in function building!
					-- Traceback (most recent call last):
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
					--     return _build_function_definition(prototype, state.header)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
					--     node.statements.contents = _build_function_blocks(state, instructions)
					--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
					--     statement, line_marked_elements = _build_statement(state, addr, instruction)
					--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
					--     return _build_var_assignment(state, addr, instruction)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
					--     assn = func(*args, **kwargs)
					--            ^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
					--     expression = _build_const_expression(state, addr, instruction)
					--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
					--     return _build_string_constant(state, instruction.CD)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
					--     node.value = state.constants.complex_constants[index]
					--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
					-- IndexError: list index out of range
				end
			})
		else
			slot2()
		end
	end,
	onPerviewClick = function (slot0)
		gGameUI:stackUI("city.drawcard.preview", nil, {
			blackLayer = true,
			clickClose = true
		}, slot0.curType:read(), slot0.diamondDataId)
	end
}
