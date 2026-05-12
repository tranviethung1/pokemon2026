slot0 = 11
slot1 = class("ElementCrushView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "element_crush.json"
slot1.RESOURCE_BINDING = {
	gameOverPanel = "gameOverPanel",
	openBtn = "openBtn",
	movePanle = "movePanle",
	bg = "bg",
	anima = "anima",
	btnRank = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnRank")
			}
		}
	},
	btnRankReward = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("btnRankReward")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "elementCrush",
					listenData = {
						rankReward = true,
						activityId = bindHelper.self("id")
					},
					onNode = function (slot0)
						slot0:xy(180, 200)
					end
				}
			}
		}
	},
	btnShop = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnShop")
			}
		}
	},
	btnRule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRules")
			}
		}
	},
	["btnRank.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(55, 52, 49, 255)
				}
			}
		}
	},
	["btnRankReward.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(55, 52, 49, 255)
				}
			}
		}
	},
	["btnShop.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(55, 52, 49, 255)
				}
			}
		}
	},
	["btnRule.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(55, 52, 49, 255)
				}
			}
		}
	},
	score = {
		varname = "score",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	scoreNum = {
		varname = "scoreNum",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	physicalPower = {
		varname = "physicalPower",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	physicalPowerNum = {
		varname = "physicalPowerNum",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	myTime = {
		varname = "myTime",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "ASSIGNTMENT",
		title = gLanguageCsv.eliminateToLe
	})

	slot0.activityId = slot1
	slot0.id = idler.new(slot1)
	slot0.huodongId = csv.yunying.yyhuodong[slot1].huodongID

	slot0:enableSchedule()
	slot0:initModel()
	idlereasy.when(slot0.yyhuodongs, function ()
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
	slot0:ctorCsvData()
	slot0:activityTime()

	if nil ~= -1 then
		slot0:uiShowEffect()
	else
		slot0.bg:show()
	end

	slot0.openBtnY = slot0.openBtn:get("icon"):y()

	slot0.openBtn:onTouch(functools.partial(slot0.openPlayingBtn, slot0))
	bind.extend(slot0, slot0.openBtn, {
		class = "red_hint",
		props = {
			listenData = {
				energy = true,
				activityId = slot1
			},
			specialTag = {
				"elementCrush"
			},
			onNode = function (slot0)
				slot0:xy(385, 235)
			end
		}
	})
end

function slot1.ctorCsvData(slot0)
	slot1 = {}

	for slot5, slot6 in orderCsvPairs(csv.yunying.element_crush_rank) do
		if slot0.huodongId == slot6.huodongID then
			table.insert(slot1, slot6)
		end
	end

	slot0.rankAward = slot1
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyEndtime = gGameModel.role:read("yy_endtime")
end

function slot1.activityTime(slot0)
	uv3 = "unSchedule"

	slot0:unSchedule(slot3)

	slot1 = 0

	if slot0.yyEndtime[slot0.activityId] then
		slot1 = slot0.yyEndtime[slot0.activityId] - time.getTime()
	end

	uv7 = "unSchedule"

	slot0:schedule(function ()
		uv0 = "time"
		slot0 = slot0 - 1
		uv0 = 1
		uv1 = "time"
		uv1 = "getCutDown"
		slot1 = slot1.myTime
		slot2 = slot1

		slot1.text(slot2, string.format(gLanguageCsv.horseRaceEndTime, time.getCutDown(slot1, true).str))

		slot1 = text.addEffect
		uv2 = "getCutDown"

		slot1(slot2.myTime, {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})

		uv1 = "time"

		if slot1 <= 0 then
			uv1 = "getCutDown"
			slot2 = slot1
			uv3 = "str"

			slot1.unSchedule(slot2, slot3)

			uv2 = "getCutDown"

			Dialog.onClose(slot2)

			return false
		end
	end, 1, 0, slot7)
end

function slot1.uiShowEffect(slot0)
	slot1, slot2 = slot0.openBtn:xy()
	slot3 = cc.Sprite:create("activity/element_crush/img_xxl_jt.png")

	slot3:setPosition(slot1 - 50, slot2 + 200)
	slot0:getResourceNode():addChild(slot3, 10, "jiantou")
	slot3:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveBy:create(0.6, cc.p(100, 0)), cc.MoveBy:create(0.6, cc.p(-100, 0)))))
	widget.addAnimation(slot0:getResourceNode(), "element/pingmu.skel", "pingmu", 2):xy(display.sizeInView.width / 2, display.sizeInView.height / 2):scale(2.1):setSpriteEventHandler(function (slot0, slot1)
		uv2 = "bg"
		slot2 = slot2.bg
		slot2 = slot2.show

		slot2(slot2)

		uv2 = "bg"

		slot2:playElimentAnimation()
	end, sp.EventType.ANIMATION_COMPLETE)
end

function slot1.playElimentAnimation(slot0)
	for slot4 = 1, 5 do
		slot6 = slot4 % 2 == 1 and -80 or 80

		slot0.movePanle:get("icon" .. slot4):runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveBy:create(1.5, cc.p(0, slot6)), cc.MoveBy:create(1.5, cc.p(0, -slot6)))))
	end

	function slot1(slot0, slot1, slot2, slot3)
		slot0:show()
		slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveBy:create(slot2 * 0.5, cc.p(slot2 * 200, 0)), cc.CallFunc:create(function ()
			uv1 = "math"

			if math.abs(slot1) == 2 then
				uv0 = "abs"
				uv2 = "math"

				slot0:scaleX(-slot2)
			end
		end), cc.DelayTime:create(slot3), cc.MoveBy:create(slot2 * 0.5, cc.p(-slot2 * 200, 0)), cc.CallFunc:create(function ()
			uv1 = "math"

			if math.abs(slot1) == 2 then
				uv0 = "abs"
				uv2 = "math"

				slot0:scaleX(slot2)
			end
		end), cc.DelayTime:create(slot3))))
	end

	slot1(slot0.movePanle, 1, 14, 2.5)
	slot1(widget.addAnimationByKey(slot0.anima, csv.unit[50021].unitRes, "run_loop", "run_loop", 5):scale(2):xy(-900, 80), 2, 19, 0)
