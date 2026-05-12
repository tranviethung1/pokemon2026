slot0 = 6
slot1 = 10
slot2 = 30
slot3 = 30
slot4 = 999999
slot5 = cc.p(0.5, 1)

function slot6(slot0, slot1, slot2, slot3)
	if not slot3 then
		uv3 = "cc"
	end

	slot7 = ui.FONT_PATH
	slot4 = cc.Label:createWithTTF("", slot7, slot3, cc.size(0, 0), cc.TEXT_ALIGNMENT_CENTER)
	uv7 = "Label"
	slot8 = 0
	uv8 = "createWithTTF"

	slot4:align(slot7, slot8, slot1):addTo(slot2, slot8):setTextColor(cc.convertColor(slot0, "4b"))
	slot4:enableShadow(cc.c4b(0, 0, 0, 255 * slot0.a), cc.size(1, -1))

	return slot4
end

function slot7(slot0, slot1, slot2)
	uv5 = "cc"
	slot7 = 0
	uv7 = "DrawNode"

	cc.DrawNode:create(slot5):drawDot(cc.p(slot7, 0), slot7, slot0)

	if slot1 then
		slot3:drawLine(cc.p(0, 0), cc.p(20, 0), slot0)
	end

	uv7 = "create"

	slot3:addTo(slot2, slot7)

	return slot3
end

function slot8(slot0, slot1)
	slot0:retain()

	uv5 = "retain"

	slot0:removeSelf():addTo(slot1, slot5)
	slot0:autorelease()
end

function slot9(slot0, slot1, slot2, slot3)
	slot4 = cc.Node:create()
	uv8 = "cc"

	slot4:addTo(slot3, slot8)

	slot5 = slot4.xy

	slot5(slot4, slot1)

	uv5 = "Node"
	slot7 = false

	slot5(slot0, slot7, slot4)

	uv5 = "create"
	uv7 = "addTo"

	slot5(slot0, -slot7, slot4):setString(string.format("%s (%d, %d)", slot2, slot1.x, slot1.y))

	return slot4
end

