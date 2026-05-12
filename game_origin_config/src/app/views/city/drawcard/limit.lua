slot1 = require("app.views.city.drawcard.tools")

return {
	initPageItemFunc = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
		slot0.limitDataId = slot0:getTabYYID()
		slot9 = slot0:addEffectInRect("effect/xianshichouka.skel")

		slot0.isLimitDraw:set(true)
		slot0.isCutDown:set(false)
		slot0.isFree:set(false)
		slot0.isCost:set(true)

		slot10 = csv.yunying.yyhuodong[slot0.limitDataId].paramMap
		slot11 = csv.yunying.yyhuodong[slot0.limitDataId].clientParam
		slot12 = "common/icon/icon_diamond.png"
		slot13 = "common/icon/icon_diamond.png"
		slot14 = slot10.RMB1
		slot15 = slot10.RMB10
		slot16 = dataEasy.getNumByKey(game.ITEM_TICKET.limitCard)

		if not isFree and slot16 > 0 then
			slot12 = dataEasy.getIconResByKey(game.ITEM_TICKET.limitCard)
			slot14 = string.format("%s/%s", slot16, 1)
		end

		if slot16 >= 10 then
			slot13 = dataEasy.getIconResByKey(game.ITEM_TICKET.limitCard)
			slot15 = string.format("%s/%s", slot16, 10)
		end

		slot0.oneIconPath:set(slot12)
		slot0.tenIconPath:set(slot13)
		slot0.drawOnceCost:set(slot14)
		slot0.drawTenCost:set(slot15)

		slot17 = slot0.limitPanel

		slot17:removeChildByName("richText")
		slot0:initCountDown(slot17)

		slot19 = true

		if csv.yunying.draw_limit[slot11.limitId].card2 or slot18.res2 then
			slot19 = false
		end

		slot17:get("single"):visible(slot19)
		slot17:get("double"):visible(not slot19)

		if slot19 then
			slot0:initCardData(slot18, slot17:get("single"), 1, {})
		else
			slot9:play("effect2_loop")

			for slot25 = 1, #{
				"left",
				"right"
			} do
				slot0:initCardData(slot18, slot17:get("double"):get(slot21[slot25]), slot25, slot20)

				if slot21[slot25] == "right" then
					adapt.oneLinePos(slot26:get("info.img2"), slot26:get("info.img1"), cc.p(25, 0), "right")
				end

				adapt.oneLinePos(slot26:get("info.img2"), slot26:get("info.btnJump"), cc.p(10, 0))
			end
		end

		slot21 = {}

		for slot26, slot27 in ipairs(slot20) do
			table.insert(slot21, csv.cards[slot27].name)
		end

		slot17:get("title.textNote2"):text(table.concat(slot21, gLanguageCsv.symbolComma))

		slot23 = slot17:get("title")

		adapt.oneLineCenterPos(cc.p(slot23:get("imgBg"):xy()), {
			slot23:get("textNote1"),
			slot23:get("textNote2")
		})
		slot23:get("imgBg"):width(slot23:get("textNote1"):width() + slot23:get("textNote2"):width() + 40)
	end,
	initCountDown = function (slot0, slot1)
		slot2, slot3 = time.getActivityDate(slot0.limitDataId)

		bind.extend(slot0, slot1:get("time"):get("textTime"), {
			class = "cutdown_label",
			props = {
				tag = 1,
				endTime = time.getTimestamp(slot3) + 1,
				callFunc = function ()
					slot0 = adapt.oneLineCenterPos
					uv2 = "adapt"
					slot2 = slot2:get("imgBg")
					slot3 = slot2
					uv3 = "adapt"
					slot3 = slot3:get("textNote")
					uv3 = "adapt"

					slot0(cc.p(slot2.xy(slot3)), {
						slot3,
						slot3:get("textTime")
					})

					uv0 = "adapt"
					slot2 = "imgBg"
					uv2 = "adapt"
					slot2 = slot2:get("textNote")
					slot3 = slot2
					uv3 = "adapt"

					slot0:get(slot2):width(slot2.width(slot3) + slot3:get("textTime"):width() + 40)
				end,
				onNode = function (slot0)
				end
			}
		})
	end,
	isEnoughToDrawFunc = function (slot0, slot1)
		slot3 = slot0.rmb:read()
		slot4 = csv.yunying.yyhuodong[slot0.limitDataId].paramMap
		slot5 = slot4.RMB1
		slot6 = slot4.RMB10

		if dataEasy.getNumByKey(game.ITEM_TICKET.limitCard) > 0 then
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
		if dataEasy.getNumByKey(game.ITEM_TICKET.limitCard) > 0 then
			function ()
				uv4 = "gGameApp"

				gGameApp:requestServer("/game/yy/award/draw", function (slot0)
					uv1 = "topView"

					slot1.topView:hide()

					slot1 = audio.pauseMusic

					slot1()

					uv1 = "topView"
					slot1 = slot1.isShowEffect
					slot1 = slot1.set

					slot1(slot1, true)

					uv1 = "topView"
					slot1 = slot1.effectView
					slot2 = slot1

					slot1.removeAllChildren(slot2)

					uv2 = "topView"
					slot3 = 2
					uv3 = "topView"
					slot2, slot7, slot4 = dataEasy.getRawTable(slot0)
					slot5 = dataEasy.getItems(slot2, slot7)
					uv7 = "topView"
					slot8 = csv.yunying.yyhuodong[slot7.limitDataId].type == game.YYHUODONG_TYPE_ENUM_TABLE.timeLimitDraw and "effect_bj_houduan" or "effect_bj_houduan2"
					slot9 = {
						drawType = "limit",
						isFree = false,
						times = 1,
						items = slot5,
						yyId = slot10.limitDataId,
						closeCb = slot10
					}
					uv10 = "topView"
					uv10 = "hide"
					slot10, slot11 = function ()
						uv0 = "isShowEffect"
						slot0 = slot0.isShowEffect
						slot0 = slot0.set

						slot0(slot0, true)

						uv0 = "isShowEffect"
						slot0 = slot0.effectView
						slot1 = slot0

						slot0.removeAllChildren(slot1)

						uv1 = "isShowEffect"
						uv4 = "set"
						slot2 = 2
						uv2 = "isShowEffect"

						widget.addAnimationByKey(slot1.effectView, "effect/xianshichouka.skel", "effectBlack", slot4, 999):scale(slot2):alignCenter(slot2.effectView:size()):setSpriteEventHandler(function (slot0, slot1)
							uv2 = "isShowEffect"
							slot2 = slot2.isShowEffect
							slot2 = slot2.set

							slot2(slot2, false)

							uv2 = "isShowEffect"

							slot2.topView:show()
						end, sp.EventType.ANIMATION_COMPLETE)
					end.hasCard(slot5[1])
					uv12 = "hide"
					uv13 = "topView"
					uv15 = "topView"
					slot15 = slot5[1]
					uv15 = "topView"

					slot12.addLight(slot13, {
						count = 1,
						parent = slot15.effectView,
						parentEffect = widget.addAnimationByKey(slot2.effectView, "effect/xianshichouka.skel", "effect", "effect_danchou", 10):scale(slot3):alignCenter(slot3.effectView:size()),
						datas = slot15,
						cloneItem = slot15.item
					})

					uv13 = "topView"

					performWithDelay(slot13.effectView, function ()
						slot0 = 0
						uv1 = "play"

						if slot1 then
							uv1 = "effect_zhanshi"
							slot2 = slot1
							slot1 = slot1.play
							slot3 = "effect_zhanshi"

							slot1(slot2, slot3)

							uv1 = "addCardImg"
							uv2 = "effectView"
							uv3 = "performWithDelay"
							slot0 = 2.3333333333333335 + slot1.addCardImg(slot2, slot3.effectView)
						end

						uv2 = "performWithDelay"

						performWithDelay(slot2, function ()
							uv0 = "isShowEffect"

							slot0.isShowEffect:set(false)

							uv5 = "set"

							gGameUI:stackUI("city.drawcard.result", nil, , slot5)
						end, slot0)
					end, 1.1666666666666667)
				end, slot4.limitDataId, "limit_rmb1")
			end()
		else
			dataEasy.sureUsingDiamonds(slot2, csv.yunying.yyhuodong[slot0.limitDataId].paramMap.RMB1)
		end
	end,
	drawTenClickFunc = function (slot0)
		slot1 = false

		if dataEasy.getNumByKey(game.ITEM_TICKET.limitCard) < 10 then
			slot1 = true
		end

		function slot2()
			uv4 = "gGameApp"

			gGameApp:requestServer("/game/yy/award/draw", function (slot0)
				uv1 = "topView"

				slot1.topView:hide()

				slot1 = audio.pauseMusic

				slot1()

				uv1 = "topView"
				slot1 = slot1.isShowEffect
				slot1 = slot1.set

				slot1(slot1, true)

				uv1 = "topView"
				slot1 = slot1.effectView
				slot2 = slot1

				slot1.removeAllChildren(slot2)

				uv2 = "topView"
				slot3 = 2
				uv3 = "topView"
				slot2, slot7, slot4 = dataEasy.getRawTable(slot0)
				slot5 = dataEasy.getItems(slot2, slot7)
				uv7 = "topView"
				slot8 = csv.yunying.yyhuodong[slot7.limitDataId].type == game.YYHUODONG_TYPE_ENUM_TABLE.timeLimitDraw and "effect_bj_houduan" or "effect_bj_houduan2"
				slot9 = {
					drawType = "limit",
					isFree = false,
					times = 10,
					items = slot5,
					yyId = slot10.limitDataId,
					closeCb = slot10
				}
				uv10 = "topView"
				uv10 = "hide"
				slot10, slot11 = function ()
					uv0 = "isShowEffect"
					slot0 = slot0.isShowEffect
					slot0 = slot0.set

					slot0(slot0, true)

					uv0 = "isShowEffect"
					slot0 = slot0.effectView
					slot1 = slot0

					slot0.removeAllChildren(slot1)

					uv1 = "isShowEffect"
					uv4 = "set"
					slot2 = 2
					uv2 = "isShowEffect"

					widget.addAnimationByKey(slot1.effectView, "effect/xianshichouka.skel", "effectBlack", slot4, 999):scale(slot2):alignCenter(slot2.effectView:size()):setSpriteEventHandler(function (slot0, slot1)
						uv2 = "isShowEffect"
						slot2 = slot2.isShowEffect
						slot2 = slot2.set

						slot2(slot2, false)

						uv2 = "isShowEffect"

						slot2.topView:show()
					end, sp.EventType.ANIMATION_COMPLETE)
				end.hasCard(slot5[1])
				uv12 = "hide"
				uv13 = "topView"
				uv15 = "topView"
				slot15 = slot5[1]
				uv15 = "topView"

				slot12.addLight(slot13, {
					count = 10,
					parent = slot15.effectView,
					parentEffect = widget.addAnimationByKey(slot2.effectView, "effect/xianshichouka.skel", "effect", "effect_shilianchou", 10):scale(slot3):alignCenter(slot3.effectView:size()),
					datas = slot15,
					cloneItem = slot15.item
				})

				uv13 = "topView"

				performWithDelay(slot13.effectView, function ()
					slot0 = 0
					uv1 = "play"

					if slot1 then
						uv1 = "effect_zhanshi"
						slot2 = slot1
						slot1 = slot1.play
						slot3 = "effect_zhanshi"

						slot1(slot2, slot3)

						uv1 = "addCardImg"
						uv2 = "effectView"
						uv3 = "performWithDelay"
						slot0 = 2.3333333333333335 + slot1.addCardImg(slot2, slot3.effectView)
					end

					slot1 = performWithDelay
					uv2 = "performWithDelay"

					slot1(slot2, function ()
						uv0 = "isShowEffect"

						slot0.isShowEffect:set(false)

						uv5 = "set"

						gGameUI:stackUI("city.drawcard.result", nil, , slot5)
					end, slot0)

					uv1 = "userDefault"

					if slot1 then
						userDefault.setCurrDayKey("limitDrawTip", 0)
					end
				end, 3.6666666666666665)
				sdk.trackEvent("limitedraw_10x")
			end, slot4.limitDataId, "limit_rmb10")
		end

		if slot1 and matchLanguage({
			"kr"
		}) or userDefault.getCurrDayKey("limitDrawTip", 1) == 1 and dataEasy.isUnlock("limitDrawTips") then
			gGameUI:showDialog({
				isRich = true,
				clearFast = true,
				btnType = 2,
				content = string.format(gLanguageCsv.draw10CardTips, csv.yunying.yyhuodong[slot0.limitDataId].paramMap.RMB10),
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
		}, slot0.curType:read(), slot0.limitDataId)
	end
}
