slot0 = lua_tostring or tostring
slot1 = lua_pairs or pairs
slot2 = lua_ipairs or ipairs
slot3 = lua_type or type
slot4 = "lua%-callgrind.lua"
slot5 = io.popen("cd"):read()
slot6 = os.clock

if socket and socket.gettime then
	slot6 = socket.gettime
end

if cc.utils and cc.utils.gettime then
	function slot6()
		return cc.utils:getTimeInMilliseconds()
	end
end

slot7 = {
	start = function (slot0)
		slot1 = {}
		uv0 = 1
		uv1 = slot0
		uv2 = slot0
		uv3 = nil
		slot1 = {}
		uv4 = 1
		uv5 = 1
		uv6 = {}
		uv7 = slot0
		slot1 = io.open(string.format("callgrind.%s.txt", slot0 or ""), "w+")
		uv3 = 1
		uv1 = "format"
		slot2 = slot1

		slot1.write(slot2, "events: Instructions Cycles\n")

		slot1 = debug.sethook
		uv2 = "events: Instructions Cycles\n"

		slot1(slot2, "crl", 1)

		uv1 = "debug"
		uv2 = ""

		slot1(slot2, _G)
	end,
	stop = function ()
		slot0 = debug.sethook

		slot0()

		uv0 = "debug"
		uv1 = "sethook"

		slot0(slot1, _G)

		uv0 = "_G"
		uv1 = "meta"

		for slot3, slot4 in slot0(slot1) do
			if not slot4.meta.name and slot5.linedefined == 0 then
				slot5.name = "(test-wrapper)"
			end

			uv6 = "name"
			slot7 = slot5
			slot6 = slot6(slot7)
			uv7 = "sethook"
			uv8 = "linedefined"

			if slot7[slot8(slot5.func)] then
				uv7 = "sethook"
				uv8 = "linedefined"
				slot6 = slot7[slot8(slot5.func)].name
			end

			uv7 = "(test-wrapper)"
			slot7, slot8 = slot7(slot5.short_src)

			if not slot7 then
				uv9 = "func"
				slot9 = slot9.write

				slot9(slot9, "fl=" .. slot8 .. "\n")

				uv9 = "func"
				slot9 = slot9.write
				slot12 = slot6
				slot13 = "\n"

				slot9(slot9, "fn=" .. slot12 .. slot13)

				uv9 = "_G"

				for slot12, slot13 in slot9(slot4.lines) do
					uv14 = "func"

					slot14:write(string.format("%d %d\n", slot12, slot13))
				end

				uv9 = "_G"

				for slot12, slot13 in slot9(slot4.funcs) do
					uv14 = "sethook"

					if slot14[slot13.cfn:sub(5)] then
						uv16 = "sethook"
						slot13.cfn = ("cfn=%s"):format(slot16[slot13.cfn:sub(5)].name)
					end

					uv14 = "func"
					slot14 = slot14.write

					slot14(slot14, slot13.cfl .. "\n")

					uv14 = "func"
					slot14 = slot14.write

					slot14(slot14, slot13.cfn .. "\n")

					uv14 = "func"
					slot14 = slot14.write
					slot16 = "calls=%d %d\n"
					slot17 = slot16
					slot18 = slot13.ncalls

					slot14(slot14, slot16.format(slot17, slot18, slot13.linedefined))

					uv14 = "_G"

					for slot17, slot18 in slot14(slot13.instrs) do
						uv19 = "func"

						slot19:write(("%d %d %d\n"):format(slot17, slot18, slot13.cycles[slot17] or 0))
					end
				end

				uv9 = "func"

				slot9:write("\n")
			end
		end

		uv0 = "func"

		slot0:close()
	end
}
slot8 = {}
slot9 = 0
slot10 = 0
slot11 = nil
slot12 = {}
slot13 = {}
slot14 = 1
slot15 = 0
slot16 = nil

function slot17(slot0)
	if slot0:find("%[string") then
		slot2 = slot0
		uv2 = "find"

		return slot2 .. "/" .. slot0.sub(slot2, 10, -3)
	end

	return slot0
end

function slot18(slot0)
	uv3 = "%s"

	return ("%s"):format(slot3(slot0.func))
end

function slot19(slot0)
	if slot0 == "[C]" then
		return slot0
	end

	uv1 = "[C]"
	slot1 = false
	uv3 = "find"

	if #slot1(slot0) > #slot3 then
		uv4 = "find"
		slot1 = slot0:find(slot4)
	end

	return slot1, slot0
end

function slot20()
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

function slot21()
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

if arg then
	slot7.start()
	assert(loadfile(arg[1]))()
	slot7.stop()
end

return slot7
