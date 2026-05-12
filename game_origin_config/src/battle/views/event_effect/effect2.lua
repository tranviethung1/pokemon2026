slot0 = class("MoveByDis", battleEffect.EventEffect)
battleEffect.MoveByDis = slot0

function slot0.onPlay(slot0)
	slot1 = slot0.args
	slot3 = math.max(slot1.speed, 1)
	slot6 = math.max(cc.pGetLength(cc.p(slot1.x, slot1.y)), 1)
	slot7 = nil
	slot9 = nil

	slot0.target:runAction(transition.speed(slot0.target, {
		speed = 1,
		action = transition.spawnEx():sequenceBegin():action(cc.MoveBy:create(slot1.a == 0 and slot6 / slot3 or (math.sqrt(math.max(slot3 * slot3 + 2 * slot4 * slot6, 0)) - slot3) / slot4, cc.p(slot1.x, slot1.y))):func(function ()
			uv0 = "target"
			uv2 = "runAction"

			slot0.target:runAction(slot2:reverse())
		end):sequenceEnd():func(function ()
			uv0 = "setSpeed"
			uv2 = "getDuration"
			uv3 = "setSpeed"

			slot0:setSpeed(1 + slot2 * slot3:getDuration())
		end):done()
	}))
	slot0.view:setActionState(battle.SpriteActionTable.run)
end

function slot0.onUpdate(slot0, slot1)
end

function slot0.onStop(slot0, slot1)
	slot0.view:setActionState(battle.SpriteActionTable.standby)
end

slot1 = class("MoveByTime", battleEffect.EventEffect)
battleEffect.MoveByTime = slot1

function slot1.onPlay(slot0)
	slot1 = slot0.args
	slot4 = slot1.t
	slot5 = slot1.angle
	slot6 = slot1.speed * slot4 + slot1.a * slot4 * slot4 / 2

	slot0.target:runAction(cc.Speed:create(cc.MoveBy:create(slot4, cc.p(math.cos(math.rad(slot5)) * slot6, math.sin(math.rad(slot5)) * slot6)), 2))
	slot0.view:setActionState(battle.SpriteActionTable.run)
end

function slot1.onUpdate(slot0, slot1)
end

function slot1.onStop(slot0, slot1)
	slot0.view:setActionState(battle.SpriteActionTable.standby)
end

slot2 = class("MoveTo", battleEffect.EventEffect)
battleEffect.MoveTo = slot2

function slot2.onPlay(slot0)
	slot1 = slot0.args
	slot2 = slot1.speed
	slot6, slot7 = slot0.target:getCurPos()
	slot8 = cc.pGetLength(cc.p(slot1.x - slot6, slot1.y - slot7))
	slot9 = nil
	slot10 = 0
	slot11 = slot1.turnBack
	slot12 = slot1.knockUp
	slot13 = slot1.knockUpBack
	slot9 = slot1.a == 0 and slot8 / slot2 or (math.sqrt(math.max(slot2 * slot2 + 2 * slot3 * slot8, 0)) - slot2) / slot3

	if slot1.costTime and slot1.costTime >= 0 then
		slot9 = slot1.costTime / 1000
	end

	if slot1.delayMove then
		slot10 = slot1.delayMove / 1000
	end

	if slot1.timeScale then
		slot9 = slot9 * slot1.timeScale
	end

	slot14 = nil

	if slot12 then
		slot15 = nil

		if slot0.target.force == 1 then
			slot15 = 1
		elseif slot0.target.force == 2 then
			slot15 = -1
		end

		slot14 = cc.Spawn:create(cc.EaseIn:create(cc.MoveTo:create(slot9, cc.p(slot4, slot5)), 2), cc.Repeat:create(cc.Sequence:create(cc.DelayTime:create(0.25), cc.CallFunc:create(function ()
			uv0 = "target"
			uv0 = -1
			uv0 = "setShowFaceTo"
			uv2 = "target"

			(slot0 * -1).target:setShowFaceTo(slot2)
		end)), 4))
	else
		slot14 = cc.EaseIn:create(cc.MoveTo:create(slot9, cc.p(slot4, slot5)), 2)

		if slot9 == 0 then
			slot14 = cc.CallFunc:create(function ()
				uv0 = "target"
				uv3 = "setPosition"
				uv4 = "cc"

				slot0.target:setPosition(cc.p(slot3, slot4))
			end)
		end
	end

	slot15 = false

	if slot11 then
		if slot0.target.force == 1 and slot4 < slot6 then
			slot15 = true
		elseif slot0.target.force == 2 and slot6 < slot4 then
			slot15 = true
		end
	end

	slot16 = slot15 and -1 or 1

	function slot17()
		uv0 = "changeFaceTo"

		if slot0.changeFaceTo then
			uv0 = "target"
			slot0 = slot0.target
			slot0 = slot0.setShowFaceTo
			uv2 = "setShowFaceTo"
			uv3 = "changeFaceTo"

			slot0(slot0, slot2 * slot3.changeFaceTo)

			uv2 = slot0
		end
	end

	slot0.target:runAction(cc.Sequence:create(cc.CallFunc:create(slot17), cc.DelayTime:create(slot10), slot14, cc.CallFunc:create(slot17), cc.CallFunc:create(handler(slot0, slot0.stop))))

	if not slot12 and not slot13 then
		slot0.view:setActionState(battle.SpriteActionTable.run)
	end

	if slot12 then
		slot0.target:isComeBacking(true)
	elseif slot13 then
		slot0.target:isComeBacking(false)
	end
