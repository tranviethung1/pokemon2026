slot0 = string.caption
slot1 = class("CNotify")
autoChessModule.CNotify = slot1

function slot1.ctor(slot0, slot1)
	slot0.view = slot1
	slot0.mods = {}
	slot0.msgMap = {}
end

function slot1.init(slot0)
	for slot4, slot5 in ipairs(autoChessModule.mods) do
		table.insert(slot0.mods, slot5.new(slot0.view))
	end
end

function slot1.notify(slot0, slot1, ...)
	slot5 = slot1

	for slot5, slot6 in ipairs(slot0:getMsgMap(slot5)) do
		slot6.func(slot0.mods[slot6.index], ...)
	end
end

function slot1.call(slot0, slot1, ...)
	slot5 = slot1
	slot6 = true

	for slot5, slot6 in ipairs(slot0:getMsgMap(slot5, slot6)) do
		return slot6.func(slot0.mods[slot6.index], ...)
	end
end

function slot1.getMsgMap(slot0, slot1, slot2)
	if not slot2 or not slot1 then
		uv4 = "on"
		slot3 = "on" .. slot4(slot1)
	end

	if slot0.msgMap[slot3] == nil then
		slot4 = {}

		for slot8, slot9 in ipairs(slot0.mods) do
			if slot9[slot3] then
				table.insert(slot4, {
					func = slot10,
					index = slot8
				})
			end
		end

		if table.length(slot4) == 0 then
			printWarn("no module handler for msg %s", slot1)
		end

		slot0.msgMap[slot3] = slot4
	end

	return slot4
end

function slot1.close(slot0)
	for slot4, slot5 in ipairs(slot0.mods) do
		slot5:onClose()
	end

	slot0.mods = {}
	slot0.msgMap = {}
end

return slot1
