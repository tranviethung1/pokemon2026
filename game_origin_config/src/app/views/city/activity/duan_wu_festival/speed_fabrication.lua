slot1 = class("SpeedFabricationView", cc.load("mvc").ViewBase)

function slot2(slot0, slot1, slot2, slot3)
	if math.min(slot3.num1, slot3.num2) == 0 then
		slot1:get("add"):setTouchEnabled(false)
		slot1:get("sub"):setTouchEnabled(false)
		cache.setShader(slot1:get("add"), false, "hsl_gray")
		cache.setShader(slot1:get("sub"), false, "hsl_gray")
	end

	slot1:get("sub"):setTouchEnabled(slot3.number > 0)
	cache.setShader(slot1:get("sub"), false, slot3.number > 0 and "normal" or "hsl_gray")
	slot1:get("add"):onTouch(functools.partial(slot0.itemAddClick, slot1, slot3))
	slot1:get("sub"):onTouch(functools.partial(slot0.itemSubClick, slot1, slot3))
	slot1:get("select"):onTouch(functools.partial(slot0.itemClick, slot1, slot2, slot3))
end

slot1.RESOURCE_FILENAME = "activity_duanwu_fabrication.json"
slot1.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	down = "down",
	panel = "panel",
	list = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				asyncPreload = 9,
				data = bindHelper.self("showData"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("name"):text(slot3.name)
					slot1:get("describe"):text(slot3.desc)
					slot1:get("item1"):texture(slot3.icon1)
					slot1:get("item2"):texture(slot3.icon2)
					slot1:get("select.select.icon"):visible(slot3.itemSelect)
					slot1:get("select.num"):text(slot3.number)

					slot4 = bind.extend

					slot4(slot0, slot1:get("icon"), {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key
							}
						}
					})

					uv4 = "get"

					slot4(slot0, slot1:get("select"), slot2, slot3)
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick"),
				itemAddClick = bindHelper.self("onItemAddClick"),
				itemSubClick = bindHelper.self("onItemSubClick")
			}
		}
	},
	btn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot9 = slot0
	slot8 = slot0.createHandler(slot9, "onClose")

	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot8
	}):init({
		subTitle = "ACTIVITY",
		title = gLanguageCsv.speedabrication
	})

	slot3 = widget.addAnimation(slot0.panel, "duanwuzongzi/dwj_bzz.skel", "effect_loop", 1):alignCenter(slot0.panel:size()):scale(2)
	slot0.zongziData = {}
	slot0.zongziTab = {}

	slot0:enableSchedule()

	for slot8, slot9 in orderCsvPairs(csv.yunying.bao_zongzi_recipe) do
		if slot9.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
			slot10, slot11 = csvNext(slot9.mainItem)
			slot12, slot13 = csvNext(slot9.minorItem)

			if not slot0.zongziTab[slot10] then
				slot0.zongziTab[slot10] = {}
			end

			slot0.zongziTab[slot10][slot12] = 0
		end
	end

	slot0.cb = slot2
	slot5 = {
		6352,
		6353,
		6354
	}
	slot6 = {
		6355,
		6356,
		6357
	}

	slot0.item:visible(false)

	slot0.activityID = slot1
	slot0.select = idler.new(false)
	slot0.showData = idlers.newWithMap({})
	slot7 = csv.items
	slot0.itemSelectZ = {}
	slot0.itemSelectF = {}

	for slot11 = 1, 3 do
		slot0.down:get("icon" .. slot11):texture(slot7[slot5[slot11]].icon)
		slot0.down:get("item" .. slot11):texture(slot7[slot6[slot11]].icon)
		text.addEffect(slot0.down:get("icon" .. slot11):get("num"), {
			outline = {
				color = cc.c4b(124, 117, 129, 255)
			}
		})
		text.addEffect(slot0.down:get("item" .. slot11):get("num"), {
			outline = {
				color = cc.c4b(124, 117, 129, 255)
			}
		})

		slot0.itemSelectZ[slot5[slot11]] = 0
		slot0.itemSelectF[slot6[slot11]] = 0
	end

	slot0.itemDuanwuData = {
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{}
	}
	slot8 = cc.c4b(255, 79, 100, 255)

	idlereasy.any({
		gGameModel.role:getIdler("items"),
		slot0.select
	}, function (slot0, slot1)
		slot2 = {}

		for slot6 = 1, 3 do
			slot7 = 0
			slot8 = 0
			uv9 = "itemSelectZ"

			if slot1[slot9[slot6]] then
				uv9 = "itemSelectZ"
				uv10 = "itemSelectF"
				uv11 = "itemSelectZ"
				slot7 = slot1[slot9[slot6]] - slot10.itemSelectZ[slot11[slot6]]
			end

			uv9 = "down"

			if slot1[slot9[slot6]] then
				uv9 = "down"
				uv10 = "itemSelectF"
				uv11 = "down"
				slot8 = slot1[slot9[slot6]] - slot10.itemSelectF[slot11[slot6]]
			end

			uv9 = "itemSelectF"
			slot9 = slot9.down:get("icon" .. slot6):get("num")
			slot9 = slot9.text

			slot9(slot9, slot7)

			uv9 = "itemSelectF"
			slot9 = slot9.down:get("icon" .. slot6):get("num")
			slot10 = slot9
			slot9 = slot9.color

			if slot7 < 1 or not ui.COLORS.NORMAL.WHITE then
				uv11 = "get"
			end

			slot9(slot10, slot11)

			uv9 = "itemSelectF"
			slot9 = slot9.down:get("item" .. slot6):get("num")
			slot9 = slot9.text

			slot9(slot9, slot8)

			uv9 = "itemSelectF"
			slot9 = slot9.down:get("item" .. slot6):get("num")
			slot10 = slot9
			slot9 = slot9.color

			if slot8 < 1 or not ui.COLORS.NORMAL.WHITE then
				uv11 = "get"
			end

			slot9(slot10, slot11)
		end

		for slot6, slot7 in orderCsvPairs(csv.yunying.bao_zongzi_recipe) do
			uv9 = "icon"

			if slot7.huodongID == slot9 then
				slot8, slot9 = csvNext(slot7.mainItem)
				slot10, slot11 = csvNext(slot7.minorItem)
				slot12 = slot1[slot8] or 0
				slot13 = slot1[slot10] or 0
				uv14 = "num"
				slot14 = slot14[slot8].icon
				uv15 = "num"
				slot15 = slot15[slot10].icon
				slot16, slot17 = csvNext(slot7.compoundItem)
				uv18 = "num"
				slot18 = slot18[slot16].name
				slot19 = slot7.desc
				uv20 = "itemSelectF"

				if slot20.itemDuanwuData[slot6] then
					uv20 = "itemSelectF"

					if not slot20.itemDuanwuData[slot6].itemSelect then
						slot20 = false
					end
				end

				uv21 = "itemSelectF"

				if slot21.itemDuanwuData[slot6] then
					uv21 = "itemSelectF"

					if not slot21.itemDuanwuData[slot6].number then
						slot21 = 0
					end
				end

				slot22 = {
					csvId = slot6,
					icon1 = slot14,
					icon2 = slot15,
					id1 = slot8,
					id2 = slot10,
					key = slot16,
					name = slot18,
					num1 = slot12,
					num2 = slot13,
					desc = slot19,
					number = slot21,
					itemSelect = slot20
				}
				slot23 = table.insert

				slot23(slot2, slot22)

				uv23 = "itemSelectF"
				slot23.itemDuanwuData[slot6] = slot22
			end
		end

		uv3 = "itemSelectF"

		slot3.showData:update(slot2)
	end)
