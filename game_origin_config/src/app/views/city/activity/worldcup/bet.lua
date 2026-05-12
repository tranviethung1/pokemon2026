slot0 = cc.load("mvc").ViewBase
slot1 = class("WorldCupBetView", Dialog)
slot2 = require("app.views.city.activity.worldcup.tools")
slot1.RESOURCE_FILENAME = "worldcup_bet.json"
slot1.RESOURCE_BINDING = {
	["tabPanel2.numberPanel.num"] = "scoreNum",
	tabPanel2 = "tabPanel2",
	tabPanel1 = "tabPanel1",
	["tabPanel1.close"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["tabPanel2.close"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["tabPanel1.btnBet"] = {
		varname = "btnBet1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onBet(1)
				end)
			}
		}
	},
	["tabPanel1.btnAward"] = {
		varname = "btnAward1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onAwardsClick(1)
				end)
			}
		}
	},
	["tabPanel2.btnBet"] = {
		varname = "btnBet2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onBet(1)
				end)
			}
		}
	},
	["tabPanel2.btnAward"] = {
		varname = "btnAward2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onAwardsClick(1)
				end)
			}
		}
	},
	["tabPanel2.btnAward2"] = {
		varname = "btnScoreAward",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onAwardsClick(2)
				end)
			}
		}
	},
	["tabPanel2.addBtn"] = {
		varname = "addBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddClick")
			}
		}
	},
	["tabPanel2.subBtn"] = {
		varname = "subBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSubClick")
			}
		}
	},
	["tabPanel2.btnBet2"] = {
		varname = "tab2btnBet2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onBet(2)
				end)
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.cb = slot2
	slot0.matchID = slot1

	slot0:initModel()
	idlereasy.when(slot0.worldCup, function ()
		uv0 = "updateData"

		slot0:updateData()
	end)
	idlereasy.any({
		slot0.score,
		slot0.selectIndex
	}, function ()
		uv0 = "updatePanel"

		slot0:updatePanel()
	end)
	slot0:initItemClick()
	slot0.tabPanel1:visible(slot0.data.cfg.focus == 0)

	slot3 = slot0.tabPanel2
	slot3 = slot3.visible

	slot3(slot3, slot0.data.cfg.focus == 1)

	uv3 = "cb"
	slot3 = slot3.getCurTimeStr(slot0.data.cfg.awardDate, slot0.data.cfg.awardTime)

	slot0.tabPanel1:get("timeTip"):text(string.format(gLanguageCsv.worldcupBetTimeTip, slot3))
	slot0.tabPanel2:get("timeTip"):text(string.format(gLanguageCsv.worldcupBetTimeTip, slot3))
	adapt.oneLineCenterPos(cc.p(slot0.btnBet1:width() / 2, slot0.btnBet1:height() / 2), {
		slot0.btnBet1:get("icon"),
		slot0.btnBet1:get("number")
	}, cc.p(5, 0))
	adapt.oneLineCenterPos(cc.p(slot0.btnBet2:width() / 2, slot0.btnBet2:height() / 2), {
		slot0.btnBet2:get("icon"),
		slot0.btnBet2:get("number")
	}, cc.p(5, 0))
	slot0.btnAward1:get("tips"):text(gLanguageCsv.worldcupRewardPreview)
	slot0.btnAward2:get("tips"):text(gLanguageCsv.worldcupRewardPreview)
	slot0.btnScoreAward:get("tips"):text(gLanguageCsv.worldcupRewardPreview)
	adapt.setTextScaleWithWidth(slot0.btnAward1:get("tips"), nil, 80)
	adapt.setTextScaleWithWidth(slot0.btnAward2:get("tips"), nil, 80)
	adapt.setTextScaleWithWidth(slot0.btnScoreAward:get("tips"), nil, 80)
	gGameModel.forever_dispatch:getIdlerOrigin("worldcupItemBetClick"):modify(function ()
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
	end, true)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.worldCup = gGameModel.role:getIdler("worldcup")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.selectIndex = idler.new()
	slot0.score = idler.new(0)
end

