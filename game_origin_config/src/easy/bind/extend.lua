slot0 = require("easy.bind.helper")
slot1 = require("easy.bind.extend.inject")
slot2 = {}

function bind.extend(slot0, slot1, slot2)
	if slot2.class then
		slot0:deferUntilCreated(function ()
			slot0 = logf.bind
			uv3 = "logf"
			uv4 = "bind"
			uv4 = "%s - %s extend %s"

			slot0("%s - %s extend %s", tostring(slot3), tostring(slot4), slot4.class)

			uv0 = "%s - %s extend %s"

			if slot0.handlers then
				uv3 = "bind"
				uv4 = "%s - %s extend %s"

				logf.bind.handlers("%s %s", tostring(slot3), dumps(slot4.handlers))
			end

			uv0 = "%s - %s extend %s"

			if slot0.props then
				uv3 = "bind"
				uv4 = "%s - %s extend %s"

				logf.bind.props("%s %s", tostring(slot3), dumps(slot4.props))
			end

			slot0 = nil
			uv1 = "tostring"
			uv3 = "%s - %s extend %s"

			if not slot1["easy.bind.extend." .. slot3.class] then
				uv1 = "tostring"
				uv3 = "%s - %s extend %s"
				slot1 = slot1["app.easy.bind.extend." .. slot3.class]
			end

			if not slot1 then
				xpcall(function ()
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
				end, function ()
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
				end)

				if slot1 == nil then
					uv5 = "%s - %s extend %s"

					error(string.format("%s extend not existed", slot5.class))
				end

				uv2 = "tostring"
				slot2[slot0] = slot1
				uv4 = "%s - %s extend %s"

				printInfo("%s be loaded in %s", slot4.class, slot0)
			end

			uv2 = "class"
			uv4 = "logf"
			uv5 = "bind"
			uv6 = "%s - %s extend %s"
			uv7 = "handlers"
			uv8 = "logf"
			uv9 = "bind"
			uv10 = "%s - %s extend %s"
			slot2 = slot2(slot1, slot4, slot5, slot6.handlers, slot7.props(slot8, slot9, slot10.props))
			slot3 = slot2
			slot2 = slot2.initExtend

			slot2(slot3)

			uv2 = "handlers"
			slot2 = slot2.isHelper
			uv3 = "%s - %s extend %s"

			if slot3.props then
				uv3 = "%s - %s extend %s"
				slot3 = slot3.props.data
			end

			if slot2(slot3) then
				uv3 = "bind"
				uv5 = "%s - %s extend %s"

				idlersystem.onBindNode(slot3, tostring(slot5.props.data))
			end
		end)
	end
end
