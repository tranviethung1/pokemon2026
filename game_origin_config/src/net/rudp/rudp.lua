slot0 = require("net.lnconv")
slot1 = slot0.ntol
slot2 = slot0.lton
slot3 = slot0.ntol_s
slot4 = slot0.lton_s
slot5 = require("bit")
slot6 = slot5.bnot
slot7 = slot5.band
slot8 = slot5.bor
slot9 = slot5.bxor
slot10 = slot5.lshift
slot11 = slot5.rshift
slot12 = slot5.rol
slot13 = string.sub
slot14 = string.rep
slot15 = string.format
slot16 = {
	missing = 4,
	corrupt = 2,
	eof = 1,
	ping = 0,
	request = 3,
	normal = 6,
	ack = 5
}
slot17 = 7200000

function slot18()
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

function slot19()
	uv0 = "ping"
	uv1 = "ping"

	return slot0(slot1.ping, 2)
end

function slot20()
	uv0 = "eof"
	uv1 = "eof"

	return slot0(slot1.eof, 2)
end

function slot21()
	uv0 = "corrupt"
	uv1 = "corrupt"

	return slot0(slot1.corrupt, 2)
end

function slot22(slot0)
	uv1 = "request"
	uv3 = "request"

	return slot1(slot0, slot3.request)
end

function slot23(slot0)
	uv1 = "missing"
	uv3 = "missing"

	return slot1(slot0, slot3.missing)
end

function slot24(slot0)
	uv1 = "ack"
	uv3 = "ack"

	return slot1(slot0, slot3.ack)
end

