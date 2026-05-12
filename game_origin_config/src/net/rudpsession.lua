slot0 = require("net.lnconv")
slot1 = require("net.tcpacket")
slot2 = require("net.rudp.connection")
slot3 = 1
slot5 = class("Session", require("net.tcpsession"))

function slot5._initSock()
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

function slot5._initSession(slot0)
	if not slot0.noConnected then
		return false
	end

	if slot0.initStep == slot0.StepInitStart then
		if slot0.lastTime == 0 then
			slot1, slot2 = slot0.sock:connect(slot0.host, slot0.port)
			slot0.lastTime = os.time()

			if slot1 == nil then
				if slot2 == "already connected" then
					slot0:setInitStep(slot0.StepInitConnected)

					return true
				elseif slot2 ~= "timeout" then
					printWarn("%s %s can not connect %s:%s, err=%s", tostring(slot0), slot0.sockID, slot0.host, slot0.port, slot2)
					slot0:_onClose(slot2)

					return false
				end
			end

			return true
		end

		slot0:setInitStep(slot0.StepInitConnected)
	elseif slot0.initStep == slot0.StepInitConnected then
		slot0:setInitStep(slot0.StepInitOK)
	elseif slot0.StepInitCustom <= slot0.initStep and slot0.initStep <= slot0.StepInitCustomEnd then
		return true
	elseif slot0.initStep == slot0.StepInitOK then
		slot0.noConnected = false

		slot0:setInitStep(slot0.StepInitEnd)
		slot0:_onInitOK()
	elseif slot0.initStep == slot0.StepInitErr then
		slot0:_onInitErr()
	end

	return false
end

function slot5.send(slot0, slot1, slot2)
	if slot0.sock == nil then
		printWarn("%s sock %s lost", tostring(slot0), slot0.sock)
		slot0.net:onSessionLost(slot1.synID)

		return
	end

	if not slot0.noConnected or slot1.url == "/onlinefight/login" then
		slot0.sentCBMap[slot1.synID] = slot2

		slot0.packetSendQue:push_back(slot1)

		slot0.lastTransferTime = os.time()
	else
		printWarn("%s sock %s connecting", tostring(slot0), slot0.sock)
		slot0.net:onSessionLost(slot1.synID)
	end
end

function slot5.update(slot0, slot1)
	if not slot0.host then
		return
	end

	if slot0.noConnected and slot0.initStep < slot0.StepInitEnd then
		slot2, slot3 = nil

		repeat
			slot4, slot3 = slot0:_initSession()
		until not slot4

		if not slot3 then
			return
		end
	end

	if slot0.sock == nil then
		return
	end

	slot0.sock:update(slot1)

	while slot0:_recv() do
	end

	while not slot0.packetSendQue:empty() do
		slot2 = slot0.packetSendQue:front()

		printDebug("%s %s send packet len=%d", tostring(slot0), slot0.sockID, #slot2.data)

		if not slot0:_send(slot2) then
			break
		end

		slot0.packetSendQue:pop_front()

		if slot2.synID then
			table.insert(slot0.sentSynIDs, slot2.synID)

			slot0.sentCBMap[slot2.synID] = nil

			if slot0.sentCBMap[slot2.synID] then
				slot3()
			end
		end
	end
end

function slot5._recv(slot0)
	if slot0.leftRecv > 0 then
		slot1, slot2, slot3 = slot0.sock:receive(slot0.leftRecv)

		if slot2 ~= "timeout" then
			printDebug("%s %s recving len=%d err=%s", tostring(slot0), slot0.sockID, slot1 and #slot1 or slot1 and #slot3 or 0, slot2)
		end

		if slot1 then
			slot0.lastTransferTime = os.time()
			slot0.leftRecv = 0
			slot0.partRecv = slot0.partRecv .. slot1
		elseif slot3 and #slot3 > 0 then
			slot0.lastTransferTime = os.time()
			slot0.leftRecv = slot0.leftRecv - #slot3
			slot0.partRecv = slot0.partRecv .. slot3
		end

		if slot0.leftRecv == 0 and not slot0.recvPacket:parseNext(slot0.partRecv) then
			slot0.recvPacket = nil
		end

		if slot2 then
			if slot2 ~= "timeout" then
				printWarn("%s %s recv err=%s", tostring(slot0), slot0.sockID, slot2)
				slot0:_onClose(slot2)
			end

			return false
		end
	elseif slot0.recvPacket == nil then
		uv1 = "leftRecv"
		slot0.recvPacket = slot1.new(slot0)
	elseif slot0.recvPacket:parseEnd() then
		slot0.recvPacket = nil

		slot0.net:onRecvPacket(slot0, slot0.recvPacket)
	else
		slot0.leftRecv = slot0.recvPacket:nextLen()
		slot0.partRecv = ""
	end

	return true
end

function slot5.close(slot0)
	if slot0.sock then
		printInfo("%s %s close %s:%s", tostring(slot0), slot0.sockID, slot0.host, slot0.port)
		slot0.sock:close()
	end

	slot0.sock = nil
	slot0.sockID = nil

	slot0:_cleanSent()

	slot0.lastSendIdx = 1
	slot0.partRecv = ""
	slot0.leftRecv = 0
	slot0.recvPacket = nil
	slot0.noConnected = true
	slot0.lastTime = 0
	slot0.initStep = slot0.StepInitEnd
end

function slot5._cleanSent(slot0)
	slot0.sentSynIDs = {}
	slot0.sentCBMap = {}
end

return slot5
