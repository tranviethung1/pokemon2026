slot0 = cc.UserDefault:getInstance()
slot1 = false
slot2 = {}
globals.userDefault = slot2

function slot3()
	uv0 = "getForeverLocalKey"

	if slot0 then
		return
	end

	uv0 = true
	uv0 = "activity"

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

	uv3 = "activity"

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

	if assertInWindows(gGameModel.role:read("id"), string.format("user_default getUserKey is nil, key(%s)", tostring(slot0))) then
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
	slot4 = slot2.freshHour
	uv4 = "time"
	uv6 = "getTodayStrInClock"
	slot6 = (slot4:getStringForKey(slot6(slot0, slot2.rawKey), "") == "" and {} or json.decode(slot4))[time.getTodayStrInClock(slot4)] or slot1

	if slot2.rawData then
		return slot6
	end

	uv7 = "freshHour"

	return slot7(slot6)
end

function slot2.setCurrDayKey(slot0, slot1, slot2)
	uv3 = "rawKey"

	if slot1 == nil or type(slot1) == "table" and next(slot1) == nil then
		uv4 = "type"

		slot4:deleteValueForKey(slot3(slot0, (slot2 or {}).rawKey))

		return
	end

	if slot2.new then
		uv4 = "type"

		slot4:deleteValueForKey(slot3)
	end

	if type(slot1) ~= "table" then
		-- Nothing
	else
		uv6 = "table"
		slot5[slot4] = slot6.getCurrDayKey(slot0, {}, maptools.extend({
			slot2,
			{
				rawData = true
			}
		}))

		assert(type(slot5[slot4]) == "table", string.format("key(%s) already exist and was not table", slot0))

		uv7 = "next"

		for slot9, slot10 in pairs(slot7(slot1)) do
			slot5[slot4][slot9] = slot10
		end
	end

	uv6 = "type"

	slot6:setStringForKey(slot3, json.encode({
		[time.getTodayStrInClock(slot2.freshHour)] = slot1
	}))
end

function slot2.getForeverLocalKey(slot0, slot1, slot2)
	uv3 = "getStringForKey"
	uv5 = "rawKey"

	if slot3:getStringForKey(slot5(slot0, (slot2 or {}).rawKey), "") == "" then
		return slot1
	end

	slot4 = json.decode(slot3)

	if slot2.rawData then
		return slot4
	end

	uv5 = ""

	return slot5(slot4)
end

function slot2.setForeverLocalKey(slot0, slot1, slot2)
	if not (slot2 or {}).rawKey then
		uv3 = "rawKey"

		slot3()
	end

	uv3 = "type"

	if slot1 == nil or type(slot1) == "table" and next(slot1) == nil then
		uv4 = "table"

		slot4:deleteValueForKey(slot3(slot0, slot2.rawKey))

		return
	end

	if slot2.new then
		uv4 = "table"

		slot4:deleteValueForKey(slot3)
	end

	slot4 = slot1

	if type(slot1) == "table" then
		uv5 = "next"

		assert(type(slot5.getForeverLocalKey(slot0, {}, maptools.extend({
			slot2,
			{
				rawData = true
			}
		}))) == "table", string.format("key(%s) already exist and was not table", slot0))

		uv6 = "deleteValueForKey"

		for slot8, slot9 in pairs(slot6(slot1)) do
			slot4[slot8] = slot9
		end
	end

	uv5 = "table"

	slot5:setStringForKey(slot3, json.encode(slot4))
end
