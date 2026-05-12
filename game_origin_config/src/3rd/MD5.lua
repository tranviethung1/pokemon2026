slot0 = require("ffi")
slot1 = require("bit")
slot2 = slot1.bxor
slot3 = slot1.bnot
slot4 = slot1.band
slot5 = slot1.bor
slot6 = slot1.rshift
slot7 = slot1.lshift

require("3rd.memutils")
slot0.cdef([[
typedef struct MD5Context {
  uint32_t buf[4];
  uint32_t bits[2];
  unsigned char input[64];
} MD5_CTX;
]])

MD5_CTX = slot0.typeof("MD5_CTX")

function byteReverse(slot0, slot1)
end

function F1()
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

function F2(slot0, slot1, slot2)
	return F1(slot2, slot0, slot1)
end

function F3()
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

function F4()
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

function MD5STEP()
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

function printmd5buf(slot0)
	for slot4 = 0, 3 do
		print(string.format("buf[%d]: 0x%x", slot4, slot0[slot4]))
	end
end

function printmd5ctx(slot0)
	for slot4 = 0, 3 do
		print(string.format("ctx.buf[%d]: 0x%x", slot4, slot0.buf[slot4]))
	end

	print(string.format("ctx.bits[0]: %d", slot0.bits[0]))
	print(string.format("ctx.bits[1]: %d", slot0.bits[1]))

	slot1 = 0

	for slot5 = 0, 3 do
		for slot10 = 0, 15 do
			slot6 = "" .. " " .. tostring(slot0.input[slot1])
			slot1 = slot1 + 1
		end

		print(slot6)
	end
end

function MD5Init(slot0)
	slot0.buf[0] = 1732584193
	slot0.buf[1] = 4023233417.0
	slot0.buf[2] = 2562383102.0
	slot0.buf[3] = 271733878
	slot0.bits[0] = 0
	slot0.bits[1] = 0
end

