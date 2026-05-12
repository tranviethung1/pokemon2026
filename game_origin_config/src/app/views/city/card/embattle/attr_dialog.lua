slot0 = cc.load("mvc").ViewBase
slot1 = class("CardEmbattleAttrDialog", Dialog)

function slot2(slot0, slot1)
	if slot1 then
		return
	end

	text.addEffect(slot0, {
		color = cc.c4b(182, 175, 157, 255)
	})
end

slot1.RESOURCE_FILENAME = "card_embattle_attr_dialog.json"
slot1.RESOURCE_BINDING = {
	["leftPanel.item"] = "leftItem",
	armPanel = "armPanel",
	["buffPanel.textNote1"] = "textNote1",
	title1 = "title1",
	title = "title",
	["buffPanel.textItem1"] = "textItem1",
	leftPanel = "leftPanel",
	["buffPanel.item"] = "item",
	["buffPanel.text"] = "attrText",
	["buffPanel.textItem2"] = "textItem2",
	noDataPanel = "noDataPanel",
	["armPanel.subList"] = "bottomSubList",
	["armPanel.bottomItem"] = "armBottomItem",
	["buffPanel.subList"] = "subList",
	["buffPanel.textNote3"] = "textNote3",
	buffPanel = "buffPanel",
	["armPanel.topItem"] = "topItem",
	["buffPanel.bottomItem"] = "bottomItem",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["buffPanel.list"] = {
		varname = "buffList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 4,
				data = bindHelper.self("buffData1"),
				item = bindHelper.self("item"),
				textItem = bindHelper.self("textItem1"),
				itemAction = {
					isAction = true
				},
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "textList", "text", "bg")

					slot4.icon:texture(slot3.icon)
					slot4.text:text(slot3.desc)
					adapt.setTextAdaptWithSize(slot4.text, {
						margin = -3,
						vertical = "center",
						size = cc.size(1100, 100)
					})
					bind.extend(slot0, slot4.textList, {
						class = "listview",
						props = {
							data = slot3.data,
							item = slot0.textItem,
							onItem = function (slot0, slot1, slot2, slot3)
								slot4 = slot1:multiget("text1", "text2")

								slot4.text1:text(slot3[1])
								slot4.text2:text(slot3[2])

								slot5 = adapt.oneLinePos
								slot7 = slot4.text2

								slot5(slot4.text1, slot7, cc.p(0, 0))

								uv5 = "multiget"
								uv7 = "text1"
								slot7 = slot7.isGet

								slot5(slot4.text1, slot7)

								uv5 = "multiget"
								uv7 = "text1"

								slot5(slot4.text2, slot7.isGet)
							end
						}
					})

					slot5 = slot4.icon:get("mask")
					slot5 = slot5.visible

					slot5(slot5, not slot3.isGet)

					uv5 = "multiget"

					slot5(slot4.text, slot3.isGet)

					if slot3.isLast then
						slot4.bg:hide()
					end
				end
			},
			handlers = {
				afterBuild = bindHelper.self("initBottomType")
			}
		}
	},
	["leftPanel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("leftDatas"),
				item = bindHelper.self("leftItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot6:get("txt"):text(slot3.name):getVirtualRenderer():setLineSpacing(-10)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onLeftItemClick")
			}
		}
	},
	["armPanel.topItem.icon.name"] = {
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
	["armPanel.topList"] = {
		varname = "topList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("teamArms"),
				item = bindHelper.self("topItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3[1] or 0
					slot5 = slot3[2] or 0

					slot1:multiget("add", "icon", "desc").add:visible(slot4 == 0)
					slot6.icon:visible(slot4 ~= 0)
					slot6.desc:visible(slot4 ~= 0)
					slot6.icon:removeChildByName("effect")

					if slot4 ~= 0 then
						slot6.icon:get("name"):text(gLanguageCsv.effortAdvance .. slot5)

						slot12 = 1
						slot7 = widget.addAnimationByKey(slot6.icon, csv.arms.arms[slot4].spine, "effect", string.format("effect_%s_loop", csv.arms.arms[slot4].natureType), slot12):xy(slot6.icon:width() / 2, 20):scale(0.8)
						slot8 = nil

						for slot12 = slot5, 1, -1 do
							if gArmStage[slot4][slot12].skillID ~= 0 then
								slot13 = slot6.desc
								slot15, slot16 = beauty.textScroll({
									fontSize = 40,
									isRich = true,
									list = slot13,
									strs = "#C0x5B545B#" .. dataEasy.getSkillDesc(csv.skill[gArmStage[slot4][slot12].skillID])
								})
								slot16 = math.min(slot16, 170)

								slot13:height(slot16):y((slot1:height() - slot16) / 2)

								break
							end
						end
					end

					bind.touch(slot0, slot6.icon, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
					slot0:setRenderHint(0)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onArmDownClick")
			}
		}
	},
	["armPanel.bottomItem.icon.name"] = {
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
	["armPanel.bottomList"] = {
		varname = "armBottomList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				yMargin = 15,
				xMargin = 5,
				topPadding = 10,
				columnSize = 9,
				data = bindHelper.self("bottomArmsData"),
				item = bindHelper.self("bottomSubList"),
				cell = bindHelper.self("armBottomItem"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot5 = slot1:multiget("icon", "mask")

					slot5.mask:visible(slot3.selected)
					slot5.icon:removeChildByName("effect")
					slot5.icon:get("name"):text(gLanguageCsv.effortAdvance .. slot3.stage)

					slot6 = widget.addAnimationByKey(slot5.icon, csv.arms.arms[slot3.armID].spine, "effect", string.format("effect_%s_loop", csv.arms.arms[slot3.armID].natureType), 1):xy(slot5.icon:width() / 2, 30):scale(0.7)

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onArmClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)

	slot0.params = slot1
	slot0.cb = slot1.cb
	slot0.originTeamArms = slot1.teamArms

	if isIdler(slot1.teamArms) then
		slot0.originTeamArms = slot1.teamArms:read()
	end

	slot0:initModel(slot1)
	slot0.leftPanel:hide()
	slot0.armPanel:hide()
	slot0.buffPanel:hide()

	if not slot1.teamBuffs then
		slot0.armPanel:show()
		slot0:refreshArmsPanel()
	elseif not dataEasy.isUnlock(gUnlockCsv.arms) or not slot0.originTeamArms then
		slot0:refreshBuffPanel(slot1.teamBuffs)
		slot0.buffPanel:show()
	else
		slot0.leftPanel:show()
		slot0.showTab:addListener(function (slot0, slot1)
			uv2 = "leftDatas"
			slot2 = slot2.leftDatas:atproxy(slot1)
			slot2.select = false
			uv2 = "leftDatas"
			slot2 = slot2.leftDatas:atproxy(slot0)
			slot2.select = true
			uv2 = "leftDatas"
			slot2 = slot2.buffPanel
			slot2 = slot2.visible

			slot2(slot2, slot0 == 1)

			uv2 = "leftDatas"

			slot2.armPanel:visible(slot0 == 2)

			if slot0 == 1 then
				uv2 = "leftDatas"
				slot2 = slot2.noDataPanel
				slot2 = slot2.hide

				slot2(slot2)

				uv2 = "leftDatas"
				uv4 = "atproxy"

				slot2:refreshBuffPanel(slot4.teamBuffs)
			else
				uv2 = "leftDatas"

				slot2:refreshArmsPanel()
			end
		end)
	end
end

function slot1.initModel(slot0, slot1)
	slot0.allArmsData = gGameModel.role:getIdler("arms_stage")
	slot0.buffData1 = {}
	slot0.buffData2 = {}
	slot0.showTab = idler.new(1)
	slot0.leftDatas = idlers.newWithMap({
		{
			select = true,
			name = gLanguageCsv.buffText
		},
		{
			name = gLanguageCsv.armsText
		}
	})

	if slot1.teamArms then
		if slot1.idx then
			slot2 = table.deepcopy(slot0.originTeamArms or {}, true)[slot1.idx] or {}
		end

		if itertools.size(slot2) < 2 then
			for slot6 = 1, 2 do
				slot2[slot6] = slot2[slot6] or {}
			end
		end

		slot0.teamArms = idlereasy.new(slot2)

		if isIdler(slot1.teamArms) then
			idlereasy.when(slot0.teamArms, function (slot0, slot1)
				uv2 = "idx"

				if slot2.idx then
					uv2 = "idx"

					slot2.teamArms:modify(function (slot0)
						uv1 = "idx"
						uv2 = "idx"
						slot0[slot1.idx] = slot2

						return true, slot0
					end, true)
				else
					uv2 = "idx"

					slot2.teamArms:set(slot1, true)
				end
			end)
		end
	end

	slot0.bottomArmsData = idlers.newWithMap({})
end

function slot1.onCleanup(slot0)
	uv1 = "onCleanup"

	slot1.onCleanup(slot0)
end

function slot1.refreshBuffPanel(slot0, slot1)
	slot3 = {}
	slot4 = {}
	slot5 = {}

	for slot9, slot10 in csvPairs(csv.battle_card_halo) do
		slot11 = false

		if slot10.type == 1 then
			slot12 = {}

			for slot16 = 1, 3 do
				if slot10["attrType" .. slot16] ~= 0 then
					slot18 = slot10["attrValue" .. slot16]
					slot19 = gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot10["attrType" .. slot16]])]

					if slot1[slot9] then
						slot11 = true
						slot20 = false

						if string.find(slot18, "%%") then
							slot21 = string.sub(slot21, 1, #slot21 - 1)
							slot20 = true
						end

						slot3[slot19] = slot3[slot19] or {
							value = 0,
							attr = slot17,
							percent = slot20
						}
						slot3[slot19].value = slot3[slot19].value + tonumber(slot21)
					end

					table.insert(slot12, {
						slot19,
						"+" .. dataEasy.getAttrValueString(slot17, slot18)
					})
				end
			end

			table.insert(slot4, {
				id = slot9,
				icon = slot10.icon,
				desc = slot10.desc,
				isGet = slot11,
				data = slot12
			})
		elseif slot10.type == 2 then
			slot0.bottomIcon = slot10.icon
			slot0.bottomDesc = slot10.desc
			slot13 = slot10.args[1]

			if slot1[slot9] then
				slot11 = true
			end

			table.insert(slot5, {
				attr = slot13[1],
				num = "+" .. slot13[2],
				str1 = gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot10.attrType1])],
				str2 = "+" .. dataEasy.getAttrValueString(slot10.attrType1, slot10.attrValue1),
				isGet = slot11
			})
		end
	end

	table.sort(slot4, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	if #slot5 <= 0 then
		slot4[#slot4].isLast = true
	end

	slot0.buffData1 = slot4
	slot0.buffData2 = slot5
	slot8 = {}

	for slot12, slot13 in pairs(slot3) do
		if slot13.percent then
			slot14 = slot12 .. "+" .. dataEasy.getAttrValueString(slot13.attr, slot13.value) .. "%"
		end

		table.insert(slot8, {
			attrId = slot13.attr,
			str = slot14
		})
	end

	table.sort(slot8, function (slot0, slot1)
		return slot0.attrId < slot1.attrId
	end)

	slot9 = {}

	for slot13, slot14 in pairs(slot8) do
		table.insert(slot9, slot14.str)
	end

	slot0.attrText:text(table.concat(slot9, ", "))
	slot0.textNote1:text(gLanguageCsv.teamHaloTitle)

	if not matchLanguage({
		"cn",
		"tw"
	}) then
		adapt.setTextAdaptWithSize(slot0.textNote1, {
			margin = -3,
			size = cc.size(1650, 200)
		})
		slot0.textNote1:y(slot0.textNote1:y() - 55)
		adapt.setTextAdaptWithSize(slot0.textNote3, {
			margin = -8,
			size = cc.size(1650, 200)
		})
		slot0.textNote3:y(slot0.textNote3:y() - 55)
	end
end

function slot1.initBottomType(slot0)
	slot1 = 3
	slot3 = slot0.bottomItem:clone():show():multiget("icon", "text", "list", "bg")

	slot3.bg:hide()
	slot3.icon:texture(slot0.bottomIcon)
	slot3.text:text(slot0.bottomDesc)

	slot4 = false

	slot3.list:setScrollBarEnabled(false)
	slot0.subList:setScrollBarEnabled(false)

	slot6 = slot0.subList:clone():size().height
	slot7 = 0
	slot8 = 0
	slot9 = 0

	function slot10()
		uv0 = "list"
		slot0 = slot0.list
		slot1 = slot0
		slot0 = slot0.pushBackCustomItem
		uv2 = "pushBackCustomItem"

		slot0(slot1, slot2)

		uv0 = "subList"
		uv2 = 1
		uv3 = slot1
		uv4 = slot1
		uv0 = "pushBackCustomItem"
		slot0 = (slot0 + 1).subList:clone()
		uv1 = 1
	end

	for slot14, slot15 in pairs(slot0.buffData2) do
		slot17 = slot0.textItem2:clone():multiget("text1", "text2", "text3", "icon")

		slot17.icon:texture(ui.ATTR_ICON[slot15.attr])
		slot17.text1:text(slot15.num)
		slot17.text2:text(slot15.str1)

		slot18 = slot17.text3
		slot18 = slot18.text

		slot18(slot18, slot15.str2)

		uv18 = "bottomItem"

		slot18(slot17.text1, slot15.isGet)

		uv18 = "bottomItem"

		slot18(slot17.text2, slot15.isGet)

		uv18 = "bottomItem"

		slot18(slot17.text3, slot15.isGet)

		if slot15.isGet then
			slot4 = true
		end

		slot18 = slot16:size()

		adapt.oneLinePos(slot17.text2, slot17.text3, cc.p(0, 0))
		slot16:size(slot18.width + slot17.text2:size().width + slot17.text3:size().width, slot18.height)

		if slot5:size().width < slot9 + slot16:size().width then
			slot10()
		end

		slot9 = slot9 + slot23

		slot5:pushBackCustomItem(slot16)

		if slot1 <= slot8 + 1 then
			slot10()
		end
	end

	if slot8 > 0 then
		slot10()
	end

	slot11 = slot3.list:size()
	slot12 = math.max(slot7 - 1, 0) * slot0.subList:size().height

	slot3.list:size(slot11.width, slot11.height + slot12)

	slot13 = slot2:size()

	slot2:size(slot13.width, slot13.height + slot12)
	slot3.icon:y(slot3.icon:y() + slot12)

	slot14 = slot3.text
	slot14 = slot14.y

	slot14(slot14, slot3.text:y() + slot12)

	uv14 = "bottomItem"

	slot14(slot3.text, slot4)
	slot3.icon:get("mask"):visible(not slot4)

	if slot7 > 0 then
		slot0.buffList:pushBackCustomItem(slot2)
	end
end

function slot1.onLeftItemClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot1.onArmDownClick(slot0, slot1, slot2, slot3)
	for slot7, slot8 in slot0.bottomArmsData:pairs() do
		if slot8:read().armID == slot3[1] then
			slot0.bottomArmsData:atproxy(slot7).selected = false

			break
		end
	end

	slot0.teamArms:modify(function ()
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
end

function slot1.onArmClick(slot0, slot1, slot2, slot3)
	slot5 = slot0.teamArms:read()[1][1] or 0
	slot6 = slot4[2][1] or 0

	if slot3.selected then
		slot0.bottomArmsData:atproxy(slot2.k).selected = false

		slot0.teamArms:modify(function ()
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
	elseif slot5 == 0 then
		slot0.bottomArmsData:atproxy(slot2.k).selected = true

		slot0.teamArms:modify(function (slot0)
			uv2 = "armID"
			slot2 = slot2.armID
			slot0[1][1] = slot2
			uv2 = "armID"
			slot0[1][2] = slot2.stage

			return true, slot0
		end, true)
	elseif slot6 == 0 then
		slot0.bottomArmsData:atproxy(slot2.k).selected = true

		slot0.teamArms:modify(function (slot0)
			uv2 = "armID"
			slot2 = slot2.armID
			slot0[2][1] = slot2
			uv2 = "armID"
			slot0[2][2] = slot2.stage

			return true, slot0
		end, true)
	else
		gGameUI:showTip(gLanguageCsv.armsMax)
	end
end

function slot1.refreshArmsPanel(slot0)
	slot2 = {}
	slot4 = {
		slot0.teamArms:read()[1] and slot3[1][1] or 0,
		slot3[2] and slot3[2][1] or 0
	}

	for slot8, slot9 in pairs(slot0.allArmsData:read()) do
		for slot13, slot14 in orderCsvPairs(csv.arms.stage) do
			if slot14.armID == slot8 and slot14.stage <= slot9 and slot14.skillID ~= 0 then
				table.insert(slot2, {
					armID = slot8,
					stage = slot9,
					selected = slot4[1] == slot8 or slot4[2] == slot8
				})

				break
			end
		end
	end

	slot0.noDataPanel:visible(itertools.size(slot2) == 0)
	slot0.armPanel:visible(itertools.size(slot2) ~= 0)
	slot0.topList:visible(itertools.size(slot2) ~= 0)

	for slot8 = 1, 2 do
		if itertools.include(itertools.map(slot2, function (slot0, slot1)
			return slot1.armID
		end), slot4[slot8]) then
			slot0.teamArms:modify(function ()
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
		end

		if not itertools.include(itertools.map(slot2, function (slot0, slot1)
			return slot1.armID
		end), slot4[slot8]) then
			slot0.teamArms:modify(function ()
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
		end
	end

	table.sort(slot2, function (slot0, slot1)
		if slot0.stage ~= slot1.stage then
			return slot1.stage < slot0.stage
		end

		return slot0.armID < slot1.armID
	end)
	slot0.bottomArmsData:update(slot2)
end

return slot1
