slot0 = {
	"powerList",
	"collectList",
	"arenaList",
	"kingList",
	"unionList",
	"activityList",
	"craftList",
	"gateStarList"
}

function slot1(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1:multiget("img", "num", "name", "iconBg", "level", "bg", "txt")

	slot5.name:text(slot3.name)
	bind.extend(slot0, slot5.iconBg, {
		event = "extend",
		class = "role_logo",
		props = {
			vip = false,
			level = false,
			logoId = slot3.logo,
			frameId = slot3.frame,
			onNode = function (slot0)
				slot0:xy(104, 95):z(6):scale(0.9)
			end
		}
	})
	slot5.level:text(slot3.level)
	adapt.oneLinePos(slot5.txt, slot5.level)

	slot7 = slot4 or slot2

	slot5.img:visible(slot7 <= 3)
	slot5.num:visible(slot7 > 3)
	slot5.num:text(slot7)

	if slot7 <= 3 then
		slot5.img:texture(ui.RANK_ICON[slot7])
	end

	slot5.iconBg:setTouchEnabled(false)
	slot5.bg:setTouchEnabled(true)
	slot5.bg:onClick(functools.partial(slot0.clickHead, slot2, slot3, slot7))
end

slot3 = class("RankView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "rank.json"
slot3.RESOURCE_BINDING = {
	["leftPanel.item"] = "leftItem",
	["rightPanel.bottomPanel.txtName"] = "myName",
	["rightPanel.topPanelCollect"] = "topPanelCollect",
	["rightPanel.topPanelUnion"] = "topPanelUnion",
	itemCollect = "itemCollect",
	["rightPanel.bottomPanel"] = "bottomPanel",
	["rightPanel.bottomPanelCraft"] = "bottomPanelCraft",
	["rightPanel.topPanelFight"] = "topPanelFight",
	["rightPanel.bottomPanel.txtRank"] = "myRanking",
	["rightPanel.bottomPanelCollect"] = "bottomPanelCollect",
	["rightPanel.bottomPanelUnion"] = "bottomPanelUnion",
	["rightPanel.bottomPanelGateStar"] = "bottomPanelGateStar",
	itemGateStar = "itemGateStar",
	["rightPanel.topPanelCraft"] = "topPanelCraft",
	itemFight = "itemFight",
	leftPanel = "leftPanel",
	["rightPanel.topPanel"] = "topPanel",
	itemUnion = "itemUnion",
	itemCraft = "itemCraft",
	["rightPanel.bottomPanelFight"] = "bottomPanelFight",
	["rightPanel.bottomPanel.txtStatic1"] = "txtStatic1",
	["rightPanel.topPanelGateStar"] = "topPanelGateStar",
	rightPanel = "rightPanel",
	["leftPanel.list"] = {
		varname = "leftList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("leftDatas"),
				item = bindHelper.self("leftItem"),
				dataOrderCmp = function (slot0, slot1)
					return slot0.sortValue < slot1.sortValue
				end,
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()
						slot4:show():get("subTxt"):text(slot3.subName)
					end

					if matchLanguage({
						"en"
					}) then
						slot1:get("normal"):get("subTxt"):hide()
						slot1:get("normal"):get("txt"):y(slot1:height() / 2 - 2)
					end

					slot6:get("txt"):text(slot3.name)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
					adapt.setTextScaleWithWidth(slot6:get("txt"), nil, 300)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	["rightPanel.powerList"] = {
		varname = "powerList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData1"),
				item = bindHelper.self("itemFight"),
				scrollState = bindHelper.self("scrollState"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					uv4 = "role"

					slot4(slot0, slot1, slot2, slot3.role)

					slot4 = slot1:get("item1")

					slot4:hide()
					slot1:get("power"):text(slot3.fighting_point)
					bind.extend(slot0, slot1:get("list"), {
						class = "listview",
						props = {
							data = arraytools.filter(slot3.top6_cards, function (slot0, slot1)
								if slot1 and slot1.card_id ~= 0 then
									return true
								end
							end),
							item = slot4,
							onItem = function (slot0, slot1, slot2, slot3)
								slot1:get("level"):text(gLanguageCsv.textLv .. slot3.level)
								slot1:get("icon"):texture(dataEasy.getUnitCsv(slot3.card_id, slot3.skin_id).iconSimple)
							end
						}
					})
				end
			},
			handlers = {
				clickHead = bindHelper.self("onHeadClick")
			}
		}
	},
	["rightPanel.collectList"] = {
		varname = "collectList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData2"),
				item = bindHelper.self("itemCollect"),
				scrollState = bindHelper.self("scrollState"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					uv4 = "role"

					slot4(slot0, slot1, slot2, slot3.role, slot3.index)

					slot4 = slot1:multiget("txtCollect", "txtUnlock")

					slot4.txtCollect:text(string.format("%.1f%%", slot3.pokedex * 100 / table.length(gHandbookArrayCsv)))
					slot4.txtUnlock:text(slot3.pokedex)
				end
			},
			handlers = {
				clickHead = bindHelper.self("onHeadClick")
			}
		}
	},
	["rightPanel.craftList"] = {
		varname = "craftList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData7"),
				item = bindHelper.self("itemCraft"),
				scrollState = bindHelper.self("scrollState"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					uv4 = "role"

					slot4(slot0, slot1, slot2, slot3.role, slot3.index)

					slot4 = slot1:multiget("txtScore", "txtRecord")

					slot4.txtScore:text(slot3.craft.point)
					slot4.txtRecord:text(string.format(gLanguageCsv.winAndLoseNum, slot3.craft.win, math.min(slot3.craft.round, 13) - slot3.craft.win))
				end
			},
			handlers = {
				clickHead = bindHelper.self("onHeadClick")
			}
		}
	},
	["rightPanel.gateStarList"] = {
		varname = "gateStarList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData8"),
				item = bindHelper.self("itemGateStar"),
				scrollState = bindHelper.self("scrollState"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					uv4 = "role"

					slot4(slot0, slot1, slot2, slot3.role, slot3.index)

					slot4 = slot1:multiget("txtStar", "txtUnion")

					slot4.txtStar:text(slot3.star)
					slot4.txtUnion:text((slot3.union_name == "" or not slot3.union_name) and gLanguageCsv.none or slot3.union_name)
				end
			},
			handlers = {
				clickHead = bindHelper.self("onHeadClick")
			}
		}
	},
	["rightPanel.arenaList"] = {
		varname = "arenaList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData3"),
				item = bindHelper.self("itemFight"),
				scrollState = bindHelper.self("scrollState"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
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
			},
			handlers = {
				clickHead = bindHelper.self("onHeadClick")
			}
		}
	},
	["rightPanel.kingList"] = {
		varname = "kingList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData4"),
				item = bindHelper.self("itemFight"),
				scrollState = bindHelper.self("scrollState"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
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
			},
			handlers = {
				clickHead = bindHelper.self("onHeadClick")
			}
		}
	},
	["rightPanel.unionList"] = {
		varname = "unionList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData5"),
				item = bindHelper.self("itemUnion"),
				scrollState = bindHelper.self("scrollState"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("name", "level", "txt", "bossName", "people", "img", "iconBg", "bg", "num", "icon")

					slot4.name:text(slot3.name)
					slot4.level:text(slot3.level)
					adapt.oneLinePos(slot4.txt, slot4.level, cc.p(5, slot4.txt:y() - slot4.level:y()))
					slot4.icon:texture(csv.union.union_logo[slot3.logo].icon)
					slot4.bossName:text(slot3.chairman_name)
					slot4.people:text(slot3.members .. "/" .. slot3.member_max)
					slot4.img:visible(slot2 <= 3)
					slot4.num:visible(slot2 > 3)
					slot4.num:text(slot2)

					if slot2 <= 3 then
						slot4.img:texture(ui.RANK_ICON[slot2])
					end

					slot4.iconBg:setTouchEnabled(false)
					slot4.bg:setTouchEnabled(true)
					slot4.bg:onClick(functools.partial(slot0.clickHead, slot2, slot3, index))
				end
			},
			handlers = {
				clickHead = bindHelper.self("onUnionHeadClick")
			}
		}
	},
	["rightPanel.activityList"] = {
		varname = "activityList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData6"),
				item = bindHelper.self("itemFight"),
				scrollState = bindHelper.self("scrollState"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
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
			},
			handlers = {
				clickHead = bindHelper.self("onHeadClick")
			}
		}
	},
	["rightPanel.bottomPanel.txtState1"] = {
		varname = "txtState1",
		binds = {
			event = "text",
			idler = bindHelper.self("bottomTextState1")
		}
	},
	["rightPanel.bottomPanel.txtState2"] = {
		varname = "txtState2",
		binds = {
			event = "text",
			idler = bindHelper.self("bottomTextState2")
		}
	},
	["rightPanel.bottomPanelFight.txtRank"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("fightRank")
		}
	},
	["rightPanel.bottomPanelFight.txtName"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("roleName")
		}
	},
	["rightPanel.bottomPanelFight.txtState1"] = {
		varname = "bottomTxtLevel",
		binds = {
			event = "text",
			idler = bindHelper.self("level")
		}
	},
	["rightPanel.bottomPanelFight.txtState2"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("power"),
			method = function (slot0)
				return gLanguageCsv.power .. ": " .. slot0
			end
		}
	},
	["rightPanel.bottomPanelCollect.txtRank"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("cardNumRank")
		}
	},
	["rightPanel.bottomPanelCollect.txtName"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("roleName")
		}
	},
	["rightPanel.bottomPanelCollect.txtState1"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("pokedex"),
			method = function (slot0)
				return string.format("%.1f%%", itertools.size(slot0) * 100 / table.length(gHandbookArrayCsv))
			end
		}
	},
	["rightPanel.bottomPanelCollect.txtState2"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("pokedex"),
			method = function (slot0)
				return itertools.size(slot0)
			end
		}
	},
	["rightPanel.bottomPanelUnion.txtRank"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("unionRank")
		}
	},
	["rightPanel.bottomPanelCraft.txtName"] = {
		binds = {
			event = "text",
			idler = bindHelper.model("role", "name")
		}
	},
	["rightPanel.bottomPanelCraft.txtRank"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("craftRank"),
			method = function (slot0)
				return slot0 and slot0 > 0 and slot0 or gLanguageCsv.craftNoRank
			end
		}
	},
	["rightPanel.bottomPanelGateStar.txtRank"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("gate_star_rank"),
			method = function (slot0)
				return slot0 > 0 and slot0 or gLanguageCsv.craftNoRank
			end
		}
	},
	["rightPanel.bottomPanelGateStar.txtName"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("roleName")
		}
	},
	["rightPanel.bottomPanelGateStar.txtStar"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("total_level_stars")
		}
	}
}

