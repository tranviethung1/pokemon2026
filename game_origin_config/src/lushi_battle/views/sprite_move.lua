function slot0(slot0, slot1)
	if slot1.battleView.guideManager:getGuideEmbattleIndex(slot1.id) then
		return slot3
	end

	slot4 = 1

	for slot10, slot11 in slot1.model.scene:getHerosMap(1):order_pairs() do
		if not slot11.isFakeCard then
			if slot0 < slot11.view:proxy():getCurPos().x then
				break
			end

			slot4 = slot4 + 1
		end
	end

	return slot4
end

function AutoChessSprite.checkSpriteEvent(slot0)
	if slot0.battleView.allTouchDisable:get() then
		return false
	end

	if slot0.battleView.isFighting then
		return false
	end

	if slot0.team == 2 then
		return false
	end

	if slot0.battleView.isGameOver then
		return false
	end

	if not slot0.clickEnable then
		return false
	end

	if slot0.battleView.isEnhancing and slot0.sprite.state ~= "inlist" then
		return false
	end

	return true
end

function AutoChessSprite.setClickEnable(slot0, slot1)
	slot0.clickEnable = slot1
end

function AutoChessSprite.checkRealVisible(slot0)
	slot1 = slot0

	while slot1 do
		if not slot1:isVisible() then
			return false
		end

		slot1 = slot1:getParent()
	end

	return true
end

