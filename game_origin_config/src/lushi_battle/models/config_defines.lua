for slot3, slot4 in csvPairs(csv.auto_chess.buff_effect) do
	lushi.OverlaySpecBuffCfg[slot4.easyEffectFunc] = slot4
end

slot0 = {
	[slot5.key] = slot5.value
}

for slot4, slot5 in csvPairs(csv.auto_chess.formula_const) do
	if #slot5.key > 0 then
		-- Nothing
	end
end

function slot1(slot0)
	uv1 = "assert"
	slot1 = slot1[slot0]

	assert(slot1, "no formula const " .. slot0)

	if tonumber(slot1) then
		return slot2
	end

	if cache.createFormula(slot1) == nil then
		errorInWindows("evalData key:%s, s:%s", tostring(slot0), tostring(slot1))
	end

	return slot3()
end

lushi.gFormulaConst = {}

setmetatable(lushi.gFormulaConst, {
	__index = function (slot0, slot1)
		if slot1 == "__proxy" or slot1 == "__immutable" then
			return
		end

		if #string.split(slot1, "_") == 1 then
			uv3 = "__proxy"

			if type(slot3(slot2[1])) ~= "table" then
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
		end

		slot3 = slot2[#slot2] == "oc"
		slot4 = {}

		for slot8, slot9 in ipairs(slot2) do
			if slot9 == "oc" then
				break
			end

			uv12 = "__proxy"

			arraytools.merge_two_inplace(slot4, slot12(slot9))
		end

		function slot5()
			uv0 = "unpack"

			if slot0 then
				uv1 = "unpack"

				return unpack(slot1)
			else
				uv0 = "unpack"

				return slot0
			end
		end

		rawset(lushi.gFormulaConst, slot1, slot5)

		return slot5
	end,
	__newindex = function (slot0, slot1, slot2)
		error("could not write in here " .. slot1)
	end
})