function slot3.initData(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = #slot2 == 10

	if slot3 == 0 then
		slot0.datas[slot4] = slot2
	else
		for slot10, slot11 in ipairs(slot2) do
			table.insert(slot0.datas[slot4], slot11)
		end
	end

	slot7 = #slot0.datas[slot4]

	if slot4 == 2 then
		mathEasy.setRankIndex(slot0.datas[slot4], "pokedex")
	end

	slot0.isCanDown = false

	slot0["showData" .. slot4]:update(slot0.datas[slot4])
	gGameUI:disableTouchDispatch(0.01)
	slot5:jumpToItem(slot3 - 4, cc.p(0, 1), cc.p(0, 1))

	slot0.isCanDown = slot6 and slot7 < (slot1 == "craft" and 50 or 100)
end

function slot3.sendProtocol(slot0, slot1, slot2, slot3, slot4)
	if slot0.isRequest then
		return
	end

	slot0.isRequest = true

	if slot2 < 100 then
		if slot1 == "union" then
			gGameApp:requestServer("/game/union/rank", function (slot0)
				uv1 = "isRequest"
				slot1.isRequest = false
				uv1 = "isRequest"
				uv3 = "initData"
				uv5 = "view"
				uv6 = "unions"
				uv7 = "isRequest"

				slot1:initData(slot3, slot0.view.unions, slot5, slot6, slot7)
			end, slot2, slot2 + 10 > 100 and 100 - slot2 or 10)
		else
			slot5 = slot1 == "craft" and 50 or 100

			gGameApp:requestServer("/game/rank", function (slot0)
				uv2 = "tolua"

				if tolua.isnull(slot2) then
					return
				end

				uv1 = "tolua"
				slot1.isRequest = false
				uv1 = "isnull"

				if slot1 == "craft" then
					if slot0.view.craft then
						uv1 = "tolua"
						slot1 = slot1.bottomPanelCraft:get("txtScore")
						slot1 = slot1.text

						slot1(slot1, slot0.view.craft.point)

						uv1 = "tolua"

						slot1.bottomPanelCraft:get("txtRecord"):text(string.format(gLanguageCsv.winAndLoseNum, slot0.view.craft.win, math.min(slot0.view.craft.round, 13) - slot0.view.craft.win))
					else
						uv1 = "tolua"
						slot1 = slot1.bottomPanelCraft:get("txtScore")
						slot1 = slot1.text

						slot1(slot1, "0")

						uv1 = "tolua"

						slot1.bottomPanelCraft:get("txtRecord"):text(string.format(gLanguageCsv.winAndLoseNum, 0, 0))
					end
				end

				uv1 = "tolua"
				uv3 = "isnull"
				uv5 = "isRequest"
				uv6 = "craft"
				uv7 = "view"

				slot1:initData(slot3, slot0.view.rank, slot5, slot6, slot7)
			end, slot1, slot2, slot5 < slot2 + 10 and slot5 - slot2 or 10)
		end
	end
end

function slot3.adapUI(slot0)
	slot11 = slot0.itemFight:multiget("list")
	slot13 = slot0.topPanelFight:multiget("txtState2")
	slot17 = slot0.bottomPanelFight:multiget("txtName")
	slot25 = slot0.bottomPanelUnion:multiget("txtRank", "txtName", "txtStatic1", "none", "txtState1")

	adapt.oneLinePos(slot0.txtStatic1, slot0.bottomTxtLevel, cc.p(0, slot0.txtStatic1:y() - slot0.bottomTxtLevel:y()))
	adapt.oneLinePos(slot25.txtStatic1, slot25.txtState1, cc.p(0, slot25.txtStatic1:y() - slot25.txtState1:y()))
	adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.leftPanel,
			"pos",
			"left"
		},
		{
			slot0.rightPanel,
			"pos",
			"left"
		},
		{
			slot0.craftList,
			"width"
		},
		{
			slot0.itemCraft,
			"width"
		},
		{
			slot0.itemCraft:multiget("bg"),
			"width"
		},
		{
			slot0.itemCraft:multiget("img", "num", "iconBg", "name", "txt", "level"),
			"pos",
			"left"
		},
		{
			slot0.itemCraft:multiget("txtScore", "txtRecord"),
			"pos",
			"right"
		},
		{
			slot0.topPanelCraft,
			"width"
		},
		{
			slot0.topPanelCraft,
			"pos",
			"right"
		},
		{
			slot0.topPanelCraft:multiget("txtRank", "txtName"),
			"pos",
			"left"
		},
		{
			slot0.topPanelCraft:multiget("txtScore", "txtRecord"),
			"pos",
			"right"
		},
		{
			slot0.bottomPanelCraft,
			"pos",
			"right"
		},
		{
			slot0.bottomPanelCraft:multiget("bg"),
			"width"
		},
		{
			slot0.bottomPanelCraft:multiget("txtRank", "txtName"),
			"pos",
			"left"
		},
		{
			slot0.bottomPanelCraft:multiget("txtRecord", "txtScore"),
			"pos",
			"right"
		},
		{
			slot0.activityList,
			"width"
		},
		{
			slot0.powerList,
			"width"
		},
		{
			slot0.arenaList,
			"width"
		},
		{
			slot0.kingList,
			"width"
		},
		{
			slot0.itemFight,
			"width"
		},
		{
			slot0.itemFight:multiget("bg"),
			"width"
		},
		{
			slot0.itemFight:multiget("img", "num", "iconBg", "name", "txt", "level"),
			"pos",
			"left"
		},
		{
			slot0.topPanelFight,
			"width"
		},
		{
			slot0.topPanelFight,
			"pos",
			"right"
		},
		{
			slot0.topPanelFight:multiget("txtRank", "txtName"),
			"pos",
			"left"
		},
		{
			slot0.bottomPanel,
			"pos",
			"right"
		},
		{
			slot0.bottomPanel:multiget("bg"),
			"width"
		},
		{
			slot0.bottomPanel:multiget("txtRank", "txtName"),
			"pos",
			"left"
		},
		{
			slot0.bottomPanel:multiget("txtStatic1", "txtState2", "txtState1"),
			"pos",
			"right"
		},
		{
			slot0.bottomPanelFight:multiget("txtStatic1", "txtState1", "txtState2"),
			"pos",
			"right"
		},
		{
			slot0.unionList,
			"width"
		},
		{
			slot0.itemUnion,
			"width"
		},
		{
			slot0.itemUnion:multiget("bg"),
			"width"
		},
		{
			slot0.itemUnion:multiget("img", "num", "txt", "level", "iconBg", "name", "icon"),
			"pos",
			"left"
		},
		{
			slot0.itemUnion:multiget("people", "bossName"),
			"pos",
			"right"
		},
		{
			slot0.topPanelUnion,
			"width"
		},
		{
			slot0.topPanelUnion,
			"pos",
			"right"
		},
		{
			slot0.topPanelUnion:multiget("txtRank", "txtName", "txtState1"),
			"pos",
			"left"
		},
		{
			slot0.topPanelUnion:multiget("txtState2", "txtState3"),
			"pos",
			"right"
		},
		{
			slot0.bottomPanelUnion,
			"pos",
			"right"
		},
		{
			slot0.bottomPanelUnion:multiget("bg"),
			"width"
		},
		{
			slot25,
			"pos",
			"left"
		},
		{
			slot0.bottomPanelUnion:multiget("txtState2", "txtState3"),
			"pos",
			"right"
		},
		{
			slot0.collectList,
			"width"
		},
		{
			slot0.itemCollect,
			"width"
		},
		{
			slot0.itemCollect:multiget("bg"),
			"width"
		},
		{
			slot0.itemCollect:multiget("img", "num", "iconBg", "name", "txt", "level"),
			"pos",
			"left"
		},
		{
			slot0.itemCollect:multiget("txtCollect", "icon1", "txtUnlock", "icon2"),
			"pos",
			"right"
		},
		{
			slot0.topPanelCollect,
			"width"
		},
		{
			slot0.topPanelCollect,
			"pos",
			"right"
		},
		{
			slot0.topPanelCollect:multiget("txtRank", "txtName"),
			"pos",
			"left"
		},
		{
			slot0.topPanelCollect:multiget("txtState1", "txtState2"),
			"pos",
			"right"
		},
		{
			slot0.bottomPanelCollect,
			"pos",
			"right"
		},
		{
			slot0.bottomPanelCollect:multiget("bg"),
			"width"
		},
		{
			slot0.bottomPanelCollect:multiget("txtRank", "txtName"),
			"pos",
			"left"
		},
		{
			slot0.bottomPanelCollect:multiget("txtState1", "txtState2"),
			"pos",
			"right"
		},
		{
			slot0.gateStarList,
			"width"
		},
		{
			slot0.itemGateStar,
			"width"
		},
		{
			slot0.itemGateStar:multiget("bg"),
			"width"
		},
		{
			slot0.itemGateStar:multiget("img", "num", "iconBg", "name", "txt", "level"),
			"pos",
			"left"
		},
		{
			slot0.itemGateStar:multiget("txtStar", "txtUnion"),
			"pos",
			"right"
		},
		{
			slot0.topPanelGateStar,
			"width"
		},
		{
			slot0.topPanelGateStar,
			"pos",
			"right"
		},
		{
			slot0.topPanelGateStar:multiget("txtRank", "txtName"),
			"pos",
			"left"
		},
		{
			slot0.topPanelGateStar:multiget("txtStar", "txtUnion"),
			"pos",
			"right"
		},
		{
			slot0.bottomPanelGateStar,
			"pos",
			"right"
		},
		{
			slot0.bottomPanelGateStar:multiget("bg"),
			"width"
		},
		{
			slot0.bottomPanelGateStar:multiget("txtRank", "txtName"),
			"pos",
			"left"
		},
		{
			slot0.bottomPanelGateStar:multiget("txtStar", "txtUnion"),
			"pos",
			"right"
		}
	})
