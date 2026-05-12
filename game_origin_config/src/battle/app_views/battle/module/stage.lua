slot0 = class("Stage", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.frontStageLayer = slot0.parent.frontStageLayer
	slot0.stageLayer = slot0.parent.stageLayer
	slot0.stage = nil
end

function slot0.setStage(slot0, slot1, slot2)
	if slot0.stage then
		slot0.stage:removeFromParent()
	end

	slot3 = newCSpriteWithOption(slot1)

	slot3:setAnchorPoint(cc.p(0, 0))
	slot3:setPosition(display.center)

	if slot2 == 2 then
		slot0.frontStageLayer:add(slot3)
	else
		slot0.stageLayer:add(slot3)
	end

	slot0.stage = slot3

	return slot3
end

function slot0.onAddGround(slot0, slot1)
	slot2 = cc.p(slot1.x, slot1.y)

	for slot6 = 1, slot1.xtileSize do
		slot2.y = slot1.y

		for slot10 = 1, slot1.ytileSize do
			slot11 = slot0:setStage(slot1.config.res, slot1.config.resType):scale(slot1.config.scale)
			slot12, slot13 = slot11:getPosition()

			slot11:setPosition(cc.pAdd(cc.p(slot12, slot13), slot2))

			if slot11:isSpine() then
				if slot1.config.aniName then
					slot11:play(slot1.config.aniName)
					slot11:addPlay("effect_loop")
				else
					slot11:play("effect_loop")
				end

				slot11:setAnimationSpeedScale(slot1.config.frameScale, true)
			end

			slot11:setName(slot1.id .. slot6 * slot1.ytileSize + slot10)
		end

		slot2.x = slot2.x + slot1.xlength
	end
end

function slot0.onMoveGround(slot0, slot1)
	slot2 = cc.p(slot1.x, slot1.y)

	for slot6 = 1, slot1.xtileSize do
		slot2.y = slot1.y

		for slot10 = 1, slot1.ytileSize do
			slot11 = slot1.id .. slot6 * slot1.ytileSize + slot10
			slot12 = nil

			((slot1.config.resType ~= 2 or slot0.frontStageLayer:get(slot11)) and slot0.stageLayer:get(slot11)):setPosition(slot2)

			slot2.y = slot2.y + slot1.ylength
		end

		slot2.x = slot2.x + slot1.xlength
	end
end

function slot0.onUltSkillPreAni1(slot0)
	slot0.parent.subModuleNotify:notify("showMain", false)
	slot0.parent.subModuleNotify:notify("showSpec", false)
	slot0.parent.subModuleNotify:notify("showLinkEffect", false)
end

function slot0.onUltSkillPreAni2(slot0, slot1, slot2, slot3)
	slot4 = newCSpriteWithOption(battle.StageRes.cutRes)
	slot5 = newCSpriteWithOption(battle.StageRes.cutRes)
	slot6 = newCSpriteWithOption(battle.StageRes.cutRes)
	slot7 = newCSprite("config/big_hero/normal/" .. slot2.effectBigName[1] .. ".png")
	slot8 = newCSprite("config/big_hero/normal/" .. slot2.effectBigName[1] .. ".png")
	slot9, slot10, slot11 = nil

	if slot2.skillType == battle.SkillType.PassiveCombine then
		slot10 = newCSprite("config/big_hero/normal/" .. slot2.effectBigName[2] .. ".png")
		slot11 = newCSprite("config/big_hero/normal/" .. slot2.effectBigName[2] .. ".png")
		slot9 = newCSpriteWithOption(battle.StageRes.cutRes)
	end

	slot13 = cc.ClippingNode:create(slot6)
	slot14 = cc.Node:create()
	slot16 = false

	function slot17()
		uv0 = "pairs"

		if slot0 then
			return
		end

		uv0 = true
		uv1 = "parent"

		for slot3, slot4 in pairs(slot1) do
			uv5 = "onEventEffectByObj"

			slot5.parent:onEventEffectByObj(slot4, "show", {
				show = {
					{
						hide = true
					}
				}
			})
		end
	end

	slot4:play((slot12 and "htj_effect" or "effect") .. "_hou")
	slot4:setSpriteEventHandler(function ()
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
	slot4:scale(slot0.parent:onViewProxyCall("getSceneObj", slot1).faceTo * 1.42, 1.2):setPositionY(-20)

	slot19 = cc.Node:create()

	slot7:setPositionX(-420)
	slot8:setPositionX(-420)
	slot7:setPositionY(0)
	slot8:setPositionY(0)

	slot20 = 1

	if slot2.effectBigFlip then
		slot20 = -1
	end

	if slot2.effectBigPos.x ~= 0 then
		slot7:setPositionX(slot7:getPositionX() + slot21.x)
		slot8:setPositionX(slot8:getPositionX() + slot21.x)
	end

	if slot21.y ~= 0 then
		slot7:setPositionY(slot7:getPositionY() + slot21.y)
		slot8:setPositionY(slot8:getPositionY() + slot21.y)
	end

	slot7:scale(slot20 * 1.35, 1.35)
	slot8:scale(slot20 * 1.4, 1.4)
	slot8:setGLProgram("color"):setUniformVec3("color", cc.Vertex3F(0.93, 0.07, 0.41))
	slot6:xy(0, 0):scale(1, 1):play(slot18 .. "_zhezhao")
	slot19:add(slot8, 1):add(slot7, 2):xy(-500, -500):scale(1.2)
	slot13:scale(slot15 * 1.2, 1.2)
	slot13:add(slot19)
	transition.executeSequence(slot19):delay(0.5):easeBegin("IN"):spawnBegin():moveTo(0.33, 0, 0):scaleTo(0.33, 1):spawnEnd():easeEnd():easeBegin("IN"):moveBy(0.33, -50, -50):moveBy(0.33, 50, 50):easeEnd():easeBegin("OUT"):spawnBegin():moveTo(0.5, 1136, 640):scaleTo(0.5, 0.1):func(slot17):spawnEnd():easeEnd():done()
	slot5:play(slot18 .. "_qian")
	slot5:setScaleX(slot15)

	if display.uiOrigin.y ~= 0 then
		slot23 = display.sizeInPixels.height
		slot22 = 2 * (slot23 + display.uiOrigin.y) / slot23
	end

	slot14:add(slot4, 1):add(slot13, 2):add(slot5, 3):scale(slot22):setPosition(display.center)
	slot14:x(slot14:x() - slot15 * display.uiOrigin.x)

	if slot12 then
		slot23 = cc.ClippingNode:create(slot9)
		slot24 = cc.Node:create()

		slot10:setPositionX(-420)
		slot11:setPositionX(-420)
		slot10:setPositionY(0)
		slot11:setPositionY(0)

		if slot21.combX and slot21.combX ~= 0 then
			slot10:setPositionX(slot10:getPositionX() + slot21.combX)
			slot11:setPositionX(slot11:getPositionX() + slot21.combX)
		end

		if slot21.combY and slot21.combY ~= 0 then
			slot10:setPositionY(slot10:getPositionY() + slot21.combY)
			slot11:setPositionY(slot11:getPositionY() + slot21.combY)
		end

		slot10:scale(slot20 * 1.35, -1.35)
		slot11:scale(slot20 * 1.4, -1.4)
		slot11:setGLProgram("color"):setUniformVec3("color", cc.Vertex3F(0.93, 0.07, 0.41))
		slot9:xy(0, 0):scale(1, 1):play(slot18 .. "_zhezhao")
		slot24:add(slot11, 1):add(slot10, 2):xy(-500, -500):scale(1.2)
		slot23:scale(-1 * slot15 * 1.2, -1.2)
		slot23:add(slot24)
		transition.executeSequence(slot24):delay(0.5):easeBegin("IN"):spawnBegin():moveTo(0.33, 0, 0):scaleTo(0.33, 1):spawnEnd():easeEnd():easeBegin("IN"):moveBy(0.33, -50, -50):moveBy(0.33, 50, 50):easeEnd():easeBegin("OUT"):spawnBegin():moveTo(0.5, 1136, 640):scaleTo(0.5, 0.1):func(slot17):spawnEnd():easeEnd():done()
		slot14:add(slot23, 2)
	end

	slot0.parent.layer:add(slot14)
end

function slot0.skillStageEffect(slot0, slot1, slot2)
	if slot0.parent:onViewProxyCall("getSceneObj", slot1) == nil then
		return
	end

	slot4 = slot2.blankTime
	slot5 = slot2.scaleArgs

	if slot2.cameraNear == 1 or slot2.cameraNear == 2 then
		slot4 = slot2.cameraNear_blankTime
		slot5 = slot2.cameraNear_scaleArgs
	end

	if not slot4 or slot4 <= 0 then
		return
	end

	if slot5.scale and slot5.scale ~= 1 then
		slot3:objToBlank(slot5)
	end

	slot6 = slot0.parent

	table.insert(slot0.parent.effectJumpCache, slot0.parent:onEventEffect(nil, "effect", {
		effectType = 1,
		faceTo = 1,
		effectRes = battle.StageRes.daZhaoBJ,
		effectArgs = {
			zorder = 0,
			aniloop = false,
			delay = 0,
			offsetX = 0,
			aniName = "dazhao_bj",
			addTolayer = 0,
			offsetY = 0,
			screenPos = 0,
			scale = 2,
			lastTime = slot4
		},
		onComplete = function ()
		end
	}))
end

function slot0.onSkillStartStageMove(slot0, slot1)
	slot2 = slot1 == 2 and 1.15 or 0.85

	transition.executeParallel(slot0.stageLayer):scaleTo(0.8, slot2)
	transition.executeParallel(slot0.parent.gameLayer):scaleTo(0.8, slot2)
	transition.executeParallel(slot0.parent.effectLayer):scaleTo(0.8, slot2)
end

function slot0.onSkillEndStageMoveBack(slot0)
	transition.executeParallel(slot0.stageLayer):moveTo(0.3, 0, 0):scaleTo(0.3, 1)
	transition.executeParallel(slot0.parent.gameLayer):moveTo(0.3, 0, display.fightLower):scaleTo(0.3, 1)
	transition.executeParallel(slot0.parent.effectLayer):moveTo(0.3, 0, display.fightLower):scaleTo(0.3, 1)
end

function slot0.onAlterBattleScene(slot0, slot1)
	if not slot0.bgSprGroup then
		slot0.bgSprGroup = {}
	end

	if slot0.bgSprGroup[slot1.buffId] then
		slot0.bgSprGroup[slot1.buffId]:removeSelf()

		slot0.bgSprGroup[slot1.buffId] = nil
	end

	if not slot1.restore then
		for slot5, slot6 in pairs(slot0.bgSprGroup) do
			slot6:hide()
		end

		if slot1.aniName then
			slot2 = newCSpriteWithOption(slot1.resPath)

			slot0.parent.stageLayer:add(slot2, 9999)
			slot2:setPosition(display.center)

			slot3, slot4 = slot2:getPosition()

			slot2:setPosition(slot3 + slot1.x, slot4 + slot1.y):scale(2)
			slot2:play(slot1.aniName .. "_loop")

			slot0.bgSprGroup[slot1.buffId] = slot2
		else
			slot2 = cc.Sprite:create(slot1.resPath)

			slot2:xy(display.center):scale(2)
			slot0.parent.stageLayer:add(slot2, 9999)

			slot0.bgSprGroup[slot1.buffId] = slot2
		end
	else
		for slot6, slot7 in pairs(slot0.bgSprGroup) do
			if -1 < slot6 then
				slot2 = slot6
			end
		end

		if slot2 ~= -1 then
			slot0.bgSprGroup[slot2]:show()
		end
	end
end

return slot0
