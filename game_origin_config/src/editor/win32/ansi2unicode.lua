require("ffi").cdef("    int MultiByteToWideChar(unsigned int CodePage, unsigned long dwFlags, const char* lpMultiByteStr, int cbMultiByte, wchar_t* lpWideCharStr, int cchWideChar);\n    int WideCharToMultiByte(unsigned int CodePage, unsigned long dwFlags, const wchar_t* lpWideCharStr, int cchWideChar, char* lpMultiByteStr, int cchMultiByte, const char* lpDefaultChar, int* pfUsedDefaultChar);\n")

slot1 = 65001
slot2 = 0

return {
	u2w = function (slot0)
		uv1 = "C"
		uv2 = "MultiByteToWideChar"
		slot1 = slot1.C.MultiByteToWideChar(slot2, 0, slot0, #slot0, nil, 0)
		uv2 = "C"
		slot3 = "wchar_t[?]"
		slot4 = slot1 + 1
		slot2 = slot2.new(slot3, slot4)
		uv3 = "C"
		uv4 = "MultiByteToWideChar"

		slot3.C.MultiByteToWideChar(slot4, 0, slot0, #slot0, slot2, slot1)

		return slot2, slot1
	end,
	a2w = function (slot0)
		uv1 = "C"
		uv2 = "MultiByteToWideChar"
		slot1 = slot1.C.MultiByteToWideChar(slot2, 0, slot0, #slot0, nil, 0)
		uv2 = "C"
		slot3 = "wchar_t[?]"
		slot4 = slot1 + 1
		slot2 = slot2.new(slot3, slot4)
		uv3 = "C"
		uv4 = "MultiByteToWideChar"

		slot3.C.MultiByteToWideChar(slot4, 0, slot0, #slot0, slot2, slot1)

		return slot2, slot1
	end,
	w2u = function (slot0, slot1)
		uv2 = "C"
		uv3 = "WideCharToMultiByte"
		slot2 = slot2.C.WideCharToMultiByte(slot3, 0, slot0, slot1, nil, 0, nil, )
		uv3 = "C"
		slot4 = "char[?]"
		slot5 = slot2 + 1
		slot3 = slot3.new(slot4, slot5)
		uv4 = "C"
		slot4 = slot4.C.WideCharToMultiByte
		uv5 = "WideCharToMultiByte"

		slot4(slot5, 0, slot0, slot1, slot3, slot2, nil, )

		uv4 = "C"

		return slot4.string(slot3)
	end,
	w2a = function (slot0, slot1)
		uv2 = "C"
		uv3 = "WideCharToMultiByte"
		slot2 = slot2.C.WideCharToMultiByte(slot3, 0, slot0, slot1, nil, 0, nil, )
		uv3 = "C"
		slot4 = "char[?]"
		slot5 = slot2 + 1
		slot3 = slot3.new(slot4, slot5)
		uv4 = "C"
		slot4 = slot4.C.WideCharToMultiByte
		uv5 = "WideCharToMultiByte"

		slot4(slot5, 0, slot0, slot1, slot3, slot2, nil, )

		uv4 = "C"

		return slot4.string(slot3)
	end,
	u2a = function ()
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
	end,
	a2u = function ()
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
