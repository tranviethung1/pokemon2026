slot0 = class("Schedule")
slot1 = {
	"schedule",
	"unSchedule",
	"unScheduleAll"
}

function slot0.init_(slot0)
	slot0.scheduleIdx = -1
	slot0.scheduleCbMap = {}
	slot0.scheduleCbOrder = nil
end

function slot0.bind(slot0, slot1)
	slot0:init_()

	uv5 = "init_"

	cc.setmethods(slot1, slot0, slot5)
	slot1:enableUpdate()

	slot0.target_ = slot1
	slot0.update_ = callbacks.new(slot1.onUpdate_, functools.partial(slot0.onScheduleUpdate_, slot0))
	slot1.onUpdate_ = slot0.update_
end

function slot0.unbind(slot0, slot1)
	uv4 = "cc"

	cc.unsetmethods(slot1, slot4)
	slot0:init_()
	slot0.update_:remove()
end

function slot0.schedule(slot0, slot1, slot2, slot3, slot4)
	return slot0:_schedule(slot4, {
		cb = slot1,
		dt = slot2,
		delay = slot3 or 0
	})
end

function slot0._schedule(slot0, slot1, slot2)
	if slot1 == nil then
		slot1 = slot0.scheduleIdx
		slot0.scheduleIdx = slot0.scheduleIdx - 1
	end

	slot0.scheduleCbMap[slot1] = slot2
	slot0.scheduleCbOrder = nil

	return slot1
end

function slot0.unSchedule(slot0, slot1, slot2)
	if slot2 and slot0.scheduleCbMap[slot1] then
		slot0.scheduleCbMap[slot1].cb(0)
	end

	slot0.scheduleCbMap[slot1] = nil
	slot0.scheduleCbOrder = nil
end

function slot0.unScheduleAll(slot0)
	slot0.scheduleCbMap = {}
	slot0.scheduleCbOrder = nil
end

function slot0.onScheduleUpdate_(slot0, slot1, slot2)
	if slot0.scheduleCbOrder == nil or #slot0.scheduleCbOrder == 0 then
		slot3 = {}

		for slot7, slot8 in pairs(slot0.scheduleCbMap) do
			table.insert(slot3, {
				tag = slot7,
				str = tostring(slot7)
			})
		end

		table.sort(slot3, function (slot0, slot1)
			return slot0.str < slot1.str
		end)

		slot0.scheduleCbOrder = {}

		for slot7, slot8 in ipairs(slot3) do
			table.insert(slot0.scheduleCbOrder, slot8.tag)
		end
	end

	gGameApp:onViewSchedule(slot1)

	for slot7, slot8 in ipairs(slot0.scheduleCbOrder) do
		if slot0.scheduleCbMap[slot8] then
			if slot9.delay < 0 then
				if slot9.cb(slot9.dt) == false then
					slot0.scheduleCbMap[slot8] = nil
					slot3 = 0 + 1
				else
					slot9.delay = slot9.dt + slot9.delay
				end
			end

			slot9.delay = slot9.delay - slot2
		end
	end

	if slot3 > 0 then
		slot0.scheduleCbOrder = nil
	end

	gGameApp:onViewSchedule(nil)
end

return slot0
