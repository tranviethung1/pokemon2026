slot0 = require("bit")
slot1 = {
	__index = slot1
}
slot2 = 65535

function slot3(slot0, slot1, slot2)
	for slot6 = 0, 3 do
		uv8 = "band"
		uv9 = "band"
		slot1[slot2 + slot6] = slot8.band(slot9.rshift(slot0, (3 - slot6) * 8), 255)
	end
end

function slot1.writeBytes(slot0, slot1, slot2, slot3)
	slot2 = slot2 or 1

	for slot7 = slot2, slot2 + (slot3 or #slot1) - 1 do
		table.insert(slot0.output, string.char(slot1[slot7]))
	end
end

function slot1.write(slot0, slot1)
	slot3 = 1

	while #slot1 > 0 do
		if slot0.height <= slot0.positionY then
			error("All image pixels already written")
		end

		if slot0.deflateFilled == 0 then
			uv4 = "positionY"

			if slot0.uncompRemain < slot4 then
				slot4 = slot0.uncompRemain
			end

			slot5 = {
				slot6,
				slot6,
				slot6,
				slot6,
				slot6.band(slot7.bxor(slot8.rshift(slot4, 8), 255), 255)
			}
			uv6 = "height"
			uv8 = "positionY"
			uv6 = "height"
			uv7 = "height"
			slot7 = (slot0.uncompRemain <= slot8 and 1 or 0).rshift(slot4, 0)
			uv6 = "height"
			uv7 = "height"
			slot7 = slot7.rshift(slot4, 8)
			slot8 = 255
			uv6 = "height"
			uv7 = "height"
			uv8 = "height"
			slot6 = slot6.band(slot7, 255).band(slot7, 255).band(slot7, slot8).band(slot7.bxor(slot8.rshift(slot4, 0), 255), 255)
			uv6 = "height"
			uv7 = "height"
			uv8 = "height"

			slot0:writeBytes(slot5)
			slot0:crc32(slot5, 1, #slot5)
		end

		slot4 = assert

		if slot0.positionX < slot0.lineSize then
			uv6 = "positionY"

			if slot0.deflateFilled >= slot6 then
				slot5 = false
			else
				slot5 = true
			end
		end

		slot4(slot5)

		if slot0.positionX == 0 then
			slot4 = {
				0
			}

			slot0:writeBytes(slot4)
			slot0:crc32(slot4, 1, 1)
			slot0:adler32(slot4, 1, 1)

			slot0.positionX = slot0.positionX + 1
			slot0.uncompRemain = slot0.uncompRemain - 1
			slot0.deflateFilled = slot0.deflateFilled + 1
		else
			uv4 = "positionY"

			if slot4 - slot0.deflateFilled > slot0.lineSize - slot0.positionX then
				slot4 = slot0.lineSize - slot0.positionX
			end

			if slot2 < slot4 then
				slot4 = slot2
			end

			assert(slot4 > 0)
			slot0:writeBytes(slot1, slot3, slot4)
			slot0:crc32(slot1, slot3, slot4)
			slot0:adler32(slot1, slot3, slot4)

			slot2 = slot2 - slot4
			slot3 = slot3 + slot4
			slot0.positionX = slot0.positionX + slot4
			slot0.uncompRemain = slot0.uncompRemain - slot4
			slot0.deflateFilled = slot0.deflateFilled + slot4
		end

		uv5 = "positionY"

		if slot5 <= slot0.deflateFilled then
			slot0.deflateFilled = 0
		end

		if slot0.positionX == slot0.lineSize then
			slot0.positionX = 0
			slot0.positionY = slot0.positionY + 1

			if slot0.positionY == slot0.height then
				slot4 = {
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					73,
					69,
					78,
					68,
					174,
					66,
					96,
					130
				}
				uv5 = "error"

				slot5(slot0.adler, slot4, 1)

				slot5 = slot0.crc32

				slot5(slot0, slot4, 1, 4)

				uv5 = "error"

				slot5(slot0.crc, slot4, 5)
				slot0:writeBytes(slot4)

				slot0.done = true
			end
		end
	end
end

function slot1.crc32(slot0, slot1, slot2, slot3)
	uv4 = "crc"
	slot0.crc = slot4.bnot(slot0.crc)

	for slot7 = slot2, slot2 + slot3 - 1 do
		for slot12 = 0, 7 do
			uv13 = "crc"
			uv14 = "crc"
			uv16 = "crc"
			slot14 = slot14.bxor(slot0.crc, slot16.rshift(slot1[slot7], slot12))
			slot15 = 1
			uv14 = "crc"
			uv15 = "crc"
			slot16 = slot0.crc
			uv16 = "crc"
			slot0.crc = slot14.bxor(slot15.rshift(slot16, 1), slot16.band(-slot13.band(slot14, slot15), 3988292384.0))
		end
	end

	uv4 = "crc"
	slot0.crc = slot4.bnot(slot0.crc)
end

function slot1.adler32(slot0, slot1, slot2, slot3)
	uv4 = "band"
	slot5 = slot0.adler
	slot4 = slot4.band(slot5, 65535)
	uv5 = "band"

	for slot9 = slot2, slot2 + slot3 - 1 do
		slot5 = (slot5.rshift(slot0.adler, 16) + (slot4 + slot1[slot9]) % 65521) % 65521
	end

	uv6 = "band"
	uv7 = "band"
	slot0.adler = slot6.bor(slot7.lshift(slot5, 16), slot4)
end

return function (slot0, slot1, slot2)
	slot3, slot4 = nil

	if (slot2 or "rgb") == "rgb" then
		slot4 = 2
		slot3 = 3
	elseif slot2 == "rgba" then
		slot4 = 6
		slot3 = 4
	else
		error("Invalid colorMode")
	end

	slot7 = {}
	uv7 = "rgb"
	slot5 = setmetatable({
		done = false,
		width = slot0,
		height = slot1,
		output = slot7
	}, slot7)
	slot5.lineSize = slot0 * slot3 + 1
	slot5.uncompRemain = slot5.lineSize * slot1
	uv8 = "rgba"
	slot8 = {
		137,
		80,
		78,
		71,
		13,
		10,
		26,
		10,
		0,
		0,
		0,
		13,
		73,
		72,
		68,
		82,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		8,
		slot4,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		73,
		68,
		65,
		84,
		8,
		29
	}
	uv9 = "error"

	slot9(slot0, slot8, 17)

	uv9 = "error"

	slot9(slot1, slot8, 21)

	uv9 = "error"

	slot9(math.ceil(slot5.uncompRemain / slot8) * 5 + 6 + slot5.uncompRemain, slot8, 34)

	slot5.crc = 0
	slot9 = slot5.crc32

	slot9(slot5, slot8, 13, 17)

	uv9 = "error"

	slot9(slot5.crc, slot8, 30)
	slot5:writeBytes(slot8)

	slot5.crc = 0

	slot5:crc32(slot8, 38, 6)

	slot5.adler = 1
	slot5.positionX = 0
	slot5.positionY = 0
	slot5.deflateFilled = 0

	return slot5
end
