slot0 = class("SkillInfo", battleModule.CBase)
slot1 = string.format
slot2 = {
	qian = "dazhao_qian_loop",
	res = "dz_ice.skel",
	hou = "dazhao_hou_loop",
	man = "dazhao_man_loop",
	shan = "dazhao_shan",
	mankuang_l = "dazhao_mankuang_loop",
	shui = "dazhao_shui_loop",
	mankuang = "dazhao_mankuang"
}

function slot0.selectIsFirstMainCharge(slot0, slot1, slot2)
	slot0.skillMainTb = slot0.skillMainTb or {}

	if slot0.skillMainTb[tostring(slot1)] ~= slot2 and slot2 then
		slot0.skillMainTb[slot3] = slot2

		return true
	end

	slot0.skillMainTb[slot3] = slot2

	return false
end

function slot0.playMainSkillEffect(slot0, slot1, slot2, slot3)
	if not slot1.mpWater then
		error("water effect not exist")
	end

	if not slot1.kuang then
		slot1.kuang = newCSpriteWithOption(slot0:getEffectName(slot1, "res"))

		slot1:z(6):add(slot1.kuang)
		slot1.kuang:setPosition(cc.p(slot1:size().width / 2 - 3, 5))
	end

	slot1.kuang:visible(slot2)

	if slot2 then
		slot1.mpWater:play(slot0:getEffectName(slot1, "shan"))
		slot1.mpWater:addPlay(slot0:getEffectName(slot1, "man"))

		if slot0:selectIsFirstMainCharge(slot3, slot2) then
			slot1.kuang:z(10):play(slot0:getEffectName(slot1, "mankuang"))
			slot1.kuang:z(8):addPlay(slot0:getEffectName(slot1, "mankuang_l"))
		else
			slot1.kuang:play(slot0:getEffectName(slot1, "mankuang_l"))
		end
	else
		slot1.mpWater:play(slot0:getEffectName(slot1, "shui"))
	end
end

function slot0.getEffectName(slot0, slot1, slot2, slot3)
	uv5 = "widgetEffects"
	slot5 = slot5[slot2]

	if slot1.widgetEffects and slot4[slot2] then
		slot5 = slot4[slot2]
	end

	if slot2 == "res" then
		slot5 = "effect/" .. slot5
	end

	return slot5
end

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot5 = "skill4"
	slot0.widgets = {
		slot0.parent.UIWidgetBottomRight:get("skill1"),
		slot0.parent.UIWidgetBottomRight:get("skill2"),
		slot0.parent.UIWidgetBottomRight:get("skill3"),
		slot0.parent.UIWidgetBottomRight:get(slot5)
	}

	for slot5, slot6 in ipairs(slot0.widgets) do
		slot6:hide()
	end

	slot0.cardClipping = slot0.parent.UIWidgetBottomRight:get("cardClipping")

	slot0.cardClipping:hide()
	slot0.cardClipping:setClippingEnabled(true)

	slot0.cardPx, slot0.cardPy = slot0.cardClipping:xy()
	slot0.cardPHalfWidth = slot0.cardClipping:size().width / 2
	slot0.heroIcon = slot0.cardClipping:get("halfHeroIcon")
	slot0.curSkill = nil
	slot0.skillWidgetMap = {}
	slot0.originWidigetY = slot0.widgets[1]:getPositionY()
	slot2 = slot0.parent.UIWidgetBottomRight:get("skillInfo")

	slot2:hide()

	slot0.infoPanelSize = slot2:getContentSize()
	slot0.skillCdMap = {}
	slot0.mpWaterRes = nil
end

