require("net.tcpacket")

slot0 = require("net.tcpacket")
slot1 = {
	classes = {},
	urls = {}
}
globals.nettask = slot1

function slot1.registerTask(slot0)
	uv1 = "classes"
	slot1 = slot1.classes
	slot1[type(slot0)] = slot0
	uv1 = "classes"
	slot1.urls[slot0.Url] = slot0
	slot0.Service = string.sub(slot0.Url, 2, string.find(slot0.Url, "/", 2) - 1)

	printInfo("%s task be register %s for %s", tostring(slot0), slot0.Url, slot0.Service)
end

function slot1.registerTasks(slot0)
	for slot4, slot5 in ipairs(slot0) do
		uv6 = "ipairs"

		slot6.registerTask(slot5)
	end
end

function slot1.registerDefaultTask(slot0)
	uv1 = "default"
	slot1.default = slot0
end

function slot1.getClassByUrl(slot0)
	uv1 = "urls"

	if not slot1.urls[slot0] then
		uv1 = "urls"
		slot1 = slot1.default
	end

	return slot1
end

slot2 = class("TaskBase")
slot2.Url = nil
slot2.Service = nil

function slot2.ctor(slot0, slot1, slot2, slot3)
	slot0.session = slot1
	slot0.url = slot2.url
	slot0.synID = slot2.synID
	slot0.data = slot2.data
	slot0.isClientReq = slot2:isAck()
	slot0.ackCB = slot3
end

function slot2.run(slot0)
end

function slot2.ackOk(slot0)
	uv1 = "new"
	slot1 = slot1.new(slot0.session)

	slot1:setOkAck(slot0.synID)

	return slot1
end

function slot2.ackErr(slot0)
	uv1 = "new"
	slot1 = slot1.new(slot0.session)

	slot1:setOkErr(slot0.synID)

	return slot1
end

function slot2.synPacket(slot0, slot1, slot2)
	if not slot0.isClientReq then
		error("the request packet was come from server, you need ackPacket")
	end

	uv3 = "isClientReq"
	slot3 = slot3.new(slot0.session)

	slot3:setSynData(slot1, slot2)

	return slot3
end

function slot2.ackPacket(slot0, slot1, slot2)
	if slot0.isClientReq then
		error("the request packet was gen by client, you need synPacket")
	end

	uv3 = "isClientReq"
	slot3 = slot3.new(slot0.session)

	slot3:setAckData(slot1, slot0.synID, slot2)

	return slot3
end

function slot2.ackCallBack(slot0)
	if not slot0.ackCB then
		return
	end

	slot0.ackCB = nil

	if slot0.data.ret then
		return slot0.ackCB(slot0.data, nil)
	else
		return slot1(nil, slot0.data)
	end
end

return slot2
