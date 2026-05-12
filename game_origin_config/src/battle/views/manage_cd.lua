slot0 = class("CManageCd")
globals.CManageCd = slot0

function slot0.ctor(slot0, slot1, slot2)
	slot0.tick = 0
	slot0.cdTime = slot1
	slot0.cdCountLimit = slot2 or 9999999
	slot0.cdCount = 0
end

function slot0.CdOk(slot0)
	slot0.tick = slot0.cdTime
end

function slot0.isCdOk(slot0)
	if slot0.cdCount < slot0.cdCountLimit and slot0.cdTime <= slot0.tick then
		return true
	end

	return false
end

function slot0.reset(slot0, slot1, slot2)
	slot0.tick = 0
	slot0.cdTime = slot1
	slot0.cdCountLimit = slot2 or 9999999
	slot0.cdCount = 0
end

function slot0.start(slot0, slot1)
	slot0.cdTime = slot1 or slot0.cdTime
	slot0.tick = 0
	slot0.cdCount = slot0.cdCount + 1
end

function slot0.update(slot0, slot1)
	slot0.tick = slot0.tick + slot1
end

function slot0.nextDelta(slot0)
	if slot0:isCdOk() then
		return 0
	end

	return slot0.cdTime - slot0.tick
end
