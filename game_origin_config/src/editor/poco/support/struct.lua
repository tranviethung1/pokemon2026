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
				if tonumber(slot0:sub(slot7 + 1):match("%d+")) > 0 then
					if slot10 - tostring(table.remove(slot2, 1)):len() > 0 then
						slot11 = slot11 .. string.rep(" ", slot10 - slot11:len())
					end

					table.insert(slot1, slot11:sub(1, slot10))
				end

				slot7 = slot7 + slot9:len()
			end
		end

		return table.concat(slot1)
	end,
	unpack = function (slot0, slot1)
		slot2 = {}
		slot3 = 1
		slot4 = true

		for slot8 = 1, slot0:len() do
			if slot0:sub(slot8, slot8) == "<" then
				slot4 = true
			elseif slot9 == ">" then
				slot4 = false
			elseif slot9:find("[bBhHiIlL]") then
				slot10 = slot9:find("[hH]") and 2 or slot9:find("[iI]") and 4 or slot9:find("[lL]") and 8 or 1
				slot11 = slot9:lower() == slot9
				slot12 = 0

				for slot16 = 1, slot10 do
					slot17 = string.byte(slot1:sub(slot3, slot3))
					slot12 = slot4 and slot12 + slot17 * 2^((slot16 - 1) * 8) or slot12 + slot17 * 2^((slot10 - slot16) * 8)
					slot3 = slot3 + 1
				end

				if slot11 and slot12 >= 2^(slot10 * 8 - 1) then
					slot12 = slot12 - 2^(slot10 * 8)
				end

				table.insert(slot2, slot12)
			elseif slot9:find("[fd]") then
				slot10 = slot9 == "d" and 8 or 4
				slot3 = slot3 + slot10

				if not slot4 then
					slot11 = string.reverse(slot1:sub(slot3, slot3 + slot10 - 1))
				end

				slot12 = 1

				for slot17 = slot10 - 2, 1, -1 do
					slot13 = string.byte(slot11, slot9 == "d" and 7 or 3) % (slot9 == "d" and 16 or 128) * 256 + string.byte(slot11, slot17)
				end

				if string.byte(slot11, slot10) > 127 then
					slot12 = -1
				end

				if string.byte(slot11, slot10) % 128 * (slot9 == "d" and 16 or 2) + math.floor(string.byte(slot11, slot10 - 1) / (slot9 == "d" and 16 or 128)) == 0 then
					table.insert(slot2, 0)
				else
					table.insert(slot2, math.ldexp((math.ldexp(slot13, slot9 == "d" and -52 or -23) + 1) * slot12, slot14 - (slot9 == "d" and 1023 or 127)))
				end
			elseif slot9 == "s" then
				slot10 = {}

				for slot14 = slot3, slot1:len() do
					if slot1:sub(slot14, slot14) == string.char(0) then
						break
					end

					table.insert(slot10, slot1:sub(slot14, slot14))
				end

				slot11 = table.concat(slot10)
				slot3 = slot3 + slot11:len() + 1

				table.insert(slot2, slot11)
			elseif slot9 == "c" then
				slot10 = slot0:sub(slot8 + 1):match("%d+")

				table.insert(slot2, slot1:sub(slot3, slot3 + tonumber(slot10)))

				slot3 = slot3 + tonumber(slot10)
				slot8 = slot8 + slot10:len()
			end
		end

		return unpack(slot2)
	end
}
