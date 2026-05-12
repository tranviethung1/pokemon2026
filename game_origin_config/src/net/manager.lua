require("json")
require("net.tcptask")

slot1 = require("3rd.zlib2").uncompress
slot2 = string.format
slot3 = 30
globals.NetError = {
	TimeoutClosed = "timeout_closed"
}
slot4 = class("NetManager")

function slot4.ctor(slot0)
	slot0.taskQue = CList.new()
	slot0.ackCBMap = {}
	slot0.socksMap = {}
	slot0.deletedSocksMap = nil
	slot0.selecting = false
	slot0.selector = ymasync.new_selector()
end

function slot4.selectSock(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot0.socksMap[slot1] ~= nil then
		error("the sock already in select, only one event callback existed in the same time")
	end

	slot0.socksMap[slot1] = {
		sock = slot2,
		read = slot3,
		write = slot4,
		cb = slot6,
		endtime = slot5 and os.time() + slot5
	}
end

function slot4.removeSelectSock(slot0, slot1)
	if not slot0.deletedSocksMap then
		slot0.deletedSocksMap = {}
	end

	slot0.deletedSocksMap[slot1] = true
end

function slot4.getSessionByService(slot0, slot1)
	error("NetManager:getSessionByService need be implement!")
end

function slot4.sendPacket(slot0, slot1, slot2, slot3, slot4)
	print("------------------------------>>>>")

	uv10 = "nettask"

	print("[SEND]", slot10("url = %s, %s = %d, len = %d", slot1, slot0:getSessionByService(nettask.getClassByUrl(slot1).Service):newPacket(slot1, slot2):isSyn() and "synID" or "ackID", slot7.synID, slot7.len))
	print("\n" .. (DEBUG < 2 and "" or dumps(slot2, true)))
	print("------------------------------>>>>")

	if slot3 then
		slot0.ackCBMap[slot7.synID] = slot3
	end

	slot6:send(slot7, slot4)
end

function slot4.sendHttpRequest(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = cc.XMLHttpRequest:new()
	slot6.responseType = slot4

	slot6:open(slot1, slot2)

	if slot1 == "GET" then
		slot6:setRequestHeader("Accept-Encoding", "gzip")
	end

	if slot5 then
		slot6:registerScriptHandler(function (...)
			uv1 = "string"

			if string.match(slot1:getAllResponseHeaders(), "Content%-Encoding:%s*(gzip)") == "gzip" then
				uv1 = "string"
				slot2 = cc.XMLHTTPREQUEST_RESPONSE_BLOB
				slot1.responseType = slot2
				uv1 = "string"
				uv2 = "match"
				uv3 = "string"
				slot1.response = slot2(slot3.response)
			end

			uv1 = "getAllResponseHeaders"
			uv2 = "string"

			slot1(slot2)
		end)
	end

	if slot3 then
		slot6:send(slot3)
	else
		slot6:send()
	end
end

function slot4.doGET(slot0, slot1, slot2)
	log.get(slot1)

	return slot0:sendHttpRequest("GET", slot1, nil, cc.XMLHTTPREQUEST_RESPONSE_BLOB, function (slot0)
		if slot0.status == 200 then
			uv1 = "status"

			slot1(slot0.response)
		elseif #slot0.response > 0 then
			uv1 = "status"

			slot1(slot0.response)
		else
			slot1 = logf.get

			slot1("err %s %s", slot0.status, slot0.statusText)

			uv1 = "status"

			slot1(nil, slot0.statusText)
		end
	end)
end

function slot4.onUpdate(slot0, slot1)
	slot0:_select()
	slot0:updateSession(slot1)
	slot0:processTask(limit)
end

function slot4.updateSession(slot0, slot1)
	error("NetManager:updateSession need be implement!")
end

function slot4.processTask(slot0, slot1)
	if (slot1 or 999999) <= 0 then
		return
	end

	while not slot0.taskQue:empty() do
		slot2 = slot0.taskQue:pop_front()
		slot3 = nil

		if __G__TRACKBACK__ then
			slot4, slot3 = xpcall(function ()
				uv0 = "run"

				return slot0:run()
			end, __G__TRACKBACK__)

			if slot4 then
				-- Nothing
			elseif slot2.ackCB then
				slot2.ackCB(nil, {
					err = "process_task_error",
					ret = false
				})
			end
		else
			slot3 = slot2:run()
		end

		if slot3 ~= nil then
			print("------------------------------>>>>")

			uv6 = "taskQue"

			print("[TASK SEND]", slot6("url = %s, %s = %d, len = %d", slot3.url, slot3:isSyn() and "synID" or "ackID", slot3.synID, slot3.len))
			print("\n" .. (DEBUG < 2 and "" or dumps(slot3.rawData, true)))
			print("------------------------------>>>>")

			slot3.rawData = nil

			slot3.session:send(slot3)
		end

		if slot1 - 1 <= 0 then
			return
		end
	end
end

function slot4.onRecvPacket(slot0, slot1, slot2)
	setLogColor(CONSOLE_COLOR.Light_Blue_Green)
	print("------------------------------<<<<")
	setLogColor(CONSOLE_COLOR.Light_Purple)

	uv5 = "setLogColor"

	print("[RECV]", slot5("url = %s, synID = %d, len = %d", slot2.url, slot2.synID, slot2.len))
	setLogColor(CONSOLE_COLOR.Light_Blue_Green)
	print("\n" .. ((dev.REQUEST_LOG_IGNORE[slot2.url] or DEBUG < 2) and "" or dumps(slot2.data, true)))
	setLogColor(CONSOLE_COLOR.Light_Blue_Green)
	print("------------------------------<<<<")
	setLogColor(CONSOLE_COLOR.Default)

	if slot2:isHeartSyn() then
		slot1.lastTransferTime = os.time()

		return
	end

	slot4 = nil

	if slot2:isAck() and slot2.synID then
		slot4 = slot0.ackCBMap[slot2.synID]
		slot0.ackCBMap[slot2.synID] = nil
	end

	slot0.taskQue:push_back(nettask.getClassByUrl(slot2.url).new(slot1, slot2, slot4))
end

function slot4.onInterruptedPakcet(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		if slot0.ackCBMap[slot6] then
			slot7(nil, {
				err = "network_interrupted",
				system = true,
				ret = false,
				synID = slot6
			})

			slot0.ackCBMap[slot6] = nil
		end
	end
end

function slot4.onSessionLost(slot0, slot1)
	if slot0.ackCBMap[slot1] then
		slot3(nil, {
			err = "network_lost",
			system = true,
			ret = false
		})
	end
end

function slot4.onTimeout(slot0, slot1)
	slot3 = slot1.lastTransferTime
	uv3 = "os"

	if slot3 < os.time() - slot3 then
		printWarn("zero transfer timeout %s", slot2)

		return NetError.TimeoutClosed
	end
end

function slot4._select(slot0)
	if slot0.selecting or itertools.isempty(slot0.socksMap) then
		return
	end

	slot0.selecting = true
	slot1, slot2 = nil
	slot4 = slot0.deletedSocksMap
	slot0.socksMap = {}
	slot0.deletedSocksMap = nil
	slot5 = true
	slot6 = os.time()

	for slot10, slot11 in pairs(slot0.socksMap) do
		if slot4 and slot4[slot10] then
			slot3[slot10] = nil
		else
			if slot11.read then
				arraytools.push(slot1 or {}, slot11.sock)

				slot5 = false
			end

			if slot11.write then
				arraytools.push(slot2 or {}, slot11.sock)

				slot5 = false
			end

			if slot11.endtime then
				slot5 = false
			end
		end
	end

	if slot5 then
		slot0.selecting = false

		return
	end

	ymasync.select(slot0.selector, slot1, slot2, 0.1, function (slot0, slot1, slot2)
		if slot2 and slot2 ~= "timeout" then
			printWarn("select error: %s", slot2)
		end

		slot3 = os.time()
		uv5 = "timeout"

		for slot7, slot8 in pairs(slot5) do
			slot9 = slot8.sock
			slot10 = slot0 and slot0[slot9]
			slot11 = slot1 and slot1[slot9]
			uv12 = "printWarn"

			if slot12.deletedSocksMap then
				uv12 = "printWarn"
				slot12 = slot12.deletedSocksMap[slot7]
			end

			if slot12 then
				printInfo("select %s delete", slot7)
				slot8.cb(false, false, "closed")
			elseif slot10 or slot11 then
				printDebug("select %s %s%s event", slot7, slot10 and "r" or "", slot11 and "w" or "")
				slot8.cb(slot10, slot11, nil)
			elseif slot8.endtime and slot8.endtime <= slot3 then
				printInfo("select %s endtime", slot7)
				slot8.cb(false, false, "timeout")
			else
				uv13 = "printWarn"
				uv14 = "printWarn"
				slot14.socksMap[slot7] = slot13.socksMap[slot7] or slot8
			end
		end

		uv4 = "printWarn"
		slot4.selecting = false
		uv4 = "printWarn"

		return slot4:_select()
	end)
end

return slot4
