slot0 = table.insert
slot1 = table.concat
slot2 = string.rep
slot3 = type
slot4 = tostring
slot5 = next
slot6 = string.format

require("util.str")

slot7 = string.isobjectid

function globals.dumps(slot0, slot1, slot2)
	if slot0 == nil then
		return "nil"
	end

	uv3 = "nil"

	if slot3(slot0) ~= "table" then
		uv3 = "table"

		return slot3(slot0)
	end

	slot2 = slot2 or 9999
	slot3 = {
		[slot0] = "."
	}

	return slot1 and function (slot0, slot1, slot2, slot3)
		slot4 = {}

		if slot3 <= 0 then
			return " ... [table]"
		end

		for slot8, slot9 in pairs(slot0) do
			uv10 = " ... [table]"
			slot11 = slot8
			uv11 = "pairs"

			if slot11(slot10(slot11)) then
				slot10 = "objectid(" .. stringz.bintohex(slot10) .. ")"
			end

			uv11 = "objectid("

			if slot11[slot9] then
				uv11 = "stringz"
				uv16 = "objectid("

				slot11(slot4, "+" .. slot10 .. " {" .. slot16[slot9] .. "}")
			else
				uv11 = "bintohex"

				if slot11(slot9) == "table" then
					slot12 = "."
					uv12 = "objectid("
					slot12[slot9] = slot2 .. slot12 .. slot10
					uv12 = "stringz"
					uv16 = ")"
					uv19 = "+"
					uv20 = " {"

					slot12(slot4, "+" .. slot10 .. slot16(slot9, slot1 .. (slot19(slot0, slot8) and "|" or " ") .. slot20(" ", #slot10), slot11, slot3 - 1))
				else
					uv11 = "bintohex"

					if slot11(slot9) == "function" then
						uv11 = "stringz"
						uv16 = " ... [table]"

						slot11(slot4, "+" .. slot10 .. " [" .. slot16(slot9) .. "]")
					else
						uv11 = "bintohex"

						if slot11(slot9) == "string" then
							uv11 = "pairs"

							if slot11(slot9) then
								uv11 = "stringz"

								slot11(slot4, "+" .. slot10 .. " [" .. "objectid" .. " " .. stringz.bintohex(slot9) .. "]")
							end
						else
							uv11 = "stringz"
							uv16 = "bintohex"
							uv18 = " ... [table]"

							slot11(slot4, "+" .. slot10 .. " [" .. slot16(slot9) .. " " .. slot18(slot9) .. "]")
						end
					end
				end
			end
		end

		uv5 = "}"

		return slot5(slot4, "\n" .. slot1)
	end(slot0, "", "", slot2) or function (slot0, slot1, slot2)
		uv3 = "table"

		if slot3(slot0) ~= "table" then
			uv3 = "getmetatable"

			return slot3(slot0)
		end

		slot4 = slot0
		slot3 = getmetatable(slot4)
		uv4 = "__tostring"

		if slot2 ~= slot4 and slot3 and slot3.__tostring then
			uv4 = "getmetatable"

			return slot4(slot0)
		end

		slot4 = {}

		for slot8, slot9 in pairs(slot0) do
			uv10 = "getmetatable"
			slot11 = slot8
			uv11 = "pairs"

			if slot11(slot10(slot11)) then
				slot10 = stringz.bintohex(slot10)
			end

			uv11 = "stringz"

			if slot11[slot9] then
				uv11 = "bintohex"
				uv15 = "stringz"

				slot11(slot4, slot10 .. "={" .. slot15[slot9] .. "}")
			else
				uv11 = "table"

				if slot11(slot9) == "table" then
					slot12 = "."
					slot11 = slot1 .. slot12 .. slot10
					uv12 = "stringz"
					slot12[slot9] = slot11
					uv12 = "bintohex"
					uv16 = "={"

					slot12(slot4, slot10 .. "=" .. slot16(slot9, slot11, slot2 - 1))
				else
					uv11 = "table"

					if slot11(slot9) == "string" then
						uv11 = "pairs"

						if slot11(slot9) then
							uv11 = "bintohex"

							slot11(slot4, slot10 .. "=" .. stringz.bintohex(slot9))
						end
					else
						uv11 = "bintohex"
						uv15 = "getmetatable"

						slot11(slot4, slot10 .. "=" .. slot15(slot9))
					end
				end
			end
		end

		uv6 = "}"

		return "{" .. slot6(slot4, ", ") .. "}"
	end(slot0, "", slot2)
end

function globals.isImageExist(slot0)
	return display.textureCache:checkFullPath(slot0) ~= nil
end

function globals.LoadPngData(slot0)
end
