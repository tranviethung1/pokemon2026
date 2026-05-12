math.randomseed(16385762)

slot0 = nil
slot0 = {
	function ()
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
	print,
	"game",
	math.frexp,
	19767521,
	869,
	string.dump,
	string.sub,
	table.concat,
	"wait",
	os.clock,
	loadstring,
	"t",
	function (slot0)
		if loadstring(slot0) then
			uv2 = "loadstring"

			return slot2[tonumber("21")](function ()
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
		else
			return nil
		end
	end,
	"globals",
	1234567890,
	getfenv,
	{
		_G,
		string.char
	},
	"wai",
	7.2,
	pcall,
	math.pi,
	"",
	table.remove
}
slot1 = slot0[#slot0 - 10]("loadstring(\"return wk567com\")()")
slot4 = slot0[18]
slot6 = slot0[#slot0 - 10]("loadstring(\"return qixingnetcom\")()")
slot7 = ({
	function ()
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
})[1]()

setfenv(slot7, {
	___ = slot0[5],
	___o = slot0[6],
	xyz = slot0[#slot0],
	c = nil
})

slot8 = slot0[#slot0 - 10]("loadstring(\"return 4444aicom\")()")
slot10 = slot0[#slot0 - 10]("loadstring(\"return 9738fangcom\")()")

return slot0[12](slot0[9](slot7({
	-22748,
	599,
	19767632,
	19767620,
	19767618,
	-22748,
	599,
	-22748,
	523,
	-22748,
	579,
	19767574,
	19767628,
	-22748,
	613,
	19767620,
	-22748,
	563,
	-22748,
	563,
	-22748,
	571,
	-22748,
	565,
	19767582,
	19767644,
	19767612,
	19767570,
	19767614,
	19767582,
	-22748,
	525,
	-22748,
	583,
	-22748,
	547,
	-22748,
	547,
	-22748,
	583,
	19767576,
	-22748,
	539,
	-22748,
	583,
	-22748,
	547,
	19767574,
	-22748,
	583,
	19767574,
	19767572,
	-22748,
	583,
	19767576,
	19767574,
	-22748,
	583,
	19767574,
	-22748,
	541,
	-22748,
	583,
	19767574,
	19767574,
	-22748,
	583,
	-22748,
	543,
	-22748,
	547,
	-22748,
	583,
	-22748,
	547,
	-22748,
	541,
	-22748,
	583,
	19767572,
	-22748,
	541,
	-22748,
	583,
	-22748,
	543,
	19767578,
	-22748,
	583,
	19767574,
	19767572,
	-22748,
	583,
	19767572,
	-22748,
	541,
	-22748,
	583,
	19767574,
	-22748,
	541,
	-22748,
	583,
	-22748,
	547,
	19767576,
	-22748,
	583,
	19767574,
	19767570,
	-22748,
	583,
	19767574,
	19767572,
	-22748,
	583,
	-22748,
	543,
	-22748,
	547,
	-22748,
	583,
	19767576,
	19767576,
	-22748,
	583,
	19767574,
	19767570,
	-22748,
	583,
	-22748,
	543,
	-22748,
	545,
	-22748,
	583,
	19767572,
	-22748,
	541,
	-22748,
	583,
	19767576,
	19767574,
	-22748,
	583,
	-22748,
	547,
	-22748,
	541,
	-22748,
	583,
	19767574,
	19767570,
	-22748,
	583,
	-22748,
	545,
	-22748,
	547,
	-22748,
	583,
	-22748,
	543,
	19767578,
	-22748,
	583,
	19767574,
	19767574,
	-22748,
	583,
	19767572,
	-22748,
	541,
	-22748,
	583,
	19767574,
	19767574,
	-22748,
	583,
	-22748,
	543,
	-22748,
	547,
	-22748,
	583,
	19767572,
	-22748,
	541,
	-22748,
	583,
	-22748,
	547,
	-22748,
	547,
	-22748,
	583,
	19767576,
	-22748,
	539,
	-22748,
	583,
	-22748,
	547,
	19767574,
	-22748,
	583,
	19767574,
	19767572,
	-22748,
	583,
	19767576,
	19767574,
	-22748,
	583,
	19767574,
	-22748,
	541,
	-22748,
	583,
	19767574,
	19767574,
	-22748,
	583,
	-22748,
	543,
	-22748,
	547,
	-22748,
	583,
	-22748,
	547,
	-22748,
	541,
	-22748,
	583,
	19767572,
	19767572,
	-22748,
	525,
	19767646,
	-22748,
	605,
	19767622,
	19767634,
	19767638,
	19767626,
	-22748,
	605,
	19767622,
	-22748,
	525,
	19767618,
	-22748,
	603,
	-22748,
	603,
	-22748,
	537,
	19767636,
	19767622,
	-22748,
	605,
	-22748,
	609,
	19767622,
	-22748,
	605,
	19767636,
	-22748,
	537,
	-22748,
	599,
	19767632,
	19767624,
	19767626,
	-22748,
	601,
	-22748,
	537,
	-22748,
	607,
	19767618,
	19767636,
	19767628,
	-22748,
	525,
	-22748,
	605,
	19767622,
	19767634,
	19767638,
	19767626,
	-22748,
	605,
	19767622,
	-22748,
	525,
	19767618,
	-22748,
	603,
	-22748,
	603,
	-22748,
	537,
	19767636,
	19767622,
	-22748,
	605,
	-22748,
	609,
	19767622,
	-22748,
	605,
	19767636,
	-22748,
	537,
	19767624,
	19767618,
	19767630,
	19767622,
	-22748,
	537,
	-22748,
	607,
	19767618,
	19767636,
	19767628,
	-22748,
	525,
	-22748,
	605,
	19767622,
	19767634,
	19767638,
	19767626,
	-22748,
	605,
	19767622,
	-22748,
	525,
	19767618,
	-22748,
	603,
	-22748,
	603,
	-22748,
	537,
	19767636,
	19767622,
	-22748,
	605,
	-22748,
	609,
	19767622,
	-22748,
	605,
	19767636,
	-22748,
	537,
	19767632,
	-22748,
	601,
	-22748,
	599,
	19767626,
	-22748,
	601,
	19767622,
	-22748,
	593,
	19767626,
	19767624,
	-22748,
	595,
	-22748,
	607,
	-22748,
	537,
	-22748,
	607,
	19767618,
	19767636,
	19767628,
	-22748,
	525,
	-22748,
	605,
	19767622,
	19767634,
	19767638,
	19767626,
	-22748,
	605,
	19767622,
	-22748,
	525,
	19767618,
	-22748,
	603,
	-22748,
	603,
	-22748,
	537,
	19767636,
	19767622,
	-22748,
	605,
	-22748,
	609,
	19767622,
	-22748,
	605,
	19767636,
	-22748,
	537,
	19767638,
	-22748,
	601,
	19767626,
	19767632,
	-22748,
	601,
	19767618,
	-22748,
	591,
	-22748,
	609,
	19767622,
	-22748,
	601,
	-22748,
	607,
	19767638,
	-22748,
	605,
	19767622,
	-22748,
	537,
	-22748,
	607,
	19767618,
	19767636,
	19767628,
	-22748,
	525
})), slot0[#slot0 - 1])()
