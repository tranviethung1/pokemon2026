globals.tip = {}

function tip.adaptView(slot0, slot1, slot2)
	slot4 = slot2.dir

	if not slot2.relativeNode or not slot0 then
		return
	end

	if not slot2.canvasDir or slot5 == "" then
		slot5 = "vertical"
	end

	slot6 = slot2.offx or 0
	slot7 = slot2.offy or 0
	slot8 = 14
	slot9 = slot3:getBoundingBox()
	slot11 = gGameUI:getConvertPos(slot3, slot2.node)
	slot12 = slot11.x
	slot13 = slot11.y
	slot14 = slot0:getResourceNode()
	slot15 = slot14:getBoundingBox()
	slot18 = slot14:getBoundingBox()

	if slot2.childsName and itertools.size(slot16) > 0 then
		slot18 = slot14:get(unpack(slot16)):size()
	end

	slot19 = slot14:getAnchorPoint()
	slot20 = slot3:getAnchorPoint()
	slot21 = 0
	slot22 = 0

	function slot23(slot0, slot1)
		uv2 = "height"
		uv3 = "y"
		uv4 = "x"

		if slot1 > slot2.height - (1 - slot3.y) * slot4.height then
			uv2 = "height"
			uv3 = "y"
			uv4 = "x"
			slot1 = slot2.height - (1 - slot3.y) * slot4.height
		else
			uv2 = "y"
			uv3 = "x"

			if slot1 < slot2.y * slot3.height then
				uv2 = "y"
				uv3 = "x"
				slot1 = slot2.y * slot3.height
			end
		end

		uv2 = "y"
		uv3 = "x"
		slot3 = slot3.width
		uv3 = "height"

		if slot0 < slot2.x * slot3 + slot3.x then
			uv2 = "y"
			uv3 = "x"
			slot3 = slot3.width
			uv3 = "height"
			slot0 = slot2.x * slot3 + slot3.x
		else
			uv2 = "height"
			uv3 = "y"
			uv4 = "x"
			slot3 = (1 - slot3.x) * slot4.width
			uv3 = "height"

			if slot0 > slot2.width - slot3 + slot3.x then
				uv2 = "height"
				uv3 = "y"
				uv4 = "x"
				slot3 = (1 - slot3.x) * slot4.width
				uv3 = "height"
				slot0 = slot2.width - slot3 + slot3.x
			end
		end

		return slot0, slot1
	end

	slot24 = {
		top = function ()
			uv0 = "height"
			uv1 = "width"
			uv2 = "x"
			slot2 = slot2.height
			slot1 = (1 - slot1.y) * slot2
			uv1 = "cc"
			uv2 = "p"
			slot2 = slot2.y
			slot1 = slot1.height * slot2
			uv1 = "y"
			uv0 = 1
			uv0 = "height"
			uv1 = "x"
			uv2 = "width"
			slot2 = slot2.x
			slot1 = slot1.width * slot2
			uv1 = "x"
			slot1 = slot0 + slot1 + slot1 + slot1 - slot1 + slot1.width / 2
			uv8 = 2
			uv2 = "x"
			uv3 = "width"
			uv4 = "cc"
			uv4 = "y"
			uv5 = "p"

			return cc.p(slot2(slot3 + slot4, slot4 + slot5))
		end,
		right = function ()
			uv0 = "x"
			uv1 = "height"
			uv2 = "y"
			slot2 = 1 - slot2.x
			slot1 = slot1.width * slot2
			uv1 = "cc"
			uv2 = "p"
			slot2 = slot2.x
			slot1 = slot1.width * slot2
			uv1 = "width"
			uv0 = 1
			uv0 = "x"
			uv1 = "height"
			uv2 = "y"
			slot2 = slot2.y
			slot1 = slot1.height * slot2
			uv1 = "height"
			slot1 = slot0 + slot1 + slot1 + slot1 - slot1 + slot1.height / 2
			uv8 = 2
			uv2 = "y"
			uv3 = "width"
			uv4 = "cc"
			uv4 = "height"
			uv5 = "p"

			return cc.p(slot2(slot3 + slot4, slot4 + slot5))
		end,
		down = function ()
			uv0 = "height"
			uv1 = "width"
			uv2 = "x"
			slot2 = slot2.height
			slot1 = slot1.y * slot2
			uv1 = "cc"
			uv2 = "p"
			slot2 = 1 - slot2.y
			slot1 = slot1.height * slot2
			uv1 = "y"
			uv0 = 1
			uv0 = "height"
			uv1 = "x"
			uv2 = "width"
			slot2 = slot2.x
			slot1 = slot1.width * slot2
			uv1 = "x"
			slot1 = slot0 - slot1 - slot1 - slot1 - slot1 + slot1.width / 2
			uv8 = 2
			uv2 = "x"
			uv3 = "width"
			uv4 = "cc"
			uv4 = "y"
			uv5 = "p"

			return cc.p(slot2(slot3 + slot4, slot4 + slot5))
		end,
		left = function ()
			uv0 = "x"
			uv1 = "height"
			uv2 = "y"
			slot2 = slot2.x
			slot1 = slot1.width * slot2
			uv1 = "cc"
			uv2 = "p"
			slot2 = 1 - slot2.x
			slot1 = slot1.width * slot2
			uv1 = "width"
			uv0 = 1
			uv0 = "x"
			uv1 = "height"
			uv2 = "y"
			slot2 = slot2.y
			slot1 = slot1.height * slot2
			uv1 = "height"
			slot1 = slot0 - slot1 - slot1 - slot1 - slot1 + slot1.height / 2
			uv8 = 2
			uv2 = "y"
			uv3 = "width"
			uv4 = "cc"
			uv4 = "height"
			uv5 = "p"

			return cc.p(slot2(slot3 + slot4, slot4 + slot5))
		end
	}

	slot14:setPosition((slot4 and slot4 ~= "" or slot24[slot25.width / 2 <= slot11.x and "left" or "right"]()) and slot24[slot4]())
	slot0:z(slot2.z or 9999)
end

function tip.create(slot0, slot1, slot2, ...)
	if gGameUI:createView(slot0, slot1):init(...) then
		uv4 = "gGameUI"

		slot4(slot3, slot1, slot2)
	end

	return slot3
end
