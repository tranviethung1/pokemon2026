slot0 = class("GymBattleDetail", Dialog)

function slot1(slot0, slot1, slot2, slot3)
	if not slot3.card_id then
		slot1:get("emptyPanel"):show()

		return
	end

	slot1:get("emptyPanel"):hide()
	bind.extend(slot0, slot1, {
		class = "card_icon",
		props = {
			unitId = dataEasy.getUnitId(slot3.card_id, slot3.skin_id),
			advance = slot3.advance,
			rarity = slot3.rarity,
			star = slot3.star,
			levelProps = {
				data = slot3.level
			},
			onNode = function (slot0)
				slot0:xy(0, -6):scale(0.8)
			end
		}
	})
end

slot0.RESOURCE_FILENAME = "gym_battle_detail.json"
slot0.RESOURCE_BINDING = {
	["right.imgBg.imgBuf"] = "imgBuf2",
	item = "item",
	["left.imgBg.imgBuf"] = "imgBuf1",
	["left.imgBg.btnWeather"] = "btnWeather1",
	left = "left",
	["imgBG.img"] = "img",
	["right.imgBg.btnWeather"] = "btnWeather2",
	right = "right",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["left.textLv"] = {
		varname = "textLvL",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["left.textNote3"] = {
		varname = "textNote3L",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["right.textLv"] = {
		varname = "textLvR",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["right.textNote3"] = {
		varname = "textNote3R",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["left.list1"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 3,
				data = bindHelper.self("team1"),
				item = bindHelper.self("item"),
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
		}
	},
	["left.list2"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 3,
				data = bindHelper.self("team2"),
				item = bindHelper.self("item"),
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
		}
	},
	["right.list1"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 3,
				data = bindHelper.self("team3"),
				item = bindHelper.self("item"),
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
		}
	},
	["right.list2"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 3,
				data = bindHelper.self("team4"),
				item = bindHelper.self("item"),
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
		}
	},
	["imgBG.btnReplay"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReplay")
			}
		}
	},
	["imgBG.btnReplay.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(254, 253, 236, 255)
				}
			}
		}
	},
	["left.head"] = {
		binds = {
			event = "extend",
			class = "role_logo",
			props = {
				vip = false,
				level = false,
				logoId = bindHelper.self("logoId1"),
				frameId = bindHelper.self("frameId1"),
				onNode = function (slot0)
					slot0:scale(1.2)
				end
			}
		}
	},
	["right.head"] = {
		binds = {
			event = "extend",
			class = "role_logo",
			props = {
				vip = false,
				level = false,
				logoId = bindHelper.self("logoId2"),
				frameId = bindHelper.self("frameId2"),
				onNode = function (slot0)
					slot0:scale(1.2)
				end
			}
		}
	},
	["left.textName"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("name1")
		}
	},
	["right.textName"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("name2")
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.data = slot1

	Dialog.onCreate(slot0)
	slot0:initRole(slot1)
	slot0:initCardData(slot1)

	slot0.recordID = slot1.play_record_id
	slot0.crossKey = slot1.cross_key
end

function slot0.initRole(slot0, slot1)
	slot0.logoId1 = idler.new(slot1.logo)
	slot0.logoId2 = idler.new(slot1.defence_logo)
	slot0.frameId1 = idler.new(slot1.frame)
	slot0.frameId2 = idler.new(slot1.defence_frame)
	slot0.name1 = idler.new(slot1.name)
	slot0.name2 = idler.new(slot1.defence_name)

	slot0.left:get("textLv"):text(slot1.level)
	adapt.oneLineCenterPos(cc.p(250, 543), {
		slot0.left:get("textNote3"),
		slot0.left:get("textLv")
	}, cc.p(2, 3))
	slot0.right:get("textLv"):text(slot1.defence_level)
	adapt.oneLineCenterPos(cc.p(250, 543), {
		slot0.right:get("textNote3"),
		slot0.right:get("textLv")
	}, cc.p(2, 3))

	if slot1.role_key ~= "" then
		slot0.left:get("textService"):text(getServerArea(slot1.role_key))
	else
		slot0.left:get("textService"):hide()
	end

	if slot1.defence_role_key ~= "" then
		slot0.right:get("textService"):text(getServerArea(slot1.defence_role_key))
	else
		slot0.right:get("textService"):hide()
	end

	if gGameModel.role:read("id") == slot1.role_id and slot1.result == "win" or slot2 ~= slot1.role_id and slot1.result ~= "win" then
		slot0.left:get("head.imgResult"):texture("city/pvp/craft/icon_win.png")
		slot0.right:get("head.imgResult"):texture("city/pvp/craft/icon_lose.png")
		slot0.img:texture("city/adventure/gym_challenge/bg_1.png")
	else
		slot0.right:get("head.imgResult"):texture("city/pvp/craft/icon_win.png")
		slot0.left:get("head.imgResult"):texture("city/pvp/craft/icon_lose.png")
		slot0.img:texture("city/adventure/gym_challenge/bg_2.png")
	end

	if matchLanguage({
		"en"
	}) then
		adapt.setAutoText(slot0.left:get("textNote1"), nil, 120)
		adapt.setAutoText(slot0.left:get("textNote2"), nil, 120)
		adapt.setAutoText(slot0.right:get("textNote1"), nil, 120)
		adapt.setAutoText(slot0.right:get("textNote2"), nil, 120)
	end
end

function slot0.initCardData(slot0, slot1)
	slot2 = table.deepcopy(slot1.extra or {}, true)
	slot3 = table.deepcopy(slot1.defence_extra or {}, true)
	slot4 = {
		slot2.weather or 0,
		slot3.weather or 0
	}
	slot5 = {
		slot2.arms,
		slot3.arms
	}

	if slot0.btnWeather1 then
		for slot9 = 1, 2 do
			if slot4[slot9] == 0 then
				slot0["btnWeather" .. slot9]:hide()
			else
				slot10:show():scale(0.8)
				slot10:get("icon"):texture(csv.weather_system.weather[slot4[slot9]].iconRes)
			end
		end
	end

	slot0.team1 = {}
	slot0.team2 = {}
	slot0.team3 = {}
	slot0.team4 = {}
	slot6 = {
		[slot13] = slot14
	}
	slot7 = {}

	for slot13 = 1, 6 do
		if slot13 <= 3 then
			if slot1.cards[slot13] then
				slot15 = table.shallowcopy(slot1.card_attrs[slot14])
				slot0.team1[slot13] = slot15
				slot0.team1[slot13].rarity = csv.unit[csv.cards[slot15.card_id].unitID].rarity
			else
				slot0.team1[slot13] = {}
			end

			if slot1.defence_cards[slot13] then
				slot16 = table.shallowcopy(slot1.defence_card_attrs[slot15])
				slot0.team3[slot13] = slot16
				slot0.team3[slot13].rarity = slot8[slot9[slot16.card_id].unitID].rarity
				slot7[slot13] = slot15
			else
				slot0.team3[slot13] = {}
			end
		else
			if slot1.cards[slot13] then
				slot15 = table.shallowcopy(slot1.card_attrs[slot14])
				slot0.team2[slot13 - 3] = slot15
				slot0.team2[slot13 - 3].rarity = slot8[slot9[slot15.card_id].unitID].rarity
				slot6[slot13] = slot14
			else
				slot0.team2[slot13 - 3] = {}
			end

			if slot1.defence_cards[slot13] then
				slot16 = table.shallowcopy(slot1.defence_card_attrs[slot15])
				slot0.team4[slot13 - 3] = slot16
				slot0.team4[slot13 - 3].rarity = slot8[slot9[slot16.card_id].unitID].rarity
				slot7[slot13] = slot15
			else
				slot0.team4[slot13 - 3] = {}
			end
		end
	end

	for slot14 = 1, 3 do
		slot10 = 0 + (slot0.team1[slot14].fighting_point or 0) + (slot0.team2[slot14].fighting_point or 0)
	end

	for slot15 = 1, 3 do
		slot11 = 0 + (slot0.team3[slot15].fighting_point or 0) + (slot0.team4[slot15].fighting_point or 0)
	end

	slot0.left:get("imgBg.textZl"):text(slot10)
	slot0.right:get("imgBg.textZl"):text(slot11)
	bind.extend(slot0, slot0.imgBuf1, {
		class = "buff_arms",
		props = {
			noListener = true,
			battleCards = slot6,
			arms = slot5[1],
			getCardAttrsEx = functools.partial(slot0.getCardAttrs, slot0),
			enemyData = slot1.name ~= gGameModel.role:read("name"),
			onNode = function (slot0)
				slot0:scale(0.6)
			end
		}
	})
	bind.extend(slot0, slot0.imgBuf2, {
		class = "buff_arms",
		props = {
			noListener = true,
			battleCards = slot7,
			arms = slot5[2],
			getCardAttrsEx = functools.partial(slot0.getCardAttrs, slot0),
			enemyData = slot1.defence_name ~= gGameModel.role:read("name"),
			onNode = function (slot0)
				slot0:scale(0.6)
			end
		}
	})
	adapt.oneLinePos(slot0.left:get("imgBg.textZl"), {
		slot0.imgBuf1,
		slot0.btnWeather1
	}, {
		cc.p(15, 0),
		cc.p(0, 10)
	})
	adapt.oneLinePos(slot0.right:get("imgBg.textZl"), {
		slot0.imgBuf2,
		slot0.btnWeather2
	}, {
		cc.p(15, 0),
		cc.p(0, 10)
	})
end

function slot0.onReplay(slot0)
	gGameModel:playRecordBattle(slot0.recordID, slot0.crossKey, "/game/gym/playrecord/get", 0, nil)
end

function slot0.getCardAttrs(slot0, slot1)
	if slot1 then
		slot3 = slot0.data.defence_card_attrs[slot1]

		if slot0.data.card_attrs[slot1] then
			return {
				card_id = slot2.card_id
			}
		end

		if slot3 then
			return {
				card_id = slot3.card_id
			}
		end
	end

	return nil
end

return slot0
