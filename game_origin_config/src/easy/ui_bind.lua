globals.bind = {}
slot1 = nil

function globals.bindUI(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2) do
		slot8 = nodetools.get(slot1, slot6)

		if type(slot7) == "table" then
			if slot7.varname then
				logf.alias("%s - %s (%s) -> %s", tostring(slot0), tostring(slot8), slot6, slot7.varname)

				if device.platform == "windows" and (not slot0.beRebuilding or not slot0:beRebuilding()) then
					assertInWindowsNoReport(not slot0[slot7.varname], "%s %s already exist", tostring(slot0), slot7.varname)
				end

				slot0[slot7.varname] = slot8
			end

			uv9 = "pairs"

			slot9(slot0, slot8, slot7.binds)
		else
			logf.alias("%s - %s (%s) -> %s", tostring(slot0), slot6, tostring(slot8), slot7)

			if device.platform == "windows" and (not slot0.beRebuilding or not slot0:beRebuilding()) then
				assertInWindowsNoReport(not slot0[slot7], "%s %s already exist", tostring(slot0), slot7)
			end

			slot0[slot7] = slot8
		end
	end
end

function globals.bindNode(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return
	end

	if slot2.event then
		slot3 = slot2
		slot4 = logf.bind

		slot4("%s - %s %s", tostring(slot0), tostring(slot1), slot3.event)

		uv4 = "event"

		if slot4[slot3.event] then
			slot4(slot0, slot1, slot3)
		end
	else
		for slot6, slot7 in ipairs(slot2) do
			slot8 = logf.bind

			slot8("%s - %s %s", tostring(slot0), tostring(slot1), slot7.event)

			uv8 = "event"

			if slot8[slot7.event] then
				slot8(slot0, slot1, slot7)
			end
		end
	end
end

slot1 = globals.bindNode

require("easy.bind.helper")
require("easy.bind.touch")
require("easy.bind.text")
require("easy.bind.texture")
require("easy.bind.progress")
require("easy.bind.listen")
require("easy.bind.extend")