end

function slot2.onUpdate(slot0, slot1)
end

function slot2.onStop(slot0, slot1)
	slot0.view:setCurPos(cc.p(slot0.args.x, slot0.args.y))
	slot0.view:setActionState(battle.SpriteActionTable.standby)
end

slot3 = class("ComeBack", battleEffect.MoveTo)
battleEffect.ComeBack = slot3

function slot3.onPlay(slot0)
	slot1, slot2 = slot0.target:getSelfPos()
	slot0.args = {
		a = 2000,
		turnBack = true,
		speed = 1500,
		costTime = slot0.args.costTime,
		delayMove = slot0.args.delayMove,
		x = slot1,
		y = slot2,
		changeFaceTo = slot0.target.forceFaceTo
	}

	battleEffect.MoveTo.onPlay(slot0)
	slot0.target:isComeBacking(true)
end

function slot3.onStop(slot0, slot1)
	battleEffect.MoveTo.onStop(slot0, slot1)
	slot0.target:resetPos()
	slot0.target:isComeBacking(false)
end

function slot3.debugString(slot0)
	return string.format("ComeBack: %s", toDebugString(slot0.target))
end

slot4 = class("Callback", battleEffect.OnceEventEffect)
battleEffect.Callback = slot4

function slot4.onPlay(slot0)
	slot0.args.func()
end

slot5 = class("OnceEffect", battleEffect.EventEffect)
battleEffect.OnceEffect = slot5

function slot5.onPlay(slot0)
	slot1 = slot0.args

	slot0.view:onViewProxyCall("onBuffPlayOnceEffect", slot1.tostrModel, slot1.resPath, slot1.aniName, slot1.pos, slot1.offsetPos, slot1.assignLayer, slot1.wait)
end

slot6 = class("Wait", battleEffect.EventEffect)
battleEffect.Wait = slot6

function slot6.onUpdate(slot0, slot1)
end

slot7 = class("Jump", battleEffect.OnceEventEffect)
battleEffect.Jump = slot7

function slot7.onPlay(slot0)
	if slot0.args.jumpFlag and slot0.view.skillJumpSwitchOnce then
		gRootViewProxy:raw():closeEffectEventEnable()
		slot0.view:onCleanEffectCache()
	end
end

slot8 = {
	__index = slot8,
	__targes = {
		"stageLayer",
		"gameLayer",
		"effectLayerNum"
	},
	__fmap = {
		getPosition = "setPosition",
		getRotation = "setRotation",
		getScaleX = "setScaleX",
		getScaleY = "setScaleY"
	}
}

function slot8.new()
	uv2 = "setmetatable"
	slot0 = setmetatable({}, slot2)

	slot0:ctor()

	return slot0
