slot0 = nil

if device.platform == "windows" then
	slot0 = dev.DEBUG_SHOW
end

slot1 = 10
slot2 = {
	{
		cc.p(0, 954),
		cc.p(106, 880),
		cc.p(322, 1096),
		cc.p(502, 1064),
		cc.p(687, 930),
		cc.p(1120, 1136),
		cc.p(1362, 978),
		cc.p(1210, 890),
		cc.p(1330, 765),
		cc.p(1269, 714),
		cc.p(1005, 669),
		cc.p(594, 472),
		cc.p(719, 405),
		cc.p(397, 176),
		cc.p(658, 0),
		cc.p(0, 0)
	},
	{
		cc.p(0, 1440),
		cc.p(0, 954),
		cc.p(106, 880),
		cc.p(322, 1096),
		cc.p(502, 1064),
		cc.p(687, 930),
		cc.p(1120, 1136),
		cc.p(1280, 1250),
		cc.p(981, 1440)
	},
	{
		cc.p(981, 1440),
		cc.p(1280, 1250),
		cc.p(1120, 1136),
		cc.p(1362, 978),
		cc.p(1472, 1109),
		cc.p(1597, 1293),
		cc.p(1773, 1122),
		cc.p(2138, 1296),
		cc.p(2168, 1274),
		cc.p(2464, 1440)
	},
	{
		cc.p(3120, 1440),
		cc.p(2464, 1440),
		cc.p(2168, 1274),
		cc.p(2138, 1296),
		cc.p(1773, 1122),
		cc.p(1973, 1013),
		cc.p(2029, 1064),
		cc.p(2146, 1069),
		cc.p(2176, 928),
		cc.p(2389, 786),
		cc.p(2842, 968),
		cc.p(3120, 792)
	},
	{
		cc.p(3120, 0),
		cc.p(3120, 792),
		cc.p(2842, 968),
		cc.p(2389, 786),
		cc.p(2088, 621),
		cc.p(2200, 658),
		cc.p(2349, 594),
		cc.p(2434, 319),
		cc.p(2501, 279),
		cc.p(2488, 122),
		cc.p(2706, 0)
	},
	{
		cc.p(2706, 0),
		cc.p(2488, 122),
		cc.p(2501, 279),
		cc.p(2434, 319),
		cc.p(2349, 594),
		cc.p(2200, 658),
		cc.p(2088, 621),
		cc.p(2101, 528),
		cc.p(1933, 450),
		cc.p(1885, 410),
		cc.p(1904, 261),
		cc.p(2042, 165),
		cc.p(2040, 96),
		cc.p(1896, 0)
	},
	{
		cc.p(1896, 0),
		cc.p(2040, 96),
		cc.p(2042, 165),
		cc.p(1904, 261),
		cc.p(1885, 410),
		cc.p(1933, 450),
		cc.p(1762, 541),
		cc.p(1621, 594),
		cc.p(1528, 632),
		cc.p(1330, 765),
		cc.p(1269, 714),
		cc.p(1005, 669),
		cc.p(1093, 490),
		cc.p(1213, 394),
		cc.p(1253, 272),
		cc.p(1168, 162),
		cc.p(1200, 77),
		cc.p(1354, 0)
	},
	{
		cc.p(1354, 0),
		cc.p(1200, 77),
		cc.p(1168, 162),
		cc.p(1253, 272),
		cc.p(1213, 394),
		cc.p(1093, 490),
		cc.p(1005, 669),
		cc.p(594, 472),
		cc.p(719, 405),
		cc.p(397, 176),
		cc.p(658, 0)
	},
	{
		cc.p(1973, 1013),
		cc.p(2029, 1064),
		cc.p(2146, 1069),
		cc.p(2176, 928),
		cc.p(2389, 786),
		cc.p(2088, 621),
		cc.p(2101, 528),
		cc.p(1933, 450),
		cc.p(1762, 541),
		cc.p(1621, 594),
		cc.p(1578, 762),
		cc.p(1957, 896)
	},
	{
		cc.p(1957, 896),
		cc.p(1578, 762),
		cc.p(1621, 594),
		cc.p(1528, 632),
		cc.p(1330, 765),
		cc.p(1210, 890),
		cc.p(1362, 978),
		cc.p(1472, 1109),
		cc.p(1597, 1293),
		cc.p(1773, 1122),
		cc.p(1973, 1013)
	}
}
slot3 = {
	LOCK = 1,
	CANT_CHALLENGE = 2,
	CAN_CHALLENGE = 3,
	PASSED = 4
}

function slot4(slot0)
	slot0:hide()
	slot0:stopAllActions()
end

function slot5(slot0)
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