function AutoChessSprite.enableSpriteClick(slot0, slot1)
	slot2, slot3 = nil

	function slot6(slot0, slot1)
		uv2 = "checkRealVisible"

		if not slot2:checkRealVisible() then
			return false
		end

		uv1 = nil
		uv2 = "checkRealVisible"
		slot2 = slot2.z
		uv4 = "checkRealVisible"

		slot2(slot2, slot4.posZ)

		uv2 = "checkRealVisible"

		if slot2.showInfoAct then
			uv2 = "checkRealVisible"
			slot2 = slot2.spriteInfo
			slot2 = slot2.stopAction
			uv4 = "checkRealVisible"

			slot2(slot2, slot4.showInfoAct)

			uv2 = "checkRealVisible"
			slot2.showInfoAct = nil
		end

		uv2 = "posZ"

		if slot2 then
			uv2 = "checkRealVisible"

			if slot2.isEnhancing then
				uv2 = "checkRealVisible"
				uv5 = "checkRealVisible"

				slot2.battleView:showSelectList(true, slot5.enhanceType)
			else
				uv2 = "checkRealVisible"

				if slot2.sprite.state ~= "inhand" then
					uv2 = "checkRealVisible"

					if slot2.sprite.state == "inembattle" then
						uv2 = "checkRealVisible"
						uv4 = "checkRealVisible"
						uv5 = "checkRealVisible"

						slot2.battleView:showCardInfo(slot4.model, slot5)
					end
				end
			end
		else
			uv2 = "checkRealVisible"

			slot2.battleView:hideCardInfo()
		end

		slot3 = slot0
		uv3 = "checkRealVisible"

		if slot3.sprite.onTouchEnded then
			uv3 = "checkRealVisible"

			if slot3:checkSpriteEvent() then
				uv3 = "checkRealVisible"
				slot3 = slot3:parent()
				slot4 = slot3
				uv4 = "checkRealVisible"
				uv6 = "posZ"

				slot4.sprite.onTouchEnded(slot3.convertToNodeSpace(slot4, slot0.getLocation(slot3)), slot6)
			end
		end

		return true
	end

	slot7 = cc.EventListenerTouchOneByOne:create()

	slot7:setSwallowTouches(true)
	slot7:registerScriptHandler(function ()
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
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot7:registerScriptHandler(function (slot0, slot1)
		uv2 = "checkRealVisible"

		if not slot2:checkRealVisible() then
			return false
		end

		slot2 = slot0:getLocation()
		uv5 = "getLocation"
		uv6 = "getLocation"
		slot4 = math.abs(slot2.y - slot6.y)

		if ui.TOUCH_MOVE_CANCAE_THRESHOLD <= math.abs(slot2.x - slot5.x) or ui.TOUCH_MOVE_CANCAE_THRESHOLD <= slot4 then
			uv2 = false
			uv5 = "checkRealVisible"

			if slot5.showInfoAct then
				uv5 = "checkRealVisible"
				slot5 = slot5.spriteInfo
				slot5 = slot5.stopAction
				uv7 = "checkRealVisible"

				slot5(slot5, slot7.showInfoAct)

				uv5 = "checkRealVisible"
				slot5.showInfoAct = nil
			end

			uv5 = "checkRealVisible"

			slot5.battleView:hideCardInfo()
		end

		if ui.TOUCH_MOVED_THRESHOLD <= slot3 or ui.TOUCH_MOVED_THRESHOLD <= slot4 then
			uv5 = "checkRealVisible"

			if slot5.sprite.onTouchMoved then
				uv5 = "checkRealVisible"

				if slot5:checkSpriteEvent() then
					uv2 = false
					uv5 = "checkRealVisible"
					slot5 = slot5:parent()
					slot6 = slot5
					uv6 = "checkRealVisible"
					uv8 = "math"

					slot6.sprite.onTouchMoved(slot5.convertToNodeSpace(slot6, slot2), slot8)
				end
			end
		end

		return true
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot7:registerScriptHandler(slot6, cc.Handler.EVENT_TOUCH_ENDED)
	slot7:registerScriptHandler(slot6, cc.Handler.EVENT_TOUCH_CANCELLED)
	slot0.sprite:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot7, slot0.sprite)

	slot0.listener = slot7

	slot0:spriteApplyState(slot1 or "idle")
end

slot1 = 0
slot2, slot3 = nil

function AutoChessSprite.moveSwing()
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

AutoChessSprite.StateFuncMap = {
	none = {},
	shop = AutoChessEasy.shopFunc,
	inhand = {
		onTouchBegan = function (slot0, slot1, slot2)
			slot1.isMoveInit = false
		end,
		onTouchMoved = function ()
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
		end,
		onTouchEnded = function (slot0, slot1, slot2, slot3)
			slot1.isMoveInit = nil

			if slot3 then
				slot0:onHandCardDrawOut(slot1:isDrawOut(), slot1)

				return
			end

			if slot0:getDrawOutId() then
				return
			end

			slot1.holdingHaloVisible:set(nil, "move", true)
			slot1:onHoldingHalo()
			slot0:showSellingPrice()

			if AutoChessEasy.isInPanel(slot2.x, slot2.y, lushi.ObjectReadyState.embattle) then
				uv4 = "isMoveInit"

				slot0:handleOperation(lushi.OperateTable.handCardMove, slot1.model.id, slot4(slot2.x, slot1))
			elseif AutoChessEasy.isInPanel(slot2.x, slot2.y, nil, 0) then
				slot0:handleOperation(lushi.OperateTable.saleCard, slot1.model.id)
			else
				slot1:resetSpriteState()
			end
		end
	},
	inembattle = {
		onTouchBegan = function (slot0, slot1, slot2)
			slot1.isMoveInit = false
		end,
		onTouchMoved = function ()
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
		end,
		onTouchEnded = function (slot0, slot1, slot2, slot3)
			slot1.holdingHaloVisible:set(nil, "move", true)
			slot1:onHoldingHalo()
			slot0:showSellingPrice()

			if slot1.isMoveInit then
				if AutoChessEasy.isInPanel(slot2.x, slot2.y, nil, 0) then
					slot0:handleOperation(lushi.OperateTable.saleCard, slot1.model.id)
				else
					uv4 = "holdingHaloVisible"

					slot0:handleOperation(lushi.OperateTable.embattleMoveEnd, slot1.model.id, slot4(slot2.x, slot1))
				end
			end

			slot1.isMoveInit = nil
		end,
		autoAttackBefore = function (slot0, slot1, slot2)
			slot4 = slot2.oriY
			slot6 = slot2.pos.y
			slot8 = slot1.model.team == 1
			slot11 = {
				x = slot3 - slot5,
				y = slot4 - slot6
			}

			slot0.pointSpr:setPosition(cc.p(slot3, slot4)):height(math.sqrt((slot3 - slot5) * (slot3 - slot5) + (slot4 - slot6) * (slot4 - slot6))):setRotation(-(math.atan2(slot11.y, slot11.x) * 180 / math.pi) - 90):scale(0):show():runAction(cc.Sequence:create(transition.newEasing(cc.ScaleTo:create(0.1, 1), "EXPONENTIALOUT"), cc.CallFunc:create(function ()
				uv0 = "hide"

				slot0:hide()
			end)))
			slot1:z(999)

			slot13 = slot3 + (slot2.pos.x - slot2.oriX > 0 and -50 or 50)
			slot2.r2 = math.atan2(slot4 + (slot8 and -116 or 116) - slot6, slot13 - slot5) * 180 / math.pi

			slot1:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.Spawn:create(transition.newEasing(cc.RotateTo:create(0.33, slot8 and -slot15 - 90 or -slot15 + 90), "EXPONENTIALIN"), transition.newEasing(cc.MoveTo:create(0.33, cc.p(slot13, slot14)), "SINEIN"), cc.Sequence:create(transition.newEasing(cc.ScaleTo:create(0.26, 1.12), "SINEIN"), transition.newEasing(cc.ScaleTo:create(0.07, 0.1, 1.12), "SINEIN")))))
		end,
		autoAttackTarget = function (slot0, slot1, slot2)
			slot4 = slot2.oriY
			slot7 = slot2.r2
			slot8 = slot2.pos.x - slot2.oriX > 0
			slot9 = slot1.model.team == 1
			slot10 = lushi.CardHeight / 2
			slot11 = math.abs(math.cos(slot7) * slot10)
			slot12 = math.abs(math.sin(slot7) * slot10)

			slot1:runAction(cc.Sequence:create(cc.Spawn:create(transition.newEasing(cc.MoveTo:create(0.1, cc.p(slot5 + slot12 * (slot8 and -1 or 1), slot2.pos.y + slot11 * (slot9 and -1 or 1))), "SINEIN"), transition.newEasing(cc.ScaleTo:create(0.07, 1.12, 1.12), "SINEIN"))))

			slot18 = slot2.pos

			slot1.curTarget:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.CallFunc:create(function ()
				slot0 = audio.playEffectWithWeekBGM

				slot0("auto_chess/attack.mp3")

				uv0 = "audio"

				slot0:onEventEffect(nil, "shaker", {
					shaker = {
						interval = 0,
						disx = 25,
						count = 1,
						disy = 25,
						beginT = 0,
						endT = 200,
						isRepeat = false
					}
				})
			end), cc.Spawn:create(transition.newEasing(cc.RotateTo:create(0.03, {
				z = 0,
				y = (slot8 and -1 or 1) * slot12 / (slot12 + slot11) * 50,
				x = (slot9 and 1 or -1) * slot11 / (slot12 + slot11) * 50
			}), "EXPONENTIALIN"), transition.newEasing(cc.MoveTo:create(0.14, cc.p(slot18.x + (slot8 and 50 or -50), slot18.y + (slot9 and 50 or -50))), "EXPONENTIALIN")), cc.Spawn:create(transition.newEasing(cc.RotateTo:create(0.23, {
				z = 0,
				x = 0,
				y = 0
			}), "EXPONENTIALIN"), transition.newEasing(cc.MoveTo:create(0.23, slot18), "EXPONENTIALIN"))))
		end,
		autoAttackBack = function (slot0, slot1, slot2)
			slot1:runAction(cc.Sequence:create(cc.Spawn:create(transition.newEasing(cc.MoveTo:create(0.2, cc.p(slot2.oriX, slot2.oriY)), "SINEIN"), transition.newEasing(cc.ScaleTo:create(0.2, 1 * slot1.baseScale), "EXPONENTIALIN"), transition.newEasing(cc.RotateTo:create(0.2, {
				z = 0,
				x = 0,
				y = 0
			}), "EXPONENTIALIN")), cc.CallFunc:create(slot1:spriteAcquireState("inembattle")), cc.CallFunc:create(function ()
				uv0 = "z"
				uv2 = "z"

				slot0:z(slot2.posZ)
			end)))
		end
	}
}

