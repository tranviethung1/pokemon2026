slot0 = math.min
slot1 = math.max
slot2 = class("Shaker", autoChessEffect.EventEffect)
autoChessEffect.Shaker = slot2

function slot2.onPlay(slot0)
	slot0.view = gRootViewProxy:raw()
	slot0.target = slot0.view

	slot0:resetShaker()

	slot0.disx = slot0.args.shaker.disx or 0
	slot0.disy = slot1.disy or 0
	slot0.isRepeat = slot1.isRepeat

	if slot0.isRepeat and slot0.args.segInterval then
		slot0.timeList = slot0.args.segInterval
		slot0.timer = 0
		slot0.seg = 1
	end

	if slot0:shakerCountOver() then
		slot0:stop()
	end
end

function slot2.onStop(slot0)
	slot0.target:setPosition(0, 0)
end

function slot2.resetShaker(slot0)
	slot0.lastTime = slot0.args.shaker.lastTime or slot1.endT - slot1.beginT
	slot0.count = slot1.count or 1
	slot0.dur = 0
	slot0.wait = slot1.beginT or 0
	slot0.interval = slot1.interval or 0
end

function slot2.waiting(slot0)
	return slot0.wait >= 0
end

function slot2.shakerIng(slot0)
	return slot0.dur > 0
end

function slot2.shakerCountOver(slot0)
	return slot0.count <= 0
end

function slot2.needRepeat(slot0)
	if not slot0.timeList or not slot0.seg then
		return false
	end

	return slot0.timeList[slot0.seg + 1]
end

function slot2.repeatWaiting(slot0)
	return slot0.timer < slot0.timeList[slot0.seg + 1]
end

function slot2.onUpdate(slot0, slot1)
	if slot0.timer then
		slot0.timer = slot0.timer + slot1
	end

	if slot0:shakerIng() then
		slot0.dur = slot0.dur - slot1

		if slot0.dur > 0 then
			slot0.target:setPosition(math.random(-slot0.disx, slot0.disx), math.random(-slot0.disy, slot0.disy))
		else
			slot0.target:setPosition(0, 0)
		end
	elseif slot0:shakerCountOver() then
		if slot0:needRepeat() then
			if not slot0:repeatWaiting() then
				slot0.seg = slot0.seg + 1
				slot0.timer = 0

				slot0.target:setPosition(0, 0)
				slot0:resetShaker()
			end
		else
			return slot0:stop()
		end
	elseif slot0:waiting() then
		slot0.wait = slot0.wait - slot1

		if slot0.wait < 0 then
			if slot0.count > 0 then
				slot0.dur = slot0.lastTime
				slot0.wait = slot0.interval
			end

			slot0.count = slot0.count - 1
		end
	else
		return slot0:stop()
	end
end

function slot2.onStop(slot0)
	slot0.target:setPosition(0, 0)
end

function slot2.debugString(slot0)
	slot1 = slot0.dur or 0
	slot2 = ""

	if slot0.seg then
		slot2 = string.format("%s/%s", slot0.seg, table.length(slot0.timeList))
	end

	return string.format("Shaker: %5.2f %s", slot1, slot2)
end
