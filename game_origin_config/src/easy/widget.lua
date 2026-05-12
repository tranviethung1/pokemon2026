slot0 = {}
globals.widget = slot0

function slot0.addAnimation(slot0, slot1, slot2, slot3)
	uv4 = "addAnimationByKey"

	return slot4.addAnimationByKey(slot0, slot1, slot1, slot2, slot3)
end

function slot0.addAnimationByKey(slot0, slot1, slot2, slot3, slot4)
	slot5 = nil

	if slot2 and slot0:getChildByName(slot2) then
		return slot5
	end

	slot5 = CSprite.new(string.trim(slot1))

	slot5:play(slot3 or "effect")
	slot0:addChild(slot5, slot4 or 0, slot1)
	slot5:setName(slot2)

	return slot5
end
