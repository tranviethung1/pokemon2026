slot0 = require("app.views.city.activity.brave_challenge.adapt")
slot1 = 0.5
slot2 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(82, 76, 85, 255)
		}
	}
}
slot4 = class("BraveChallengeMainView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "activity_brave_challenge_main.json"
slot4.RESOURCE_BINDING = {
	centerPanel = "centerPanel",
	["centerPanel.tipBg"] = "tipBg",
	["centerPanel.btnGame.img"] = "imgBtnGame",
	["centerPanel.panelTime"] = "panelTime",
	rightDownPanel = "rightDownPanel",
	leftDownPanel = "leftDownPanel",
	doorPanel = {
		varname = "doorPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlayGameClick")
			}
		}
	},
	["centerPanel.txtTimes"] = {
		varname = "txtCTimes",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = ui.COLORS.OUTLINE.DEFAULT
					}
				}
			},
			{
				event = "text",
				idler = bindHelper.self("txtTimes")
			}
		}
	},
	["centerPanel.btnGame"] = {
		varname = "btnGame",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlayGameClick")
			}
		}
	},
	["centerPanel.btnAdd"] = {
		varname = "btnAdd",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddClick")
			}
		}
	},
	["leftDownPanel.btnRule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["leftDownPanel.btnRank"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRankClick")
			}
		}
	},
	["leftDownPanel.btnAchievement"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onAchievementClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "braveChallengeAch",
					listenData = {
						activityId = bindHelper.self("activityId"),
						sign = bindHelper.self("sign")
					},
					onNode = function (slot0)
						slot0:scale(0.5)
						slot0:xy(100, 100)
					end
				}
			}
		}
	},
	["rightDownPanel.timesNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("passTimes")
		}
	},
	["rightDownPanel.roundNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("clearanceRoundNum")
		}
	},
	["centerPanel.panelTime.txtTime"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	}
}

function slot4.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.parent = slot1.parent
	slot2 = slot0.id:read()
	slot0.activityId = slot2
	uv2 = "initModel"
	slot0.sign = slot2.typ
	slot0.cost = 0
	slot0.clearanceTimesNum = idler.new()
	slot0.clearanceRoundNum = idler.new()
	slot0.txtTimes = idler.new()

	slot0:initReflushIdler()
	idlereasy.when(slot0.rank, function (slot0, slot1)
		uv2 = "clearanceRoundNum"

		slot2.clearanceRoundNum:set(slot1.round)
	end)
	idlereasy.when(slot0.passTimes, function (slot0, slot1)
		uv2 = "rightDownPanel"

		slot2.rightDownPanel:visible(slot1 > 0)
	end)
	idlereasy.when(slot0.status, function (slot0, slot1)
		uv2 = "imgBtnGame"

		slot2.imgBtnGame:texture(slot1 == "start" and "activity/brave_challenge/txt_yztz_7.png" or "activity/brave_challenge/txt_yztz_3.png")
	end)
end

function slot4.initModel(slot0)
	slot0.passTimes = gGameModel.brave_challenge:getIdler("pass_times")
	slot0.rank = gGameModel.brave_challenge:getIdler("rank")
	slot0.status = gGameModel.brave_challenge:getIdler("status")
	slot0.id = gGameModel.brave_challenge:getIdler("yyID")
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.commonBCData = gGameModel.role:getIdler("normal_brave_challenge")
end

function slot4.onPlayGameClick(slot0)
	if slot0.parent.comingSoon then
		gGameUI:showTip(gLanguageCsv.comingSoon)

		return
	end

	if slot0.parent:getEndTime() == nil or math.floor(slot1 - time.getTime()) <= 0 then
		gGameUI:showTip(gLanguageCsv.flipCardFinishedClickTip)

		return
	end

	if slot0.status:read() == "start" then
		slot0.parent:openOtherView("city.activity.brave_challenge.challenge_gate", 3)
	else
		if slot0.remainTimes == 0 then
			gGameUI:showTip(gLanguageCsv.gameTimesLimit)

			return
		end

		uv4 = "parent"

		gGameApp:requestServer(slot4.url("preStart"), function (slot0)
			uv1 = "parent"

			slot1.parent:openOtherView("city.activity.brave_challenge.select_card", 2, false, slot0.view)
		end, slot0.activityId)
	end
