slot0 = {}
globals.tjuidebug = slot0

function slot0.getDebugBox(slot0, slot1, slot2, slot3, slot4)
	display.director:setFontAutoScaleDownEnabled(false)

	slot3 = slot3 or 3
	slot5 = cc.DrawNode:create()
	slot6 = slot0:getParent():convertToWorldSpace(cc.p(slot0:getPosition()))
	slot9 = slot0:getContentSize()
	slot10 = slot0:getBoundingBox()
	slot11 = slot0:getAnchorPoint()

	slot5:drawSegment(cc.p(0, 0), cc.p(slot10.width, 0), slot3, slot2)
	slot5:drawSegment(cc.p(slot10.width, 0), cc.p(slot10.width, slot10.height), slot3, slot2)
	slot5:drawSegment(cc.p(slot10.width, slot10.height), cc.p(0, slot10.height), slot3, slot2)
	slot5:drawSegment(cc.p(0, slot10.height), cc.p(0, 0), slot3, slot2)
	slot5:drawSegment(cc.p(0, 0), cc.p(slot10.width, slot10.height), slot3, slot2)
	slot5:drawDot(cc.p(slot10.width * slot11.x, slot10.height * slot11.y), 6, slot2)
	slot5:setPosition(slot6.x - slot10.width * slot11.x, slot6.y - slot10.height * slot11.y)

	slot14 = cc.Label:createWithTTF(slot1, ui.FONT_PATH, 60)

	slot14:enableOutline(cc.c4b(0, 0, 0, 255), 3)
	slot14:setPosition(slot10.width * slot11.x, slot10.height * slot11.y):name("label")

	if slot4 then
		slot14:setTextColor(slot4)
	end

	slot5:addChild(slot14)
	display.director:setFontAutoScaleDownEnabled(true)

	return slot5
end

function slot1(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0:getChildren()) do
		uv8 = "pairs"

		slot8(slot7, slot1, slot2)

		if slot2(slot7) then
			slot9 = math.random()
			slot8 = cc.c4f(slot9, math.random(), math.random(), 1)
			uv9 = "getChildren"

			slot1:add(slot9.getDebugBox(slot7, tj.type(slot7), slot8, 1, cc.convertColor(slot8, "4b")))
		end
	end
end

function slot0.showDebugBox(slot0, slot1)
	slot2 = cc.Node
	slot3 = slot2
	slot2 = slot2.create(slot3)
	uv3 = "cc"

	slot3(slot0, slot2, slot1)
	gGameUI.uiRoot:removeChildByName("_debug_node_")
	gGameUI.uiRoot:addChild(slot2, 0, "_debug_node_")
end
