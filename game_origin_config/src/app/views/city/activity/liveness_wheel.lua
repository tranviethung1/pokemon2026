slot1 = {
	free = "liveness_wheel_free1",
	five = "liveness_wheel5",
	once = "liveness_wheel1"
}
slot2 = 1
slot4 = {
	count = 1,
	wheel = 2
}
slot5 = {
	dt = 0.1,
	stage2Time = 0.1,
	stage1Time = 0.5,
	stage3Nums = 3,
	stage3Time = 0.5,
	stage1Nums = 3,
	showTime = 0.5,
	stage2Nums = 10 * 2
}
slot6 = class("ActivityLivenessWheelView", Dialog)
slot6.RESOURCE_FILENAME = "activity_liveness_wheel.json"
slot6.RESOURCE_BINDING = {
	selected = "selectedItem",
	["taskPanel.todayGetTotal"] = "todayGetTotal",
	["taskPanel.todayGetTitle"] = "todayGetTitle",
	taskPanel = "taskPanel",
	["taskPanel.todayGetTimes"] = "todayGetTimes",
	wheelPanel = "wheelPanel",
	["btnSkip.icon"] = "skipIcon",
	taskItem = "taskItem",
	time = "wheelTime",
	["wheelPanel.lessNums"] = "lessNums",
	["btnOnceDraw.freeIcon"] = "onceFreeIcon",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnSkip = {
		binds = {
			event = "click",
			method = bindHelper.self("onSkip")
		}
	},
	["taskPanel.taskList"] = {
		varname = "taskList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("taskDatas"),
				item = bindHelper.self("taskItem"),
				margin = 34,
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("content", "curState", "totalState")

					slot4.content:text(slot3.cfg.desc)
					slot4.curState:text(slot3.progress[1])
					slot4.totalState:text("/" .. slot3.progress[2])

					if slot3.state == 1 then
						slot4.curState:hide()
						slot4.totalState:text(gLanguageCsv.treasureHuntComplete)
						slot4.totalState:setTextColor(cc.c3b(66, 167, 56))
					end

					adapt.oneLinePos(slot4.totalState, slot4.curState, cc.p(0, 0), "right")
				end
			}
		}
	},
	btnOnceDraw = {
		varname = "btnOnceDraw",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "onDraw"

					slot0:onDraw(slot3.once)
				end)
			}
		}
	},
	["btnOnceDraw.txtNode"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.BLUE
				}
			}
		}
	},
	btnFiveDraw = {
		varname = "btnFiveDraw",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "onDraw"

					slot0:onDraw(slot3.five)
				end)
			}
		}
	},
	["btnFiveDraw.txtNode"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.ORANGE
				}
			}
		}
	},
	btnRules = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRules")
			}
		}
	}
}

function slot6.onCreate(slot0, slot1)
	slot0.yyCfg = csv.yunying.yyhuodong[slot1]
	slot0.activityId = slot1

	slot0:enableSchedule()
	slot0:initModel()
	slot0:initReward()
	slot0:initData()
	slot0:initCountTime()
	slot0:initSkipAni()
	slot0:initSkel()
	slot0:setSelectedReward(1)

	if matchLanguage({
		"en"
	}) then
		slot2, slot3 = slot0.lessNums:xy()

		slot0.lessNums:xy(slot2 + 60, slot3 + 8)
	elseif matchLanguage({
		"kr"
	}) then
		slot2, slot3 = slot0.lessNums:xy()

		slot0.lessNums:x(slot2 - 15)
	end

	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot6.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyEndtime = gGameModel.role:getIdler("yy_endtime")
	slot0.skipAni = gGameModel.currlogin_dispatch:getIdlerOrigin("livenessWheelSkip")
end

function slot6.initReward(slot0)
	slot0.rewardDatas = {}

	for slot4, slot5 in csvMapPairs(slot0.yyCfg.clientParam.awards) do
		slot6, slot7 = csvNext(slot5)

		table.insert(slot0.rewardDatas, {
			key = slot6,
			num = slot7
		})
	end

	uv2 = "rewardDatas"

	for slot4 = 1, slot2 do
		if slot0.wheelPanel:get("reward" .. slot4) then
			slot6 = slot5:multiget("name", "icon", "num", "numBg", "normal")
			slot7 = slot0.rewardDatas[slot4]
			slot8, slot9 = uiEasy.setIconName(slot7.key, slot7.num, {
				node = slot6.name
			})

			slot6.name:hide()

			slot10 = beauty.singleTextLimitWord(slot6.name:text(), {
				fontSize = slot6.name:getFontSize()
			}, {
				width = 240
			}):xy(slot6.name:xy()):addTo(slot5, slot6.name:z()):color(slot9.color)
			slot11 = true
			slot12 = {
				key = slot7.key
			}

			if slot7.key == "card" then
				slot11 = false
				slot12 = slot7

				slot6.num:hide()
				slot6.numBg:hide()
			else
				slot6.num:text(slot7.num)

				if string.utf8len(slot7.num) > 2 then
					slot6.numBg:width(slot6.num:width() + 18)
				end

				slot6.num:x(slot6.numBg:x() - slot6.numBg:width() / 2 + slot6.num:width() / 2)
			end

			bind.extend(slot0, slot6.icon, {
				class = "icon_key",
				props = {
					data = slot12,
					simpleShow = slot11,
					onNode = function (slot0)
						slot0:scale(0.8)
					end
				}
			})
		end
	end
