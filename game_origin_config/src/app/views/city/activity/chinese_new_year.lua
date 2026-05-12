slot0 = {
	IDLE = 1,
	MOVE = 2
}
slot1 = class("ChineseNewYearDialog", Dialog)
slot1.RESOURCE_FILENAME = "activity_chinese_new_year.json"
slot1.RESOURCE_BINDING = {
	text = "panelText",
	item = "item",
	shade = "shade",
	number2 = "number2",
	text1 = "text1",
	time = "time",
	["bg.bg"] = "bg",
	anima = "anima",
	number1 = "number1",
	["btn.txt"] = "btnName",
	text2 = "text2",
	close = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	init = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("initDate")
			}
		}
	},
	list = {
		varname = "listview",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				itemSize = 50,
				asyncPreload = 5,
				backupCached = false,
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if itertools.size(slot0.members) == itertools.size(slot1.members) and itertools.size(slot0.members) == slot0.total_count then
						return slot1.created_time < slot0.created_time
					elseif itertools.size(slot0.members) == slot0.total_count then
						return false
					elseif itertools.size(slot1.members) == slot1.total_count then
						return true
					else
						slot2 = false
						slot3 = false

						if slot0.members[slot0.roleId] then
							slot2 = true
						end

						if slot1.members[slot1.roleId] then
							slot3 = true
						end

						if slot2 and slot3 then
							return slot1.created_time < slot0.created_time
						elseif slot2 then
							return false
						elseif slot3 then
							return true
						elseif itertools.size(slot0.members) == itertools.size(slot1.members) then
							return slot1.created_time < slot0.created_time
						else
							return itertools.size(slot0.members) < itertools.size(slot1.members)
						end
					end
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("item"):get("anima"):removeAllChildren()
					slot1:get("item"):get("anima"):alignCenter(slot1:get("item"):size())
					slot1:get("item"):get("txt"):text(slot3.message)
					slot1:get("item"):get("icon"):get("name"):text(slot3.role_name)

					if slot3.game_key then
						slot1:get("item"):get("icon"):get("name1"):text(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key, true)))
					else
						slot1:get("item"):get("icon"):get("name1"):hide()
						slot1:get("item"):get("icon"):get("name"):y(60)
					end

					slot1:get("item"):get("open"):get("text"):text(itertools.size(slot3.members) .. "/" .. slot3.total_count)

					function slot4(slot0)
						widget.addAnimation(slot0:get("item"):get("anima"), "chunjiehongbao/chunjiehongbao.skel", "effect_dailingqu_loop", 5):alignCenter(slot0:size()):scale(2)
					end

					if itertools.size(slot3.members) == slot3.total_count then
						function ()
							uv0 = "get"
							slot0 = slot0:get("item"):get("shade")
							slot0 = slot0.visible

							slot0(slot0, true)

							uv0 = "get"
							slot0 = slot0:get("item"):get("get")
							slot0 = slot0.visible

							slot0(slot0, true)

							uv0 = "get"
							slot0 = slot0:get("item"):get("opendown")
							slot0 = slot0.visible

							slot0(slot0, false)

							uv0 = "get"
							slot0 = slot0:get("item"):get("iconBg")
							slot0 = slot0.visible

							slot0(slot0, true)

							uv0 = "get"
							slot0 = slot0:get("item"):get("icon"):get("name")
							slot0 = slot0.text

							slot0(slot0, gLanguageCsv.clickinfo)

							uv0 = "get"
							slot0 = slot0:get("item"):get("icon"):get("name")
							slot0 = slot0.y

							slot0(slot0, 60)

							uv0 = "get"
							slot0 = slot0:get("item"):get("icon"):get("name1")
							slot0 = slot0.hide

							slot0(slot0)

							uv0 = "get"
							slot0 = slot0:get("item"):get("open")
							slot0 = slot0.texture

							slot0(slot0, "activity/chinese_new_year/hb_cs_yl.png")

							uv0 = "get"
							slot2 = "text"
							slot0 = slot0:get("item"):get("open"):get(slot2)
							slot0 = slot0.alignCenter
							uv2 = "get"

							slot0(slot0, slot2:get("item"):get("open"):size())

							uv0 = "get"

							slot0:get("item"):get("bg"):texture("activity/chinese_new_year/hb_bg2yl.png")
						end()
						slot1:get("item"):get("get"):get("text"):text(gLanguageCsv.robcomplete)
						slot1:get("item"):get("get"):get("text"):setTextColor(ui.COLORS.NORMAL.GREEN)
						slot1:get("item"):get("open"):get("text"):setTextColor(ui.COLORS.NORMAL.WARM_YELLOW)
					elseif slot3.members[slot3.roleId] then
						slot5()
					else
						slot1:get("item"):get("open"):texture("activity/chinese_new_year/hb_cs.png")
						slot1:get("item"):get("bg"):texture("activity/chinese_new_year/hb_bg1.png")
						slot1:get("item"):get("open"):get("text"):setTextColor(ui.COLORS.NORMAL.GREEN)
						slot4(slot1)
					end

					bind.touch(slot0, slot1:get("item"), {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("getPackage")
			}
		}
	},
	btn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("sendRedPackage")
			}
		}
	},
	["init.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = ui.COLORS.NORMAL.CLARET
				}
			}
		}
	}
}