end

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot5.name == "ended" or slot5.name == "cancelled" then
		if math.min(slot4.num1, slot4.num2) == 0 then
			slot7 = nil

			gGameUI:showTip(string.format(gLanguageCsv.ingredientInsufficient, slot4.num1 == 0 and slot4.num2 == 0 and csv.items[slot4.id1].name .. "," .. csv.items[slot4.id2].name or (slot4.num1 ~= 0 or csv.items[slot4.id1].name) and csv.items[slot4.id2].name))

			return
		elseif slot4.number == 0 then
			gGameUI:showTip(gLanguageCsv.selectMaterials)

			return
		elseif slot0.zongziData[slot4.csvId] then
			slot2:get("select.icon"):visible(false)

			slot0.zongziData[slot4.csvId] = nil
			slot0.itemDuanwuData[slot4.csvId].itemSelect = false
		else
			slot2:get("select.icon"):visible(true)

			slot0.zongziData[slot4.csvId] = slot0.zongziTab[slot4.id1][slot4.id2]
			slot0.itemDuanwuData[slot4.csvId].itemSelect = true
		end
	end
end

function slot1.addItemFunc(slot0, slot1, slot2, slot3)
	if slot3.name == "began" then
		if slot2.num1 <= slot0.itemSelectZ[slot2.id1] and slot2.num2 <= slot0.itemSelectF[slot2.id2] then
			gGameUI:showTip(string.format(gLanguageCsv.ingredientInsufficient, csv.items[slot2.id1].name .. "," .. csv.items[slot2.id2].name))

			return
		end

		if slot2.num1 <= slot0.itemSelectZ[slot2.id1] then
			gGameUI:showTip(string.format(gLanguageCsv.ingredientInsufficient, csv.items[slot2.id1].name))

			return
		end

		if slot2.num2 <= slot0.itemSelectF[slot2.id2] then
			gGameUI:showTip(string.format(gLanguageCsv.ingredientInsufficient, csv.items[slot2.id2].name))

			return
		end

		if math.min(slot2.num1 - slot0.itemSelectZ[slot2.id1], slot2.num2 - slot0.itemSelectF[slot2.id2]) >= 1 then
			slot0.itemSelectZ[slot2.id1] = slot0.itemSelectZ[slot2.id1] + 1
			slot0.itemSelectF[slot2.id2] = slot0.itemSelectF[slot2.id2] + 1
			slot0.zongziTab[slot2.id1][slot2.id2] = slot0.zongziTab[slot2.id1][slot2.id2] + 1
			slot0.itemDuanwuData[slot2.csvId].number = slot0.zongziTab[slot2.id1][slot2.id2]
			slot2.number = slot0.zongziTab[slot2.id1][slot2.id2]

			slot1:get("num"):text(slot0.zongziTab[slot2.id1][slot2.id2])

			if slot0.itemDuanwuData[slot2.csvId].number >= 1 and not slot0.zongziData[slot2.csvId] then
				slot1:get("select"):get("icon"):visible(true)

				slot0.zongziData[slot2.csvId] = slot0.zongziTab[slot2.id1][slot2.id2]
				slot0.itemDuanwuData[slot2.csvId].itemSelect = true
			end

			if slot0.zongziData[slot2.csvId] then
				slot0.zongziData[slot2.csvId] = slot0.zongziTab[slot2.id1][slot2.id2]
			end
		end
	elseif slot3.name == "ended" or slot3.name == "cancelled" then
		slot0.select:set(true, true)
	end
