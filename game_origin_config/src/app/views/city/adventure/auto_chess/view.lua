slot1 = class("AutoChessView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.adventure.auto_chess.tools")
slot1.RESOURCE_FILENAME = "auto_chess.json"
slot1.RESOURCE_BINDING = {
	bg1 = "bg1",
	bg = "bg",
	["personPanel.figure.personAniNode"] = "personAniNode",
	cutDownPanel = "cutDownPanel",
	centerPanel = "centerPanel",
	txtTheme = "txtTheme",
	["centerPanel.relaxTimePanel"] = "relaxTimePanel",
	["personPanel.infoPanel"] = "infoPanel",
	downPanel = "downPanel",
	["centerPanel.timePanel"] = "timePanel",
	personPanel = "personPanel",
	["cutDownPanel.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 94, 89, 255)
				}
			}
		}
	},
	["cutDownPanel.txtCutDown"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(90, 94, 89, 255)
				}
			}
		}
	},
	["downPanel.btnShop"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShopClick")
			}
		}
	},
	["downPanel.btnShop.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(97, 89, 89, 255)
				}
			}
		}
	},
	["downPanel.btnRank"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRankClick")
			}
		}
	},
	["downPanel.btnRank.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(97, 89, 89, 255)
				}
			}
		}
	},
	["downPanel.btnRule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["downPanel.btnRule.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(97, 89, 89, 255)
				}
			}
		}
	},
	["downPanel.btnHandbook"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onHandbookClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "autoChessHandbook",
					onNode = function (slot0)
						slot0:xy(140, 160)
						slot0:scale(0.8)
					end
				}
			}
		}
	},
	["downPanel.btnHandbook.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(97, 89, 89, 255)
				}
			}
		}
	},
	closingTips = {
		varname = "closingTips",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	["centerPanel.timePanel.txtTimes"] = {
		varname = "txtTimes",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	["centerPanel.relaxTimePanel.txtTimes"] = {
		varname = "relaxTxtTimes",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	["centerPanel.resumeTimeCutDown"] = {
		varname = "resumeCutDown",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	["centerPanel.btnGame"] = {
		varname = "btnStart",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStartClick")
			}
		}
	},
	["centerPanel.btnGame.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["centerPanel.btnRelax"] = {
		varname = "btnRelax",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRelaxClick")
			}
		}
	},
	["centerPanel.btnRelax.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["personPanel.figure.btnChange"] = {
		binds = {
			event = "extend",
			class = "red_hint",
			props = {
				specialTag = "autoChessTrainerDailyHint",
				onNode = function (slot0)
					slot0:xy(140, 140)
				end
			}
		}
	},
	["personPanel.figure"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
			}
		}
	},
	["personPanel.infoPanel.lv"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(97, 89, 89, 255)
				}
			}
		}
	},
	["personPanel.infoPanel.lvNum"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(97, 89, 89, 255)
				}
			}
		}
	},
	["personPanel.infoPanel.exp"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(97, 89, 89, 255)
				}
			}
		}
	},
	["personPanel.infoPanel.hp"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(97, 89, 89, 255)
				}
			}
		}
	},
	achievementPanel = {
		varname = "achievementPanel",
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
					specialTag = "autoChessAchievement",
					onNode = function (slot0)
						slot0:xy(180, 200)
					end
				}
			}
		}
	},
	["achievementPanel.lvNum"] = {
		varname = "mainLv",
		binds = {
			event = "effect",
			data = {
				shadow = {
					size = 4,
					color = cc.c4b(100, 100, 100, 255),
					offset = cc.size(0, -12)
				}
			}
		}
	},
	["achievementPanel.name"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(97, 89, 89, 255)
				}
			}
		}
	}
}

