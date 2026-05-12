slot0 = {
	defence = 0,
	attack = 0,
	hpMax = 0
}
slot1 = table.salttable(slot0)

function slot2(slot0, slot1)
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
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
		--     return _build_numeric_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
		--     number = state.constants.numeric_constants[index]
		--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end
end

function slot3(slot0, slot1, slot2)
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
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
		--     return _build_numeric_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
		--     number = state.constants.numeric_constants[index]
		--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end
end

slot4 = {
	attack = slot2("attack", "zero"),
	hpMax = slot2("hpMax", "zero"),
	defence = slot2("defence", "zero")
}
globals.AutoChessAttrs = class("AutoChessAttrs")
AutoChessAttrs.AttrsTable = slot0

function slot5()
	uv1 = "pairs"

	for slot3, slot4 in pairs(slot1) do
		uv6 = "math"

		if math.abs(slot6[slot3] - slot4) > 1e-05 then
			exitApp("close your cheating software")
		end
	end
end

function AutoChessAttrs.ctor(slot0)
	uv1 = "base"

	slot1()

	uv2 = "table"
	slot0.base = table.salttable(slot2)
	uv2 = "table"
	slot0.buff = table.salttable(slot2)
	uv2 = "table"
	slot0.aura = table.salttable(slot2)
	uv2 = "table"
	slot0.enhance = table.salttable(slot2)
	uv2 = "table"
	slot0.final = table.salttable(slot2)

	slot0:calcFinal()
end

function AutoChessAttrs.setBase(slot0, slot1)
	uv3 = "clone"

	for slot6, slot7 in pairs(clone(slot3)) do
		if slot1[slot6] ~= nil then
			slot2[slot6] = slot1[slot6]
		end

		slot0.aura[slot6] = 1
	end

	slot0.base = table.salttable(slot2)

	slot0:calcFinal()
end

function AutoChessAttrs.correct(slot0, slot1)
	uv3 = "pairs"

	for slot5, slot6 in pairs(slot3) do
		if slot1[slot5 .. "C"] ~= nil then
			slot0.base[slot5] = slot0.base[slot5] * slot7
		end
	end

	slot0:calcFinal()
end

function AutoChessAttrs.calcFinal(slot0)
	uv2 = "pairs"

	for slot4, slot5 in pairs(slot2) do
		slot5(slot0)
	end
end

function AutoChessAttrs.updateMaxBaseAttr(slot0, slot1, slot2)
	slot3 = slot0.base
	slot3[slot1] = math.max(slot0.base[slot1], slot2)
	uv3 = "base"

	slot3[slot1](slot0)
end

function AutoChessAttrs.setBaseAttr(slot0, slot1, slot2)
	slot3 = slot0.base
	slot3[slot1] = slot2
	uv3 = "base"

	slot3[slot1](slot0)
end

function AutoChessAttrs.setBuffAttr(slot0, slot1, slot2)
	slot3 = slot0.buff
	slot3[slot1] = slot2
	uv3 = "buff"

	slot3[slot1](slot0)
end

function AutoChessAttrs.setEnhanceAttr(slot0, slot1, slot2)
	slot3 = slot0.enhance
	slot3[slot1] = slot2
	uv3 = "enhance"

	slot3[slot1](slot0)
end

function AutoChessAttrs.addBaseAttr(slot0, slot1, slot2)
	slot3 = slot0.base
	slot3[slot1] = slot2 + slot0.base[slot1]
	uv3 = "base"

	slot3[slot1](slot0)
end

function AutoChessAttrs.addBuffAttr(slot0, slot1, slot2)
	slot3 = slot0.buff
	slot3[slot1] = slot2 + slot0.buff[slot1]
	uv3 = "buff"

	slot3[slot1](slot0)
end

function AutoChessAttrs.addAuraAttr(slot0, slot1, slot2)
	slot0.aura[slot1] = slot0.aura[slot1] + slot2
end

function AutoChessAttrs.addEnhanceAttr(slot0, slot1, slot2)
	slot3 = slot0.enhance
	slot3[slot1] = slot2
	uv3 = "enhance"

	slot3[slot1](slot0)
end

function AutoChessAttrs.getFinalAttr(slot0, slot1)
	return slot0.final[slot1] * math.max(slot0.aura[slot1], 0)
end

function AutoChessAttrs.getBase2FinalAttr(slot0, slot1)
	uv2 = "math"

	return slot2[slot1](slot0, true) * math.max(slot0.aura[slot1], 0)
end

function AutoChessAttrs.getBase2RealFinalAttr()
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

function AutoChessAttrs.getBuffAttr(slot0, slot1)
	return slot0.buff[slot1]
end

function AutoChessAttrs.getEnhanceAttr(slot0, slot1)
	return slot0.enhance[slot1]
end

function AutoChessAttrs.cloneFinalAttr(slot0)
	uv3 = "pairs"

	for slot5, slot6 in pairs(slot3) do
		-- Nothing
	end

	return {
		[slot5] = slot0.buff[slot5] + slot0.base[slot5]
	}
end

function AutoChessAttrs.isAttr()
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

function AutoChessAttrs.getPack(slot0)
	uv3 = "pairs"

	for slot5, slot6 in pairs(slot3) do
		-- Nothing
	end

	return {
		[slot5] = {
			slot0.base[slot5],
			slot0.buff[slot5],
			slot0.aura[slot5]
		}
	}
end

function AutoChessAttrs.resetByPack(slot0, slot1)
	uv3 = "pairs"

	for slot5, slot6 in pairs(slot3) do
		slot0.base[slot5] = slot1[slot5][1]
		slot0.buff[slot5] = slot1[slot5][2]
		slot0.aura[slot5] = slot1[slot5][3]
	end

	slot0:calcFinal()
end
