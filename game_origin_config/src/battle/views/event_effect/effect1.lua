slot0 = math.min
slot1 = math.max
slot2 = class("SegShow", battleEffect.EventEffect)
battleEffect.SegShow = slot2

function slot2.onPlay(slot0)
	slot0.idx = 1
	slot0.model = slot0.view.model
	slot0.viewKey = slot0.view.key
	slot0.segs = slot0.args.damageSeg or slot0.args.hpSeg
	slot0.intervals = slot0.args.segInterval
	slot0.waitTick = slot0.intervals[1]

	if not slot0.args.processArgs or not slot0.args.processArgs.values[slot0.model.id] then
		errorInWindows("SegShow Args valueArgs nil,unitId = %s,processCfg id = %s", slot0.model and slot0.model.unitID or -1, slot0.args.processArgs and slot0.args.processArgs.process and slot0.args.processArgs.process.id or -1)

		return slot0:free()
	end

	slot0.valueArgs = slot0.args.processArgs.values[slot0.model.id]

	if slot0.args.processArgs.buffTb then
		slot0.buffArgs = slot0.args.processArgs.buffTb[slot0.model.id]
	end

	slot0.type = slot0.args.processArgs.process.segType
	slot0.numShow = slot0.type == slot0.args.processArgs.showType

	if slot0.type == battle.SkillSegType.damage then
		slot0.view:beHit(0, 0)
	end
end

function slot2.onUpdate(slot0, slot1)
	slot2 = gRootViewProxy:raw()

	if not gRootViewProxy:call("isObjExisted", slot0.viewKey) then
		return slot0:free()
	end

	slot3 = table.length(slot0.segs)

	if slot0.type == battle.SkillSegType.damage then
		slot0.view:beHit(slot1)
	end

	if slot0.waitTick <= slot0.tick and slot2 then
		if not assertInWindows(slot0.valueArgs[slot0.idx] or {}, "effect_event seg is missed!!") then
			slot5 = slot4.value and slot4.value:get() or 0

			if slot0.idx == 1 and slot0.buffArgs then
				slot2:runDefer(slot0.buffArgs)
			end

			slot2:runDefer(slot4 and slot4.deferList)

			if slot0.numShow then
				gRootViewProxy:notify("showNumber", {
					delta = slot5,
					skillId = slot0.args.processArgs.skillId,
					typ = slot0.type
				})
			end

			if slot0.type == battle.SkillSegType.damage then
				slot0.view:beHit(0, 600)
			end
		end

		slot0.idx = slot0.idx + 1

		if slot3 < slot0.idx or not slot0.valueArgs[slot0.idx] then
			if slot0.type == battle.SkillSegType.damage then
				battleEasy.effect(slot0.view.model, function ()
					uv3 = "gRootViewProxy"

					if not gRootViewProxy:call("isObjExisted", slot3.viewKey) then
						return
					end

					uv0 = "gRootViewProxy"

					if slot0.view.actionState == "hit" then
						uv0 = "gRootViewProxy"

						slot0.view:setActionState(battle.SpriteActionTable.standby)
					end
				end, {
					delay = slot0.view:getLeftBeHitTime()
				})
			end

			return slot0:stop()
		end

		slot0.waitTick = slot0.waitTick + slot0.intervals[slot0.idx] or 0
	end
end

function slot2.onFree(slot0)
end

function slot2.onStop(slot0)
end

slot3 = class("Sound", battleEffect.EventEffect)
battleEffect.Sound = slot3

function slot3.onPlay(slot0)
	slot1 = slot0.args.music and slot0.args.music or slot0.args.sound
	slot2 = slot1.loop > 0

	if slot1.bgmChanged then
		audio.pauseMusic()

		gRootViewProxy:raw().bgmChanged = true
	end

	slot0.handle = audio.playEffectWithWeekBGM(slot1.res, slot2)

	if not slot2 then
		slot0:free()
	end
end