end

function slot8.ctor(slot0)
	slot0.view = gRootViewProxy:raw()
	slot0.scaleX = 1
	slot0.scaleY = 1
	slot0.backups = {}
end

function slot8.runAction(slot0, slot1)
	return slot0.view:runAction(slot1)
end

function slot8.stopAction(slot0, slot1)
	return slot0.view:stopAction(slot1)
end

function slot8.revert(slot0)
	for slot4, slot5 in pairs(slot0.backups) do
		for slot9, slot10 in pairs(slot5) do
			if type(slot10) == "table" then
				slot0.view[slot9][slot0.__fmap[slot4]](slot11, unpack(slot10))
			else
				slot12(slot11, slot10)
			end
		end
	end

	slot0.backups = {}
end

function slot8._backup(slot0, slot1, slot2)
	if slot0.backups[slot1] then
		return
	end

	for slot7, slot8 in ipairs(slot0.__targes) do
		if slot0.view[slot8] and slot9[slot1] then
			if (slot2 or 1) == 1 then
				-- Nothing
			else
				slot3[slot8] = {
					slot10(slot9)
				}
			end
		end
	end

	slot0.backups[slot1] = {
		[slot8] = slot10(slot9)
	}
end

function slot8._do(slot0, slot1, ...)
	for slot5, slot6 in ipairs(slot0.__targes) do
		if slot0.view[slot6] and slot7[slot1] then
			slot8(slot7, ...)
		end
	end
end

function slot8.setPosition(slot0, slot1, slot2)
	slot0:_backup("getPosition", 2)

	return slot0:_do("setPosition", -(slot1 - display.cx) * slot0.scaleX, -(slot2 - display.cy) * slot0.scaleY)
end

function slot8.setRotation(slot0, slot1)
	slot0:_backup("getRotation")

	return slot0:_do("setRotation", slot1)
end

function slot8.setScaleX(slot0, slot1)
	slot0:_backup("getScaleX")

	slot0.scaleX = 1 / slot1

	return slot0:_do("setScaleX", slot0.scaleX)
end

function slot8.setScaleY(slot0, slot1)
	slot0:_backup("getScaleY")

	slot0.scaleY = 1 / slot1

	return slot0:_do("setScaleY", slot0.scaleY)
end

slot9 = class("Follow", battleEffect.EventEffect)
battleEffect.Follow = slot9

function slot9.onPlay(slot0)
	slot1 = slot0.args.faceTo

	if slot0.args.follow.scene then
		slot1 = 1
	end

	slot4 = slot0.args.index
	slot5 = math.random(1, table.length(slot0.args.follow.bones))

	if table.length(slot0.args.processArgs.viewTargets) > 1 and table.length(slot2) > 1 and itertools.first(slot3, function (slot0)
		uv2 = "id"

		return slot0.id == slot2.target.id
	end) then
		slot5 = (slot6 - 1) % table.length(slot2) + 1
	end

	slot0.boneName = slot2[slot5]
	slot0.boneSprite = slot0.args.fromSprite

	if slot0.boneSprite == nil then
		return
	end

	if slot0.args.follow.scene then
		uv6 = "args"
		slot0.target = slot6.new()
		slot0.view = slot0.target
	else
		slot0.oldX, slot0.oldY = slot0.target:getPosition()
		slot0.oldRotation = slot0.target:getRotation()
		slot0.oldScaleX = slot0.target:getScaleX()
		slot0.oldScaleY = slot0.target:getScaleY()
	end

	slot6 = slot0.boneName
	slot7 = slot0.boneSprite.sprite

	slot0.boneSprite:addActionCompleteListener(function (slot0, slot1)
		uv2 = "stop"

		slot2:stop()
	end)

	if slot0.args.follow.scene and slot4 > 1 then
		return
	end

	slot0.action = cc.RepeatForever:create(cc.Sequence:create(cc.CallFunc:create(function ()
		uv0 = "boneSprite"
		slot0, slot1 = slot0.boneSprite:getPosition()
		uv2 = "getPosition"
		slot3 = slot2
		uv3 = "getPosition"
		slot4 = slot3
		uv4 = "getPosition"
		slot5 = slot4
		uv6 = "getScaleX"
		slot4 = slot4.getBonePosition(slot5, slot6)
		uv5 = "getPosition"
		slot6 = slot5
		uv7 = "getScaleX"
		uv6 = "getPosition"
		slot7 = slot6
		uv8 = "getScaleX"
		uv7 = "getPosition"
		uv9 = "getScaleX"
		slot4.x = slot4.x * slot2.getScaleX(slot3) + slot0
		slot8 = slot4.y * slot3.getScaleY(slot4) + slot1
		slot4.y = slot8
		uv8 = "boneSprite"
		slot8 = slot8.target
		slot8 = slot8.setRotation
		slot10 = -slot5.getBoneRotation(slot6, slot7)

		slot8(slot8, slot10)

		uv8 = "boneSprite"
		slot8 = slot8.target
		slot8 = slot8.setScaleX
		uv10 = "getScaleY"

		slot8(slot8, slot6.getBoneScaleX(slot7, slot8) * slot10, true)

		uv8 = "boneSprite"
		slot8 = slot8.target
		slot8 = slot8.setScaleY

		slot8(slot8, slot7:getBoneScaleY(slot9), true)

		uv8 = "boneSprite"

		slot8.target:setPosition(slot4.x, slot4.y)
	end)))

	slot0.target:runAction(slot0.action)
