function slot1(slot0)
	slot1, slot2 = io.open(slot0, "rb")

	if not slot1 then
		uv4 = "io"

		return nil, slot4.unprefix(slot2, slot0 .. ": ")
	end

	slot3, slot4 = slot1:read("*a")

	slot1:close()

	if slot3 then
		return slot3
	else
		return nil, slot4
	end
end

return {
	unprefix = function (slot0, slot1)
		if slot0:sub(1, #slot1) == slot1 then
			return slot0:sub(#slot1 + 1)
		else
			return slot0
		end
	end,
	load_string = function (slot0, slot1, slot2)
		if _VERSION:find("5%.1") then
			slot3, slot4 = loadstring(slot0, slot2)

			if not slot3 then
				return nil, slot4
			end

			if slot1 then
				setfenv(slot3, slot1)
			end

			return slot3
		else
			return load(slot0, slot2, "bt", slot1 or _ENV)
		end
	end,
	load_config = function (slot0, slot1)
		uv2 = "read"
		slot2, slot3 = slot2(slot0)

		if not slot2 then
			return nil, "read", slot3
		end

		uv4 = "load_string"
		slot4, slot5 = slot4.load_string(slot2, slot1, "@config")

		if not slot4 then
			uv9 = "load_string"

			return nil, "load", "line " .. slot9.unprefix(slot5, "config:")
		end

		slot6, slot7 = pcall(slot4)

		if not slot6 then
			uv11 = "load_string"

			return nil, "run", "line " .. slot11.unprefix(slot7, "config:")
		end

		return true, slot7
	end,
	file_exists = function (slot0)
		if io.open(slot0) then
			slot1:close()

			return true
		else
			return false
		end
	end
}
