slot0 = {
	level2 = "battle/logo_hero_level2.png",
	level = "battle/logo_hero_level.png"
}
slot1 = {
	level2 = "battle/logo_enemy_level2.png",
	level = "battle/logo_enemy_level.png"
}
slot2 = {
	shield = "battle/bar_shield_blue.png"
}
slot3 = {
	line = "battle/bar_nqt_kd.png"
}
slot4 = {
	normal = "battle/bar_enemy_white.png"
}
globals.CLifeBar = class("CLifeBar", cc.Node)

function CLifeBar.ctor(slot0, slot1, slot2)
	slot0.model = slot1

	slot0:init(slot2)
end

function CLifeBar.init(slot0, slot1)
	slot2 = slot1.UIWidget:getResourceNode()

	if slot0.model.force == 1 then
		uv3 = "UIWidget"

		if not slot3 then
			uv3 = "getResourceNode"
		end
	end

	slot3 = slot0.model.showLevel or slot0.model.level
	slot0.barPanelS = function (slot0)
		uv2 = "hpBarPanel"
		slot2 = slot2:get("hpBarPanel"):clone()
		slot3 = slot2:get("di"):size()
		uv8 = "get"

		slot2:addTo(slot8, 4):xy(-(slot3.width / 2), slot3.height / 2)

		slot8 = "level"
		uv8 = "clone"

		slot2:get(slot8):setString(slot8)

		return slot2
	end(true)
	slot0.buffAddFirstPos = cc.p(-slot0.barPanelS:get("di"):size().width / 2 + 70, 55)
	slot5 = slot0.model.unitCfg

	slot0:setPosition(slot5.everyPos.lifePos)
	slot0:setScale(slot5.lifeScale)

	slot0.canSetVisible = true
	slot0.lifeBarVisible = battleEasy.priorDataTable(true, "lifeBarVisible")
	slot0.updateCount = 1
	slot0.oldShieldMul = 0
	slot0.shieldMul = 0
	slot0.barCaptureS = function (slot0)
		uv1 = "lastPer"
		slot1.lastPer = {
			mpPer = 0,
			shieldPer = 0,
			mpOverflowPer = 0,
			hpPer = 0,
			assimilatePer = 0
		}

		slot0:get("shieldBar"):setPercent(0)
		slot0:get("hpBar"):setPercent(0)
		slot0:get("mpBar"):setPercent(0)
		slot0:get("mpOverflowBar"):setPercent(0)
		slot0:get("assimilateBar"):setPercent(0)
		slot0:get("shieldMulMark"):visible(false)
		slot0:get("iconShield"):visible(false)
		slot0:get("comboBar"):visible(false)

		slot1 = CRenderSprite.newWithNodes(cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444, slot0)
		uv4 = "lastPer"

		slot1:addTo(slot4, 5):coverTo(slot0):setCaptureOffest(cc.p(0, 13))

		return slot1
	end(slot0.barPanelS)
	slot0.mulMarkCover = slot0:creatMulMarkCover(slot0.barPanelS:get("shieldBar"))
	slot0.specialShieldBar = nil
	slot0.spineShieldBar = nil
	slot0.comboBar = nil
end

function slot5(slot0)
	slot3 = slot0.shieldHpMax
	slot4 = slot0.shieldHp
	slot7 = slot0.specialShieldHp
	slot8 = 0
	slot9 = 0
	slot10 = 0
	slot11 = 0
	slot12 = slot0.hpMax < slot0.hp + slot0.assimilateHp and slot1 + slot6 or slot2
	slot16 = (slot1 - cc.clampf(slot0.delayHp, 0, slot1)) / slot12 * 100

	if slot1 / slot12 * 100 < math.min(slot1 / slot2 * 100, 10) then
		slot15 = slot13
		slot16 = (slot1 - slot14) / slot1 * slot13
	end

	slot0.shieldMulNum = math.ceil(slot4 / slot3)
	slot0.shieldMulMark = slot4 % slot3 / slot3
	slot0.hpPer = slot16
	slot0.shieldPer = cc.clampf(slot4 / slot3 * 100, 5, 100)
	slot0.shieldStatus = slot4 > 0
	slot0.delayPer = slot15
	slot0.delayStatus = slot14 > 0
	slot0.assimilatePer = (slot1 + slot6) / slot12 * 100
	slot0.assimilateStatus = slot6 > 0
	slot0.specialShieldStatus = slot7 > 0
