slot0 = {
	LOCK = 1,
	CANT_CHALLENGE = 2,
	CAN_CHALLENGE = 3,
	PASSED = 4
}
slot1 = 10
slot2 = 11

function slot3(slot0)
	slot0:hide()
	slot0:stopAllActions()
end

function slot4(slot0)
	return ({
		"Jan",
		"Feb",
		"Mar",
		"Apr",
		"May",
		"Jun",
		"Jul",
		"Aug",
		"Sept",
		"Oct",
		"Nov",
		"Dec"
	})[tonumber(slot0)]
end

slot5 = {
	[slot0.LOCK] = function ()
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
	end,
	[slot0.CANT_CHALLENGE] = function (slot0, slot1, slot2)
		slot5 = slot0
		slot4 = slot0.get(slot5, "fog")
		uv5 = "get"

		slot5(slot0:get("state"))
		itertools.invoke({
			slot0:get("name"),
			slot0:get("iconCrown"),
			slot0:get("icon")
		}, "hide")
		slot0:stopAllActions()

		if slot2 and slot2 ~= "" then
			slot5 = slot0:get("icon"):getContentSize()
			slot6 = widget.addAnimationByKey(slot0:get("fogEffect"), slot2, "unLockLoop", "standby_loop", 6):xy(slot5.width / 2, slot5.height / 2)
		elseif slot1 and slot1 ~= "" then
			slot4:texture(slot1)
			slot4:show()
		else
			slot4:hide()
			slot3:show()
			slot3:setColor(cc.c3b(0, 0, 0))
		end
	end,
	[slot0.CAN_CHALLENGE] = function (slot0)
		slot1 = slot0:get("iconCrown")
		slot2 = slot0:get("state")
		slot3 = slot0:get("icon")

		itertools.invoke({
			slot3,
			slot0:get("name"),
			slot0:get("fog")
		}, "show")
		itertools.invoke({
			slot0:get("fogEffect"),
			slot0:get("fog")
		}, "hide")
		slot3:setColor(cc.c3b(255, 255, 255))
		slot0:stopAllActions()
		slot1:opacity(0)
		slot1:stopAllActions()
		slot1:runAction(cc.RepeatForever:create(transition.sequence({
			cc.FadeTo:create(0.2, 255),
			cc.FadeTo:create(0.2, 0),
			cc.FadeTo:create(0.2, 255),
			cc.FadeTo:create(0.2, 0),
			cc.DelayTime:create(1.5)
		})))
		slot2:show()
		slot2:opacity(255)
		slot2:texture("activity/summer_challenge/txt_xrtz_tzz.png")
		slot2:stopAllActions()
		slot2:runAction(cc.RepeatForever:create(transition.sequence({
			cc.FadeTo:create(0.6, 100),
			cc.FadeTo:create(0.6, 255),
			cc.DelayTime:create(1.2)
		})))
	end,
	[slot0.PASSED] = function (slot0)
		slot1 = slot0:get("icon")
		slot3 = slot0
		slot2 = slot0.get(slot3, "state")
		uv3 = "get"

		slot3(slot0:get("iconCrown"))
		itertools.invoke({
			slot1,
			slot0:get("name"),
			slot0:get("fog")
		}, "show")
		itertools.invoke({
			slot0:get("fogEffect"),
			slot0:get("fog")
		}, "hide")
		slot0:stopAllActions()
		slot1:setColor(cc.c3b(255, 255, 255))
		slot2:show()
		slot2:texture("activity/summer_challenge/txt_xrtz_tzcg.png")
		slot2:opacity(255)
		slot2:stopAllActions()
	end
}
slot6 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	}
}
slot8 = class("SummerChallengleAnnualView", cc.load("mvc").ViewBase)
slot8.RESOURCE_FILENAME = "summer_challenge_new.json"
slot8.RESOURCE_BINDING = {
	mapPanel = "mapPanel",
	imgBg = "imgBg",
	rightCloud = "rightCloud",
	leftCloud = "leftCloud",
	btnRule = {
		varname = "btnRule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowRule")
			}
		}
	},
	["timePanel.time"] = {
		varname = "time",
		binds = slot6
	},
	["timePanel.timeText"] = {
		varname = "timeText",
		binds = slot6
	}
}

