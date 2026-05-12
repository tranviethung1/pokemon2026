slot0 = {}
slot1 = AutoChessBattle.battleTarget

function slot1.InitFindBaseEnv()
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

slot1.InitFindBaseEnv()

function slot2(slot0, slot1)
	if slot0:sub(1, 1) == "|" then
		slot0 = slot0:sub(2)
	end

	slot3 = slot1 or ""

	for slot7, slot8 in ipairs(string.split(slot0, "|")) do
		slot9, slot10 = string.find(slot8, "%(.+%)")
		slot11, slot12 = string.find(slot8, "%(.*%)")
		slot13 = ""
		slot14 = -2

		if not slot11 then
			slot8 = slot8 .. "()"
		end

		slot3 = slot3 == "" and slot8 or string.format(slot8:sub(1, slot14) .. (slot9 and ",%s)" or "%s)"), slot8)
	end

	return slot3
end

function slot1.targetFinder(slot0, slot1, slot2, slot3)
	slot4 = slot2.input

	if slot2.process and slot2.process ~= "" then
		slot4 = string.format("%s|%s", slot2.input, slot2.process)
	end

	uv5 = "input"
	slot8 = slot3
	slot7 = slot5(slot4)
	uv8 = "process"
	uv7 = "process"

	slot7:resetEnv()

	return AutoChessCsv.doFormula(slot7, slot8:fillEnv(AutoChessCsv.makeFindEnv(slot0, slot1, slot8)))
end