function slot4(slot0, slot1, slot2)
	if slot2 == nil then
		return
	end

	return function ()
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
end

function AutoChessSprite.spriteAcquireState(slot0, slot1)
	assert(not slot0.sprite.stateLock, slot0.sprite.state .. " state lock")
	assert(slot0.StateFuncMap[slot1], slot1 .. " state undefined")

	if slot0.sprite.stateLock then
		return
	end

	slot0.sprite.state = slot1
	slot0.sprite.stateLock = true
	slot0.sprite.onTouchBegan = nil
	slot0.sprite.onTouchMoved = nil
	slot0.sprite.onTouchEnded = nil

	return function ()
		uv0 = "spriteApplyState"
		uv2 = "spriteApplyState"

		slot0:spriteApplyState(slot2)
	end
end

function AutoChessSprite.spriteApplyState(slot0, slot1)
	slot0.sprite.state = slot1
	slot3 = false
	slot0.sprite.stateLock = slot3
	uv3 = "sprite"
	slot3 = slot3(slot0.battleView, slot0, slot0.StateFuncMap[slot1].onTouchBegan)
	slot0.sprite.onTouchBegan = slot3
	uv3 = "sprite"
	slot3 = slot3(slot0.battleView, slot0, slot0.StateFuncMap[slot1].onTouchMoved)
	slot0.sprite.onTouchMoved = slot3
	uv3 = "sprite"
	slot3 = slot3(slot0.battleView, slot0, slot0.StateFuncMap[slot1].onTouchEnded)
	slot0.sprite.onTouchEnded = slot3
	uv3 = "sprite"
	slot3 = slot3(slot0.battleView, slot0, slot0.StateFuncMap[slot1].autoAttackBefore)
	slot0.sprite.autoAttackBefore = slot3
	uv3 = "sprite"
	slot3 = slot3(slot0.battleView, slot0, slot0.StateFuncMap[slot1].autoAttackTarget)
	slot0.sprite.autoAttackTarget = slot3
	uv3 = "sprite"
	slot3 = slot3(slot0.battleView, slot0, slot0.StateFuncMap[slot1].autoAttackBack)
	slot0.sprite.autoAttackBack = slot3
	uv3 = "sprite"
	slot0.sprite.autoMove = slot3(slot0.battleView, slot0, slot0.StateFuncMap[slot1].autoMove)
