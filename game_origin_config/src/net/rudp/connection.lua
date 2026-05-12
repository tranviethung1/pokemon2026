slot1 = 512 - 4
slot2 = 120
slot3 = string.sub
slot4 = class("Connection")
slot5 = 1

function slot4.ctor()
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

function slot4.init(slot0)
	slot0.sock = socket.udp()

	slot0.sock:settimeout(0)
end

function slot4.connect(slot0, slot1, slot2)
	if not slot0.sock:setpeername(slot1, slot2) then
		return nil, "setpeername error"
	end

	return 1
end

function slot4.close(slot0)
	if slot0.sock then
		slot0.rudp:close()
		slot0.sock:close()

		slot0.sock = nil
	end
end

function slot4.receive(slot0, slot1)
	while true do
		slot2, slot3 = slot0.rudp:receive()

		if slot3 ~= nil then
			printWarn("receive from rudp error", slot3)

			return nil, slot3, nil
		end

		if slot2 then
			if slot0.recvbuf == nil then
				slot0.recvbuf = slot2
			else
				slot0.recvbuf = slot0.recvbuf .. slot2
			end
		else
			break
		end
	end

	if slot0.recvbuf == nil or #slot0.recvbuf == 0 then
		return nil, "timeout", nil
	end

	if #slot0.recvbuf == slot1 then
		slot0.recvbuf = nil

		return slot0.recvbuf, nil, 
	elseif slot1 > #slot0.recvbuf then
		slot0.recvbuf = nil

		return nil, , slot0.recvbuf
	else
		uv2 = "rudp"
		slot3 = slot0.recvbuf
		uv3 = "rudp"
		slot0.recvbuf = slot3(slot0.recvbuf, slot1 + 1)

		return slot2(slot3, 1, slot1), nil, 
	end
end

function slot4.send(slot0, slot1)
	slot2 = 0
	slot3 = 1

	while slot3 <= #slot1 do
		uv6 = "rudp"
		uv9 = "send"
		slot4, slot5 = slot0.rudp:send(slot6(slot1, slot3, slot3 + slot9 - 1))

		if slot5 ~= nil then
			return nil, slot5
		end

		uv6 = "send"
		slot3 = slot3 + slot6
		slot2 = slot2 + slot4
	end

	return slot2
end

function slot4.rudpInput(slot0, slot1)
	printDebug("rudp connection input %d", #slot1)

	if slot0.rudp:input(slot1) then
		slot0.alivetime = os.time()
	end
end

function slot4.output(slot0, slot1)
	slot2, slot3 = slot0.sock:send(slot1)

	printDebug("rudp connection output %d %s", #slot1, slot3)
end

function slot4._recv(slot0)
	slot1, slot2 = slot0.sock:receive()

	if slot1 then
		slot0:rudpInput(slot1)
	end

	if slot2 then
		if slot2 ~= "timeout" then
			printWarn("Session recv err=%s", slot2)
		end

		return false
	end

	return true
end

function slot4.update(slot0, slot1)
	if slot0.sock == nil then
		return
	end

	slot1 = slot1 * 1000

	while slot0:_recv() do
	end

	if slot0.rudp:update(slot1) then
		slot0.alivetime = os.time()
	end

	uv4 = "sock"

	if slot4 < os.time() - slot0.alivetime then
		printWarn("connection %d is idle, closing...", slot0.rudp.id)
		slot0:close()
	end

	if slot0.rudp.corrupt ~= nil then
		-- Nothing
	end
end

function slot4.getstats(slot0)
	return 0, 0, 0
end

return slot4
