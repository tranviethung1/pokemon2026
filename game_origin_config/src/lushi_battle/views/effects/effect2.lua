slot0 = class("Callback", autoChessEffect.OnceEventEffect)
autoChessEffect.Callback = slot0

function slot0.onPlay(slot0)
	slot0.args.func()
end

slot1 = class("Wait", autoChessEffect.EventEffect)
autoChessEffect.Wait = slot1

function slot1.onUpdate(slot0, slot1)
end

slot2 = class("Result", autoChessEffect.EventEffect)
autoChessEffect.BattleResult = slot2

function slot2.onPlay(slot0)
	slot0.resultSpr = ccui.Text:create(slot0.args.result, "font/youmi1.ttf", 250)

	slot0.resultSpr:setTextColor(cc.c4b(255, 0, 0, 255))
	slot0.resultSpr:addTo(slot0.view, 9999):xy(display.width / 2, display.height / 2)

	slot0.resultAct = performWithDelay(slot0.resultSpr, function ()
		uv0 = "resultAct"
		slot0.resultAct = nil
		uv0 = "resultAct"

		slot0:removeSpr()
	end, slot0.args.interval or 0.5)
end

function slot2.removeSpr(slot0)
	if slot0.resultSpr then
		slot0.resultSpr:removeFromParent()

		slot0.resultSpr = nil
	end

	slot0:stop()
end

function slot2.onUpdate(slot0, slot1)
end

function slot2.onStop(slot0, slot1)
end

slot3 = class("RiseStar", autoChessEffect.EventEffect)
autoChessEffect.RiseStar = slot3

function slot3.onPlay(slot0)
	slot0.view = gRootViewProxy:raw()
	slot1 = slot0.view:onViewProxyCall("getSceneObj", slot0.args.baseObjId)
	slot2 = slot0.view:onViewProxyCall("getSceneObj", slot0.args.newObjId)
	slot0.spr1 = slot1
	slot0.spr2 = slot2
	slot3 = slot1:spriteAcquireState(slot1.sprite.state)
	slot4 = slot2:spriteAcquireState(slot2.sprite.state)

	slot1:onHandState()
	slot2:onHandState()
	slot1:z(999)
	slot2:z(998)
	AutoChessEasy.bfsSetNode(slot1)
	AutoChessEasy.bfsSetNode(slot2)

	slot5 = cc.p(slot1:x(), slot1:y())

	if slot1.model.readyState ~= lushi.ObjectReadyState.hand then
		slot6 = slot0.view:getSceneModel():calcHandPos()

		if not slot6[table.length(slot6)] then
			slot9, slot10 = gRootViewProxy:proxy():getPanelByState(lushi.ObjectReadyState.hand):getPosition()
			slot7 = cc.p(slot9, slot10)
		end

		slot5 = cc.p(slot7.x + 120, slot7.y)
	end

	slot6 = newCSprite("lushi/zizouqi_jl2.skel")

	function slot7(slot0, slot1, slot2, slot3)
		uv6 = "addTo"

		slot0:addTo(slot6, slot1):anchorPoint(0.5, 0.5):scale(slot3 or 1):xy(0, 0)
		slot0:setTimeScale(1)
		slot0:play(slot2)
	end

	slot8 = display.width / 2
	slot9 = display.height / 2

	slot1:runAction(cc.Sequence:create(cc.Spawn:create(cc.ScaleTo:create(0.1, 1), cc.MoveTo:create(0.1, cc.p(slot8, slot9)), cc.FadeTo:create(0.1, 185)), cc.CallFunc:create(function ()
		uv0 = "updateStar"
		slot0 = slot0.updateStar

		slot0(slot0)

		uv0 = "updateStar"
		slot1 = slot0
		slot0 = slot0.setOpacity

		slot0(slot1, 255)

		uv0 = "setOpacity"
		uv1 = "upgrade"
		uv4 = "updateStar"

		slot0(slot1, 1, "upgrade", slot4)
	end), cc.DelayTime:create(0.6), cc.ScaleTo:create(0.3, 1.32), cc.Spawn:create(cc.MoveTo:create(0.2, slot5), cc.ScaleTo:create(0.2, 1)), cc.CallFunc:create(function ()
		uv0 = "scale"
		slot0 = slot0:scale(1)
		slot1 = slot0

		slot0.play(slot1, "upgrade_get")

		slot0 = AutoChessEasy.autoRemoveSpine
		uv1 = "scale"

		slot0(slot1)

		uv0 = "play"

		slot0()

		uv0 = "upgrade_get"

		slot0()

		uv0 = "AutoChessEasy"

		slot0:stop()
	end)))
	slot2:runAction(cc.Sequence:create(cc.Spawn:create(cc.ScaleTo:create(0.1, 1.2), cc.MoveTo:create(0.1, cc.p(slot8, slot9)), cc.FadeTo:create(0.1, 125)), cc.DelayTime:create(0.1), cc.FadeTo:create(0.5, 0)))
