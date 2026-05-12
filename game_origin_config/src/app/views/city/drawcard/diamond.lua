return {
	initPageItemFunc = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
		slot0:addEffectInRect("effect/zuanshichouka.skel")
		slot0.isLimitDraw:set(false)
		slot0.isFree:set(slot3 < 1)
		slot0.freeTxt:text(gLanguageCsv.freeCount)
		slot0.txtFree:text(gLanguageCsv.free)
		text.addEffect(slot0.txtFree, {
			color = cc.c4b(177, 233, 126, 255)
		})
		slot0.freeTimes:set("1/1")
		slot0.isCutDown:set(false)

		slot10 = "common/icon/icon_diamond.png"
		slot11 = "common/icon/icon_diamond.png"
		slot12 = gCommonConfigCsv.drawCardCostPrice
		slot13 = gCommonConfigCsv.draw10CardCostPrice

		if slot5 == 0 and not slot9 and dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.FirstRMBDrawCardHalf) ~= 0 then
			slot0.isHalf = true

			slot0.isCost:set(false)
			slot0.privilegePanel:show()

			slot15 = slot0.privilegePanel:multiget("line", "textNote", "imgIcon", "textCost", "textDiscount")

			slot15.textCost:text(slot12)
			slot15.textDiscount:text(slot12 * 0.5)
			slot15.line:size(slot15.textCost:size().width + 10, 7)
			adapt.oneLinePos(slot15.textNote, {
				slot15.textCost,
				slot15.textDiscount,
				slot15.imgIcon
			}, {
				cc.p(0, 0),
				cc.p(5, 0),
				cc.p(0, 0)
			})
			slot15.line:x(slot15.textCost:x() - 3)
		else
			slot0.privilegePanel:hide()
			slot0.isCost:set(not slot9)
		end

		slot15 = dataEasy.getNumByKey(game.ITEM_TICKET.rmbCard)

		if not slot9 and slot15 > 0 then
			slot10 = dataEasy.getIconResByKey(game.ITEM_TICKET.rmbCard)
			slot12 = string.format("%s/%s", slot15, 1)
		end

		if slot15 >= 10 then
			slot11 = dataEasy.getIconResByKey(game.ITEM_TICKET.rmbCard)
			slot13 = string.format("%s/%s", slot15, 10)
		end

		slot0.oneIconPath:set(slot10)
		slot0.tenIconPath:set(slot11)
		slot0.drawOnceCost:set(slot12)
		slot0.drawTenCost:set(slot13)
	end,
	isEnoughToDrawFunc = function (slot0, slot1)
		slot3 = slot0.rmb:read()
		slot5 = gCommonConfigCsv.draw10CardCostPrice

		if slot0.isHalf then
			slot4 = gCommonConfigCsv.drawCardCostPrice / 2
		end

		if dataEasy.getNumByKey(game.ITEM_TICKET.rmbCard) > 0 then
			if not slot6 then
				slot4 = 1
				slot2 = slot7
			end

			if slot7 >= 10 then
				slot5 = 10
				slot3 = slot7
			end
		end

		if slot1 then
			return slot5 <= slot3
		else
			return slot4 <= slot2
		end
	end,
	drawOneClickFunc = function (slot0)
		slot2 = slot0.isHalf

		if slot0.isFree:read() or dataEasy.getNumByKey(game.ITEM_TICKET.rmbCard) > 0 or slot0.isHalf then
			function ()
				uv4 = "gGameApp"

				gGameApp:requestServer("/game/lottery/card/draw", function (slot0)
					audio.pauseMusic()
					audio.playEffectWithWeekBGM("drawcard_one.mp3")

					slot1, slot2, slot3 = dataEasy.getRawTable(slot0)
					slot5 = nil
					uv7 = "audio"
					slot7 = gGameUI
					slot7 = slot7.stackUI

					slot7(slot7, "city.drawcard.result", nil, , {
						drawType = "diamond",
						times = 1,
						items = dataEasy.getItems(slot1, slot2),
						isFree = slot7,
						cb = function ()
							uv0 = "initAward"

							slot0:initAward()
						end
					})

					uv7 = "pauseMusic"
					slot7 = slot7.initAward

					slot7(slot7)

					uv7 = "playEffectWithWeekBGM"

					if slot7 then
						sdk.trackEvent("halfdia_singledraw")
					end
				end, slot4 and "free1" or "rmb1")
			end()
		else
			dataEasy.sureUsingDiamonds(slot4, gCommonConfigCsv.drawCardCostPrice)
		end

		if slot1 then
			sdk.trackEvent("free_diasingle")
		end
	end,
	drawTenClickFunc = function (slot0)
		slot1 = false

		if dataEasy.getNumByKey(game.ITEM_TICKET.rmbCard) < 10 then
			slot1 = true
		end

		slot2 = slot0.diamondAllCountTen:read()

		function slot3()
			gGameApp:requestServer("/game/lottery/card/draw", function (slot0)
				audio.pauseMusic()
				audio.playEffectWithWeekBGM("drawcard_ten.mp3")

				slot1, slot2, slot3 = dataEasy.getRawTable(slot0)
				slot5 = nil
				slot7 = gGameUI
				slot7 = slot7.stackUI

				slot7(slot7, "city.drawcard.result", nil, , {
					drawType = "diamond",
					isFree = false,
					times = 10,
					items = dataEasy.getItems(slot1, slot2),
					cb = function ()
						uv0 = "initAward"

						slot0:initAward()
					end
				})

				uv7 = "pauseMusic"

				if slot7 then
					userDefault.setCurrDayKey("diamondDrawTips", 0)
				end

				uv7 = "audio"
				slot7 = slot7.initAward

				slot7(slot7)

				uv7 = "playEffectWithWeekBGM"

				if slot7 == 0 then
					sdk.trackEvent("draw_10x")
				end

				sdk.trackEvent("diamond_10x")
			end, "rmb10")
		end

		if slot1 and (matchLanguage({
			"kr"
		}) or userDefault.getCurrDayKey("diamondDrawTips", 1) == 1 and dataEasy.isUnlock("diamondDrawTips")) then
			gGameUI:showDialog({
				isRich = true,
				clearFast = true,
				btnType = 2,
				content = string.format(gLanguageCsv.draw10CardTips, gCommonConfigCsv.draw10CardCostPrice),
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
			slot3()
		end
	end
}