function slot1.initModel(slot0)
	slot0.sendredPacket = gGameModel.daily_record:getIdler("huodong_redPacket_send")
	slot0.getredPacket = gGameModel.daily_record:getIdler("huodong_redPacket_rob")

	if slot0.yyCfg.type == game.YYHUODONG_TYPE_ENUM_TABLE.huodongCrossRedPacket then
		slot0.sendredPacket = gGameModel.daily_record:getIdler("huodong_cross_redPacket_send")
		slot0.getredPacket = gGameModel.daily_record:getIdler("huodong_cross_redPacket_rob")
	end

	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.roleId = gGameModel.role:getIdler("id")
	slot0.tabDatas = idlers.newWithMap({})
end

function slot1.onCreate(slot0, slot1, slot2, slot3)
	slot0.id = slot1
	slot0.dateTab = slot2
	slot0.str = slot3
	slot0.yyCfg = csv.yunying.yyhuodong[slot0.id]

	slot0:initModel()

	slot0.textPosX = slot0.text1:x()
	slot0.numberPosX = slot0.number1:x()

	slot0.btnName:text(gLanguageCsv.sendRedPack)
	idlereasy.any({
		slot0.sendredPacket,
		slot0.getredPacket
	}, function (slot0, slot1, slot2)
		uv3 = "getVipNum"
		uv5 = "getVipNum"
		slot5 = slot5.vipLevel:read()
		slot3.getVipNum = gVipCsv[slot5].huodongRedPacketRob
		uv3 = "getVipNum"
		uv5 = "getVipNum"
		slot5 = slot5.vipLevel:read()
		slot4 = gVipCsv[slot5].huodongRedPacketSend
		slot3.sendVipNum = slot4
		uv3 = "getVipNum"
		uv4 = "getVipNum"
		uv5 = "getVipNum"
		slot5 = slot5.number1
		slot5 = slot5.text
		uv9 = "getVipNum"
		slot9 = slot9.sendVipNum

		slot5(slot5, slot3.sendVipNum - slot1 .. "/" .. slot9)

		uv5 = "getVipNum"
		slot5 = slot5.number2
		slot5 = slot5.text
		uv9 = "getVipNum"
		slot9 = slot9.getVipNum

		slot5(slot5, slot4.getVipNum - slot2 .. "/" .. slot9)

		uv5 = "getVipNum"
		slot5 = slot5.number2
		slot6 = slot5
		uv6 = "getVipNum"
		slot6 = slot6.number2:width()
		uv6 = "getVipNum"
		slot6 = slot6.text2
		slot6 = slot6.x
		slot8 = slot5.x(slot6) - slot6

		slot6(slot6, slot8)

		uv6 = "getVipNum"
		slot6 = slot6.text1
		slot6 = slot6.x
		uv8 = "getVipNum"
		uv9 = "getVipNum"
		slot9 = slot9.number1:width() / 2
		slot8 = slot8.textPosX - slot9

		slot6(slot6, slot8)

		uv6 = "getVipNum"
		slot6 = slot6.number1
		slot6 = slot6.x
		uv8 = "getVipNum"
		uv9 = "getVipNum"

		slot6(slot6, slot8.numberPosX - slot9.number1:width() / 2)

		uv6 = "getVipNum"

		if slot6.sendVipNum == slot1 then
			uv6 = "getVipNum"

			slot6.number1:setTextColor(ui.COLORS.NORMAL.WARM_YELLOW)
		end

		uv6 = "getVipNum"

		if slot6.getVipNum == slot2 then
			uv6 = "getVipNum"

			slot6.number2:setTextColor(ui.COLORS.NORMAL.WARM_YELLOW)
		end
	end)

	slot0.animaBg = widget.addAnimation(slot0.anima, "chunjiehongbao/chunjiehongbao.skel", "effect_loop", 5):alignCenter(slot0.anima:size()):scale(2)

	if slot2 and not slot3 then
		if slot2[1] then
			slot0.tabDatas:update(slot2)
		else
			slot0.bg:visible(true)
		end
	else
		slot0:initDate()
	end

	slot5, slot6 = time.getHourAndMin(slot4.endTime)
	slot7 = time.getNumTimestamp(slot4.endDate, slot5, slot6)

	function slot8()
		uv1 = "time"
		slot1 = slot1 - time.getTime()
		uv1 = "getCutDown"
		slot1 = slot1.time
		slot1 = slot1.text

		slot1(slot1, time.getCutDown(slot1).str)

		uv1 = "time"

		if slot1 - time.getTime() <= 0 then
			uv1 = "getCutDown"
			slot1 = slot1.time
			slot1 = slot1.visible

			slot1(slot1, false)

			uv1 = "getCutDown"
			slot1 = slot1.panelText
			slot1 = slot1.visible

			slot1(slot1, false)

			uv1 = "getCutDown"

			slot1:onClose()

			return false
		end

		return true
	end

	slot0:enableSchedule()
	slot0:schedule(function ()
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
	end, 1, 0, 2)
	Dialog.onCreate(slot0)