end

function slot1.onItemAddClick(slot0, slot1, slot2, slot3, slot4)
	if slot4.name == "click" then
		slot0:unScheduleAll()
		slot0:addItemFunc(slot2, slot3, slot4)
	elseif slot4.name == "began" then
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
		end, 0.1, 0, 1)
	elseif slot4.name == "ended" or slot4.name == "cancelled" then
		slot0:unScheduleAll()
		slot0:addItemFunc(slot2, slot3, slot4)
	end
end

function slot1.subItemFunc(slot0, slot1, slot2, slot3)
	if slot3.name == "began" then
		if slot2.number == 1 then
			if slot0.zongziData[slot2.csvId] then
				slot1:get("select.icon"):visible(false)

				slot0.zongziData[slot2.csvId] = nil
				slot0.itemDuanwuData[slot2.csvId].itemSelect = false
			end
		elseif slot2.number == 0 then
			return
		end

		slot0.itemSelectZ[slot2.id1] = slot0.itemSelectZ[slot2.id1] - 1
		slot0.itemSelectF[slot2.id2] = slot0.itemSelectF[slot2.id2] - 1
		slot0.zongziTab[slot2.id1][slot2.id2] = slot0.zongziTab[slot2.id1][slot2.id2] - 1
		slot0.itemDuanwuData[slot2.csvId].number = slot0.zongziTab[slot2.id1][slot2.id2]

		slot1:get("num"):text(slot0.zongziTab[slot2.id1][slot2.id2])

		slot2.number = slot0.zongziTab[slot2.id1][slot2.id2]

		if slot0.zongziData[slot2.csvId] then
			slot0.zongziData[slot2.csvId] = slot0.zongziTab[slot2.id1][slot2.id2]
		end
	elseif slot3.name == "ended" or slot3.name == "cancelled" then
		slot0.select:set(true, true)
	end
end

function slot1.onItemSubClick(slot0, slot1, slot2, slot3, slot4)
	if slot4.name == "click" then
		slot0:unScheduleAll()
		slot0:subItemFunc(slot2, slot3, slot4)
	elseif slot4.name == "began" then
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
		end, 0.1, 0, 1)
	elseif slot4.name == "ended" or slot4.name == "cancelled" then
		slot0:unScheduleAll()
		slot0:subItemFunc(slot2, slot3, slot4)
	end
end

function slot1.btnClick(slot0)
	if csvSize(slot0.zongziData) == 0 then
		gGameUI:showTip(gLanguageCsv.noSelectZongZi)

		return
	end

	if slot0.cb then
		slot0.cb("speedMake", slot0.zongziData)

		slot0.zongziData = {}
		slot0.zongziTab = {}
	end
end

return slot1
