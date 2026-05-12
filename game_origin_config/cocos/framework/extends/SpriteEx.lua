slot0 = cc.Sprite

function slot0.playAnimationOnce(slot0, slot1, slot2)
	slot3 = {}

	if slot2.showDelay then
		slot0:setVisible(false)

		slot3[#slot3 + 1] = cc.DelayTime:create(slot4)
		slot3[#slot3 + 1] = cc.Show:create()
	end

	if (slot2.delay or 0) > 0 then
		slot3[#slot3 + 1] = cc.DelayTime:create(slot5)
	end

	slot3[#slot3 + 1] = cc.Animate:create(slot1)

	if slot2.removeSelf then
		slot3[#slot3 + 1] = cc.RemoveSelf:create()
	end

	if slot2.onComplete then
		slot3[#slot3 + 1] = cc.CallFunc:create(slot2.onComplete)
	end

	slot6 = nil
	slot6 = (#slot3 <= 1 or cc.Sequence:create(slot3)) and slot3[1]

	slot0:runAction(slot6)

	return slot6
end

function slot0.playAnimationForever(slot0, slot1)
	slot3 = cc.RepeatForever:create(cc.Animate:create(slot1))

	slot0:runAction(slot3)

	return slot3
end

function slot0.onClick(slot0, slot1)
	slot4 = cc.EventListenerTouchOneByOne:create()

	slot4:setSwallowTouches(true)
	slot4:registerScriptHandler(function ()
		return true
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot4:registerScriptHandler(function (slot0, slot1)
		slot3 = slot1
		uv3 = "getCurrentTarget"

		if slot3 then
			uv3 = "getCurrentTarget"

			slot3(slot1.getCurrentTarget(slot3), slot0)
		end
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot4, slot0)
end