slot6 = {
	[slot3.LOCK] = function ()
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
	[slot3.CANT_CHALLENGE] = function ()
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
	[slot3.CAN_CHALLENGE] = function (slot0, slot1)
		slot0:show()
		slot0:opacity(255)
		slot0:texture("activity/summer_challenge/txt_xrtz_tzz.png")
		slot1:show()
		slot1:stopAllActions()
		slot0:stopAllActions()
		slot1:runAction(cc.RepeatForever:create(transition.sequence({
			cc.FadeTo:create(0.6, 70),
			cc.FadeTo:create(0.6, 255),
			cc.DelayTime:create(1.2)
		})))
		slot0:runAction(cc.RepeatForever:create(transition.sequence({
			cc.FadeTo:create(0.6, 100),
			cc.FadeTo:create(0.6, 255),
			cc.DelayTime:create(1.2)
		})))
	end,
	[slot3.PASSED] = function (slot0, slot1)
		slot0:show()
		slot0:texture("activity/summer_challenge/txt_xrtz_tzcg.png")
		slot0:opacity(255)

		slot2 = slot0.stopAllActions

		slot2(slot0)

		uv2 = "show"

		slot2(slot1)
	end
}
slot7 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	}
}
slot9 = class("SummerChallengleView", cc.load("mvc").ViewBase)
slot9.RESOURCE_FILENAME = "summer_challenge.json"
slot9.RESOURCE_BINDING = {
	["lightPanel.light1"] = "light1",
	["lightPanel.light2"] = "light2",
	["lightPanel.light3"] = "light3",
	leftPanel = "leftPanel",
	mapPanel = "mapPanel",
	rightTimePanel = "rightTimePanel",
	["leftPanel.btnRule"] = {
		varname = "btnRule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowRule")
			}
		}
	},
	["leftPanel.btnRule.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["rightTimePanel.time"] = {
		varname = "time",
		binds = slot7
	},
	["rightTimePanel.timeText"] = {
		varname = "timeText",
		binds = slot7
	}
}

function slot9.onCreate(slot0, slot1)
	slot0.yyID = slot1

	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "SUMMER ADVENTURE",
		title = gLanguageCsv.summerChallenge
	})

	slot2 = csv.yunying.yyhuodong[slot1]
	slot3 = time.getNumTimestamp(slot2.beginDate, time.getHourAndMin(slot2.beginTime, true))
	slot0.endTime = time.getNumTimestamp(slot2.endDate, time.getHourAndMin(slot2.endTime, true))

	slot0:initModel()
	slot0:initGameTime(slot2)
	slot0:initMap(slot2)
	slot0:initLightAction()

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

function slot9.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot9.initGameTime(slot0, slot1)
	slot2, slot3, slot4 = time.getYearMonthDay(slot1.beginDate)
	slot5, slot6, slot7 = time.getYearMonthDay(slot1.endDate)

	if matchLanguage({
		"en"
	}) then
		uv8 = "time"
		slot8 = slot8(slot3)
		slot3 = slot8
		uv8 = "time"
		slot6 = slot8(slot6)
	end

	slot0.time:text(slot2 .. "." .. slot3 .. "." .. slot4 .. "-" .. slot5 .. "." .. slot6 .. "." .. slot7)
	adapt.oneLinePos(slot0.time, slot0.timeText, cc.p(5, 0), "right")
end

function slot9.initMap(slot0, slot1)
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

	slot0.mapItems = {}
	uv5 = "baseID"

	for slot7 = 1, slot5 do
		slot10 = slot0.mapPanel:get("item" .. slot7):get("infoPanel"):multiget("title")
		slot11 = slot3[slot7].gateCfg
		slot12 = slot3[slot7].id

		if matchLanguage({
			"en"
		}) then
			slot9:get("state"):y(250)
		end

		text.addEffect(slot10.title, {
			outline = {
				color = ui.COLORS.NORMAL.DEFAULT
			}
		})

		slot0.mapItems[slot7] = {
			gateID = slot12,
			floor = slot7,
			item = slot8,
			gateCfg = slot11
		}
	end

	slot0.mapPanel:onTouch(functools.partial(slot0.onClickItem, slot0))
end

function slot9.initLightAction(slot0)
	slot0.light1:setBlendFunc({
		src = GL_SRC_ALPHA,
		dst = GL_ONE
	})
	slot0.light2:setBlendFunc({
		src = GL_SRC_ALPHA,
		dst = GL_ONE
	})
	slot0.light3:setBlendFunc({
		src = GL_SRC_ALPHA,
		dst = GL_ONE
	})
	slot0.light1:opacity(255)
	slot0.light2:opacity(255)
	slot0.light3:setRotation(10)
	slot0.light1:runAction(cc.RepeatForever:create(transition.sequence({
		cc.FadeTo:create(1, 50),
		cc.FadeTo:create(1, 255)
	})))
	slot0.light2:runAction(cc.RepeatForever:create(transition.sequence({
		cc.FadeTo:create(0.5, 50),
		cc.FadeTo:create(0.5, 255)
	})))
	slot0.light3:runAction(cc.RepeatForever:create(transition.sequence({
		cc.RotateTo:create(3, -10),
		cc.RotateTo:create(3, 10)
	})))