function slot1.updateData(slot0)
	slot1 = csv.yunying.worldcup_match[slot0.matchID]
	slot2 = false
	slot3 = false
	slot4, slot5 = nil

	if gGameModel.role:read("worldcup").bet_wdl and slot6.bet_wdl[slot0.matchID] then
		slot4 = slot6.bet_wdl[slot0.matchID]
		slot2 = true
	end

	if slot6.bet_score and slot6.bet_score[slot0.matchID] then
		slot5 = slot6.bet_score[slot0.matchID]
		slot3 = true
	end

	slot0.data = {
		cfg = slot1,
		isBetted = slot2,
		isScoreBetted = slot3,
		betResult = slot4,
		betScoreResult = slot5
	}

	slot0.selectIndex:set(slot4, true)
	slot0.score:set(slot5 and slot5 or 0, true)

	slot7 = csvClone(slot1.betWDLAwards)
	slot7.gold = slot1.bet * slot1.odds.right
	slot8 = csvClone(slot1.betWrong)
	slot8.gold = slot1.bet * slot1.odds.wrong
	slot0.allAwardData = {
		rightData = slot7,
		wrongData = slot8,
		rightScoreData = csvClone(slot1.betScoreAwards)
	}
end

function slot1.initItemClick(slot0)
	slot1 = slot0.data.cfg.focus == 0 and slot0.tabPanel1 or slot0.tabPanel2

	slot0:bindItemClick(slot1:get("victory"), 1)
	slot0:bindItemClick(slot1:get("draw"), 0)
	slot0:bindItemClick(slot1:get("lose"), -1)
end

function slot1.bindItemClick(slot0, slot1, slot2)
	bind.touch(slot0, slot1, {
		method = function ()
			uv0 = "onItemClick"
			uv2 = "onItemClick"

			slot0:onItemClick(slot2)
		end
	})
end

function slot1.onBet(slot0, slot1)
	slot4 = nil
	slot4 = slot1 == 1 and slot0.selectIndex:read() or slot0.score:read()
	uv6 = "selectIndex"
	slot7 = slot0.data.cfg.betStartDate
	uv7 = "selectIndex"

	if time.getTime() < slot6.getCurTimeStamp(slot7, slot0.data.cfg.betStartTime) or slot7.getCurTimeStamp(slot0.data.cfg.betEndDate, slot0.data.cfg.betEndTime) < slot5 then
		gGameUI:showTip(gLanguageCsv.worldcupNotInBetTime)

		return
	end

	if not slot4 then
		gGameUI:showTip(gLanguageCsv.worldcupNotChooseBetResult)

		return
	end

	if slot1 == 1 and slot0.gold:read() < csv.yunying.worldcup_match[slot0.matchID].bet then
		uiEasy.showDialog("gold")

		return
	end

	if not csv.yunying.worldcup_match[slot0.matchID].oddsShow.draw and slot4 == 0 then
		gGameUI:showTip(gLanguageCsv.worldcupNoDraw)

		return
	end

	slot12 = nil

	gGameUI:showDialog({
		selectType = 1,
		clearFast = true,
		btnType = 1,
		content = (slot1 ~= 1 or (slot4 ~= 1 or string.format(gLanguageCsv.worldcupBetWin, csv.yunying.worldcup_team[slot0.data.cfg.team1].teamName)) and (slot4 ~= 0 or gLanguageCsv.worldcupBetDraw) and string.format(gLanguageCsv.worldcupBetWin, csv.yunying.worldcup_team[slot0.data.cfg.team2].teamName)) and string.format(gLanguageCsv.worldcupBetGoal, slot4),
		cb = function ()
			uv4 = "gGameApp"
			uv5 = "requestServer"
			uv6 = "/game/yy/worldcup/bet"

			gGameApp:requestServer("/game/yy/worldcup/bet", function (slot0)
				slot1 = gGameUI
				slot2 = slot1
				slot1 = slot1.showTip

				slot1(slot2, gLanguageCsv.worldcupBetSuccess)

				uv1 = "gGameUI"
				uv2 = "gGameUI"

				slot1.cb(slot2.matchID)
			end, slot4.matchID, slot5, slot6)
		end
	})
end

