slot1 = class("QixiView", cc.load("mvc").ViewBase)
slot2 = game.YYHUODONG_TYPE_ENUM_TABLE
slot3 = {
	{
		left = cc.p(405, 135),
		right = cc.p(1160, 120)
	},
	{
		left = cc.p(590, 160),
		right = cc.p(980, 170)
	}
}
slot4 = cc.p(780, 180)
slot1.RESOURCE_FILENAME = "qixi_main.json"
slot1.RESOURCE_BINDING = {
	spineBg1 = "spineBg1",
	rolePanel = "rolePanel",
	["awardBtn.icon1"] = "icon1",
	["topPanel.time"] = "time",
	spineBg = "spineBg",
	["bottomLeftPanel.btnTask"] = {
		varname = "btnTask",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onClickTask")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "qixiTask",
					listenData = {
						activityId = bindHelper.self("taskActivityId")
					},
					onNode = function (slot0)
						slot0:xy(160, 160)
					end
				}
			}
		}
	},
	["bottomLeftPanel.btnTask.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["bottomLeftPanel.btnCollect"] = {
		varname = "btnCollect",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onClickCollect")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "qixiCollect",
					listenData = {
						activityId = bindHelper.self("activityId")
					},
					onNode = function (slot0)
						slot0:xy(190, 205)
					end
				}
			}
		}
	},
	["bottomLeftPanel.btnCollect.text"] = {
		varname = "collectCount",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["bottomLeftPanel.btnFind"] = {
		varname = "btnFind",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onClickBird")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "qixiGame",
					listenData = {
						activityId = bindHelper.self("activityId")
					},
					onNode = function (slot0)
						slot0:xy(160, 160)
					end
				}
			}
		}
	},
	["bottomLeftPanel.btnFind.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["topPanel.btnRule"] = {
		varname = "btnRule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickRule")
			}
		}
	},
	awardBtn = {
		varname = "awardBtn",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onClickDraw")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					showType = "num",
					specialTag = "qixiDraw",
					listenData = {
						activityId = bindHelper.self("activityId")
					},
					onNode = function (slot0)
						slot0:xy(410, 330)
					end
				}
			}
		}
	},
	["awardBtn.text1"] = {
		varname = "text1",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["awardBtn.text2"] = {
		varname = "text2",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot6 = {
		onClose = slot0:createHandler("onClose")
	}
	slot5 = gLanguageCsv.qixiTitle

	gGameUI.topuiManager:createView("default", slot0, slot6):init({
		subTitle = "MEET ON THE MAGPIE BRIDGE",
		title = slot5
	})

	for slot5, slot6 in ipairs(slot1) do
		uv9 = "gGameUI"

		if csv.yunying.yyhuodong[slot6.id].type == slot9.generalTask then
			slot0.taskActivityId = slot6.id
		else
			slot0.activityId = slot6.id
		end
	end

	assertInWindows(slot0.activityId and slot0.taskActivityId, "七夕集合要配置 qixi 和 generalTask 的活动id, independent 要配置成 1")
	slot0:initModel()
	slot0:enableSchedule()
	slot0:initCutDown()

	slot0.drawCount = idler.new(0)

	idlereasy.any({
		slot0.yyhuodongs,
		slot0.yyOpen
	}, function (slot0, slot1, slot2)
		uv3 = "activityId"
		slot3 = slot1[slot3.activityId] or {}
		slot4 = slot3.info or {}
		slot5 = slot4.score or 0
		uv8 = "activityId"
		slot9 = slot8

		slot8.refreshRolePos(slot9, slot3.stamps or {})

		uv9 = "info"
		slot9 = slot5 - (slot4.drawTimes or 0) * slot9
		slot8 = math.max(slot9, 0)
		uv9 = "activityId"
		slot9 = slot9.collectCount
		slot9 = slot9.text
		slot12 = gLanguageCsv.qixiCollect

		slot9(slot9, string.format(slot12, slot5))

		uv9 = "activityId"
		slot9 = slot9.drawCount
		slot9 = slot9.set
		uv12 = "info"
		slot12 = slot8 / slot12

		slot9(slot9, math.floor(slot12))

		uv9 = "activityId"
		uv12 = "info"
		uv14 = "info"

		slot9.awardBtn:get("text2"):text(gLanguageCsv.qixiText .. slot8 % slot12 .. "/" .. slot14)
	end)
	slot0.text1:text(string.format(gLanguageCsv.qixiCollect1, csv.yunying.yyhuodong[slot0.activityId].paramMap.qixiDrawCost))
	adapt.oneLinePos(slot0.text1, {
		slot0.icon1,
		slot0.text2
	}, cc.p(5, 0))
	widget.addAnimationByKey(slot0.spineBg, "qixiqueqiao/qixichoujiang_hou.skel", "bg", "effect_loop", 0):xy(slot0.spineBg:width() / 2, slot0.spineBg:height() / 2)
	widget.addAnimationByKey(slot0.spineBg1, "qixiqueqiao/qixichoujiang_q.skel", "bg", "effect_loop", 1):xy(slot0.spineBg1:width() / 2, slot0.spineBg1:height() / 2)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyOpen = gGameModel.role:getIdler("yy_open")
end

function slot1.initCutDown(slot0)
	slot0:unSchedule(1)
	bind.extend(slot0, slot0.time, {
		class = "cutdown_label",
		props = {
			endTime = gGameModel.role:read("yy_endtime")[slot0.activityId] or time.getTime(),
			tag = slot1,
			callFunc = function (slot0)
				uv2 = "adapt"
				uv3 = "adapt"

				adapt.oneLinePos(slot2.btnRule, slot3.time, cc.p(10, 0), "right")
			end,
			strFunc = function (slot0)
				return gLanguageCsv.activityLeftTime .. slot0.str
			end,
			endFunc = function ()
				uv0 = "time"

				slot0.time:text(gLanguageCsv.activityOver)
			end
		}
	})
end

function slot1.refreshRolePos(slot0, slot1)
	slot2 = nil

	for slot8 = 1, csvSize(csv.yunying.qixi_collect) do
		if slot1[slot8] then
			slot4 = 0 + 1
		end
	end

	if slot4 / slot3 < 0.4 then
		uv6 = "csvSize"
		slot2 = slot6[1]
	elseif slot5 >= 0.4 and slot5 < 0.8 then
		uv6 = "csvSize"
		slot2 = slot6[2]
	end

	if slot2 then
		widget.addAnimationByKey(slot0.rolePanel, "qixiqueqiao/qixichoujiang_juese.skel", "left", "effect_alld_loop", 1):xy(slot2.left)
		widget.addAnimationByKey(slot0.rolePanel, "qixiqueqiao/qixichoujiang_juese.skel", "right", "effect_snd_loop", 1):xy(slot2.right)
		slot0.rolePanel:removeChildByName("center")
	else
		slot0.rolePanel:removeChildByName("left")
		slot0.rolePanel:removeChildByName("right")

		slot8 = "qixiqueqiao/qixichoujiang_juese.skel"
		uv8 = "csv"

		widget.addAnimationByKey(slot0.rolePanel, slot8, "center", "effect_heti_loop", 1):xy(slot8)
	end
end

function slot1.onClickRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1200
	})