end

function CLifeBar.updatePoint(slot0, slot1)
	if not slot1.mp1OverflowData and not slot1.buffOverLayData then
		return
	end

	slot4 = nil
	slot5 = true
	slot6, slot7 = nil

	if slot2 and slot2.mode == 1 then
		slot6 = math.floor(slot1.mpOverflow / slot2.rate)
		slot7 = math.floor(slot2.limit / slot2.rate)
		slot4 = slot2.effectData or {}
		slot5 = false
	elseif slot3 and slot3.overlayCount > 0 then
		slot6 = slot3.overlayCount
		slot7 = slot3.overlayLimit
		slot4 = slot3.effectData or {}
		slot5 = false
	end

	slot0:removeChildByName("pointNode")

	if slot5 then
		return
	end

	slot9, slot10 = slot0.barPanelS:get("mpBar"):xy()

	slot0:addChild(cc.Node:create(), 10, "pointNode")

	slot22 = slot7

	for slot22 = 1, math.max(slot6, slot22) do
		widget.addAnimationByKey(slot13, slot4.res or "buff/nuqidian/nuqidian.skel", "pointLimit" .. slot22, slot22 <= slot6 and (slot4.activeAction or "jihuo_effect_loop") or (slot4.emptyAction or "kong_effect_loop"), 10):xy(slot0.barPanelS:get("mpBar"):size().width / slot7 * slot22 + (slot4.offsetX or -72), slot10 + (slot4.offsetY or 8)):scale(2)

		if slot22 == slot6 and (slot4.hideEmptyPoint or false) then
			break
		end
	end
end

