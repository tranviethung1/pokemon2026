slot0 = class("DebugArea", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	if EDITOR_ENABLE then
		slot0:addPauseBtn()
		slot0:addFrameControlBtn()
		slot0:addEffectControlBtn()
		slot0:addAutoTestDebug()
		slot0:addDebugEnabled()
		slot0:addFullManual()

		if slot0.parent.gateType ~= game.GATE_TYPE.newbie and slot0.parent.gateType ~= game.GATE_TYPE.test then
			slot0:addEnterCity()
		end

		slot0.backView = "city.view"
		slot0.layer = cc.Layer:create()

		slot0.layer:tag(6666)
		slot0.parent.layer:add(slot0.layer, 999)
		slot0:addSpeedControlBtn()
		slot0:addBattleRecordBtn()
	end
end

function slot1()
	slot0 = {}
	slot3 = 0

	for slot7, slot8 in pairs(require("editor.fs").listAllFiles("res/resources/battle/scene/", function (slot0)
		return slot0:match("%.[jpg|png]")
	end, false)) do
		slot9 = nil

		while true do
			if not string.find(slot7, "/") then
				break
			end

			slot7 = string.sub(slot7, slot10 + 1)
		end

		slot0[slot3 + 1] = "battle/scene/" .. slot7
	end

	return slot0
end

slot2 = nil

function slot0.chooseBgImage()
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
end

function slot0.newBtn(slot0, slot1, slot2, slot3)
	slot4 = cc.Label:createWithTTF(slot3, ui.FONT_PATH, 40)

	slot4:setPosition(106, 61)

	slot5 = ccui.Button:create("common/btn/btn_normal.png")

	slot5:add(slot4)
	slot5:setPressedActionEnabled(true)
	slot5:setPosition(cc.p(slot1, slot2))
	slot5:setOpacity(150)
	slot5:tag(6666)

	if slot0.layer then
		slot0.layer:add(slot5, 999)
	else
		slot0.parent.layer:add(slot5, 999)
	end

	slot5.content = slot4

	adapt.dockWithScreen(slot5, "left")
	slot5:setScaleY(0.8)

	return slot5
end

function slot0.addPauseBtn(slot0)
	slot0:newBtn(160, display.cy + 320, " stop!"):onClick(function ()
		if display.director:isPaused() then
			display.director:resume()

			slot0 = gRootViewProxy:proxy()
			slot0 = slot0.setEffectDebugBreakpoint

			slot0(slot0, nil)

			uv0 = "display"

			slot0.content:setString(" stop!")
		else
			slot0 = display.director
			slot0 = slot0.pause

			slot0(slot0)

			uv0 = "display"

			slot0.content:setString(" run! ")
		end
	end)
end

function slot0.addFrameControlBtn(slot0)
	slot0:newBtn(160, display.cy + 320 - 80, "下一帧"):onClick(function ()
		display.director:resume()

		slot1 = "resume"

		print(slot1)

		uv1 = "display"

		performWithDelay(slot1, function ()
			print("pause")
			display.director:pause()
		end, 0.016666666666666666)
	end)
end

function slot0.addEffectControlBtn(slot0)
	slot0:newBtn(160, display.cy + 320 - 160, "下一Effect"):onClick(function ()
		display.director:resume()
		print("resume effect")
		gRootViewProxy:proxy():setEffectDebugBreakpoint(function (slot0, slot1, slot2)
			print("pause effect", string.format("%d/%d", slot1, slot0.queTailID), slot2, toDebugString(slot2))
			display.director:pause()

			return false
		end)
	end)
end

function slot0.backToLogin(slot0)
	slot0.backView = "login.view"
end

function slot0.addEnterCity(slot0)
	slot0:newBtn(160, display.cy + 320 - 240, "返回主城"):onClick(function ()
		if gGameModel.role:getRawIdler_("gold") then
			print("refresh gold for test", slot0, gold)
			slot0:notify()
		end

		uv3 = "gGameModel"

		gGameUI:switchUI(slot3.backView)

		if slot0 then
			print("refresh gold for test", slot0, gold)
			slot0:notify()
		end
	end)
end

function slot0.addDebugEnabled(slot0)
	slot1 = false

	slot0:newBtn(160, display.cy + 320 - 640, "debug开关"):onClick(function ()
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
	end)
end

slot3, slot4 = nil

function slot0.addFullManual(slot0)
	uv0 = false
	slot0.btnFullManual = slot0:newBtn(160, display.cy + 320 - 720, "全局手动关")

	slot0.btnFullManual:onClick(function ()
		uv0 = "onChangeFullManual"

		slot0:onChangeFullManual()
	end)
end

function slot0.onChangeFullManual()
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
end

function slot0.addAutoTestDebug(slot0)
	slot0:newBtn(160, display.cy + 320 - 560, "模拟战斗100次"):onClick(function ()
		uv0 = "parent"
		slot0 = slot0.parent.data

		gGameUI:switchUI("city.view")
		performWithDelay(gGameUI.scene, function ()
			slot2 = 0

			for slot6 = 1, 100 do
				uv7 = "randSeed"
				slot8 = math.random(1, 99999999)
				slot7.randSeed = slot8
				uv8 = "randSeed"

				if battleEntrance.battleRecord(slot8, "unknown", {
					fromRecordFile = true
				}):run().result == "win" then
					slot1 = 0 + 1
				elseif slot7.result == "fail" then
					slot2 = slot2 + 1
				end

				slot13 = slot2

				print(string.format("[INFO] 当前: %d (%d vs %d)", slot0, slot1, slot13))

				uv13 = "randSeed"

				print(string.format("[INFO] RunTime: (%d/%d), Seed: %d", slot6, slot0, slot13.randSeed))
			end

			print(string.format("[INFO] 总战斗测试次数: %d 其中赢%d次 输%d次", slot0, slot1, slot2))
		end, 5)
	end)
end

function slot0.addSpeedControlBtn(slot0)
	slot0:newBtn(1150, 150, "加速"):onClick(function ()
		slot1 = math.min(20, display.director:getScheduler():getTimeScale() + 1)

		display.director:getScheduler():setTimeScale(slot1)
		gGameUI:showTip("加速，现在速度" .. slot1)
		print("speed up", slot1)
	end)
	slot0:newBtn(1150, 70, "减速"):onClick(function ()
		slot0 = display.director:getScheduler():getTimeScale()
		slot1 = slot0 - 1

		if slot0 - 1 < 1 then
			slot1 = slot0 - 0.3
		end

		slot2 = math.max(0.1, slot1)

		display.director:getScheduler():setTimeScale(slot2)

		if slot2 >= 1 then
			gGameUI:showTip("减速，现在速度" .. slot2)
		else
			gGameUI:cleanTip()
		end

		print("speed down", slot2)
	end)
end

function slot0.addFrontBgBtn(slot0)
	slot0:newBtn(1150, 150, "上一张"):onClick(function ()
		uv0 = "chooseBgImage"

		slot0:chooseBgImage("front")
	end)
end

function slot0.addBattleRecordBtn(slot0)
	slot2 = {}
	slot3 = {
		[3245.0] = true
	}

	slot0:newBtn(1150, 230, "战斗数据"):onClick(function ()
		if gGameUI.rootViewName:find("battle.view") then
			uv0 = "gGameUI"

			if not slot0.battleDataDisplay then
				slot0 = gGameUI.uiRoot._model.scene
				uv1 = "gGameUI"
				slot2 = gGameUI:createView("city.test.test_battle_data_display", gGameUI.uiRoot):init():z(999)
				slot1.battleDataDisplay = slot2
				uv2 = "gGameUI"
				slot2 = slot2.battleDataDisplay
				slot3 = slot2

				slot2.refresh(slot3, function ()
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
				end())

				uv3 = "gGameUI"

				schedule(slot3.battleDataDisplay, function ()
					uv0 = "battleDataDisplay"

					if slot0.battleDataDisplay:isVisible() then
						uv0 = "battleDataDisplay"
						uv2 = "isVisible"

						slot0.battleDataDisplay:refresh(slot2())
					end
				end, 0.03333333333333333)

				return
			end

			uv0 = "gGameUI"
			uv2 = "gGameUI"

			slot0.battleDataDisplay:visible(not slot2.battleDataDisplay:visible())
		end
	end)
end

function slot0.addBattleSpriteDebug(slot0)
	slot1 = false

	slot0:newBtn(1350, 150, "点位显示"):onClick(function ()
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
	end)
end

function slot0.addEffectDebug(slot0)
	slot1 = false

	slot0:newBtn(1350, 70, "Effect显示"):onClick(function ()
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
	end)
end

function slot0.addTintColorDebug(slot0)
	slot1 = false

	slot0:newBtn(950, 230, "TintColor开"):onClick(function ()
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
	end)
end

function slot0.addCRenderTargetDebug(slot0)
	slot1 = true

	slot0:newBtn(1150, 310, "RT关"):onClick(function ()
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
	end)
end

function slot0.addA4Debug(slot0)
	slot1 = false

	slot0:newBtn(1150, 230, "A4开"):onClick(function ()
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
	end)
end

function slot0.addThreadDebug(slot0)
	slot1 = false

	slot0:newBtn(1350, 310, "Thread开"):onClick(function ()
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
	end)
end

function slot0.addSpineDebug(slot0)
	slot0:newBtn(1350, 230, "Spine隐藏"):onClick(function ()
		slot0 = 0

		for slot4, slot5 in pairs(SpineSpritesMap) do
			if tolua.isnull(slot4) then
				printWarn("spine %s released but no gc", tostring(slot4))
			elseif slot4:isVisible() then
				printInfo("spine %s\t%s hide", tostring(slot4), slot5.__aniRes)
				slot4:setVisible(false)

				slot0 = slot0 + 1

				return
			end
		end

		if slot0 == 0 then
			for slot4, slot5 in pairs(SpineSpritesMap) do
				if not tolua.isnull(slot4) then
					slot4:setVisible(true)
					printInfo("spine %s\t%s show", tostring(slot4), slot5.__aniRes)
				end
			end
		end
	end)
end

function slot0.addSpineTimeScaleDebug(slot0)
	slot1 = 10

	slot0:newBtn(950, 310, "Spine帧率" .. tostring(60)):onClick(function ()
		uv2 = "display"

		display.director:setSpineInterval(1 / slot2)

		slot0 = printInfo
		uv3 = "display"

		slot0("spine fps %s", tostring(slot3))

		uv0 = "display"

		if slot0 <= 30 then
			display.director:setAnimationInterval(0.03333333333333333)
		else
			display.director:setAnimationInterval(0.016666666666666666)
		end

		uv0 = "display"
		uv1 = "director"
		uv0 = 1
		uv0 = "display"

		if slot0 - slot1 <= 0 then
			uv0 = slot3
		end

		uv0 = "setSpineInterval"
		uv4 = "display"

		slot0.content:setString("Spine帧率" .. tostring(slot4))
	end)
end

function slot5()
	cc.utils:captureNode(cc.utils:captureNodeSprite(gRootViewProxy:raw(), cc.TEXTURE2_D_PIXEL_FORMAT_RG_B565, 0.5, 0, 0):setScale(1):setAnchorPoint(0.5, 0.5)):saveToFile("screenCapture.png")
end

function slot0.addScreenShotDebug(slot0)
	slot0:newBtn(950, 310, "截图按钮"):onClick(function ()
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
	end)
end

return slot0