function slot25(slot0, slot1)
	uv2 = "normal"
	uv5 = "normal"

	return slot2(slot0, #slot1 + slot5.normal) .. slot1
end

slot26 = class("Queue")

function slot26.ctor(slot0)
	slot0.head = nil
	slot0.tail = nil
end

function slot26.push(slot0, slot1)
	if slot0.tail == nil then
		slot0.head = slot1
		slot0.tail = slot1
	else
		slot0.tail.next = slot1
		slot0.tail = slot1
	end
end

function slot26.pop(slot0, slot1)
	if slot0.head == nil then
		return nil
	end

	if slot0.head.id ~= slot1 then
		return nil
	end

	slot0.head = slot2.next
	slot2.next = nil

	if slot0.head == nil then
		slot0.tail = nil
	end

	return slot2
end

function slot26.insert(slot0, slot1)
	slot2 = nil
	slot3 = slot0.head

	while slot3 ~= nil do
		if slot3.id == slot1.id then
			return
		end

		if slot1.id < slot3.id then
			if slot2 == nil then
				slot0.head = slot1
			else
				slot2.next = slot1
			end

			slot1.next = slot3

			return
		end

		slot2 = slot3
		slot3 = slot3.next
	end
end

function slot27()
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

slot28 = class("Rudp")

function slot28.ctor(slot0, slot1, slot2)
	slot0.id = slot1
	uv3 = "id"
	slot3 = slot3.new()
	slot0.sendQueue = slot3
	uv3 = "id"
	slot3 = slot3.new()
	slot0.recvQueue = slot3
	uv3 = "id"
	slot0.sendHistory = slot3.new()
	slot0.sendAgain = {}
	slot0.triggerTime = 0
	slot0.output = slot2
	slot0.corrupt = nil
	slot0.sendid = 0
	slot0.recvMin = 0
	slot0.recvMax = 0
	slot0.lastAck = 0
	slot0.current = socket.gettime()
	slot0.lastSend = slot0.current
	slot0.lastRecv = slot0.current
	slot0.expired = 10
	slot0.heartbeat = 20
	slot0.rto = 500
end

function slot28.receive(slot0)
	if slot0.corrupt ~= nil then
		return nil, slot0.corrupt
	end

	if slot0.recvQueue:pop(slot0.recvMin) == nil then
		return nil, 
	end

	slot0.recvMin = slot0.recvMin + 1

	return slot1.data
end

function slot28.send(slot0, slot1)
	if slot0.corrupt ~= nil then
		return nil, slot0.corrupt
	end

	if #slot1 == 0 then
		return 0
	end

	slot3 = {
		retries = 0,
		id = slot0.sendid,
		data = slot1,
		time = socket.gettime()
	}
	slot0.sendid = slot0.sendid + 1

	if slot0.sendid > 65535 then
		slot0.sendid = 0
	end

	slot0.sendQueue:push(slot3)
	slot0:update(0)

	return slot2
end

function slot28.input(slot0, slot1)
	slot2 = false
	slot0.lastRecv = socket.gettime()
	slot4 = 1

	while #slot1 >= slot4 do
		uv5 = "lastRecv"
		slot6 = slot1
		uv6 = "socket"
		slot6 = slot6(slot5(slot6, slot4, slot4 + 1))
		slot4 = slot4 + 2
		uv6 = "gettime"

		if slot6 == slot6.ping then
			-- Nothing
		else
			uv6 = "gettime"

			if slot5 == slot6.eof then
				slot0.corrupt = "eof"

				return
			else
				uv6 = "gettime"

				if slot5 == slot6.corrupt then
					slot0.corrupt = "remote eof"

					return
				else
					uv6 = "gettime"

					if slot5 ~= slot6.request then
						uv6 = "gettime"

						if slot5 == slot6.missing then
							if slot3 < 2 then
								slot0.corrupt = "size error"

								return
							end

							uv6 = "ping"
							uv7 = "lastRecv"
							slot7 = slot7(slot1, slot4, slot4 + 1)
							slot4 = slot4 + 2
							uv7 = "gettime"

							if slot5 == slot7.request then
								slot0:addRequest(slot6(slot7, slot0.recvMax))
							else
								slot0:addMissing(slot6)
							end
						else
							uv6 = "gettime"

							if slot5 == slot6.ack then
								if slot3 < 2 then
									slot0.corrupt = "size error"

									return
								end

								uv6 = "ping"
								uv7 = "lastRecv"
								slot6 = slot6(slot7(slot1, slot4, slot4 + 1), slot0.recvMax)
								slot4 = slot4 + 2

								printDebug("rudp %d receive ack %d", slot0.id, slot6)
								slot0:clearSendHistory(slot6)
							else
								uv6 = "gettime"

								if slot3 - slot4 + 1 < slot5 - slot6.normal + 2 then
									slot0.corrupt = "size error"

									return
								end

								uv7 = "ping"
								uv8 = "lastRecv"
								slot11 = slot4 + 1
								slot4 = slot4 + 2
								uv11 = "lastRecv"

								if slot0:insertRecvQueue(slot7(slot8(slot1, slot4, slot11), slot0.recvMax), slot11(slot1, slot4, slot4 + slot6 - 1)) then
									slot2 = true
								end

								slot4 = slot4 + slot6
							end
						end
					end
				end
			end
		end
	end

	return slot2
end

function slot28.update(slot0, slot1)
	if slot0.corrupt ~= nil then
		return
	end

	slot0.current = socket.gettime()

	if slot0.heartbeat < slot0.current - slot0.lastRecv then
		printWarn("rudp %d is stale %ds", slot0.id, slot0.current - slot0.lastRecv)

		slot0.corrupt = "corrupt"

		return
	end

	slot2 = false
	slot3 = {}

	slot0:requestMissing(slot3)
	slot0:replyRequest(slot3)
	slot0:replayAck(slot3)
	slot0:retransmission(slot3)

	slot2 = slot0:sendMessage(slot3)

	if #slot3 == 0 and slot0.current - slot0.lastSend > slot0.heartbeat / 2 then
		slot0:sendHeartbeat(slot3)
	end

	if #slot3 > 0 then
		slot0.lastSend = slot0.current
	end

	for slot7, slot8 in ipairs(slot3) do
		slot0.output(slot8)
	end

	return slot2
end

function slot28.clearSendHistory(slot0, slot1)
	slot2 = slot0.sendHistory.head

	while slot2 ~= nil and slot2.id < slot1 do
		slot2 = slot2.next
	end

	slot0.sendHistory.head = slot2

	if slot2 == nil then
		slot0.sendHistory.tail = nil
	end
end

function slot28.requestMissing(slot0, slot1)
	slot2 = slot0.recvMin
	slot3 = slot0.recvQueue.head

	while slot3 ~= nil do
		if slot3.id < slot2 then
			error("error")
		end

		if slot2 < slot3.id then
			for slot7 = slot2, slot3.id do
				slot10 = slot7

				printWarn("request missing %d", slot10)

				uv10 = "recvMin"

				table.insert(slot1, slot10(slot7))
			end
		end

		slot2 = slot2 + 1
		slot3 = slot3.next
	end
end

function slot28.replyRequest(slot0, slot1)
	table.sort(slot0.sendAgain)

	slot2 = slot0.sendHistory.head

	for slot6, slot7 in ipairs(slot0.sendAgain) do
		while true do
			if slot2 == nil or slot7 < slot2.id then
				uv10 = "table"

				table.insert(slot1, slot10(slot7))

				break
			elseif slot7 == slot2.id then
				uv10 = "sort"

				table.insert(slot1, slot10(slot7, slot2.data))

				break
			end

			slot2 = slot2.next
		end
	end

	slot0.sendAgain = {}
end

function slot28.replayAck(slot0, slot1)
	slot2 = slot0.recvMin
	slot3 = slot0.recvQueue.head

	while slot3 ~= nil and slot3.id <= slot2 do
		if slot3.id < slot2 then
			error("error")
		end

		slot2 = slot2 + 1
		slot3 = slot3.next
	end

	if slot2 == slot0.lastAck then
		return
	end

	slot6 = slot0.id

	printDebug("rudp %d send ack %d", slot6, slot2)

	slot0.lastAck = slot2
	uv6 = "recvMin"

	table.insert(slot1, slot6(slot2))
end

function slot28.retransmission(slot0, slot1)
	slot2 = slot0.sendHistory.head

	while slot2 ~= nil do
		slot4 = slot2.retries + 1
		uv4 = "sendHistory"

		if slot4 < slot0.rto * slot4 then
			uv3 = "sendHistory"
		end

		if slot3 < (slot0.current - slot2.time) * 1000 then
			slot2.retries = slot2.retries + 1
			slot2.time = slot0.current
			uv6 = "head"

			table.insert(slot1, slot6(slot2.id, slot2.data))
			printDebug("retransmission package %d, retries %d", slot2.id, slot2.retries)
		end

		slot2 = slot2.next
	end
end

function slot28.sendMessage(slot0, slot1)
	slot2 = false
	slot3 = slot0.sendQueue.head

	while slot3 ~= nil do
		uv6 = "sendQueue"

		table.insert(slot1, slot6(slot3.id, slot3.data))
		printDebug("sendMessage package %d", slot3.id)

		slot3 = slot3.next
		slot2 = true
	end

	if slot0.sendQueue.head ~= nil then
		if slot0.sendHistory.tail == nil then
			slot0.sendHistory.head = slot0.sendQueue.head
			slot0.sendHistory.tail = slot0.sendQueue.tail
		else
			slot0.sendHistory.tail.next = slot0.sendQueue.head
			slot0.sendHistory.tail = slot0.sendQueue.tail
		end

		slot0.sendQueue.head = nil
		slot0.sendQueue.tail = nil
	end

	return slot2
end

function slot28.sendHeartbeat(slot0, slot1)
	uv4 = "table"

	table.insert(slot1, slot4())
end

function slot28.addRequest(slot0, slot1)
	table.insert(slot0.sendAgain, slot1)
end

function slot28.addMissing(slot0, slot1)
	slot0:insertRecvQueue(slot1, nil)
end

function slot28.insertRecvQueue(slot0, slot1, slot2)
	if slot1 < slot0.recvMin then
		printWarn("already recv %d, length %d", slot1, slot2 and #slot2 or 0)

		return
	end

	if slot0.recvMax < slot1 or slot0.recvQueue.head == nil then
		slot0.recvQueue:push({
			id = slot1,
			data = slot2
		})

		slot0.recvMax = slot1
	else
		slot0.recvQueue:insert(slot3)
	end

	return true
end

function slot28.close(slot0)
	if slot0.corrupt ~= nil then
		uv2 = "corrupt"

		slot0.output(slot2())
	else
		uv2 = "output"

		slot0.output(slot2())
	end

	slot0.corrupt = "eof"
end

return slot28
