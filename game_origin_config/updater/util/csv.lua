slot0 = {}

function globals.getCsv(slot0)
	if slot0 == nil then
		return nil
	end

	uv1 = "loadstring"

	if slot1[slot0] then
		uv1 = "loadstring"

		return slot1[slot0]
	end

	uv1 = "loadstring"
	slot1[slot0] = loadstring("return " .. slot0)()
	uv1 = "loadstring"

	return slot1[slot0]
end

function globals.getMonsterCsv(slot0)
	if slot0 == nil then
		return nil
	end

	return loadstring("csv.Load" .. string.sub(string.gsub(slot0, "%.", function (slot0)
		return "_"
	end), 5) .. "() return " .. slot0)()
end

function globals.csvSize(slot0)
	if slot0.__size == nil then
		for slot5, slot6 in csvMapPairs(slot0) do
			slot1 = 0 + 1
		end

		return slot1
	end

	return slot0.__size
end

function globals.csvNext(slot0)
	slot1, slot2 = next(slot0)

	while slot1 and string.sub(slot1, 1, 2) == "__" do
		slot1, slot2 = next(slot0, slot1)
	end

	return slot1, slot2
end

function globals.csvPairs(slot0)
	return function (slot0, slot1)
		slot2, slot3 = next(slot0, slot1)

		while slot2 ~= nil and type(slot2) ~= "number" do
			slot2, slot3 = next(slot0, slot2)
		end

		return slot2, slot3
	end, slot0, nil
end

function globals.csvMapPairs(slot0)
	return function (slot0, slot1)
		slot2, slot3 = next(slot0, slot1)

		while slot2 and string.sub(slot2, 1, 2) == "__" do
			slot2, slot3 = next(slot0, slot2)
		end

		return slot2, slot3
	end, slot0, nil
end

function globals.orderCsvPairs(slot0)
	if slot0.__sorted == nil then
		slot1 = {}

		for slot5, slot6 in pairs(slot0) do
			if type(slot5) == "number" then
				table.insert(slot1, slot5)
			end
		end

		table.sort(slot1)

		slot0.__sorted = slot1
	end

	slot1 = nil

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
	end, slot0, nil
end

function globals.csvClone(slot0)
	if not slot0 then
		return nil
	end

	if type(slot0) ~= "table" then
		return slot0
	end

	return function (slot0)
		slot1 = {}
		slot2, slot3 = getmetatable(table.getraw(slot0))

		if slot2 and type(slot2.__index) == "table" then
			slot3 = slot2.__index
		end

		for slot7, slot8 in pairs(slot0) do
			if type(slot8) == "table" then
				uv9 = "getmetatable"
				slot1[slot7] = slot9(slot8)
			else
				slot1[slot7] = slot8
			end
		end

		if slot3 then
			uv4 = "getmetatable"

			for slot7, slot8 in pairs(slot4(slot3)) do
				if slot1[slot7] == nil then
					slot1[slot7] = slot8
				end
			end
		end

		slot1.__size = nil
		slot1.__default = nil
		slot1.__sorted = nil

		return slot1
	end(slot0)
end