end

function AutoChessSprite.playSetAction(slot0, slot1)
	slot2 = slot0:spriteAcquireState("inembattle")
	slot3 = slot0:getPosBySeat()

	slot0.shadowBg:hide()
	slot0:z(999)
	slot0:runAction(cc.Sequence:create(transition.newEasing(cc.MoveTo:create(0.15, cc.p(slot3.x, slot3.y + 120)), "EXPONENTIALOUT"), cc.DelayTime:create(0.2), cc.Spawn:create(transition.newEasing(cc.ScaleTo:create(0.15, 1)), transition.newEasing(cc.MoveTo:create(0.15, slot3), "SINEIN")), cc.CallFunc:create(function ()
		uv0 = "battleView"

		slot0()

		uv0 = "onEventEffectQueue"

		slot0()

		uv0 = "shaker"

		slot0.battleView:onEventEffectQueue("shaker", {
			shaker = {
				interval = 200,
				disx = 20,
				count = 1,
				disy = 20,
				beginT = 0,
				endT = 200,
				isRepeat = false
			}
		})
	end)))
end

function AutoChessSprite.playDrawOut(slot0, slot1)
	if slot0.drawOutState == not slot1 or slot0.waitDraw > 0 or slot0.isEnhancing then
		return
	end

	slot0.drawOutState = not slot1

	if not slot1 then
		slot0.waitDraw = slot0.waitDraw + 1

		slot0:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
			uv0 = "onStateChange"

			slot0:onStateChange()
		end), cc.MoveTo:create(0.08, cc.p(slot0.posXY.x, slot0.posXY.y + (slot1 and -100 or 100))), cc.CallFunc:create(function ()
			uv0 = "posXY"
			uv2 = "posXY"
			slot2 = slot2.posXY.x
			uv3 = "posXY"
			uv4 = "cc"
			slot1 = cc.p(slot2, slot3.posXY.y + slot4)
			slot0.posXY = slot1
			uv0 = "posXY"
			uv1 = "posXY"
			slot0.waitDraw = slot1.waitDraw - 1
			uv0 = "posXY"
			uv2 = "posXY"

			slot0:setPosition(slot2.posXY)
		end)))
	else
		slot0:onStateChange()

		slot0.posXY = cc.p(slot0.posXY.x, slot0.posXY.y + slot2)

		slot0:setPosition(slot0.posXY)
	end
end

function AutoChessSprite.slideDrawOut(slot0, slot1)
	if slot0.isEnhancing then
		return
	end

	slot0.waitDraw = slot0.waitDraw + 1

	slot0:onStateChange()
	slot0:runAction(cc.Sequence:create(cc.MoveTo:create(0.08, cc.p(slot0.posXY.x + slot1, slot0.posXY.y)), cc.CallFunc:create(function ()
		uv0 = "waitDraw"
		uv1 = "waitDraw"
		slot0.waitDraw = slot1.waitDraw - 1
	end)))
end

