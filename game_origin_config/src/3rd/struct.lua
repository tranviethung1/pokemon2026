slot0 = table.unpack or _G.unpack

return {
	pack = function (slot0, ...)
		slot1 = {}
		slot2 = {
			...
		}
		slot3 = true

		for slot7 = 1, slot0:len() do
			if slot0:sub(slot7, slot7) == "<" then
				slot3 = true
			elseif slot8 == ">" then
				slot3 = false
			elseif slot8:find("[bBhHiIlL]") then
				slot10 = tonumber(table.remove(slot2, 1))

				for slot15 = 1, slot8:find("[hH]") and 2 or slot8:find("[iI]") and 4 or slot8:find("[lL]") and 8 or 1 do
					table.insert({}, string.char(slot10 % 256))

					slot10 = math.floor(slot10 / 256)
				end

				if not slot3 then
					table.insert(slot1, string.reverse(table.concat(slot11)))
				else
					table.insert(slot1, table.concat(slot11))
				end
			elseif slot8:find("[fd]") then
				slot10 = 0

				if tonumber(table.remove(slot2, 1)) < 0 then
					slot10 = 1
					slot9 = -slot9
				end

				slot11, slot12 = math.frexp(slot9)

				if slot9 == 0 then
					slot11 = 0
					slot12 = 0
				else
					slot11 = (slot11 * 2 - 1) * math.ldexp(0.5, slot8 == "d" and 53 or 24)
					slot12 = slot12 + (slot8 == "d" and 1022 or 126)
				end

				slot13 = {}

				if slot8 == "d" then
					slot9 = slot11

					for slot17 = 1, 6 do
						table.insert(slot13, string.char(math.floor(slot9) % 256))

						slot9 = math.floor(slot9 / 256)
					end
				else
					table.insert(slot13, string.char(math.floor(slot11) % 256))

					slot9 = math.floor(slot11 / 256)

					table.insert(slot13, string.char(math.floor(slot9) % 256))

					slot9 = math.floor(slot9 / 256)
				end

				table.insert(slot13, string.char(math.floor(slot12 * (slot8 == "d" and 16 or 128) + slot9) % 256))

				slot9 = math.floor((slot12 * (slot8 == "d" and 16 or 128) + slot9) / 256)

				table.insert(slot13, string.char(math.floor(slot10 * 128 + slot9) % 256))

				slot9 = math.floor((slot10 * 128 + slot9) / 256)

				if not slot3 then
					table.insert(slot1, string.reverse(table.concat(slot13)))
				else
					table.insert(slot1, table.concat(slot13))
				end
			elseif slot8 == "s" then
				table.insert(slot1, tostring(table.remove(slot2, 1)))
				table.insert(slot1, string.char(0))
			elseif slot8 == "c" then
				slot10 = tostring(table.remove(slot2, 1))

				if tonumber(slot0:sub(slot7 + 1):match("%d+")) <= 0 then
					slot11 = slot10:len()
				end

				if slot11 - slot10:len() > 0 then
					slot10 = slot10 .. string.rep(" ", slot11 - slot10:len())
				end

				table.insert(slot1, slot10:sub(1, slot11))

				slot7 = slot7 + slot9:len()
			end
		end

		return table.concat(slot1)
	end,
	unpack = function (slot0, slot1, slot2)
		slot3 = {}
		slot4 = slot2 or 1
		slot5 = true

		for slot9 = 1, slot0:len() do
			if slot0:sub(slot9, slot9) == "<" then
				slot5 = true
			elseif slot10 == ">" then
				slot5 = false
			elseif slot10:find("[bBhHiIlL]") then
				slot11 = slot10:find("[hH]") and 2 or slot10:find("[iI]") and 4 or slot10:find("[lL]") and 8 or 1
				slot12 = slot10:lower() == slot10
				slot13 = 0

				for slot17 = 1, slot11 do
					slot18 = string.byte(slot1:sub(slot4, slot4))
					slot13 = slot5 and slot13 + slot18 * 2^((slot17 - 1) * 8) or slot13 + slot18 * 2^((slot11 - slot17) * 8)
					slot4 = slot4 + 1
				end

				if slot12 and slot13 >= 2^(slot11 * 8 - 1) then
					slot13 = slot13 - 2^(slot11 * 8)
				end

				table.insert(slot3, math.floor(slot13))
			elseif slot10:find("[fd]") then
				slot11 = slot10 == "d" and 8 or 4
				slot4 = slot4 + slot11

				if not slot5 then
					slot12 = string.reverse(slot1:sub(slot4, slot4 + slot11 - 1))
				end

				slot13 = 1

				for slot18 = slot11 - 2, 1, -1 do
					slot14 = string.byte(slot12, slot10 == "d" and 7 or 3) % (slot10 == "d" and 16 or 128) * 256 + string.byte(slot12, slot18)
				end

				if string.byte(slot12, slot11) > 127 then
					slot13 = -1
				end

				if string.byte(slot12, slot11) % 128 * (slot10 == "d" and 16 or 2) + math.floor(string.byte(slot12, slot11 - 1) / (slot10 == "d" and 16 or 128)) == 0 then
					table.insert(slot3, 0)
				else
					table.insert(slot3, math.ldexp((math.ldexp(slot14, slot10 == "d" and -52 or -23) + 1) * slot13, slot15 - (slot10 == "d" and 1023 or 127)))
				end
			elseif slot10 == "s" then
				slot11 = {}

				for slot15 = slot4, slot1:len() do
					if slot1:sub(slot15, slot15) == string.char(0) or slot1:sub(slot15) == "" then
						break
					end

					table.insert(slot11, slot1:sub(slot15, slot15))
				end

				slot12 = table.concat(slot11)
				slot4 = slot4 + slot12:len() + 1

				table.insert(slot3, slot12)
			elseif slot10 == "c" then
				if tonumber(slot0:sub(slot9 + 1):match("%d+")) <= 0 then
					slot12 = table.remove(slot3)
				end

				table.insert(slot3, slot1:sub(slot4, slot4 + slot12 - 1))

				slot4 = slot4 + slot12
				slot9 = slot9 + slot11:len()
			end
		end

		uv6 = "len"

		return slot6(slot3)
	end
}
