slot0 = class("RayEffect", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)
end

function slot0.onAddRayEffect(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot3.deep
	slot6 = slot3.aniName
	slot7 = slot3.scaleX or 1
	slot9 = slot3.offsetPos
	slot10 = (slot3.startDelayTime or 0) / 1000
	slot11 = (slot3.time or 1000) / 1000
	slot12 = (slot3.endDelayTime or 0) / 1000
	slot13 = slot0:call("getSceneObj", slot1)
	slot14 = slot0:call("getSceneObj", slot2)

	if not slot3.effectRes or not slot13 or not slot14 then
		return
	end

	slot15 = slot13.force == 2 and -1 or 1
	slot19 = newCSpriteWithOption(slot8)

	slot19:addTo(slot13, slot5)
	slot19:setPosition(cc.pAdd(slot13.unitCfg.everyPos.hitPos, slot9 and cc.p(slot15 * slot9.x, slot9.y) or cc.p(slot15 * 0, 0)))
	slot19:play(slot6)
	slot19:setVisible(true)

	slot19.boxWidth = slot19:getBoundingBox().width
	slot20, slot21 = slot13:getSelfPos()
	slot22, slot23 = slot14:getSelfPos()
	slot24 = slot22 - slot20
	slot25 = slot23 - slot21 - (slot13.unitCfg.everyPos.hitPos.y - slot14.unitCfg.everyPos.hitPos.y)

	slot19:scaleX(0):setRotation(-(math.atan2(slot25, slot24) * 180 / math.pi))
	transition.executeSequence(slot19):delay(slot10):func(function ()
		uv0 = "play"
		uv2 = "play"

		slot0:play(slot2)
	end):scaleTo(slot11, slot7 * math.sqrt(slot24 * slot24 + slot25 * slot25) / slot19.boxWidth, 1):done()
	performWithDelay(slot19, function ()
		uv1 = "removeCSprite"

		removeCSprite(slot1)
	end, slot10 + slot11 + slot12)
end

return slot0