end

function slot4.runStartAction(slot0)
	slot2 = nil

	function (slot0)
		for slot4, slot5 in pairs(slot0:getChildren()) do
			if slot5:getChildrenCount() == 0 then
				slot10 = cc.FadeIn
				slot11 = slot10
				uv12 = "pairs"
				uv11 = "pairs"

				slot5:runAction(cc.EaseOut:create(slot10.create(slot11, slot12), slot11))
			else
				uv6 = "getChildren"

				slot6(slot5)
			end
		end
	end(slot0:getResourceNode())
end

function slot4.runEndAction(slot0)
	slot2 = nil

	function (slot0)
		for slot4, slot5 in pairs(slot0:getChildren()) do
			if slot5:getChildrenCount() == 0 then
				slot10 = cc.FadeOut
				slot11 = slot10
				uv12 = "pairs"
				uv11 = "pairs"

				slot5:runAction(cc.EaseOut:create(slot10.create(slot11, slot12), slot11))
			else
				uv6 = "getChildren"

				slot6(slot5)
			end
		end
	end(slot0:getResourceNode())
end

function slot4.onAddClick(slot0)
	if slot0.parent.comingSoon then
		gGameUI:showTip(gLanguageCsv.comingSoon)

		return
	end

	slot2 = 0

	if slot0.parent:getEndTime() == nil or math.floor(slot1 - time.getTime()) <= 0 then
		gGameUI:showTip(gLanguageCsv.flipCardFinishedClickTip)

		return
	end

	if slot0.canBuy == false then
		gGameUI:showTip(gLanguageCsv.buyTimesLimit)

		return
	end

	gGameUI:showDialog({
		btnType = 2,
		clearFast = true,
		isRich = true,
		cb = function ()
			uv0 = "cost"

			if gGameModel.role:read("rmb") < slot0.cost then
				uiEasy.showDialog("rmb")
			else
				uv2 = "gGameModel"
				uv4 = "cost"

				gGameApp:requestServer(slot2.url("buy"), function (slot0)
					gGameUI:showTip(gLanguageCsv.buySuccess)
				end, slot4.activityId)
			end
		end,
		title = gLanguageCsv.spaceTips,
		content = string.format(gLanguageCsv.buyGameTimes, slot0.cost),
		dialogParams = {
			clickClose = false
		}
	})
end

function slot4.onAchievementClick(slot0)
	if slot0.parent.comingSoon then
		gGameUI:showTip(gLanguageCsv.comingSoon)

		return
	end

	gGameUI:stackUI("city.activity.brave_challenge.achievement", nil, , slot0.activityId, slot0.parent:getBaseInfo())
end

function slot4.onRankClick(slot0)
	if slot0.parent.comingSoon then
		gGameUI:showTip(gLanguageCsv.comingSoon)

		return
	end

	uv3 = "parent"

	gGameApp:requestServer(slot3.url("rank"), function (slot0)
		gGameUI:stackUI("city.activity.brave_challenge.rank", nil, , slot0.view)
	end, slot0.activityId)
end

function slot4.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot4.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(122001, 122030)
	}
end

function slot4.initCountDown(slot0, slot1, slot2)
	slot0.panelTime:visible(not slot1)

	if slot1 then
		return
	end

	if slot2 > (slot0.parent:getBaseInfo().addTimes or 0) then
		slot2 = slot4 or slot2
	end

	slot0.downTime = time.getNumTimestamp(time.getNextdayStrInClock(), time.getRefreshHour())

	function ()
		uv0 = "panelTime"
		uv4 = "panelTime"
		slot4 = slot4.downTime - time.getTime()
		uv4 = "get"

		slot0.panelTime:get("txtTime"):text(string.format(gLanguageCsv.braveChallengeRecoverTimeTip, time.getCutDown(slot4, true).str, slot4))

		return true
	end()
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
	slot0:requestMain(0)
end

