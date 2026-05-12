slot0 = math.min
slot1 = math.max
slot2 = {}
globals.arraytools = slot2

function slot2.merge(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0) do
		for slot10, slot11 in ipairs(slot6) do
			table.insert(slot1, slot11)
		end
	end

	return slot1
end

function slot2.merge_inplace(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		for slot10, slot11 in ipairs(slot6) do
			table.insert(slot0, slot11)
		end
	end

	return slot0
end

function slot2.merge_two_inplace(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		table.insert(slot0, slot6)
	end

	return slot0
end

function slot2.first(slot0, slot1)
	if slot1 == nil then
		return slot0[1]
	end

	uv2 = "table"
	slot2 = {}

	for slot6 = 1, slot2(table.length(slot0), slot1 or 1) do
		table.insert(slot2, slot0[slot6])
	end

	return slot2
end

function slot2.last(slot0, slot1)
	slot2 = table.length(slot0)

	if slot1 == nil then
		return slot0[slot2]
	end

	uv3 = "table"
	slot3 = {}

	for slot7 = 1 + slot2 - slot3(slot2, slot1 or 1), slot2 do
		table.insert(slot3, slot0[slot7])
	end

	return slot3
end

function slot2.slice(slot0, slot1, slot2)
	slot4 = {}
	uv5 = "table"
	slot5 = slot5(slot1, 1)
	slot1 = slot5
	uv5 = "length"

	for slot9 = slot1, slot5(slot1 + slot2 - 1, table.length(slot0)) do
		table.insert(slot4, slot0[slot9])
	end

	return slot4
end

function slot2.push(slot0, slot1)
	return table.insert(slot0, slot1)
end

function slot2.pop(slot0)
	return table.remove(slot0)
end

function slot2.push_front(slot0, slot1)
	return table.insert(slot0, 1, slot1)
end

function slot2.pop_front(slot0)
	return table.remove(slot0, 1)
end

function slot2.hash(slot0, slot1)
	for slot6, slot7 in ipairs(slot0) do
		-- Nothing
	end

	return {
		[slot7] = slot1 and slot6 or true
	}
end

function slot2.sort_ipairs(slot0, slot1)
	for slot6, slot7 in ipairs(slot0) do
		table.insert({}, slot7)
	end

	if type(slot1) == "string" then
		function slot3()
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

	table.sort(slot2, slot3)

	return ipairs(slot2)
end

slot3 = ipairs({})

function slot2.map(slot0, slot1)
	for slot6, slot7 in ipairs(slot0) do
		-- Nothing
	end

	return {
		[slot6] = slot1(slot6, slot7)
	}
end

function slot2.reduce(slot0, slot1, slot2)
	slot3 = slot2

	for slot7, slot8 in ipairs(slot0) do
		slot3 = (slot3 == nil or slot1(slot3, slot8)) and slot8
	end

	return slot3
end

function slot2.filter(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		if slot1(slot6, slot7) then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot2.each(slot0, slot1)
	for slot5, slot6 in ipairs(slot0) do
		slot1(slot5, slot6)
	end
end

function slot2.when(slot0, slot1)
	for slot5, slot6 in ipairs(slot0) do
		if slot1(slot5, slot6) then
			return slot5, slot6
		end
	end
end

function slot2.invoke(slot0, slot1)
	for slot5, slot6 in ipairs(slot0) do
		slot6[slot1](slot5, slot6)
	end
end

function slot2.values(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot2.ivalues(slot0)
	slot1 = 0
	slot2 = nil

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

function slot2.items(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0) do
		table.insert(slot1, {
			slot5,
			slot6
		})
	end

	return slot1
end

function slot2.iitems(slot0)
	slot1 = 0
	slot2 = nil

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

function slot2.filter_inplace(slot0, slot1)
	slot2 = 1
	slot3 = table.length(slot0)

	for slot7, slot8 in ipairs(slot0) do
		if slot1(slot7, slot8) then
			if slot7 ~= slot2 then
				slot0[slot2] = slot0[slot7]
			end

			slot2 = slot2 + 1
		end
	end

	for slot7 = slot2, slot3 do
		table.remove(slot0)
	end

	return slot0
end

slot2.join = table.concat

function slot2.compact(slot0)
	for slot4 = table.length(slot0), 1, -1 do
		if slot0[slot4] == nil then
			table.remove(slot0, slot4)
		end
	end

	return slot0
end

function slot2.clear(slot0)
	for slot5 = 1, table.length(slot0) do
		slot0[slot5] = nil
	end

	return slot0
end