function MD5Transform(slot0, slot1)
	slot3 = slot0[1]
	slot4 = slot0[2]
	slot5 = slot0[3]
	slot2 = MD5STEP(F1, slot0[0], slot3, slot4, slot5, slot1[0] + 3614090360.0, 7)
	slot5 = MD5STEP(F1, slot5, slot2, slot3, slot4, slot1[1] + 3905402710.0, 12)
	slot4 = MD5STEP(F1, slot4, slot5, slot2, slot3, slot1[2] + 606105819, 17)
	slot3 = MD5STEP(F1, slot3, slot4, slot5, slot2, slot1[3] + 3250441966.0, 22)
	slot2 = MD5STEP(F1, slot2, slot3, slot4, slot5, slot1[4] + 4118548399.0, 7)
	slot5 = MD5STEP(F1, slot5, slot2, slot3, slot4, slot1[5] + 1200080426, 12)
	slot4 = MD5STEP(F1, slot4, slot5, slot2, slot3, slot1[6] + 2821735955.0, 17)
	slot3 = MD5STEP(F1, slot3, slot4, slot5, slot2, slot1[7] + 4249261313.0, 22)
	slot2 = MD5STEP(F1, slot2, slot3, slot4, slot5, slot1[8] + 1770035416, 7)
	slot5 = MD5STEP(F1, slot5, slot2, slot3, slot4, slot1[9] + 2336552879.0, 12)
	slot4 = MD5STEP(F1, slot4, slot5, slot2, slot3, slot1[10] + 4294925233.0, 17)
	slot3 = MD5STEP(F1, slot3, slot4, slot5, slot2, slot1[11] + 2304563134.0, 22)
	slot2 = MD5STEP(F1, slot2, slot3, slot4, slot5, slot1[12] + 1804603682, 7)
	slot5 = MD5STEP(F1, slot5, slot2, slot3, slot4, slot1[13] + 4254626195.0, 12)
	slot4 = MD5STEP(F1, slot4, slot5, slot2, slot3, slot1[14] + 2792965006.0, 17)
	slot3 = MD5STEP(F1, slot3, slot4, slot5, slot2, slot1[15] + 1236535329, 22)
	slot2 = MD5STEP(F2, slot2, slot3, slot4, slot5, slot1[1] + 4129170786.0, 5)
	slot5 = MD5STEP(F2, slot5, slot2, slot3, slot4, slot1[6] + 3225465664.0, 9)
	slot4 = MD5STEP(F2, slot4, slot5, slot2, slot3, slot1[11] + 643717713, 14)
	slot3 = MD5STEP(F2, slot3, slot4, slot5, slot2, slot1[0] + 3921069994.0, 20)
	slot2 = MD5STEP(F2, slot2, slot3, slot4, slot5, slot1[5] + 3593408605.0, 5)
	slot5 = MD5STEP(F2, slot5, slot2, slot3, slot4, slot1[10] + 38016083, 9)
	slot4 = MD5STEP(F2, slot4, slot5, slot2, slot3, slot1[15] + 3634488961.0, 14)
	slot3 = MD5STEP(F2, slot3, slot4, slot5, slot2, slot1[4] + 3889429448.0, 20)
	slot2 = MD5STEP(F2, slot2, slot3, slot4, slot5, slot1[9] + 568446438, 5)
	slot5 = MD5STEP(F2, slot5, slot2, slot3, slot4, slot1[14] + 3275163606.0, 9)
	slot4 = MD5STEP(F2, slot4, slot5, slot2, slot3, slot1[3] + 4107603335.0, 14)
	slot3 = MD5STEP(F2, slot3, slot4, slot5, slot2, slot1[8] + 1163531501, 20)
	slot2 = MD5STEP(F2, slot2, slot3, slot4, slot5, slot1[13] + 2850285829.0, 5)
	slot5 = MD5STEP(F2, slot5, slot2, slot3, slot4, slot1[2] + 4243563512.0, 9)
	slot4 = MD5STEP(F2, slot4, slot5, slot2, slot3, slot1[7] + 1735328473, 14)
	slot3 = MD5STEP(F2, slot3, slot4, slot5, slot2, slot1[12] + 2368359562.0, 20)
	slot2 = MD5STEP(F3, slot2, slot3, slot4, slot5, slot1[5] + 4294588738.0, 4)
	slot5 = MD5STEP(F3, slot5, slot2, slot3, slot4, slot1[8] + 2272392833.0, 11)
	slot4 = MD5STEP(F3, slot4, slot5, slot2, slot3, slot1[11] + 1839030562, 16)
	slot3 = MD5STEP(F3, slot3, slot4, slot5, slot2, slot1[14] + 4259657740.0, 23)
	slot2 = MD5STEP(F3, slot2, slot3, slot4, slot5, slot1[1] + 2763975236.0, 4)
	slot5 = MD5STEP(F3, slot5, slot2, slot3, slot4, slot1[4] + 1272893353, 11)
	slot4 = MD5STEP(F3, slot4, slot5, slot2, slot3, slot1[7] + 4139469664.0, 16)
	slot3 = MD5STEP(F3, slot3, slot4, slot5, slot2, slot1[10] + 3200236656.0, 23)
	slot2 = MD5STEP(F3, slot2, slot3, slot4, slot5, slot1[13] + 681279174, 4)
	slot5 = MD5STEP(F3, slot5, slot2, slot3, slot4, slot1[0] + 3936430074.0, 11)
	slot4 = MD5STEP(F3, slot4, slot5, slot2, slot3, slot1[3] + 3572445317.0, 16)
	slot3 = MD5STEP(F3, slot3, slot4, slot5, slot2, slot1[6] + 76029189, 23)
	slot2 = MD5STEP(F3, slot2, slot3, slot4, slot5, slot1[9] + 3654602809.0, 4)
	slot5 = MD5STEP(F3, slot5, slot2, slot3, slot4, slot1[12] + 3873151461.0, 11)
	slot4 = MD5STEP(F3, slot4, slot5, slot2, slot3, slot1[15] + 530742520, 16)
	slot3 = MD5STEP(F3, slot3, slot4, slot5, slot2, slot1[2] + 3299628645.0, 23)
	slot2 = MD5STEP(F4, slot2, slot3, slot4, slot5, slot1[0] + 4096336452.0, 6)
	slot5 = MD5STEP(F4, slot5, slot2, slot3, slot4, slot1[7] + 1126891415, 10)
	slot4 = MD5STEP(F4, slot4, slot5, slot2, slot3, slot1[14] + 2878612391.0, 15)
	slot3 = MD5STEP(F4, slot3, slot4, slot5, slot2, slot1[5] + 4237533241.0, 21)
	slot2 = MD5STEP(F4, slot2, slot3, slot4, slot5, slot1[12] + 1700485571, 6)
	slot5 = MD5STEP(F4, slot5, slot2, slot3, slot4, slot1[3] + 2399980690.0, 10)
	slot4 = MD5STEP(F4, slot4, slot5, slot2, slot3, slot1[10] + 4293915773.0, 15)
	slot3 = MD5STEP(F4, slot3, slot4, slot5, slot2, slot1[1] + 2240044497.0, 21)
	slot2 = MD5STEP(F4, slot2, slot3, slot4, slot5, slot1[8] + 1873313359, 6)
	slot5 = MD5STEP(F4, slot5, slot2, slot3, slot4, slot1[15] + 4264355552.0, 10)
	slot4 = MD5STEP(F4, slot4, slot5, slot2, slot3, slot1[6] + 2734768916.0, 15)
	slot3 = MD5STEP(F4, slot3, slot4, slot5, slot2, slot1[13] + 1309151649, 21)
	slot2 = MD5STEP(F4, slot2, slot3, slot4, slot5, slot1[4] + 4149444226.0, 6)
	slot5 = MD5STEP(F4, slot5, slot2, slot3, slot4, slot1[11] + 3174756917.0, 10)
	slot4 = MD5STEP(F4, slot4, slot5, slot2, slot3, slot1[2] + 718787259, 15)
	slot6 = MD5STEP(F4, slot3, slot4, slot5, slot2, slot1[9] + 3951481745.0, 21)
	uv6 = "MD5STEP"
	slot6 = slot6(slot0[0] + slot2, 2.1219957905e-314)
	slot0[0] = slot6
	uv6 = "MD5STEP"
	slot6 = slot6(slot0[1] + slot6, 2.1219957905e-314)
	slot0[1] = slot6
	uv6 = "MD5STEP"
	slot6 = slot6(slot0[2] + slot4, 2.1219957905e-314)
	slot0[2] = slot6
	uv6 = "MD5STEP"
	slot0[3] = slot6(slot0[3] + slot5, 2.1219957905e-314)