function slot1.onItemClick(slot0, slot1)
	if slot0.data.betResult then
		gGameUI:showTip(gLanguageCsv.worldcupBetWinOrLoseYet)

		return
	end

	slot0.selectIndex:set(slot1)
end

function slot1.onAddClick(slot0)
	uv2 = "time"
	slot3 = slot0.data.cfg.betStartDate
	uv3 = "time"

	if time.getTime() < slot2.getCurTimeStamp(slot3, slot0.data.cfg.betStartTime) or slot3.getCurTimeStamp(slot0.data.cfg.betEndDate, slot0.data.cfg.betEndTime) < slot1 then
		gGameUI:showTip(gLanguageCsv.worldcupNotInBetTime)

		return
	end

	if slot0.score:read() >= 100 then
		gGameUI:showTip(gLanguageCsv.worldcupScoreMax)

		return
	end

	slot0.score:set(slot4 + 1)
end

function slot1.onSubClick(slot0)
	uv2 = "time"
	slot3 = slot0.data.cfg.betStartDate
	uv3 = "time"

	if time.getTime() < slot2.getCurTimeStamp(slot3, slot0.data.cfg.betStartTime) or slot3.getCurTimeStamp(slot0.data.cfg.betEndDate, slot0.data.cfg.betEndTime) < slot1 then
		gGameUI:showTip(gLanguageCsv.worldcupNotInBetTime)

		return
	end

	if slot0.score:read() <= -100 then
		gGameUI:showTip(gLanguageCsv.worldcupScoreMin)

		return
	end

	slot0.score:set(slot4 - 1)
end

