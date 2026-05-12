require("easy.richtext")

slot0 = string.utf8charlen
globals.StreamRichText = class("StreamRichText", ccui.RichText)

function StreamRichText.ctor(slot0, slot1, slot2)
	slot0.nElems = 0
	slot0.elems = rich.createElemsWithWidth(slot1, nil, , slot2)
	slot0.curLen = 0
	slot0.targetLen = 0
end

function StreamRichText.showWithLen(slot0, slot1)
	slot0:clear()

	slot0.targetLen = slot1

	for slot5, slot6 in ipairs(slot0.elems) do
		slot7 = slot6[1]
		slot9, slot10, slot11, slot12, slot13 = unpack(slot6[2])

		if slot0:addElement(slot11, slot9, slot10, slot12, slot13) then
			return
		end
	end
end

function StreamRichText.getLen(slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.elems) do
		slot7 = slot6[1]
		slot9, slot10, slot11, slot12, slot13 = unpack(slot6[2])
		slot14 = 1

		while slot14 <= #slot11 do
			slot16 = slot11
			slot15 = slot11.byte(slot16, slot14)
			uv16 = "ipairs"
			slot14 = slot14 + slot16(slot15)

			if slot15 ~= 10 then
				slot1 = slot1 + 1
			end
		end
	end

	return slot1
end

function StreamRichText.clear(slot0)
	for slot4 = slot0.nElems - 1, 0, -1 do
		slot0:removeElement(slot4)
	end

	slot0.nElems = 0
	slot0.curLen = 0
end

function StreamRichText.addElement(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = 1
	slot7 = 1

	while slot7 <= #slot1 and slot0.curLen + 0 < slot0.targetLen do
		slot10 = slot1
		slot9 = slot1.byte(slot10, slot7)
		uv10 = "curLen"
		slot7 = slot7 + slot10(slot9)

		if slot9 ~= 10 then
			slot8 = slot8 + 1
		end
	end

	slot0:pushBackElement(ccui.RichElementText:create(slot6, slot2, slot3, slot1:sub(1, slot7 - 1), slot4, slot5))

	slot0.nElems = slot0.nElems + 1
	slot0.curLen = slot0.curLen + slot8

	if slot0.targetLen <= slot0.curLen then
		return true
	end
end