function slot3.onStop(slot0)
	if slot0.handle then
		audio.stopSound(slot0.handle)

		slot0.handle = nil
	end
end

function slot3.debugString(slot0)
	return string.format("Sound: %s", (slot0.args.music and slot0.args.music or slot0.args.sound).res)
end

slot4 = class("Music", battleEffect.OnceEventEffect)
battleEffect.Music = slot4
slot5 = {
	play = audio.playMusic,
	stop = audio.stopMusic,
	pause = audio.pauseMusic,
	resume = audio.resumeMusic
}

function slot4.onPlay(slot0)
	slot2 = gRootViewProxy:raw()

	if slot0.args.music.res then
		uv3 = "args"

		slot3[slot1.op](slot1.res, slot1.isLoop or false)
	else
		uv3 = "args"

		slot3[slot1.op]()
	end

	if slot1.bgmChanged then
		slot2.bgmChanged = true
	end
end

function slot4.debugString(slot0)
	return string.format("Music: %s", slot0.args.music.res)
end

slot6 = class("ShowCards", battleEffect.EventEffect)
battleEffect.ShowCards = slot6

function slot6.onPlay(slot0)
	if slot0.args.showCards == 1 then
		for slot4 = 1, SELF_HERO_COUNT do
			if slot0.showCardIDs[slot4] and slot0.showCardIDs[slot4] then
				gRootViewProxy:notify("processSkillTargetHide", tostring(slot5), false)
			end
		end
	elseif slot0.args.showCards == 2 then
		for slot4 = 1, SELF_HERO_COUNT do
			if slot0.showCardIDs[slot4] and not slot5:isDeath() and slot5.id ~= slot0.owner.id then
				for slot10, slot11 in pairs(slot0.sputteringTargets) do
					if slot5.id == slot11.id then
						slot6 = false
					end
				end
			end

			if slot6 then
				gRootViewProxy:notify("processSkillTargetHide", tostring(slot5), true)
			else
				gRootViewProxy:notify("processSkillTargetHide", tostring(slot5), false)
			end
		end
	end
end

function slot6.onStop(slot0)
end

slot7 = class("Shaker", battleEffect.EventEffect)
battleEffect.Shaker = slot7

function slot7.onPlay(slot0)
	slot0.view = gRootViewProxy:raw()
	slot0.target = slot0.view

	slot0:resetShaker()

	slot0.disx = slot0.args.shaker.disx or 0
	slot0.disy = slot1.disy or 0
	slot0.isRepeat = slot1.isRepeat

	if slot0.isRepeat and slot0.args.segInterval then
		slot0.timeList = slot0.args.segInterval
		slot0.timer = 0
		slot0.seg = 1
	end

	if slot0:shakerCountOver() then
		slot0:stop()
	end
end

function slot7.onStop(slot0)
	slot0.target:setPosition(0, 0)
end

function slot7.resetShaker(slot0)
	slot0.lastTime = slot0.args.shaker.lastTime or slot1.endT - slot1.beginT
	slot0.count = slot1.count or 1
	slot0.dur = 0
	slot0.wait = slot1.beginT or 0
	slot0.interval = slot1.interval or 0
end

function slot7.waiting(slot0)
	return slot0.wait >= 0
end

function slot7.shakerIng(slot0)
	return slot0.dur > 0
end

function slot7.shakerCountOver(slot0)
	return slot0.count <= 0
end

function slot7.needRepeat(slot0)
	if not slot0.timeList or not slot0.seg then
		return false
	end

	return slot0.timeList[slot0.seg + 1]
end

function slot7.repeatWaiting(slot0)
	return slot0.timer < slot0.timeList[slot0.seg + 1]
end

