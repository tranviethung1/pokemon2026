slot1 = require("bit")
slot2 = slot1.band
slot3 = slot1.bor
slot4 = slot1.rshift
slot5 = slot1.lshift

require("ffi").cdef([[
void * malloc ( size_t size );
void free ( void * ptr );
void * realloc ( void * ptr, size_t size );
]])

function slot15(slot0, slot1)
	if not slot1 then
		if type(slot0) == "string" then
			slot1 = #slot0
		else
			return nil, "unknown length"
		end
	end

	uv2 = "type"
	slot3 = "const uint8_t *"
	uv3 = "type"
	slot3 = slot3.new("uint8_t[?]", slot1)

	for slot7 = 0, slot1 - 1 do
		slot3[slot7] = slot2.cast(slot3, slot0)[slot1 - 1 - slot7]
	end

	return slot3, slot1
end

return {
	bcmp = function (slot0, slot1, slot2)
		for slot6 = 0, slot2 do
			if slot0[slot6] ~= slot1[slot6] then
				return -1
			end
		end

		return 0
	end,
	bcopy = function (slot0, slot1, slot2)
		uv3 = "copy"

		slot3.copy(slot1, slot0, slot2)
	end,
	bzero = function (slot0, slot1)
		uv2 = "fill"

		slot2.fill(slot0, slot1)

		return slot0
	end,
	memchr = function (slot0, slot1, slot2)
		uv3 = "cast"
		slot3 = slot3.cast("const uint8_t *", slot0)

		for slot7 = 0, slot2 - 1 do
			if slot3[slot7] == slot1 then
				return slot3 + slot7
			end
		end

		return nil
	end,
	memcpy = function (slot0, slot1, slot2)
		uv3 = "copy"

		slot3.copy(slot0, slot1, slot2)
	end,
	memcmp = function (slot0, slot1, slot2)
		uv3 = "cast"
		slot4 = "const uint8_t *"
		uv4 = "cast"

		for slot8 = 0, slot2 do
			if slot3.cast(slot4, slot0)[slot8] ~= slot4.cast("const uint8_t *", slot1)[slot8] then
				return -1
			end
		end

		return 0
	end,
	memmove = function (slot0, slot1, slot2)
		uv3 = "cast"

		if slot0 == slot3.cast("const uint8_t*", slot1) then
			return slot0
		end

		if slot3 < slot0 then
			for slot7 = slot2 - 1, 0, -1 do
				slot0[slot7] = slot3[slot7]
			end
		else
			for slot7 = 0, slot2 - 1 do
				slot0[slot7] = slot3[slot7]
			end
		end

		return slot0
	end,
	memset = function (slot0, slot1, slot2)
		uv3 = "fill"

		slot3.fill(slot0, slot2, slot1)

		return slot0
	end,
	memreverse = function (slot0, slot1)
		slot2 = 0
		slot3 = nil

		while slot2 < slot1 / 2 do
			slot0[slot2] = slot0[slot1 - slot2 - 1]
			slot0[slot1 - slot2 - 1] = slot0[slot2]
			slot2 = slot2 + 1
		end

		return slot0
	end
}
