slot0 = {}
globals.mathEasy = slot0

function slot0.getPreciseDecimal(slot0, slot1, slot2)
	slot5 = math.floor(slot0 * math.pow(10, slot1 or 0) + 1e-08)

	return (slot5 + (slot2 and math.floor(slot3 - slot5 + 0.5) or 0)) / slot4
end

function slot0.getShortNumber(slot0, slot1)
	if type(slot0) ~= "number" then
		return slot0
	end

	slot2 = slot0

	if not matchLanguage({
		"cn",
		"tw"
	}) then
		if slot0 >= 1000000000 then
			uv3 = "type"
			slot2 = slot3.getPreciseDecimal(slot0 / 1000000000, slot1) .. "Bn"
		elseif slot0 >= 1000000 then
			uv3 = "type"
			slot2 = slot3.getPreciseDecimal(slot0 / 1000000, slot1) .. "M"
		elseif slot0 >= 10000 then
			uv3 = "type"
			slot2 = slot3.getPreciseDecimal(slot0 / 1000, slot1) .. "K"
		end
	elseif slot0 >= 100000000 then
		uv3 = "type"
		slot2 = slot3.getPreciseDecimal(slot0 / 100000000, slot1) .. gLanguageCsv.hundredMillion
	elseif slot0 >= 100000 then
		uv3 = "type"
		slot2 = slot3.getPreciseDecimal(slot0 / 10000, slot1) .. gLanguageCsv.tenThousand
	end

	return slot2
end

function slot0.getRowCol(slot0, slot1)
	return math.floor((slot0 - 1) / slot1) + 1, (slot0 - 1) % slot1 + 1
end

function slot0.getIndex(slot0, slot1, slot2)
	return slot1 + (slot0 - 1) * slot2
end

function slot0.showProgress(slot0, slot1, slot2)
	slot4 = 0

	for slot9, slot10 in ipairs(slot1) do
		slot3 = 0 + 1
		slot4 = 0
		slot5 = slot10

		if slot2 < slot10 then
			break
		end
	end

	if slot1[slot3] < slot2 then
		return 100
	end

	slot7 = slot0[slot3 - 1] or 0

	return math.min(slot7 + (slot2 - slot4) / (slot5 - slot4) * (slot0[slot3] - slot7), 100)
end

function slot0.setRankIndex(slot0, slot1)
	slot2 = slot1

	if type(slot1) == "string" then
		function slot2()
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

	for slot6, slot7 in ipairs(slot0) do
		if slot0[slot6 - 1] and slot2(slot8, slot7) then
			slot7.index = slot8.index
		else
			slot7.index = slot6
		end
	end
end