end

function slot1.externalDate(slot0)
	slot0.dateTab = nil

	slot0.shade:visible(false)
	slot0.anima:get("anima"):removeAllChildren()
	slot0:initDate()
end

function slot1.initDate(slot0)
	if slot0.dateTab and slot0.dateTab.role_id and not slot0.str then
		slot0.dateTab = nil
	end

	slot1 = "/game/yy/red/packet/list"

	if slot0.yyCfg.type == game.YYHUODONG_TYPE_ENUM_TABLE.huodongCrossRedPacket then
		slot1 = "/game/yy/cross/red/packet/list"
	end

	gGameApp:requestServer(slot1, function (slot0)
		if itertools.size(slot0.view.packets) >= 1 then
			for slot4, slot5 in pairs(slot0.view.packets) do
				uv6 = "itertools"
				slot5.roleId = slot6.roleId:read()
			end

			uv1 = "itertools"

			slot1.tabDatas:update(clone(slot0.view.packets))
		end

		uv1 = "itertools"
		slot1 = slot1.bg
		slot1 = slot1.visible

		slot1(slot1, itertools.size(slot0.view.packets) < 1)

		uv1 = "itertools"

		if slot1.dateTab then
			uv1 = "itertools"

			if slot1.str then
				uv1 = "itertools"
				slot1 = slot1.shade
				slot2 = slot1

				slot1.visible(slot2, true)

				uv2 = "itertools"

				performWithDelay(slot2, function ()
					uv0 = "resultInfo"
					uv2 = "resultInfo"
					uv3 = "dateTab"

					slot0:resultInfo(slot2.dateTab, slot3.MOVE)
				end, 0.6)

				return
			end
		end
	end)
end

function slot1.resultInfo(slot0, slot1, slot2)
	slot3 = {}
	slot4 = nil
	slot5 = false
	slot6 = nil

	if slot2 then
		function ()
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
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
			--     return _build_numeric_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
			--     number = state.constants.numeric_constants[index]
			--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end(slot1)
	else
		slot8 = "/game/yy/red/packet/rob"

		if slot0.yyCfg.type == game.YYHUODONG_TYPE_ENUM_TABLE.huodongCrossRedPacket then
			slot8 = "/game/yy/cross/red/packet/rob"
		end

		gGameApp:requestServer(slot8, function (slot0)
			uv1 = "view"

			slot1(slot0.view.info)
		end, slot1.idx)
	end
end

function slot1.getPackage(slot0, slot1, slot2, slot3)
	slot4 = false

	if slot0.getredPacket:read() == slot0.getVipNum then
		slot4 = true
	end

	if itertools.size(slot3.members) >= 1 then
		for slot8, slot9 in csvMapPairs(slot3.members) do
			if slot0.roleId:read() == slot9.id then
				slot4 = true
			end
		end
	end

	if itertools.size(slot3.members) == slot3.total_count then
		slot4 = true
	end

	if not slot4 then
		slot0:resultInfo(slot3)
	else
		uv8 = "getredPacket"

		slot0:resultInfo(slot3, slot8.IDLE)
	end
end

function slot1.sendRedPackage(slot0)
	gGameUI:stackUI("city.activity.buy_festival_info", nil, , slot0.id, slot0:createHandler("initDate"))
end

return slot1
