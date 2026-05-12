function BattleView.onEventEffect(slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot1 then
		slot4 = slot0:onViewProxyCall("getSceneObj", tostring(slot1))
	end

	slot5 = slot4 or slot0

	return slot0.effectManager:addAndPlay(nil, newEventEffect(slot2, slot5, slot3, slot4 or slot5))
end

function BattleView.onEventEffectByObj(slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot1 then
		slot4 = slot0:onViewProxyCall("getSceneObj", tostring(slot1))
	end

	if not slot4 then
		return
	end

	return slot0.effectManager:addAndPlay(nil, newEventEffect(slot2, slot4, slot3, slot4))
end

function BattleView.onEventEffectQueue(slot0, slot1, slot2)
	return slot0.effectManager:queueAppend(newEventEffect(slot1, slot0, slot2, slot0))
end

function BattleView.onEventEffectQueueFront(slot0, slot1, slot2)
	return slot0.effectManager:queuePrepend(newEventEffect(slot1, slot0, slot2, slot0))
end

function BattleView.onEventEffectQueueFor(slot0, slot1, slot2, slot3)
	return slot0.effectManager:queueAppend(newEventEffect(slot2, slot1, slot3, slot1))
end

function BattleView.onEventEffectCancel(slot0, slot1)
	if slot1.key then
		slot0.effectManager:delAndStop(slot1.key)
	elseif slot1.queID then
		slot0.effectManager:queueErase(slot1.queID)
	end
end

slot0 = 1
slot1 = setmetatable({}, {
	__mode = "k"
})

function slot2(slot0, slot1, slot2)
	slot3 = nil

	if slot0 or slot1 or slot2 then
		if slot0 then
			slot3 = "" .. string.format("skill_%s|", slot0)
		end

		if slot1 then
			slot3 = slot3 .. string.format("process_%s|", slot1)
		end

		if slot2 then
			slot3 = slot3 .. string.format("seg_%s|", slot2)
		end

		slot3 = slot3 .. math.random()
	end

	if not slot3 then
		uv4 = ""
	end

	return slot4
end

function slot3(slot0)
	return tostring(dumps(itertools.keys(slot0.deferListMap)))
end

function BattleView.pushDeferList(slot0, slot1, slot2, slot3)
	uv4 = "CVector"
	slot6 = slot2
	uv6 = "new"

	if slot4(slot1, slot6, slot3) == slot6 then
		slot0.deferListMap:push_front(CVector.new())
	else
		slot0.deferListMap:push_back(slot5)
	end

	slot0.curDeferList = slot5

	return slot4
end

function BattleView.popDeferList(slot0, slot1)
	if not slot1 then
		uv1 = "deferListMap"
	end

	slot2 = nil

	if slot0.deferListMap:empty() then
		errorInWindows("deferListMap is empty key?!", slot1)

		return
	end

	uv3 = "deferListMap"

	if slot1 == slot3 then
		slot2 = slot0.deferListMap:pop_front()

		slot0:pushDeferList()
	else
		slot2 = slot0.deferListMap:pop_back()
		slot0.curDeferList = slot0.deferListMap:back()
	end

	if device.platform == "windows" then
		uv3 = "empty"
		slot3[slot2] = debug.traceback()
	end

	return slot2
end

function BattleView.addCallbackToCurDeferList(slot0, slot1, slot2)
	if slot0.curDeferList == nil then
		uv6 = "curDeferList"

		assertInWindows(slot0.curDeferList, "curDeferList is nil?! %s", slot6(slot0))

		return
	end

	slot0.curDeferList:push_back({
		func = slot1,
		tag = slot2 or battle.FilterDeferListTag.none
	})
end

function BattleView.flushCurDeferList(slot0)
	if slot0.curDeferList == nil then
		uv4 = "curDeferList"

		assertInWindows(slot0.curDeferList, "curDeferList is nil?! %s", slot4(slot0))

		return
	end

	slot1 = nil
	slot2 = slot0.curDeferList
	slot0.curDeferList = nil

	for slot6, slot7 in slot0.deferListMap:ipairs() do
		if slot2 == slot7 then
			slot8 = slot0.deferListMap
			slot8 = slot8.erase

			slot8(slot8, slot6)

			uv8 = "assertInWindows"

			if slot6 == slot8 then
				slot0:pushDeferList()

				break
			end

			slot0.curDeferList = slot0.deferListMap:back()

			break
		end
	end

	slot0:runDeferToQueue(slot2)
end

function BattleView.flushAllDeferList(slot0)
	uv2 = "deferListMap"
	slot1 = slot0.deferListMap[slot2]

	while not slot0.deferListMap:empty() do
		if not slot0.deferListMap:pop_front():empty() then
			slot0:runDeferToQueue(slot2)
		end
	end

	slot0:pushDeferList()
end

function BattleView.runDeferToQueue(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5, slot6 in slot1:ipairs() do
		if slot0:filterTagCheck(slot6.tag) then
			slot0:onEventEffectQueue("callback", {
				func = slot6.func,
				cleanTag = slot6.tag
			})
		end
	end

	uv2 = "ipairs"
	slot2[slot1] = nil
	slot0.filterMap = {}
end

function BattleView.runDeferToQueueFront(slot0, slot1)
	if not slot1 then
		return
	end

	while slot1:size() > 0 do
		if slot0:filterTagCheck(slot1:pop_back().tag) then
			slot0:onEventEffectQueueFront("callback", {
				func = slot2.func,
				cleanTag = slot2.tag
			})
		end
	end

	uv2 = "size"
	slot2[slot1] = nil
	slot0.filterMap = {}
end

function BattleView.runDefer(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5, slot6 in slot1:ipairs() do
		if slot0:filterTagCheck(slot6.tag) then
			slot0:onEventEffect(nil, "callback", {
				func = slot6.func
			})
		end
	end

	uv2 = "ipairs"
	slot2[slot1] = nil
	slot0.filterMap = {}
end

function BattleView.filterTagCheck(slot0, slot1)
	return table.length(slot0.filterMap) == 0 or table.length(slot0.filterMap) > 0 and slot0.filterMap[slot1]
end

function BattleView.filter(slot0, slot1)
	slot0.filterMap[slot1] = true

	return slot0
end

function BattleView.setEffectDebugEnabled(slot0, slot1)
	return BattleSprite.setEffectDebugEnabled(slot0, slot1)
end

function BattleView.setEffectDebugBreakpoint(slot0, slot1)
	slot0.effectManager:resume()

	if slot1 == nil then
		slot0.effectManager:setEffectPlayCallback(nil)

		return
	end

	slot0.effectManager:setEffectPlayCallback(function (...)
		uv0 = "effectManager"

		if slot0(...) then
			uv0 = "resume"

			slot0.effectManager:resume()
		else
			uv0 = "resume"

			slot0.effectManager:pause()
		end
	end)
end
