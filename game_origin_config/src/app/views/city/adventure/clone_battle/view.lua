slot1 = class("CloneBattleCityView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "clone_battle_city.json"
slot1.RESOURCE_BINDING = {
	["mainPanel.natureItem"] = "natureItem",
	["mainPanel.showItem"] = "showItem",
	["cdPanel.textTime"] = "textCd",
	allPanel = "allPanel",
	txt = "kickTxt",
	["cdPanel.textNote"] = "timeNote",
	kickBg = "kickBg",
	text = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	btnRule = {
		varname = "btnRule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleShow")
			}
		}
	},
	["btnRule.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				},
				glow = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	btnShowList = {
		varname = "btnShowList",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("showSprList")
			}
		}
	},
	["btnShowList.text"] = {
		varname = "txtBtnShowList",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				},
				glow = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	mainPanel = {
		varname = "mainPanel",
		binds = {
			event = "click",
			method = bindHelper.self("onSpaceClick")
		}
	},
	["mainPanel.natureItem.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["mainPanel.showItem.btnRoom"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCreateRoom")
			}
		}
	},
	["mainPanel.showItem.btnJoin"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onFastJoin")
			}
		}
	},
	["mainPanel.showItem.btnRoom.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["mainPanel.showItem.btnJoin.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["mainPanel.showItem.spr1.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["mainPanel.showItem.spr2.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["mainPanel.showItem.spr3.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	}
}
slot2 = "effect2_%s_loop"
slot3 = "effect_%s_loop"

function slot1.onCreate(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.curItemIdx = nil
	slot0.baseView = slot2
	slot0.kickNum = gGameModel.role:read("clone_daily_be_kicked_num")

	userDefault.setForeverLocalKey("cloneBattleBeKickedNum", slot0.kickNum, {
		new = true
	})

	if slot0.data.beKicked and slot0.kickNum < gCommonConfigCsv.cloneDailyBeKickedMax and userDefault.getForeverLocalKey("cloneBattleBeKickedNum", 0) < slot0.kickNum then
		gGameUI:showDialog({
			btnType = 1,
			title = "",
			isRich = true,
			content = string.format("#C0x5b545b#" .. gLanguageCsv.cloneBattleRecord8, gCommonConfigCsv.cloneDailyBeKickedMax - slot0.kickNum)
		})
	end

	slot0.pokedex = gGameModel.role:getIdler("pokedex")

	slot0.txtBtnShowList:getVirtualRenderer():setLineSpacing(-15)
	slot0.txtBtnShowList:y(slot0.txtBtnShowList:y() + 10)
	idlereasy.when(slot0.pokedex, function (slot0, slot1)
		for slot6, slot7 in pairs(slot1) do
			-- Nothing
		end

		uv3 = "pairs"
		slot3.pokedexMarks = {
			[csv.cards[slot6].cardMarkID] = true
		}
	end)

	slot4 = {}

	for slot8, slot9 in pairs(slot1.nature) do
		for slot14, slot15 in pairs(slot9[2]) do
			slot19 = csv.cards[csv.clone.monster[slot15].cardID].cardMarkID
		end

		slot4[slot8] = {
			natureId = slot9[1],
			spriteTb = {
				[slot14] = {
					cardId = slot16,
					unitId = slot18,
					markId = slot19,
					config = csv.unit[slot17.unitID] or csv.unit[1],
					inBox = slot0.pokedexMarks[slot19]
				}
			}
		}
	end

	slot0.natureMap = slot4

	slot0:initNatureItem()
	slot0:initCountDown()
	slot0:showKickTip()
end

function slot1.showKickTip(slot0)
	if slot0.kickNum and gCommonConfigCsv.cloneDailyBeKickedMax <= slot0.kickNum then
		slot1 = ccui.Layout:create()

		slot1:size(display.sizeInView)
		slot1:xy(display.board_left, 0)
		slot1:addTo(slot0.allPanel, 1, "__black_layer__")
		slot1:setBackGroundColorType(1)
		slot1:setBackGroundColor(cc.c3b(91, 84, 91))
		slot1:setBackGroundColorOpacity(0)
		slot1:setBackGroundColorOpacity(204)
		slot0.allPanel:show()
		slot0.kickBg:show()
		slot0.kickTxt:text(gLanguageCsv.cloneBattleRecord9)
	else
		slot0.allPanel:hide()
		slot0.kickBg:hide()
		slot0.kickTxt:hide()
	end
end

function slot1.onSpaceClick(slot0)
	slot0.showItem:hide()

	slot0.curItemIdx = nil

	if slot0.aniTb then
		uv5 = "showItem"

		slot0.aniTb.ani:play(string.format(slot5, slot0.aniTb.natureId))

		slot0.aniTb = nil

		slot0.baseView:playBgAni(nil)
	end
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	slot4 = slot0.showItem
	slot5 = slot1:size()

	slot4:retain()
	slot4:removeFromParent()
	slot1:add(slot4, 999)
	slot4:xy(slot5.width / 2, slot5.height / 2 - 50)
	slot4:show()

	for slot11 = 1, 3 do
		slot4:multiget("spr1", "spr2", "spr3")["spr" .. slot11]:visible(slot3.spriteTb[slot11] and true or false)

		if slot12 then
			slot13:get("img"):texture(slot12.config.iconSimple)

			slot15 = slot12.inBox and "normal" or "hsl_gray"

			if slot12.inBox then
				slot7 = 0 + 1
			end

			cache.setShader(slot14, false, slot15)
			cache.setShader(slot13, false, slot15)
			slot13:get("text"):text(slot12.config.name)
		end
	end

	slot0.curItemCount = slot7
	slot0.curItemIdx = slot2

	if slot0.aniTb then
		uv11 = "showItem"

		slot0.aniTb.ani:play(string.format(slot11, slot0.aniTb.natureId))
	end

	slot0.aniTb = slot1.aniTb
	uv11 = "size"

	slot0.aniTb.ani:play(string.format(slot11, slot0.aniTb.natureId))
	slot0.baseView:playBgAni(slot0.aniTb.natureId)
end

function slot1.onCreateRoom(slot0)
	if not slot0.curItemCount or slot0.curItemCount <= 0 then
		gGameUI:showTip(gLanguageCsv.noNature)

		return
	end

	gGameApp:requestServer("/game/clone/room/create", function (slot0)
		uv1 = "baseView"

		slot1.baseView:refreshView()
	end, slot0.natureMap[slot0.curItemIdx].natureId)
end

function slot1.onFastJoin(slot0)
	if not slot0.curItemCount or slot0.curItemCount <= 0 then
		gGameUI:showTip(gLanguageCsv.noNature)

		return
	end

	gGameApp:requestServer("/game/clone/room/join/fast", function (slot0)
		uv1 = "baseView"

		slot1.baseView:refreshView()
	end, slot0.natureMap[slot0.curItemIdx].natureId)
end

slot4 = {
	cc.p(680, 770),
	cc.p(1890, 780),
	cc.p(520, 355),
	cc.p(2080, 365),
	cc.p(1280, 610)
}

function slot1.initNatureItem(slot0)
	uv1 = "pairs"
	uv3 = "pairs"

	for slot5, slot6 in pairs(slot3) do
		slot7 = slot0.natureItem:clone()

		slot0.mainPanel:add(slot7, #slot1 - slot5)
		slot7:xy(slot6)

		if slot0.natureMap[slot5] then
			slot9 = slot8.natureId
			uv17 = "natureItem"
			slot7.aniTb = {
				ani = widget.addAnimation(slot7, csv.clone.nature[slot8.natureId].spine, string.format(slot17, slot9), 1):scale(slot5 <= 2 and 1.74 or 2):xy(slot7:size().width / 2, 10),
				natureId = slot9
			}
			slot14 = slot7:get("text")

			slot14:text(gLanguageCsv[game.NATURE_TABLE[slot9]] .. gLanguageCsv.talentElement)
			text.addEffect(slot14, {
				color = ui.COLORS.ATTR[slot9]
			})
			bind.touch(slot0, slot7, {
				methods = {
					ended = functools.partial(slot0.onItemClick, slot0, slot7, slot5, slot8)
				}
			})
		else
			slot7:hide()
		end
	end
end

function slot1.showSprList(slot0)
	slot1, slot2 = slot0.btnShowList:xy()

	gGameUI:stackUI("city.adventure.clone_battle.spr_list", nil, , slot0.natureMap, slot1, slot2)
end

function slot1.onRuleShow(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.cloneBattleRuleTitle)
		end),
		slot2.noteText(111),
		slot2.noteText(62001, 62010)
	}
end

function slot1.initCountDown(slot0)
	slot1 = slot0.textCd
	slot3 = time.getNumTimestamp(time.getTodayStrInClock(12), 12) + 86400

	function slot4()
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

return slot1
