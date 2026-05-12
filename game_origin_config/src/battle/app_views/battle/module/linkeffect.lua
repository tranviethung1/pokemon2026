slot0 = class("LinkEffect", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.lines = {}
	slot0.pos = {}
	slot0.kPos = {}
	slot0.caster2Keys = {}
	slot0.isShow = true
	slot0.forceShow = {
		[1.0] = true,
		[2.0] = true
	}
	slot0.updateObjKey = nil
	slot0.updateObjNode = nil
	slot0.lastx = 0
	slot0.lasty = 0
	slot0.holderKeyCnt = {}
	slot0.wrongOrderDelRecord = {}
end

function slot0.alterLine(slot0, slot1, slot2, slot3, slot4)
	if not slot0.pos[slot1] or not slot0.pos[slot2] then
		return
	end

	slot5 = slot0.pos[slot1][1] + slot0.kPos[slot1].x
	slot6 = slot0.pos[slot1][2] + slot0.kPos[slot1].y
	slot7 = slot0.pos[slot2][1] + slot0.kPos[slot2].x
	slot8 = slot0.pos[slot2][2] + slot0.kPos[slot2].y
	slot9 = math.sqrt((slot5 - slot7) * (slot5 - slot7) + (slot6 - slot8) * (slot6 - slot8))

	if slot3.boxWidth == 0 then
		slot3.boxWidth = slot3:getBoundingBox().width
	end

	slot11 = {
		x = slot5 - slot7,
		y = slot6 - slot8
	}

	slot3:scaleX(slot4 * slot9 / slot3.boxWidth):setRotation(-(math.atan2(slot11.y, slot11.x) * 180 / math.pi))
end

function slot0.getLineVisible(slot0, slot1)
	slot3 = slot0:call("getSceneObj", slot1.casterKey)

	if not slot0:call("getSceneObj", slot1.holderKey) or not slot3 then
		return false
	end

	return slot0.isShow and slot0.forceShow[slot1.force] and (slot2:isVisible() and slot3:isVisible()) and (slot2.spriteVisible:get() and slot3.spriteVisible:get())
end

function slot0.onUpdateSpriteLinkVisible(slot0, slot1)
	for slot6, slot7 in pairs(slot0.lines) do
		if slot7.holderKey == slot1 then
			function (slot0)
				uv1 = "getLineVisible"

				if slot1:getLineVisible(slot0) then
					uv2 = "getLineVisible"

					slot2:onDoShiftPos(slot0.holderKey)
				end

				slot0.line:setVisible(slot1)
			end(slot7)

			break
		end
	end

	if slot0:tryGetCaster(slot1) then
		slot3 = nil

		for slot7, slot8 in ipairs(slot0.caster2Keys[slot1]) do
			slot2(slot0.lines[slot8])
		end
	end
end

function slot0.refreshByObj(slot0, slot1)
	for slot5, slot6 in pairs(slot0.lines) do
		if slot0:tryGetCaster(slot6.casterKey) == slot1 or slot6.holderKey == slot1 then
			slot0:alterLine(slot7, slot6.holderKey, slot6.line, slot6.scaleX)
		end
	end
end

function slot0.checkObjMove(slot0)
	if not slot0.pos[slot0.updateObjKey] then
		return false
	end

	slot3 = slot1[2]

	if slot1[1] ~= slot0.lastx or slot3 ~= slot0.lasty then
		slot0.lasty = slot3
		slot0.lastx = slot2

		return true
	end

	return false
end

function slot0.onUpdate(slot0, slot1)
	if not slot0.updateObjKey or not slot0.isShow or not slot0:checkObjMove() then
		return
	end

	slot0:refreshByObj(slot0.updateObjKey)
end

function slot0.onAddLinkEffect(slot0, slot1, slot2, slot3, slot4)
	if slot0.lines[slot4] or slot0.wrongOrderDelRecord[slot5] then
		return
	end

	slot0.holderKeyCnt[slot1] = slot0.holderKeyCnt[slot1] or 0
	slot0.holderKeyCnt[slot1] = slot0.holderKeyCnt[slot1] + 1
	slot6 = slot3.effectRes
	slot7 = slot3.aniName
	slot8 = slot3.offsetPos
	slot9 = slot3.deep
	slot10 = slot3.scaleX or 1
	slot12 = slot8 and cc.p(slot8.x, slot8.y) or cc.p(0, 0)

	if slot0:call("getSceneObj", slot1).force == 2 then
		slot12 = cc.p(-slot12.x, slot12.y)
	end

	slot15 = newCSpriteWithOption(slot6)

	slot15:addTo(slot11, slot9)
	slot15:setPosition(cc.pAdd(slot11.unitCfg.everyPos.hitPos, slot12))
	slot15:play(slot7)
	slot15:setVisible(slot0.isShow and slot0.forceShow[slot11.force])

	slot15.boxWidth = 0
	slot0.kPos[slot1] = slot14

	slot0:savePosition(slot11, slot1)

	slot0.lines[slot5] = {
		line = slot15,
		buffId = slot4,
		holderKey = slot1,
		casterKey = slot2,
		scaleX = slot10,
		force = slot11.force
	}
	slot0.caster2Keys[slot2] = slot0.caster2Keys[slot2] or {}

	if slot1 == slot2 then
		table.insert(slot0.caster2Keys[slot2], 1, slot5)
	else
		table.insert(slot0.caster2Keys[slot2], slot5)
	end

	slot0:refreshByObj(slot0:tryGetCaster(slot2))
	slot15:scheduleUpdate(function ()
		uv0 = "tryGetCaster"
		slot1 = slot0
		uv2 = "boxWidth"
		slot0 = slot0.tryGetCaster(slot1, slot2)
		uv1 = "getBoundingBox"
		uv2 = "getBoundingBox"
		slot1.boxWidth = slot2:getBoundingBox().width
		uv1 = "getBoundingBox"

		if slot1.boxWidth > 0 then
			uv1 = "getBoundingBox"

			slot1:unscheduleUpdate()
		end

		uv1 = "tryGetCaster"
		uv4 = "width"
		uv5 = "getBoundingBox"
		uv6 = "unscheduleUpdate"

		slot1:alterLine(slot0, slot4, slot5, slot6)
	end)
end

function slot0.onDelLinkEffect(slot0, slot1)
	if not slot0.lines[slot1] then
		slot0.wrongOrderDelRecord[slot2] = true

		return
	end

	if slot0.caster2Keys[slot0.lines[slot2].casterKey] then
		for slot7, slot8 in ipairs(slot0.caster2Keys[slot3]) do
			if slot8 == slot2 then
				table.remove(slot0.caster2Keys[slot3], slot7)

				break
			end
		end
	end

	slot0.holderKeyCnt[slot4] = slot0.holderKeyCnt[slot0.lines[slot2].holderKey] or 0
	slot0.holderKeyCnt[slot4] = slot0.holderKeyCnt[slot4] - 1

	if slot0.holderKeyCnt[slot4] <= 0 then
		slot0.pos[slot4] = nil
		slot0.kPos[slot4] = nil
	end

	removeCSprite(slot0.lines[slot2].line)

	slot0.lines[slot2] = nil

	slot0:refreshByObj(slot0:tryGetCaster(slot3))
end

function slot0.onShowLinkEffect(slot0, slot1)
	if slot1 == slot0.isShow then
		return
	end

	slot0.isShow = slot1

	for slot5, slot6 in pairs(slot0.lines) do
		slot6.line:setVisible(slot0:getLineVisible(slot6))
	end
end

function slot0.onLinkEffectForceVisible(slot0, slot1, slot2)
	if slot1 == slot0.forceShow[slot2] then
		return
	end

	slot0.forceShow[slot2] = slot1

	for slot6, slot7 in pairs(slot0.lines) do
		slot7.line:setVisible(slot0:getLineVisible(slot7))
	end
end

function slot0.onDoShiftPos(slot0, slot1)
	slot0:savePosition(slot0:call("getSceneObj", slot1), slot1)
	slot0:refreshByObj(slot1)
end

function slot0.onUpdateLinkEffect(slot0, slot1, slot2)
	slot3 = slot0:call("getSceneObj", slot2)

	if slot1 then
		if slot3 then
			slot4 = cc.Node:new()

			slot3:addChild(slot4, 1, "linkShadow")

			slot0.updateObjNode = slot4
			slot0.updateObjKey = slot2

			slot0.updateObjNode:scheduleUpdate(function ()
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
			slot0.updateObjNode:registerScriptHandler(function (slot0)
				if slot0 == "cleanup" then
					uv1 = "cleanup"
					uv2 = "updateObjNode"

					if slot1.updateObjNode == slot2 then
						uv1 = "cleanup"
						slot1.updateObjNode = nil
					end
				end
			end)
		end
	elseif slot2 == slot0.updateObjKey then
		if slot0.updateObjNode then
			slot0.updateObjNode:unscheduleUpdate()
			slot0.updateObjNode:removeFromParent()
		end

		slot0.updateObjKey = nil
		slot0.updateObjNode = nil
		slot0.lastx = 0
		slot0.lasty = 0

		if slot3 then
			slot0:savePosition(slot3, slot2)
		end

		slot0:refreshByObj(slot2)
	end
end

function slot0.tryGetCaster(slot0, slot1)
	if slot0.caster2Keys[slot1] and slot0.caster2Keys[slot1][1] and slot0.lines[slot2] then
		return slot0.lines[slot2].holderKey
	end
end

function slot0.savePosition(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	if slot0.updateObjKey == slot2 then
		slot0.pos[slot2] = {
			slot1:xy()
		}
	else
		slot0.pos[slot2] = {
			slot1:getSelfPos()
		}
	end
end

return slot0
