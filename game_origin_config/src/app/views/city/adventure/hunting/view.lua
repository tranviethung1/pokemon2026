slot0 = {
	elite = 2,
	normal = 1
}
slot1 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	}
}
slot2 = {
	event = "effect",
	data = {
		outline = {
			size = 6,
			color = cc.c4b(255, 84, 0, 255)
		}
	}
}
slot3 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(255, 252, 237, 255)
		}
	}
}
slot5 = class("HuntingView", cc.load("mvc").ViewBase)
slot5.RESOURCE_FILENAME = "hunting.json"
slot5.RESOURCE_BINDING = {
	["centerPanel.normalPanel"] = "normalPanel",
	leftBottomPanel = "leftBottomPanel",
	["centerPanel.elitePanel.btnElite.lock"] = "eliteLock",
	centerPanel = "centerPanel",
	bg = "bg",
	["centerPanel.elitePanel"] = "elitePanel",
	tip = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(208, 232, 152, 255)
				}
			}
		}
	},
	["centerPanel.normalPanel.btnNormal"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onNormalRouteClick")
			}
		}
	},
	["centerPanel.normalPanel.btnNormal.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["centerPanel.normalPanel.playing.txt1"] = {
		binds = slot2
	},
	["centerPanel.normalPanel.playing.txt2"] = {
		binds = slot2
	},
	["centerPanel.elitePanel.btnElite"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEliteRouteClick")
			}
		}
	},
	["centerPanel.elitePanel.btnElite.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["centerPanel.elitePanel.playing.txt1"] = {
		binds = slot2
	},
	["centerPanel.elitePanel.playing.txt2"] = {
		binds = slot2
	},
	["leftBottomPanel.shopBtn.name"] = {
		binds = slot3
	},
	["leftBottomPanel.ruleBtn.name"] = {
		binds = slot3
	},
	["leftBottomPanel.ruleBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["leftBottomPanel.shopBtn"] = {
		varname = "shopBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnShop")
			}
		}
	}
}

function slot5.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("hunting", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "HUNTINGAREA",
		title = gLanguageCsv.huntingArea
	})
	slot0:initModel()

	slot2 = csv.cross.hunting.base
	slot0.specialHuntingSign = dataEasy.isUnlock(gUnlockCsv.specialHunting)

	idlereasy.any({
		slot0.normalTimes,
		slot0.eliteTimes,
		slot0.routeInfo
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "initPanel"
		slot5 = slot4

		slot4.initPanel(slot5)

		uv5 = "initPanel"
		uv7 = "initPanel"
		slot7 = slot7.routeInfo
		slot8 = slot7
		uv8 = "time"
		slot7 = slot7.read(slot8)[slot8.normal].last_date
		slot8 = time.getRefreshHour()
		uv7 = "getRefreshHour"
		uv8 = "time"
		slot5.endTime1 = time.getNumTimestamp(slot7, slot8, 0, 0) + 86400 * slot7[slot8.normal].refreshDay
		uv5 = "initPanel"

		if slot5.specialHuntingSign then
			uv5 = "initPanel"
			uv7 = "initPanel"
			slot7 = slot7.routeInfo
			slot8 = slot7
			uv8 = "time"
			slot7 = slot7.read(slot8)[slot8.elite].last_date
			slot8 = slot4
			uv7 = "getRefreshHour"
			uv8 = "time"
			slot5.endTime2 = time.getNumTimestamp(slot7, slot8, 0, 0) + 86400 * slot7[slot8.elite].refreshDay
		end
	end)
	slot0:initCountDown1()

	if slot0.specialHuntingSign then
		slot0:initCountDown2()
	end

	performWithDelay(slot0, function ()
		if gGameUI.guideManager:isInGuiding() then
			uv0 = "gGameUI"

			if slot0.normalTimes:read() == 0 then
				uv0 = "gGameUI"
				slot0 = slot0.routeInfo
				slot1 = slot0
				uv1 = "guideManager"

				if slot0.read(slot1)[slot1.normal].status == "closed" then
					gGameUI.guideManager:forceClose(nil, "city.adventure.hunting.view")
				end
			end
		end
	end, 0)
end

function slot5.initModel(slot0)
	slot0.normalTimes = gGameModel.hunting:getIdler("battle_times")
	slot0.eliteTimes = gGameModel.hunting:getIdler("special_battle_times")
	slot0.routeInfo = gGameModel.hunting:getIdler("hunting_route")

	slot0.eliteLock:visible(not dataEasy.isUnlock(gUnlockCsv.specialHunting))
end

function slot5.initPanel(slot0)
	slot1 = csv.cross.hunting.base
	slot4 = slot0.routeInfo
	slot5 = slot4
	uv5 = "csv"

	slot0.normalPanel:get("playing"):visible(slot4.read(slot5)[slot5.normal].status == "starting")

	slot6 = slot0.normalTimes
	slot7 = slot6
	uv7 = "csv"

	slot0.normalPanel:get("times"):hide()
	slot0.normalPanel:removeChildByName("richText")

	slot4 = rich.createByStr(string.format(gLanguageCsv.huntingTimes, slot0.normalTimes:read() == 0 and "#C0xFC8628#" or "#C0x52D661#", slot6.read(slot7), slot1[slot7.normal].battleLimit), 56, nil):xy(210, slot0.normalPanel:get("times"):y()):anchorPoint(0, 0.5):addTo(slot0.normalPanel, 100, "richText"):formatText()
	slot7 = slot0.routeInfo
	slot8 = slot7
	uv8 = "csv"

	slot0.elitePanel:get("playing"):visible(slot7.read(slot8)[slot8.elite].status == "starting")

	slot9 = slot0.eliteTimes
	slot10 = slot9
	uv10 = "csv"

	if slot0.specialHuntingSign then
		slot0.elitePanel:get("times"):hide()
		slot0.elitePanel:removeChildByName("richText")

		slot7 = rich.createByStr(string.format(gLanguageCsv.huntingTimes, slot0.eliteTimes:read() == 0 and "#C0xFC8628#" or "#C0x52D661#", slot9.read(slot10), slot1[slot10.elite].battleLimit), 56, nil):xy(210, slot0.elitePanel:get("times"):y()):anchorPoint(0, 0.5):addTo(slot0.elitePanel, 100, "richText"):formatText()
	elseif gUnlockCsv.specialHunting and csv.unlock[gUnlockCsv.specialHunting] then
		slot0.elitePanel:get("times"):text(string.format(gLanguageCsv.huntingLimitTip, csv.unlock[gUnlockCsv.specialHunting].startLevel))

		slot8, slot9 = slot0.elitePanel:get("times"):xy()

		slot0.elitePanel:get("times"):xy(slot8, slot9 - 20)
	else
		slot0.elitePanel:get("times"):hide()
	end
end

function slot5.onNormalRouteClick(slot0)
	slot1 = slot0.routeInfo
	slot2 = slot1
	uv2 = "routeInfo"

	if slot1.read(slot2)[slot2.normal].status == "starting" then
		uv3 = "routeInfo"

		slot0:startRoute(slot3.normal)
	elseif slot0.normalTimes:read() <= 0 then
		gGameUI:showTip(gLanguageCsv.huntingGameTimesNotEnough)

		return
	else
		uv3 = "routeInfo"

		slot0:startRoute(slot3.normal)
	end
end

function slot5.onEliteRouteClick(slot0)
	if not slot0.specialHuntingSign then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.specialHunting))

		return
	else
		slot1 = slot0.routeInfo
		slot2 = slot1
		uv2 = "specialHuntingSign"

		if slot1.read(slot2)[slot2.elite].status == "starting" then
			uv3 = "specialHuntingSign"

			slot0:startRoute(slot3.elite)
		elseif slot0.eliteTimes:read() <= 0 then
			gGameUI:showTip(gLanguageCsv.huntingGameTimesNotEnough)

			return
		else
			uv3 = "specialHuntingSign"

			slot0:startRoute(slot3.elite)
		end
	end
