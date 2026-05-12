function battleEasy.effect(slot0, slot1, slot2)
	if type(slot1) == "function" then
		gRootViewProxy:proxy():onEventEffect(slot0, "callback", {
			func = slot1,
			delay = slot2 and slot2.delay,
			lifetime = slot2 and slot2.lifetime
		})
	elseif slot3 == "string" then
		gRootViewProxy:proxy():onEventEffect(slot0, slot1, slot2)
	else
		error("only function or string be allowed")
	end
end

function battleEasy.queueEffect(slot0, slot1)
	if type(slot0) == "function" then
		gRootViewProxy:proxy():onEventEffectQueue("callback", {
			func = slot0,
			delay = slot1 and slot1.delay,
			lifetime = slot1 and slot1.lifetime,
			zOrder = slot1 and slot1.zOrder
		})
	elseif slot2 == "string" then
		gRootViewProxy:proxy():onEventEffectQueue(slot0, slot1)
	else
		error("only function or string be allowed")
	end
end

function battleEasy.queueNotify(slot0, ...)
	assert(type(slot0) == "string", "msg not string type")

	slot1 = {
		...
	}

	gRootViewProxy:proxy():onEventEffectQueue("callback", {
		func = function ()
			uv2 = "gRootViewProxy"
			uv4 = "notify"

			gRootViewProxy:notify(slot2, unpack(slot4))
		end
	})
end

function battleEasy.queueZOrderNotify(slot0, slot1, ...)
	assert(type(slot0) == "string", "msg not string type")

	slot2 = {
		...
	}

	gRootViewProxy:proxy():onEventEffectQueue("callback", {
		func = function ()
			uv2 = "gRootViewProxy"
			uv4 = "notify"

			gRootViewProxy:notify(slot2, unpack(slot4))
		end,
		zOrder = slot1
	})
end

function battleEasy.queueNotifyFor(slot0, slot1, ...)
	assert(slot0, "view is nil, plz use queueNotify")
	assert(type(slot1) == "string", "msg not string type")

	slot2 = {
		...
	}

	gRootViewProxy:proxy():onEventEffectQueue("callback", {
		func = function ()
			uv0 = "notify"
			uv2 = "unpack"
			uv4 = "notify"

			slot0:notify(slot2, unpack(slot4))
		end
	})
end

function battleEasy.deferEffect(...)
	error("temporary")

	return gRootViewProxy:proxy():addCallbackToCurDeferList(...)
end

function battleEasy.deferCallback(slot0)
	return gRootViewProxy:proxy():addCallbackToCurDeferList(slot0)
end

function battleEasy.deferNotify(slot0, slot1, ...)
	return gRootViewProxy:proxy():addCallbackToCurDeferList(functools.handler(slot0 or gRootViewProxy, "notify", slot1, ...))
end

function battleEasy.deferCallbackCantJump(slot0)
	return gRootViewProxy:proxy():addCallbackToCurDeferList(slot0, battle.FilterDeferListTag.cantJump)
end

function battleEasy.deferNotifyCantJump(slot0, slot1, ...)
	return gRootViewProxy:proxy():addCallbackToCurDeferList(functools.handler(slot0 or gRootViewProxy, "notify", slot1, ...), battle.FilterDeferListTag.cantJump)
end

function battleEasy.deferNotifyCantClean(slot0, slot1, ...)
	return gRootViewProxy:proxy():addCallbackToCurDeferList(functools.handler(slot0 or gRootViewProxy, "notify", slot1, ...), battle.FilterDeferListTag.cantClean)
end

function battleEasy.deferBuffNotifyCantJump(slot0, slot1, slot2, ...)
	slot4 = functools.handler(slot0 or gRootViewProxy, "notify", slot1, ...)

	return battleEasy.deferCallbackCantJump(function ()
		uv0 = "proxy"
		uv2 = "canBuffNotify"
		uv3 = "proxy"

		if slot0:proxy():canBuffNotify(slot2, slot3) then
			uv0 = "canBuffNotify"

			slot0()
		end
	end)
end

function battleEasy.priorDataTable(slot0, slot1)
	slot2 = {
		__isDirty = true,
		__value = {},
		__varName = slot1
	}

	assert(battle.VariablePriorityTb[slot1], "battle.priorDataTable need priority define")

	slot2.__value[battle.VariablePriorityTb[slot1].default] = slot0

	function slot2.get(slot0)
		slot1 = slot0.__value

		if slot0.__isDirty then
			for slot5, slot6 in pairs(slot1) do
				slot0.__lastKey = (slot0.__lastKey == nil or slot0.__lastKey < slot5) and slot5 or slot0.__lastKey
			end

			slot0.__isDirty = false
		end

		return slot1[slot0.__lastKey]
	end

	function slot2.set(slot0, slot1, slot2, slot3)
		slot4 = battle.VariablePriorityTb[slot0.__varName][slot2] or battle.VariablePriorityTb[slot0.__varName].default

		if slot3 and slot4 ~= battle.VariablePriorityTb[slot0.__varName].default then
			slot0.__value[slot4] = nil
		else
			slot0.__value[slot4] = slot1
		end

		slot0.__isDirty = true
		slot0.__lastKey = nil
	end

	return slot2
end