function slot1.onCreate(slot0)
	gGameUI.topuiManager:createView("auto_chess", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "CARDADVENTURE",
		title = gLanguageCsv.autoChess
	})
	slot0:enableSchedule()
	slot0:initModel()

	if not userDefault.getForeverLocalKey("autoChessAchievementPoint") then
		userDefault.setForeverLocalKey("autoChessAchievementPoint", slot0.achievementExp:read())
	end

	if userDefault.getForeverLocalKey("autoChessAchievementTrainer") then
		uv3 = "gGameUI"

		slot3.storeAchievementTask(true)
	else
		for slot6, slot7 in pairs(slot0.trainers:read()) do
			if slot7.level > 1 or slot7.exp > 0 then
				uv8 = "gGameUI"

				slot8.storeAchievementTask(true)

				break
			end
		end
	end

	performWithDelay(slot0, function ()
		uv0 = "getGameState"

		slot0:getGameState()
	end, 0.016666666666666666)

	slot3 = time.getTime()
	slot4 = slot0.infoPanel:multiget("roleBg", "role", "lv", "lvNum", "exp", "iconHp", "hp")

	idlereasy.any({
		slot0.trainer,
		slot0.times,
		slot0.achievementExp,
		slot0.trainers,
		slot0.crossID,
		slot0.round,
		slot0.lastResumeTime,
		slot0.relaxTime
	}, function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
		uv9 = "setThemeText"
		slot10 = slot9
		slot9 = slot9.setThemeText

		slot9(slot10)

		uv9 = "createNpcSpine"
		uv10 = "setThemeText"
		slot10 = slot10.personAniNode

		slot9.createNpcSpine(slot10, slot1, "main")

		slot9 = slot4[slot1]
		uv10 = "personAniNode"

		slot10.lvNum:text(slot9.level)

		slot12 = csv.auto_chess.trainer_level
		uv12 = "personAniNode"

		slot12.exp:text(slot9.exp .. "/" .. csv.auto_chess.trainer_level[slot9.level].exp)

		if csvSize(slot12) <= slot9.level then
			uv12 = "personAniNode"

			slot12.exp:text(gLanguageCsv.levelMax)
		end

		slot13 = 0

		for slot17, slot18 in orderCsvPairs(csv.auto_chess.trainer[slot1].hp) do
			if slot17 <= slot9.level then
				slot13 = slot18
			else
				break
			end
		end

		uv14 = "personAniNode"
		slot14 = slot14.hp
		slot14 = slot14.text

		slot14(slot14, slot13)

		uv14 = "personAniNode"
		slot14 = slot14.role
		slot15 = slot14
		slot14 = slot14.texture

		slot14(slot15, gRoleFigureCsv[slot12.figureID].logo)

		uv14 = "createNpcSpine"
		uv15 = "setThemeText"
		slot15 = slot15.mainLv
		slot15 = slot15.text

		slot15(slot15, slot14.getAchievementLevel())

		uv15 = "setThemeText"
		slot15 = slot15.centerPanel
		slot15 = slot15.visible

		slot15(slot15, slot6 ~= "closed")

		uv15 = "setThemeText"

		slot15.closingTips:visible(slot6 == "closed"):text(gLanguageCsv.autoChessNotOpen)

		if slot6 == "closed" then
			return
		end

		if slot6 == "closed" or slot6 == "closing" then
			uv16 = "setThemeText"
			slot16 = slot16.btnStart
			uv17 = "setThemeText"
			slot17 = slot17.btnStart:get("txt")

			uiEasy.setBtnShader(slot16, slot17, 3)

			uv16 = "setThemeText"
			uv17 = "setThemeText"

			uiEasy.setBtnShader(slot16.btnRelax, slot17.btnRelax:get("txt"), 3)
		end

		uv15 = "createNpcSpine"
		slot15 = slot15.getBaseCfg()
		uv16 = "setThemeText"

		slot16.txtTimes:text(gLanguageCsv.symbolBracketLeft .. string.format("%s/%s", slot2, slot15.timesLimit) .. gLanguageCsv.symbolBracketRight)

		if slot15.timesLimit2 > 0 then
			uv16 = "setThemeText"
			slot16 = slot16.relaxTimePanel
			slot16 = slot16.show

			slot16(slot16)

			uv16 = "setThemeText"

			slot16.relaxTxtTimes:text(gLanguageCsv.symbolBracketLeft .. string.format("%s/%s", slot8, slot15.timesLimit2) .. gLanguageCsv.symbolBracketRight)
		else
			uv16 = "setThemeText"

			slot16.relaxTimePanel:hide()
		end

		if slot15.timesLimit <= slot2 then
			uv16 = "setThemeText"
			slot16 = slot16.unSchedule

			slot16(slot16, "autoChessResumeCutDown")

			uv16 = "setThemeText"

			slot16.resumeCutDown:text(gLanguageCsv.autoChessMaxCount)
		else
			uv16 = "setThemeText"

			slot16:schedule(function ()
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
			end, 1, 0, "autoChessResumeCutDown")
		end
	end)

	slot5 = time.getTime()

	slot0.cutDownPanel:show()

	if gGameModel.auto_chess:read("end_date") == 0 then
		slot0.cutDownPanel:hide()
	else
		slot7 = time.getNumTimestamp(slot6, 23)

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
		end, 1, 0, "autoChessCutDown")
	end

	adapt.oneLinePos(slot4.lv, {
		slot4.lvNum,
		slot4.exp
	}, {
		cc.p(5, 0),
		cc.p(30, 0)
	})
	adapt.oneLinePos(slot4.iconHp, slot4.hp, cc.p(10, 0))
	slot0.bg:hide()
	widget.addAnimationByKey(slot0:getResourceNode(), "lushi/zhujiemian/zizouqi_zb.skel", "spineBg", "effect_loop", 1):alignCenter(display.sizeInView):scale(2)
	slot0:checkGuideStatus()
