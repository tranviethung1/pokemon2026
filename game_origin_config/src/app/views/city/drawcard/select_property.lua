slot0 = class("SelectPropertyDialog", Dialog)
slot1 = gLanguageCsv.selfChooseFree
slot2 = gLanguageCsv.selfChooseCost
slot3 = gCommonConfigCsv.drawCardUpChangeLimit
slot4 = 0

function slot5(slot0, slot1)
	for slot5 = 1, 5 do
		slot0:get("icon" .. slot5):hide()
		slot0:get("circle.img" .. slot5):hide()
	end

	slot0:get("select"):visible(slot1.select)

	if table.getn(slot1.cfg.attrs) == 1 then
		function (slot0, slot1)
			uv2 = "get"
			slot5 = slot0
			uv5 = "icon"
			slot2 = slot2:get("icon" .. slot5):texture(ui.SKILL_ICON[slot5.cfg.attrs[slot1]])
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "get"
			slot5 = slot0
			uv5 = "icon"

			slot2:get("circle.img" .. slot5):texture(ui.SKILL_TEXT_ICON[slot5.cfg.attrs[slot1]]):show()
		end(1, 1)
	elseif table.getn(slot1.cfg.attrs) == 2 then
		slot2(2, 1)
		slot2(3, 2)
	elseif table.getn(slot1.cfg.attrs) == 3 then
		slot2(1, 1)
		slot2(4, 2)
		slot2(5, 3)
	end
end

