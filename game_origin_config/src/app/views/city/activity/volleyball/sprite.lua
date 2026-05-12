slot0 = 20
slot1 = class("spriteModel")

function slot1.ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.netPos = slot1
	slot0.netSize = slot2
	slot5 = nil
	slot0.image = slot5
	uv5 = "netPos"
	slot0.tick = slot5
	slot0.updateRate = 0
	slot0.turn = slot4 == 1 and 1 or -1
	slot0.force = slot4
	slot0.floorY = 170
	slot0.hitBallY = 350
	slot0.speed = cc.p(0, 0)
	slot0.optimalFallArea = {
		350,
		500
	}
	slot0.slowSpeedSign = false
	slot0.slowSpeedRate = 1
	slot0.stockpileSign = false
	slot0.stockpileForce = 0
	slot0.skillHitTimes = {
		0,
		0
	}
	slot0.batSign = false
	slot0.batTimes = 0
	slot0.spikeSwitch = false
	slot0.pos = cc.p(0, 0)
	slot0.offset = cc.p(slot0.turn * slot3.hitOffsetPos.x, slot3.hitOffsetPos.y)
	slot0.headCenterPos = cc.pAdd(slot0.pos, slot0.offset)
	slot0.data = slot3
	slot0.res = slot3.res
	slot0.nowScale = slot3.scale
	slot0.power = slot3.power
	slot0.gravity = slot3.gravity
	slot0.hitRadius = slot3.hitRadius
	slot0.lrSpeedDelta = slot3.lrSpeedDelta
	slot0.udSpeedDelta = slot3.udSpeedDelta
	slot0.failRate = slot3.failRate
	slot0.operateAni = "run_loop"
end

function slot1.createImage(slot0, slot1, slot2, slot3)
	slot5 = slot0.netPos.x - slot0.turn * 800
	slot6 = slot0.floorY
	slot0.originPos = cc.p(slot5, slot6)
	slot0.image = widget.addAnimationByKey(slot1, slot0.res, slot0.force .. "image", "run_loop", slot0.force == 1 and 9 or 7):xy(slot5, slot6):scaleX(slot0.turn * slot0.nowScale):scaleY(slot0.nowScale):anchorPoint(0.5, 0.5)
	slot0.pos = cc.p(slot5, slot6)
	slot0.headCenterPos = cc.pAdd(slot0.pos, slot0.offset)
	slot0.stockPile = slot2
	slot0.stockPilePro = slot3
	slot0.stockPileEffect = widget.addAnimationByKey(slot1, "volleyball_xuli/xuli.skel", slot0.force .. "stockEffect", "xuli_loop", 10):xy(slot0.pos.x, slot0.floorY):scale(1.5):anchorPoint(0.5, 0.5):hide()
	slot0.controlEffect = widget.addAnimationByKey(slot1, "volleyball_buff/buff.skel", slot0.force .. "controlEffect", "jiansu_loop", 15):xy(slot0.pos.x, slot0.floorY):scale(1.5):anchorPoint(0.5, 0.5):hide()
end

function slot1.deleteImage(slot0)
	slot0.image:removeSelf()
	slot0.stockPile:hide()
end

function slot1.reset(slot0)
	slot0.pos = cc.p(slot0.initPos.x, slot0.initPos.y)
	slot0.headCenterPos = cc.pAdd(slot0.pos, slot0.offset)
	slot0.speed = cc.p(0, 0)
	slot0.batTimes = 0
	slot0.hitRadius = slot0.data.hitRadius
	slot0.slowSpeedRate = 1
	slot0.slowSpeedSign = false
	slot0.stockpileForce = 0
	slot0.stockpileSign = false

	slot0.controlEffect:hide()
	slot0.stockPileEffect:hide()
end

function slot1.stockpile(slot0)
	if slot0.stockpileSign then
		slot0.stockPile:show()
		slot0.stockPileEffect:show()

		slot0.stockpileForce = math.min(math.max(slot0.stockpileForce, 0) + 0.1, 4)
	else
		slot0.stockpileForce = math.max(slot0.stockpileForce - 0.03, 0)

		if slot0.stockpileForce == 0 then
			slot0.stockPile:hide()
			slot0.stockPileEffect:hide()
		end
	end
end

function slot1.resetSpike(slot0)
	if not slot0.spikeSwitch then
		slot0.spikeSwitch = true
		slot0.lrSpeedDelta = 8
		slot0.udSpeedDelta = 24
		slot0.hitBallY = 525
	else
		slot0.spikeSwitch = false
		slot0.lrSpeedDelta = slot0.data.lrSpeedDelta
		slot0.udSpeedDelta = slot0.data.udSpeedDelta
		slot0.hitBallY = slot0.data.hitBallY
	end