slot5 = {
	x = 40,
	y = 15
}

function AutoChessSprite.onBePointingTo(slot0, slot1, slot2)
	if not slot0.pointToHalo then
		slot3 = slot0.sprite:box()
		slot4 = cc.rect(60, 60, 8, 8)
		slot6 = ccui.Scale9Sprite:create()

		slot6:initWithFile(slot4, "lushi/box_zzq_select2.png")
		slot6:setScale9Enabled(true)

		uv11 = "pointToHalo"
		slot11 = slot11.x
		uv11 = "pointToHalo"

		slot6:size({
			width = slot3.width + slot11,
			height = slot3.height + slot11.y
		}):anchorPoint(0.5, 0.5):setCapInsets(slot4):addTo(slot0.sprite, -1):xy(slot3.width / 2, slot3.height / 2):hide()

		slot0.pointToHalo = slot6
	end

	if slot2 == slot0.pointToHalo:isVisible() then
		return
	end

	if slot2 then
		slot0.pointToHalo:show()
	else
		slot0.pointToHalo:hide()
	end

	if slot1 == lushi.PointToType.equip then
		slot0:onBeEquipTarget(slot2)
	end
end

function AutoChessSprite.onBeEquipTarget(slot0, slot1)
	if slot1 then
		slot0.equipBgVisible:set(true, "point")
		slot0.equipBg:setVisible(slot0.equipBgVisible:get())
		slot0.equipBg:setAnchorPoint(cc.p(0.5, 0.5)):runAction(cc.RepeatForever:create(cc.Spawn:create(cc.Sequence:create(cc.ScaleTo:create(1, 1.1), cc.ScaleTo:create(1, 1)), cc.Sequence:create(cc.FadeTo:create(1, 255), cc.FadeTo:create(1, 120)))))
	else
		slot0.equipBgVisible:set(nil, "point", true)
		slot0.equipBg:setVisible(slot0.equipBgVisible:get())
		slot0.equipBg:stopAllActions()
		slot0.equipBg:setOpacity(255):scale(1)

		if slot0.pointToHaloAct then
			slot0.pointToHalo:stopAction(slot0.pointToHaloAct)

			slot0.pointToHaloAct = nil
		end
	end
end

function AutoChessSprite.onCanPointTo(slot0, slot1)
	if not slot0.canPointHalo then
		slot2 = slot0.sprite:box()
		slot3 = cc.rect(60, 60, 8, 8)
		slot5 = ccui.Scale9Sprite:create()

		slot5:initWithFile(slot3, "lushi/box_zzq_select1.png")
		slot5:setScale9Enabled(true)

		uv10 = "canPointHalo"
		slot10 = slot10.x
		uv10 = "canPointHalo"

		slot5:size({
			width = slot2.width + slot10,
			height = slot2.height + slot10.y
		}):anchorPoint(0.5, 0.5):setCapInsets(slot3):addTo(slot0.sprite, -2):xy(slot2.width / 2, slot2.height / 2):hide()

		slot0.canPointHalo = slot5
	end

	slot0.canPointHalo:setVisible(slot1)
end

function AutoChessSprite.onHoldingHalo(slot0)
	if not slot0.holdingHalo then
		slot1 = slot0.sprite:box()
		slot2 = cc.rect(50, 50, 50, 50)
		slot4 = ccui.Scale9Sprite:create()

		slot4:initWithFile(slot2, "lushi/icon_l.png")
		slot4:setScale9Enabled(true)

		uv9 = "holdingHalo"
		slot9 = slot9.x
		uv9 = "holdingHalo"

		slot4:size({
			width = slot1.width + slot9,
			height = slot1.height + slot9.y
		}):anchorPoint(0.5, 0.5):setCapInsets(slot2):addTo(slot0.sprite, -1):xy(slot1.width / 2, slot1.height / 2):hide()

		slot0.holdingHalo = slot4
	end

	if slot0.holdingHaloVisible:get() == slot0.holdingHalo:isVisible() then
		return
	end

	if slot1 then
		slot0.holdingHalo:show()

		slot0.holdingHalAct = slot0.holdingHalo:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(0.5), cc.DelayTime:create(0.5), cc.FadeOut:create(0.5))))
	else
		slot0.holdingHalo:hide()

		if slot0.holdingHalAct then
			slot0.holdingHalo:stopAction(slot0.holdingHalAct)

			slot0.holdingHalAct = nil
		end
	end
end
