slot0 = class("SysSetting", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.speedButton = slot0.parent.UIWidgetBottomLeft:get("speedUp")
	slot0.autoButton = slot0.parent.UIWidgetBottomLeft:get("autoAtt")
	slot0.pauseButton = slot0.parent.UIWidgetBottomLeft:get("pause")
	slot0.passButton = slot0.parent.UIWidgetBottomLeft:get("mainSkillPass")
	slot0.simplifyButton = slot0.parent.UIWidgetBottomLeft:get("battleSimplify")
	slot0.buttonCapture = CRenderSprite.newWithNodes(cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444, slot0.pauseButton, slot0.autoButton, slot0.speedButton, slot0.passButton)

	slot0.buttonCapture:addTo(slot0.parent.UIWidgetBottomLeft, 999):coverTo(slot0.pauseButton)

	if slot0.parent:hasGuide() then
		slot0.buttonCapture:hide()
	else
		slot0.buttonCapture:setTouchEnabled()
		performWithDelay(slot0.parent, function ()
			uv0 = "buttonCapture"

			slot0.buttonCapture:show()
		end, 1)
	end

	slot0.skipButton = slot0.parent.UIWidgetMid:get("skip")

	if slot0.skipButton then
		slot0.skipButton:hide()
	end
end

function slot0.setAutoButton(slot0, slot1)
	if slot1.canHandle and not slot1.isAuto then
		if slot0.parent.gateType == game.GATE_TYPE.newbie then
			-- Nothing
		elseif slot0.parent.gateType ~= game.GATE_TYPE.test and not dataEasy.isUnlock(gUnlockCsv.gateAuto) then
			slot0.autoButton:get("auto"):setString(gLanguageCsv.manual)
			slot0.autoButton:onClick(function ()
				gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.gateSpeed2))
			end)
		else
			slot0.autoButton:get("disabled"):hide()
			slot0.autoButton:get("lock"):hide()

			slot2 = userDefault.getForeverLocalKey("gateAuto", false)

			if slot1.lockAuto ~= nil then
				slot2 = slot1.lockAuto
			end

			slot0.autoButton:get("auto"):setString(slot2 and gLanguageCsv.auto or gLanguageCsv.manual)
			slot0.parent:handleOperation(battle.OperateTable.autoFight, slot2)
			slot0.autoButton:onClick(function ()
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
	else
		slot0.autoButton:get("auto"):setString(gLanguageCsv.auto)
	end
end

function slot0.setPauseButton(slot0, slot1)
	if (slot0.parent.gateType == game.GATE_TYPE.test or dataEasy.isUnlock(gUnlockCsv.gatePause)) and slot1.canPause then
		slot0.pauseButton:get("disabled"):hide()
		slot0.pauseButton:get("lock"):hide()
		slot0.pauseButton:onClick(function ()
			uv0 = "canPause"

			if slot0.canPause then
				audio.pauseAllSounds()

				uv5 = "audio"

				gGameUI:stackUI("battle.pause", nil, , slot5.parent):z(999)
			end
		end)
	end
end

function slot0.setSpeedButton(slot0, slot1)
	slot2 = slot0.speedButton:get("speed")
	slot3 = 1

	if (slot0.parent.gateType == game.GATE_TYPE.test or dataEasy.isUnlock(gUnlockCsv.gateSpeed2)) and slot1.canSpeedAni then
		slot3 = tonumber(userDefault.getForeverLocalKey("gateSpeed", 1))

		slot0.speedButton:get("disabled"):hide()
		slot0.speedButton:get("lock"):hide()
	end

	slot2:setString(string.format("x%d", slot3))
	slot0.parent:handleOperation(battle.OperateTable.timeScale, slot3)

	function slot4(slot0)
		if dataEasy.isUnlock(gUnlockCsv.gateSpeed3) then
			if slot0 + 1 == 4 then
				slot0 = 1
			end

			return slot0
		else
			if slot0 == 2 then
				gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.gateSpeed3))
			end

			return 3 - slot0
		end
	end

	slot0.speedButton:onClick(function ()
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

function slot0.setSkipButton(slot0, slot1)
	function slot2(slot0)
		slot2 = slot0
		slot1 = battle.UITag.passCD
		uv2 = "tonumber"
		slot2 = slot2.parent:enableSchedule()
		slot2 = slot2.unSchedule

		slot2(slot2, slot1)

		uv2 = "tonumber"
		slot2 = slot2.skipButton
		slot2 = slot2.setColor

		slot2(slot2, cc.c3b(75, 75, 75))

		uv2 = "tonumber"
		slot2 = slot2.skipButton:get("text")
		slot2 = slot2.setColor

		slot2(slot2, cc.c3b(75, 75, 75))

		uv2 = "tonumber"
		slot2 = slot2.skipButton:get("mask")
		slot2 = slot2.setVisible

		slot2(slot2, true)

		uv2 = "tonumber"
		slot2 = slot2.skipButton:get("mask"):get("timer")
		slot2 = slot2.setString

		slot2(slot2, tonumber(slot2))

		uv2 = "tonumber"

		slot2.parent:schedule(function ()
			uv0 = "skipButton"
			uv0 = 1
			uv0 = "get"
			slot2 = "timer"
			slot0 = (slot0 - 1).skipButton:get("mask"):get(slot2)
			slot0 = slot0.setString
			uv2 = "skipButton"

			slot0(slot0, slot2)

			uv0 = "skipButton"

			if slot0 <= 0 then
				uv0 = "get"
				slot0 = slot0.skipButton:get("mask")
				slot0 = slot0.setVisible

				slot0(slot0, false)

				uv0 = "get"
				slot0 = slot0.skipButton
				slot0 = slot0.setColor

				slot0(slot0, cc.c3b(255, 255, 255))

				uv0 = "get"

				slot0.skipButton:get("text"):setColor(cc.c3b(255, 252, 237))

				return false
			end
		end, 1, 1, slot1)
	end

	if slot0.parent:isMultiOneByOneScenes() then
		slot0.originPassStr = slot0.skipButton:get("text"):text()

		slot0.skipButton:get("text"):text(gLanguageCsv.crossMinePVPSkip)
	end

	text.addEffect(slot0.skipButton:get("text"), {
		glow = {
			color = ui.COLORS.GLOW.WHITE
		}
	})

	if slot1.canSkip and slot0.skipButton then
		slot0.skipButton:show()
		slot0.skipButton:onClick(function ()
			uv0 = "onClickPass"

			slot0:onClickPass()
		end)

		if slot0.parent.gateType == game.GATE_TYPE.arena and not slot1.canSkipInstant then
			slot4 = gVipCsv[gGameModel.role:getIdler("vip_level"):read()].arenaPassCD

			if dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.BattleSkip, game.SCENE_TYPE.arena) then
				slot4 = 0
			end

			slot2(slot4)
		elseif slot0.parent.gateType == game.GATE_TYPE.endlessTower then
			slot3 = gCommonConfigCsv.endlessTowerJumpCD

			if dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.BattleSkip, game.SCENE_TYPE.endlessTower) then
				slot3 = 0
			end

			slot2(slot3)
		elseif slot0.parent.gateType == game.GATE_TYPE.randomTower then
			slot3 = gCommonConfigCsv.randomTowerJumpCD

			if dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.BattleSkip, game.SCENE_TYPE.randomTower) then
				slot3 = 0
			end

			slot2(slot3)
		elseif slot0.parent.gateType == game.GATE_TYPE.worldBoss then
			slot3 = gCommonConfigCsv.worldBossJumpCD

			if dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.BattleSkip, game.SCENE_TYPE.worldBoss) then
				slot3 = 0
			end

			slot2(slot3)
		elseif slot0.parent.gateType == game.GATE_TYPE.gym then
			slot3 = gCommonConfigCsv.gymGateJumpCD

			if dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.BattleSkip, game.SCENE_TYPE.gym) then
				slot3 = 0
			end

			slot2(slot3)
		elseif slot0.parent.gateType == game.GATE_TYPE.hunting then
			slot3 = gCommonConfigCsv.huntingJumpCD

			if dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.BattleSkip, game.SCENE_TYPE.hunting) then
				slot3 = 0
			end

			slot2(slot3)
		elseif slot0.parent.gateType == game.GATE_TYPE.clone then
			if not dataEasy.isUnlock(gUnlockCsv.skipCloneBattle) then
				slot0.skipButton:hide()
				slot0.skipButton:onClick(function ()
				end)
			else
				slot0.skipButton:get("mask"):setVisible(false)
			end
		else
			slot0.skipButton:get("mask"):setVisible(false)
		end
	end
