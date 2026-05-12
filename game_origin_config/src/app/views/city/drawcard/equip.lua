return {
	initPageItemFunc = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
		slot9 = slot0.imgBG

		widget.addAnimationByKey(slot9, "effect/xiedaidaoju.skel", "effectBg", "effect_loop", 999):alignCenter(slot9:size())
		slot0.isLimitDraw:set(false)

		slot10 = slot7 < 1

		slot0.isFree:set(slot10)
		slot0.isCost:set(not slot10)
		slot0.freeTxt:text(gLanguageCsv.freeCount)
		slot0.txtFree:text(gLanguageCsv.free)
		text.addEffect(slot0.txtFree, {
			color = cc.c4b(177, 233, 126, 255)
		})
		slot0.freeTimes:set("1/1")
		slot0.isCutDown:set(false)

		slot11 = "common/icon/icon_diamond.png"
		slot12 = "common/icon/icon_diamond.png"
		slot13 = gCommonConfigCsv.drawEquipCostPrice
		slot14 = gCommonConfigCsv.draw10EquipCostPrice
		slot15 = dataEasy.getNumByKey(game.ITEM_TICKET.equipCard)

		if not slot10 and slot15 > 0 then
			slot11 = dataEasy.getIconResByKey(game.ITEM_TICKET.equipCard)
			slot13 = string.format("%s/%s", slot15, 1)
		end

		if slot15 >= 10 then
			slot12 = dataEasy.getIconResByKey(game.ITEM_TICKET.equipCard)
			slot14 = string.format("%s/%s", slot15, 10)
		end

		slot0.oneIconPath:set(slot11)
		slot0.tenIconPath:set(slot12)
		slot0.drawOnceCost:set(slot13)
		slot0.drawTenCost:set(slot14)
	end,
	isEnoughToDrawFunc = function (slot0, slot1)
		slot3 = slot0.rmb:read()
		slot4 = gCommonConfigCsv.drawEquipCostPrice
		slot5 = gCommonConfigCsv.draw10EquipCostPrice

		if dataEasy.getNumByKey(game.ITEM_TICKET.equipCard) > 0 then
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
		slot0.canClick:set(false)

		if slot0.isFree:read() or dataEasy.getNumByKey(game.ITEM_TICKET.equipCard) > 0 then
			function ()
				uv4 = "requestServer"

				gGameApp:requestServer("/game/lottery/equip/draw", function (slot0)
					uv1 = "imgBG"

					if slot1.imgBG:getChildByName("effectBg") then
						slot1:play("effect")
						performWithDelay(slot1, function ()
							uv0 = "canClick"
							slot0 = slot0.canClick
							slot0 = slot0.set

							slot0(slot0, true)

							uv0 = "set"
							slot1 = slot0

							slot0.play(slot1, "effect_loop")

							uv1 = "play"
							slot0, slot1, slot2 = dataEasy.getRawTable(slot1)
							slot3 = dataEasy.getItems(slot0, slot1)
							slot3[1].equip_awake_frag = 1

							gGameUI:stackUI("city.drawcard.result", nil, {
								full = false
							}, {
								drawType = "equip",
								isFree = false,
								times = 1,
								items = slot3
							})
						end, 3)
					end
				end, slot4 and "free1" or "rmb1")
			end()
		else
			dataEasy.sureUsingDiamonds(slot3, gCommonConfigCsv.drawEquipCostPrice)
		end
	end,
	drawTenClickFunc = function (slot0)
		slot1 = false

		if dataEasy.getNumByKey(game.ITEM_TICKET.equipCard) < 10 then
			slot1 = true
		end

		function slot2()
			slot0 = sdk.trackEvent

			slot0("trinket_10x")

			uv0 = "sdk"

			slot0.canClick:set(false)
			gGameApp:requestServer("/game/lottery/equip/draw", function (slot0)
				uv1 = "imgBG"

				if slot1.imgBG:getChildByName("effectBg") then
					slot1:play("effect")
					performWithDelay(slot1, function ()
						uv0 = "canClick"
						slot0 = slot0.canClick
						slot0 = slot0.set

						slot0(slot0, true)

						uv0 = "set"
						slot1 = slot0

						slot0.play(slot1, "effect_loop")

						uv1 = "play"
						slot0, slot1, slot2 = dataEasy.getRawTable(slot1)
						slot3 = dataEasy.getItems(slot0, slot1)
						slot3[1].equip_awake_frag = 10

						gGameUI:stackUI("city.drawcard.result", nil, {
							full = false
						}, {
							drawType = "equip",
							isFree = false,
							times = 10,
							items = slot3
						})
					end, 3)
				end

				uv2 = "getChildByName"

				if slot2 then
					userDefault.setCurrDayKey("equipDrawTips", 0)
				end
			end, "rmb10")
		end

		if slot1 and matchLanguage({
			"kr"
		}) or userDefault.getCurrDayKey("equipDrawTips", 1) == 1 and dataEasy.isUnlock("equipDrawTips") then
			gGameUI:showDialog({
				isRich = true,
				clearFast = true,
				btnType = 2,
				content = string.format(gLanguageCsv.draw10CardTips, gCommonConfigCsv.draw10EquipCostPrice),
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
	end
}
