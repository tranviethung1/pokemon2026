slot1 = class("YyBetRecord", cc.load("mvc").ViewBase)
slot2 = {
	all = 1,
	open = 2,
	mine = 3
}

function slot3(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot1) do
		slot7:x(slot7:x() + slot2[slot6])
	end
end

function slot4(slot0, slot1, slot2, slot3, slot4)
	slot1:get("icon"):texture(dataEasy.getUnitCsv(slot4.tools.getCsv("cards")[slot3].cardID).iconSimple)
end

function slot1.onItemx(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot3:get("tips")
	slot8 = slot3:get("dataPlane"):multiget("imgFlag", "imgFlag1", "btnReplay", "textName", "textName1", "spine", "battleEnd", "imgBG", "name", "time", "notBet", "vs", "btnJump", "bet", "bet1", "list", "list1", "award", "items", "betCoin", "betCoin1")
	slot9 = {
		"vs",
		"notBet",
		"vs"
	}

	itertools.invoke({
		slot8.btnReplay,
		slot8.btnJump,
		slot8.vs,
		slot8.notBet,
		slot8.award,
		slot8.spine,
		slot8.battleEnd,
		slot8.betCoin,
		slot8.betCoin1
	}, "hide")
	slot8.spine:removeAllChildren()

	slot10 = slot0.tools.getCsv("contest")[slot5.csvId]

	slot8.name:text(slot0.tools.getMatchName(slot0.activityId, slot5.csvId, slot10))

	slot11, slot12 = time.getHourAndMin(slot10.betEndTime, true)

	slot8.time:text(string.format("%02d:%02d", slot11, slot12))

	slot14, slot15, slot16 = slot0.tools.getContestBetTime(slot0.activityId, slot5.csvId)
	slot17 = 2

	if time.getTime() < slot14 then
		slot17 = 0

		slot8.notBet:text(gLanguageCsv.weikaisai):show()
	elseif slot13 < slot15 then
		slot17 = 3

		slot8.spine:show()
		widget.addAnimationByKey(slot8.spine, "kuafushiying/vs.skel", "vsSpine", "effect_loop", 2):xy(75, 65):scale(2)
		slot8.btnJump:show()
	elseif slot15 <= slot13 and slot13 <= slot16 then
		slot17 = 1

		slot8.spine:show()
		widget.addAnimationByKey(slot8.spine, "kuafushiying/vs.skel", "vsSpine", "effect_loop2", 2):xy(75, 35):scale(2)
		slot8.btnJump:show()
	else
		slot17 = 2

		slot8.battleEnd:show()
		slot8.btnJump:hide()
		slot8.btnReplay:show()
	end

	if slot5.showDate then
		slot6:show()
		slot6:y(365)
		text.addEffect(slot6:get("txt"), {
			outline = {
				size = 4,
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		slot3:height(400)

		slot19, slot20, slot21 = time.getYearMonthDay(slot0.tools.getContestDate(slot0.activityId, slot10.contestDate), true)

		slot6:get("txt"):text(string.formatex(gLanguageCsv.timeMonthDay, {
			month = slot20,
			day = slot21
		}))
	else
		slot6:hide()
		slot3:height(330)
	end

	bind.extend(slot2, slot8.btnJump, {
		class = "red_hint",
		props = {
			specialTag = slot0:getItemRedHintTag(),
			listenData = {
				activityId = slot2.activityId,
				contestId = slot5.csvId
			},
			onNode = function (slot0)
				uv3 = "xy"
				slot3 = slot3.btnJump
				slot4 = slot3
				uv4 = "xy"

				slot0:xy(slot3.width(slot4) - 10, slot4.btnJump:height() - 5)
			end
		}
	})

	slot18, slot19 = slot0:getTeamId(slot5.csvId)
	slot20 = slot0.tools.getCsv("teams")[slot18]

	slot8.textName:text(slot20.name)
	bind.extend(slot2, slot8.list, {
		class = "listview",
		props = {
			data = slot20.team,
			item = slot8.items,
			onItem = function ()
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
			end
		}
	})

	slot21 = slot0.tools.getCsv("teams")[slot19]

	slot8.textName1:text(slot21.name)
	bind.extend(slot2, slot8.list1, {
		class = "listview",
		props = {
			data = slot21.team,
			item = slot8.items,
			onItem = function ()
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
			end
		}
	})

	if not itertools.isempty(slot5.betInfo) then
		slot23 = csv.yunying.yyhuodong[slot0.activityId]

		slot8.betCoin:get("betCoin"):texture(dataEasy.getIconResByKey(slot23.clientParam.itemId))
		slot8.betCoin1:get("betCoin"):texture(dataEasy.getIconResByKey(slot23.clientParam.itemId))
		slot8.bet:visible(slot22.team == slot18)
		slot8.betCoin:visible(slot22.team == slot18)
		slot8.bet1:visible(slot22.team == slot19)
		slot8.betCoin1:visible(slot22.team == slot19)
		slot8.betCoin:get("coin"):text(slot22.num or 0)
		slot8.betCoin1:get("coin"):text(slot22.num or 0)

		if slot22.result and slot22.flag and slot17 == 2 then
			slot8[slot9[slot17]]:hide()
			slot8.award:show()

			slot24 = slot8.award:get("award")

			if slot22.flag == 1 then
				slot24:show()
				slot8.award:get("awardPic"):hide()
				slot24:texture("activity/yybet/icon_dzjc_box2.png"):scale(2)

				if slot22.result == 0 then
					slot24:texture("activity/yybet/icon_dzjc_box2.png"):scale(2)
				elseif slot22.result == 1 or slot22.result == 2 then
					slot24:texture("activity/yybet/icon_dzjc_box1.png"):scale(2)
				end

				widget.addAnimationByKey(slot8.award, "effect/jiedianjiangli.skel", "bgSkel", "effect_loop", 1):scale(0.7):xy(80, 0)
				slot24:setTouchEnabled(true)
				bind.touch(slot2, slot24, {
					methods = {
						ended = functools.partial(slot2.awardBtn, slot4, slot5)
					}
				})
			else
				if slot8.award:get("bgSkel") then
					slot25:removeSelf()
				end

				slot24:hide()
				slot8.award:get("awardPic"):show()
				slot8.award:get("awardPic"):texture(({
					"city/pvp/cross_craft/txt/txt_jcsb.png",
					"city/pvp/cross_craft/txt/txt_jccg.png",
					"city/pvp/cross_craft/txt/txt_jccg.png"
				})[slot22.result + 1]):scale(1)
				slot24:setTouchEnabled(false)
			end

			uiEasy.addVibrateToNode(slot2, slot24, slot22.flag == 1, slot8.award:getName() .. slot4 .. "vibrate")

			if slot22.result == 2 then
				slot7:get("ove"):show()
			else
				slot7:get("ove"):hide()
			end
		end
	else
		slot8.bet:hide()
		slot8.bet1:hide()

		if slot17 == 2 then
			slot8.notBet:show()
		end
	end

	if slot5.result == "win" then
		slot8.imgFlag:texture("city/pvp/craft/icon_win.png")
		slot8.imgFlag1:texture("city/pvp/craft/icon_lose.png")
	elseif slot5.result == "fail" then
		slot8.imgFlag1:texture("city/pvp/craft/icon_win.png")
		slot8.imgFlag:texture("city/pvp/craft/icon_lose.png")
	else
		slot8.imgFlag1:hide()
		slot8.imgFlag:hide()
	end

	uv23 = "tips"

	slot23(slot2, {
		slot8.textName,
		slot8.list
	}, {
		-slot2.deltaWidth / 2,
		-slot2.deltaWidth / 2 + 75
	})

	uv23 = "tips"

	slot23(slot2, {
		slot8.textName1,
		slot8.list1
	}, {
		slot2.deltaWidth / 2,
		slot2.deltaWidth / 2
	})
	adapt.setTextScaleWithWidth(slot8.textName, nil, 400)
	adapt.setTextScaleWithWidth(slot8.textName1, nil, 400)
	adapt.oneLinePos(slot8.textName, {
		slot8.betCoin,
		slot8.bet
	}, {
		cc.p(-420, 0),
		cc.p(-280, 0)
	})
	adapt.oneLinePos(slot8.textName1, {
		slot8.betCoin1,
		slot8.bet1
	}, {
		cc.p(100, 0),
		cc.p(20, 0)
	})
	adapt.oneLineCenterPos(cc.p(1242, 290), {
		slot8.name,
		slot8.time
	}, cc.p(10, 0))
	slot8.imgBG:width(slot2:width() / 2 - slot2.deltaWidth / 4)
	text.addEffect(slot8.name, {
		outline = {
			color = ui.COLORS.OUTLINE.DEFAULT
		}
	})
	text.addEffect(slot8.time, {
		outline = {
			color = ui.COLORS.OUTLINE.DEFAULT
		}
	})
	text.addEffect(slot8.textName, {
		outline = {
			color = ui.COLORS.OUTLINE.DEFAULT
		}
	})
	text.addEffect(slot8.textName1, {
		outline = {
			color = ui.COLORS.OUTLINE.DEFAULT
		}
	})
	text.addEffect(slot8.notBet, {
		outline = {
			color = cc.c4b(85, 73, 96, 255)
		}
	})
	text.addEffect(slot8.battleEnd, {
		outline = {
			size = 4,
			color = cc.c4b(97, 89, 89, 255)
		}
	})
	text.addEffect(slot8.betCoin:get("coin"), {
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	})
	text.addEffect(slot8.betCoin1:get("coin"), {
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	})
	bind.touch(slot2, slot8.btnJump, {
		methods = {
			ended = functools.partial(slot2.clickCell, slot4, slot5)
		}
	})
	bind.touch(slot2, slot8.btnReplay, {
		methods = {
			ended = functools.partial(slot2.playbackBtn, slot4, slot5)
		}
	})
end

function slot6(slot0)
	if slot0.sliderBg:visible() then
		slot1, slot2 = slot0:xy()
		slot3 = slot0:size()
		slot4, slot5 = slot0.sliderBg:xy()
		slot6 = slot0.sliderBg:size()

		slot0:setScrollBarEnabled(true)
		slot0:setScrollBarColor(cc.c3b(241, 59, 84))
		slot0:setScrollBarOpacity(255)
		slot0:setScrollBarAutoHideEnabled(false)
		slot0:setScrollBarPositionFromCorner(cc.p(slot1 + slot3.width - slot4, (slot3.height - slot6.height) / 2 + 15))
		slot0:setScrollBarWidth(slot6.width)
		slot0:refreshView()
	else
		slot0:setScrollBarEnabled(false)
	end
end

slot1.RESOURCE_FILENAME = "yybet_record.json"
slot1.RESOURCE_BINDING = {
	tableItems = "tabItem",
	["goodPanel.item.dataPlane.name"] = "dataName",
	emptyPanel = "emptyPanel",
	infoTxt = "infoTxt",
	["goodPanel.item"] = "item1",
	["goodPanel.item.dataPlane"] = "dataPlane",
	["goodPanel.slider"] = "slider",
	goodPanel = "goodPanel",
	bg = "bg",
	["goodPanel.item.dataPlane.time"] = "dataTime",
	tableList = {
		varname = "tableList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("tabItem"),
				showTab = bindHelper.self("showTab"),
				activityId = bindHelper.self("activityId"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					if slot3.redHint then
						bind.extend(slot0, slot1, {
							class = "red_hint",
							props = {
								state = slot0.showTab:read() ~= slot2,
								listenData = {
									activityId = slot0.activityId,
									type = slot3.type
								},
								specialTag = slot3.redHint,
								onNode = function (slot0)
									uv3 = "xy"
									slot4 = slot3
									uv4 = "xy"

									slot0:xy(slot3.width(slot4), slot4:height())
								end
							}
						})
					end

					slot6:get("txt"):text(slot3.name)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	["goodPanel.list"] = {
		varname = "list1",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("matchData"),
				item = bindHelper.self("item1"),
				deltaWidth = bindHelper.self("deltaWidth"),
				preloadCenterIndex = bindHelper.self("preloadCenterIndex1"),
				sliderBg = bindHelper.self("slider"),
				activityId = bindHelper.self("activityId"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot0:onItemx(slot1, slot2, slot3)
				end,
				onBeforeBuild = function ()
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
				onAfterBuild = function (slot0)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onJumpClick"),
				playbackBtn = bindHelper.self("onPlaybackClick"),
				awardBtn = bindHelper.self("onAwardClick"),
				onItemx = bindHelper.self("onItemx")
			}
		}
	},
	["infoTxt.text"] = {
		varname = "panelText",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["infoTxt.text1"] = {
		varname = "text1",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["infoTxt.win"] = {
		varname = "win",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["infoTxt.failNum"] = {
		varname = "failNum",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["infoTxt.fail"] = {
		varname = "fail",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["infoTxt.info"] = {
		varname = "info",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	}
}

function slot1.gaussianBg(slot0)
	slot1 = display.sizeInView
	slot2 = 0.5

	cache.setShader(slot0.bg, false, "gaussian_blur"):setUniformVec3("iResolution", cc.Vertex3F(slot1.width * slot2, slot1.height * slot2, 0))
end

function slot1.getTeamId(slot0, slot1)
	slot2 = slot0.tools.getCsv("contest")[slot1]

	return slot2.leftTeam, slot2.rightTeam
end

function slot1.initTools(slot0)
	slot0.tools = require("app.views.city.activity.yy_bet.tools")
end

function slot1.onCreate(slot0, slot1, slot2, slot3)
	slot0:initTools()

	slot0.status, slot0.contestId, slot0.data = slot3()

	slot0.tools.createTopui(slot0, slot1)
	slot0:gaussianBg()

	slot0.activityId = slot1
	slot0.once = true

	slot0.bg:texture(slot0.tools.getBgTexture())
	slot0:initModel()
	idlereasy.any({
		slot0.status,
		slot0.yyhuodongs,
		slot0.data
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "result"
		slot4.result = slot3.contests
		uv6 = "result"

		dataEasy.tryCallFunc(slot6.list1, "updatePreloadCenterIndex")
		function ()
			uv0 = "getData"
			uv2 = "activityId"
			uv3 = "getData"
			slot2 = slot2[slot3.activityId].valinfo or {}
			uv3 = "getData"
			uv1 = "getData"
			slot1 = slot0.matchData
			slot2 = slot1

			slot1.update(slot2, slot0.getData(slot1, slot2, slot3.showTab:read()))

			uv2 = "getData"
			slot2 = gGameModel.role
			slot3 = slot2
			uv3 = "getData"
			slot3 = slot3.panelText
			slot4 = slot3
			slot3 = slot3.text

			slot3(slot4, string.format(gLanguageCsv.yyBetPoint, slot2.read(slot3, "items")[csv.yunying.yyhuodong[slot2.activityId].clientParam.coin] or 0))

			uv3 = "activityId"
			uv4 = "getData"
			slot4 = slot4.activityId
			uv4 = "getData"
			slot4 = slot4.text1
			slot4 = slot4.text
			slot8 = slot3[slot4].info.win or 0

			slot4(slot4, string.format(gLanguageCsv.yyBetWin, slot8))

			uv4 = "getData"
			slot4 = slot4.failNum
			slot4 = slot4.text

			slot4(slot4, (slot3.total or 0) - (slot3.win or 0))

			uv4 = "getData"
			slot4 = slot4.info
			slot5 = slot4
			slot7 = gLanguageCsv.yyBetExceed
			uv8 = "valinfo"

			slot4.text(slot5, string.format(slot7, slot8))

			uv5 = "getData"
			uv7 = "getData"
			slot7 = slot7.text1
			uv7 = "getData"
			slot7 = slot7.win
			uv7 = "getData"
			slot7 = slot7.failNum
			uv7 = "getData"
			slot7 = slot7.fail
			uv7 = "getData"

			adapt.oneLinePos(slot5.panelText, {
				slot7,
				slot7,
				slot7,
				slot7,
				slot7.info
			}, {
				cc.p(20, 0),
				cc.p(15, 0),
				cc.p(15, 0),
				cc.p(15, 0),
				cc.p(15, 0)
			})
		end()
	end)
	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "getData"
		slot3 = slot2
		uv4 = "getData"
		slot4 = slot4.yyhuodongs
		slot5 = slot4
		uv5 = "getData"
		slot2 = slot2.getData(slot3, slot4.read(slot5)[slot5.activityId].valinfo or {}, slot0)
		uv3 = "getData"
		slot3 = slot3.matchData
		slot3 = slot3.update

		slot3(slot3, slot2)

		uv3 = "getData"
		slot3 = slot3.tabDatas:atproxy(slot1)
		slot3.select = false
		uv3 = "getData"
		slot3.tabDatas:atproxy(slot0).select = true

		if itertools.isempty(slot2) then
			uv3 = "getData"
			slot3 = slot3.emptyPanel
			slot3 = slot3.show

			slot3(slot3)

			uv3 = "getData"

			slot3.goodPanel:hide()
		else
			uv3 = "getData"
			slot3 = slot3.emptyPanel
			slot3 = slot3.hide

			slot3(slot3)

			uv3 = "getData"

			slot3.goodPanel:show()
		end
	end)

	slot0.deltaWidth = adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.list1,
			"pos",
			"left"
		},
		{
			slot0.list1,
			"width"
		},
		{
			slot0.infoTxt,
			"pos",
			"left"
		},
		{
			slot0.slider,
			"pos",
			"right"
		},
		{
			slot0.tableList,
			"pos",
			"left"
		}
	})

	if not checkLanguage("cn") and not checkLanguage("tw") then
		adapt.oneLinePos(slot0.dataName, slot0.dataTime, cc.p(30, 0))
	end
end

function slot1.initModel(slot0)
	slot0.items = gGameModel.role:read("items")
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.showTab = idler.new(slot0.nowTab or 1)
	slot0.tabDatas = idlers.newWithMap({
		{
			fontSize = 50,
			name = gLanguageCsv.yyBetAllMatch,
			redHint = {
				"battleBet",
				"battleBetAward"
			}
		},
		{
			fontSize = 50,
			redHint = "battleBet",
			name = gLanguageCsv.yyBetOpenMatch
		},
		{
			fontSize = 50,
			redHint = "battleBetAward",
			name = gLanguageCsv.yyBetMyMatch
		}
	})
	slot0.matchData = idlers.new({})
end

function slot1.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot1.getShowContestDate(slot0)
	slot1 = csv.yunying.yyhuodong[slot0.activityId]
	slot5 = time.getTime()
	slot7 = 0

	for slot12, slot13 in ipairs(slot0.tools.getCsv("base")[slot1.paramMap.base].contestIDs) do
		slot14 = slot0.tools.getCsv("contest")[slot13].contestDate
		slot8 = math.max(0, slot14)

		if time.getTimestamp(time.getNowDate(), 0, 0, 0) == time.getNumTimestamp(slot1.beginDate) + (slot14 - 1) * 24 * 3600 then
			slot7 = slot14
		end
	end

	slot9 = false

	for slot13, slot14 in ipairs(slot2.contestIDs) do
		if slot0.tools.getCsv("contest")[slot14].contestDate == slot7 then
			slot16, slot17, slot18 = slot0.tools.getContestBetTime(slot0.activityId, slot14)

			if slot5 < slot18 then
				slot9 = true

				break
			end
		end
	end

	if not slot9 then
		slot7 = math.min(slot8, slot7 + 1)
	end

	return slot7
end

function slot1.getData(slot0, slot1, slot2)
	slot5 = time.getTime()
	slot6 = {}
	slot7 = slot0:getShowContestDate()

	for slot11, slot12 in ipairs(slot0.tools.getCsv("base")[csv.yunying.yyhuodong[slot0.activityId].paramMap.base].contestIDs) do
		slot14, slot15, slot16 = slot0.tools.getContestBetTime(slot0.activityId, slot12)
		slot17 = slot1[slot12]
		slot18 = slot0.result[slot12] or {}
		slot19 = false

		if #slot6 == 0 or slot0.tools.getCsv("contest")[slot12].contestDate ~= slot0.tools.getCsv("contest")[slot6[#slot6].csvId].contestDate then
			slot19 = true
		end

		uv21 = "csv"

		if slot2 == slot18.battle_id.all then
			slot21, slot22 = slot0.tools.getNextContestAndState(slot0.activityId)

			if slot22 == 3 then
				table.insert(slot6, {
					activityid = slot0.activityId,
					csvId = slot12,
					betInfo = slot1[slot12],
					result = slot18.result,
					showDate = slot19,
					battleId = slot21
				})
			elseif slot0.tools.getCsv("contest")[slot12].contestDate <= slot7 then
				table.insert(slot6, slot20)
			end
		else
			uv21 = "csv"

			if slot2 == slot21.open and slot14 < slot5 and slot5 < slot15 then
				table.insert(slot6, slot20)
			else
				uv21 = "csv"

				if slot2 == slot21.mine and not itertools.isempty(slot17) then
					table.insert(slot6, slot20)
				end
			end
		end
	end

	return slot6
end

function slot1.onPlaybackClick(slot0, slot1, slot2, slot3)
	gGameModel:playRecordBattle(slot3.battleId, slot3.csvId, slot0.tools.getProtocol("playback"), 0, nil)
end

function slot1.onJumpClick(slot0, slot1, slot2, slot3)
	gGameApp:requestServer(slot0.tools.getProtocol("contest"), function (slot0)
		uv6 = "gGameUI"
		uv8 = "gGameUI"
		uv11 = "stackUI"

		gGameUI:stackUI("city.activity.yy_bet.bet_view", nil, {
			full = true
		}, slot6.activityId, slot0.view, slot8:createHandler("getWiner", slot11.csvId))
	end, slot0.activityId, slot3.csvId)
end

function slot1.onAwardClick(slot0, slot1, slot2, slot3)
	gGameApp:requestServer(slot0.tools.getProtocol("award"), function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, 1, slot3.csvId)
end

function slot1.getWiner(slot0, slot1)
	if ((slot0.result or {})[slot1] or {}).result == "win" then
		return 1
	elseif slot4 == "fail" then
		return 2
	end
end

function slot1.onCleanup(slot0)
	if slot0.list1:getCenterItemInCurrentView() then
		slot0.preloadCenterIndex1 = slot0.list1:getIndex(slot1) + 1
	end

	slot2 = slot0.showTab:read()
	slot0.nowTab = slot2
	uv2 = "list1"

	slot2.onCleanup(slot0)
end

function slot1.getItemRedHintTag(slot0)
	return "battleBet"
end

return slot1
