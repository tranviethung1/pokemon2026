slot0 = isRef
slot2 = class("CMap", require("luastl.stlbase"))
globals.CMap = slot2

function slot2.ctor(slot0, slot1, slot2)
	uv3 = "ctor"

	slot3.ctor(slot0)
	slot0:clear(slot1, slot2)
end

function slot2.clear(slot0, slot1, slot2)
	if slot0.m then
		for slot6, slot7 in pairs(slot0.m) do
			uv8 = "m"

			if slot8(slot7) then
				slot7:autorelease()
			end
		end
	end

	slot0.m = slot2 and setmetatable({}, {
		__mode = slot2
	}) or {}
	slot0.msize = slot2 and -1 or 0
	slot0.order = nil
	slot0.ordercmp = slot1
end

function slot2.size(slot0)
	if slot0.msize < 0 then
		for slot5, slot6 in pairs(slot0.m) do
			slot1 = 0 + 1
		end

		return slot1
	end

	return slot0.msize
end

function slot2.empty(slot0)
	return slot0:size() == 0
end

function slot2.insert(slot0, slot1, slot2)
	uv3 = "retain"

	if slot3(slot2) then
		slot2:retain()
	end

	if slot0.m[slot1] ~= nil then
		uv4 = "retain"

		if slot4(slot3) then
			slot3:autorelease()
		end
	end

	if slot0.msize >= 0 and slot3 == nil then
		slot0.msize = slot0.msize + 1
	end

	slot0.m[slot1] = slot2
	slot0.order = nil
end

function slot2.assign(slot0, slot1)
	slot0:clear()

	if type(slot1) ~= "table" then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		uv7 = "clear"

		if slot7(slot6) then
			slot6:retain()
		end

		slot0.m[slot5] = slot6
		slot0.msize = slot0.msize + 1
	end
end

function slot2.erase(slot0, slot1)
	if slot0.m[slot1] ~= nil then
		uv3 = "m"

		if slot3(slot0.m[slot1]) then
			slot2:autorelease()
		end

		slot0.m[slot1] = nil

		if slot0.msize >= 0 then
			slot0.msize = slot0.msize - 1
		end

		slot0.order = nil

		return slot2
	end

	return nil
end

slot2.pop = slot2.erase

function slot2.count(slot0, slot1)
	if slot0.m[slot1] ~= nil then
		return 1
	end

	return 0
end

function slot2.find(slot0, slot1, slot2)
	if slot0.m[slot1] ~= nil then
		return slot0.m[slot1]
	end

	return slot2
end

function slot2.data(slot0)
	return slot0.m
end

function slot2.pairs(slot0)
	return pairs(slot0.m)
end

function slot2.equal(slot0, slot1)
	if slot0.msize ~= slot1.msize then
		return false
	end

	for slot5, slot6 in pairs(slot0.m) do
		if slot6 ~= slot1:find(slot5) then
			return false
		end
	end

	return true
end

function slot2.order_pairs(slot0, slot1)
	slot3 = slot0.m

	if slot0.order == nil or slot1 then
		for slot7, slot8 in pairs(slot0.m) do
			table.insert({}, slot7)
		end

		if type(slot1 or slot0.ordercmp) == "string" then
			slot5 = slot4

			function slot4()
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

		if slot4 then
			slot5 = slot4

			function slot4()
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

		table.sort(slot2, slot4)

		if slot1 == nil then
			slot0.order = slot2
		end
	end

	slot4 = 0
	slot5, slot6 = nil
	slot7 = table.length(slot2)

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

return slot2