function slot7.onUpdate(slot0, slot1)
	if slot0.timer then
		slot0.timer = slot0.timer + slot1
	end

	if slot0:shakerIng() then
		slot0.dur = slot0.dur - slot1

		if slot0.dur > 0 then
			slot0.target:setPosition(math.random(-slot0.disx, slot0.disx), math.random(-slot0.disy, slot0.disy))
		else
			slot0.target:setPosition(0, 0)
		end
	elseif slot0:shakerCountOver() then
		if slot0:needRepeat() then
			if not slot0:repeatWaiting() then
				slot0.seg = slot0.seg + 1
				slot0.timer = 0

				slot0.target:setPosition(0, 0)
				slot0:resetShaker()
			end
		else
			return slot0:stop()
		end
	elseif slot0:waiting() then
		slot0.wait = slot0.wait - slot1

		if slot0.wait < 0 then
			if slot0.count > 0 then
				slot0.dur = slot0.lastTime
				slot0.wait = slot0.interval
			end

			slot0.count = slot0.count - 1
		end
	else
		return slot0:stop()
	end
end

function slot7.onStop(slot0)
	slot0.target:setPosition(0, 0)
end

function slot7.debugString(slot0)
	slot1 = slot0.dur or 0
	slot2 = ""

	if slot0.seg then
		slot2 = string.format("%s/%s", slot0.seg, table.length(slot0.timeList))
	end

	return string.format("Shaker: %5.2f %s", slot1, slot2)
end

slot8 = class("Move", battleEffect.OnceEventEffect)
battleEffect.Move = slot8

function slot8.onPlay(slot0)
	log.battle.event_effect.move("受击目标表现！！！")

	slot0.targets = slot0.args.targets or {}
	slot1 = 1

	if slot0.args.faceTo then
		slot1 = slot0.args.faceTo == 1 and 1 or -1
	end

	slot3 = 0
	slot4 = 0

	for slot8, slot9 in ipairs(slot0:adaptArgs(slot1)) do
		if slot9.t == nil then
			break
		end

		uv11 = "log"
		slot11 = slot11(slot9.t / 1000, 0.01)
		slot12 = 0
		slot13 = 0

		function slot14()
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

		function slot15()
			uv0 = "target"
			slot0, slot1 = slot0.target:getCurPos()
			slot2 = log.battle.event_effect.moveBefore
			slot3 = {
				target = slot4,
				posx = slot0,
				posy = slot1
			}
			uv4 = "target"

			slot2(slot3)

			uv2 = "getCurPos"
			slot2 = slot0 + slot2
			uv3 = "log"
			slot3 = slot1 + slot3
			uv4 = "target"
			slot6 = cc.p

			slot4.target.target:setCurPos(slot6(slot2, slot3))

			uv6 = "target"

			log.battle.event_effect.moveAfter({
				target = slot6.target,
				posx = slot2,
				posy = slot3
			})
		end

		slot16 = transition.executeSequence(slot0.target)

		if slot9.delay then
			slot16:delay(slot9.delay / 1000)
		end

		slot16:func(slot14):func(slot15):done()
	end
end

function slot9(slot0, slot1, slot2, slot3)
	slot3 = 1 - slot3

	for slot11, slot12 in pairs(slot1) do
		uv13 = "math"
		slot13 = slot13(-math.huge, slot12.x)
		slot4 = slot13
		uv13 = "huge"
		slot13 = slot13(math.huge, slot12.x)
		slot6 = slot13
		uv13 = "math"
		slot13 = slot13(-math.huge, slot12.y)
		slot5 = slot13
		uv13 = "huge"
		slot7 = slot13(math.huge, slot12.y)
	end

	slot8 = cc.p((slot4 + slot6) / 2, (slot5 + slot7) / 2)

	return (slot8.x - slot2.x) * slot3, (slot8.y - slot2.y) * slot3
end