end

function slot6.initData(slot0)
	slot0.taskDatas = idlers.newWithMap({})

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		slot2 = slot1[slot2.activityId] or {}
		slot3 = slot2.info or {}
		uv6 = "activityId"
		slot7 = slot3.total_times or 0
		slot6.drawTimes = slot7
		uv6 = "activityId"
		uv7 = "info"
		slot6.freeDrawTimes = slot7 - (slot3.free_counter or 0)
		uv6 = "activityId"
		slot6 = slot6.lessNums
		slot6 = slot6.text
		uv8 = "activityId"
		slot8 = slot8.drawTimes

		slot6(slot6, slot8)

		uv6 = "activityId"
		slot6 = slot6.onceFreeIcon
		slot6 = slot6.visible
		uv8 = "activityId"

		slot6(slot6, slot8.freeDrawTimes > 0)

		uv6 = "activityId"
		slot6 = slot6.todayGetTimes
		slot6 = slot6.text
		uv10 = "free_counter"

		slot6(slot6, math.min(slot3.gain_times or 0, slot10.maxGainTimes))

		uv6 = "activityId"
		slot6 = slot6.yyCfg.huodongID

		if slot2 then
			uv10 = "activityId"
			slot9 = {}

			for slot13, slot14 in csvPairs(csv.yunying.generaltask) do
				if slot14.huodongID == slot6 then
					table.insert(slot9, {
						csvId = slot13,
						cfg = slot14,
						state = (slot2.stamps or {})[slot13],
						progress = (gGameModel.role:getYYHuoDongTasksProgress(slot10.activityId) or {})[slot13]
					})
				end
			end

			uv10 = "activityId"

			slot10.taskDatas:update(slot9)
		end
	end)
	slot0.todayGetTotal:text("/" .. slot0.yyCfg.paramMap.maxGainTimes .. ")")
	adapt.oneLineCenterPos(cc.p(slot0.taskPanel:width() / 2, slot0.todayGetTitle:y()), {
		slot0.todayGetTitle,
		slot0.todayGetTimes,
		slot0.todayGetTotal
	})
end

function slot6.initSkipAni(slot0)
	idlereasy.when(slot0.skipAni, function (slot0, slot1)
		uv3 = "activity/liveness_wheel/radio_selected.png"

		slot3.skipIcon:texture(slot1 and "activity/liveness_wheel/radio_selected.png" or "activity/liveness_wheel/radio_normal.png")
	end)
end

function slot6.initCountTime(slot0)
	uv2 = "activityId"
	slot2 = slot2.count

	slot0:unSchedule(slot2)
	bind.extend(slot0, slot0.wheelTime, {
		class = "cutdown_label",
		props = {
			tag = slot2,
			endTime = slot0.yyEndtime:read()[slot0.activityId],
			endFunc = function ()
				uv0 = "onClose"

				slot0:onClose()
			end
		}
	})

	if matchLanguage({
		"en"
	}) then
		slot0.wheelTime:x(1888)
	end
end

function slot6.onDraw(slot0, slot1)
	uv2 = "once"

	if slot1 == slot2.once then
		if slot0.freeDrawTimes <= 0 and slot0.drawTimes <= 0 then
			gGameUI:showTip(gLanguageCsv.livenessWheelTimesNotEnough)

			return
		end

		if slot0.freeDrawTimes > 0 then
			uv2 = "once"
			slot1 = slot2.free
		end
	else
		uv2 = "once"

		if slot1 == slot2.five and slot0.drawTimes < 5 then
			gGameUI:showTip(gLanguageCsv.livenessWheelTimesNotEnough)

			return
		end
	end

	gGameApp:requestServerCustom("/game/yy/award/draw"):params(slot0.activityId, slot1):onResponse(function (slot0)
		slot1 = 0
		slot2 = 1
		uv3 = "skipAni"

		if not slot3.skipAni:read() then
			uv3 = "skipAni"
			uv5 = "read"
			slot3, slot1 = slot3:getAniParams(slot5, slot0)
			uv3 = "skipAni"

			slot3:wheelAni(slot3)
		end

		uv4 = "skipAni"

		performWithDelay(slot4, function ()
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
		end, slot1)
	end):wait({
		false
	}):doit(function (slot0)
		slot1 = gGameUI
		slot1 = slot1.showGainDisplay

		slot1(slot1, slot0)

		uv1 = "gGameUI"

		slot1.wheelSkel:play("effect_loop")
	end)
