return {
	load = function (slot0)
		slot1 = {}

		if not io.open(slot0, "r") then
			return nil
		end

		while true do
			if not slot2:read("*n") then
				break
			end

			if slot2:read(1) ~= ":" then
				break
			end

			slot5 = nil

			if slot2:read("*l"):find(":") then
				slot5 = slot4:sub(slot6 + 1)
				slot4 = slot4:sub(1, slot6 - 1)
			end

			if not slot4 then
				break
			end

			slot1[slot4] = {
				max_hits = 0,
				max = slot3,
				version = slot5
			}

			for slot10 = 1, slot3 do
				if not slot2:read("*n") then
					break
				end

				if slot2:read(1) ~= " " then
					break
				end

				if slot11 > 0 then
					slot1[slot4][slot10] = slot11
					slot1[slot4].max_hits = math.max(slot1[slot4].max_hits, slot11)
				end
			end
		end

		slot2:close()

		return slot1
	end,
	save = function (slot0, slot1)
		slot2 = assert(io.open(slot0, "w"))
		slot3 = {}

		for slot7 in pairs(slot1) do
			table.insert(slot3, slot7)
		end

		table.sort(slot3)

		for slot7, slot8 in ipairs(slot3) do
			slot9 = slot1[slot8]
			slot13 = ":"

			slot2:write(slot9.max, slot13, slot8, "\n")

			for slot13 = 1, slot9.max do
				slot2:write(tostring(slot9[slot13] or 0), " ")
			end

			slot2:write("\n")
		end

		slot2:close()
	end
}