function slot8.adaptArgs(slot0, slot1)
	if not slot0.target then
		return
	end

	slot1 = slot1 or 1
	slot3, slot4 = slot2:getPosition()
	slot6 = gGameUI.uiRoot:convertToNodeSpace(slot2:getParent():convertToWorldSpace(cc.p(slot3, slot4)))

	for slot13, slot14 in ipairs(clone(slot0.args.move)) do
		if slot14.absX or slot14.absY then
			slot14.absX = slot14.absX and (slot1 == 1 and slot14.absX or display.width - slot14.absX)
			slot16 = slot14.absY and slot14.absY - slot6.y

			if slot14.absX and slot1 * (slot14.absX - slot6.x) then
				slot14.x = slot14.x and slot14.x + slot15 or slot15
			end

			if slot16 then
				slot14.y = slot14.y and slot14.y + slot16 or slot16
			end
		end

		if slot14.teamClose then
			slot14.delay = slot14.delay and slot14.delay + 20

			if not slot0.objPosTb then
				slot16 = nil

				for slot20, slot21 in pairs(slot0.targets) do
					if slot21 then
						slot22, slot23 = slot21:getCurPos()

						if slot21.id == slot2.id then
							slot16 = cc.p(slot22, slot23)
						end
					end
				end

				slot0.objPosTb = {
					[slot21.id] = cc.p(slot1 == 1 and slot22 or display.width - slot22, slot23)
				}
				slot0.selfPos = slot16
			end

			uv15 = "target"
			slot15, slot16 = slot15(slot0.targets, slot0.objPosTb, slot0.selfPos, slot14.teamClose)
			slot14.x = slot14.x and slot14.x + slot15 or slot15
			slot14.y = slot14.y and slot14.y + slot16 or slot16
		end
	end

	return slot9
end

slot10 = class("Show", battleEffect.OnceEventEffect)
battleEffect.Show = slot10

function slot10.onPlay(slot0)
	for slot5, slot6 in ipairs(slot0.args.show) do
		if slot6.hide == nil then
			break
		end

		slot7 = transition.executeSequence(slot0.view)

		if slot6.delay then
			slot7:delay(slot6.delay / 1000)
		end

		slot7:func(function ()
			uv0 = "view"
			uv2 = "setVisible"

			slot0.view:setVisible(not slot2.hide)
		end)

		if slot6.lastTime then
			slot7:delay(slot6.lastTime / 1000)
			slot7:func(function ()
				uv0 = "view"
				uv2 = "setVisible"

				slot0.view:setVisible(slot2.hide)
			end)
		end

		slot7:done()
	end
end

slot11 = class("Delay", battleEffect.EventEffect)
battleEffect.Delay = slot11

function slot11.onUpdate(slot0, slot1)
end

function slot11.debugString(slot0)
	return string.format("Delay: %5.2f", slot0.lifetime - (slot0.tick or 0))
end

slot12 = class("SpriteEffect", battleEffect.EventEffect)
battleEffect.SpriteEffect = slot12