end

function slot6.wheelAni(slot0, slot1)
	slot2 = slot0.wheelSkel
	slot3 = slot2
	slot2 = slot2.play
	slot4 = "effect"

	slot2(slot3, slot4)

	uv2 = "wheelSkel"
	slot2 = slot2.dt
	uv3 = "wheelSkel"
	uv4 = "wheelSkel"
	uv5 = "wheelSkel"
	uv6 = "wheelSkel"
	uv7 = "wheelSkel"
	slot7 = slot7.stage3Nums
	slot6 = slot6.stage1Nums + slot7
	uv6 = "wheelSkel"
	uv7 = "wheelSkel"
	uv8 = "wheelSkel"
	uv11 = "play"

	slot0:unSchedule(slot11.wheel)

	slot9 = 0
	slot11 = slot3.stage1Nums * slot6.stage1Time / slot2
	slot12 = (slot5.stage2Nums + slot1 - slot6 - 1) * slot7.stage2Time / slot2
	slot13 = slot4.stage3Nums * slot8.stage3Time / slot2

	slot0:setSelectedReward(1)

	uv19 = "play"

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
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
		--     return _build_numeric_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
		--     number = state.constants.numeric_constants[index]
		--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end, slot2, slot2, slot19.wheel)
end

function slot6.onSkip(slot0)
	slot0.skipAni:modify(function (slot0)
		return true, not slot0
	end)
end

function slot6.getAniParams(slot0, slot1, slot2)
	slot4 = dataEasy.mergeRawDate(slot2)[1]
	slot5, slot6, slot7 = nil

	for slot11, slot12 in ipairs(slot0.rewardDatas) do
		if slot12.key == slot4.key then
			if slot12.num == slot4.num then
				slot5 = slot11
			end

			if not slot7 then
				slot6 = slot11
				slot7 = slot12.num
			elseif slot12.num < slot7 then
				slot6 = slot11
				slot7 = slot12.num
			end
		end
	end

	slot5 = slot5 or (slot6 or 1)
	uv8 = "dataEasy"
	uv9 = "dataEasy"
	uv10 = "dataEasy"
	uv11 = "dataEasy"
	slot10 = slot10.stage1Nums + slot11.stage3Nums
	slot9 = slot9.stage2Nums + slot5 - slot10
	uv9 = "dataEasy"
	uv10 = "dataEasy"
	slot10 = slot10.stage1Nums
	slot9 = slot9.stage1Time * slot10
	uv9 = "dataEasy"
	uv10 = "dataEasy"
	slot9 = slot9.stage3Time * slot10.stage3Nums
	uv9 = "dataEasy"

	return slot5, slot8.dt * slot9 + slot9 + slot9 + slot9.showTime
end

function slot6.initSkel(slot0)
	slot0.wheelSkel = widget.addAnimationByKey(slot0:getResourceNode(), "huoyueduobao/huoyueduobao.skel", "wheelSkel", "effect_loop", 2)

	slot0.wheelSkel:anchorPoint(cc.p(0.5, 0.5)):xy(display.sizeInView.width / 2, display.sizeInView.height / 2):scale(2)

	slot0.selectedSkel = widget.addAnimationByKey(slot0.wheelPanel, "huoyueduobao/huoyueduobao.skel", "selectedSkel", "effect_kuang_loop", 10)

	slot0.selectedSkel:anchorPoint(cc.p(0.5, 0.5)):xy(slot0.wheelPanel:get("reward1"):x(), slot0.wheelPanel:get("reward1"):y()):scale(2)
end

function slot6.onRules(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot6.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(121),
		slot2.noteText(68001, 68006)
	}
end

function slot6.setSelectedReward(slot0, slot1)
	slot0.selectedItem:clone():show()

	if slot0.wheelSelected then
		slot0.wheelSelected:removeFromParent()
	end

	slot0.wheelSelected = slot2

	slot0.wheelSelected:addTo(slot0.wheelPanel:get("reward" .. slot1), 1):xy(slot0.selectedItem:width() / 2, slot0.selectedItem:height() / 2)
	slot0.selectedSkel:xy(slot0.wheelPanel:get("reward" .. slot1):x(), slot0.wheelPanel:get("reward" .. slot1):y())
end

return slot6