end

function slot1.initModel(slot0)
	slot0.trainer = gGameModel.auto_chess:getIdler("trainer")
	slot0.trainers = gGameModel.auto_chess:getIdler("trainers")
	slot0.round = gGameModel.auto_chess:getIdler("round")
	slot0.achievementExp = gGameModel.auto_chess:getIdler("achievement_points")
	slot0.times = gGameModel.auto_chess:getIdler("times")
	slot0.relaxTime = gGameModel.auto_chess:getIdler("free_times")
	slot0.crossID = gGameModel.auto_chess:getIdler("csv_id")
	slot0.lastResumeTime = gGameModel.auto_chess:getIdler("last_date")
end

function slot1.onCleanup(slot0)
	slot1 = display.director
	slot1 = slot1.setProjection

	slot1(slot1, cc.DIRECTOR_PROJECTION_2D)

	uv1 = "display"

	slot1.onCleanup(slot0)
end

function slot1.setThemeText(slot0)
	display.director:setProjection(cc.DIRECTOR_PROJECTION_3D)
	slot0.txtTheme:text(gLanguageCsv.autoChessTheme):y(slot0.txtTheme:y() + 10)
	slot0.txtTheme:setRotation3D({
		x = 0,
		y = -65
	})
end

function slot1.onShopClick(slot0)
	uiEasy.goToShop(game.SHOP_INIT.AUTO_CHESS_SHOP)
end

function slot1.onRankClick(slot0)
	gGameApp:requestServer("/game/auto_chess/rank", function (slot0)
		gGameUI:stackUI("city.adventure.auto_chess.rank", nil, {
			full = true
		}, slot0.view.ranks)
	end)
end

function slot1.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1500
	})
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext
	slot3 = {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(129101, 129200)
	}

	if not itertools.isempty(gGameModel.auto_chess:read("servers")) then
		table.insert(slot3, 3, "#C0x5B545B#" .. gLanguageCsv.currentServers .. table.concat(arraytools.map(getMergeServers(slot4), function (slot0, slot1)
			return string.format(gLanguageCsv.brackets, getServerArea(slot1, nil, true))
		end), ","))
	end

	return slot3
