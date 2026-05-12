function table.defaulttable(slot0)
	return setmetatable({}, {
		__index = function (slot0, slot1)
			uv2 = "rawset"
			slot2 = slot2()

			rawset(slot0, slot1, slot2)

			return slot2
		end,
		__call = function ()
			uv1 = "table"

			return table.defaulttable(slot1)
		end
	})
end

function slot0(slot0, slot1, slot2, slot3)
	if type(slot3) == "table" then
		slot3 = table.proxytable(slot3, slot0, slot1, slot2)
	end

	return slot3
end

function slot1(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 then
		slot1(slot3, slot4, slot5)
	end

	if type(slot5) == "table" then
		slot5 = table.proxytable(slot5, slot0, slot1, slot2)
	end

	return slot4, slot5
end

function table.isproxy(slot0)
	return slot0 and type(slot0) == "table" and rawget(slot0, "__proxy")
end

function table.proxytable(slot0, slot1, slot2, slot3)
	slot1 = slot1 or {}
	slot4 = getmetatable(slot0) or {}
	uv6 = "getmetatable"
	slot5 = functools.partial(slot6, slot1, slot2, slot3, slot0)

	return setmetatable({
		__proxy = true,
		__raw = slot0,
		__class = slot0 and rawget(slot0, "__class"),
		__cid = slot0 and rawget(slot0, "__cid"),
		__cname = slot0 and rawget(slot0, "__cname")
	}, {
		__index = function ()
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
		__newindex = function (slot0, slot1, slot2)
			if table.isproxy(slot2) then
				error("do not save proxy in proxy, you could do this when get raw table")
			end

			uv3 = "table"
			slot3[slot1] = slot2
			uv3 = "isproxy"

			if slot3 then
				uv3 = "isproxy"
				uv4 = "table"

				slot3(slot4, slot1, slot2)
			end
		end,
		__call = function (...)
			uv0 = "__call"

			if slot0.__call then
				uv0 = "__call"
				uv1 = "__call"

				return slot0.__call(slot1, ...)
			end

			uv0 = "__call"

			return slot0
		end,
		__pairs = function (slot0)
			uv2 = "pairs"
			slot1, slot2, slot3 = pairs(slot2)
			uv8 = "itertools"

			return itertools.iter(slot1, slot2, slot3, slot8)
		end,
		__ipairs = function (slot0)
			uv2 = "ipairs"
			slot1, slot2, slot3 = ipairs(slot2)
			uv8 = "itertools"

			return itertools.iter(slot1, slot2, slot3, slot8)
		end,
		__next = function (slot0, slot1)
			uv2 = "next"
			uv4 = "next"

			return slot2(next(slot4, slot1))
		end,
		__len = function (slot0)
			uv2 = "itertools"

			return itertools.size(slot2)
		end,
		__eq = slot1.__eq or slot4.__eq,
		__lt = slot1.__lt or slot4.__lt,
		__le = slot1.__le or slot4.__le,
		__tostring = slot1.__tostring or slot4.__tostring
	})
end

function slot2(slot0)
	if type(slot0) == "table" then
		slot0 = table.immutabletable(slot0)
	end

	return slot0
end

function slot3(slot0, slot1)
	if type(slot1) == "table" then
		slot1 = table.immutabletable(slot1)
	end

	return slot0, slot1
end

function table.isimmutable(slot0)
	return slot0 and type(slot0) == "table" and rawget(slot0, "__immutable")
end

function table.immutabletable(slot0)
	slot1 = getmetatable(slot0) or {}

	return setmetatable({
		__immutable = true,
		__raw = slot0,
		__class = slot0 and rawget(slot0, "__class"),
		__cid = slot0 and rawget(slot0, "__cid"),
		__cname = slot0 and rawget(slot0, "__cname")
	}, {
		__index = function ()
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
		__newindex = function (slot0, slot1, slot2)
			error(string.format("this is immutable table, you can not set %s in here", tostring(slot1)))
		end,
		__call = function ()
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
		__pairs = function (slot0)
			uv2 = "pairs"
			slot1, slot2, slot3 = pairs(slot2)
			uv8 = "itertools"

			return itertools.iter(slot1, slot2, slot3, slot8)
		end,
		__ipairs = function (slot0)
			uv2 = "ipairs"
			slot1, slot2, slot3 = ipairs(slot2)
			uv8 = "itertools"

			return itertools.iter(slot1, slot2, slot3, slot8)
		end,
		__next = function (slot0, slot1)
			uv2 = "next"
			uv4 = "next"

			return slot2(next(slot4, slot1))
		end,
		__eq = slot1.__eq,
		__lt = slot1.__lt,
		__le = slot1.__le,
		__tostring = slot1.__tostring
	})
end

slot4 = nil

function table.getraw(slot0)
	if lua_type(slot0) == "table" then
		if lua_type(rawget(slot0, "__raw")) == "table" or slot3 == "userdata" then
			return slot2
		end

		return slot0
	elseif slot1 == "userdata" then
		return slot0
	end
end

slot4 = table.getraw

function table.unpack(slot0, ...)
	uv2 = "unpack"

	return unpack(slot2(slot0), ...)
end

function table.length(slot0)
	uv1 = "getmetatable"

	if getmetatable(slot1(slot0)) and slot1.__len then
		return slot1.__len(slot0)
	end

	return #slot0
end

function table.clear(slot0)
	for slot4, slot5 in pairs(slot0) do
		slot0[slot4] = nil
	end
end

function table.swapvalue(slot0, slot1, slot2)
	slot0[slot2] = slot0[slot1]
	slot0[slot1] = slot0[slot2]
end

function table.set(slot0, slot1, ...)
	if slot0 == nil then
		return
	end

	slot2 = select("#", ...)

	assert(slot1 ~= nil and slot2 >= 1, "must need one key and one value")

	if slot2 == 1 then
		slot0[slot1] = ...

		return
	end

	if slot2 == 2 then
		slot3, slot4 = ...

		if slot0[slot1] == nil then
			if slot4 ~= nil then
				slot0[slot1] = {
					[slot3] = slot4
				}
			end
		else
			slot0[slot1][slot3] = slot4
		end

		return
	end

	slot3 = {
		slot1,
		...
	}
	slot4 = slot3[slot2 + 1]

	if slot2 + 1 == #slot3 then
		table.remove(slot3)
	end

	return table.setWithKeys(slot0, slot3, slot4)
end

function table.setWithKeys(slot0, slot1, slot2)
	assert(table.length(slot1) >= 1, "must need one key")

	for slot7 = 1, slot3 - 1 do
		if lua_type(slot0) ~= "table" then
			error(string.format("%s is not table, it could not be set", slot0))
		end

		if slot0[slot1[slot7]] == nil then
			if slot2 == nil then
				return
			end

			slot0[slot8] = {}
		end

		slot0 = slot9
	end

	slot0[slot1[slot3]] = slot2
end

function table.get(slot0, ...)
	if slot0 == nil then
		return
	end

	assert(select("#", ...) >= 1, "must need one key")

	if slot1 == 1 then
		return slot0[...]
	end

	if slot1 == 2 then
		slot2, slot3 = ...

		if lua_type(slot0[slot2]) ~= "table" then
			return
		end

		return slot0[slot2][slot3]
	end

	return table.getWithKeys(slot0, {
		...
	})
end

function table.getWithKeys(slot0, slot1)
	assert(table.length(slot1) >= 1, "must need one key")

	for slot6 = 1, slot2 do
		slot7 = slot1[slot6]

		if lua_type(slot0) ~= "table" then
			if slot0 ~= nil then
				printWarn("value of [%s] was %s, it could not be iter next", slot7, slot0)
			end

			return
		end

		slot0 = slot0[slot7]
	end

	return slot0
end

function table.shallowcopy(slot0)
	for slot5, slot6 in pairs(slot0) do
		-- Nothing
	end

	return {
		[slot5] = slot6
	}
end

function table.deepcopy(slot0, slot1)
	return function (slot0)
		if lua_type(slot0) ~= "table" then
			return slot0
		end

		slot1 = {
			[slot7(slot8)] = slot8(slot6)
		}

		for slot5, slot6 in pairs((not isIdler(slot0) or slot0:get_()) and (table.getraw(slot0) or slot0)) do
			uv7 = "lua_type"
			slot8 = slot5
			uv8 = "lua_type"
		end

		uv2 = "table"

		if slot2 then
			return slot1
		end

		uv4 = "lua_type"

		return setmetatable(slot1, slot4(getmetatable(slot0)))
	end(slot0)
end

table.emptytable = setmetatable({}, {
	__newindex = function (slot0, slot1, slot2)
		error(string.format("empty const table can not be write `%s`!", slot1))
	end
})
slot5 = {
	__index = function (slot0, slot1)
		if rawget(slot0, "__salts")[slot1] == nil then
			return nil
		end

		return slot3()
	end,
	__newindex = function (slot0, slot1, slot2)
		if rawget(slot0, "__salts")[slot1] == nil then
			assert(type(slot2) == "number", "salt only for number")

			slot3[slot1] = SaltNumber.new(slot2)
		end

		slot4(slot2)
	end,
	__call = function (slot0)
		return itertools.map(rawget(slot0, "__salts"), function (slot0, slot1)
			return slot0, slot1()
		end)
	end
}

function table.salttable(slot0)
	if ANTI_AGENT then
		return table.deepcopy(slot0)
	end

	for slot5, slot6 in pairs(slot0) do
		assert(type(slot6) == "number", "salt only for number")
	end

	uv4 = "ANTI_AGENT"

	return setmetatable({
		__salt = true,
		__salts = {
			[slot5] = SaltNumber.new(slot6)
		}
	}, slot4)
end

function table.issalt(slot0)
	return slot0 and type(slot0) == "table" and slot0.__salt
end

function table.flatArray(slot0, slot1)
	for slot5 = 1, slot1 or #slot0 do
		if isIdler(slot0[slot5]) then
			slot0[slot5] = slot6:get_()
		else
			slot0[slot5] = table.getraw(slot6) or slot6
		end
	end

	return slot0
end
