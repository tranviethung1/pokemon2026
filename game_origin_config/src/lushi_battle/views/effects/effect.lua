slot0 = class("EventEffect")
autoChessEffect.EventEffect = slot0

function slot0.ctor(slot0, slot1, slot2, slot3)
	slot0.key = nil
	slot0.queID = nil
	slot0.args = slot2
	slot0.playOver = false
	slot0.delay = slot2 and slot2.delay or 0
	slot0.tick = nil
	slot0.lifetime = slot2 and slot2.lifetime
	slot0.view = slot1 or gRootViewProxy:raw()
	slot0.target = slot3 or slot0.view
	slot0.zOrder = slot2 and slot2.zOrder or battle.EffectZOrder.none

	if device.platform == "windows" then
		slot0.traceback = debug.traceback()
	end

	if slot2 then
		if slot2.delay then
			slot2.delay = nil
		end

		if slot2.lifetime then
			slot2.lifetime = nil
		end
	end
end

function slot0.play(slot0)
	if slot0.delay == 0 then
		slot0.tick = 0

		return slot0:onPlay()
	end
end

function slot0.onPlay(slot0)
end

function slot0.stop(slot0)
	if not slot0.playOver then
		slot0.playOver = true

		return slot0:onStop()
	end
end

function slot0.free(slot0)
	slot0.playOver = true

	slot0:onFree()
end

function slot0.onFree(slot0)
end

function slot0.onStop(slot0)
end

function slot0.isStop(slot0)
	return slot0.playOver
end

function slot0.update(slot0, slot1)
	if slot0.delay > 0 then
		slot0.delay = slot0.delay - slot1

		if slot0.delay > 0 then
			return
		end

		slot1 = -slot0.delay
	end

	if slot0.tick == nil then
		slot0.tick = 0

		slot0:onPlay()

		if not slot0.onUpdate then
			return
		end
	end

	slot0.tick = slot0.tick + slot1

	if slot0.lifetime and slot0.lifetime <= slot0.tick then
		slot0:onUpdate(slot1 - (slot0.tick - slot0.lifetime))

		return slot0:stop()
	end

	return slot0:onUpdate(slot1)
end

function slot0.canUpdate(slot0)
	return not slot0.playOver and (slot0.onUpdate or slot0.delay > 0)
end

function slot0.debugString(slot0)
	return tostring(slot0)
end

slot1 = class("OnceEventEffect", slot0)
autoChessEffect.OnceEventEffect = slot1

function slot1.play(slot0)
	if slot0.delay == 0 then
		slot0:onPlay()

		return slot0:free()
	end
end

function slot1.update(slot0, slot1)
	slot0.delay = slot0.delay - slot1

	if slot0.delay > 0 then
		return
	end

	slot0:onPlay()

	return slot0:free()
end

slot2 = class("Manager")
autoChessEffect.Manager = slot2

function slot2.ctor(slot0, slot1)
	slot0.key = slot1
	slot0.effects = {}
	slot0.updEffects = {}
	slot0.queHeadID = 1
	slot0.queTailID = 0
	slot0.queEffects = {}
	slot0.keyCounter = 1
	slot0.running = true
end

function slot2.addAndPlay(slot0, slot1, slot2)
	if slot1 == nil then
		slot1 = slot0.keyCounter
		slot0.keyCounter = slot0.keyCounter + 1
	end

	slot2:play()

	if not slot2:isStop() then
		slot0.effects[slot1] = slot2
		slot2.key = slot1

		if slot2:canUpdate() then
			slot0.updEffects[slot1] = slot2
		end
	end

	gRootViewProxy:notify("effectUpdated")

	return slot2
end

function slot2.delAndStop(slot0, slot1)
	if slot0.effects[slot1] then
		slot2:stop()

		slot0.effects[slot1] = nil
		slot0.updEffects[slot1] = nil
	end

	gRootViewProxy:notify("effectUpdated")
end

function slot2.queueAppend(slot0, slot1)
	slot0.queTailID = slot0.queTailID + 1
	slot0.queEffects[slot0.queTailID] = slot1
	slot1.queID = slot0.queTailID

	gRootViewProxy:notify("effectUpdated")

	return slot1
end

function slot2.queuePrepend(slot0, slot1)
	if slot0:queueSize() > 0 and not slot0.queEffects[slot0.queHeadID]:isStop() then
		return slot0:queueInsert(1, slot1)
	end

	return slot0:queueInsert(0, slot1)
end

