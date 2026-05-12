slot0 = class("Event")
slot1 = {
	"addEventListener",
	"dispatchEvent",
	"removeEventListener",
	"removeEventListenersByTag",
	"removeEventListenersByEvent",
	"removeAllEventListeners",
	"hasEventListener",
	"dumpAllEventListeners"
}

function slot0.init_(slot0)
	slot0.target_ = nil
	slot0.listeners_ = {}
	slot0.nextListenerHandleIndex_ = 0
end

function slot0.bind(slot0, slot1)
	slot0:init_()

	uv5 = "init_"

	cc.setmethods(slot1, slot0, slot5)

	slot0.target_ = slot1
end

function slot0.unbind(slot0, slot1)
	uv4 = "cc"

	cc.unsetmethods(slot1, slot4)
	slot0:init_()
end

function slot0.on(slot0, slot1, slot2, slot3)
	assert(type(slot1) == "string" and slot1 ~= "", "Event:addEventListener() - invalid eventName")

	if slot0.listeners_[string.upper(slot1)] == nil then
		slot0.listeners_[slot1] = {}
	end

	slot0.nextListenerHandleIndex_ = slot0.nextListenerHandleIndex_ + 1
	slot0.listeners_[slot1][tostring(slot0.nextListenerHandleIndex_)] = {
		slot2,
		slot3 or ""
	}

	if DEBUG > 1 then
		printInfo("%s [Event] addEventListener() - event: %s, handle: %s, tag: \"%s\"", tostring(slot0.target_), slot1, slot4, tostring(slot3))
	end

	return slot0.target_, slot4
end

slot0.addEventListener = slot0.on

function slot0.dispatchEvent(slot0, slot1)
	slot1.name = string.upper(tostring(slot1.name))
	slot2 = slot1.name

	if DEBUG > 1 then
		printInfo("%s [Event] dispatchEvent() - event %s", tostring(slot0.target_), slot2)
	end

	if slot0.listeners_[slot2] == nil then
		return
	end

	slot1.target = slot0.target_
	slot1.stop_ = false

	function slot1.stop(slot0)
		slot0.stop_ = true
	end

	for slot6, slot7 in pairs(slot0.listeners_[slot2]) do
		if DEBUG > 1 then
			printInfo("%s [Event] dispatchEvent() - dispatching event %s to listener %s", tostring(slot0.target_), slot2, slot6)
		end

		slot1.tag = slot7[2]

		slot7[1](slot1)

		if slot1.stop_ then
			if DEBUG > 1 then
				printInfo("%s [Event] dispatchEvent() - break dispatching for event %s", tostring(slot0.target_), slot2)
			end

			break
		end
	end

	return slot0.target_
end

function slot0.removeEventListener(slot0, slot1)
	for slot5, slot6 in pairs(slot0.listeners_) do
		for slot10, slot11 in pairs(slot6) do
			if slot10 == slot1 then
				slot6[slot10] = nil

				if DEBUG > 1 then
					printInfo("%s [Event] removeEventListener() - remove listener [%s] for event %s", tostring(slot0.target_), slot10, slot5)
				end

				return slot0.target_
			end
		end
	end

	return slot0.target_
end

function slot0.removeEventListenersByTag(slot0, slot1)
	for slot5, slot6 in pairs(slot0.listeners_) do
		for slot10, slot11 in pairs(slot6) do
			if slot11[2] == slot1 then
				slot6[slot10] = nil

				if DEBUG > 1 then
					printInfo("%s [Event] removeEventListener() - remove listener [%s] for event %s", tostring(slot0.target_), slot10, slot5)
				end
			end
		end
	end

	return slot0.target_
end

function slot0.removeEventListenersByEvent(slot0, slot1)
	slot0.listeners_[string.upper(slot1)] = nil

	if DEBUG > 1 then
		printInfo("%s [Event] removeAllEventListenersForEvent() - remove all listeners for event %s", tostring(slot0.target_), slot1)
	end

	return slot0.target_
end

function slot0.removeAllEventListeners(slot0)
	slot0.listeners_ = {}

	if DEBUG > 1 then
		printInfo("%s [Event] removeAllEventListeners() - remove all listeners", tostring(slot0.target_))
	end

	return slot0.target_
end

function slot0.hasEventListener(slot0, slot1)
	for slot6, slot7 in pairs(slot0.listeners_[string.upper(tostring(slot1))]) do
		return true
	end

	return false
end

function slot0.dumpAllEventListeners(slot0)
	print("---- Event:dumpAllEventListeners() ----")

	for slot4, slot5 in pairs(slot0.listeners_) do
		printf("-- event: %s", slot4)

		for slot9, slot10 in pairs(slot5) do
			printf("--     listener: %s, handle: %s", tostring(slot10[1]), tostring(slot9))
		end
	end

	return slot0.target_
end

return slot0