end

function slot1.gameOver(slot0)
	if slot0:getResourceNode():get("jiantou") then
		slot0:getResourceNode():get("jiantou"):removeSelf()
	end

	slot0.anima:removeAllChildren()
	slot0.movePanle:stopAllActions()

	for slot4 = 1, 5 do
		slot0.movePanle:get("icon" .. slot4):stopAllActions()
	end

	slot0:initOpenPlayingIcon()
	slot0.openBtn:get("icon"):hide()
	uiEasy.setBtnShader(slot0.openBtn, false, 2)

	if slot0.openBtn:getChildByName("_sweepPanel_") then
		slot0.openBtn:getChildByName("_sweepPanel_"):removeSelf()
	end

	slot0.physicalPower:hide()
	slot0.physicalPowerNum:hide()
	adapt.oneLineCenterPos(cc.p(display.sizeInView.width / 2, display.sizeInView.height / 2 - 50), {
		slot0.score,
		slot0.scoreNum
	})
	slot0.gameOverPanel:show()
	text.addEffect(slot0.gameOverPanel:get("title"), {
		outline = {
			size = 8,
			color = ui.COLORS.NORMAL.DEFAULT
		}
	})
end

function slot1.btnRank(slot0)
	gGameApp:requestServer("/game/yy/element_crush/rank", function (slot0)
		gGameUI:stackUI("city.activity.element_crush.rank", nil, , slot0.view)
	end, slot0.activityId)
end

function slot1.btnRankReward(slot0)
	gGameUI:stackUI("city.activity.element_crush.rank_reward", nil, , slot0.activityId)
end

function slot1.btnShop(slot0)
	gGameUI:stackUI("city.activity.element_crush.shop", nil, , slot0.activityId)
end

function slot1.openPlayingBtn(slot0, slot1)
	slot2 = slot0.openBtn:convertToNodeSpace(cc.p(slot1.x, slot1.y))

	if slot1.name == "began" then
		slot0.openBtn:get("icon"):y(slot0.openBtnY - 40)
	elseif slot1.name == "moved" then
		if slot2.x > 0 and slot2.x < slot0.openBtn:width() and slot2.y > 0 and slot2.y < slot0.openBtn:height() then
			slot0.openBtn:get("icon"):y(slot0.openBtnY - 40)
		else
			slot0.openBtn:get("icon"):y(slot0.openBtnY)
		end
	elseif slot1.name == "cancelled" then
		slot0.openBtn:get("icon"):y(slot0.openBtnY)
	elseif slot1.name == "ended" then
		slot0.openBtn:get("icon"):y(slot0.openBtnY)
		gGameUI:stackUI("city.activity.element_crush.element", nil, , slot0.activityId, slot0:createHandler("initOpenPlayingIcon"))
	end
end

function slot1.onRules(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext
	slot3 = {
		slot2.noteText(127310),
		slot2.noteText(127311, 127320),
		slot2.noteText(103)
	}

	for slot7, slot8 in ipairs(slot0.rankAward) do
		table.insert(slot3, slot2.clone(slot1.awardItem, function (slot0)
			slot2 = slot0
			slot3 = "text"
			uv2 = "multiget"
			uv3 = "text"

			if slot2.rankAward[slot3 + 1] then
				uv2 = "multiget"
				uv3 = "text"
				slot3 = slot3 + 1
				uv3 = "list"

				if slot2.rankAward[slot3].rankMax - slot3.rankMax == 1 then
					uv6 = "list"

					slot0.multiget(slot2, slot3, "list").text:text(string.format(gLanguageCsv.rankSingle, slot6.rankMax))
				else
					uv2 = "list"
					uv3 = "multiget"
					uv4 = "text"

					if slot2.rankMax - slot3.rankAward[slot4 - 1].rankMax == 1 then
						uv6 = "list"

						slot1.text:text(string.format(gLanguageCsv.rankSingle, slot6.rankMax))
					else
						uv6 = "multiget"
						uv7 = "text"
						slot7 = slot7 - 1
						uv7 = "list"

						slot1.text:text(string.format(gLanguageCsv.rankMulti, slot6.rankAward[slot7].rankMax + 1, slot7.rankMax))
					end
				end
			else
				uv6 = "multiget"
				uv7 = "text"
				slot7 = slot7 - 1
				uv7 = "list"

				slot1.text:text(string.format(gLanguageCsv.rankMulti, slot6.rankAward[slot7].rankMax + 1, slot7.rankMax))
			end

			uv3 = "rankAward"
			uv5 = "list"

			uiEasy.createItemsToList(slot3, slot1.list, slot5.award)
		end))
	end

	return slot3
end

function slot1.initOpenPlayingIcon(slot0)
	slot0.openBtn:get("icon"):y(slot0.openBtnY)
end

return slot1
