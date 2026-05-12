math.newrandomseed()

if ymrand then
	ymrand.randomseed(os.time() + math.random())

	ymrand.randCount = 0
	slot0 = ymrand.random

	function ymrand.random(...)
		slot0 = ymrand
		slot0.randCount = ymrand.randCount + 1
		uv0 = "ymrand"

		return slot0(...)
	end
end

for slot4 = 1, math.random(5, 10) do
	math.random()
	cc.random()
end

slot1 = {}
globals.random = slot1

function slot1.choice(slot0)
	assert(slot0 and next(slot0), "seq is empty")

	return slot0[math.random(1, table.length(slot0))]
end

function slot1.sample(slot0, slot1, slot2)
	slot2 = slot2 or math.random
	slot3 = table.length(slot0)

	if slot1 == 0 then
		return {}
	end

	if slot3 <= slot1 then
		return slot0
	end

	slot4 = {}
	slot5 = {}

	if slot3 > 50 then
		for slot9 = 1, slot1 do
			while slot5[slot2(1, slot3)] do
				slot10 = slot2(1, slot3)
			end

			slot5[slot10] = true
		end

		for slot9, slot10 in pairs(slot5) do
			table.insert(slot4, slot0[slot9])
		end
	else
		for slot9 = 1, slot3 do
			table.insert(slot5, slot9)
		end

		for slot9 = 1, slot1 do
			slot10 = slot2(slot9, slot3)
			slot5[slot9] = slot5[slot10]
			slot5[slot10] = slot5[slot9]

			table.insert(slot4, slot0[slot5[slot9]])
		end
	end

	return slot4
end

function slot1.shuffle(slot0, slot1)
	for slot6 = 1, table.length(slot0) do
		slot7 = slot1 or math.random(0, slot2 - slot6) + slot6
		slot0[slot7] = slot0[slot6]
		slot0[slot6] = slot0[slot7]
	end

	return slot0
end

function slot1.triangular(slot0, slot1, slot2)
	u = math.random()
	c = 0.5

	if slot2 then
		c = 1 * (slot2 - slot0) / (slot1 - slot0)
	end

	if c < u then
		u = 1 - u
		c = 1 - c
		slot0 = slot0
	end

	return slot0 + (slot1 - slot0) * (u * c)^0.5
end