end

function slot0.setPassButton(slot0, slot1)
	slot2 = userDefault.getForeverLocalKey("mainSkillPass", false)

	slot0.passButton:get("imgOpen"):visible(slot2)
	slot0.passButton:get("imgClose"):visible(not slot2)

	if (slot0.parent.gateType == game.GATE_TYPE.test or not not dataEasy.isUnlock(gUnlockCsv.ultraAcc)) and not slot1.cantPass or slot0.parent.modes.isRecord then
		slot0.passButton:show()
	else
		userDefault.setForeverLocalKey("mainSkillPass", false)
		slot0.passButton:hide()
	end

	slot0.passButton:onClick(function ()
		if userDefault.getForeverLocalKey("mainSkillPass", false) then
			print("MainSkillPass Close")
		else
			print("MainSkillPass Open")
		end

		slot1 = not slot0
		slot2 = userDefault.setForeverLocalKey

		slot2("mainSkillPass", slot1)

		uv2 = "userDefault"
		slot2 = slot2.visible

		slot2(slot2, slot1)

		uv2 = "getForeverLocalKey"

		slot2:visible(not slot1)
	end)
end

function slot0.setSimplifyButton(slot0, slot1)
	slot4 = false
	slot5 = slot0.simplifyButton:get("imgOpen")
	slot6 = slot0.simplifyButton:get("imgClose")

	if (userDefault.getForeverLocalKey("buffIconHide", false) or userDefault.getForeverLocalKey("buffTextHide", false)) and dataEasy.isUnlock(gUnlockCsv.battleSimplify) then
		slot0.simplifyButton:show()

		slot4 = userDefault.getForeverLocalKey("battleSimplifyOpen", true)
	else
		slot0.simplifyButton:hide()
	end

	if slot0.parent.gateType == game.GATE_TYPE.test then
		slot0.simplifyButton:show()

		slot2 = true
		slot3 = true
	end

	function (slot0)
		uv1 = "visible"
		slot1 = slot1.visible

		slot1(slot1, slot0)

		uv1 = "gRootViewProxy"
		slot1 = slot1.visible

		slot1(slot1, not slot0)

		uv1 = "notify"

		if slot1 then
			gRootViewProxy:notify("setAllBuffIconVisible", not slot0)
		end

		uv1 = "setAllBuffIconVisible"

		if slot1 then
			gRootViewProxy:notify("setAllBuffTextVsisible", not slot0)
		end
	end(slot4)
	slot0.simplifyButton:onClick(function ()
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

function slot0.onSetOperators(slot0, slot1)
	slot0:setAutoButton(slot1)
	slot0:setPauseButton(slot1)
	slot0:setSpeedButton(slot1)
	slot0:setSkipButton(slot1)
	slot0:setPassButton(slot1)
	slot0:setSimplifyButton(slot1)
	slot0.buttonCapture:refresh()
end

function slot0.onClickPass(slot0)
	if slot0.parent:isMultiOneByOneScenes() then
		slot0.parent:handleOperation(battle.OperateTable.passOneWave)
	else
		if slot0.parent.isModelPass then
			return
		end

		slot0.parent.isModelPass = true

		slot0.parent:handleOperation(battle.OperateTable.pass)
	end
end

function slot0.onNewBattleRound(slot0, slot1)
	if not slot0.parent:isMultiOneByOneScenes() or not slot1.wave or not slot1.totalWave then
		return
	end

	if not slot0.isLastWave and slot1.totalWave <= slot1.wave then
		slot0.isLastWave = true

		if slot0.originPassStr then
			slot0.skipButton:get("text"):text(slot0.originPassStr)
		end
	end
end

function slot0.onClose(slot0)
	slot0.buttonCapture:hide()
end

function slot0.setPauseBtn(slot0, slot1, slot2)
	if slot1 then
		slot0.pauseButton:get("settingImg"):loadTexture(slot1)
	end

	if slot2 then
		slot0.pauseButton:onClick(slot2)
	end

	slot0.buttonCapture:refresh()
end

function slot0.setSpeedBtn(slot0, slot1)
	slot0.speedButton:get("speed"):setString(string.format("x%d", slot1))
	slot0.parent:handleOperation(battle.OperateTable.timeScale, slot1)
	slot0.buttonCapture:refresh()
end

function slot0.setJumpSkillBtn(slot0, slot1)
	slot0.passButton:get("imgOpen"):visible(slot1)
	slot0.passButton:get("imgClose"):visible(not slot1)
	userDefault.setForeverLocalKey("mainSkillPass", slot1)
	slot0.buttonCapture:refresh()
end

function slot0.setAutoBtn(slot0, slot1, slot2)
	slot0.autoButton:get("auto"):setString(slot1 and gLanguageCsv.auto or gLanguageCsv.manual)
	slot0.parent:handleOperation(battle.OperateTable.autoFight, slot1)

	if slot2 then
		slot0.autoButton:onClick(functools.partial(slot2, slot0.autoButton))
	end

	slot0.buttonCapture:refresh()
end

return slot0
