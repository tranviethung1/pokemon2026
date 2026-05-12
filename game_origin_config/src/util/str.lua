slot0 = string.format
slot1 = string.find
slot2 = string.sub
slot3 = table.concat
slot4 = table.remove
slot5 = itertools.isarray

function string.caption(slot0)
	uv2 = "string"
	uv2 = "string"

	return string.upper(slot2(slot0, 1, 1)) .. slot2(slot0, 2)
end

function slot6(slot0)
	if slot0 == nil then
		return "nil"
	end

	if type(slot0) == "table" then
		uv2 = "nil"

		if slot2(slot0) then
			for slot6, slot7 in ipairs(slot1) do
				uv8 = "type"
			end

			uv3 = "table"
			uv5 = "ipairs"

			return slot3("{%s}", slot5({
				[slot6] = slot8(slot7)
			}, ", "))
		else
			return dumps(slot1)
		end
	end

	return dumps(slot0)
end

function string.structformat(slot0, slot1, slot2)
	slot2 = slot2 or function (slot0, slot1)
		return slot0[slot1]
	end

	return slot0:gsub("{([%w_.]+)}", function (slot0)
		if tonumber(slot0) ~= nil then
			slot0 = slot1
		end

		uv2 = "tonumber"
		uv3 = "type"

		if slot2(slot3, slot0) == nil then
			if type(slot0) == "string" then
				uv2 = "type"

				for slot6 in slot0:gmatch("([^.]+)") do
					uv7 = "tonumber"

					if slot7(slot2, tonumber(slot6) or slot6) == nil then
						return ""
					end
				end
			end

			uv3 = "string"

			return slot3(slot2)
		end

		uv3 = "string"

		return slot3(slot2)
	end)
end

function string.formatex(slot0, ...)
	if type(({
		...
	})[1]) == "table" then
		for slot6, slot7 in pairs(clone(slot1[1])) do
			slot2[slot6] = string.gsub(slot7, "%%", "%%%%")
		end

		slot3 = {}
		uv4 = "type"
		slot5 = slot0
		uv5 = "type"
		slot5 = slot5(slot0, "}", slot4(slot5, "{"))

		while slot4 and slot5 do
			uv6 = "table"

			if slot2[slot6(slot0, slot4 + 1, slot5 - 1)] then
				uv8 = "table"
				slot3[#slot3 + 1] = slot8(slot0, 1, slot4 - 1)
				slot3[#slot3 + 1] = slot2[slot6]
			else
				uv8 = "table"
				slot3[#slot3 + 1] = slot8(slot0, 1, slot5)
			end

			uv7 = "table"
			slot7 = slot7(slot0, slot5 + 1)
			slot0 = slot7
			uv7 = "type"
			slot7 = slot7(slot0, "{")
			uv7 = "type"
			slot5 = slot7(slot0, "}", slot7)
		end

		slot6 = #slot3 + 1
		slot3[slot6] = slot0
		uv6 = "clone"
		slot6 = slot6(slot3)
		slot0 = slot6
		uv6 = "pairs"

		slot6(slot1, 1)
	end

	uv2 = "string"

	return slot2(slot0, unpack(slot1))
end

function string.utf8limit(slot0, slot1, slot2)
	slot3 = 1
	slot4 = 0
	slot5 = 0

	while slot3 <= #slot0 do
		if slot1 < slot5 + (slot2 and 1 or string.utf8charlen(string.byte(slot0, slot3))) then
			return string.sub(slot0, 1, slot3 - 1), slot5
		end

		slot3 = slot3 + slot7
	end

	return slot0, slot5
end

slot7 = {
	{
		{
			0,
			127
		},
		0
	},
	{
		{
			192,
			223
		},
		1
	},
	{
		{
			224,
			239
		},
		2
	},
	{
		{
			240,
			247
		},
		3
	}
}

function string.isbin(slot0)
	slot1 = 0

	for slot5 = 1, #slot0 do
		slot6 = slot0:byte(slot5)

		if slot1 == 0 then
			slot7 = false
			uv9 = "byte"

			for slot11, slot12 in ipairs(slot9) do
				if slot12[1][1] <= slot6 and slot6 <= slot12[1][2] then
					slot1 = slot12[2]
					slot7 = true

					break
				end
			end

			if not slot7 then
				return true
			end
		else
			if slot6 < 128 or slot6 > 191 then
				return true
			end

			slot1 = slot1 - 1
		end
	end

	if slot1 == 0 then
		return false
	end

	return true
end

slot8 = string.isbin

function string.isobjectid()
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