end

function slot9.onClickItem(slot0, slot1)
	if slot1.name == "began" then
		uv4 = "target"
		slot0.touchIndex = dataEasy.checkInRect(slot4, slot1.target:convertToNodeSpace(slot1))
	elseif slot1.name == "ended" or slot1.name == "cancelled" then
		if slot0.touchIndex == nil then
			return
		end

		uv5 = "target"

		if slot0.touchIndex == dataEasy.checkInRect(slot5, slot2) then
			uv3 = "convertToNodeSpace"

			if slot3 then
				slot0:onTestDraw(slot0.touchIndex)
			end

			slot4 = slot0.touchIndex
			uv4 = "name"

			if slot0.mapItems[slot4].state == slot4.LOCK then
				gGameUI:showTip(gLanguageCsv.gateLock)
			else
				uv4 = "name"

				if slot3 == slot4.CANT_CHALLENGE then
					gGameUI:showTip(gLanguageCsv.gateClosed)
				else
					slot0:onGateDetail(slot0.touchIndex)
				end
			end
		end
	end
end

function slot9.onGateDetail(slot0, slot1)
	slot0.selectIndex = slot1
	slot0.gateDetailView = gGameUI:stackUI("city.activity.summer_challenge.gate_detail", nil, , {
		yyID = slot0.yyID,
		data = slot0.mapItems[slot1],
		handler = slot0:createHandler("startFighting")
	})
end

function slot9.updateMapItems(slot0, slot1, slot2)
	slot0.maxPassedFloor = slot0:getMaxPassedFloor(slot1)

	for slot6, slot7 in ipairs(slot0.mapItems) do
		slot9 = slot7.floor
		slot10 = slot7.item
		slot12 = slot7.gateCfg.openDay <= slot2

		if slot1[slot7.gateID] == 1 then
			userDefault.setForeverLocalKey(string.format("summerChallengeEmbattle%d", slot8), nil)
		end

		slot14 = slot0.maxPassedFloor + 1 == slot9
		slot15 = slot10:get("infoPanel.state")
		slot17 = slot10:get("light")

		slot10:get("mask"):visible(not slot12)
		slot10:get("bg"):visible(slot12)

		if slot12 then
			slot10:get("infoPanel.title"):text(string.format("%s%s %s", gLanguageCsv.gate, slot9, slot11.name))
		elseif slot11.openDay - slot2 == 1 then
			slot16:text(gLanguageCsv.openTomorrow)
		else
			slot16:text(string.format(gLanguageCsv.openDays, slot18))
		end

		if matchLanguage({
			"kr"
		}) then
			adapt.setTextAdaptWithSize(slot16, {
				margin = -5,
				vertical = "center",
				maxLine = 2,
				horizontal = "center",
				size = cc.size(320, 58)
			})
		end

		slot19 = slot0
		slot18 = slot0.getGateState(slot19, slot12, slot13, slot14)
		slot7.state = slot18
		uv19 = "maxPassedFloor"

		slot19[slot18](slot15, slot17)
	end
end

function slot9.triggerGuide(slot0)
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

function slot9.showAchievement(slot0, slot1)
	if slot1 == 1 then
		if not userDefault.getForeverLocalKey("SummerChallenglePass", false) then
			userDefault.setForeverLocalKey("SummerChallenglePass", true)
			gGameUI:stackUI("city.activity.summer_challenge.gain_achievement", nil, , slot0.baseID)
		end
	else
		userDefault.setForeverLocalKey("SummerChallenglePass", false)
	end
end

function slot9.getGateState(slot0, slot1, slot2, slot3)
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

function slot9.getMaxPassedFloor(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		slot2 = math.max(csv.summer_challenge.gates[slot6].floor, 0)
	end

	return slot2
end

function slot9.onShowRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot9.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.summerChallenge)
		end),
		slot2.noteText(125001, 125020)
	}
end

function slot9.startFighting(slot0, slot1, slot2, slot3)
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

function slot9.onChoose(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/summer_challenge/choose", nil, slot0.yyID, slot2.id)
end

function slot9.onClose(slot0)
	slot1 = gGameUI.guideManagerLocal
	slot1 = slot1.setChoicesFunc

	slot1(slot1)

	uv1 = "gGameUI"

	slot1.onClose(slot0)
end

function slot9.onTestDraw(slot0, slot1)
	if not slot0.drawNode then
		slot0.drawNode = cc.DrawNode:create()

		slot0.drawNode:xy(0, 0):addTo(slot0.mapPanel, 13)
	end

	slot0.drawNode:clear()

	uv4 = "drawNode"
	uv6 = "drawNode"

	slot0.drawNode:drawPolygon(slot4[slot1], table.length(slot6[slot1]), cc.c4f(0.9450980392156862, 0.3607843137254902, 0.3843137254901961, 0.6), 0.5, cc.c4f(0.9450980392156862, 0.3607843137254902, 0.3843137254901961, 0.6))
end

return slot9
