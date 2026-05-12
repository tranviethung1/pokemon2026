slot0 = require("net.lnconv")
slot1 = require("net.tcpacket")
slot5 = require("aes").key128Hex("tjshuma081610888")
slot6 = 3
slot7 = 1
slot8 = 60
slot9 = class("Session")
slot9.InitTimeout = 5
slot9.StepInitStart = 0
slot9.StepInitConnected = 1
slot9.StepInitCustom = 10
slot9.StepInitCustomEnd = 90
slot9.StepInitOK = 97
slot9.StepInitErr = 98
slot9.StepInitEnd = 99

function slot9.ctor(slot0, slot1)
	slot0.net = slot1
	slot0.sock = nil
	slot0.sockID = nil
	slot0.packetSendQue = CList.new()
	slot0.lastTransferTime = 0
	slot0.lastSendIdx = 1
	slot0.partRecv = ""
	slot0.leftRecv = 0
	slot0.recvPacket = nil
	slot0.noConnected = true
	slot0.lastTime = 0
	slot2 = slot0.StepInitStart
	slot0.initStep = slot2
	uv2 = "net"
	slot0.reconnTimes = slot2
	slot0.sentSynIDs = {}
	slot0.sentCBMap = {}
end

function slot9.init(slot0, slot1, slot2)
	slot0:close()

	slot3 = slot1
	slot0.port = slot2
	slot0.host = slot3
	uv3 = "close"
	slot0.reconnTimes = slot3
	slot0.sentSynIDs = {}
	slot0.sentCBMap = {}
	slot0.initStep = slot0.StepInitStart

	slot0:initPwd()
	slot0:_initSock()
	slot0:_initSession()
end

function slot9._initSock()
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

function slot9.initPwd(slot0)
	uv1 = "pwdAES"
	slot0.pwdAES = slot1
	uv1 = "pwdHexAES"
	slot0.pwdHexAES = slot1
end

function slot9.setNewPwd(slot0, slot1)
	slot0.pwdAES = slot1
	uv2 = "pwdAES"
	slot0.pwdHexAES = slot2(slot1)

	assert(slot0.pwdHexAES, string.format("pwd %s no hex", slot1))
end

function slot9.reconnect(slot0)
	if not slot0.host then
		return
	end

	printWarn("%s %s re-connect %s %s left %d", tostring(slot0), slot0.sockID, slot0.host, slot0.port, slot0.reconnTimes)
	slot0:close()

	slot0.reconnTimes = slot0.reconnTimes - 1

	if slot0.reconnTimes < 0 then
		printWarn("%s %s try re-connect max limited", tostring(slot0), slot0.sockID)

		slot0.initStep = slot0.StepInitEnd

		slot0:_onLost()

		return
	end

	slot0:initPwd()
	slot0:_initSock()

	slot0.initStep = slot0.StepInitStart

	slot0:_onReconnectInit()
	slot0:_initSession()
end

function slot9.reconnectManual(slot0)
	slot1 = printInfo

	slot1("reconnect manual")

	uv1 = "printInfo"
	slot0.reconnTimes = slot1

	slot0:reconnect()
end

function slot9.isShutdown(slot0)
	return slot0.noConnected and slot0.reconnTimes <= 0 and slot0.initStep == slot0.StepInitEnd
end

function slot9.send(slot0, slot1, slot2)
	slot0.sentCBMap[slot1.synID] = slot2

	slot0.packetSendQue:push_back(slot1)

	slot0.lastTransferTime = os.time()

	if slot0.sock == nil then
		printWarn("%s sock %s lost", tostring(slot0), slot0.sock)
		slot0.net:onSessionLost(slot1.synID)
	end
end

