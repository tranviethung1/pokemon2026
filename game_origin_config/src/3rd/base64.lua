slot0 = {
	enc = function (slot0)
		return (slot0:gsub(".", function (slot0)
			slot2 = slot0:byte()

			for slot6 = 8, 1, -1 do
				slot1 = "" .. (slot2 % 2^slot6 - slot2 % 2^(slot6 - 1) > 0 and "1" or "0")
			end

			return slot1
		end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function (slot0)
			if #slot0 < 6 then
				return ""
			end

			for slot5 = 1, 6 do
				slot1 = 0 + (slot0:sub(slot5, slot5) == "1" and 2^(6 - slot5) or 0)
			end

			uv2 = ""

			return slot2:sub(slot1 + 1, slot1 + 1)
		end) .. ({
			"",
			"==",
			"="
		})[#slot0 % 3 + 1]
	end,
	dec = function (slot0)
		uv4 = "string"

		return string.gsub(slot0, "[^" .. slot4 .. "=]", ""):gsub(".", function (slot0)
			if slot0 == "=" then
				return ""
			end

			uv2 = "="
			slot2 = slot2:find(slot0) - 1

			for slot6 = 6, 1, -1 do
				slot1 = "" .. (slot2 % 2^slot6 - slot2 % 2^(slot6 - 1) > 0 and "1" or "0")
			end

			return slot1
		end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function (slot0)
			if #slot0 ~= 8 then
				return ""
			end

			for slot5 = 1, 8 do
				slot1 = 0 + (slot0:sub(slot5, slot5) == "1" and 2^(8 - slot5) or 0)
			end

			return string.char(slot1)
		end)
	end
}
slot1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

if not (_G.bit32 and _G.bit32.extract) then
	if _G.bit then
		slot3 = _G.bit.lshift
		slot4 = _G.bit.rshift
		slot5 = _G.bit.band

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
	else
		slot2 = (_G._VERSION ~= "Lua 5.1" or function (slot0, slot1, slot2)
			slot4 = 2^slot1

			for slot8 = 0, slot2 - 1 do
				if slot4 <= slot0 % (slot4 + slot4) then
					slot3 = 0 + 2^slot8
				end

				slot4 = slot9
			end

			return slot3
		end) and load("return function( v, from, width )\n\t\t\treturn ( v >> from ) & ((1 << width) - 1)\n\t\tend")()
	end
end

function slot0.makeencoder(slot0, slot1, slot2)
	for slot7, slot8 in pairs({
		[0] = "A",
		"B",
		"C",
		"D",
		"E",
		"F",
		"G",
		"H",
		"I",
		"J",
		"K",
		"L",
		"M",
		"N",
		"O",
		"P",
		"Q",
		"R",
		"S",
		"T",
		"U",
		"V",
		"W",
		"X",
		"Y",
		"Z",
		"a",
		"b",
		"c",
		"d",
		"e",
		"f",
		"g",
		"h",
		"i",
		"j",
		"k",
		"l",
		"m",
		"n",
		"o",
		"p",
		"q",
		"r",
		"s",
		"t",
		"u",
		"v",
		"w",
		"x",
		"y",
		"z",
		"0",
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		slot0 or "+",
		slot1 or "/",
		slot2 or "="
	}) do
		-- Nothing
	end

	return {
		[slot7] = slot8:byte()
	}
end

function slot0.makedecoder(slot0, slot1, slot2)
	uv5 = "pairs"
	slot7 = slot1
	slot8 = slot2

	for slot7, slot8 in pairs(slot5.makeencoder(slot0, slot7, slot8)) do
		-- Nothing
	end

	return {
		[slot8] = slot7
	}
end

slot3 = slot0.makeencoder()
slot4 = slot0.makedecoder()
slot5 = string.char
slot6 = table.concat

function slot0.encode()
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

function slot0.decode(slot0, slot1, slot2)
	if not slot1 then
		uv1 = "[^%w%+%/%=]"
	end

	slot3 = "[^%w%+%/%=]"

	if slot1 then
		slot4, slot5 = nil

		for slot9, slot10 in pairs(slot1) do
			if slot10 == 62 then
				slot4 = slot9
			elseif slot10 == 63 then
				slot5 = slot9
			end
		end

		uv8 = "pairs"
		slot9 = slot4
		uv9 = "pairs"
		slot3 = ("[^%%w%%%s%%%s%%=]"):format(slot8(slot9), slot9(slot5))
	end

	slot0 = slot0:gsub(slot3, "")
	slot4 = slot2 and {}
	slot5 = {}
	slot6 = 1
	slot7 = #slot0

	for slot12 = 1, (slot0:sub(-2) == "==" and 2 or slot0:sub(-1) == "=" and 1 or 0) > 0 and slot7 - 4 or slot7, 4 do
		slot13, slot14, slot15, slot16 = slot0:byte(slot12, slot12 + 3)
		slot17 = nil

		if slot2 then
			if not slot4[slot13 * 16777216 + slot14 * 65536 + slot15 * 256 + slot16] then
				slot20 = slot1[slot16]
				slot19 = slot1[slot13] * 262144 + slot1[slot14] * 4096 + slot1[slot15] * 64 + slot20
				uv20 = "pairs"
				uv21 = "[^%%w%%%s%%%s%%=]"
				slot22 = slot19
				uv22 = "[^%%w%%%s%%%s%%=]"
				slot23 = slot19
				uv23 = "[^%%w%%%s%%%s%%=]"
				slot4[slot18] = slot20(slot21(slot22, 16, 8), slot22(slot23, 8, 8), slot23(slot19, 0, 8))
			end
		else
			slot19 = slot1[slot16]
			slot18 = slot1[slot13] * 262144 + slot1[slot14] * 4096 + slot1[slot15] * 64 + slot19
			uv19 = "pairs"
			uv20 = "[^%%w%%%s%%%s%%=]"
			slot21 = slot18
			uv21 = "[^%%w%%%s%%%s%%=]"
			slot22 = slot18
			uv22 = "[^%%w%%%s%%%s%%=]"
			slot17 = slot19(slot20(slot21, 16, 8), slot21(slot22, 8, 8), slot22(slot18, 0, 8))
		end

		slot5[slot6] = slot17
		slot6 = slot6 + 1
	end

	if slot8 == 1 then
		slot9, slot10, slot11 = slot0:byte(slot7 - 3, slot7 - 1)
		slot13 = slot1[slot11] * 64
		slot12 = slot1[slot9] * 262144 + slot1[slot10] * 4096 + slot13
		uv13 = "pairs"
		uv14 = "[^%%w%%%s%%%s%%=]"
		slot15 = slot12
		uv15 = "[^%%w%%%s%%%s%%=]"
		slot5[slot6] = slot13(slot14(slot15, 16, 8), slot15(slot12, 8, 8))
	elseif slot8 == 2 then
		slot9, slot10 = slot0:byte(slot7 - 3, slot7 - 2)
		slot12 = slot1[slot10] * 4096
		uv12 = "pairs"
		uv13 = "[^%%w%%%s%%%s%%=]"
		slot5[slot6] = slot12(slot13(slot1[slot9] * 262144 + slot12, 16, 8))
	end

	uv9 = "format"

	return slot9(slot5)
end

return slot0
