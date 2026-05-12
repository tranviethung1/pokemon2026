slot0 = class("ballModel")

function slot0.ctor(slot0, slot1, slot2)
	slot0.netPos = slot1
	slot0.netSize = slot2
	slot0.radius = 40
	slot0.floorY = 200
	slot0.gravity = -0.2
	slot0.dropY = 650
	slot0.collisionForce = 7
	slot0.pos = cc.p(0, 0)
	slot0.speed = cc.p(0, 0)
	slot0.initPos = cc.p(0, 0)
	slot0.image = nil
	slot0.shadow = nil
end

function slot0.createImage(slot0, slot1, slot2)
	slot0.initPos = slot2
	slot0.serveAction = true
	slot3 = slot0.initPos[1].x + 1.3 * slot0.radius
	slot4 = slot0.dropY
	slot0.image = widget.addAnimationByKey(slot1, "volleyball_qiu/paiqiutexiao.skel", "volleyBall", "effect_xuanzhuan_loop", 11):xy(slot3, slot4):scale(2.1):anchorPoint(0.5, 0.5)
	slot0.pos = cc.p(slot3, slot4)
	slot0.shadow = ccui.ImageView:create("activity/volleyball/yinying.png"):addTo(slot1, 4, "yinying"):xy(slot3, 170):scale(0.7):anchorPoint(0.5, 0.5)
end

function slot0.deleteImage(slot0)
	slot0.image:removeSelf()
	slot0.shadow:removeSelf()
end

function slot0.reset(slot0, slot1)
	slot0.pos = cc.p(slot0.initPos[slot1].x + (slot1 == 1 and 1 or -1) * 1.3 * slot0.radius, slot0.dropY)
	slot0.serveAction = true
	slot0.speed = cc.p(0, 0)

	slot0.image:play("effect_xuanzhuan_loop")
end

function slot0.updateView(slot0)
	slot0.image:xy(slot0.pos)
	slot0.shadow:x(slot0.pos.x)
end

function slot0.move(slot0)
	slot0.speed.y = slot0.speed.y + slot0.gravity
	slot3 = slot0.pos.x + slot0.speed.x

	if slot0.pos.y + slot0.speed.y < slot0.floorY then
		slot4 = slot0.floorY
		slot0.speed.x = 0
		slot0.speed.y = 0
	end

	slot5 = slot0.netPos.x
	slot6 = slot0.netSize.width

	if slot4 <= slot0.netPos.y + slot0.netSize.height / 2 then
		if slot3 + slot0.radius >= slot5 - slot6 / 4 and slot3 + slot0.radius <= slot5 + slot6 * 3 / 4 and slot0.speed.x > 0 then
			slot0.speed.x = -0.5
		elseif slot3 - slot0.radius >= slot5 - slot6 / 2 and slot3 - slot0.radius <= slot5 + slot6 / 4 and slot0.speed.x < 0 then
			slot0.speed.x = math.random(0, 400) / 100
		end
	end

	slot0.pos = cc.p(slot3, slot4)
end

function slot0.calBallFallCoordinate(slot0, slot1)
	slot2 = slot0.pos.x
	slot5 = slot0.speed.y * slot0.speed.y + 2 * slot0.gravity * (slot1 - slot0.pos.y)
	slot6 = (-slot0.speed.y + math.sqrt(slot5)) / slot0.gravity
	slot7 = (-slot0.speed.y - math.sqrt(slot5)) / slot0.gravity

	if slot5 < 0 or slot7 < 0 then
		return
	end

	slot8 = math.floor(slot7)

	return slot2 + slot0.speed.x * slot8, slot3 + slot0.speed.y * slot8 + 0.5 * slot0.gravity * slot8 * slot8
end

function slot0.calReturnBallSpeedX(slot0, slot1)
	slot5 = slot0.collisionForce + slot1.power + slot1.stockpileForce
	slot6 = slot0.floorY - slot0.pos.y
	slot7 = (-slot5 + math.sqrt(slot5 * slot5 + 2 * slot0.gravity * slot6)) / slot0.gravity
	slot10 = {
		[slot14] = math.abs(slot0.netPos.x - slot1.optimalFallArea[slot14] - slot0.pos.x) / math.floor((-slot5 - math.sqrt(slot5 * slot5 + 2 * slot0.gravity * slot6)) / slot0.gravity)
	}

	for slot14 = 1, 2 do
	end

	return math.random(slot10[1], slot10[2])
end

function slot0.onEvent_collision(slot0, slot1, slot2)
	if slot1.force == 2 and slot1.slowSpeedRate == 0 then
		return
	end

	slot3 = slot0.pos.x - slot1.headCenterPos.x
	slot4 = slot0.pos.y - slot1.headCenterPos.y

	if (slot0.radius + slot1.hitRadius) * (slot0.radius + slot1.hitRadius) - slot3 * slot3 - slot4 * slot4 > 0 and math.sqrt(slot5) > 10 then
		if slot4 <= 0 then
			slot0.pos.x = slot0.pos.x + slot3 / math.abs(slot3) / 2
		else
			slot6 = slot4 / math.abs(slot4)
			slot0.pos.y = slot0.pos.y + slot6 / 2
			slot0.pos.x = slot0.pos.x + slot6 * (slot3 * slot4 < 0 and -1 or 1) * math.min(math.abs(slot3 / slot4), 1) / 2
		end

		slot0:onEvent_collision(slot1, slot2)
	end

	if (slot3 < -1 and -1 or 1) ~= slot1.turn then
		if slot1.force == 2 then
			slot3 = (math.random(-10, 10) + 100) / 100 * slot4
		else
			if math.abs(slot4 / slot3) >= 1 and slot4 > 0 then
				slot3 = slot4
			end

			slot7 = slot3 < 0 and -1 or 1
		end
	end

	slot8 = slot0.collisionForce
	slot9 = slot7 * math.min(math.abs(slot8 * slot3 / slot4), slot8)
	slot10 = slot8 + slot1.power + slot1.stockpileForce

	if slot6 then
		slot9 = slot7 * slot0:calReturnBallSpeedX(slot1)
	elseif slot0.serveAction then
		slot10 = math.min(1.5 * slot10, 10)
	end

	slot0.speed.x = slot9
	slot0.speed.y = slot10
end

function slot0.onEvent_playSkillAni(slot0, slot1, slot2)
	slot3 = {
		"effect_bing",
		"effect_chaoneng",
		"effect_dian",
		"effect_yanshi"
	}
	slot4 = slot1.slowSpeedRate == 0 and 2 or 1

	if slot2.reset == true then
		slot1.skillHitTimes[slot4] = slot1.skillHitTimes[slot4] + 1

		slot0.image:play("effect_xuanzhuan_loop")
	else
		slot0.image:play(slot3[slot1.data.skillType] .. slot4 .. "_loop")
	end
end

return slot0