function slot4.requestMain(slot0, slot1)
	slot0.downTime = time.getNumTimestamp(time.getNextdayStrInClock(), time.getRefreshHour())

	performWithDelay(slot0, function ()
		uv2 = "gGameApp"

		gGameApp:requestServer(slot2.url("main"), function ()
			uv0 = "requestMain"

			slot0:requestMain(10)
		end)
	end, math.max(slot0.downTime - time.getTime() + 1, slot1))
end

function slot4.setCenterPanelVisible(slot0, slot1)
	slot0.centerPanel:visible(slot1)
end

function slot4.initReflushIdler(slot0)
	slot2 = slot0.parent:getBaseInfo().buyTimes or 0
	slot3 = slot1.timesLimit or 0
	slot4 = slot1.addTimes or 0
	slot5 = slot1.buyCost or {}
	uv6 = "parent"

	if slot6.typ == game.BRAVE_CHALLENGE_TYPE.anniversary then
		idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
			uv2 = "activityId"
			slot2 = slot1[slot2.activityId]
			slot3 = slot2.info.buyTimes
			slot4 = slot2.info.times
			uv5 = "activityId"
			slot5.canBuy = slot3 < slot3
			uv7 = "info"

			if slot3 + 1 > itertools.size(slot7) or not (slot3 + 1) then
				uv6 = "info"
				slot5 = itertools.size(slot6)
			end

			uv6 = "activityId"
			uv7 = "info"
			slot6.cost = slot7[slot3 + 1]
			uv6 = "activityId"

			slot6.btnAdd:visible(slot3 ~= 0)

			if slot3 == 0 then
				uv6 = "activityId"

				slot6.txtCTimes:x(200)
			end

			uv6 = "activityId"
			uv7 = "buyTimes"
			slot6.remainTimes = slot7 + slot3 - slot4
			uv6 = "activityId"
			slot6 = slot6.txtTimes
			slot6 = slot6.set
			uv9 = "activityId"

			slot6(slot6, gLanguageCsv.braveChallengeGameTimes .. slot9.remainTimes)

			uv6 = "activityId"

			slot6:initCountDown(true)
		end)
	else
		idlereasy.when(slot0.commonBCData, function (slot0, slot1)
			if not slot1.info then
				return
			end

			slot2 = slot1.info.buyTimes
			slot3 = slot1.info.times
			uv4 = "info"
			slot4.canBuy = slot2 < slot2
			uv6 = "buyTimes"

			if slot2 + 1 > itertools.size(slot6) or not (slot2 + 1) then
				uv5 = "buyTimes"
				slot4 = itertools.size(slot5)
			end

			uv5 = "info"
			uv6 = "buyTimes"
			slot5.cost = slot6[slot2 + 1]
			uv5 = "info"
			slot5 = slot5.btnAdd
			slot6 = slot5
			slot5 = slot5.visible

			slot5(slot6, slot2 ~= 0)

			uv5 = "info"
			uv6 = "times"
			slot6 = slot6 + slot2 - slot3
			slot5.remainTimes = slot6
			uv5 = "info"
			uv6 = "times"
			slot7 = gLanguageCsv.braveChallengeRecoverTimeTip02
			uv9 = "info"
			uv10 = "times"
			slot6 = string.format(slot7, slot6 <= slot5.remainTimes and "#C0xFFFFFF#" or "#C0x88C855#", slot9.remainTimes, slot10)
			uv7 = "info"

			if slot7.txtCTimes:parent():get("richTimes") then
				slot8:removeFromParent()
			end

			slot11 = 220
			uv11 = "info"
			slot11 = slot11.txtCTimes
			slot12 = slot11
			slot9 = rich.createWithWidth(slot6, 40, nil, 250, nil, cc.p(0, 0.5)):anchorPoint(cc.p(0, 0.5)):xy(slot11, 90):addTo(slot11.parent(slot12)):name("richTimes")
			slot8 = slot9
			uv9 = "info"
			slot9 = slot9.txtCTimes
			slot9 = slot9.visible
			slot11 = false

			slot9(slot9, slot11)

			uv9 = "info"
			uv11 = "info"
			uv12 = "times"
			uv12 = "times"
			uv13 = "info"

			slot9:initCountDown(slot12 <= slot11.remainTimes, slot12 - slot13.remainTimes)
		end)
	end
end

return slot4