function CLifeBar.update(slot0, slot1)
	if slot1.needCalc then
		uv2 = "needCalc"

		slot2(slot1)

		slot0.specialShieldStatus = slot1.specialShieldStatus
	end

	slot3 = slot1.shieldPer
	slot4 = slot1.shieldStatus
	slot9 = slot0.barPanelS

	function slot10()
		uv0 = "updateCount"
		uv1 = "updateCount"
		slot0.updateCount = slot1.updateCount - 1
		uv0 = "updateCount"

		if slot0.updateCount > 0 then
			return
		end

		uv0 = "updateCount"

		if not slot0.specialShieldStatus then
			uv0 = "updateCount"

			if not slot0.spineShieldBar then
				uv0 = "updateCount"

				slot0.barCaptureS:show()
			end
		end
	end

	function slot11(slot0, slot1)
		uv2 = "get"

		if (slot1 or false) ~= slot2:get(slot0):visible() then
			slot5 = slot2
			slot4 = slot2.visible
			slot6 = slot1

			slot4(slot5, slot6)

			uv4 = "visible"
			uv5 = "visible"
			slot5 = slot5.updateCount + 1
			slot4.updateCount = slot5
			uv5 = "visible"
			uv6 = "updateCount"

			performWithDelay(slot5, slot6, 0)
		end
	end

	function slot12(slot0, slot1, slot2)
		if not slot1 then
			return
		end

		slot4 = slot1
		uv4 = "math"

		if slot4.lastPer[slot2] ~= math.ceil(slot4) then
			uv4 = "math"
			slot4 = slot4.lastPer
			slot4[slot2] = slot3
			uv4 = "math"
			uv5 = "math"
			slot5 = slot5.updateCount + 1
			slot4.updateCount = slot5
			uv5 = "ceil"
			slot6 = 0.1
			uv6 = "lastPer"

			transition.executeSequence(slot5:get(slot0)):progressTo(slot6, slot1):func(slot6):done()
		end
	end

	slot11("delayBar", slot1.delayStatus)
	slot11("assimilateBar", slot1.assimilateStatus)
	slot12("hpBar", slot1.hpPer, "hpPer")
	slot12("delayBar", slot1.delayPer, "delayPer")
	slot12("assimilateBar", slot1.assimilatePer, "assimilatePer")

	if slot1.mp and not slot0:updateComboPoint() then
		slot13 = slot1.mp
		slot14 = slot1.mpMax
		slot15 = slot1.mpOverflow
		slot16 = 0
		slot17 = 0
		slot18 = slot1.mp1OverflowData
		slot19 = isBarPanelS and 3 or 0
		slot21 = math.min(slot15, slot14) / slot14 * 100

		slot11("mpOverflowBar", (not slot18 or slot18 and slot18.mode ~= 1) and slot15 > 0)
		slot12("mpBar", math.min(slot13 + slot15, slot14) / slot14 * 100, "mpPer")

		if slot13 / slot14 * 100 >= 100 then
			slot24 = slot9:get("di"):size()
			slot25 = slot24.width / 2
			slot26 = slot24.height / 2
			slot27 = "xuetiao_mankuang_loop"

			if slot22 then
				slot9:get("mpBar"):setScaleY(1.5)
				slot9:get("mpOverflowBar"):setScaleY(1.5)

				slot27 = "xuetiao_mankuang2_loop"
			end

			widget.addAnimationByKey(slot0, battle.SpriteRes.mainSkill, "mpBarSprite", "xuetiao_mankuang", 10):xy(slot25 - 110, slot26 - 100 + slot19):addPlay(slot27)
		else
			slot9:get("mpBar"):setScaleY(1)
			slot9:get("mpOverflowBar"):setScaleY(1)
			slot0:removeChildByName("mpBarSprite")
		end

		slot12("mpOverflowBar", slot21, "mpOverflowPer")
		slot0:updatePoint(slot1)
	end

	if slot1.shieldHp then
		function ()
			uv0 = "shieldMul"
			uv1 = "shieldMulNum"
			slot1 = slot1.shieldMulNum
			slot0.shieldMul = slot1
			uv0 = "shieldMulNum"
			uv1 = "shieldMulNum"
			uv2 = "shieldMul"
			slot2 = slot2.barPanelS
			slot3 = slot2
			uv3 = "shieldMul"
			slot3 = slot3.mulMarkCover:get("shieldMulMark")
			slot4 = slot3.visible

			slot4(slot3, slot0.shieldMulNum > 1)

			uv4 = "shieldMul"

			slot4:updateShieldMulNum()

			slot4 = slot2.get(slot3, "shieldBar"):size().width
			slot6 = slot3

			slot3.stopAllActions(slot6)

			uv6 = "shieldMul"
			uv7 = "shieldMul"
			slot6.updateCount = slot7.updateCount + 1
			uv6 = "shieldMul"

			if slot6.oldShieldMul < slot0 then
				transition.executeSequence(slot3):moveTo(0.1, slot4):moveTo(0.05, 0):moveTo(0.1, slot1.shieldMulMark * slot4):func(function ()
					error("Decompilation failed")
					-- Exception in function building!
					-- Traceback (most recent call last):
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
					--     return _build_function_definition(prototype, state.header)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
					--     node.statements.contents = _build_function_blocks(state, instructions)
					--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
					--     statement, line_marked_elements = _build_statement(state, addr, instruction)
					--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
					--     return _build_var_assignment(state, addr, instruction)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
					--     assn = func(*args, **kwargs)
					--            ^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
					--     expression = _build_const_expression(state, addr, instruction)
					--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
					--     return _build_string_constant(state, instruction.CD)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
					--     node.value = state.constants.complex_constants[index]
					--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
					-- IndexError: list index out of range
				end):done()
			else
				uv6 = "shieldMul"

				if slot0 < slot6.oldShieldMul then
					transition.executeSequence(slot3):moveTo(0.1, 0):moveTo(0.05, slot4):moveTo(0.1, slot1 * slot4):func(slot5):done()
				else
					transition.executeSequence(slot3):moveTo(0.1, slot1 * slot4):func(slot5):done()
				end
			end
		end()
		slot11("shieldBar", slot4, true)
		slot12("shieldBar", slot3, "shieldPer", true)

		if not slot0:updateSpineShield(slot4, slot3) then
			if slot0.specialShieldStatus then
				slot14 = slot0.barPanelS:get("di"):size()
				slot15 = slot0.barPanelS:get("shieldBar")
				slot16 = slot14.width / 2
				slot17 = slot14.height / 2

				slot0.barPanelS:get("shieldBar"):setOpacity(0)
				slot0:switchMulMarkType(battle.SpriteRes.fireShield, "yichu_loop", 1, 5, cc.p(-20, 55))

				slot0.specialShieldBar = slot0.specialShieldBar or slot0:createShieldClip("specialShield", 6)
				slot18 = slot0.specialShieldBar:get("shieldBarSprite") or widget.addAnimationByKey(slot0.specialShieldBar, battle.SpriteRes.fireShield, "shieldBarSprite", "xuetiao_loop", 6):align(cc.p(0.5, 0.5)):setScaleY(1.7):xy(0, -5):addPlay("xuetiao_loop")

				slot18:stopAllActions()
				slot18:runAction(cc.MoveTo:create(0.1, cc.p(slot15:width() * (1 - slot3 / 100) * (-1 + slot15:getDirection() * 2), slot18:y())))
			else
				slot0.barPanelS:get("shieldBar"):setOpacity(255)
				slot0:switchMulMarkType()
				slot0.barPanelS:removeChildByName("specialShield")

				slot0.specialShieldBar = nil
			end
		end
	end

	if slot0.updateCount > 0 then
		slot0.barCaptureS:hide()
	end