function slot10(slot0)
	slot2 = 0
	slot4 = 1
	uv2 = "cc"
	uv4 = "c4f"
	slot3 = nil

	if slot0:getParent() then
		uv4 = "getParent"
		slot3 = slot4(slot1, false, slot0:getParent())
		slot4 = slot3.move

		slot4(slot3, slot0:getCurPos())

		uv4 = "move"

		slot4(slot2(cc.c4f(slot2, 0, slot4, 0.8), -slot4, slot0), slot3)
	end

	slot5 = 1
	slot7 = 0
	slot4 = cc.c4f(slot5, 0, slot7, 0.8)
	uv5 = "cc"
	slot6 = slot4
	uv7 = "c4f"
	slot5 = slot5(slot6, -slot7 * 2, slot0)
	uv6 = "getParent"
	slot6 = slot6(slot4, true, slot0)
	slot8 = 0
	slot10 = 0
	uv8 = "cc"
	uv10 = "c4f"
	slot8 = slot8(cc.c4f(slot8, 1, slot10, 0.8), -slot10 * 3, slot0)
	slot9 = nil

	if slot0.sprite then
		uv10 = "getParent"
		slot9 = slot10(slot7, true, slot0.sprite.__ani)
	end

	slot11 = 1
	slot13 = 0
	uv11 = "cc"
	uv13 = "c4f"
	slot11 = slot11(cc.c4f(slot11, 1, slot13, 0.8), -slot13 * 4, slot0)
	slot12 = nil

	if slot0.sprite then
		uv13 = "getParent"
		slot12 = slot13(slot10, false, slot0.sprite)
	end

	slot13 = slot10
	slot14, slot15, slot16 = nil

	if slot0.unitCfg then
		uv17 = "getCurPos"
		slot17 = slot17(slot13, slot0.unitCfg.everyPos.headPos, string.format("[%d] head", slot0.seat), slot0)
		slot14 = slot17
		uv17 = "getCurPos"
		slot17 = slot17(slot13, slot0.unitCfg.everyPos.lifePos, string.format("[%d] life", slot0.seat), slot0)
		slot15 = slot17
		uv17 = "getCurPos"
		slot16 = slot17(slot13, slot0.unitCfg.everyPos.hitPos, string.format("[%d] hit", slot0.seat), slot0)
	end

	slot17 = cc.RepeatForever
	slot21 = cc.CallFunc
	slot22 = slot21
	slot21 = slot21.create

	gRootViewProxy:proxy():runAction(slot17:create(cc.Sequence:create(slot21(slot22, function ()
		uv0 = "move"

		if slot0 then
			uv0 = "move"
			uv2 = "getCurPos"

			slot0:move(slot2:getCurPos())
		end

		slot1 = 0
		slot0 = cc.p(slot1, 0)
		uv1 = "cc"

		if slot1 then
			uv1 = "getCurPos"
			slot1 = slot1.sprite:getBonePosition("yinying")
			uv1 = "cc"

			slot1:move(slot1)
		end

		uv1 = "getCurPos"
		slot2 = slot1
		slot1 = slot1.convertToWorldSpace(slot2, cc.p(0, 0))
		uv2 = "getCurPos"
		slot2 = slot2.sprite
		slot3 = slot2
		slot2 = slot2.convertToWorldSpace(slot3, cc.p(0, 0))
		uv3 = "p"
		slot3 = slot3.setString
		uv7 = "getCurPos"
		slot7 = slot7.seat
		uv8 = "getCurPos"

		slot3(slot3, string.format("[%d] cur (%d, %d)", slot7, slot8:getCurPos()))

		uv3 = "sprite"
		slot3 = slot3.setString
		uv7 = "getCurPos"
		slot7 = slot7.seat

		slot3(slot3, string.format("[%d] world (%d, %d)", slot7, slot1.x, slot1.y))

		uv3 = "getBonePosition"
		slot3 = slot3.setString
		uv7 = "getCurPos"
		slot7 = slot7.seat

		slot3(slot3, string.format("[%d] csprite (%d, %d)", slot7, slot2.x, slot2.y))

		uv3 = "yinying"
		uv7 = "getCurPos"

		slot3:setString(string.format("[%d] yinying (%d, %d)", slot7.seat, slot0.x, slot0.y))
	end))))

	slot0.debug.nodes = {
		curPos = slot3,
		worldPos = slot6,
		cspritePos = slot9,
		yinyingPos = slot12,
		curPosLabel = slot2,
		worldPosLabel = slot5,
		cspritePosLabel = slot8,
		yinyingPosLabel = slot11,
		headPosNode = slot14,
		lifePosNode = slot15,
		hitPosNode = slot16
	}

	for slot21, slot22 in pairs(slot0.debug.nodes) do
		slot22:retain()
	end

	slot0.debug.action = slot17
end

