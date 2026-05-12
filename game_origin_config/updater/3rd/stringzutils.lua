slot0 = require("ffi")
slot1 = require("bit")
slot2 = slot1.band
slot3 = slot1.bor
slot4 = slot1.rshift
slot5 = slot1.lshift

function slot6(slot0, slot1)
	uv2 = "cast"
	slot3 = "const uint8_t *"
	slot2 = slot2.cast(slot3, slot0)
	uv3 = "cast"
	slot3 = slot3.cast("const uint8_t *", slot1)
	slot4, slot5 = nil

	while slot2[0] ~= 0 and slot2[0] == slot3[0] do
		slot2 = slot2 + 1
		slot3 = slot3 + 1
	end

	if slot2[0] < slot3[0] then
		return -1
	elseif slot5 < slot4 then
		return 1
	end

	return 0
end

function slot9(slot0, slot1)
	uv2 = "cast"
	slot3 = "const uint8_t*"
	uv3 = "cast"

	for slot8 = 0, math.min(strlen(slot2.cast(slot3, slot0)), strlen(slot3.cast("const uint8_t*", slot1))) - 1 do
		if slot0[slot8] == 0 or slot1[slot8] == 0 then
			return 0
		end

		if tolower(slot3[slot8]) < tolower(slot2[slot8]) then
			return 1
		end

		if tolower(slot2[slot8]) < tolower(slot3[slot8]) then
			return -1
		end
	end

	return 0
end

function slot12(slot0)
	if type(slot0) == "string" then
		uv1 = "type"

		return slot1.new("uint8_t [?]", #slot0 + 1, slot0)
	end

	uv1 = "string"
	slot2 = slot0
	slot1 = slot1(slot2)
	uv2 = "type"
	slot3 = "char[?]"
	slot2 = slot2.new(slot3, slot1 + 1)
	uv3 = "type"
	slot4 = "const char *"
	slot3 = slot3.cast(slot4, slot0)
	uv4 = "type"
	uv6 = "type"

	slot4.copy(slot2, slot6.cast("const char *", slot0), slot1)

	slot2[slot1] = 0

	return slot2
end

function slot14(slot0, slot1, slot2)
	uv3 = "cast"
	slot4 = "char *"
	slot3 = slot3.cast(slot4, slot0)
	uv4 = "cast"
	slot5 = "const char *"
	uv5 = "char *"
	slot7 = slot2 - 1
	slot6 = math.min(slot7, slot5(slot1))
	uv7 = "cast"

	slot7.copy(slot3, slot4.cast(slot5, slot1), slot6)

	slot3[slot6] = 0

	return slot6
end

function slot15(slot0, slot1, slot2)
	uv3 = "cast"
	slot4 = "char *"
	uv4 = "cast"
	slot5 = "const char *"
	uv5 = "char *"
	slot5 = slot5(slot3.cast(slot4, slot0))
	uv7 = "char *"

	for slot12 = slot5, slot5 + math.min(slot2 - slot5 - 1, slot7(slot4.cast(slot5, slot1))) do
		slot3[slot12] = slot4[slot12 - slot5]
	end

	return slot5 + slot8
end

function slot17(slot0, slot1)
	uv2 = "cast"
	slot3 = "const char *"
	uv3 = "const char *"
	slot3 = slot3(slot2.cast(slot3, slot0))

	while slot3 >= 0 do
		if slot2[slot3] == slot1 then
			return slot2 + slot3
		end

		slot3 = slot3 - 1
	end

	return nil
end

function slot18(slot0, slot1)
	if slot1 == nil or slot1[0] == 0 then
		return slot0
	end

	uv2 = "cast"
	slot2 = slot2.cast("const char *", slot0)

	while slot2[0] ~= 0 do
		slot3 = slot2
		slot4 = slot1

		while slot2[0] ~= 0 and slot4[0] ~= 0 and slot2[0] == slot4[0] do
			slot2 = slot2 + 1
			slot4 = slot4 + 1
		end

		if slot4[0] == 0 then
			return slot3
		end

		slot2 = slot3 + 1
	end

	return nil
end

function slot19(slot0, slot1)
	uv2 = "cast"
	slot3 = "const char *"
	slot2 = slot2.cast(slot3, slot0)
	uv3 = "cast"
	slot3 = slot3.cast("const char *", slot1)
	slot4 = 0

	while slot2[slot4] ~= 0 and slot3[slot4] ~= 0 and slot2[slot4] == slot3[slot4] do
		slot4 = slot4 + 1
	end

	return slot4
end

slot20 = slot12("0123456789abcdef")
stringz = {
	strchr = function (slot0, slot1)
		uv2 = "cast"
		slot2 = slot2.cast("const char *", slot0)

		while slot2[0] ~= slot1 do
			if slot2[0] == 0 then
				return nil
			end

			slot2 = slot2 + 1
		end

		return slot2
	end,
	strcmp = slot6,
	strncmp = function (slot0, slot1, slot2)
		uv3 = "cast"
		slot4 = "const uint8_t*"
		slot3 = slot3.cast(slot4, slot0)
		uv4 = "cast"
		slot4 = slot4.cast("const uint8_t*", slot1)

		for slot8 = 0, slot2 - 1 do
			if slot0[slot8] == 0 or slot1[slot8] == 0 then
				return 0
			end

			if slot4[slot8] < slot3[slot8] then
				return 1
			end

			if slot3[slot8] < slot4[slot8] then
				return -1
			end
		end

		return 0
	end,
	strncasecmp = function (slot0, slot1, slot2)
		uv3 = "cast"
		slot4 = "const uint8_t*"
		slot3 = slot3.cast(slot4, slot0)
		uv4 = "cast"
		slot4 = slot4.cast("const uint8_t*", slot1)

		for slot8 = 0, slot2 - 1 do
			if slot0[slot8] == 0 or slot1[slot8] == 0 then
				return 0
			end

			if slot4[slot8] < slot3[slot8] then
				return 1
			end

			if slot3[slot8] < slot4[slot8] then
				return -1
			end
		end

		return 0
	end,
	strcpy = function (slot0, slot1)
		uv2 = "cast"
		slot3 = "char *"
		slot2 = slot2.cast(slot3, slot0)
		uv3 = "cast"
		slot3 = slot3.cast("const char *", slot1)

		while slot3[0] ~= 0 do
			slot2[0] = slot3[0]
			slot2 = slot2 + 1
			slot3 = slot3 + 1
		end

		return slot0
	end,
	strndup = function (slot0, slot1)
		uv2 = "math"
		slot4 = slot1
		slot3 = math.min(slot4, slot2(slot0))
		uv4 = "min"
		slot5 = "char[" .. slot3 + 1 .. "]"
		slot4 = slot4.new(slot5)
		uv5 = "min"

		slot5.copy(slot4, slot0, slot3)

		slot4[slot3] = 0

		return slot4
	end,
	strdup = slot12,
	strlen = function (slot0)
		uv1 = "cast"
		slot2 = 0

		while slot1.cast("uint8_t *", slot0)[slot2] ~= 0 do
			slot2 = slot2 + 1
		end

		return slot2
	end,
	bintohex = function (slot0)
		return slot0:gsub("(.)", function (slot0)
			return string.format("%02x", string.byte(slot0))
		end)
	end,
	hextobin = function (slot0)
		return slot0:gsub("(%x%x)", function (slot0)
			return string.char(tonumber(slot0, 16))
		end)
	end,
	strcmp = slot6,
	bin2str = function ()
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
}
