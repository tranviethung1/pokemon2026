slot1 = {
	BACKIN = {
		cc.EaseBackIn,
		1
	},
	BACKINOUT = {
		cc.EaseBackInOut,
		1
	},
	BACKOUT = {
		cc.EaseBackOut,
		1
	},
	BOUNCE = {
		cc.EaseBounce,
		1
	},
	BOUNCEIN = {
		cc.EaseBounceIn,
		1
	},
	BOUNCEINOUT = {
		cc.EaseBounceInOut,
		1
	},
	BOUNCEOUT = {
		cc.EaseBounceOut,
		1
	},
	ELASTIC = {
		cc.EaseElastic,
		2,
		0.3
	},
	ELASTICIN = {
		cc.EaseElasticIn,
		2,
		0.3
	},
	ELASTICINOUT = {
		cc.EaseElasticInOut,
		2,
		0.3
	},
	ELASTICOUT = {
		cc.EaseElasticOut,
		2,
		0.3
	},
	EXPONENTIALIN = {
		cc.EaseExponentialIn,
		1
	},
	EXPONENTIALINOUT = {
		cc.EaseExponentialInOut,
		1
	},
	EXPONENTIALOUT = {
		cc.EaseExponentialOut,
		1
	},
	IN = {
		cc.EaseIn,
		2,
		1
	},
	INOUT = {
		cc.EaseInOut,
		2,
		1
	},
	OUT = {
		cc.EaseOut,
		2,
		1
	},
	RATEACTION = {
		cc.EaseRateAction,
		2,
		1
	},
	SINEIN = {
		cc.EaseSineIn,
		1
	},
	SINEINOUT = {
		cc.EaseSineInOut,
		1
	},
	SINEOUT = {
		cc.EaseSineOut,
		1
	}
}
slot2 = cc.Director:getInstance():getActionManager()