end

function CLifeBar.setVisibleEnable(slot0, slot1)
	slot0.canSetVisible = slot1
end

function CLifeBar.setVisible(slot0, slot1)
	if not slot0.canSetVisible then
		return
	end

	cc.Node.setVisible(slot0, slot1)
end

function CLifeBar.onSetLifebarVisible(slot0, slot1, slot2, slot3)
	slot0.lifeBarVisible:set(slot1, slot2, slot3)
	slot0:setVisible(slot0.lifeBarVisible:get())
end

function CLifeBar.creatMulMarkCover(slot0, slot1)
	if slot0.barPanelS:get("mulMarkCover") then
		return slot2
	end

	slot3 = ccui.Layout:create()
	uv6 = "barPanelS"

	slot3:setBackGroundImage(slot6.shield)
	slot3:setContentSize(cc.size(slot3:getBackGroundImageTextureSize().width, slot3:getBackGroundImageTextureSize().height + 8))
	slot3:setClippingEnabled(true)
	slot3:setBackGroundImageOpacity(0)
	slot3:setName("mulMarkCover")
	slot3:addTo(slot0.barPanelS, 10)
	slot3:align(cc.p(0.5, 0.5), slot1:x(), slot1:y())

	slot6 = slot0.barPanelS:get("shieldMulMark")

	slot6:removeFromParent()
	slot6:addTo(slot3)
	slot6:xy(0, 7)

	return slot3
end