end

function slot3.onCreate(slot0, slot1)
	slot0:initModel()
	slot0:adapUI()

	slot0.isCanDown = true
	slot0.scrollState = idler.new(true)
	slot0.datas = {}
	uv5 = "initModel"

	for slot6 = 1, itertools.size(slot5) do
		slot0.datas[slot6] = slot6 == 1 and slot1 or {}
		slot0["showData" .. slot6] = idlers.newWithMap(slot0.datas[slot6])
	end

	slot3 = slot0.txtState1:x()
	slot4 = slot0.txtState2:x()
	slot11 = slot0
	slot12 = "onClose"

	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0.createHandler(slot11, slot12)
	}):init({
		subTitle = "RANKING LIST",
		title = gLanguageCsv.rankList
	})

	slot0.bottomTextState1 = idler.new("")
	slot0.bottomTextState2 = idler.new("")
	slot0.leftDatas = idlers.new()
	slot6 = {}

	for slot11, slot12 in pairs({
		{
			sortValue = 1,
			type = "fight",
			subName = "Fight",
			name = gLanguageCsv.fighting,
			top = slot0.topPanelFight,
			bottom = slot0.bottomPanelFight
		},
		{
			sortValue = 2,
			type = "pokedex",
			subName = "CollectRate",
			name = gLanguageCsv.collectRate,
			top = slot0.topPanelCollect,
			bottom = slot0.bottomPanelCollect
		},
		[5] = {
			sortValue = 5,
			unlockKey = "union",
			type = "union",
			subName = "Union",
			name = gLanguageCsv.spaceGuild,
			top = slot0.topPanelUnion,
			bottom = slot0.bottomPanelUnion
		},
		[7] = {
			sortValue = 7,
			unlockKey = "craft",
			type = "craft",
			subName = "Craft",
			name = gLanguageCsv.craft,
			top = slot0.topPanelCraft,
			bottom = slot0.bottomPanelCraft
		},
		[8] = {
			sortValue = 8,
			type = "star",
			subName = "Accumulated stars",
			name = gLanguageCsv.gateStar,
			top = slot0.topPanelGateStar,
			bottom = slot0.bottomPanelGateStar
		}
	}) do
		if not slot12.unlockKey then
			function (slot0, slot1)
				uv2 = "pairs"
				slot2[slot0] = slot1
				uv4 = "leftDatas"

				for slot6, slot7 in pairs(slot4) do
					uv8 = "pairs"

					if slot8[slot6] == true then
						-- Nothing
					end
				end

				uv3 = "update"

				slot3.leftDatas:update({
					[slot6] = slot7
				})
			end(slot11, true)
		else
			dataEasy.getListenUnlock(slot12.unlockKey, functools.partial(slot7, slot11))
		end
	end

	slot9 = true
	slot10 = slot0.bottomPanelUnion:multiget("txtRank", "txtName", "txtStatic1", "txtState1", "txtState2", "txtState3")

	if gGameModel.role:getIdler("union_db_id"):read() then
		itertools.invoke({
			slot10.txtRank,
			slot10.txtName,
			slot10.txtStatic1,
			slot10.txtState1,
			slot10.txtState2,
			slot10.txtState3
		}, "show")
		slot0.bottomPanelUnion:get("none"):hide()
		idlereasy.any({
			slot0.unionName,
			slot0.unionLevel,
			slot0.chairmanId,
			slot0.members
		}, function (slot0, slot1, slot2, slot3, slot4)
			uv5 = "txtName"
			slot5 = slot5.txtName
			slot5 = slot5.text

			slot5(slot5, slot1)

			uv5 = "txtName"
			slot5 = slot5.txtState1
			slot6 = slot5

			slot5.text(slot6, slot2)

			uv6 = "txtName"
			slot8 = slot4[slot3].name

			slot6.txtState3:text(slot8)

			uv8 = "txtName"
			slot8 = slot8.txtState2
			slot8 = slot8.text

			slot8(slot8, itertools.size(slot4) .. "/" .. csv.union.union_level[slot2].memberMax)

			uv8 = "text"

			slot8.bottomPanelGateStar:get("txtUnion"):text(slot1)
		end)
	else
		slot0.bottomPanelUnion:get("none"):show()
		itertools.invoke({
			slot10.txtRank,
			slot10.txtName,
			slot10.txtStatic1,
			slot10.txtState1,
			slot10.txtState2,
			slot10.txtState3
		}, "hide")
		slot0.bottomPanelGateStar:get("txtUnion"):text(gLanguageCsv.none)
	end

	slot0.bottomPanelCraft:get("txtScore"):text("")

	slot11 = slot0.bottomPanelCraft:get("txtRecord")
	slot12 = slot11

	slot11.text(slot12, "")

	uv12 = "initModel"

	for slot14, slot15 in ipairs(slot12) do
		slot0[slot15]:visible(false)
	end

	slot0.showTab = idler.new(1)

	slot0.powerList:visible(true)

	slot11 = slot0.showTab
	slot12 = slot11

	slot11.addListener(slot12, function (slot0, slot1, slot2)
		uv3 = "visible"
		uv4 = "datas"
		slot3 = slot3[slot4[slot1]]
		slot4 = slot3
		slot3 = slot3.visible

		slot3(slot4, false)

		uv3 = "visible"
		uv4 = "datas"

		slot3[slot4[slot0]]:visible(true)

		if slot0 ~= slot1 then
			uv3 = "visible"
			slot3 = slot3.datas
			slot3[slot0] = {}
			uv3 = "visible"

			slot3["showData" .. slot0]:update({})
		end

		slot3 = dataEasy.tryCallFunc
		uv4 = "visible"
		uv5 = "datas"

		slot3(slot4[slot5[slot0]], "setItemAction", {
			isAction = true
		})

		uv3 = "visible"

		if slot3.leftDatas:atproxy(slot0).type then
			uv3 = "visible"

			if #slot3.datas[slot0] == 0 then
				uv3 = "visible"
				uv5 = "visible"
				uv8 = "visible"
				uv9 = "datas"

				slot3:sendProtocol(slot5.leftDatas:atproxy(slot0).type, 0, slot0, slot8[slot9[slot0]])
			end
		end

		uv3 = "visible"
		slot3 = slot3.leftDatas:atproxy(slot1)
		slot3.select = false
		uv3 = "visible"
		slot3 = slot3.leftDatas:atproxy(slot0)
		slot3.select = true
		uv3 = "visible"
		slot3 = slot3.leftDatas:atproxy(slot1).top
		slot3 = slot3.hide

		slot3(slot3)

		uv3 = "visible"
		slot3 = slot3.leftDatas:atproxy(slot1).bottom
		slot3 = slot3.hide

		slot3(slot3)

		uv3 = "visible"
		slot3 = slot3.leftDatas:atproxy(slot0).top
		slot3 = slot3.show

		slot3(slot3)

		uv3 = "visible"

		slot3.leftDatas:atproxy(slot0).bottom:show()
	end)

	uv12 = "initModel"

	for slot14, slot15 in ipairs(slot12) do
		slot16 = slot0[slot15]:getInnerContainer()

		slot0[slot15]:onScroll(function (slot0)
			uv1 = "getPositionY"

			if slot1:getPositionY() >= -10 then
				uv2 = "isCanDown"

				if slot2.isCanDown then
					uv2 = "isCanDown"
					uv4 = "leftDatas"

					if slot2.leftDatas:atproxy(slot4).type then
						uv2 = "isCanDown"
						slot2.isCanDown = false
						uv2 = "isCanDown"
						uv4 = "isCanDown"
						slot4 = slot4.leftDatas
						slot5 = slot4
						uv6 = "leftDatas"
						uv5 = "isCanDown"
						uv6 = "leftDatas"
						uv6 = "leftDatas"
						uv7 = "isCanDown"
						uv8 = "atproxy"

						slot2:sendProtocol(slot4.atproxy(slot5, slot6).type, #slot5.datas[slot6], slot6, slot7[slot8])
					end
				end
			end
		end)
	end
end

function slot3.initModel(slot0)
	slot0.roleName = gGameModel.role:getIdler("name")
	slot0.level = gGameModel.role:getIdler("level")
	slot0.fightRank = gGameModel.role:getIdler("fight_rank")
	slot0.power = gGameModel.role:getIdler("top6_fighting_point")
	slot0.id = gGameModel.role:read("id")
	slot0.pokedex = gGameModel.role:getIdler("pokedex")
	slot0.cardNumRank = gGameModel.role:getIdler("cardNum_rank")
	slot0.unionId = gGameModel.role:getIdler("union_db_id")
	slot0.gate_star_rank = gGameModel.role:getIdler("gate_star_rank")
	slot0.total_level_stars = gGameModel.role:getIdler("total_level_stars")

	if slot0.unionId:read() then
		slot0.unionRank = gGameModel.union:getIdler("rank")
		slot0.unionName = gGameModel.union:getIdler("name")
		slot0.unionLevel = gGameModel.union:getIdler("level")
		slot0.chairmanId = gGameModel.union:getIdler("chairman_db_id")
		slot0.members = gGameModel.union:getIdler("members")
	end

	slot0.craftRank = gGameModel.daily_record:getIdler("craft_rank")
end

function slot3.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot3.onUnionHeadClick(slot0, slot1, slot2, slot3, slot4, slot5)
	gGameUI:stackUI("city.union.join.detail", nil, , slot2, slot3, nil, slot0:createHandler("unionCb"))
end

function slot3.unionCb(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
	gGameUI:stackUI("city.union.view", nil, {
		full = true
	})
end

function slot3.onHeadClick(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0.id == slot3.id then
		return
	end

	slot6 = slot5.target
	slot7, slot8 = slot6:xy()

	gGameUI:stackUI("city.chat.personal_info", nil, {
		clickClose = true,
		dispatchNodes = slot1:parent()
	}, slot6:getParent():convertToWorldSpace(cc.p(slot7, slot8)), {
		role = slot3
	}, {
		speical = "rank",
		disableTouch = true,
		target = slot1.item:get("bg")
	})
end

return slot3
