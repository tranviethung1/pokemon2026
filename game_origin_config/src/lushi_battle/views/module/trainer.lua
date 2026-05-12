slot0 = class("AutoChessTrainer", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.trainerPanel = {}
	slot0.trainerVisible = {}
	slot0.trainerHpBg = {}
	slot0.trainerHpIcon = {}
	slot0.trainerHp = {}
	slot0.trainerName = {}
	slot0.trainerHeadImg = {}
	slot0.trainerSkillImg = {}
	slot0.skillBg = {}
	slot0.goldIcon = {}
	slot0.goldNum = {}
	slot0.skillCD = nil
	slot0.listener = {}
	slot0.skillType = 3
	slot0.skillInfoPanel = slot0.parent.skillInfoPanel

	for slot5 = 1, 2 do
		slot0.trainerPanel[slot5] = slot0.parent["panelTrainer" .. slot5]
		slot0.trainerHpBg[slot5] = slot0.trainerPanel[slot5]:get("trainerHpBg")
		slot6 = slot0.trainerPanel[slot5]:get("trainerHp")

		text.addEffect(slot6, {
			color = lushi.Color.white,
			outline = {
				size = 3,
				color = cc.c4b(50, 45, 50, 255)
			}
		})

		slot0.trainerHp[slot5] = slot6
		slot7 = slot0.trainerPanel[slot5]:get("trainerName")

		text.addEffect(slot7, {
			color = lushi.Color.white,
			outline = {
				size = 3,
				color = cc.c4b(50, 45, 50, 255)
			}
		})

		slot0.trainerName[slot5] = slot7
		slot0.trainerHpIcon[slot5] = slot0.trainerPanel[slot5]:get("hpIcon")
		slot0.skillBg[slot5] = slot0.trainerPanel[slot5]:get("skillBg")
		slot0.trainerHeadImg[slot5] = slot0.trainerPanel[slot5]:get("trainerHead")
		slot0.trainerSkillImg[slot5] = slot0.trainerPanel[slot5]:get("skillImage")

		slot0.trainerSkillImg[slot5]:hide()
		slot0.skillBg[slot5]:hide()

		slot0.goldIcon[slot5] = slot0.trainerSkillImg[slot5]:get("gold")
		slot8 = slot0.trainerSkillImg[slot5]:get("skillCost")

		text.addEffect(slot8, {
			color = lushi.Color.white,
			outline = {
				size = 3,
				color = lushi.OutLineColor.gold
			}
		})

		slot0.goldNum[slot5] = slot8

		slot0:registerTouchEvent(slot0.trainerSkillImg[slot5], slot5)

		slot0.trainerVisible[slot5] = AutoChessEasy.priorDataTable(slot0.trainerPanel[slot5]:isVisible(), "trainerVisible")
	end

	slot0.skillCD = slot0.trainerSkillImg[1]:get("skillCD")

	text.addEffect(slot0.skillCD, {
		color = lushi.Color.white,
		outline = {
			size = 3,
			color = cc.c4b(50, 45, 50, 255)
		}
	})

	slot2 = newCSprite("lushi/jineng/zizouqi_jinengtishi.skel")

	slot2:addTo(slot0.trainerSkillImg[1], 0):xy(slot0.trainerSkillImg[1]:width() / 2, slot0.trainerSkillImg[1]:height() / 2):scale(2)
	slot2:play("effect_loop")
	slot2:hide()

	slot0.skillCanUseEffect = slot2

	slot0:captureScreen()
end

function slot0.registerTouchEvent(slot0, slot1, slot2)
	slot3 = cc.EventListenerTouchOneByOne:create()

	slot3:setSwallowTouches(true)

	function slot4()
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

	slot5, slot6 = nil

	function slot9(slot0, slot1)
		slot2 = display.director
		slot3 = slot2
		uv3 = "display"

		if slot2.getTotalFrames(slot3) - slot3 > 15 then
			uv1 = false
		end

		uv3 = "getTotalFrames"

		if slot3.showInfoAct then
			uv3 = "getTotalFrames"
			slot3 = slot3.skillInfoPanel
			slot3 = slot3.stopAction
			uv5 = "getTotalFrames"

			slot3(slot3, slot5.showInfoAct)

			uv3 = "getTotalFrames"
			slot3.showInfoAct = nil
		end

		uv3 = "getTotalFrames"

		slot3.skillInfoPanel:hide()

		slot4 = slot0
		uv4 = "getTotalFrames"
		slot4 = slot4.parent
		slot5 = slot4
		uv5 = "getTotalFrames"

		if slot5:checkSpriteEvent() then
			uv5 = "showInfoAct"

			if slot5() then
				uv5 = "getTotalFrames"
				uv8 = "skillInfoPanel"
				uv9 = "director"

				slot5:touchEnded(slot4.convertToNodeSpace(slot5, slot0.getLocation(slot4)), slot8, slot9)
			end
		end

		return true
	end

	slot3:registerScriptHandler(function ()
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
	slot3:registerScriptHandler(function (slot0, slot1)
		uv4 = "getLocation"

		if not cc.rectContainsPoint(slot4.longPressRect, slot0:getLocation()) then
			uv1 = false
			uv3 = "getLocation"

			if slot3.showInfoAct then
				uv3 = "getLocation"
				slot3 = slot3.skillInfoPanel
				slot3 = slot3.stopAction
				uv5 = "getLocation"

				slot3(slot3, slot5.showInfoAct)

				uv3 = "getLocation"
				slot3.showInfoAct = nil
			end

			uv3 = "getLocation"

			slot3.skillInfoPanel:hide()
		end

		uv3 = "cc"

		if not slot3 then
			uv3 = "getLocation"

			if slot3:checkSpriteEvent() then
				uv3 = "rectContainsPoint"

				if slot3() then
					uv3 = "getLocation"
					slot3 = slot3.parent
					slot4 = slot3
					uv4 = "getLocation"
					uv7 = "longPressRect"

					slot4:touchMoved(slot3.convertToNodeSpace(slot4, slot2), slot7)
				end

				return true
			end
		end

		return false
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot3:registerScriptHandler(slot9, cc.Handler.EVENT_TOUCH_ENDED)
	slot3:registerScriptHandler(slot9, cc.Handler.EVENT_TOUCH_CANCELLED)
	slot1:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot3, slot1)

	slot0.listener[slot2] = slot3
end

function slot0.checkSpriteEvent(slot0)
	return not slot0.parent.isFighting and not slot0.parent.isGameOver and not slot0.parent.allTouchDisable:get()
end

function slot0.touchBegan(slot0, slot1, slot2)
	slot0.isMoveInit = false
	slot0.baseCheckBuffer = nil
end

function slot0.touchMoved(slot0, slot1, slot2)
	if slot0.baseCheckBuffer == nil then
		slot0.baseCheckBuffer = slot0:checkUseBase(slot2)
	end

	if slot0.baseCheckBuffer == false then
		return
	end

	if slot0.skillType == lushi.TrainerSKillType.buttonSkill then
		-- Nothing
	elseif slot0.skillType == lushi.TrainerSKillType.selectSkill then
		slot4 = slot0.parent.gameLayer:convertToNodeSpace(slot0.trainerPanel[slot2]:convertToWorldSpace(cc.p(slot0.trainerSkillImg[slot2]:xy())))
		slot5 = slot4.x
		slot6 = slot4.y

		if not slot0.isMoveInit then
			slot0.isMoveInit = true

			slot0.parent:onCanPointTo(lushi.PointToType.trainer, true, {
				index = slot2
			})
		end

		slot7 = AutoChessEasy.getEmbaltteSprByPos(slot1, slot0.parent)

		AutoChessEasy.showPointer(slot0.parent, slot5, slot6, slot1, slot7)
		slot0.parent:onPointTo(lushi.PointToType.trainer, slot7, {
			index = slot2
		})
	end
end

function slot0.touchEnded(slot0, slot1, slot2, slot3)
	slot0.isMoveInit = false

	if slot3 and slot0.baseCheckBuffer == nil then
		slot0.baseCheckBuffer = slot0:checkUseBase(slot2)
	end

	if slot0.skillType == lushi.TrainerSKillType.buttonSkill then
		if slot3 and not (slot0.baseCheckBuffer == false) then
			slot0.parent:handleOperation(lushi.OperateTable.trainerSkillConfirm)
		end
	elseif slot0.skillType == lushi.TrainerSKillType.selectSkill then
		slot0.parent.pointSpr:hide()
		slot0.parent:onCanPointTo(lushi.PointToType.trainer, false)
		slot0.parent:onPointEnd(lushi.PointToType.trainer)

		if AutoChessEasy.getEmbaltteSprByPos(slot1, slot0.parent) and not slot4 then
			slot0.parent:handleOperation(lushi.OperateTable.trainerSkillConfirm, slot5.id)
		end
	end

	slot0.baseCheckBuffer = nil
end

function slot0.onUpdateTrainerHp(slot0, slot1, slot2)
	slot0.trainerHp[slot2]:setText(slot1)

	slot3 = slot0.trainerHp[slot2]:width()

	if slot2 == 1 then
		slot0.trainerHpIcon[slot2]:x(slot0.trainerHp[slot2]:x() - slot3 - 28)
	end

	slot0.trainerHpBg[slot2]:width(86 + slot3)
end

function slot0.onUpdateSkillState(slot0)
	slot1, slot2, slot3 = slot0:checkUseBase(1, true)
	slot4 = cc.c3b(255, 255, 255)

	if slot1 then
		slot0.skillCanUseEffect:show()
		slot0.skillCD:hide()
	else
		slot0.skillCanUseEffect:hide()

		if slot2 == lushi.SkillCheck.CD then
			slot4 = cc.c3b(125, 125, 125)

			slot0.skillCD:show()
			slot0.skillCD:setText(slot3)
		else
			slot0.skillCD:hide()
		end
	end

	slot0.skillBg[1]:color(slot4)
	slot0.trainerSkillImg[1]:color(slot4)
	slot0.goldIcon[1]:color(slot4)
	slot0.goldNum[1]:color(slot4)

	if slot2 == lushi.SkillCheck.gold then
		slot0.goldNum[1]:color(lushi.Color.red)
	else
		slot0.goldNum[1]:color(lushi.Color.white)
	end
end

function slot0.checkUseBase(slot0, slot1, slot2)
	return slot0.parent._model.scene.trainer[slot1]:canUseBase(slot2)
end

function slot0.onUpdateTrainerSkill(slot0, slot1, slot2, slot3, slot4)
	if slot3 == 1 then
		slot0.skillType = slot2

		slot0:onUpdateSkillState()
	end

	slot5 = slot0.trainerSkillImg[slot3]

	slot5:hide()
	slot5:get("gold"):hide()
	slot0.goldNum[slot3]:hide()
	slot0.skillBg[slot3]:hide()

	if slot1 then
		if csv.auto_chess.trainer_skills[slot1] then
			slot5:loadTexture(slot9.skillIcon)
		end

		slot5:show()
		slot8:show()

		if slot0.skillType ~= lushi.TrainerSKillType.passiveSkill then
			slot6:show()
			slot7:show()
			slot7:setText(slot4)
		end
	end
end

function slot0.onUpdateTrainerRole(slot0, slot1, slot2, slot3)
	slot0.trainerVisible[slot3] = AutoChessEasy.priorDataTable(true, "trainerVisible")

	slot0.trainerHeadImg[slot3]:show():loadTexture(slot2)
	slot0.trainerName[slot3]:setText(slot1)
end

function slot0.onSetEnemyTrainerVisible(slot0, slot1, slot2, slot3)
	slot0.trainerVisible[2]:set(slot1, slot2, slot3)
	slot0.trainerPanel[2]:setVisible(slot0.trainerVisible[2]:get())
end

function slot0.onSetTrainerVisible(slot0, slot1, slot2, slot3)
	for slot7 = 1, 2 do
		slot0.trainerVisible[slot7]:set(slot1, slot2, slot3)
		slot0.trainerPanel[slot7]:setVisible(slot0.trainerVisible[slot7]:get())
	end
end

function slot0.onPlayTrainerEnterEffect(slot0)
	for slot4 = 1, 2 do
		slot0.trainerVisible[slot4]:set(false, "stageAction")
		slot0.trainerPanel[slot4]:setVisible(slot0.trainerVisible[slot4]:get())

		slot5 = newCSprite("lushi/zizouqi_cj.skel")
		slot6 = slot0.trainerHeadImg[slot4]
		slot8 = slot0.trainerPanel[slot4]:parent()

		slot8:add(slot5)
		slot5:setLocalZOrder(999999)
		slot5:anchorPoint(0.5, 0.5):scale(1):xy(slot8:convertToNodeSpace(slot6:parent():convertToWorldSpace(cc.p(slot6:x(), slot6:y()))))
		slot5:play("transition_head")
		slot5:setTimeScale(1)
		AutoChessEasy.autoRemoveSpine(slot5, function ()
			uv0 = "trainerVisible"
			uv1 = "set"
			slot0 = slot0.trainerVisible[slot1]
			slot1 = slot0
			slot0 = slot0.set
			slot2 = nil
			slot3 = "stageAction"

			slot0(slot1, slot2, slot3, true)

			uv0 = "trainerVisible"
			uv1 = "set"
			uv2 = "trainerVisible"
			uv3 = "set"

			slot0.trainerPanel[slot1]:setVisible(slot2.trainerVisible[slot3]:get())
		end)
	end
end

function slot0.showSkillDesc(slot0, slot1)
	if not slot0.parent:getSceneModel().trainer[slot1].skillCfg then
		return
	end

	if slot0.skillInfoPanel:x() > slot0.skillInfoPanel:parent():width() / 2 and slot1 == 1 then
		slot0.skillInfoPanel:x(slot5 * 2 - slot4)
	elseif slot4 < slot5 and slot1 == 2 then
		slot0.skillInfoPanel:x(slot5 * 2 - slot4)
	end

	slot0.skillInfoPanel:show()
	AutoChessEasy.updateSkillInfo(slot0.skillInfoPanel, slot3)
end

function slot0.onTrainerHeadNum(slot0, slot1, slot2)
	gRootViewProxy:notify("showTrainerNumber", slot0.trainerHeadImg[slot1], slot2)
end

function slot0.onTrainerDead(slot0, slot1)
	slot2 = slot0.trainerHeadImg[slot1]
	slot4 = newCSprite("lushi/zizouqi_cj.skel")
	slot6 = slot0.parent.gameLayer:convertToNodeSpace(slot2:parent():convertToWorldSpace(cc.p(slot2:getPosition())))

	slot0.parent.gameLayer:add(slot4)
	slot4:setLocalZOrder(999999)
	slot4:anchorPoint(0.5, 0.5):scale(1):xy(slot6.x, slot6.y)
	slot4:play("trainer_die")
	slot4:setTimeScale(1)

	slot0.parent.onceEffectWaitCount = slot0.parent.onceEffectWaitCount + 1

	AutoChessEasy.autoRemoveSpine(slot4, function ()
		uv0 = "trainerVisible"
		uv1 = "set"
		slot0 = slot0.trainerVisible[slot1]
		slot1 = slot0
		slot0 = slot0.set
		slot2 = false
		slot3 = "dead"

		slot0(slot1, slot2, slot3)

		uv0 = "trainerVisible"
		uv1 = "set"
		slot0 = slot0.trainerPanel[slot1]
		slot0 = slot0.setVisible
		uv2 = "trainerVisible"
		uv3 = "set"

		slot0(slot0, slot2.trainerVisible[slot3]:get())

		uv0 = "dead"
		slot1 = slot0
		slot0 = slot0.show

		slot0(slot1)

		uv0 = "trainerVisible"
		uv1 = "trainerVisible"
		slot0.parent.onceEffectWaitCount = slot1.parent.onceEffectWaitCount - 1
	end)
	transition.executeSequence(slot0.trainerPanel[slot1]):delay(0.43):func(function ()
		uv0 = "parent"
		slot0 = slot0.parent
		slot0 = slot0.onEventEffect

		slot0(slot0, nil, "shaker", {
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

		uv0 = "onEventEffect"

		slot0:hide()
	end):done()
end

slot1 = nil

function slot0.captureScreen(slot0)
	slot1 = nil

	slot0.trainerHeadImg[1]:setTouchEnabled(true)
	slot0.trainerHeadImg[1]:addTouchEventListener(function ()
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

return slot0