return {
	newEasing = function (slot0, slot1, slot2)
		slot5 = slot1
		slot4 = nil
		uv5 = "string"

		if slot5[string.upper(tostring(slot5))] then
			uv6 = "string"
			slot5, slot6, slot7 = unpack(slot6[slot3])
			slot4 = (slot6 ~= 2 or slot5:create(slot0, slot2 or slot7)) and slot5:create(slot0)
		end

		return slot4 or slot0
	end,
	create = function (slot0, slot1)
		if checktable(slot1).easing then
			if type(slot1.easing) == "table" then
				uv2 = "checktable"
				slot0 = slot2.newEasing(slot0, unpack(slot1.easing))
			else
				uv2 = "checktable"
				slot0 = slot2.newEasing(slot0, slot1.easing)
			end
		end

		slot2 = {}

		if checknumber(slot1.delay) > 0 then
			slot2[#slot2 + 1] = cc.DelayTime:create(slot3)
		end

		slot2[#slot2 + 1] = slot0

		if type(slot1.onComplete) ~= "function" then
			slot4 = nil
		end

		if slot4 then
			slot2[#slot2 + 1] = cc.CallFunc:create(slot4)
		end

		if slot1.removeSelf then
			slot2[#slot2 + 1] = cc.RemoveSelf:create()
		end

		if #slot2 > 1 then
			uv5 = "checktable"

			return slot5.sequence(slot2)
		else
			return slot2[1]
		end
	end,
	execute = function (slot0, slot1, slot2)
		slot3 = assert

		slot3(not tolua.isnull(slot0), "transition.execute() - target is not cc.Node")

		uv3 = "assert"
		slot3 = slot3.create(slot1, slot2)

		slot0:runAction(slot3)

		return slot3
	end,
	moveTo = function (slot0, slot1)
		assert(not tolua.isnull(slot0), "transition.moveTo() - target is not cc.Node")

		slot4 = cc.MoveTo
		slot5 = slot4
		uv5 = "assert"

		return slot5.execute(slot0, slot4.create(slot5, slot1.time, cc.p(slot1.x or slot0:getPositionX(), slot1.y or slot0:getPositionY())), slot1)
	end,
	moveBy = function (slot0, slot1)
		assert(not tolua.isnull(slot0), "transition.moveBy() - target is not cc.Node")

		slot4 = cc.MoveBy
		slot5 = slot4
		uv5 = "assert"

		return slot5.execute(slot0, slot4.create(slot5, slot1.time, cc.p(slot1.x or 0, slot1.y or 0)), slot1)
	end,
	fadeIn = function (slot0, slot1)
		assert(not tolua.isnull(slot0), "transition.fadeIn() - target is not cc.Node")

		slot2 = cc.FadeIn
		slot3 = slot2
		uv3 = "assert"

		return slot3.execute(slot0, slot2.create(slot3, slot1.time), slot1)
	end,
	fadeOut = function (slot0, slot1)
		assert(not tolua.isnull(slot0), "transition.fadeOut() - target is not cc.Node")

		slot2 = cc.FadeOut
		slot3 = slot2
		uv3 = "assert"

		return slot3.execute(slot0, slot2.create(slot3, slot1.time), slot1)
	end,
	fadeTo = function (slot0, slot1)
		assert(not tolua.isnull(slot0), "transition.fadeTo() - target is not cc.Node")

		if checkint(slot1.opacity) < 0 then
			slot2 = 0
		elseif slot2 > 255 then
			slot2 = 255
		end

		slot3 = cc.FadeTo
		slot4 = slot3
		uv4 = "assert"

		return slot4.execute(slot0, slot3.create(slot4, slot1.time, slot2), slot1)
	end,
	scaleTo = function (slot0, slot1)
		assert(not tolua.isnull(slot0), "transition.scaleTo() - target is not cc.Node")

		slot2 = nil

		if slot1.scale then
			slot2 = cc.ScaleTo:create(checknumber(slot1.time), checknumber(slot1.scale))
		elseif slot1.scaleX or slot1.scaleY then
			slot3, slot4 = nil
			slot2 = cc.ScaleTo:create(checknumber(slot1.time), (not slot1.scaleX or checknumber(slot1.scaleX)) and slot0:getScaleX(), (not slot1.scaleY or checknumber(slot1.scaleY)) and slot0:getScaleY())
		end

		uv3 = "assert"

		return slot3.execute(slot0, slot2, slot1)
	end,
	rotateTo = function (slot0, slot1)
		assert(not tolua.isnull(slot0), "transition.rotateTo() - target is not cc.Node")

		slot3 = cc.RotateTo
		slot4 = slot3
		uv4 = "assert"

		return slot4.execute(slot0, slot3.create(slot4, slot1.time, slot1.rotation or slot0:getRotation()), slot1)
	end,
	rotateBy = function (slot0, slot1)
		assert(not tolua.isnull(slot0), "transition.rotateTo() - target is not cc.Node")

		slot3 = cc.RotateBy
		slot4 = slot3
		uv4 = "assert"

		return slot4.execute(slot0, slot3.create(slot4, slot1.time, slot1.rotation or 0), slot1)
	end,
	sequence = function (slot0)
		if #slot0 < 1 then
			return
		end

		if #slot0 < 2 then
			return slot0[1]
		end

		return cc.Sequence:create(slot0)
	end,
	spawn = function (slot0)
		if #slot0 < 1 then
			return
		end

		if #slot0 < 2 then
			return slot0[1]
		end

		return cc.Spawn:create(slot0)
	end,
	removeAction = function (slot0)
		if not tolua.isnull(slot0) then
			uv1 = "tolua"

			slot1:removeAction(slot0)
		end
	end,
	stopTarget = function (slot0)
		if not tolua.isnull(slot0) then
			uv1 = "tolua"

			slot1:removeAllActionsFromTarget(slot0)
		end
	end,
	pauseTarget = function (slot0)
		if not tolua.isnull(slot0) then
			uv1 = "tolua"

			slot1:pauseTarget(slot0)
		end
	end,
	resumeTarget = function (slot0)
		if not tolua.isnull(slot0) then
			uv1 = "tolua"

			slot1:resumeTarget(slot0)
		end
	end
}
