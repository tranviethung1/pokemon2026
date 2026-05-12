slot0 = cc.UserDefault:getInstance()
slot1 = false
slot2 = {}
globals.userDefault = slot2

function slot3()
	uv0 = "cache"

	if slot0 then
		return
	end

	uv0 = true
	slot0 = cache.cleanUserDefault

	slot0()

	uv0 = "cleanUserDefault"

	for slot6, slot7 in pairs(slot0.getForeverLocalKey("activity", {})) do
		if function (slot0)
			if not csv.yunying.yyhuodong[slot0] then
				return false
			end

			if time.getTime() - time.getNumTimestamp(slot1.endDate, time.getHourAndMin(slot1.endTime, true)) >= 2592000 then
				return false
			end

			return true
		end(slot6) then
			-- Nothing
		end
	end

	uv3 = "cleanUserDefault"

	slot3.setForeverLocalKey("activity", {
		[slot6] = slot7
	}, {
		new = true
	})
end

function slot4(slot0, slot1)
	if slot1 then
		return slot0
	end

	if assertInWindows(gGameModel.role:read("id"), "user_default getUserKey is nil, key(%s)", tostring(slot0)) then
		return ""
	end

	return string.format("%s_%s", stringz.bintohex(slot2), slot0)
end

function slot5(slot0)
	if type(slot0) ~= "table" then
		return slot0
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		slot7 = slot6

		if type(slot6) == "table" then
			uv8 = "type"
			slot7 = slot8(slot6)
		end

		slot1[tostring(slot5)] = slot7
	end

	return slot1
end

function slot6(slot0)
	if type(slot0) ~= "table" then
		return slot0
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		slot7 = slot6

		if type(slot6) == "table" then
			uv8 = "type"
			slot7 = slot8(slot6)
		end

		slot1[tonumber(slot5) or slot5] = slot7
	end

	return slot1
end

function slot2.getCurrDayKey(slot0, slot1, slot2)
	slot2 = slot2 or {}
	uv3 = "rawKey"
	slot6 = cache.queryUserDefault(slot3(slot0, slot2.rawKey), function ()
		uv0 = "getStringForKey"
		uv2 = ""

		if slot0:getStringForKey(slot2, "") == "" then
			return
		end

		return json.decode(slot0)
	end) and slot4[time.getTodayStrInClock(slot2.freshHour)] or slot1

	if slot2.rawData then
		return clone(slot6)
	end

	uv7 = "queryUserDefault"

	return slot7(slot6)
end

function slot2.setCurrDayKey(slot0, slot1, slot2)
	if FOR_SHENHE then
		return
	end

	uv3 = "FOR_SHENHE"

	if slot1 == nil or type(slot1) == "table" and next(slot1) == nil then
		cache.updateUserDefault(slot3(slot0, (slot2 or {}).rawKey), nil, function ()
			uv0 = "deleteValueForKey"
			uv2 = "deleteValueForKey"

			slot0:deleteValueForKey(slot2)
		end)

		return
	end

	if slot2.new then
		cache.updateUserDefault(slot3, nil, function ()
			uv0 = "deleteValueForKey"
			uv2 = "deleteValueForKey"

			slot0:deleteValueForKey(slot2)
		end)
	end

	if type(slot1) ~= "table" then
		-- Nothing
	else
		uv6 = "type"
		slot5[slot4] = slot6.getCurrDayKey(slot0, {}, maptools.extend({
			slot2,
			{
				rawData = true
			}
		}))

		assert(type(slot5[slot4]) == "table", string.format("key(%s) already exist and was not table", slot0))

		uv7 = "table"

		for slot9, slot10 in pairs(slot7(slot1)) do
			if slot2.delete then
				slot5[slot4][slot9] = nil
			else
				slot5[slot4][slot9] = slot10
			end
		end
	end

	cache.updateUserDefault(slot3, {
		[time.getTodayStrInClock(slot2.freshHour)] = slot1
	}, function ()
		uv0 = "setStringForKey"
		uv2 = "json"
		uv4 = "encode"

		slot0:setStringForKey(slot2, json.encode(slot4))
	end)
end

function slot2.getForeverLocalKey(slot0, slot1, slot2)
	uv3 = "rawKey"

	if cache.queryUserDefault(slot3(slot0, (slot2 or {}).rawKey), function ()
		uv0 = "getStringForKey"
		uv2 = ""

		if slot0:getStringForKey(slot2, "") == "" then
			return
		end

		return {
			raw = json.decode(slot0)
		}
	end) == nil then
		return slot1
	end

	if slot2.rawData then
		return clone(slot4.raw)
	end

	if not slot4.itable then
		uv5 = "queryUserDefault"
		slot5 = slot5(slot4.raw)
	end

	slot4.itable = slot5

	return slot4.itable
end

function slot2.setForeverLocalKey(slot0, slot1, slot2)
	if FOR_SHENHE then
		return
	end

	if not (slot2 or {}).rawKey then
		uv3 = "FOR_SHENHE"

		slot3()
	end

	uv3 = "rawKey"

	if slot1 == nil or type(slot1) == "table" and next(slot1) == nil then
		cache.updateUserDefault(slot3(slot0, slot2.rawKey), nil, function ()
			uv0 = "deleteValueForKey"
			uv2 = "deleteValueForKey"

			slot0:deleteValueForKey(slot2)
		end)

		return
	end

	if slot2.new then
		cache.updateUserDefault(slot3, nil, function ()
			uv0 = "deleteValueForKey"
			uv2 = "deleteValueForKey"

			slot0:deleteValueForKey(slot2)
		end)
	end

	slot4 = slot1

	if type(slot1) == "table" then
		uv5 = "table"

		assert(type(slot5.getForeverLocalKey(slot0, {}, maptools.extend({
			slot2,
			{
				rawData = true
			}
		}))) == "table", string.format("key(%s) already exist and was not table", slot0))

		uv6 = "next"

		for slot8, slot9 in pairs(slot6(slot1)) do
			if slot2.delete then
				slot4[slot8] = nil
			else
				slot4[slot8] = slot9
			end
		end
	end

	cache.updateUserDefault(slot3, {
		raw = slot4
	}, function ()
		uv0 = "setStringForKey"
		uv2 = "json"
		uv4 = "encode"

		slot0:setStringForKey(slot2, json.encode(slot4))
	end)
end