end

function slot1.onHandbookClick(slot0)
	gGameUI:stackUI("city.adventure.auto_chess.handbook", nil, {
		full = true
	})
end

function slot1.onStartClick(slot0)
	if slot0.round:read() == "closed" then
		gGameUI:showTip(gLanguageCsv.comingSoon)

		return
	end

	if slot1 == "closing" then
		gGameUI:showTip(gLanguageCsv.autoChessClosingTips)

		return
	end

	if slot0.times:read() <= 0 then
		gGameUI:showTip(gLanguageCsv.autoChessNoCount)

		return
	end

	uv2 = "round"

	slot2.storeAchievementTask(true)
	gGameApp:requestServerCustom("/game/auto_chess/start"):params(slot0.trainer:read(), 2):doit(function (slot0)
		gGameUI:switchUIAndStash("lushi_battle.loading")
	end)
end

function slot1.onRelaxClick(slot0)
	if slot0.round:read() == "closed" then
		gGameUI:showTip(gLanguageCsv.comingSoon)

		return
	end

	if slot1 == "closing" then
		gGameUI:showTip(gLanguageCsv.autoChessClosingTips)

		return
	end

	uv2 = "round"

	if slot0.relaxTime:read() <= 0 and slot2.getBaseCfg().timesLimit2 > 0 then
		gGameUI:showTip(gLanguageCsv.autoChessNoCount)

		return
	end

	function slot3()
		slot2 = "/game/auto_chess/start"
		uv2 = "gGameApp"

		gGameApp:requestServerCustom(slot2):params(slot2.trainer:read(), 1):doit(function (slot0)
			gGameUI:switchUIAndStash("lushi_battle.loading")
		end)
	end

	if userDefault.getCurrDayKey("autoChessRelaxTips", "first") == "first" then
		userDefault.setCurrDayKey("autoChessRelaxTips", "true")
	end

	if slot4 == "true" then
		gGameUI:showDialog({
			selectType = 2,
			clearFast = true,
			btnType = 1,
			selectKey = "autoChessRelaxTips",
			content = gLanguageCsv.autoChessRelaxTips,
			cb = slot3,
			selectTip = gLanguageCsv.todayNoTip
		})
	else
		slot3()
	end
end

function slot1.onAchievementClick(slot0)
	gGameUI:stackUI("city.adventure.auto_chess.achievement", nil, {
		full = true
	})
end

function slot1.onChangeClick(slot0)
	gGameUI:stackUI("city.adventure.auto_chess.trainer_change", nil, {
		full = true
	}, slot0:createHandler("updateData"))
end

function slot1.getGameState(slot0)
	if gGameModel.auto_chess:read("in_game") then
		gGameUI:showDialog({
			isRich = true,
			clearFast = true,
			btnType = 1,
			title = gLanguageCsv.spaceTips,
			content = gLanguageCsv.autoChessInGameTips,
			cb = function ()
				uv0 = "storeAchievementTask"

				slot0.storeAchievementTask(true)
				gGameApp:requestServerCustom("/game/auto_chess/recover"):params():doit(function (slot0)
					gGameUI:switchUIAndStash("lushi_battle.loading")
				end)
			end,
			closeCb = function ()
				uv0 = "onClose"

				slot0:onClose()
			end,
			dialogParams = {
				clickClose = false
			}
		})
	end
end

function slot1.checkGuideStatus(slot0)
	slot4 = "newbie_guide"

	for slot4, slot5 in pairs(gGameModel.auto_chess:read(slot4)) do
		if slot5 == 2 then
			return
		end
	end

	gGameUI.guideManagerLocal:checkGuide({
		specialName = "autoChess"
	})
end

return slot1
