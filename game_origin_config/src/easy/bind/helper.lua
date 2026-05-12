slot0 = table.insert

function slot2(slot0, slot1, slot2)
	if slot2 == nil then
		return nil
	end

	if #slot2 == 0 then
		return slot2
	end

	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		uv9 = "ipairs"

		if slot9.isHelper(slot8) then
			slot8 = slot8(slot0, slot1)
		end

		uv9 = "isHelper"

		slot9(slot3, slot8)
	end

	return slot3
end

slot5 = {}
globals.bindHelper = slot5

function slot6(slot0)
	slot1 = slot0.__id or slot0.__name
	slot2 = nil

	if slot0.__id then
		slot2 = slot0.__name
	end

	return string.format("%s(%s%s%s)", slot0.__raw and "bindraw" or "bind", slot0.__method, slot1 and "." .. slot1 or "", slot2 and "." .. slot2 or "")
end

slot7 = {
	__call = function (slot0, slot1, slot2, ...)
		if slot1.parent_[slot0.__name] == nil then
			printWarn("%s is nil, self is %s, parent is %s", tostring(slot0), tostring(slot1), tostring(slot3))
		end

		if isCallable(slot4) then
			if slot0.__raw then
				return slot3:createHandler(slot0.__name, slot2)
			else
				return slot4(slot3, slot2, ...)
			end
		end

		return slot4
	end,
	handler = function (slot0, slot1, slot2)
		return slot1:createHandler(slot0.__name, slot2)
	end,
	__tostring = slot6,
	__index = slot7
}

function slot5.parent(slot0, slot1)
	uv4 = "setmetatable"

	return setmetatable({
		__method = "parent",
		__bindHelper = true,
		__name = slot0,
		__raw = slot1
	}, slot4)
end

slot8 = {
	__call = function (slot0, slot1, slot2, ...)
		if slot1[slot0.__name] == nil then
			printWarn("%s is nil, self is %s", tostring(slot0), tostring(slot1))
		end

		if isCallable(slot3) then
			if slot0.__raw then
				return slot1:createHandler(slot0.__name, slot2)
			else
				return slot3(slot1, slot2, ...)
			end
		end

		return slot3
	end,
	handler = function (slot0, slot1, slot2)
		return slot1:createHandler(slot0.__name, slot2)
	end,
	__tostring = slot6,
	__index = slot8
}

function slot5.self(slot0, slot1)
	uv4 = "setmetatable"

	return setmetatable({
		__method = "self",
		__bindHelper = true,
		__name = slot0,
		__raw = slot1
	}, slot4)
end

slot9 = {
	__call = function (slot0, slot1, ...)
		return gGameModel[slot0.__method]:getIdler(slot0.__id, slot0.__name)
	end,
	__tostring = slot6
}

function slot5.model(slot0, ...)
	slot1, slot2 = ...
	uv5 = "setmetatable"

	return setmetatable({
		__bindHelper = true,
		__method = slot0,
		__id = slot1,
		__name = slot2
	}, slot5)
end

slot10 = {
	__call = function (slot0, slot1, ...)
		return slot0.__f(slot1, ...)
	end,
	__tostring = slot6
}

function slot5.defer(slot0, ...)
	uv3 = "setmetatable"

	return setmetatable({
		__method = "defer",
		__bindHelper = true,
		__f = slot0
	}, slot3)
end

