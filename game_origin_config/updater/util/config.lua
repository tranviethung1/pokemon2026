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
		slot2 = nil

		if userDefault.getForeverLocalKey("OkamiLan", "en", {
			rawKey = true
		}) == "br" then
			print("Okamidf: " .. userDefault.getForeverLocalKey("OkamiLan", "en", {
				rawKey = true
			}))

			slot2 = "pt"
		else
			print("Okamidf: " .. userDefault.getForeverLocalKey("OkamiLan", "en", {
				rawKey = true
			}))
			print("Okamidf: " .. LOCAL_LANGUAGE)

			slot2 = LOCAL_LANGUAGE
		end

		slot3 = string.format("_%s", slot2)
		slot5 = clone(slot0.__default.__index)
		slot6 = 5

		for slot10, slot11 in pairs(slot0) do
			if type(slot10) == "number" then
				for slot15, slot16 in pairs(slot11) do
					slot5[slot15] = slot16
				end

				if slot6 - 1 < 0 then
					break
				end
			end
		end

		for slot10, slot11 in pairs(slot5) do
			if slot5[getL10nField(slot10)] then
				slot1[slot10] = slot12
			else
				uv13 = "__default"

				if slot13(slot10, slot3) then
					uv13 = "userDefault"
					slot1[slot13(slot10, 1, #slot10 - #slot3)] = slot10
				end
			end
		end
	end

	for slot5, slot6 in pairs(slot0) do
		if type(slot5) == "string" and type(slot6) == "table" then
			uv7 = "userDefault"

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