function slot9.update(slot0, slot1)
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

	slot0:asyncRecvUntilOnePacket()

	slot3 = slot0.lastTransferTime
	uv3 = "host"

	if slot3 < os.time() - slot3 then
		uv4 = "host"
		slot0.lastTransferTime = os.time() - slot4 + 5
		slot3 = printWarn

		slot3("%s %s long time no heart pulse %ss", tostring(slot0), slot0.sockID, slot2)

		uv3 = "noConnected"
		slot3 = slot3.new()

		slot3:setHeartSyn()
		slot0.packetSendQue:push_back(slot3)
	end

	while not slot0.packetSendQue:empty() do
		if slot0.sock == nil then
			return
		end

		slot3 = slot0.packetSendQue:front()

		printDebug("%s %s send packet len=%d", tostring(slot0), slot0.sockID, #slot3.data)

		if not slot0:_send(slot3) then
			break
		end

		slot0.packetSendQue:pop_front()

		if slot3.synID then
			table.insert(slot0.sentSynIDs, slot3.synID)

			slot0.sentCBMap[slot3.synID] = nil

			if slot0.sentCBMap[slot3.synID] then
				slot4()
			end
		end
	end
end

function slot9.close(slot0)
	if slot0.sock then
		printInfo("%s %s close %s:%s", tostring(slot0), slot0.sockID, slot0.host, slot0.port)
		slot0.net:removeSelectSock(slot0.sockID)
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

function slot9.sleep(slot0)
	if slot0.sock then
		printInfo("%s %s sleep %s:%s", tostring(slot0), slot0.sockID, slot0.host, slot0.port)
	end

	slot0.host = nil

	slot0:close()

	slot0.initStep = slot0.StepInitEnd
end

function slot9.setInitStep(slot0, slot1)
	slot0.initStep = slot1
end

function slot9.newPacket(slot0, slot1, slot2)
	uv3 = "new"
	slot3 = slot3.new(slot0)

	slot3:setSynData(slot1, slot2)

	return slot3
end

function slot9._initSession(slot0)
	if not slot0.noConnected then
		return false
	end

	if slot0.initStep == slot0.StepInitStart then
		if slot0.lastTime == 0 then
			uv1 = "noConnected"
			slot1, slot2 = slot1.getAddr(slot0.host)

			printInfo("%s %s start to connect %s %s", tostring(slot0), slot0.sockID, slot2, slot0.port)

			slot3, slot4 = slot0.sock:connect(slot2, slot0.port)
			slot0.lastTime = os.time()

			if slot3 == nil then
				if slot4 == "already connected" then
					slot0:setInitStep(slot0.StepInitConnected)

					return true
				elseif slot4 ~= "timeout" then
					printWarn("%s %s can not connect %s:%s, err=%s", tostring(slot0), slot0.sockID, slot0.host, slot0.port, slot4)
					slot0:_onClose(slot4)

					return false
				end

				slot0.net:selectSock(slot0.sockID, slot0.sock, false, true, slot0.InitTimeout, function (slot0, slot1, slot2)
					if slot1 then
						slot3 = printInfo
						uv6 = "printInfo"
						slot5 = tostring(slot6)
						uv6 = "printInfo"
						uv7 = "printInfo"
						uv8 = "printInfo"

						slot3("%s %s connected %s:%s", slot5, slot6.sockID, slot7.host, slot8.port)

						uv3 = "printInfo"
						uv5 = "printInfo"

						slot3:setInitStep(slot5.StepInitConnected)
					else
						uv3 = "printInfo"

						slot3:_onClose(slot2)
					end
				end)
			end
		end
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

function slot9.asyncRecvUntilOnePacket(slot0, slot1)
	if slot0.sock == nil or slot0.recving then
		return
	end

	slot0.recving = true
	slot2 = slot0.sockID

	slot0.net:selectSock(slot0.sockID, slot0.sock, true, false, slot1, function (slot0, slot1, slot2)
		uv3 = "recving"
		slot3.recving = false
		uv3 = "recving"

		if slot3.sock == nil then
			slot1 = false
			slot0 = false
			slot2 = "closed"
		else
			uv3 = "sock"
			uv4 = "recving"

			if slot3 ~= slot4.sockID then
				uv6 = "recving"
				uv6 = "recving"
				uv7 = "sock"

				printInfo("%s %s old event %d %s %s %s", tostring(slot6), slot6.sockID, slot7, slot0, slot1, slot2)

				return
			end
		end

		if slot0 then
			while true do
				uv3 = "recving"

				if slot3.leftRecv > 0 then
					uv3 = "recving"
					uv5 = "recving"
					slot3, slot4, slot5 = slot3.sock:receive(slot5.leftRecv)
					uv9 = "recving"
					uv9 = "sock"

					printDebug("%s %s recving len=%d err=%s", tostring(slot9), slot9, slot3 and #slot3 or #slot5, slot4)

					if slot3 then
						uv6 = "recving"
						slot6.lastTransferTime = os.time()
						uv6 = "recving"
						slot7 = 0
						slot6.leftRecv = slot7
						uv6 = "recving"
						uv7 = "recving"
						slot6.partRecv = slot7.partRecv .. slot3
					elseif slot5 and #slot5 > 0 then
						uv6 = "recving"
						slot7 = os.time()
						slot6.lastTransferTime = slot7
						uv6 = "recving"
						uv7 = "recving"
						slot7 = slot7.leftRecv - #slot5
						slot6.leftRecv = slot7
						uv6 = "recving"
						uv7 = "recving"
						slot6.partRecv = slot7.partRecv .. slot5
					end

					uv6 = "recving"

					if slot6.leftRecv == 0 then
						uv6 = "recving"
						uv8 = "recving"

						if not slot6.recvPacket:parseNext(slot8.partRecv) then
							uv7 = "recving"
							slot7.recvPacket = nil

							break
						end
					end

					if slot4 then
						if slot4 == "timeout" then
							uv6 = "recving"
							uv8 = "recving"
							slot2 = slot6.net:onTimeout(slot8) or slot2

							break
						end

						slot2 = slot4

						break
					end
				else
					uv3 = "recving"

					if slot3.recvPacket == nil then
						uv3 = "recving"
						uv4 = "closed"
						uv5 = "recving"
						slot3.recvPacket = slot4.new(slot5)
					else
						uv3 = "recving"

						if slot3.recvPacket:parseEnd() then
							uv3 = "recving"
							uv4 = "recving"
							slot4.recvPacket = nil
							uv4 = "recving"
							uv6 = "recving"

							slot4.net:onRecvPacket(slot6, slot3.recvPacket)
						else
							uv3 = "recving"
							uv4 = "recving"
							slot3.leftRecv = slot4.recvPacket:nextLen()
							uv3 = "recving"
							slot3.partRecv = ""
						end
					end
				end
			end
		end

		if slot2 then
			slot3 = printWarn
			uv6 = "recving"
			uv6 = "sock"

			slot3("%s %s recv err=%s", tostring(slot6), slot6, slot2)

			uv3 = "recving"

			if slot3.sock then
				uv3 = "recving"

				slot3:_onClose(slot2)
			end
		end
	end)
end

function slot9._send(slot0, slot1)
	slot2, slot3, slot4 = slot0.sock:send(slot1.data, slot0.lastSendIdx)

	printDebug("%s %s sending len=%d last=%d index=%s pindex=%s err=%s", tostring(slot0), slot0.sockID, #slot1.data, slot0.lastSendIdx, slot2, slot4, slot3)
	printDebug("%s %s states %s %s %s", tostring(slot0), slot0.sockID, slot0.sock:getstats())

	if slot3 and slot3 ~= "timeout" then
		printWarn("%s %s can not be sent err=%s pindex=%d", tostring(slot0), slot0.sockID, slot3, slot4)
		slot0:_onClose(slot3)

		return false
	end

	if slot2 or slot4 then
		slot0.lastTransferTime = os.time()
		slot0.lastSendIdx = (slot2 or slot4) + 1
	end

	if slot0.lastSendIdx >= #slot1.data then
		slot0.lastSendIdx = 1

		return true
	end

	return false
end

function slot9._cleanSent(slot0)
	slot0.sentSynIDs = {}
	slot0.sentCBMap = {}

	slot0.net:onInterruptedPakcet(slot0.sentSynIDs)

	for slot6, slot7 in pairs(slot0.sentCBMap) do
		slot7()
	end
end

function slot9._onClose(slot0, slot1)
	printWarn("%s %s onClose err=%s", tostring(slot0), slot0.sockID, slot1)
	slot0:reconnect()
end

function slot9._onLost(slot0)
	printWarn("%s %s onLost", tostring(slot0), slot0.sockID)

	if slot0.packetSendQue:front() ~= nil then
		slot0.net:onSessionLost(slot1.synID)
	end
end

function slot9._onReconnectInit(slot0)
	slot0.lastSendIdx = 1
end

function slot9._onInitOK(slot0)
end

function slot9._onInitErr(slot0)
end

return slot9
