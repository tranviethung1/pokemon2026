slot0 = 5
slot1 = cc.load("mvc").ViewBase
slot2 = class("CardAdvanceOneKeyView", Dialog)
slot2.RESOURCE_FILENAME = "card_equip_fast_strengthen.json"
slot2.RESOURCE_BINDING = {
	["top.cashNum"] = "cashNum",
	["top.cashIcon"] = "cashIcon",
	["top.nameMax"] = "nameMax",
	item = "item",
	["top.name"] = "cardName",
	subList = "subList",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["top.subBtn"] = {
		varname = "subBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReduceClick")
			}
		}
	},
	["top.addBtn"] = {
		varname = "addBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddClick")
			}
		}
	},
	sureBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOneKeyAdvanceClick")
			}
		}
	},
	cancelBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["cancelBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["sureBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	card = {
		binds = {
			event = "extend",
			class = "equip_icon",
			props = {
				selected = false,
				data = bindHelper.self("equipData"),
				onNode = function (slot0)
					slot0:setTouchEnabled(false)
					slot0:get("imgArrow"):hide()
				end
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				asyncPreload = 12,
				columnSize = 6,
				data = bindHelper.self("itemData"),
				dataOrderCmpGen = bindHelper.self("onSortRank", true),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:size()

					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.id,
								num = slot3.num,
								targetNum = slot3.targetNum
							},
							grayState = slot3.num < slot3.targetNum and 1 or 0,
							onNode = function (slot0)
								slot0:setTouchEnabled(false)

								slot1 = slot0:size()
								slot3 = slot0
								slot4 = "addIcon"
								uv3 = "setTouchEnabled"
								uv4 = "setTouchEnabled"

								if slot4.num < slot3.targetNum then
									if not slot0.get(slot3, slot4) then
										ccui.ImageView:create("common/btn/btn_add_icon.png"):xy(slot1.width / 2, slot1.height / 2):addTo(slot0, 600, "addIcon")
									else
										slot2:show()
									end
								elseif slot2 then
									slot2:hide()
								end
							end
						}
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2, slot3)
	slot0.selectDbId = slot1
	slot0.equipId = slot2
	slot0.cb = slot3

	slot0:initModel()

	slot4 = csv.equips[slot0.equipId]
	slot0.equipData = slot0.equips:read()[slot4.part]
	slot5 = slot4.name0

	if slot0.equipData.awake ~= 0 then
		slot5 = slot4.name1 .. gLanguageCsv["symbolRome" .. slot0.equipData.awake]
	end

	slot6, slot7 = dataEasy.getQuality(slot0.equipData.advance)

	text.addEffect(slot0.cardName, {
		color = slot6 == 1 and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.QUALITY[slot6]
	})
	slot0.cardName:text(slot5 .. slot7)

	for slot12, slot13 in orderCsvPairs(slot4.roleLevelMax) do
		if slot13 <= slot0.roleLv:read() and 0 < slot12 then
			slot8 = slot12
		end
	end

	slot9 = slot4.strengthMax[math.min(slot4.advanceMax, slot8 + 1)]
	slot11 = slot0.equipData.equip_id
	slot0.isLvMax = slot9 <= slot0.equipData.level
	slot0.currLevelLimit = slot9
	slot13 = itertools.map(slot4.strengthMax, function (slot0, slot1)
		return slot1, slot0
	end)
	slot15 = {}
	slot16 = 0
	slot17 = true

	for slot21 = slot12 + 1, slot9 do
		if slot13[slot21] and (slot0.equipData.advance or 0) <= slot13[slot21] then
			for slot26, slot27 in csvPairs(gEquipAdvanceCsv[slot11][slot13[slot21]].costItemMap) do
				slot15[slot26] = (slot15[slot26] or 0) + slot27

				if slot0.gold < slot16 + slot22.costGold or dataEasy.getNumByKey(slot26) < slot15[slot26] then
					slot17 = false
				end
			end

			if not slot17 then
				slot14 = slot4.strengthMax[math.min(slot4.advanceMax, slot13[slot21])]

				break
			end
		end

		slot14 = slot21
	end

	slot0.selectLv = idler.new(slot14)
	slot0.itemData = idlertable.new({})

	idlereasy.when(slot0.selectLv, function ()
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
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot1 = gGameModel.cards:find(slot0.selectDbId)
	slot0.fight = slot1:getIdler("fighting_point")
	slot0.equips = slot1:getIdler("equips")
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.gold = gGameModel.role:read("gold")
end

function slot2.onAddClick(slot0)
	slot5 = slot0.selectLv
	slot6 = slot5
	uv6 = "selectLv"

	slot0.selectLv:set(math.min(slot0.currLevelLimit, slot5.read(slot6) + slot6))
end

function slot2.onReduceClick(slot0)
	slot5 = slot0.selectLv
	slot6 = slot5
	uv6 = "selectLv"

	slot0.selectLv:set(math.max(slot0.equipData.level + 1, slot5.read(slot6) - slot6))
end

function slot2.onOneKeyAdvanceClick(slot0)
	slot1 = csv.equips[slot0.equipId]

	if not slot0.isEnoughItem then
		gGameUI:showTip(gLanguageCsv.equipNotEnoughAdvanceItems)

		return
	end

	if slot0.isLvMax then
		gGameUI:showTip(gLanguageCsv.currentLevelNotAvailable)

		return
	end

	if not slot0.isEnoughGoldStrengthen then
		gGameUI:showTip(gLanguageCsv.strengthGoldNotEnough)

		return
	end

	gGameApp:requestServerCustom("/game/equip/strength"):params(slot0.selectDbId, slot1.part, slot0.selectLv, true):onResponse(function ()
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
		uv1 = "itemData"
		uv2 = "itemData"
		slot3 = slot2
		slot2 = slot2.addCallbackOnExit
		uv5 = "itemData"

		slot2(slot3, functools.partial(slot5.cb, slot1.itemData:size() > 0))

		uv2 = "size"
		uv3 = "itemData"

		slot2.onClose(slot3)
	end)
end

function slot2.onItemClick(slot0, slot1, slot2, slot3)
	gGameUI:stackUI("common.gain_way", nil, , slot3.id, slot0:createHandler("refreshUI"), slot3.num)
end

function slot2.refreshUI(slot0)
	slot0.selectLv:notify()
end

function slot2.onSortRank(slot0, slot1)
	return function (slot0, slot1)
		if slot0.orderKey ~= slot1.orderKey then
			return slot1.orderKey < slot0.orderKey
		end

		return slot0.id < slot1.id
	end
end

return slot2