end

function slot3.onUpdate(slot0, slot1)
end

function slot3.onStop(slot0, slot1)
	slot0.spr1:z(slot0.spr1.posZ)
end

slot4 = class("ShopRise", autoChessEffect.EventEffect)
autoChessEffect.ShopRise = slot4

function slot4.onPlay(slot0)
	slot0.view = gRootViewProxy:raw()
	slot1 = slot0.view:onViewProxyCall("getSceneObj", slot0.args.baseObjId)
	slot0.spr1 = slot1
	slot2 = slot1:spriteAcquireState(slot1.sprite.state)

	slot1:onHandState()
	slot1:z(999)
	AutoChessEasy.bfsSetNode(slot1)

	slot3 = newCSprite("lushi/zizouqi_jl2.skel")

	function slot4(slot0, slot1, slot2, slot3)
		uv6 = "addTo"

		slot0:addTo(slot6, slot1):anchorPoint(0.5, 0.5):scale(slot3 or 1):xy(0, 0)
		slot0:setTimeScale(1)
		slot0:play(slot2)
	end

	slot5 = 1

	slot1:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
		uv0 = "updateStar"
		slot1 = slot0
		slot0 = slot0.updateStar

		slot0(slot1)

		uv0 = "upgrade"
		uv1 = "updateStar"
		uv4 = "upgrade"

		slot0(slot1, 1, "upgrade", slot4)
	end), cc.DelayTime:create(0.6), cc.CallFunc:create(function ()
		uv0 = "stop"
		slot0 = slot0.stop

		slot0(slot0)

		uv0 = "scale"

		slot0()

		uv0 = "play"
		slot0 = slot0:scale(1)
		slot1 = slot0

		slot0.play(slot1, "upgrade_get")

		uv1 = "play"

		AutoChessEasy.autoRemoveSpine(slot1)
	end)))
end

function slot4.onUpdate(slot0, slot1)
end

function slot4.onStop(slot0, slot1)
	slot0.spr1:z(slot0.spr1.posZ)
end

slot5 = class("AttackStars", autoChessEffect.EventEffect)
autoChessEffect.AttackStars = slot5

