slot0 = class("CardBagFilterView", cc.load("mvc").ViewBase)

function slot1(slot0)
	slot1 = ""

	if not slot0 then
		slot2 = clone(ui.ATTR_ICON)

		table.insert(slot2, slot1)

		return slot2
	end

	return ui.ATTR_ICON[slot0] or slot1, not ui.ATTR_ICON[slot0]
end

function slot2(slot0)
	slot1 = ""

	if not slot0 then
		slot2 = clone(ui.RARITY_ICON)
		slot2[table.maxn(slot2) + 1] = slot1

		return slot2
	end

	return ui.RARITY_ICON[slot0] or slot1, not ui.RARITY_ICON[slot0]
end

slot0.RESOURCE_FILENAME = "card_bag_filter.json"
slot0.RESOURCE_BINDING = {
	filterBtn = "filterBtn",
	["filterBtn.btn"] = "selBtn",
	["filterBtn.rarityListPanel.item"] = "rarityItem",
	["filterBtn.rarityListPanel.subList"] = "raritySubList",
	["filterBtn.attrListPanel.subList"] = "attrSubList",
	["filterBtn.attrListPanel.item"] = "attrItem",
	["filterBtn.btn.title"] = {
		varname = "btnTitle",
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
	["filterBtn.filterPanel"] = {
		varname = "filterPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("showfilterPanel")
		}
	},
	["filterBtn.filterPanel.cancle"] = {
		varname = "cancleBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCancleClick")
			}
		}
	},
	["filterBtn.filterPanel.cancle.title"] = {
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
	["filterBtn.filterPanel.sure"] = {
		varname = "sureBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureClick")
			}
		}
	},
	["filterBtn.filterPanel.sure.title"] = {
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
	["filterBtn.filterPanel.attr1Btn"] = {
		varname = "attr1Btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAttr1Click")
			}
		}
	},
	["filterBtn.filterPanel.attr2Btn"] = {
		varname = "attr2Btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAttr2Click")
			}
		}
	},
	["filterBtn.filterPanel.rarityBtn"] = {
		varname = "rarityBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRarityClick")
			}
		}
	},
	["filterBtn.filterPanel.atk1Btn"] = {
		varname = "atk1Btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onAtkClick(game.ATTRDEF_ENUM_TABLE.damage)
				end)
			}
		}
	},
	["filterBtn.filterPanel.atk2Btn"] = {
		varname = "atk2Btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onAtkClick(game.ATTRDEF_ENUM_TABLE.specialDamage)
				end)
			}
		}
	},
	closePanel = {
		varname = "closePanel",
		binds = {
			{
				event = "visible",
				idler = bindHelper.self("showfilterPanel")
			},
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onClosePanel")
				}
			}
		}
	},
	["filterBtn.attrListPanel"] = {
		varname = "attrListPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("showAttrList")
		}
	},
	["filterBtn.attrListPanel.list"] = {
		varname = "attrList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 6,
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("attrSubList"),
				cell = bindHelper.self("attrItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(slot3.icon)
					slot1:onClick(functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3))
				end
			},
			handlers = {
				itemClick = bindHelper.self("onAttrItemClick")
			}
		}
	},
	["filterBtn.attrListPanel.allBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onAttrItemClick(nil, {
						k = ui.ATTR_MAX
					})
				end)
			}
		}
	},
	["filterBtn.rarityListPanel"] = {
		varname = "rarityListPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("showRarityList")
		}
	},
	["filterBtn.rarityListPanel.allBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSelectedAll")
			}
		}
	},
	["filterBtn.rarityListPanel.list"] = {
		varname = "rarityList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				data = bindHelper.self("rarityDatas"),
				item = bindHelper.self("raritySubList"),
				cell = bindHelper.self("rarityItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					uv4 = "rarity"

					slot1:get("icon"):texture(slot4(slot3.rarity))
					slot1:onClick(functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3))
				end
			},
			handlers = {
				itemClick = bindHelper.self("onRarityItemClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.cb = slot1.cb

	if slot1.showIdler then
		slot0.showIdler = slot1.showIdler()
	end

	slot2 = slot1.others or {}
	slot4 = slot2.height
	slot5 = slot2.x
	slot6 = slot2.y
	slot7 = slot2.scale
	slot8 = slot2.btn
	slot9 = slot2.panelOrder or false
	slot10 = slot2.panelOffsetX or 760
	slot11 = slot2.panelOffsetY or 0

	if slot2.width and slot4 then
		slot0.selBtn:size(slot3, slot4)
		slot0.btnTitle:xy(slot3 / 2, slot4 / 2)
	end

	if slot7 then
		slot0.selBtn:scale(slot7)
	end

	if slot5 then
		slot0.filterBtn:xy(slot5, slot6)
	end

	if slot8 then
		slot0.selBtn:visible(false)

		slot0.selBtn = slot8
	end

	if slot9 then
		slot12 = slot0.filterPanel:y()
		slot13 = 120 - slot11

		slot0.filterPanel:xy(slot10, slot13)
		slot0.attrListPanel:xy(slot10, slot13 + slot0.attrListPanel:y() - slot12)
		slot0.rarityListPanel:xy(slot10, slot13 + slot0.rarityListPanel:y() - slot12)
	end

	if slot2.subPanelOrder then
		slot0.attrListPanel:y(slot0.attrListPanel:y() - 100 - slot0.attrListPanel:height())
		slot0.rarityListPanel:y(slot0.rarityListPanel:y() - 60 - slot0.rarityListPanel:height())
	end

	slot0.attr12Choose = 1
	slot0.attr1 = idler.new(ui.ATTR_MAX)
	slot0.attr2 = idler.new(ui.ATTR_MAX)
	slot0.rarity = idler.new(ui.RARITY_LAST_VAL)
	slot0.atkType = idlertable.new({
		[game.ATTRDEF_ENUM_TABLE.damage] = true,
		[game.ATTRDEF_ENUM_TABLE.specialDamage] = true
	})
	slot0.attrDatas = arraytools.map(ui.ATTR_ICON, function (slot0, slot1)
		return {
			icon = slot1
		}
	end)
	slot0.rarityDatas = ui.RARITY_DATAS
	slot0.showAttrList = idler.new(false)
	slot0.showRarityList = idler.new(false)
	slot0.showfilterPanel = idler.new(false)

	idlereasy.when(slot0.attr1, function (slot0, slot1)
		uv2 = "attr1Btn"
		slot2, slot3 = slot2(slot1)

		if slot3 then
			uv4 = "get"
			slot4 = slot4.attr1Btn:get("img1")
			slot4 = slot4.hide

			slot4(slot4)

			uv4 = "get"

			slot4.attr1Btn:get("all"):show()
		else
			uv4 = "get"
			slot4 = slot4.attr1Btn:get("img1"):show()
			slot4 = slot4.texture

			slot4(slot4, slot2)

			uv4 = "get"

			slot4.attr1Btn:get("all"):hide()
		end
	end)
	idlereasy.when(slot0.attr2, function (slot0, slot1)
		uv2 = "attr2Btn"
		slot2, slot3 = slot2(slot1)

		if slot3 then
			uv4 = "get"
			slot4 = slot4.attr2Btn:get("img1")
			slot4 = slot4.hide

			slot4(slot4)

			uv4 = "get"

			slot4.attr2Btn:get("all"):show()
		else
			uv4 = "get"
			slot4 = slot4.attr2Btn:get("img1"):show()
			slot4 = slot4.texture

			slot4(slot4, slot2)

			uv4 = "get"

			slot4.attr2Btn:get("all"):hide()
		end
	end)
	idlereasy.when(slot0.rarity, function (slot0, slot1)
		uv2 = "rarityBtn"
		slot2, slot3 = slot2(slot1)

		if slot3 then
			uv4 = "get"
			slot4 = slot4.rarityBtn:get("img1")
			slot4 = slot4.hide

			slot4(slot4)

			uv4 = "get"

			slot4.rarityBtn:get("all"):show()
		else
			uv4 = "get"
			slot4 = slot4.rarityBtn:get("img1"):show()
			slot4 = slot4.texture

			slot4(slot4, slot2)

			uv4 = "get"

			slot4.rarityBtn:get("all"):hide()
		end
	end)
	idlereasy.when(slot0.atkType, function (slot0, slot1)
		uv2 = "atk1Btn"
		slot2 = slot2.atk1Btn:get("checkBox")
		slot2 = slot2.setSelectedState

		slot2(slot2, slot1[game.ATTRDEF_ENUM_TABLE.damage])

		uv2 = "atk1Btn"

		slot2.atk2Btn:get("checkBox"):setSelectedState(slot1[game.ATTRDEF_ENUM_TABLE.specialDamage])
	end)
	bind.touch(slot0, slot0.selBtn, {
		methods = {
			ended = function ()
				uv0 = "onFilterClick"

				slot0:onFilterClick()
			end
		}
	})
	slot0:initData()
end

function slot0.initData(slot0)
	slot0.attr1:set(ui.ATTR_MAX)
	slot0.attr2:set(ui.ATTR_MAX)
	slot0.rarity:set(ui.RARITY_LAST_VAL)
	slot0.atkType:set({
		[game.ATTRDEF_ENUM_TABLE.damage] = true,
		[game.ATTRDEF_ENUM_TABLE.specialDamage] = true
	}, true)
	slot0:onSureClick()
end

function slot0.onClosePanel(slot0)
	itertools.invoke({
		slot0.showAttrList,
		slot0.showRarityList,
		slot0.showfilterPanel
	}, "set", false)
end

function slot0.onAttrItemClick(slot0, slot1, slot2, slot3)
	if slot0.attr12Choose == 1 then
		slot0.attr1:set(slot2.k)
	else
		slot0.attr2:set(slot2.k)
	end

	slot0.showAttrList:set(false)
end

function slot0.onSelectedAll(slot0)
	uv4 = "rarity"

	slot0.rarity:set(table.maxn(slot4()))
	slot0.showRarityList:set(false)
end

function slot0.onRarityItemClick(slot0, slot1, slot2, slot3)
	slot0.rarity:set(slot3.rarity)
	slot0.showRarityList:set(false)
end

function slot0.onAttr1Click(slot0)
	slot0.showRarityList:set(false)

	if not slot0.showAttrList:read() then
		slot0.attr12Choose = 1

		slot0.showAttrList:set(true)

		return
	end

	slot0.showAttrList:set(false)
end

function slot0.onAttr2Click(slot0)
	slot0.showRarityList:set(false)

	if not slot0.showAttrList:read() then
		slot0.attr12Choose = 2

		slot0.showAttrList:set(true)

		return
	end

	slot0.showAttrList:set(false)
end

function slot0.onRarityClick(slot0)
	slot0.showAttrList:set(false)
	slot0.showRarityList:modify(function (slot0)
		return true, not slot0
	end)
end

function slot0.onCancleClick(slot0)
	slot0:onClosePanel()
end

function slot0.onSureClick(slot0)
	slot0.cb(slot0.attr1:read(), slot0.attr2:read(), slot0.rarity:read(), slot0.atkType:read())
	slot0:onClosePanel()
end

function slot0.onFilterClick(slot0)
	if slot0.showIdler then
		slot0.showIdler:set(false)
	end

	itertools.invoke({
		slot0.showAttrList,
		slot0.showRarityList
	}, "set", false)
	slot0.showfilterPanel:modify(function (slot0)
		return true, not slot0
	end)
end

function slot0.onAtkClick(slot0, slot1)
	slot0.atkType:modify(function ()
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
	end)
end

return slot0