function slot8.onCreate(slot0, slot1)
	slot0.yyID = slot1
	slot2 = csv.yunying.yyhuodong[slot1]
	slot3 = time.getNumTimestamp(slot2.beginDate, time.getHourAndMin(slot2.beginTime, true))
	slot0.endTime = time.getNumTimestamp(slot2.endDate, time.getHourAndMin(slot2.endTime, true))

	slot0:enableSchedule()
	slot0:initModel()
	slot0:initGameTime(slot2)
	slot0:initMap(slot2)
	slot0:initcloudAction()
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		title = slot0.baseCsv.name,
		subTitle = slot0.baseCsv.subTitle
	})

	if slot0.selectIndex then
		performWithDelay(slot0, function ()
			uv0 = "onGateDetail"
			uv2 = "onGateDetail"

			slot0:onGateDetail(slot2.selectIndex)
		end, 0)
	end

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "stamps"
		slot2 = slot1[slot2] or {}
		uv6 = "time"
		slot7 = (slot2.info or {}).all_pass
		uv8 = "getTime"
		slot9 = slot8

		slot8.updateMapItems(slot9, slot2.stamps or {}, math.ceil((time.getTime() - slot6) / 86400))

		uv9 = "getTime"

		performWithDelay(slot9, function ()
			uv0 = "triggerGuide"
			slot0 = slot0.triggerGuide

			slot0(slot0)

			uv0 = "triggerGuide"
			uv2 = "showAchievement"

			slot0:showAchievement(slot2)
		end, 0)
	end)
end

function slot8.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyEndtime = gGameModel.role:read("yy_endtime")
end

function slot8.initGameTime(slot0, slot1)
	uv4 = "unSchedule"

	slot0:unSchedule(slot4)

	slot2 = 0

	if slot0.yyEndtime[slot0.yyID] then
		slot2 = slot0.yyEndtime[slot0.yyID] - time.getTime()
	end

	uv8 = "unSchedule"

	slot0:schedule(function ()
		uv0 = "time"
		uv0 = 1
		uv0 = "text"
		slot0 = (slot0 - 1).time
		slot1 = slot0
		uv3 = "time"
		slot2 = time.getCutDown(slot3, true).str

		slot0.text(slot1, slot2)

		slot0 = adapt.oneLinePos
		uv1 = "text"
		uv2 = "text"

		slot0(slot1.time, slot2.timeText, cc.p(5, 0), "right")

		uv0 = "time"

		if slot0 <= 0 then
			uv0 = "text"
			slot0 = slot0.time
			slot1 = slot0
			slot2 = gLanguageCsv.activityOver

			slot0.text(slot1, slot2)

			slot0 = adapt.oneLinePos
			uv1 = "text"
			uv2 = "text"
			slot2 = slot2.timeText

			slot0(slot1.time, slot2, cc.p(5, 0), "right")

			uv0 = "text"
			uv2 = "getCutDown"

			slot0:unSchedule(slot2)

			return false
		end
	end, 1, 0, slot8)
end

function slot8.initMap(slot0, slot1)
	slot0.baseID = slot1.paramMap.base
	slot0.baseCsv = csv.summer_challenge.base[slot0.baseID]
	slot3 = {
		[slot8.floor] = {
			gateCfg = slot8,
			id = slot7
		}
	}

	for slot7, slot8 in orderCsvPairs(csv.summer_challenge.gates) do
		if slot8.gateSeq == slot0.baseCsv.gateSeqID then
			-- Nothing
		end
	end

	if slot0.baseCsv.background ~= "" then
		slot0.imgBg:texture(slot0.baseCsv.background)
	end

	slot0.mapItems = {}
	uv5 = "baseID"

	for slot7 = 1, slot5 do
		slot9 = slot0.mapPanel:get("item" .. slot7):get("name")

		if not slot3[slot7] then
			slot8:hide()
		else
			slot11 = slot3[slot7].id

			if slot3[slot7].gateCfg.gateIcon ~= "" then
				slot8:get("icon"):texture(slot12)
			end

			if slot10.iconPos.x ~= 0 or slot13.y ~= 0 then
				slot8:setPosition(slot10.iconPos)
			end

			bind.touch(slot0, slot8, {
				methods = {
					ended = functools.partial(slot0.onClickItem, slot0, slot7)
				}
			})
			text.addEffect(slot9, {
				outline = {
					color = ui.COLORS.NORMAL.DEFAULT
				}
			})

			slot0.mapItems[slot7] = {
				gateID = slot11,
				floor = slot7,
				item = slot8,
				gateCfg = slot10
			}
		end
	end
end

function slot8.onClickItem(slot0, slot1)
	uv3 = "mapItems"

	if slot0.mapItems[slot1].state == slot3.LOCK then
		gGameUI:showTip(gLanguageCsv.gateLock)
	else
		uv3 = "mapItems"

		if slot2 == slot3.CANT_CHALLENGE then
			gGameUI:showTip(gLanguageCsv.gateClosed)
		else
			slot0:onGateDetail(slot1)
		end
	end