slot0.RESOURCE_FILENAME = "drawcard_property_choose.json"
slot0.RESOURCE_BINDING = {
	icon = "icon",
	subList = "subList",
	item = "item",
	["title.textNote2"] = "textNote2",
	tipPanel = "tipPanel",
	["title.textNote"] = "textNote",
	leftTimes = "leftTimes",
	subList2 = "subList2",
	previewPanel = "previewPanel",
	btnSwitch = {
		varname = "btnSwitch",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSwitch")
			}
		}
	},
	["barBg.text1"] = {
		varname = "specifiTip1",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(241, 62, 87, 255)
				}
			}
		}
	},
	["barBg.text2"] = {
		varname = "specifiTip2",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(241, 62, 87, 255)
				}
			}
		}
	},
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				yMargin = 0,
				xMargin = 94,
				topPadding = 0,
				leftPadding = 0,
				data = bindHelper.self("showDatas"),
				columnSize = bindHelper.self("midColumnSize"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					uv4 = "bind"

					slot4(slot1, slot3)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	["previewPanel.list"] = {
		varname = "prelist",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				yMargin = 5,
				asyncPreload = 6,
				xMargin = 50,
				data = bindHelper.self("previewDatas"),
				columnSize = bindHelper.self("previewMidColumnSize"),
				item = bindHelper.self("subList2"),
				cell = bindHelper.self("icon"),
				leftPadding = slot4,
				topPadding = slot4,
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.midColumnSize = 2
	slot0.previewMidColumnSize = 3
	slot0.showDatas = idlers.new()
	slot0.previewDatas = idlers.new()
	slot0.cards = {}
	slot0.select = slot1 > 0 and slot1 or 1
	slot0.lastSelect = slot0.select
	slot0.currentCost = 0

	slot0:initModel(slot0.select)

	slot0.changeTimes = gGameModel.daily_record:getIdler("draw_card_up_change_times")

	idlereasy.when(slot0.changeTimes, function (slot0, slot1)
		slot3 = slot1 or 0
		uv5 = "gCostCsv"
		slot5.currentCost = gCostCsv.draw_card_up_change_cost[slot3 + 1] or 100
		slot5 = nil
		uv6 = "draw_card_up_change_cost"

		if slot6 - slot3 > 0 then
			uv6 = "draw_card_up_change_cost"
			slot5 = slot6 - slot3
		else
			slot5 = 0
		end

		if slot5 > 0 then
			uv6 = "gCostCsv"

			slot6.btnSwitch:setTouchEnabled(true)

			if slot4 > 0 then
				uv6 = "gCostCsv"
				slot6 = slot6.tipPanel:get("textfree")
				slot6 = slot6.hide

				slot6(slot6)

				uv6 = "gCostCsv"
				slot8 = "cost"
				uv8 = "currentCost"
				slot6 = slot6.tipPanel:get(slot8):text(slot8 .. slot4)
				slot6 = slot6.show

				slot6(slot6)

				uv6 = "gCostCsv"
				slot6 = slot6.tipPanel:get("diamond")
				slot7 = slot6

				slot6.show(slot7)

				uv7 = "gCostCsv"
				slot7 = slot7.tipPanel
				slot8 = slot7
				uv8 = "gCostCsv"

				adapt.oneLinePos(slot7.get(slot8, "cost"), slot8.tipPanel:get("diamond"), cc.p(4, 0))
			else
				uv6 = "gCostCsv"
				slot8 = "textfree"
				uv8 = "btnSwitch"
				slot6 = slot6.tipPanel:get(slot8):text(slot8)
				slot6 = slot6.show

				slot6(slot6)

				uv6 = "gCostCsv"
				slot6 = slot6.tipPanel:get("cost")
				slot6 = slot6.hide

				slot6(slot6)

				uv6 = "gCostCsv"

				slot6.tipPanel:get("diamond"):hide()
			end
		else
			uv6 = "gCostCsv"
			slot6 = slot6.tipPanel:get("textfree")
			slot6 = slot6.hide

			slot6(slot6)

			uv6 = "gCostCsv"
			slot6 = slot6.tipPanel:get("cost")
			slot6 = slot6.hide

			slot6(slot6)

			uv6 = "gCostCsv"
			slot6 = slot6.tipPanel:get("diamond")
			slot6 = slot6.hide

			slot6(slot6)

			uv6 = "gCostCsv"
			slot6 = slot6.btnSwitch
			slot7 = slot6

			slot6.setTouchEnabled(slot7, false)

			uv7 = "gCostCsv"

			cache.setShader(slot7.btnSwitch, false, "hsl_gray")
		end

		uv6 = "gCostCsv"
		slot6 = slot6.leftTimes:get("num")
		slot7 = slot6
		uv10 = "draw_card_up_change_cost"

		slot6.text(slot7, slot5 .. "/" .. slot10)

		uv7 = "gCostCsv"
		slot7 = slot7.leftTimes
		slot8 = slot7
		uv8 = "gCostCsv"

		adapt.oneLinePos(slot7.get(slot8, "text"), slot8.leftTimes:get("num"), cc.p(3, 0))
	end)
	slot0.specifiTip1:text(gLanguageCsv.selfChooseSelect)
	slot0.specifiTip2:text(gLanguageCsv.selfChooseUP)
	adapt.oneLinePos(slot0.textNote, slot0.textNote2, cc.p(4, 0))
	adapt.oneLinePos(slot0.specifiTip1, slot0.specifiTip2, cc.p(2, 0))
end

function slot0.initModel(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in csvMapPairs(csv.draw_card_up_group) do
		table.insert(slot2, {
			id = slot6,
			cfg = slot7,
			select = slot1 == slot6
		})
	end

	table.sort(slot2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.showDatas:update(slot2)
end

function slot0.onItemClick(slot0, slot1, slot2, slot3, slot4)
	slot0.select = slot4.id

	gGameUI:showItemDetailCustom(slot2, slot4.cfg.cards, "city.drawcard.select_property_detail", {
		childsName = {
			"previewPanel"
		},
		tipParams = {
			offy = 100,
			offx = 0,
			dir = slot4.id % 2 == 0 and "right" or "left"
		}
	})
	slot0:initModel(slot4.id)
end

function slot0.onSwitch(slot0)
	if slot0.lastSelect == slot0.select then
		gGameUI:showTip(gLanguageCsv.sameAttributeSwitch)

		return
	end

	if gGameModel.role:read("rmb") < slot0.currentCost then
		uiEasy.showDialog("rmb")

		return
	end

	function slot1()
		uv4 = "gGameApp"

		gGameApp:requestServer("/game/lottery/card/up/choose", function (slot0)
			uv1 = "onClose"

			slot1:onClose()
		end, slot4.select)
	end

	if slot0.currentCost > 0 then
		gGameUI:showDialog({
			isRich = true,
			clearFast = true,
			btnType = 2,
			content = string.format(gLanguageCsv.costDiamondToSwitch, slot0.currentCost),
			cb = function ()
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
			dialogParams = {
				clickClose = false
			}
		})
	else
		slot1()
	end
end

return slot0