function slot2.queueInsert(slot0, slot1, slot2)
	for slot6 = slot0.queTailID, slot0.queHeadID + slot1, -1 do
		slot0.queEffects[slot6].queID = slot6 + 1
		slot0.queEffects[slot6 + 1] = slot0.queEffects[slot6]
	end

	slot0.queTailID = slot0.queTailID + 1
	slot0.queEffects[slot0.queHeadID + slot1] = slot2
	slot2.queID = slot0.queHeadID + slot1

	gRootViewProxy:notify("effectUpdated")

	return slot2
end

function slot2.queueClear(slot0)
	for slot4, slot5 in pairs(slot0.queEffects) do
		slot5:stop()
	end

	slot0.queHeadID = 1
	slot0.queTailID = 0
	slot0.queEffects = {}

	gRootViewProxy:notify("effectUpdated")
end

function slot2.queueErase(slot0, slot1)
	if slot0.queEffects[slot1] then
		if slot1 == slot0.queHeadID then
			slot2:stop()
		else
			slot2:free()
		end
	end

	gRootViewProxy:notify("effectUpdated")
end

function slot2.queueSize(slot0)
	return slot0.queTailID - slot0.queHeadID + 1
end

function slot2.queueInfo(slot0)
	slot1 = slot0.queHeadID
	slot2 = {}

	while slot1 <= slot0.queTailID do
		table.insert(slot2, string.format("%d. %s", slot1, slot0.queEffects[slot1]:debugString()))

		slot1 = slot1 + 1
	end

	return slot2
end

function slot2.update(slot0, slot1)
	if not slot0.running then
		return false
	end

	slot2 = false

	for slot6, slot7 in pairs(slot0.updEffects) do
		slot2 = true

		slot7:update(slot1)

		if not slot7:canUpdate() then
			slot0.updEffects[slot6] = nil

			if slot7:isStop() then
				slot0.effects[slot6] = nil
			end
		end
	end

	slot3 = false

	while slot0.running and slot0.queHeadID <= slot0.queTailID do
		slot2 = true

		if slot0.queEffects[slot0.queHeadID]:isStop() then
			log.effect.stop(slot0.key, tostring(slot4), slot0.queHeadID, "/", slot0.queTailID)

			slot0.queEffects[slot0.queHeadID] = nil
			slot0.queHeadID = slot0.queHeadID + 1

			if slot0.queHeadID <= slot0.queTailID and not slot0:getHeadEffect():isStop() then
				slot4:play()

				if slot0.playCallback then
					slot0:playCallback(slot0.queHeadID, slot4)
				end
			end
		else
			if slot3 then
				break
			end

			slot4:update(slot1)

			slot3 = true
		end
	end

	return slot2
end

function slot2.getHeadEffect(slot0)
	if slot0.queTailID - slot0.queHeadID >= 1 and slot0.queEffects[slot0.queHeadID + 1].zOrder < slot0.queEffects[slot0.queHeadID].zOrder or slot0.queEffects[slot0.queHeadID].zOrder == battle.EffectZOrder.dead then
		for slot4 = slot0.queTailID, slot0.queHeadID + 1, -1 do
			if slot0.queEffects[slot4].zOrder < slot0.queEffects[slot4 - 1].zOrder then
				slot0:exchangeEffect(slot4 - 1, slot4)
			end
		end
	end

	return slot0.queEffects[slot0.queHeadID]
end

function slot2.exchangeEffect(slot0, slot1, slot2)
	slot0.queEffects[slot2].queID = slot0.queEffects[slot1].queID
	slot0.queEffects[slot1].queID = slot0.queEffects[slot2].queID
	slot0.queEffects[slot2] = slot0.queEffects[slot1]
	slot0.queEffects[slot1] = slot0.queEffects[slot2]
end

function slot2.clear(slot0)
	slot0:queueClear()

	for slot4, slot5 in pairs(slot0.effects) do
		slot5:stop()
	end

	slot0.effects = {}
	slot0.updEffects = {}
end

function slot2.resume(slot0)
	slot0.running = true
end

function slot2.pause(slot0)
	slot0.running = false
end

function slot2.setEffectPlayCallback(slot0, slot1)
	slot0.playCallback = slot1
end

function slot2.passOneWaveClear(slot0)
	for slot4, slot5 in pairs(slot0.queEffects) do
		if not slot5.args or not slot5.args.cleanTag or slot5.args.cleanTag ~= battle.FilterDeferListTag.cantClean then
			slot0:queueErase(slot4)
		end
	end

	for slot4, slot5 in pairs(slot0.effects) do
		if not slot5.args or not slot5.args.cleanTag or slot5.args.cleanTag ~= battle.FilterDeferListTag.cantClean then
			slot0:delAndStop(slot4)
		end
	end
end
