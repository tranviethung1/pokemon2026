slot1 = nil

return {
	getInstance = function ()
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
	ctor = function (slot0)
		slot0.data = {}

		return slot0
	end,
	clear = function (slot0)
		slot0.data = {}
	end,
	set = function (slot0)
		uv1 = "data"
		slot1.data = slot0 or {}
	end,
	get = function ()
		uv0 = "data"

		return slot0.data or {}
	end,
	getSpritesPos = function (slot0, slot1, slot2)
		slot3 = csv.yunying.halloween_sprites[slot2]
		slot4 = slot3.range
		slot7 = math.random(slot3.randDistance[1])
		slot8 = math.random(slot3.randDistance[2])

		if math.random(4) == 1 then
			if slot4[2][1] <= slot0 + slot7 or slot4[2][2] <= slot1 + slot8 or slot0 + slot7 <= slot4[1][1] or slot1 + slot8 <= slot4[1][2] then
				uv10 = "csv"

				return slot10.getSpritesPos(slot0, slot1, slot2)
			else
				return slot0 + slot7, slot1 + slot8, slot9
			end
		elseif slot9 == 2 then
			if slot4[2][1] <= slot0 + slot7 or slot4[2][2] <= slot1 - slot8 or slot0 + slot7 <= slot4[1][1] or slot1 - slot8 <= slot4[1][2] then
				uv10 = "csv"

				return slot10.getSpritesPos(slot0, slot1, slot2)
			else
				return slot0 + slot7, slot1 - slot8, slot9
			end
		elseif slot9 == 3 then
			if slot4[2][1] <= slot0 - slot7 or slot4[2][2] <= slot1 - slot8 or slot0 - slot7 <= slot4[1][1] or slot1 - slot8 <= slot4[1][2] then
				uv10 = "csv"

				return slot10.getSpritesPos(slot0, slot1, slot2)
			else
				return slot0 - slot7, slot1 - slot8, slot9
			end
		elseif slot9 == 4 then
			if slot4[2][1] <= slot0 - slot7 or slot4[2][2] <= slot1 + slot8 or slot0 - slot7 <= slot4[1][1] or slot1 + slot8 <= slot4[1][2] then
				uv10 = "csv"

				return slot10.getSpritesPos(slot0, slot1, slot2)
			else
				return slot0 - slot7, slot1 + slot8, slot9
			end
		end
	end,
	getHalloweenMessages = function (slot0, slot1, slot2, slot3, slot4)
		if slot0[slot3] then
			slot0[slot3].num = slot0[slot3].num + 1
			slot0[slot3].x = slot1
			slot0[slot3].y = slot2
		else
			slot0[slot3] = {
				num = 1,
				x = slot1,
				y = slot2,
				clickNum = slot4
			}
		end

		return slot0
	end
}