end

function slot5.startRoute(slot0, slot1)
	if slot0.routeInfo:read()[slot1].status == "closed" then
		gGameApp:requestServer("/game/hunting/route/begin", function (slot0)
			uv6 = "gGameUI"

			gGameUI:stackUI("city.adventure.hunting.route", nil, , slot6)
		end, slot1)
	else
		gGameUI:stackUI("city.adventure.hunting.route", nil, , slot1)
	end
end

function slot5.onBtnShop(slot0)
	uiEasy.goToShop(game.SHOP_INIT.HUNTING_SHOP)
end

function slot5.onEquipClick(slot0)
end

function slot5.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot5.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(124301, 124310)
	}
end

function slot5.initCountDown1(slot0)
	uv2 = "csv"
	slot1 = csv.cross.hunting.base[slot2.normal].battleLimit

	function slot2()
		uv0 = "normalPanel"
		slot0 = slot0.normalPanel
		slot0 = slot0.removeChildByName

		slot0(slot0, "richTextTime")

		uv0 = "normalPanel"
		slot0 = slot0.normalTimes
		slot1 = slot0
		uv1 = "removeChildByName"

		if slot1 <= slot0.read(slot1) then
			return true
		end

		uv3 = "normalPanel"
		slot3 = 0.5
		uv3 = "normalPanel"
		slot1 = rich.createByStr(string.format(gLanguageCsv.huntingReplyGameTimes, time.getCutDown(slot3.endTime1 - time.getTime()).str), 40, nil):xy(330, 45):anchorPoint(slot3, 0.5):addTo(slot3.normalPanel, 100, "richTextTime")
		slot2 = slot1
		slot1 = slot1.formatText(slot2)
		uv2 = "normalPanel"

		if slot2.endTime1 - time.getTime() <= 0 then
			gGameApp:requestServer("/game/hunting/main", function (slot0)
			end)
		end

		return true
	end

	slot0:enableSchedule()
	slot0:schedule(function ()
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
	end, 1, 0, 1)
end

function slot5.initCountDown2(slot0)
	uv2 = "csv"
	slot1 = csv.cross.hunting.base[slot2.elite].battleLimit

	function slot2()
		uv0 = "elitePanel"
		slot0 = slot0.elitePanel
		slot0 = slot0.removeChildByName

		slot0(slot0, "richTextTime")

		uv0 = "elitePanel"
		slot0 = slot0.eliteTimes
		slot1 = slot0
		uv1 = "removeChildByName"

		if slot1 <= slot0.read(slot1) then
			return true
		end

		uv3 = "elitePanel"
		slot3 = 0.5
		uv3 = "elitePanel"
		slot1 = rich.createByStr(string.format(gLanguageCsv.huntingReplyGameTimes, time.getCutDown(slot3.endTime2 - time.getTime()).str), 40, nil):xy(330, 45):anchorPoint(slot3, 0.5):addTo(slot3.elitePanel, 100, "richTextTime")
		slot2 = slot1
		slot1 = slot1.formatText(slot2)
		uv2 = "elitePanel"

		if slot2.endTime2 - time.getTime() <= 0 then
			gGameApp:requestServer("/game/hunting/main", function (slot0)
			end)
		end

		return true
	end

	slot0:enableSchedule()
	slot0:schedule(function ()
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
	end, 1, 0, 2)
end

return slot5