function slot5.onPlay(slot0)
	slot0.view = gRootViewProxy:raw()
	slot1 = slot0.args.objIds
	slot2 = table.length(slot1)

	function slot3(slot0, slot1, slot2)
		if slot0 == slot2 then
			uv3 = "stop"

			if slot1 == slot3 then
				uv3 = "stop"

				slot3:stop()
			end
		end
	end

	slot4 = slot0.view.gameLayer
	slot5 = slot0.view["panelTrainer" .. slot0.args.team]:get("trainerHead")
	slot6 = slot0.view["panelTrainer" .. 3 - slot0.args.team]:get("trainerHead")
	slot7 = slot4:convertToNodeSpace(slot5:parent():convertToWorldSpace(cc.p(slot5:x(), slot5:y())))
	slot8 = slot4:convertToNodeSpace(slot6:parent():convertToWorldSpace(cc.p(slot6:x(), slot6:y())))
	slot9 = table.length(slot1)
	slot10 = math.ceil(slot9 / 2)
	slot12 = 0.3

	if (slot9 > 1 and 1 / (slot9 - 1) or 1) > 0.1 then
		slot13 = 0.1
		slot14 = (slot9 - 1) * 0.1 + 0.35
	else
		slot14 = slot11 + slot14
	end

	for slot18, slot19 in ipairs(slot1) do
		if gRootViewProxy:call("getSceneObj", slot19) then
			for slot25 = 1, slot0.args.stars[slot18] do
				slot26 = slot20.cardPrefab.node.panelStar:get("star" .. slot25)
				slot27 = slot4:convertToNodeSpace(slot20:parent():convertToWorldSpace(cc.p(slot20:x(), slot20:y())))
				slot28 = lushi.StarPos[slot21][slot25]
				slot31 = slot26:scale()

				transition.executeSequence(slot26):delay((slot18 - 1) * slot13 + (slot25 - 1) * 0.03):scaleTo(0.2, slot31 * 2):delay(0.1):scaleTo(0.1, slot31):done()
				transition.executeSequence(cc.Sprite:create("lushi/icon_star_zzq.png"):addTo(slot4, 999):size(70, 70):xy(slot27.x + slot28.x * 3, slot27.y + slot28.y * 3):scale(0)):delay(slot30):scaleTo(0.07, 1.2):scaleTo(0.06, 1):delay(slot14 - slot30 - 0.13 + (slot10 < slot18 and (slot18 - slot10 - 1) * 0.1 or (slot18 - 1) * 0.1) + (slot25 - 1) * 0.03):moveTo(slot12, slot7.x, slot7.y):func(function ()
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
				end):done()
			end
		end
	end

	slot15 = table.length(slot1)

	if slot0.args.damage > 0 then
		slot17 = slot16 % 2 == 0 and lushi.TrainerStar.even or lushi.TrainerStar.odd

		for slot21 = 1, slot16 do
			transition.executeSequence(cc.Sprite:create("lushi/icon_star_zzq.png"):addTo(slot0.view.gameLayer, 999):size(64, 64):xy(slot8.x + slot17[slot21].x, slot8.y + slot17[slot21].y):scale(1)):fadeOut(0.1):fadeIn(0.1):delay(slot14 - 0.2 + (slot21 - 1) * 0.1):moveTo(slot12, slot7.x, slot7.y):func(function ()
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
			end):done()
		end
	end

	if slot15 == 0 and slot16 <= 0 then
		slot0:stop()
	end
end

function slot5.onUpdate(slot0, slot1)
end

function slot5.onStop(slot0, slot1)
end

slot6 = class("GetAward", autoChessEffect.OnceEventEffect)
autoChessEffect.GetAward = slot6

function slot6.onPlay(slot0)
	slot0.view.onceEffectWaitCount = slot0.view.onceEffectWaitCount + 1

	gRootViewProxy:proxy():showAwardList(true, slot0.args.objs, slot0.args.gold, slot0.args.result, function ()
		uv0 = "view"
		uv1 = "view"
		slot0.view.onceEffectWaitCount = slot1.view.onceEffectWaitCount - 1
	end)
end

slot7 = class("ChangeChapter", autoChessEffect.EventEffect)
autoChessEffect.ChangeChapter = slot7

function slot7.onPlay(slot0)
	slot1 = slot0.view
	slot2 = slot0.view.gameLayer

	AutoChessEasy.playOnceEffect(slot0.args.resPath, slot0.args.aniName, slot1:convertToNodeSpace(slot2:convertToWorldSpace(cc.p(slot2:width() / 2, slot2:height() / 2))), slot1, 999, 2)
	slot0:stop()
end

function slot7.onUpdate(slot0, slot1)
end

function slot7.onStop(slot0, slot1)
end