end

function slot9.onUpdate(slot0, slot1)
end

function slot9.onStop(slot0)
	slot0.target:stopAction(slot0.action)

	slot1 = slot0.args.follow.notback

	if slot0.args.follow.scene then
		slot0.target:revert()
	elseif not slot1 then
		slot0.target:setPosition(slot0.oldX, slot0.oldY)
		slot0.target:setRotation(slot0.oldRotation)
		slot0.target:setScaleX(slot0.oldScaleX)
		slot0.target:setScaleY(slot0.oldScaleY)
	else
		slot0.target:isComeBacking(true)
	end
end

slot10 = class("Control", battleEffect.OnceEventEffect)
battleEffect.Control = slot10

function slot10.onPlay(slot0)
	slot2 = slot0.args.lifeBar

	if not gRootViewProxy:raw() then
		errorInWindows("Control:onPlay battleView is nil")

		return
	end

	for slot7, slot8 in maptools.order_pairs(slot1:onViewProxyCall("getSceneObjs")) do
		if slot8 and slot8.model and not slot8.model:isRealDeath() and slot2 then
			slot8.lifebar:setVisible(slot2.show or false)
			slot8:onAttacting(false)
		end
	end
end

slot11 = class("Cutting", battleEffect.OnceEventEffect)
battleEffect.Cutting = slot11

function slot11.createCapture(slot0, slot1, slot2)
	slot3, slot4 = slot1:xy()
	slot5 = cc.utils:getCascadeBoundingBox(slot1)
	slot6 = slot1:convertToWorldSpace(cc.p(0, 0))
	slot7 = cc.rect(slot6.x, slot6.y, slot5.width, slot5.height)
	slot8 = slot1:getAnchorPoint()
	slot9 = cc.RenderTexture:create(slot7.width, slot7.height, slot2)
	slot10 = cc.Node:create()

	slot10:setContentSize(slot7.width, slot7.height):setAnchorPoint(cc.p(0, 0))
	slot10:add(slot9)
	slot9:beginWithClear(0, 0, 0, 0)

	slot11 = slot1:size()
	slot13 = cc.p(slot11.width * slot8.x, slot11.height * slot8.y)
	slot14 = cc.pAdd(slot13, cc.pSub(slot6, slot7))

	slot1:xy(slot13):visit()
	slot1:visit()
	slot9:endToLua()
	slot9:drawOnce(true)
	slot1:xy(cc.p(slot3, slot4))

	if slot9:getChildren()[1] then
		cache.setHSLShader(slot15, false, unpack(slot0.hsl))
	end

	return slot10
end

