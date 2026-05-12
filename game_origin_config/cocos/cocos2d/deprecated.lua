function schedule(slot0, slot1, slot2)
	slot5 = cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(slot2), cc.CallFunc:create(slot1)))

	slot0:runAction(slot5)

	return slot5
end

function performWithDelay(slot0, slot1, slot2)
	slot5 = cc.Sequence:create(cc.DelayTime:create(slot2), cc.CallFunc:create(function ()
		if gGameApp then
			uv2 = "gGameApp"

			gGameApp:onViewSchedule(slot2)
		end

		uv0 = "onViewSchedule"

		slot0()

		if gGameApp then
			gGameApp:onViewSchedule(nil)
		end
	end))

	slot0:runAction(slot5)

	return slot5
end