return {
	method = function (slot0, slot1, slot2, slot3, slot4)
		slot5 = nil

		if slot2.methods then
			if slot2.methods[slot3] == nil then
				return
			end

			if isCallable(slot6) then
				slot5 = slot6
			else
				slot5 = slot0[slot6]
			end
		elseif isCallable(slot2.method) then
			slot5 = slot2.method
		else
			slot5 = slot0[slot2.method]
		end

		if slot5 then
			return slot4 and slot5 or functools.partial(slot5, slot0, slot1)
		end
	end,
	listen = function (slot0, slot1, slot2, slot3)
		uv4 = "method"

		if slot2.idler then
			if slot4.method(slot0, slot1, slot2, nil, true) then
				bind.listen(slot0, slot1, {
					idler = slot5,
					method = function ()
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
				})
			else
				bind.listen(slot0, slot1, {
					idler = slot5,
					method = slot3
				})
			end
		end
	end,
	isHelper = function (slot0)
		return type(slot0) == "table" and slot0.__bindHelper == true
	end,
	isIdler = isIdler,
	isIdlers = isIdlers,
	propVal = function (slot0)
		if type(slot0) ~= "table" then
			return slot0
		else
			uv1 = "type"

			if slot1.isIdler(slot0) then
				return slot0()
			end
		end

		return slot0
	end,
	args = function (slot0, slot1, slot2)
		uv4 = "unpack"

		return unpack(slot4(slot2))
	end,
	props = function (slot0, slot1, slot2)
		if slot2 == nil then
			return nil
		end

		if itertools.isempty(slot2) then
			return slot2
		end

		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			uv9 = "itertools"

			if slot9.isHelper(slot8) then
				slot8 = slot8(slot0, slot1)
			end

			slot3[slot7] = slot8
		end

		return slot3
	end,
	handlers = function (slot0, slot1, slot2)
		if slot2 == nil then
			return nil
		end

		if itertools.isempty(slot2) then
			return slot2
		end

		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			uv9 = "itertools"

			if slot9.isHelper(slot8) then
				slot8 = slot8:handler(slot0, slot1)
			else
				error(string.format("handler not bindHelper, %s=%s", slot7, tostring(slot8)))
			end

			slot3[slot7] = slot8
		end

		return slot3
	end,
	dataOrIdler = function (slot0)
		uv1 = "isIdlers"

		if slot1.isIdlers(slot0) then
			return nil, , slot0
		else
			uv1 = "isIdlers"

			if slot1.isIdler(slot0) then
				return nil, slot0
			end
		end

		return slot0
	end,
	bindData = function (slot0, slot1, slot2, slot3)
		slot4 = slot3

		if dev.DEBUG_MODE then
			slot5 = tostring(slot0)
			slot6 = tostring(slot1)
			slot7 = debug.traceback()

			function slot4(slot0, slot1)
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
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
					--     return _build_string_constant(state, instruction.CD)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
					--     node.value = state.constants.complex_constants[index]
					--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
					-- IndexError: list index out of range
				end, function (slot0)
					__G__TRACKBACK__(slot0)

					uv4 = "__G__TRACKBACK__"
					slot3 = tostring(slot4)
					uv5 = "print"
					slot5 = tostring
					uv6 = "err in bindData:"

					print("err in bindData:", slot3, tostring(slot5), slot5(slot6))

					uv3 = "tostring"
					uv5 = "sendExceptionInMobile"
					uv8 = [[
[string "bind.helper"]:150:err in bindData:

stack traceback:
]]
					uv9 = "\n"

					sendExceptionInMobile([[
[string "bind.helper"]:150:err in bindData:

stack traceback:
]] .. slot3 .. "\n" .. slot5 .. "\n" .. dumps(slot8) .. "\n" .. slot9)
				end)
			end
		end

		if slot2.data ~= nil then
			uv5 = "dev"

			if slot5.isHelper(slot2.data) then
				slot0:deferUntilCreated(function ()
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
				uv5 = "dev"

				if slot5.method(slot0, slot1, slot2, nil, true) then
					slot4(slot1, slot5(slot2.data))
				else
					slot4(slot1, slot2.data)
				end
			end
		elseif slot2.idler then
			uv5 = "dev"

			slot5.listen(slot0, slot1, slot2, function ()
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
	end,
	extendDataIter = function (slot0, slot1, slot2)
		slot3 = slot2
		slot4 = slot2

		function slot5(slot0, slot1)
			uv3 = "type"

			if type(slot3) == "function" then
				uv2 = "type"

				return slot2(slot0, slot1)
			end

			uv2 = "type"

			return slot0, slot2[slot0]
		end

		slot6 = -1

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
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
			--     return _build_string_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
			--     node.value = state.constants.complex_constants[index]
			--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end
	end,
	callOrWhen = function (slot0, slot1, slot2, slot3)
		if slot0 == nil then
			return
		end

		uv4 = "isHelper"

		if slot4.isHelper(slot0) then
			slot0 = slot0(slot2)
		end

		uv4 = "isHelper"

		if slot4.isIdler(slot0) then
			if slot2 then
				idlereasy.when(slot0, function ()
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
				end):anonyOnly(slot2, slot3)
			end
		else
			slot1(slot0)
		end
	end
}
