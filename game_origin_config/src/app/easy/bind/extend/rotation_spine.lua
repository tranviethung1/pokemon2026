slot0 = require("easy.bind.helper")
slot1 = class("rotationSpine", cc.load("mvc").ViewBase)
slot1.defaultProps = {
	maxScale = 3,
	a = 500,
	isClockWise = false,
	minScale = 2,
	b = 300
}

function slot1.rotation(slot0, slot1, slot2, slot3)
	audio.playEffectWithWeekBGM("slip.mp3")

	slot5 = slot0.spriteArr[slot1 and 1 or 3]
	slot2 = slot2 and #slot2 == 3 and slot2 or slot0.pos
	slot3 = slot3 and #slot3 == 3 and slot3 or slot0.scales

	for slot12 = slot1 and 3 or 1, slot1 and 1 or 3, slot1 and -1 or 1 do
		slot0.spriteArr[slot12]:z(slot1 and 10 + slot12 or 10 - slot12)

		slot13 = slot12 == slot4 and math.abs(2 * slot0.a - math.abs(slot2[slot12].x - slot0.pos[slot12].x)) / 2 or math.abs(slot0.a - math.abs(slot2[slot12].x - slot0.pos[slot12].x))
		slot14 = math.ceil(slot13 / slot0.a * 30)

		if slot13 ~= 0 then
			slot0.spriteArr[slot12]:stopAllActions()

			for slot19 = 1, slot14 do
				slot20 = nil
				slot20 = slot1 and (slot12 == 1 and slot2[slot12].x + slot19 * 2 * slot13 / slot14 or slot2[slot12].x - slot19 * slot13 / slot14) or slot12 == 3 and slot2[slot12].x - slot19 * 2 * slot13 / slot14 or slot2[slot12].x + slot19 * slot13 / slot14
				slot21, slot22 = slot0:getY(slot20, slot12, slot1)

				transition.executeSequence(slot0.spriteArr[slot12]):spawnBegin():scaleTo(0.02, slot22):moveTo(0.02, slot20, slot21):spawnEnd()
			end

			if slot12 == 2 then
				slot15:func(function ()
					uv0 = "spriteArr"
					uv1 = "get"
					slot0 = slot0.spriteArr[slot1]:get("effect")

					slot0:play("standby2")
					slot0:addPlay("standby_loop")
				end)
			end

			slot15:done()
		else
			slot0.spriteArr[slot12]:xy(slot2[slot12]):scale(slot3[slot12])
		end
	end

	for slot12 = slot1 and 1 or 3, slot1 and 3 or 1, slot1 and 1 or -1 do
		slot0.spriteArr[slot12] = slot12 == (slot1 and 3 or 1) and slot5 or slot0.spriteArr[slot1 and slot12 + 1 or slot12 - 1]
	end

	if slot0.textNode then
		slot10 = csv.cards[slot0.spriteArr[2]:getTag()]

		slot0.textNode:text(slot10.name)

		if slot0.icon then
			slot0.icon:texture(ui.ATTR_ICON[csv.unit[slot10.unitID].natureType])
		end
	end
end

function slot1.getY(slot0, slot1, slot2, slot3)
	slot7, slot8 = nil

	if slot3 then
		if slot2 == 1 then
			slot7 = math.sqrt((1 - (slot1 - slot0.a) * (slot1 - slot0.a) / (slot0.a * slot0.a)) * slot0.b * slot0.b) + slot0.b
			slot8 = slot0.minScale
		else
			slot8 = math.abs(slot0.b - (-math.sqrt((1 - slot6 / slot4) * slot5) + slot0.b)) / slot0.b * math.abs(slot0.maxScale - slot0.minScale) + slot0.minScale
		end
	elseif slot2 == 3 then
		slot7 = math.sqrt((1 - slot6 / slot4) * slot5) + slot0.b
		slot8 = slot0.minScale
	else
		slot8 = math.abs(slot0.b - (-math.sqrt((1 - slot6 / slot4) * slot5) + slot0.b)) / slot0.b * math.abs(slot0.maxScale - slot0.minScale) + slot0.minScale
	end

	return slot7, slot8
end

function slot1.touchEventListener(slot0, slot1, slot2, slot3)
	slot4 = 0
	slot5 = 5

	function slot6()
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

	slot7 = {}
	slot8 = {}
	slot9 = 0
	slot10 = 0

	slot1:addTouchEventListener(function ()
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

function slot1.initExtend(slot0)
	slot2 = ccui.Layout:create():size(cc.size(2 * slot0.a, 5 * slot0.b)):addTo(slot0, 10):alignCenter(slot0:size()):setTouchEnabled(true)
	slot0.spriteArr = {}
	slot0.pos = {
		cc.p(0, slot0.b),
		cc.p(slot0.a, 0),
		cc.p(2 * slot0.a, slot0.b)
	}
	slot0.scales = {
		slot0.minScale,
		slot0.maxScale,
		slot0.minScale
	}
	slot8 = 5
	slot9 = 5

	slot0:enableSchedule():schedule(function (slot0)
		uv1 = "rotation"
		uv3 = "rotation"

		slot1:rotation(slot3.isClockWise)
	end, slot8, slot9, 1)

	for slot8, slot9 in ipairs(slot0.data) do
		slot12 = ccui.Layout:create():setTag(slot9):addTo(slot2, 10):anchorPoint(cc.p(0.5, 0.1)):xy(slot0.pos[slot8]):setTouchEnabled(true):scale(slot0.scales[slot8])
		slot13 = widget.addAnimationByKey(slot12, slot0.unitRes and slot0.unitRes[slot8] or csv.unit[csv.cards[slot9].unitID].unitRes, "effect", "standby_loop")
		slot14 = slot13:getBoundingBox()

		slot12:size(slot14)
		slot13:xy(slot14.width / 2, 60)

		if slot8 == 2 then
			slot13:play("standby2")
			slot13:addPlay("standby_loop")
		end

		slot0:touchEventListener(slot12, slot3, slot8)
		table.insert(slot0.spriteArr, slot12)
	end

	slot0:touchEventListener(slot2, slot3)

	if slot0.onNode then
		slot0:onNode(slot2)
	end

	return slot0
end

return slot1