end

function slot8.onGateDetail(slot0, slot1)
	slot0.selectIndex = slot1
	slot0.gateDetailView = gGameUI:stackUI("city.activity.summer_challenge.gate_detail", nil, , {
		yyID = slot0.yyID,
		data = slot0.mapItems[slot1],
		handler = slot0:createHandler("startFighting")
	})
end

function slot8.updateMapItems(slot0, slot1, slot2)
	slot3 = slot0.baseCsv.iconFog

	if slot0.baseCsv.spine ~= "" and slot0.maxPassedFloor and slot0.maxPassedFloor ~= slot0:getMaxPassedFloor(slot1) then
		slot6 = slot0
		uv6 = "baseCsv"

		if slot0.getMaxPassedFloor(slot6, slot1) < slot6 then
			slot0:unlockAnimation(slot0.mapPanel:get(string.format("item%s", slot0:getMaxPassedFloor(slot1) + 1)), slot4)
		end
	end

	slot0.maxPassedFloor = slot0:getMaxPassedFloor(slot1)

	for slot8, slot9 in ipairs(slot0.mapItems) do
		slot11 = slot9.floor
		slot12 = slot9.item
		slot14 = slot9.gateCfg.openDay <= slot2

		if slot1[slot9.gateID] == 1 then
			userDefault.setForeverLocalKey(string.format("annualChallengeEmbattle%d", slot10), nil)
		end

		slot16 = slot0.maxPassedFloor + 1 == slot11

		if slot14 then
			slot12:get("name"):text(string.format("%s%s %s", gLanguageCsv.gate, slot11, slot13.name))
		elseif slot13.openDay - slot2 == 1 then
			slot17:text(gLanguageCsv.openTomorrow)
		else
			slot17:text(string.format(gLanguageCsv.openDays, slot18))
		end

		if matchLanguage({
			"kr"
		}) then
			adapt.setTextAdaptWithSize(slot17, {
				margin = -5,
				vertical = "center",
				maxLine = 2,
				horizontal = "center",
				size = cc.size(320, 58)
			})
		end

		slot19 = slot0
		slot18 = slot0.getGateState(slot19, slot14, slot15, slot16)
		slot9.state = slot18
		uv19 = "iconFog"

		slot19[slot18](slot12, slot3, slot4)
	end
end

function slot8.triggerGuide(slot0)
	uv2 = "maxPassedFloor"

	if slot0.maxPassedFloor + 1 <= slot2 and slot0.mapItems[slot1].gateCfg.beforePlot then
		if not gGameUI.guideManagerLocal.guideCsv[slot0.mapItems[slot1].gateCfg.beforePlot].specialName then
			return false
		end

		slot5 = slot3.stage

		if slot0.mapItems[slot1].gateCfg.beforePlotRepeat then
			gGameUI.guideManagerLocal:onDeleteStage(slot5)
		end

		if not gGameUI.guideManagerLocal:checkFinished(slot5) then
			if slot0.gateDetailView and gGameUI:findStackUI("city.activity.summer_challenge.gate_detail") then
				slot0.gateDetailView:onClose()

				slot0.gateDetailView = nil
			end

			gGameUI.guideManagerLocal:setChoicesFunc(functools.partial(slot0.onChoose, slot0))
			gGameUI.guideManagerLocal:checkGuide({
				specialName = slot4
			})

			return true
		end
	end

	return false
end

function slot8.unlockAnimation(slot0, slot1, slot2)
	if not slot1 or slot2 == "" then
		return
	end

	slot3 = slot1:get("icon")
	slot4 = slot3:getContentSize()

	slot1:get("fogEffect"):hide()

	slot5 = widget.addAnimationByKey(slot1, slot2, "unlockEffect", "unlock", 6):xy(slot4.width / 2, slot4.height / 2)

	slot3:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.CallFunc:create(function ()
		uv0 = "getPosition"
		slot0, slot1 = slot0:getPosition()
		slot2 = "jiesuohou"
		uv3 = "getPosition"
		slot4 = slot3
		uv4 = "getPosition"
		slot5 = slot4
		uv5 = "getPosition"
		slot6 = slot5
		slot5 = slot5.getBonePosition(slot6, slot2)
		uv6 = "getPosition"
		slot7 = slot6
		uv7 = "getPosition"
		slot8 = slot7
		uv8 = "getPosition"
		slot9 = slot8
		uv9 = "jiesuohou"

		slot9:rotate(slot6.getBoneRotation(slot7, slot2)):scaleX(slot7.getBoneScaleX(slot8, slot2)):scaleY(slot8.getBoneScaleY(slot9, slot2)):xy(slot5.x * slot3.getScaleX(slot4) + slot0, slot5.y * slot4.getScaleY(slot5) + slot1)
	end))))