function slot11.createClipSpr(slot0, slot1, slot2)
	slot4 = cc.DrawNode:create()

	slot4:drawPolygon(slot1, #slot1, cc.c4b(1, 1, 0, 0), 1, cc.c4b(0, 1, 0, 1))

	slot5 = cc.ClippingNode:create(slot4)

	slot5:addChild(slot0:createCapture(slot2, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444))

	return slot5
end

function slot11.newSprite(slot0, slot1)
	slot2 = slot0.args.faceTo
	slot4 = slot1.unitCfg
	slot6 = newCSpriteWithOption(slot1.unitRes)

	if slot1.skins:back() and slot1.skins:back().skinName then
		slot7 = slot6:getAni()

		slot7:setSkin(slot5)
		slot7:setToSetupPose()
	end

	slot6:play(battle.SpriteActionTable.standby)
	slot6:setScaleX(slot2 * slot4.scaleX * slot4.scale * slot4.scaleC)
	slot6:setScaleY(slot4.scale * slot4.scaleC)
	slot6:setAnchorPoint(cc.p(0.5, 0.5))

	return slot6
end

function slot11.onPlay(slot0)
	slot1 = gRootViewProxy:raw()
	slot0.boneSprite = slot0.args.fromSprite
	slot4 = slot0.boneSprite.sprite
	slot5, slot6 = slot0.boneSprite:getPosition()
	slot0.hsl = slot0.args.cutting.hsl or {
		0,
		-1,
		-1
	}
	slot9 = ccui.Layout:create():size(display.width, display.height)

	for slot13, slot14 in ipairs(slot0.args.processArgs.viewTargets) do
		slot16 = slot0:newSprite(slot1:onViewProxyCall("getSceneObjById", slot14.id))

		slot16:addTo(slot9)

		slot17 = slot0.args.cutting.bones[slot13]
		slot18 = slot4:getBonePosition(slot17)
		slot18.x = slot18.x * slot4:getScaleX() + slot5
		slot18.y = slot18.y * slot4:getScaleY() + slot6

		slot16:setRotation(slot4:getBoneRotation(slot17))
		slot16:setScaleX(slot4:getBoneScaleX(slot17) * slot16:scaleX())
		slot16:setScaleY(slot4:getBoneScaleY(slot17) * slot16:scaleY())
		slot16:setPosition(slot18.x, slot18.y)
	end

	slot12 = display.height * math.tan(math.rad(slot0.args.cutting.lineRotation or 10)) / 2
	slot13 = display.width / 2
	slot14 = display.height / 2
	slot19 = 0.15
	slot20 = slot0.args.cutting.delayEnd or 0.15
	slot21 = slot0.args.cutting.disMid or 10
	slot22 = 0.1
	slot25 = slot0.args.cutting.timeMove or 0.2
	slot26 = slot0.args.cutting.disVertical or 350

	slot0:createClipSpr({
		cc.p(0, 0),
		cc.p(0, display.height),
		cc.p(slot13 + slot12, display.height),
		cc.p(slot13 - slot12, 0)
	}, slot9):addTo(slot1.gameLayer, 888):setPosition(cc.p(0, 0)):runAction(cc.Sequence:create(cc.MoveBy:create(slot22, cc.p(-slot21, 0)), cc.DelayTime:create(slot19), cc.MoveBy:create(slot25, cc.p(slot26 * slot11, slot26)), cc.DelayTime:create(slot20), cc.CallFunc:create(function ()
		uv0 = "removeFromParent"

		slot0:removeFromParent()
	end)))
	slot0:createClipSpr({
		cc.p(display.width, 0),
		cc.p(display.width, display.height),
		cc.p(slot13 + slot12, display.height),
		cc.p(slot13 - slot12, 0)
	}, slot9):addTo(slot1.gameLayer, 888):setPosition(cc.p(0, 0)):runAction(cc.Sequence:create(cc.MoveBy:create(slot22, cc.p(slot21, 0)), cc.DelayTime:create(slot19), cc.MoveBy:create(slot25, cc.p(-slot26 * slot11, -slot26)), cc.DelayTime:create(slot20), cc.CallFunc:create(function ()
		uv0 = "removeFromParent"

		slot0:removeFromParent()
	end)))
end