end

function slot1.updateView(slot0)
	slot0.headCenterPos = cc.pAdd(slot0.pos, slot0.offset)

	if slot0.force == 1 then
		slot0.image:x(slot0.pos.x)
	else
		slot0.image:xy(slot0.pos)
	end

	slot0.stockPilePro:set(slot0.stockpileForce / 4 * 100)
	slot0.stockPile:setPosition(cc.p(slot0.headCenterPos.x, slot0.headCenterPos.y + 100))
	slot0.stockPileEffect:xy(slot0.pos.x, slot0.floorY)
	slot0.controlEffect:xy(slot0.pos.x, slot0.followSelf and slot0.pos.y or slot0.floorY)
end

function slot1.move(slot0)
	slot1 = slot0.force
	slot2 = slot0.pos.x
	slot3 = slot0.pos.y
	slot4 = 1

	if slot0.stockpileSign then
		slot4 = 0.5
	end

	if slot1 == 2 then
		slot4 = slot0.slowSpeedRate
	end

	slot5 = slot2 + slot4 * slot0.speed.x
	slot6 = slot3 + slot0.speed.y

	if slot1 == 1 then
		slot6 = slot0.initPos.y + 1.45 * (slot0.image:getBonePosition("tou").y - slot0.initBonePos.y > 0 and slot8 or 0)
	else
		slot0.speed.y = slot0.speed.y + slot0.gravity
	end

	if slot3 <= slot0.floorY and slot0.speed.y < 0 then
		slot6 = slot0.floorY
		slot0.speed.y = 0
	end

	slot7 = (slot1 == 1 and 0 or 1560) + slot0.turn * 100

	if slot1 == 1 then
		if slot5 <= slot7 then
			slot5 = slot7 + 1
			slot0.speed.x = 0
		elseif slot5 >= slot0.netPos.x - slot0.netSize.width / 2 - 2 * slot0.hitRadius then
			slot5 = slot0.netPos.x - slot0.netSize.width / 2 - 2 * slot0.hitRadius - 1
			slot0.speed.x = 0
		end
	elseif slot7 <= slot5 then
		slot5 = slot7 - 1
		slot0.speed.x = 0
	elseif slot5 <= slot0.netPos.x + slot0.netSize.width / 2 + 2 * slot0.hitRadius then
		slot5 = slot0.netPos.x + slot0.netSize.width / 2 + 2 * slot0.hitRadius + 1
		slot0.speed.x = 0
	end

	slot0.pos = cc.p(slot5, slot6)
	slot0.headCenterPos = cc.pAdd(slot0.pos, slot0.offset)

	if slot1 == 2 and not slot0.isHideState then
		slot0:moveAuto()
	end
end

function slot1.moveAuto(slot0)
	slot0.updateRate = slot0.updateRate + 1

	if slot0.updateRate < slot0.tick then
		return
	end

	slot0.updateRate = 0

	if slot0.lastUpdateFunc then
		if slot0:lastUpdateFunc(slot0) == false and slot0.lastUpdateFunc == slot0.lastUpdateFunc then
			slot2 = nil
			slot0.lastUpdateFunc = slot2
			uv2 = "updateRate"
			slot0.tick = slot2
		end
	else
		slot0:randomMove()
	end
end

function slot1.randomMove(slot0)
	if math.random(3) == 1 and slot0.speed.y == 0 then
		slot0.speed.y = slot0.udSpeedDelta / 1.5
	end

	if math.random(3) == 1 then
		slot0.speed.x = slot0.lrSpeedDelta / 5
	else
		slot0.speed.x = -slot0.lrSpeedDelta / 5
	end
end

function slot1.runUntil(slot0, slot1)
	slot0.tick = 0
	slot0.lastUpdateFunc = slot1
end

function slot1.calJumpUpTime(slot0, slot1)
	slot2 = slot0.headCenterPos.y
	slot3 = slot0.udSpeedDelta / -slot0.gravity
	slot4 = slot2 + slot0.udSpeedDelta * slot3 + 0.5 * slot0.gravity * slot3 * slot3

	return (-slot0.udSpeedDelta + math.sqrt(slot0.udSpeedDelta * slot0.udSpeedDelta + 2 * slot0.gravity * (slot1 - slot2))) / slot0.gravity
end