function slot11(slot0)
	slot1 = cc.c4f(1, 0, 0, 1)
	slot2 = cc.Node:create()
	slot3 = slot2
	slot5 = slot0
	uv5 = "cc"
	slot2 = slot2.addTo(slot3, slot0.getParent(slot5), slot5)
	uv3 = "c4f"
	slot4 = slot1
	uv5 = "Node"
	slot6 = slot2
	uv7 = "Node"
	slot3 = slot3(slot4, -slot5, slot6, slot7)
	uv4 = "c4f"
	uv6 = "Node"
	uv8 = "Node"

	slot4(slot1, -slot6 * 2, slot2, slot8):setAlignment(cc.TEXT_ALIGNMENT_LEFT, cc.VERTICAL_TEXT_ALIGNMENT_TOP)

	if not slot0.getCurPos then
		slot2:move(display.top_center)
	end

	slot5 = cc.RepeatForever
	slot9 = cc.CallFunc
	slot10 = slot9
	slot9 = slot9.create

	gRootViewProxy:proxy():runAction(slot5:create(cc.Sequence:create(slot9(slot10, function ()
		uv0 = "getCurPos"

		if slot0.getCurPos then
			slot1 = 0
			slot0 = cc.p(slot1, 0)
			uv1 = "getCurPos"

			if slot1.debug.enabled then
				uv1 = "cc"
				slot0.y = -slot1 * 4
			end

			uv1 = "p"
			uv5 = "getCurPos"

			slot1:move(cc.pAdd(cc.p(slot5:getCurPos()), slot0))
		end

		uv0 = "getCurPos"
		slot0 = slot0.effectManager
		slot1 = slot0
		slot0 = slot0.queueSize(slot1)
		uv1 = "getCurPos"
		slot1 = slot1.effectManager
		slot2 = slot1
		slot1 = slot1.queueInfo(slot2)
		uv2 = "getCurPos"
		slot3 = 0
		slot4 = {}

		if slot2.effectManager.updEffects then
			slot3 = itertools.size(slot2)
			slot4 = itertools.map(slot2, function (slot0, slot1)
				return slot1:debugString()
			end)
		end

		uv5 = "getCurPos"

		if slot5.seat then
			uv5 = "getCurPos"

			if not slot5.seat then
				slot5 = "scene"
			end
		end

		uv6 = "debug"

		slot6:setString(string.format("[%s] effect que %d upd %d", slot5, slot0, slot3))

		slot6 = ""

		if table.length(slot1) > 0 then
			slot6 = string.format("[%s] que:\n%s\n", slot5, table.concat(slot1, "\n"))
		end

		slot7 = ""

		if table.length(slot4) > 0 then
			slot7 = string.format("[%s] upd:\n%s", slot5, table.concat(slot4, "\n"))
		end

		uv8 = "enabled"

		slot8:setString(string.format("%s%s", slot6, slot7))
	end))))

	slot0.effectDebug.nodes = {
		effectNode = slot2
	}

	for slot9, slot10 in pairs(slot0.effectDebug.nodes) do
		slot10:retain()
	end

	slot0.effectDebug.action = slot5
end

function BattleSprite.setDebugEnabled(slot0, slot1)
	if slot1 == slot0.debug.enabled then
		return
	end

	slot0.debug.enabled = slot1

	if slot1 then
		uv2 = "debug"

		slot2(slot0)
	else
		for slot5, slot6 in pairs(slot0.debug.nodes) do
			slot6:removeSelf():autorelease()
		end

		gRootViewProxy:proxy():stopAction(slot0.debug.action)

		slot0.debug = {
			enabled = false
		}
	end
end

function BattleSprite.setEffectDebugEnabled(slot0, slot1)
	if slot1 == slot0.effectDebug.enabled then
		return
	end

	slot0.effectDebug.enabled = slot1

	if slot1 then
		if slot0.effectManager == nil then
			printWarn("%s no effectManager", slot0)

			return
		end

		uv2 = "effectDebug"

		slot2(slot0)
	else
		for slot5, slot6 in pairs(slot0.effectDebug.nodes) do
			slot6:removeSelf():autorelease()
		end

		gRootViewProxy:proxy():stopAction(slot0.effectDebug.action)

		slot0.effectDebug = {
			enabled = false
		}
	end
end

function BattleSprite.debugParents(slot0)
	slot1 = slot0.sprite.__ani or slot0.sprite
	slot2 = 0

	while slot1 do
		slot3, slot4 = slot1:getPosition()

		print("[DBG]", slot0, slot2, slot1, slot1:getName(), slot3, slot4, slot1:getScaleX(), slot1:getScaleY())

		slot1 = slot1:getParent()
		slot2 = slot2 + 1
	end
end

function BattleSprite.debugString(slot0)
	return string.format("BattleSprite: %d", slot0.seat)
end
