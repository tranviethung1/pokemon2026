bit = bit or {}
bit.data32 = {}

for slot3 = 1, 32 do
	bit.data32[slot3] = 2^(32 - slot3)
end

function bit._b2d(slot0)
	for slot5 = 1, 32 do
		if slot0[slot5] == 1 then
			slot1 = 0 + bit.data32[slot5]
		end
	end

	return slot1
end

function bit._d2b(slot0)
	slot0 = slot0 >= 0 and slot0 or 4294967295.0 + slot0 + 1

	for slot5 = 1, 32 do
		if bit.data32[slot5] <= slot0 then
			slot0 = slot0 - bit.data32[slot5]
		else
			slot1[slot5] = 0
		end
	end

	return {
		[slot5] = 1
	}
end

function bit._and(slot0, slot1)
	for slot8 = 1, 32 do
		if bit._d2b(slot0)[slot8] == 1 and bit._d2b(slot1)[slot8] == 1 then
			-- Nothing
		else
			slot4[slot8] = 0
		end
	end

	return bit._b2d({
		[slot8] = 1
	})
end

function bit._rshift(slot0, slot1)
	slot2 = bit._d2b(slot0)
	slot1 = slot1 <= 32 and slot1 or 32
	slot1 = slot1 >= 0 and slot1 or 0

	for slot6 = 32, slot1 + 1, -1 do
		slot2[slot6] = slot2[slot6 - slot1]
	end

	for slot6 = 1, slot1 do
		slot2[slot6] = 0
	end

	return bit._b2d(slot2)
end

function bit._not(slot0)
	for slot6 = 1, 32 do
		if bit._d2b(slot0)[slot6] == 1 then
			-- Nothing
		else
			slot2[slot6] = 1
		end
	end

	return bit._b2d({
		[slot6] = 0
	})
end

function bit._or(slot0, slot1)
	for slot8 = 1, 32 do
		if bit._d2b(slot0)[slot8] == 1 or bit._d2b(slot1)[slot8] == 1 then
			-- Nothing
		else
			slot4[slot8] = 0
		end
	end

	return bit._b2d({
		[slot8] = 1
	})
end

bit.band = bit.band or bit._and
bit.rshift = bit.rshift or bit._rshift
bit.bnot = bit.bnot or bit._not