function slot12.onPlay(slot0)
	slot1 = slot0.args.effectType or 0
	slot2 = slot0.args.effectRes or slot0.args.action
	slot3 = slot0.args.effectArgs or {}
	slot4 = gRootViewProxy:raw()
	slot0.onComplete = slot0.args.onComplete

	if slot0.onComplete then
		slot5 = slot0.onComplete

		function slot0.onComplete()
			uv0 = "onComplete"

			if slot0.onComplete then
				uv0 = "onComplete"
				slot0.onComplete = nil
				uv0 = "stop"

				slot0()

				uv0 = "onComplete"

				slot0:stop()
			end
		end
	end

	function slot5()
		uv0 = "args"

		if slot0 == 0 then
			uv0 = "isCantMoveBigSkill"

			if slot0.args.isCantMoveBigSkill then
				uv0 = "isCantMoveBigSkill"
				uv2 = "isCantMoveBigSkill"

				slot0.view:setPosition(slot2.view:getCurPos())
			end

			uv0 = "isCantMoveBigSkill"
			uv2 = "view"
			uv3 = "isCantMoveBigSkill"

			slot0.view:setActionState(slot2, slot3.onComplete)
		else
			uv0 = "args"

			if slot0 == 1 then
				uv0 = "isCantMoveBigSkill"
				slot1 = 3
				slot3 = 0
				slot2 = cc.p(slot3, 0)
				uv3 = "setPosition"

				if slot3.offsetX then
					uv3 = "setPosition"

					if slot3.offsetY then
						uv4 = "setPosition"
						uv5 = "setPosition"
						slot2 = cc.p(slot0.args.faceTo * slot4.offsetX, slot5.offsetY)
					end
				end

				uv3 = "isCantMoveBigSkill"
				uv5 = "view"
				slot4 = newCSpriteWithOption(slot5)
				slot3.sprite = slot4
				slot3 = assert
				uv4 = "isCantMoveBigSkill"
				uv6 = "view"

				slot3(slot4.sprite, "ERROR!!! effectArgs add res error, not find the res:", slot6)

				uv3 = "isCantMoveBigSkill"
				slot3 = slot3.sprite
				slot4 = slot3

				slot3.setAnchorPoint(slot4, cc.p(0.5, 0.5))

				uv3 = "setPosition"
				uv4 = "setPosition"
				slot3.scale = slot4.scale or 1
				uv3 = "setPosition"

				if slot3.addTolayer == 0 then
					uv3 = "isCantMoveBigSkill"
					slot3 = slot3.sprite
					slot3 = slot3.setScaleX

					slot3(slot3, 2.35)

					uv3 = "isCantMoveBigSkill"

					slot3.sprite:setScaleY(2)
				else
					uv3 = "isCantMoveBigSkill"
					slot3 = slot3.sprite
					slot3 = slot3.setScaleX
					uv6 = "setPosition"
					slot5 = slot0 * slot1 * slot6.scale

					slot3(slot3, slot5)

					uv3 = "isCantMoveBigSkill"
					uv5 = "setPosition"

					slot3.sprite:setScaleY(slot1 * slot5.scale)
				end

				uv3 = "setPosition"

				if slot3.screenPos then
					uv3 = "setPosition"

					if slot3.screenPos == 0 then
						slot2 = cc.pAdd(slot2, display.center)
					else
						uv3 = "setPosition"

						if slot3.screenPos == 1 then
							uv3 = "isCantMoveBigSkill"
							slot3, slot4 = slot3.target:getCurPos()
							slot2 = cc.pAdd(slot2, cc.p(slot3, slot4))
						end
					end

					uv3 = "isCantMoveBigSkill"
					slot3 = slot3.sprite
					slot3 = slot3.setPosition

					slot3(slot3, slot2)

					uv3 = "setPosition"

					if slot3.addTolayer == 1 then
						uv3 = "getCurPos"
						uv5 = "isCantMoveBigSkill"
						uv6 = "setPosition"

						slot3.effectLayerUpper:add(slot5.sprite, slot6.zorder or 0)
					else
						uv3 = "setPosition"

						if slot3.addTolayer == 0 then
							uv3 = "getCurPos"
							uv5 = "isCantMoveBigSkill"
							uv6 = "setPosition"

							slot3.stageLayer:add(slot5.sprite, slot6.zorder or 0)
						else
							uv3 = "getCurPos"
							uv5 = "isCantMoveBigSkill"
							uv6 = "setPosition"

							slot3.effectLayerLower:add(slot5.sprite, slot6.zorder or 0)
						end
					end
				else
					uv3 = "isCantMoveBigSkill"
					slot3 = slot3.sprite
					slot3 = slot3.setPosition
					slot5 = slot2

					slot3(slot3, slot5)

					uv3 = "isCantMoveBigSkill"
					uv5 = "isCantMoveBigSkill"
					uv6 = "setPosition"

					slot3.view:add(slot5.sprite, slot6.zorder or 0)
				end

				uv3 = "isCantMoveBigSkill"

				if slot3.sprite:isSpine() then
					uv3 = "setPosition"

					if slot3.aniName then
						uv3 = "isCantMoveBigSkill"
						uv5 = "setPosition"

						slot3.sprite:play(slot5.aniName)
					else
						uv3 = "setPosition"
						uv4 = "isCantMoveBigSkill"
						slot3.aniLoop = slot4.sprite:play("effect_loop")
						uv3 = "setPosition"

						if not slot3.aniLoop then
							uv3 = "isCantMoveBigSkill"

							slot3.sprite:play("effect")
						end
					end
				end

				uv4 = "setPosition"

				if slot4.aniLoop then
					uv4 = "setPosition"

					if slot4.flytime then
						uv4 = "setPosition"

						if slot4.flyX then
							uv4 = "setPosition"

							if slot4.flyY then
								uv5 = "isCantMoveBigSkill"
								uv6 = "setPosition"
								uv7 = "setPosition"
								uv8 = "setPosition"

								transition.executeSequence(slot5.sprite):moveBy(slot6.flytime / 1000, slot7.flyX * slot0, slot8.flyY):func(function ()
									uv0 = "stop"

									slot0:stop()
								end):done()
							end
						end
					else
						uv5 = "isCantMoveBigSkill"
						slot4 = transition.executeSequence(slot5.sprite)
						slot5 = slot4
						slot4 = slot4.delay
						uv6 = "setPosition"

						if slot6.lastTime then
							uv6 = "setPosition"

							if not (slot6.lastTime / 1000) then
								slot6 = 1
							end
						end

						slot4(slot5, slot6):func(slot3):done()
					end
				else
					uv4 = "setPosition"

					if slot4.lastTime then
						uv5 = "isCantMoveBigSkill"
						uv6 = "setPosition"

						transition.executeSequence(slot5.sprite):delay(slot6.lastTime / 1000):func(slot3):done()
					else
						uv4 = "isCantMoveBigSkill"

						slot4.sprite:setSpriteEventHandler(function (slot0, slot1)
							if slot0 == sp.EventType.ANIMATION_COMPLETE then
								uv3 = "sp"

								removeCSprite(slot3.sprite)
							end
						end)
					end
				end
			end
		end
	end

	slot6 = transition.executeSequence(slot0.view)

	if slot3.delay then
		slot6:delay(slot3.delay / 1000)
	end

	slot6:func(slot5):done()

	if not slot0.onComplete then
		slot0:stop()
	end
