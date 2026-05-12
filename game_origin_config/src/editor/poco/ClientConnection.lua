slot1 = nil

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

slot2 = function (slot0, slot1)
	slot2 = nil
	slot3 = slot0
	slot4 = 1

	while true do
		if string.byte(slot0, slot4) ~= 46 then
			if slot2 and #slot2 > 0 then
				slot3 = table.concat(slot2, ".") .. "." .. string.sub(slot0, slot4)
			end

			break
		end

		slot4 = slot4 + 1

		if not slot2 then
			if not slot1 then
				slot5, slot1 = debug.getlocal(3, 1)
			end

			slot2 = string.split(slot1, ".")
		end

		table.remove(slot2, #slot2)
	end

	return require(slot3)
end(".support.dkjson")
slot3 = _G.struct or slot0(".support.struct")
slot4 = {
	__index = slot4,
	DEBUG = false,
	sock = nil,
	buf = "",
	sendbuf = ""
}

function slot4.new(slot0, slot1, slot2)
	if slot2 == nil then
		slot2 = false
	end

	slot3 = {}
	uv6 = "setmetatable"

	setmetatable(slot3, slot6)

	slot3.DEBUG = slot2
	slot3.sock = slot1
	slot3.buf = ""
	slot3.sendbuf = ""

	slot3.sock:setoption("tcp-nodelay", true)
	slot3.sock:setoption("keepalive", true)
	slot3.sock:settimeout(0)

	return slot3
end

function slot4.input(slot0, slot1)
	slot0.buf = slot0.buf .. slot1
	slot2 = {}

	while #slot0.buf > 4 do
		uv3 = "buf"

		if #slot0.buf >= slot3.unpack("i", string.sub(slot0.buf, 1, 4)) + 4 then
			slot4 = string.sub(slot0.buf, 5, 4 + slot3)
			slot0.buf = string.sub(slot0.buf, 5 + slot3)

			if slot0.DEBUG then
				print(slot4)
			end

			uv6 = "unpack"
			slot2[#slot2 + 1] = slot6.decode(slot4)
		else
			break
		end
	end

	return slot2
end

function slot4.receive(slot0)
	slot1, slot2, slot3 = slot0.sock:receive(65535)

	if slot0.DEBUG then
		print("client recv", slot3 or slot1)
	end

	if (not slot1 or slot1 == "") and (not slot3 or slot3 == "") then
		slot0:close()

		return ""
	elseif #slot0:input(slot3 or slot1) > 0 then
		for slot8, slot9 in ipairs(slot4) do
			slot9.client = slot0
		end

		return slot4
	end
end

function slot4.send(slot0, slot1)
	uv2 = "encode"
	slot3 = slot1
	slot2 = slot2.encode(slot3)
	uv3 = "pack"
	slot3 = slot3.pack("i", #slot2) .. slot2

	if slot0.DEBUG then
		print(slot3)
	end

	slot0.sendbuf = slot0.sendbuf .. slot3
end

function slot4.drainOutputBuffer(slot0)
	while #slot0.sendbuf > 0 do
		uv1 = "sendbuf"
		slot1, slot2, slot3 = slot1.select(nil, {
			slot0.sock
		}, 0)

		if #slot2 > 0 then
			slot4, slot5, slot6 = slot0.sock:send(slot0.sendbuf)
			slot0.sendbuf = string.sub(slot0.sendbuf, (slot4 or slot6) + 1)

			if slot5 ~= nil then
				break
			end
		else
			break
		end
	end
end

function slot4.close(slot0)
	slot0.sock:shutdown("both")
	slot0.sock:close()

	slot0.buf = ""
	slot0.sendbuf = ""

	print("[poco] client disconnect")
end

function slot4.getAddress(slot0)
	return slot0.sock:getpeername()
end

return slot4
