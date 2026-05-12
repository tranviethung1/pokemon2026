slot1 = {
	ONCE = gCommonConfigCsv.drawCardUp1CostPrice,
	TEN = gCommonConfigCsv.drawCardUp10CostPrice
}

return {
	initPageItemFunc = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
		slot0.isLimitDraw:set(true)
		slot0.isCutDown:set(false)
		slot0.isFree:set(false)

		slot11 = true

		slot0.isCost:set(slot11)

		slot9 = "common/icon/icon_diamond.png"
		slot10 = "common/icon/icon_diamond.png"
		uv11 = "isLimitDraw"
		slot11 = slot11.ONCE
		uv12 = "isLimitDraw"
		slot12 = slot12.TEN

		if dataEasy.getNumByKey(game.ITEM_TICKET.diamondUpCard) > 0 then
			slot9 = dataEasy.getIconResByKey(game.ITEM_TICKET.diamondUpCard)
			slot11 = string.format("%s/%s", slot13, 1)
		end

		if slot13 >= 10 then
			slot10 = dataEasy.getIconResByKey(game.ITEM_TICKET.diamondUpCard)
			slot12 = string.format("%s/%s", slot13, 10)
		end

		slot0.oneIconPath:set(slot9)
		slot0.tenIconPath:set(slot10)
		slot0.drawOnceCost:set(slot11)
		slot0.drawTenCost:set(slot12)
		slot0:initCards()
	end,
	initCards = function (slot0)
		slot0.diamondUpCardPanel:removeAllChildren()

		slot1 = {}

		for slot5, slot6 in csvMapPairs(csv.draw_card_up_group) do
			if slot5 == slot0:makeSelectPositive(slot0.selfChooseNum:read()) then
				slot1 = slot6.cards

				break
			end
		end

		slot2 = table.getn(slot1)
		slot3 = {}

		for slot7, slot8 in pairs(slot1) do
			table.insert(slot3, {
				id = slot8,
				rarity = csv.unit[csv.cards[slot8].unitID].rarity
			})
		end

		table.sort(slot3, function (slot0, slot1)
			return slot0.rarity < slot1.rarity
		end)

		slot4 = slot0.diamondUpCardPanel:size().width - 200
		slot5 = slot2 % 2 == 0 and 60 or 80
		slot6 = 35
		slot7 = 400
		slot8 = 1

		if slot2 >= 10 then
			slot8 = 0.7
		elseif slot2 >= 6 then
			slot8 = 0.7 + (10 - slot2) * 0.05
		end

		for slot12, slot13 in csvPairs(slot3) do
			slot14 = (slot2 + 1) / 2
			slot15 = slot0:createCard(slot13.id):addTo(slot0.diamondUpCardPanel)

			slot15:setAnchorPoint(cc.p(0.5, 0))
			slot15:x(slot4 / 2 + (slot12 - slot14) * slot4 / (slot2 + 1))
			slot15:y(slot5 / slot8 + math.abs(slot12 - slot14) * slot7 / (slot2 + 1))
			slot15:setRotation((slot12 - slot14) * slot6 / (slot2 + 1))
			slot15:z(100 - math.abs(slot12 - (math.floor(slot2 / 2) + 1)))
			slot15:scale(slot8)
		end
	end,
	makeSelectPositive = function (slot0, slot1)
		if not slot1 or slot1 == 0 then
			return 1
		end

		return slot1
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
	isEnoughToDrawFunc = function (slot0, slot1)
		slot3 = slot0.rmb:read()
		uv4 = "rmb"
		slot4 = slot4.ONCE
		uv5 = "rmb"
		slot5 = slot5.TEN

		if dataEasy.getNumByKey(game.ITEM_TICKET.diamondUpCard) > 0 then
			slot4 = 1
			slot2 = slot6

			if slot6 >= 10 then
				slot5 = 10
				slot3 = slot6
			end
		end

		if slot1 then
			return slot5 <= slot3
		else
			return slot4 <= slot2
		end
	end,
	drawOneClickFunc = function (slot0)
		if dataEasy.getNumByKey(game.ITEM_TICKET.diamondUpCard) > 0 then
			function ()
				uv5 = "gGameApp"
				uv7 = "gGameApp"

				gGameApp:requestServer("/game/lottery/card/up/draw", function (slot0)
					audio.pauseMusic()
					audio.playEffectWithWeekBGM("drawcard_one.mp3")

					slot1, slot2, slot3 = dataEasy.getRawTable(slot0)
					slot5 = nil
					uv7 = "audio"
					uv9 = "audio"
					slot7 = gGameUI
					slot7 = slot7.stackUI

					slot7(slot7, "city.drawcard.result", nil, , {
						drawType = "self_choose",
						isFree = false,
						times = 1,
						items = dataEasy.getItems(slot1, slot2),
						selfChooseType = slot7:makeSelectPositive(slot9.selfChooseNum:read()),
						cb = function ()
							uv0 = "initAward"

							slot0:initAward()
						end
					})

					uv7 = "audio"

					slot7:initAward()
				end, "group_up_rmb1", slot5:makeSelectPositive(slot7.selfChooseNum:read()))
			end()
		else
			uv5 = "dataEasy"

			dataEasy.sureUsingDiamonds(slot2, slot5.ONCE)
		end
	end,
	drawTenClickFunc = function (slot0)
		slot1 = false

		if dataEasy.getNumByKey(game.ITEM_TICKET.diamondUpCard) < 10 then
			slot1 = true
		end

		function slot2()
			uv5 = "gGameApp"
			uv7 = "gGameApp"

			gGameApp:requestServer("/game/lottery/card/up/draw", function (slot0)
				audio.pauseMusic()
				audio.playEffectWithWeekBGM("drawcard_ten.mp3")

				slot1, slot2, slot3 = dataEasy.getRawTable(slot0)
				slot5 = nil
				uv7 = "audio"
				uv9 = "audio"
				slot7 = gGameUI
				slot7 = slot7.stackUI

				slot7(slot7, "city.drawcard.result", nil, , {
					drawType = "self_choose",
					isFree = false,
					times = 10,
					items = dataEasy.getItems(slot1, slot2),
					selfChooseType = slot7:makeSelectPositive(slot9.selfChooseNum:read()),
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

				sdk.trackEvent("selctype_10x")
			end, "group_up_rmb10", slot5:makeSelectPositive(slot7.selfChooseNum:read()))
		end

		if slot1 and (matchLanguage({
			"kr"
		}) or userDefault.getCurrDayKey("diamondUpDrawTips", 1) == 1 and dataEasy.isUnlock("diamondUpDrawTips")) then
			uv3 = "dataEasy"

			gGameUI:showDialog({
				isRich = true,
				clearFast = true,
				btnType = 2,
				content = string.format(gLanguageCsv.draw10CardTips, slot3.TEN),
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
		}, slot0.curType:read(), nil, slot0:makeSelectPositive(slot0.selfChooseNum:read()))
	end
}