end

function slot12.onUpdate(slot0, slot1)
end

function slot12.onStop(slot0)
	if slot0.onComplete then
		if slot0.view.actionCompleteCallback == slot0.onComplete then
			slot0.view.actionCompleteCallback = nil
		end

		slot0.onComplete()
	end
end

function slot12.stop(slot0)
	if slot0.sprite then
		slot0.sprite:stopAllActions()
		removeCSprite(slot0.sprite)

		slot0.sprite = nil
	end

	battleEffect.EventEffect.stop(slot0)
end

function slot12.debugString(slot0)
	if (slot0.args.effectArgs or {}).aniName then
		slot2 = string.format("%s#%s", slot0.args.effectRes or slot0.args.action, slot1.aniName)
	end

	return string.format("SpriteEffect: %s -> %s", slot2, toDebugString(slot0.view))
end

slot13 = class("ZOrder", battleEffect.OnceEventEffect)
battleEffect.ZOrder = slot13

function slot13.onPlay(slot0)
	for slot5, slot6 in ipairs(slot0.args.zOrder) do
		if not slot6.zorder then
			break
		end

		slot8 = transition.executeSequence(slot0.view)

		if slot6.delay then
			slot8:delay(slot6.delay / 1000)
		end

		slot9 = slot0.view:getLocalZOrder()

		slot8:func(function ()
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

		if slot6.lastTime then
			slot8:delay(slot6.lastTime / 1000)
			slot8:func(function ()
				uv0 = "view"
				uv2 = "setLocalZOrder"

				slot0.view:setLocalZOrder(slot2)
			end)
		end

		slot8:done()
	end
end