end

function slot1.getRuleContext(slot0, slot1)
	return {
		adaptContext.noteText(135201, 135250)
	}
end

function slot1.onClickDraw(slot0)
	if slot0.drawCount:read() > 0 then
		slot1 = slot0.spineBg:get("bg")
		slot2 = slot0.spineBg1:get("bg")

		slot1:play("effect")
		slot1:addPlay("effect_loop")
		slot2:play("effect")
		slot2:addPlay("effect_loop")
		gGameApp:requestServerCustom("/game/yy/qixi/draw/award/get"):params(slot0.activityId):onResponse(function (slot0)
			uv2 = "performWithDelay"

			performWithDelay(slot2, function ()
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
			end, 1.8)
		end):wait({
			false
		}):doit(function (slot0)
			gGameUI:showGainDisplay(slot0)
		end)

		return
	end

	gGameUI:showTip(gLanguageCsv.qixiDraw)
end

function slot1.onClickTask(slot0)
	gGameUI:stackUI("city.activity.qixi.task", nil, , slot0.taskActivityId)
end

function slot1.onClickCollect(slot0)
	gGameUI:stackUI("city.activity.qixi.collect", nil, , slot0.activityId)
end

function slot1.onClickBird(slot0)
	gGameUI:stackUI("city.activity.qixi.find_bird_start", nil, , slot0.activityId)
end

return slot1