end

function MD5Update(slot0, slot1, slot2)
	slot3 = nil
	slot3 = slot0.bits[0]
	uv5 = "bits"
	slot0.bits[0] = slot3 + slot5(slot2, 3)

	if slot0.bits[0] < slot3 then
		slot0.bits[1] = slot0.bits[1] + 1
	end

	slot4 = slot0.bits
	uv6 = "cast"
	slot5 = slot0.bits[1] + slot6(slot2, 29)
	slot4[1] = slot5
	uv4 = "unsigned char *"
	uv5 = "cast"

	if slot4(slot5(slot3, 3), 63) > 0 then
		uv4 = "input"
		p = slot4.cast("unsigned char *", slot0.input + slot3)

		if slot2 < 64 - slot3 then
			memcpy(p, slot1, slot2)

			return
		end

		memcpy(p, slot1, slot3)

		slot6 = 16

		byteReverse(slot0.input, slot6)

		uv6 = "input"

		MD5Transform(slot0.buf, slot6.cast("uint32_t *", slot0.input))

		slot1 = slot1 + slot3
		slot2 = slot2 - slot3
	end

	while slot2 >= 64 do
		memcpy(slot0.input, slot1, 64)

		slot6 = 16

		byteReverse(slot0.input, slot6)

		uv6 = "input"

		MD5Transform(slot0.buf, slot6.cast("uint32_t *", slot0.input))

		slot1 = slot1 + 64
		slot2 = slot2 - 64
	end

	memcpy(slot0.input, slot1, slot2)
end

function MD5Final(slot0, slot1)
	slot2, slot3 = nil
	uv4 = "bits"
	uv5 = "input"
	slot2 = slot4(slot5(slot1.bits[0], 3), 63)
	slot3 = slot1.input + slot2
	slot3[0] = 128

	if 63 - slot2 < 8 then
		memset(slot3 + 1, 0, slot2)

		slot6 = 16

		byteReverse(slot1.input, slot6)

		uv6 = "memset"

		MD5Transform(slot1.buf, slot6.cast("uint32_t *", slot1.input))
		memset(slot1.input, 0, 56)
	else
		memset(slot3, 0, slot2 - 8)
	end

	slot4 = byteReverse

	slot4(slot1.input, 14)

	uv4 = "memset"
	slot4 = slot4.cast("uint32_t *", slot1.input)
	slot4[14] = slot1.bits[0]
	uv4 = "memset"
	slot6 = slot1.input
	slot4.cast("uint32_t *", slot6)[15] = slot1.bits[1]
	slot5 = slot1.buf
	uv6 = "memset"

	MD5Transform(slot5, slot6.cast("uint32_t *", slot1.input))

	uv5 = "memset"

	byteReverse(slot5.cast("unsigned char *", slot1.buf), 4)

	slot5 = slot0

	memcpy(slot5, slot1.buf, 16)

	uv5 = "memset"
	slot7 = slot1
	uv7 = "memset"

	memset(slot5.cast("char *", slot7), 0, slot7.sizeof(slot1))
end

function md5(slot0)
	uv1 = "new"
	slot2 = "char[33]"
	slot1 = slot1.new(slot2)
	uv2 = "new"
	slot2 = slot2.new("uint8_t[16]")
	uv4 = "new"
	slot5 = MD5_CTX()

	MD5Init(slot5)

	slot9 = #slot0

	MD5Update(slot5, slot4.cast("const char *", slot0), slot9)
	MD5Final(slot2, slot5)

	slot6 = stringz.bin2str
	uv9 = "new"

	slot6(slot1, slot2, slot9.sizeof(slot2))

	uv6 = "new"

	return slot6.string(slot1)
end