function slot1.updatePanel(slot0)
	slot2 = nil

	slot0.scoreNum:text((slot0.score:read() <= 0 or string.format(gLanguageCsv.worldcupWinScore, slot1)) and (slot1 ~= 0 or gLanguageCsv.worldcupDrawScore) and string.format(gLanguageCsv.worldcupLoseScore, -slot1))
	adapt.setTextScaleWithWidth(slot0.scoreNum, nil, 180)

	slot3 = slot0.data.cfg.focus == 0 and slot0.tabPanel1 or slot0.tabPanel2
	slot5 = csv.yunying.worldcup_match[slot0.matchID]
	slot6 = csv.yunying.worldcup_team[slot0.data.cfg.team1]
	slot7 = csv.yunying.worldcup_team[slot0.data.cfg.team2]

	slot3:get("btnBet"):get("number"):text(slot5.bet)
	slot3:get("victory"):get("txtCountry"):text(slot6.teamName)
	slot3:get("victory"):get("imgFlag"):texture(slot6.teamIcon)
	slot3:get("victory"):get("txtOdd"):text(slot5.oddsShow.win)
	slot3:get("draw"):get("txtOdd"):text(slot5.oddsShow.draw)
	slot3:get("lose"):get("txtCountry"):text(slot7.teamName)
	slot3:get("lose"):get("imgFlag"):texture(slot7.teamIcon)
	slot3:get("lose"):get("txtOdd"):text(slot5.oddsShow.lose)
	slot3:get("victory"):get("imgResult"):hide()
	slot3:get("lose"):get("imgResult"):hide()

	if matchLanguage({
		"en",
		"kr"
	}) then
		adapt.setTextScaleWithWidth(slot3:get("victory"):get("txtOddTips"), nil, 150)
		adapt.setTextScaleWithWidth(slot3:get("draw"):get("txtOddTips"), nil, 150)
		adapt.setTextScaleWithWidth(slot3:get("lose"):get("txtOddTips"), nil, 150)
		slot3:get("victory"):get("txtOddTips"):y(80)
		slot3:get("draw"):get("txtOddTips"):y(90)
		slot3:get("lose"):get("txtOddTips"):y(80)
		slot3:get("victory"):get("txtOdd"):xy(314, 50)
		slot3:get("draw"):get("txtOdd"):xy(183, 60)
		slot3:get("lose"):get("txtOdd"):xy(314, 50)
	end

	if slot0.data.cfg.focus == 1 then
		slot3:get("majorName"):text(slot6.teamName)
		slot3:get("majorFlag"):texture(slot6.teamIcon)
		slot3:get("oppoName"):text(slot7.teamName)
		slot3:get("oppoFlag"):texture(slot7.teamIcon)
		slot3:get("tips2"):text(string.format(gLanguageCsv.worldcupGuessBallText, slot6.teamName, slot7.teamName) .. slot2)
		adapt.setTextAdaptWithSize(slot3:get("major"), {
			margin = -5,
			vertical = "center",
			maxLine = 2,
			horizontal = "center",
			size = cc.size(110, 110)
		})
		adapt.setTextAdaptWithSize(slot3:get("majorName"), {
			margin = -5,
			vertical = "center",
			maxLine = 2,
			horizontal = "center",
			size = cc.size(200, 110)
		})
		adapt.setTextAdaptWithSize(slot3:get("oppo"), {
			margin = -5,
			vertical = "center",
			maxLine = 2,
			horizontal = "center",
			size = cc.size(110, 110)
		})
		adapt.setTextAdaptWithSize(slot3:get("oppoName"), {
			margin = -5,
			vertical = "center",
			maxLine = 2,
			horizontal = "center",
			size = cc.size(200, 110)
		})
	end

	adapt.setTextScaleWithWidth(slot3:get("victory"):get("txtCountry"), nil, 160)
	adapt.setTextScaleWithWidth(slot3:get("lose"):get("txtCountry"), nil, 160)
	slot3:get("victory"):get("imgBetted"):hide()
	slot3:get("draw"):get("imgBetted"):hide()
	slot3:get("lose"):get("imgBetted"):hide()
	slot3:get("victory"):get("select"):hide()
	slot3:get("draw"):get("select"):hide()

	slot8 = slot3:get("lose"):get("select")
	slot9 = slot8

	slot8.hide(slot9)

	slot8 = time.getTime()
	uv9 = "score"
	slot10 = slot0.data.cfg.betStartDate
	uv10 = "score"
	slot11 = 1

	if slot0.data.isBetted or slot8 < slot9.getCurTimeStamp(slot10, slot0.data.cfg.betStartTime) or slot10.getCurTimeStamp(slot0.data.cfg.betEndDate, slot0.data.cfg.betEndTime) < slot8 then
		slot11 = 2
	end

	slot12 = 1

	if not slot0.data.isScoreBetted then
		if slot8 < slot9 or slot10 < slot8 then
			slot12 = 3

			slot0.tab2btnBet2:get("label"):text(gLanguageCsv.worldcupBetNotJoin)
		end
	else
		slot12 = 2

		slot0.tab2btnBet2:get("label"):text(gLanguageCsv.worldcupBetYet)
	end

	uiEasy.setBtnShader(slot4, slot4:get("number"), slot11)
	uiEasy.setBtnShader(slot0.tab2btnBet2, slot0.tab2btnBet2:get("label"), slot12)
	uiEasy.setBtnShader(slot0.addBtn, nil, slot12)
	uiEasy.setBtnShader(slot0.subBtn, nil, slot12)

	slot13 = slot0.selectIndex:read()

	if slot0.data.isBetted then
		slot3:get("victory"):get("imgBetted"):visible(slot13 == 1)
		slot3:get("draw"):get("imgBetted"):visible(slot13 == 0)
		slot3:get("lose"):get("imgBetted"):visible(slot13 == -1)
	else
		slot3:get("victory"):get("select"):visible(slot13 == 1)
		slot3:get("draw"):get("select"):visible(slot13 == 0)
		slot3:get("lose"):get("select"):visible(slot13 == -1)
	end

	if not slot5.oddsShow.draw then
		slot3:get("draw"):hide()
		slot3:get("victory"):x(477)
		slot3:get("lose"):x(1306)
	end

	if slot0.data.isScoreBetted then
		slot0.tab2btnBet2:get("label"):text(gLanguageCsv.worldcupBetYet)
	end
end

function slot1.onClose(slot0)
	Dialog.onClose(slot0)
end

function slot1.onAwardsClick(slot0, slot1)
	print(slot1)
	print_r(slot0.allAwardData)
	gGameUI:stackUI("city.activity.worldcup.betaward", nil, , slot0.allAwardData, slot1)
end

return slot1