function CLifeBar.switchMulMarkType(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0.mulMarkCover:get("shieldMulMark")

	if not slot1 then
		slot6:setOpacity(255)
		slot6:removeChildByName("specialMulMark")
	else
		slot5 = slot5 or cc.p(0, 0)

		slot6:setOpacity(0)

		slot7 = CSprite.new(slot1)

		slot7:play(slot2)
		slot7:addTo(slot6, 1):align(cc.p(1, 0.5), slot5.x, slot5.y):setScaleX(slot3 or 1):setScaleY(slot4 or 1):setVisible(true)
		slot7:setName("specialMulMark")
	end
end

function CLifeBar.onShowIconShield(slot0)
	slot1 = slot0:onHideIconShield()
	slot2 = slot1:size()

	cc.Label:createWithTTF(slot0.shieldMul, "font/youmi1.ttf", 36):enableOutline(cc.c4b(0, 0, 0, 255), 1):setAnchorPoint(cc.p(0.5, 0.5)):addTo(slot1):xy(slot2.width / 2, slot2.height / 2):setName("shieldMulNum")
	slot1:visible(slot0.shieldMul > 0)

	return slot1
end

function CLifeBar.onHideIconShield(slot0)
	if slot0.barPanelS:get("iconShield"):get("shieldMulNum") then
		slot2:removeFromParent()
	end

	slot1:visible(false)

	return slot1
end

function CLifeBar.updateShieldMulNum(slot0)
	if slot0.barPanelS:get("iconShield"):get("shieldMulNum") then
		slot2:setString(slot0.shieldMul)
		slot1:visible(slot0.shieldMul > 0)
	end
end

function CLifeBar.createShieldClip(slot0, slot1, slot2)
	slot3 = slot0.barPanelS:get("shieldBar")
	slot5 = 100
	slot6 = slot3:getBoundingBox().width / 2
	slot7 = {
		cc.p(-slot6, -slot5),
		cc.p(-slot6, slot5),
		cc.p(slot6, slot5),
		cc.p(slot6, -slot5)
	}
	slot8 = cc.DrawNode:create()

	slot8:drawPolygon(slot7, #slot7, cc.c4b(1, 1, 0, 0), 1, cc.c4b(0, 1, 0, 1))

	slot9 = cc.ClippingNode:create(slot8)

	slot9:addTo(slot0.barPanelS, slot2):align(cc.p(0.5, 0.5), slot3:x(), slot3:y()):setName(slot1):setVisible(true)

	return slot9
end

function CLifeBar.onAddSpineShield(slot0, slot1)
	slot0:onDelSpineShield()

	slot4 = slot1.offSet or cc.p(0, 0)

	slot0.barPanelS:get("shieldBar"):setOpacity(0)
	slot0:switchMulMarkType(slot1.mulMarkResPath, slot1.mulMarkAniName or "yichu_loop", slot1.mulMarkScaleX, slot1.mulMarkScaleY, slot1.mulMarkOffSet)

	slot0.spineShieldBar = slot0:createShieldClip("spineShieldBar", 8)
	slot15 = CSprite.new(slot1.resPath)

	slot15:play(slot1.aniName or "effect")
	slot15:addTo(slot0.spineShieldBar):align(cc.p(0.5, 0.5), slot4.x, slot4.y):scaleX(slot1.scaleX or 1):scaleY(slot1.scaleY or 1):setVisible(true)
	slot15:setName("barSpine")
	slot0:updateSpineShield(slot12:isVisible(), slot12:getPercent())
end

function CLifeBar.onDelSpineShield(slot0)
	if not slot0.spineShieldBar then
		return
	end

	slot0:switchMulMarkType()
	slot0.barPanelS:get("shieldBar"):setOpacity(255)
	slot0.spineShieldBar:removeFromParent()

	slot0.spineShieldBar = nil
end

function CLifeBar.updateSpineShield(slot0, slot1, slot2)
	if not slot0.spineShieldBar then
		return
	end

	if slot0.spineShieldBar:isVisible() ~= (slot1 and true or false) then
		slot0.spineShieldBar:setVisible(slot1 or false)
	end

	if not slot2 then
		return
	end

	if slot0.lastPer.shieldBar == math.ceil(slot2) then
		return
	end

	slot4 = slot0.barPanelS:get("shieldBar")
	slot7 = slot0.spineShieldBar:get("barSpine")

	slot7:stopAllActions()
	slot7:runAction(cc.MoveTo:create(0.1, cc.p(slot4:width() * (1 - slot2 / 100) * (-1 + slot4:getDirection() * 2), slot7:y())))

	return true
end

function CLifeBar.showComboBar(slot0, slot1)
	slot0.barPanelS:get("mpBar"):setPercent(0)
	slot0.barPanelS:get("mpOverflowBar"):setPercent(0)
	slot0:removeChildByName("mpBarSprite")

	slot2 = slot0.barPanelS:get("comboBar")

	slot2:visible(true)

	slot3 = slot2:size()
	slot5 = slot3.height

	for slot11 = 1, slot1.overlayLimit - 1 do
		function (slot0, slot1)
			uv4 = "ccui"
			slot2 = ccui.ImageView:create(slot4.line)
			uv5 = "ImageView"
			slot6 = 2

			slot2:addTo(slot5, slot6, "line" .. slot0)
			slot2:setScaleX(2)
			slot2:setScaleY(1.5)

			uv6 = "create"

			slot2:xy(slot1, slot6 / 2)
		end(slot11, slot11 * slot3.width / slot1.overlayLimit)
	end

	slot0.comboBar = slot2

	return slot2
end

function CLifeBar.updateComboPoint(slot0, slot1)
	if not slot1 then
		if not slot0.comboBar then
			return false
		else
			return true
		end
	end

	if not slot0.comboBar then
		slot0:showComboBar(slot1)
	end

	slot0.comboBar:get("comboBarCover"):show():setPercent((1 - slot1.overlayCount / slot1.overlayLimit) * 100)
	slot0:updateHighLightPoint(slot1)

	return true
end

function CLifeBar.updateHighLightPoint(slot0, slot1)
	slot2 = slot1.overlayLimit
	slot3 = slot1.overlayCount
	slot4 = slot1.effectData or {}
	slot5 = slot4.highLightLimit or 0
	slot6 = slot4.res or "buff/nuqidian/nuqidian.skel"
	slot7 = slot4.emptyAction or "kong_effect_loop"
	slot8 = slot4.activeAction or "jihuo_effect_loop"
	slot9 = slot4.hideEmptyPoint or true

	if not slot0.comboBar or slot5 == 0 then
		return
	end

	slot10 = slot0.comboBar:size()
	slot11 = slot10.width
	slot12 = slot10.height
	slot13 = slot4.offset or cc.p(0, 0)
	slot14 = slot4.scale or 1.5

	for slot21 = 1, math.floor(slot2 / slot5) do
		slot22 = "highLight" .. slot21

		slot0.comboBar:removeChildByName(slot22)
		function (slot0, slot1, slot2, slot3)
			uv4 = "widget"
			uv5 = "addAnimationByKey"
			slot4 = slot4 / slot5
			uv5 = "comboBar"
			slot6 = slot4 / 2
			slot5 = slot4 * (slot0 * slot5 - 1) + slot6
			uv6 = "xy"
			slot6 = slot6 / 2
			slot7 = slot2 or not slot3

			if slot2 then
				uv8 = "x"

				if not slot8 then
					uv8 = "y"
				end
			end

			uv10 = "scale"
			uv11 = "visible"
			slot12 = slot1
			uv11 = "widget"
			slot11 = slot5 + slot11.x
			uv12 = "widget"
			uv11 = "addAnimationByKey"

			widget.addAnimationByKey(slot10.comboBar, slot11, slot12, slot8, 10):xy(slot11, slot6 + slot12.y):scale(slot11):visible(slot7)
		end(slot21, slot22, slot21 <= math.floor(slot3 / slot5), slot9)
	end
end
