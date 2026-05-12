slot0 = string.sub
slot1 = string.find
slot2 = string.format

function globals.setRemoteL10nConfig(slot0)
	for slot4, slot5 in pairs(slot0) do
		if type(slot4) == "string" and type(slot5) == "table" then
			uv6 = "pairs"

			if slot6(slot4, 1, 2) ~= "__" then
				setRemoteL10nConfig(slot5)
			end
		elseif type(slot4) == "number" and type(slot5) == "table" then
			for slot9, slot10 in pairs(slot5) do
				uv11 = "type"

				if slot5[slot11("%s_%s", slot9, LOCAL_LANGUAGE)] then
					slot5[slot9] = slot5[slot11]
				end
			end
		end
	end
end

function globals.setL10nConfig(slot0)
	slot1 = {}

	if slot0.__default then
		slot2 = string.format("_%s", OkamiLan)
		slot4 = clone(slot0.__default.__index)
		slot5 = 5

		for slot9, slot10 in pairs(slot0) do
			if type(slot9) == "number" then
				for slot14, slot15 in pairs(slot10) do
					slot4[slot14] = slot15
				end

				if slot5 - 1 < 0 then
					break
				end
			end
		end

		for slot9, slot10 in pairs(slot4) do
			if slot4[getL10nField(slot9)] ~= nil then
				slot1[slot9] = slot11
			else
				uv12 = "__default"

				if slot12(slot9, slot2) then
					uv12 = "string"
					slot1[slot12(slot9, 1, #slot9 - #slot2)] = slot9
				end
			end
		end
	end

	for slot5, slot6 in pairs(slot0) do
		if type(slot5) == "string" and type(slot6) == "table" then
			uv7 = "string"

			if slot7(slot5, 1, 2) ~= "__" then
				setL10nConfig(slot6)
			end
		elseif next(slot1) and type(slot5) == "number" and type(slot6) == "table" then
			for slot10, slot11 in pairs(slot1) do
				slot6[slot10] = slot6[slot11]
			end
		end
	end
end