end

function slot8.showAchievement(slot0, slot1)
	if slot1 == 1 then
		if not (userDefault.getForeverLocalKey("annualChallenglePassData", false) and slot2[slot0.yyID]) then
			userDefault.setForeverLocalKey("annualChallenglePassData", {
				[slot0.yyID] = true
			})
			gGameUI:stackUI("city.activity.summer_challenge.gain_achievement", nil, , slot0.baseID)
		end
	else
		userDefault.setForeverLocalKey("annualChallenglePassData", {
			[slot0.yyID] = false
		})
	end
end

function slot8.getGateState(slot0, slot1, slot2, slot3)
	uv4 = "LOCK"
	slot4 = slot4.LOCK

	if slot1 then
		if slot2 then
			uv5 = "LOCK"
			slot4 = slot5.PASSED
		elseif not slot3 then
			uv5 = "LOCK"
			slot4 = slot5.CANT_CHALLENGE
		else
			uv5 = "LOCK"
			slot4 = slot5.CAN_CHALLENGE
		end
	end

	return slot4
end

function slot8.getMaxPassedFloor(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		slot2 = math.max(csv.summer_challenge.gates[slot6].floor, 0)
	end

	return slot2
end

function slot8.onShowRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot8.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot3 = "text"
			uv3 = "get"

			slot0:get(slot3):text(slot3.baseCsv.name)
		end),
		slot2.noteText(127500, 127599)
	}
end

function slot8.startFighting(slot0, slot1, slot2, slot3)
	if slot0.endTime < time.getTime() then
		gGameUI:showTip(gLanguageCsv.activityOver)

		return
	end

	slot0:disableSchedule()
	gGameUI.guideManagerLocal:setChoicesFunc()
	battleEntrance.battleRequest("/game/yy/summer_challenge/battle/start", slot0.yyID, slot0.mapItems[slot0.selectIndex].gateID, slot3):onStartOK(function (slot0)
		uv1 = "onClose"

		if slot1 then
			uv1 = "onClose"

			slot1:onClose(false)

			uv0 = nil
		end

		uv1 = "gateDetailView"

		if slot1 then
			uv1 = "gateDetailView"

			slot1:onClose(false)

			uv1 = nil
		end

		uv1 = "onClose"
		slot1.gateDetailView = nil
	end):onResult(function (slot0, slot1)
		if slot1.result == "win" then
			uv2 = "result"
			slot2.selectIndex = nil
		end
	end):show()
end

function slot8.initcloudAction(slot0)
	slot2 = 0

	if display.sizeInView.width > 2560 then
		slot2 = (cc.clampf(slot1, 2560, 3120) - 2560) / 2
	end

	slot4 = 3

	for slot8 = 1, 3 do
		slot9 = slot0.leftCloud:get(string.format("imgLeftCloud%s", slot8))

		if slot2 ~= 0 then
			slot9:setPositionX(slot9:getPositionX() - slot2)
		end

		slot9:stopAllActions()
		slot9:runAction(cc.RepeatForever:create(transition.sequence({
			cc.EaseSineOut:create(cc.MoveBy:create(slot8 + 7, cc.p(280, 0))),
			cc.EaseSineIn:create(cc.MoveBy:create(slot8 + 7, cc.p(-280, 0)))
		})))
	end

	for slot8 = 1, slot4 do
		slot9 = slot0.rightCloud:get(string.format("imgRightCloud%s", slot8))

		if slot2 ~= 0 then
			slot9:setPositionX(slot9:getPositionX() + slot2)
		end

		slot9:stopAllActions()
		slot9:runAction(cc.RepeatForever:create(transition.sequence({
			cc.EaseSineOut:create(cc.MoveBy:create(slot8 + 7, cc.p(-280, 0))),
			cc.EaseSineIn:create(cc.MoveBy:create(slot8 + 7, cc.p(280, 0)))
		})))
	end
end

function slot8.onChoose(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/summer_challenge/choose", nil, slot0.yyID, slot2.id)
end

function slot8.onClose(slot0)
	slot1 = gGameUI.guideManagerLocal
	slot1 = slot1.setChoicesFunc

	slot1(slot1)

	uv1 = "gGameUI"

	slot1.onClose(slot0)
end

return slot8