function slot1.onEvent_hit(slot0, slot1, slot2)
	if slot0.force == 2 and slot0.slowSpeedRate == 0 then
		return
	end

	if slot0.speed.y > 0 then
		return slot0:runUntil(function ()
			uv0 = "speed"

			if slot0.speed.y <= 0 then
				uv0 = "speed"
				slot0 = slot0.speed
				slot0.y = 0
				uv0 = "speed"
				uv2 = "y"
				uv3 = "onEvent_hit"

				slot0:onEvent_hit(slot2, slot3)

				return false
			end
		end)
	end

	slot3, slot4 = slot1:calBallFallCoordinate(slot0.hitBallY)

	if not slot3 then
		slot5, slot4 = slot1:calBallFallCoordinate(slot0.data.hitBallY)

		if not slot5 then
			return
		end

		if slot2.hitForce == 2 then
			slot0:resetSpike()
		end
	end

	if slot3 < slot0.netPos.x then
		return
	end

	slot0.speed.x = (slot3 - slot0.headCenterPos.x < 0 and -1 or 1) * slot0.lrSpeedDelta

	if slot0:calJumpUpTime(slot4 - (slot0.hitRadius + slot1.radius)) then
		slot9 = slot3 - math.floor(slot6 + 0.5) * slot1.speed.x - (math.random(0, 100) < slot0.failRate and slot0.batTimes >= 1 and 200 or 0)

		slot0:runUntil(function ()
			uv1 = "math"
			uv2 = "abs"
			slot1 = slot1.headCenterPos.x - slot2
			uv1 = "math"

			if math.abs(slot1) < slot1.lrSpeedDelta then
				uv0 = "math"
				slot0 = slot0.headCenterPos
				uv1 = "abs"
				slot0.x = slot1
				uv0 = "math"
				slot0 = slot0.pos
				uv1 = "math"
				uv2 = "math"
				slot0.x = slot1.headCenterPos.x - slot2.offset.x
				uv0 = "math"
				slot0.speed.x = 0
			end

			uv1 = "headCenterPos"
			uv2 = "x"
			slot1 = slot1.pos.x - slot2
			uv1 = "math"

			if math.abs(slot1) < slot1.lrSpeedDelta then
				uv0 = "math"
				slot0 = slot0.speed
				slot1 = 0
				slot0.x = slot1
				uv0 = "math"
				uv1 = "math"
				slot0.speed.y = slot1.udSpeedDelta

				return false
			end
		end)
	end
end

function slot1.opAniAction(slot0, slot1)
	if tolua.isnull(slot0.image) then
		return
	end

	if slot0.operateAni == "effect_daqiu1" then
		if slot1 == "run_loop" then
			slot0.image:play(slot1)

			slot0.operateAni = slot1
		end
	elseif slot1 ~= slot0.operateAni then
		slot0.image:play(slot1)

		slot0.operateAni = slot1
	end
end

function slot1.onEvent_playPreHitAni(slot0, slot1, slot2)
	if slot0.stockpileSign and slot0.operateAni ~= "effect_daqiu2" then
		slot0:opAniAction("effect_daqiu2")
		performWithDelay(slot2.node, function ()
			uv0 = "opAniAction"

			slot0:opAniAction("run_loop")
		end, 0.8)
	end
end

function slot1.onEvent_playHitAni(slot0, slot1, slot2)
	if not slot0.stockpileSign and slot1.speed.x * slot0.turn < 0 then
		slot0:opAniAction("hit")
		performWithDelay(slot2.node, function ()
			uv0 = "opAniAction"

			slot0:opAniAction("run_loop")
		end, 0.6)
	end
end

function slot1.onEvent_playJumpAni(slot0, slot1, slot2)
	if slot0.operateAni ~= "effect_daqiu1" then
		slot0:opAniAction("effect_daqiu1")
		performWithDelay(slot2.node, function ()
			uv0 = "opAniAction"

			slot0:opAniAction("run_loop")
		end, 0.7)
	end
end

function slot1.onEvent_playSkillAni(slot0, slot1, slot2)
	if slot0.slowSpeedRate == 0 then
		slot0.controlEffect:play("shufu_loop")

		slot0.followSelf = true
	else
		slot0.controlEffect:play("jiansu_loop")

		slot0.followSelf = false
	end

	slot0.controlEffect:show()
end

function slot1.onEvent_palsy(slot0, slot1, slot2)
	if slot0.batTimes >= 6 then
		slot0.batTimes = 0
		slot0.slowSpeedRate = 0
	elseif slot0.batTimes >= 3 then
		slot0.batTimes = slot0.batTimes - 3
		slot0.slowSpeedRate = 0.25
	end
end

return slot1
