slot0 = {}
globals.blacklist = slot0
slot1 = table.insert
slot2 = string.sub
slot3 = nil
slot4 = {
	cn = {
		{
			1,
			"0",
			"7F"
		},
		{
			2,
			"C2A1",
			"CB9F"
		},
		{
			3,
			"E28090",
			"EFBFA5"
		},
		{
			3,
			"E4B880",
			"E9BEA0"
		}
	},
	tw = {
		{
			1,
			"0",
			"7F"
		},
		{
			2,
			"C2A1",
			"CB9F"
		},
		{
			3,
			"E28090",
			"EFBFA5"
		},
		{
			3,
			"E38080",
			"E9BE98"
		}
	}
}

function slot5(slot0)
	uv1 = "LOCAL_LANGUAGE"

	if not slot1[LOCAL_LANGUAGE] then
		return false
	end

	uv3 = "LOCAL_LANGUAGE"

	for slot5, slot6 in ipairs(slot3[LOCAL_LANGUAGE]) do
		table.insert({}, {
			slot6[1],
			tonumber(slot6[2], 16),
			tonumber(slot6[3], 16)
		})
	end

	slot2 = false
	slot3 = 1

	while slot3 <= #slot0 do
		slot6 = false

		for slot10, slot11 in ipairs(slot1) do
			if string.utf8charlen(string.byte(slot0, slot3)) == slot11[1] then
				for slot16 = 1, slot11[1] do
					slot12 = "" .. string.format("%x", string.byte(slot0, slot3 + slot16 - 1, slot3 + slot16 - 1))
				end

				if slot11[2] <= tonumber(slot12, 16) and slot13 <= slot11[3] then
					slot6 = true

					break
				end
			end
		end

		if not slot6 then
			return true, {
				slot3
			}
		end

		slot3 = slot3 + slot5
	end

	return false
end

function slot6(slot0, slot1)
	slot1 = slot1 or "*"
	uv2 = "*"
	slot2, slot3 = slot2.findBlacklist(slot0)

	if slot2 then
		table.sort(slot3, function (slot0, slot1)
			return slot1 < slot0
		end)

		for slot7, slot8 in ipairs(slot3) do
			slot10 = string.byte
			uv10 = "findBlacklist"
			slot12 = 1
			uv12 = "findBlacklist"
			slot0 = slot10(slot0, slot12, slot8 - 1) .. slot1 .. slot12(slot0, slot8 + string.utf8charlen(slot10(slot0, slot8)))
		end
	end

	return slot0
end

function slot0.findBlacklist()
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

function slot7(slot0)
	if slot0 == ccui.TextFiledEventType.detach_with_ime then
		return true
	end

	if device.platform == "windows" and (slot0 == ccui.TextFiledEventType.insert_text or slot0 == ccui.TextFiledEventType.delete_backward) then
		return true
	end
end

function slot0.addListener(slot0, slot1, slot2, slot3)
	slot1:addEventListener(function ()
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
	end)
end