function slot0.skillInit(slot0, slot1, slot2)
	slot3 = slot1.orderId
	slot5 = slot1.skillID
	slot6 = slot1.leftCd
	slot7 = slot1.model
	slot8 = slot1.precent
	slot9 = slot1.costMp1
	slot10 = slot1.skillCfg

	slot1.widget:get("skillName"):setString(slot10.skillName)

	if slot10.skillDamageTypeIcon then
		slot4:get("damageType"):loadTexture(slot10.skillDamageTypeIcon)
	else
		slot4:get("damageType"):loadTexture(slot10.skillDamageType == battle.SkillDamageType.Physical and "battle/icon_w.png" or "battle/icon_t.png")
	end

	if game.NATURE_TABLE[slot1.natureType] ~= nil then
		slot4:get("skillAttribute"):setVisible(true)
		slot4:get("skillAttribute"):loadTexture(ui.ATTR_ICON[slot1.natureType])
	else
		slot4:get("skillAttribute"):setVisible(false)
	end

	slot4:setTouchEnabled(true)

	slot11, slot12 = slot0:isZawakeSkill(slot10, slot7)

	slot4:get("bgLogo"):setVisible(slot11 ~= nil)

	if slot4.mpWater then
		slot4.mpWater:removeFromParent()
		slot4.kuang:removeFromParent()
		slot4.mpHou:removeFromParent()
		slot4.mpBall:removeFromParent()

		slot4.mpWater = nil
		slot4.kuang = nil
		slot4.mpHou = nil
		slot4.mpBall = nil

		slot4:get("bg"):show()
	end

	if slot10.skillType2 == battle.MainSkillType.BigSkill then
		slot4.widgetEffects = slot10.widgetEffects or {}
		slot15 = slot4:size()
		slot16 = slot0:getEffectName(slot4, "res")
		slot0.mpWaterRes = slot16

		slot4:get("bg"):hide()

		slot17 = newCSprite("battle/btn_skill_2.png"):addTo(slot4, 3):xy(slot15.width / 2, slot15.height / 2)
		slot18 = newCSpriteWithOption(slot16)

		slot18:play(slot0:getEffectName(slot4, "hou"))
		slot18:setPosition(cc.p(slot15.width / 2 - 3, 5))
		slot4:add(slot18, 2)

		slot4.mpHou = slot18
		slot19 = newCSpriteWithOption(slot16)

		slot19:play(slot0:getEffectName(slot4, "qian"))
		slot19:setPosition(cc.p(slot15.width / 2 - 3, 5))
		slot4:add(slot19, 4)

		slot4.mpBall = slot19
		slot20 = newCSpriteWithOption(slot16)

		slot20:play(slot0:getEffectName(slot4, "shui"))

		slot21 = cc.Sprite:create("battle/btn_skill.png")

		slot21:anchorPoint(0, 0):scale(0.98)

		slot22 = cc.ClippingNode:create(slot21)

		slot22:setAlphaThreshold(0.2)
		slot4:add(slot22)
		slot22:add(slot20)

		slot4.mpWater = slot20

		slot4.mpWater:stopAllActions()

		if slot2 then
			slot4.mpWater:setPosition(cc.p(150, 200 * math.min(math.max(0, math.floor(100 * slot8)), 100) / 100 - 75))
			slot0:playMainSkillEffect(slot4, slot14 >= 100, slot7)
		else
			transition.executeSequence(slot4.mpWater):moveTo(0.6, 150, slot23.y):delay(0.01):func(function ()
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
		end

		if slot9 and slot9 == 0 and not slot1.canSpell then
			slot4:get("bg"):show()
			slot0:playMainSkillEffect(slot4, false, slot7)
			slot4.mpWater:hide()
			slot4.mpHou:hide()
			slot4.mpBall:hide()
		else
			slot4:get("bg"):hide()
			slot4.mpWater:show()
			slot4.mpHou:show()
			slot4.mpBall:show()
		end
	end

	slot13 = slot4:get("round")

	slot13:hide()
	slot13:scale(2.5)
	slot13:opacity(0)
	slot4:get("cdBg"):hide()

	if not slot1.canSpell then
		if slot6 and slot6 > 0 and slot6 < 100 then
			slot14:show()
			slot13:setVisible(true)
			slot13:setString(slot6)

			if not next(slot0.skillCdMap) or slot0.skillCdMap[slot5] ~= slot6 then
				transition.executeParallel(slot13):fadeTo(0.5, 255):scaleTo(0.5, 1)

				slot0.skillCdMap[slot5] = slot6
			else
				slot13:scale(1)
				slot13:opacity(255)
			end

			slot15 = nil
			slot16 = (1 - slot6 / slot10.cdRound) * 100
		end

		slot16 = slot1.showInfo

		if slot1.cantUseSkill and slot16 and slot16.setGray then
			slot14:show()
		end
	end
end

function slot0.isZawakeSkill(slot0, slot1, slot2)
	if slot1.zawakeEffect[1] and slot2.tagSkills[slot3] then
		return csv.skill[slot3], slot1 and slot1.zawakeEffect[2] == 1
	end
end

function slot0.getSkillName(slot0, slot1, slot2)
	slot3 = slot1.skillName

	if slot0:isZawakeSkill(slot1, slot2) then
		return slot4.skillName .. slot3
	end

	return slot3
end

function slot0.skillButtonInit(slot0, slot1)
	slot2 = slot1.orderId
	slot3 = slot1.widget
	slot5 = slot1.leftCd
	slot6 = slot1.leftStartRound
	slot7 = slot1.model
	slot8 = csv.skill[slot1.skillID]

	slot3:get("clickFrame"):hide()

	slot9 = false

	function slot10(slot0)
		uv0 = 1
		uv1 = "UIWidgetBottomRight"
		slot1 = slot1.parent.UIWidgetBottomRight:get("skillInfo")
		slot3 = slot1:get("container"):get("skillDescribe")

		slot1:show()

		if not slot0 then
			slot1:hide()
			slot3:removeAllChildren()

			return
		end

		uv4 = "get"
		slot4, slot5 = slot4:getPosition()
		uv6 = "get"
		slot7 = slot6
		uv7 = "skillInfo"
		slot11 = slot4 + (slot7 == 1 and -160 or 0)

		slot1:setPosition(cc.p(slot11, slot5 + slot6.getBoundingBox(slot7).height / 2 + 15))
		slot1:setLocalZOrder(99999)
		slot1:setVisible(true)

		slot8 = slot2:get("skillName")
		uv11 = "UIWidgetBottomRight"
		slot12 = slot11
		uv13 = "container"
		uv14 = "skillDescribe"

		slot8:setString(slot11.getSkillName(slot12, slot13, slot14))

		slot9 = nodetools.get(slot2, "skillrange")
		uv12 = "container"

		slot9:setString(slot12.targetTypeDesc)

		slot11 = math.max(0, slot8:getContentSize().width + slot9:getContentSize().width - slot3:getContentSize().width)
		slot12 = 0

		if matchLanguage({
			"en"
		}) then
			slot12 = 150
		end

		uv13 = "UIWidgetBottomRight"
		slot13.descSizeWidth = slot10.width + slot11 + slot12
		uv13 = "container"

		if slot13.describeShort == "" then
			uv13 = "container"

			if not slot13.describe then
				uv13 = "container"
				slot13 = slot13.describeShort
			end
		end

		slot14 = false
		uv15 = "UIWidgetBottomRight"
		uv17 = "container"
		uv18 = "skillDescribe"

		if slot15:isZawakeSkill(slot17, slot18) then
			uv15 = "container"

			if slot15.zawakeEffect[2] == 1 then
				slot14 = true
			else
				uv15 = "container"

				if slot15.zawakeEffectDescShort == "" then
					uv15 = "container"

					if not slot15.zawakeEffectDesc then
						uv15 = "container"
						slot13 = slot15.zawakeEffectDescShort
					end
				end
			end
		end

		uv15 = "show"
		slot15 = slot15.level
		uv18 = "hide"
		uv18 = "skillDescribe"
		slot21 = slot13
		uv21 = "UIWidgetBottomRight"
		slot17 = rich.createWithWidth(string.format("#C0x5b545b#%s", eval.doMixedFormula(slot21, {
			skillLevel = slot15 or 1,
			math = math
		}, nil) or "no desc") .. uiEasy.getStarSkillDesc({
			skillLevel = slot15,
			skillId = slot18,
			star = slot18:getStar(),
			isZawake = slot14
		}, _, false), 40, nil, slot21.descSizeWidth)

		slot17:setAnchorPoint(cc.p(0, 1))
		slot17:setPosition(cc.p(0, 0))
		slot3:addChild(slot17, 99)

		slot20 = 0
		slot21 = slot17:getContentSize().height - slot10.height
		uv20 = "UIWidgetBottomRight"
		uv21 = "UIWidgetBottomRight"
		slot21 = slot21.infoPanelSize.height + math.max(slot20, slot21)
		slot25 = slot20.infoPanelSize.width + slot11 + slot12

		slot1:get("bg"):setContentSize(cc.size(slot25, slot21))

		uv25 = "UIWidgetBottomRight"
		slot25 = slot25.infoPanelSize.width / 2 + slot11 + slot12 / 2

		slot9:setPosition(cc.p(slot25, slot9:getPositionY()))

		uv25 = "UIWidgetBottomRight"

		slot2:setPosition(cc.p(slot25.infoPanelSize.width / 2 - slot11 / 2 - slot12 / 2, slot21))
	end

	slot11 = nil
	slot12 = slot3:getContentSize()
	slot13 = cc.rect(0, 0, slot12.width, slot12.height)

	slot3:addTouchEventListener(function ()
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
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
		--     return _build_numeric_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
		--     number = state.constants.numeric_constants[index]
		--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end)
	slot3:onClick(function ()
		uv0 = "cannotClick"

		if slot0 then
			return
		end

		uv0 = "skills"

		if slot0.cannotClick then
			return
		end

		uv0 = "errorInWindows"
		uv1 = "selectedSkill is nil model unitID(%s), originUnitID(%s), skillID(%s), skillsOrder(%s)"

		if not slot0.skills[slot1] then
			uv3 = "errorInWindows"
			uv4 = "errorInWindows"
			uv5 = "selectedSkill is nil model unitID(%s), originUnitID(%s), skillID(%s), skillsOrder(%s)"
			uv7 = "errorInWindows"

			errorInWindows("selectedSkill is nil model unitID(%s), originUnitID(%s), skillID(%s), skillsOrder(%s)", slot3.unitID, slot4.originUnitID, slot5, dumps(slot7.skillsOrder or {}))

			return
		end

		slot2 = slot0.getTargetsHint
		slot1 = table.length(slot2(slot0))
		uv2 = "unitID"

		if not slot2.canSpell then
			uv2 = "errorInWindows"
			slot5 = {
				skillType2 = slot6,
				skillId = slot6
			}
			uv6 = "originUnitID"
			slot6 = slot6.skillType2
			uv6 = "selectedSkill is nil model unitID(%s), originUnitID(%s), skillID(%s), skillsOrder(%s)"
			slot2, slot3 = slot2:isLogicStateExit(battle.ObjectLogicState.cantUseSkill, slot5)
			slot4 = nil
			uv5 = "dumps"

			if slot5 <= 0 then
				uv5 = "skillsOrder"

				if slot5 > 0 then
					slot4 = gLanguageCsv.skillCannotSpell
				elseif slot2 then
					slot4 = slot3 and slot3.tipStr or gLanguageCsv.objectInControl
				else
					uv5 = "errorInWindows"
					slot4 = (not slot5:isBeInSneer() or gLanguageCsv.objectInSneer) and (slot1 ~= 0 or gLanguageCsv.canNotSelect) and gLanguageCsv.mpNotEnough
				end
			end

			if slot4 then
				gGameUI:showTip(slot4)
			end

			return
		end

		uv2 = "skills"
		slot2 = slot2.notify

		slot2(slot2, "selectedHero")

		uv2 = "skills"

		if slot2.curSkill then
			uv2 = "skills"
			uv3 = "skills"
			uv4 = "skills"
			slot2 = slot2.widgets[slot3.skillWidgetMap[slot4.curSkill]]

			slot2:get("clickFrame"):hide()

			slot3 = transition.executeParallel(slot2)
			slot4 = slot3
			slot3 = slot3.moveBy

			slot3(slot4, 0.02, 0, -10)

			uv3 = "skills"
			uv4 = "selectedSkill is nil model unitID(%s), originUnitID(%s), skillID(%s), skillsOrder(%s)"

			if slot3.curSkill == slot4 then
				uv3 = "skills"
				slot3 = slot3.call

				slot3(slot3, "resetHitPanelStateToShowAttrsPanel")

				uv3 = "skills"
				slot3.curSkill = nil

				return
			end
		end

		uv2 = "skills"
		uv6 = "unitID"

		slot2:notify("selectSkill", slot0, slot6.exactImmuneInfos)
	end)
end

function slot0.onSelectSkill(slot0, slot1)
	slot2 = slot1.id
	slot3 = slot0.widgets[slot0.skillWidgetMap[slot2]]

	if not slot0.skillWidgetMap[slot2] or not slot3 then
		return
	end

	transition.executeParallel(slot3):moveBy(0.02, 0, 10)
	slot3:get("clickFrame"):setVisible(true)

	slot0.curSkill = slot2
end

function slot0.onSkillRefresh(slot0, slot1, slot2, slot3, slot4)
	if not slot2 or not next(slot2) or not slot3 or not next(slot3) then
		return
	end

	if not slot1.scene.play:isPlaying() then
		slot0.cannotClick = true

		return
	end

	if slot5:isNowTurnAutoFight() then
		slot0.cannotClick = true
	end

	slot7 = {}
	slot8 = 0

	for slot12, slot13 in ipairs(slot2) do
		if slot12 - slot8 <= table.length(slot0.widgets) then
			slot13 = slot1.skillsMap[slot13] or slot13
			slot16, slot17 = slot1:isLogicStateExit(battle.ObjectLogicState.cantUseSkill, {
				skillType2 = csv.skill[slot13].skillType2,
				skillId = slot13
			})

			if slot16 and slot17 and slot17.hide then
				slot8 = slot8 + 1
				slot6 = table.length(slot2) - 1
			else
				slot18 = slot3[slot13].stateInfoTb
				slot19 = {
					orderId = slot14,
					skillID = slot13,
					skillCfg = slot15,
					widget = slot0.widgets[slot14],
					canSpell = slot18.canSpell,
					cantUseSkill = slot16,
					showInfo = slot17,
					leftCd = slot18.leftCd,
					leftStartRound = slot18.leftStartRound,
					precent = slot18.precent,
					level = slot18.level,
					model = slot1,
					costMp1 = slot3[slot13].costMp1,
					exactImmuneInfos = slot4[slot13],
					natureType = slot20:getSkillNatureType()
				}
				slot20 = slot3[slot13]
				slot7[slot14] = slot19

				slot0:skillInit(slot19, true)

				slot0.skillWidgetMap[slot13] = slot14

				slot0.widgets[slot14]:setVisible(true)
				slot0.widgets[slot14]:setTouchEnabled(false)
				performWithDelay(slot0.widgets[slot14], function ()
					uv0 = "widgets"
					uv1 = "setTouchEnabled"

					slot0.widgets[slot1]:setTouchEnabled(true)
				end, 0)
			end
		end

		if true then
			-- Nothing
		end
	end

	slot0.heroIcon:loadTexture(slot1.unitCfg.show)
	slot0.heroIcon:scale(slot1.unitCfg.bansxScale)
	slot0.heroIcon:xy(slot0.cardPHalfWidth + (slot1.unitCfg.bansxPosC.x or 0), slot9.y or 0)
	slot0.heroIcon:setVisible(false)

	if slot6 < table.length(slot0.widgets) then
		for slot13 = slot6 + 1, table.length(slot0.widgets) do
			slot0.widgets[slot13]:hide()
		end
	end

	slot14 = slot0.cardPy

	slot0.cardClipping:xy(slot0.widgets[math.min(slot6, table.length(slot0.widgets))]:getPositionX() - 40 - slot0.cardPHalfWidth, slot14)

	for slot14, slot15 in ipairs(slot7) do
		slot0:skillButtonInit(slot15)
	end

	for slot14, slot15 in pairs(slot0.widgets) do
		slot0.widgets[slot14]:setPositionY(slot0.originWidigetY)
	end
end

function slot0.onNewBattleRoundTo(slot0, slot1)
	slot0.curSkill = nil
	slot0.skillWidgetMap = {}
	slot0.cannotClick = nil

	if slot1.obj.scene.autoFight or slot1.isTurnAutoFight or not slot2.play.curBattleRoundAttack then
		slot0:hideAll()
	else
		slot0:onSkillRefresh(slot1.obj, slot1.skillsOrder, slot1.skillsStateInfoTb, slot1.immuneInfos)
	end
end

function slot0.onBattleTurnEnd(slot0)
	slot0:hideAll()
end

function slot0.onAutoSelectSkill(slot0, slot1, slot2)
	if slot0:call("getSceneObjBySeat", slot1) then
		slot0:onSelectObj(slot3, slot2)
	end
end

function slot0.onSelectObj(slot0, slot1, slot2)
	slot3 = slot2 or slot0.curSkill

	if slot0.curSkill == nil then
		if not slot3 then
			return
		end

		slot0:onSelectSkill({
			id = slot3
		})
	end

	slot0:notify("selectedHero")
	slot1.natureQuan:show()
	transition.executeSequence(slot1.natureQuan):delay(0.5):func(function ()
		uv0 = "natureQuan"

		slot0.natureQuan:hide()
	end):done()
	transition.executeSequence(slot1.groundRing):delay(0.5):func(function ()
		uv0 = "groundRingVisible"
		slot0 = slot0.groundRingVisible
		slot0 = slot0.set
		slot2 = false

		slot0(slot0, slot2)

		uv0 = "groundRingVisible"
		uv2 = "groundRingVisible"

		slot0.groundRing:setVisible(slot2.groundRingVisible:get())
	end):done()

	slot0.curSkill = nil
	slot0.skillWidgetMap = {}

	for slot7, slot8 in ipairs(slot0.widgets) do
		slot8:setTouchEnabled(false)
	end

	slot0.parent:handleOperation(battle.OperateTable.attack, slot1.model.seat, slot3)

	slot0.cannotClick = true
end

function slot0.onClose(slot0)
end

function slot0.hideAll(slot0)
	for slot4, slot5 in ipairs(slot0.widgets) do
		slot5:setPositionY(-slot0.originWidigetY - 100)
		slot5:setVisible(false)
	end

	slot0.heroIcon:hide()
end

return slot0
