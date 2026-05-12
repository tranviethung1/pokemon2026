slot0 = {
	{
		res = "city/adventure/hunting/box_green.png",
		color = cc.c4b(68, 185, 117, 255)
	},
	{
		res = "city/adventure/hunting/box_yellow.png",
		color = cc.c4b(202, 153, 35, 255)
	},
	{
		res = "city/adventure/hunting/box_blue.png",
		color = cc.c4b(65, 142, 177, 255)
	},
	{
		res = "city/adventure/hunting/box_orange.png",
		color = cc.c4b(227, 118, 84, 255)
	},
	{
		res = "city/adventure/hunting/box_pink.png",
		color = cc.c4b(217, 85, 118, 255)
	},
	{
		res = "city/adventure/hunting/box_purple.png",
		color = cc.c4b(165, 82, 193, 255)
	},
	{
		res = "city/adventure/hunting/box_red.png",
		color = cc.c4b(227, 98, 91, 255)
	}
}
slot1 = cc.load("mvc").ViewBase
slot2 = class("HuntingJumpView", Dialog)
slot3 = {
	ALL = "ALL",
	ONCE = "ONCE"
}
slot2.RESOURCE_FILENAME = "hunting_jump.json"
slot2.RESOURCE_BINDING = {
	["panel2.noData"] = "boxNoData",
	panel3 = "panel3",
	["panel2.item"] = "item2",
	["panel1.item"] = "awardItem",
	["panel3.item"] = "item3",
	panel1 = "panel1",
	panel2 = "panel2",
	["panel1.subList"] = "awardList",
	progressPanel = "progressPanel",
	["panel2.sortPanel"] = {
		varname = "sortPanel",
		binds = {
			event = "extend",
			class = "sort_menus",
			props = {
				btnType = 4,
				expandUp = true,
				data = bindHelper.self("sortDatas"),
				btnClick = bindHelper.self("onSortMenusBtnClick", true),
				onNode = function (slot0)
					slot0:xy(-1125, -477):z(18)
					slot0.btn4:setColor(cc.c3b(255, 255, 255))
				end
			}
		}
	},
	["panel2.btnOpenAll"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOpenAll")
			}
		}
	},
	["btnNext.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["panel2.textTitle"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("boxesCount"),
			method = function (slot0)
				return string.format(gLanguageCsv.randomTowerJumpBoxesCount, slot0)
			end
		}
	},
	["panel2.subList"] = {
		varname = "list2",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 24,
				asyncPreload = 4,
				data = bindHelper.self("boxData"),
				item = bindHelper.self("item2"),
				route = bindHelper.self("route"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgGotten"):setVisible(slot3.times == slot3.maxOpen)

					if slot3.times == slot3.maxOpen then
						nodetools.invoke(slot1, {
							"imgGotten"
						}, "show")
						nodetools.invoke(slot1, {
							"btn1",
							"btn2",
							"imgDiamond1",
							"imgDiamond2",
							"textDiamond1",
							"textDiamond2"
						}, "hide")
					else
						nodetools.invoke(slot1, {
							"imgGotten"
						}, "hide")
						nodetools.invoke(slot1, {
							"btn1",
							"btn2",
							"imgDiamond1",
							"imgDiamond2",
							"textDiamond1",
							"textDiamond2"
						}, "show")

						slot5 = gCostCsv.hunting_box_cost
						slot6 = slot5[math.min(slot3.times, table.length(slot5))]
						slot7 = 0

						for slot11 = slot3.times, slot3.maxOpen - 1 do
							slot7 = slot5[slot11] and slot7 + slot5[slot11] or slot7 + slot5[table.length(slot5)]
						end

						slot1:get("textDiamond1"):text(slot6)
						slot1:get("textDiamond2"):text(slot7)
						bind.touch(slot0, slot1:get("btn1"), {
							methods = {
								ended = function ()
									slot0 = gGameModel.role
									slot1 = slot0
									uv1 = "gGameModel"

									if slot0.read(slot1, "rmb") < slot1 then
										uiEasy.showDialog("rmb")
									else
										uv4 = "role"
										uv5 = "read"

										gGameApp:requestServer("/game/hunting/jump/box/open", function (slot0)
											gGameUI:showGainDisplay(slot0)
										end, slot4.route, slot5.boardID, "open1")
									end
								end
							}
						})

						slot9 = slot1:get("btn2")

						slot9:get("textNote"):text(string.format(gLanguageCsv.openBoxesTimes, slot3.maxOpen - slot3.times))
						bind.touch(slot0, slot9, {
							methods = {
								ended = function ()
									slot0 = gGameModel.role
									slot1 = slot0
									uv1 = "gGameModel"

									if slot0.read(slot1, "rmb") < slot1 then
										uiEasy.showDialog("rmb")
									else
										uv4 = "role"
										uv5 = "read"

										gGameApp:requestServer("/game/hunting/jump/box/open", function (slot0)
											gGameUI:showGainDisplay(slot0)
										end, slot4.route, slot5.boardID, "open3")
									end
								end
							}
						})
					end
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	},
	["panel2.textDiamond"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("openAllBoxesCost")
		}
	},
	["panel3.subList"] = {
		varname = "list3",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 100,
				data = bindHelper.self("bufData"),
				item = bindHelper.self("item3"),
				route = bindHelper.self("route"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = csv.cross.hunting.buffs[slot3]

					slot1:get("panel.icon"):texture(slot4.icon)
					slot1:get("panel.name"):text(slot4.name)

					slot8 = "panel.name"
					uv8 = "csv"

					text.addEffect(slot1:get(slot8), {
						color = slot8[slot4.quality].color
					})

					slot7 = "panel.bg"
					uv7 = "csv"

					slot1:get(slot7):texture(slot7[slot4.quality].res)
					beauty.textScroll({
						fontSize = 34,
						align = "center",
						isRich = true,
						list = slot1:get("panel.desc"),
						strs = "#C0x5B545B#" .. slot4.desc
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = function ()
								uv4 = "gGameApp"
								uv5 = "requestServer"

								gGameApp:requestServer("/game/hunting/jump/buff", function (slot0)
								end, slot4.route, slot5)
							end
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	},
	btnNext = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("requestNext")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0:initModel()
	slot0:getSize(slot1.route)

	slot0.cb = slot1.cb
	slot0.route = slot1.route
	slot0.data = slot1.data

	idlereasy.when(slot0.routeInfo, function (slot0, slot1)
		uv2 = "route"
		slot2 = slot1[slot2.route].jump_step
		uv3 = "route"
		uv4 = "jump_step"
		slot4.jumpStep = slot2
		uv4 = "jump_step"
		slot4.jumpInfo = slot1[slot3.route].jump_info

		if slot2 == game.HUNTING_JUMP_STATE.POINT then
			uv4 = "jump_step"

			slot4.panel1:show()
		elseif slot2 == game.HUNTING_JUMP_STATE.BOX then
			uv4 = "jump_step"
			slot4 = slot4.panel1
			slot4 = slot4.hide

			slot4(slot4)

			uv4 = "jump_step"

			slot4.panel2:show()
		elseif slot2 == game.HUNTING_JUMP_STATE.BUFF then
			uv4 = "jump_step"
			slot4 = slot4.panel2
			slot4 = slot4.hide

			slot4(slot4)

			uv4 = "jump_step"

			slot4.panel3:show()
		elseif slot2 == game.HUNTING_JUMP_STATE.OVER then
			uv4 = "jump_step"
			slot5 = slot4
			uv6 = "jump_step"

			slot4.addCallbackOnExit(slot5, slot6.cb)

			uv5 = "jump_step"

			performWithDelay(slot5, function ()
				uv1 = "Dialog"

				Dialog.onClose(slot1)
			end, 0.016666666666666666)
		end

		if slot2 <= game.HUNTING_JUMP_STATE.BUFF then
			uv4 = "jump_step"
			slot5 = "refreshPanel" .. slot2 .. "Data"
			slot4 = slot4[slot5]
			uv5 = "jump_step"

			slot4(slot5, slot3)

			uv4 = "jump_step"

			slot4:refreshProgressPanel(slot2)
		end
	end)
	Dialog.onCreate(slot0)
end

function slot2.onClose(slot0)
end

function slot2.getSize(slot0, slot1)
	for slot8, slot9 in orderCsvPairs(csv.cross.hunting.route) do
		if slot9.routeTag == slot1 and (slot0.routeInfo:read()[slot1].version or 0) == slot9.version then
			slot4 = 0 + 1
		end
	end

	slot0.routeMaxSize = slot4
	slot6 = slot2[slot1].history_max_node
	slot7 = 0
	slot8 = 0

	if csv.cross.hunting.route[slot2[slot1].last_max_node] then
		slot7 = csv.cross.hunting.route[slot5].lastCanPass
	end

	if csv.cross.hunting.route[slot6] then
		slot8 = csv.cross.hunting.route[slot6].historyCanPass
	end

	slot0.canPassNode = math.max(slot7, slot8)
end

function slot2.initModel(slot0)
	slot0.routeInfo = gGameModel.hunting:getIdler("hunting_route")
	slot0.boxData = idlers.newWithMap({})
	slot0.openAllBoxesCost = idler.new(0)
	slot0.boxesCount = idler.new(0)
	slot0.bufData = idlertable.new({})
	slot0.bufRoomIndex = idler.new(0)
	slot0.eventData = idlers.newWithMap({})
	slot3 = {
		gLanguageCsv.randomTowerOpenAll,
		gLanguageCsv.randomTowerOpenOnce
	}
	slot0.sortDatas = idlertable.new(slot3)
	uv3 = "routeInfo"
	slot0.openTimes = idler.new(slot3.ALL)
end

function slot2.refreshOpenAllBoxesCost(slot0, slot1, slot2)
	slot3 = csv.cross.hunting.base[slot0.route].boxOpenLimit
	slot4 = gCostCsv.hunting_box_cost
	slot5 = 0
	uv6 = "csv"

	if slot2 == slot6.ONCE then
		for slot9, slot10 in pairs(slot1) do
			if slot4[slot10] and slot10 <= slot3 - 1 then
				slot5 = slot5 + slot4[slot10]
			end
		end
	else
		for slot9, slot10 in pairs(slot1) do
			for slot14 = slot10, slot3 - 1 do
				slot5 = slot4[slot14] and slot5 + slot4[slot14] or slot5 + slot4[table.length(slot4)]
			end
		end
	end

	slot0.openAllBoxesCost:set(slot5)
end

function slot2.refreshPanel1Data(slot0, slot1)
	slot0.panel1:show()
	slot0:initRichPanel()
	slot0:initAward(slot1)
end

function slot2.refreshPanel2Data(slot0, slot1)
	slot0.panel1:hide()
	slot0.panel2:show()

	slot2 = csv.cross.hunting.base[slot0.route].boxOpenLimit

	idlereasy.when(slot0.openTimes, function (slot0, slot1)
		slot2 = gGameModel.hunting
		slot3 = slot2
		uv3 = "gGameModel"
		slot2 = slot2.read(slot3, "hunting_route")[slot3.route].jump_info.boxes or {}
		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			uv12 = "hunting"

			table.insert(slot3, {
				boardID = slot7,
				times = slot8,
				maxOpen = slot12
			})
		end

		uv4 = "gGameModel"
		slot4 = slot4.boxNoData
		slot4 = slot4.visible

		slot4(slot4, itertools.size(slot3) == 0)

		uv4 = "gGameModel"
		slot4 = slot4.boxData
		slot4 = slot4.update

		slot4(slot4, slot3)

		uv4 = "gGameModel"
		slot4 = slot4.boxesCount
		slot4 = slot4.set

		slot4(slot4, itertools.size(slot2))

		uv4 = "gGameModel"
		slot5 = slot4

		slot4.refreshOpenAllBoxesCost(slot5, slot2, slot1)

		uv5 = "gGameModel"
		slot7 = "textCost"
		uv7 = "gGameModel"
		slot7 = slot7.panel2:get("textDiamond")
		uv7 = "gGameModel"

		adapt.oneLinePos(slot5.panel2:get(slot7), {
			slot7,
			slot7.panel2:get("imgDiamond")
		}, {
			cc.p(10, 0),
			cc.p(10, 0)
		})
	end)
end

function slot2.refreshPanel3Data(slot0, slot1)
	slot0.panel2:hide()
	slot0.panel3:show()

	if slot1.board_buffs then
		slot0.bufData:set(slot2)
		slot0.bufRoomIndex:set(slot1.buff_index or 1)
		slot0:refreshBuffIndex()
	else
		slot0.bufData:set({})
	end
end

function slot2.getPanel1Str(slot0)
	if slot0.canPassNode <= 1 then
		slot1[1] = ""
	else
		slot1[1] = string.format(gLanguageCsv.huntingJumpTips1, slot0.canPassNode, slot0.routeMaxSize)
	end

	slot2 = slot0.jumpInfo
	slot4 = 0

	for slot9, slot10 in pairs(slot0.data.gateIDs or {}) do
		if csv.cross.hunting.gate[slot10].type == 1 then
			slot3 = 0 + 1
		elseif slot11.type == 2 then
			slot4 = slot4 + 1
		end
	end

	slot1[2] = string.format(gLanguageCsv.huntingJumpTips2, slot3, slot4)
	slot1[3] = string.format(gLanguageCsv.huntingJumpTips3, itertools.size(slot2.buff_gates or {}))
	slot1[4] = string.format(gLanguageCsv.huntingJumpTips4, itertools.size(slot2.boxes or {}))

	return {
		"",
		"",
		"",
		""
	}
end

function slot2.initRichPanel(slot0)
	for slot5, slot6 in ipairs(slot0:getPanel1Str()) do
		slot7 = rich.createByStr(slot6, 50):addTo(slot0.panel1, 10):setAnchorPoint(cc.p(0, 0.5)):xy(cc.p(80, 1000 - 90 * slot5)):formatText()
	end
end

function slot2.initAward(slot0, slot1)
	for slot7, slot8 in pairs(slot0.data.award) do
		if slot7 ~= "chipdbIDs" then
			-- Nothing
		end
	end

	bind.extend(slot0, slot0.awardList, {
		class = "listview",
		props = {
			data = dataEasy.getItemData({
				[slot7] = slot8
			}),
			item = slot0.awardItem,
			dataOrderCmp = dataEasy.sortItemCmp,
			itemAction = {
				isAction = true
			},
			onAfterBuild = function ()
				uv0 = "awardList"

				slot0.awardList:adaptTouchEnabled()
			end,
			onItem = function (slot0, slot1, slot2, slot3)
				bind.extend(slot0, slot1, {
					class = "icon_key",
					props = {
						data = slot3,
						grayState = slot3.grayState,
						specialKey = {
							maxLimit = true
						}
					}
				})
			end
		}
	})
end

function slot2.requestNext(slot0)
	slot2 = slot0.jumpInfo
	slot3 = ""

	if slot0.jumpStep == game.HUNTING_JUMP_STATE.BOX then
		if slot0.openAllBoxesCost:read() ~= 0 then
			slot3 = gLanguageCsv.randomTowerJumpNextTips1
		end
	elseif slot1 == game.HUNTING_JUMP_STATE.BUFF then
		if (slot2.buff_index or 0) < itertools.size(slot2.buff_gates or {}) then
			slot3 = gLanguageCsv.randomTowerJumpNextTips2
		end
	elseif slot1 == game.HUNTING_JUMP_STATE.EVENT then
		for slot8, slot9 in pairs(slot2.events or {}) do
			if slot9[2] == 0 then
				slot3 = gLanguageCsv.randomTowerJumpNextTips3

				break
			end
		end
	end

	if slot3 ~= "" then
		gGameUI:showDialog({
			btnType = 2,
			title = gLanguageCsv.spaceTips,
			content = slot3,
			cb = function ()
				uv4 = "gGameApp"

				gGameApp:requestServer("/game/hunting/jump/next", function (slot0)
				end, slot4.route)
			end
		})
	else
		gGameApp:requestServer("/game/hunting/jump/next", function (slot0)
		end, slot0.route)
	end
end

function slot2.refreshProgressPanel(slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot4 = {}

	for slot8 = 2, 4 do
		if slot8 <= slot1 then
			table.insert(slot2, "img" .. slot8)
			table.insert(slot3, "imgBar" .. slot8)
			table.insert(slot4, "text" .. slot8)
		end
	end

	slot5 = slot0.progressPanel

	nodetools.invoke(slot5, slot2, "texture", "city/adventure/random_tower/bar_d.png")
	nodetools.invoke(slot5, slot3, "texture", "city/adventure/random_tower/bar_dt.png")
	nodetools.invoke(slot5, slot4, "setTextColor", cc.c4b(247, 83, 100, 255))
end

function slot2.refreshBuffIndex(slot0)
	slot0.panel3:removeChildByName("richTips")
	rich.createByStr(string.format("#Pfont/youmi1.ttf#" .. gLanguageCsv.huntingJumpTips5, slot0.bufRoomIndex:read() or 0, itertools.size(slot0.jumpInfo.buff_gates or {})), 50):addTo(slot0.panel3, 10):setAnchorPoint(cc.p(0.5, 0.5)):xy(slot0.panel3:get("textTips"):hide():xy()):formatText():setName("richTips")
end

function slot2.onClickOpenAll(slot0)
	if slot0.openAllBoxesCost:read() == 0 then
		return
	end

	if gGameModel.role:read("rmb") < slot0.openAllBoxesCost:read() then
		uiEasy.showDialog("rmb")
	else
		slot2 = slot0.openTimes
		slot3 = slot2
		uv3 = "openAllBoxesCost"

		if slot2.read(slot3) == slot3.ONCE then
			gGameApp:requestServerCustom("/game/hunting/jump/box/open"):params(slot0.route, 0, "open1"):onResponse(function ()
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
			end):wait({
				false
			}):doit(function (slot0)
				gGameUI:showGainDisplay(slot0)
			end)
		else
			gGameApp:requestServerCustom("/game/hunting/jump/box/open"):params(slot0.route, 0, "open3"):onResponse(function ()
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
			end):wait(slot1):doit(function (slot0)
				gGameUI:showGainDisplay(slot0)
			end)
		end
	end
end

function slot2.onClickBufRandom(slot0)
	gGameApp:requestServerCustom("/game/random_tower/jump/buff"):params(0):onResponse(function ()
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
	end):wait({
		false
	}):doit(function (slot0)
	end)
end

function slot2.onClickbuff(slot0, slot1)
	gGameApp:requestServerCustom("/game/random_tower/jump/buff"):params(slot1):onResponse(function ()
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
	end):wait({
		false
	}):doit(function (slot0)
		gGameUI:showTip("buf2")
	end)
end

function slot2.onSortMenusBtnClick(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot3 == 1 then
		uv8 = "openTimes"

		slot0.openTimes:set(slot8.ALL)
	else
		uv8 = "openTimes"

		slot0.openTimes:set(slot8.ONCE)
	end
end

return slot2
