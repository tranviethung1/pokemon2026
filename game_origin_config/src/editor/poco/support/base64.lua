slot1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

return {
	enc = function (slot0)
		return (slot0:gsub(".", function (slot0)
			slot2 = slot0:byte()

			for slot6 = 8, 1, -1 do
				slot1 = "" .. (slot2 % 2^slot6 - slot2 % 2^(slot6 - 1) > 0 and "1" or "0")
			end

			return slot1
		end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function (slot0)
			if #slot0 < 6 then
				return ""
			end

			for slot5 = 1, 6 do
				slot1 = 0 + (slot0:sub(slot5, slot5) == "1" and 2^(6 - slot5) or 0)
			end

			uv2 = ""

			return slot2:sub(slot1 + 1, slot1 + 1)
		end) .. ({
			"",
			"==",
			"="
		})[#slot0 % 3 + 1]
	end,
	dec = function (slot0)
		uv4 = "string"

		return string.gsub(slot0, "[^" .. slot4 .. "=]", ""):gsub(".", function (slot0)
			if slot0 == "=" then
				return ""
			end

			uv2 = "="
			slot2 = slot2:find(slot0) - 1

			for slot6 = 6, 1, -1 do
				slot1 = "" .. (slot2 % 2^slot6 - slot2 % 2^(slot6 - 1) > 0 and "1" or "0")
			end

			return slot1
		end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function (slot0)
			if #slot0 ~= 8 then
				return ""
			end

			for slot5 = 1, 8 do
				slot1 = 0 + (slot0:sub(slot5, slot5) == "1" and 2^(8 - slot5) or 0)
			end

			return string.char(slot1)
		end)
	end
}
