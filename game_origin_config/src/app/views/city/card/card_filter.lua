slot0 = class("CardFilterView", Dialog)
slot1 = 9

function slot2(slot0)
	slot1 = ""

	if not slot0 then
		slot2 = clone(ui.ATTR_ICON)

		table.insert(slot2, slot1)

		return slot2
	end

	return ui.ATTR_ICON[slot0] or slot1, not ui.ATTR_ICON[slot0]
end

function slot3(slot0)
	slot1 = ""

	if not slot0 then
		slot2 = clone(ui.RARITY_ICON)
		slot2[table.maxn(slot2) + 1] = slot1

		return slot2
	end

	return ui.RARITY_ICON[slot0] or slot1, not ui.RARITY_ICON[slot0]
end

slot0.RESOURCE_FILENAME = "card_filter.json"
slot0.RESOURCE_BINDING = {
	["searchPanel.historyPanel"] = "historyPanel",
	["rarityListPanel.item"] = "rarityItem",
	["searchPanel.nameInput"] = "nameInput",
	["tabPanel.btnItem"] = "btnItem",
	tabPanel = "tabPanel",
	["attrListPanel.item"] = "attrItem",
	["searchPanel.historyItem"] = "historyItem",
	["attrListPanel.subList"] = "attrSubList",
	["searchPanel.posNode"] = "posNode",
	["rarityListPanel.subList"] = "raritySubList",
	bg = {
		varname = "bg",
		binds = {
			event = "click",
			method = bindHelper.self("onClosePanel")
		}
	},
	["tabPanel.btnList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("btnItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("select"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot6:get("txt"):text(slot3.name)
					text.addEffect(slot6:get("txt"), {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabItemClick")
			}
		}
	},
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	sure = {
		varname = "sure",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureClick")
			}
		}
	},
	["sure.title"] = {
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
	filterPanel = {
		varname = "filterPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("showFilterPanel")
		}
	},
	["filterPanel.attr1Btn"] = {
		varname = "attr1Btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAttr1Click")
			}
		}
	},
	["filterPanel.attr2Btn"] = {
		varname = "attr2Btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAttr2Click")
			}
		}
	},
	["filterPanel.rarityBtn"] = {
		varname = "rarityBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRarityClick")
			}
		}
	},
	["filterPanel.atk1Btn"] = {
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
	["filterPanel.atk2Btn"] = {
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
	attrListPanel = {
		varname = "attrListPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("showAttrList")
		}
	},
	["attrListPanel.list"] = {
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
	["attrListPanel.allBtn"] = {
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
	rarityListPanel = {
		varname = "rarityListPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("showRarityList")
		}
	},
	["rarityListPanel.allBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSelectedAll")
			}
		}
	},
	["rarityListPanel.list"] = {
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
	},
	searchPanel = {
		varname = "searchPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("showSearchPanel")
		}
	},
	["searchPanel.nameInput.btnDelete"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSearchClear")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)

	slot0.cb = slot1.cb
	slot0.attr1 = idler.new(slot1.attr1)
	slot0.attr2 = idler.new(slot1.attr2)
	slot0.rarity = idler.new(slot1.rarity)
	slot0.atkType = idlertable.new(table.deepcopy(slot1.atkType, true))
	slot0.filterType = idler.new(slot1.filterType)
	slot0.targetStr = slot1.targetStr
	slot0.tabDatas = idlers.newWithMap({
		{
			name = gLanguageCsv.filterTabInfo
		},
		{
			name = gLanguageCsv.filterTabName
		}
	})
	slot0.attrListPanelOriginX = slot0.attrListPanel:x()
	slot0.attr12Choose = 1
	slot0.attrDatas = arraytools.map(ui.ATTR_ICON, function (slot0, slot1)
		return {
			icon = slot1
		}
	end)
	slot0.rarityDatas = ui.RARITY_DATAS
	slot0.showAttrList = idler.new(false)
	slot0.showRarityList = idler.new(false)
	slot0.showFilterPanel = idler.new(slot0.filterType:read() == 1)
	slot0.showSearchPanel = idler.new(slot0.filterType:read() == 2)
	slot0.cardFilterTips = label.create(gLanguageCsv.cardFilterTips, {
		fontSize = 38,
		color = ui.COLORS.NORMAL.DEFAULT,
		anchorPoint = cc.p(1, 0.5)
	}):addTo(slot0.bg):xy(1370, 40)

	adapt.setTextScaleWithWidth(slot0.cardFilterTips, nil, 500)
	slot0.filterType:addListener(function (slot0, slot1)
		uv2 = "onClosePanel"
		slot2 = slot2.onClosePanel

		slot2(slot2)

		uv2 = "onClosePanel"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "onClosePanel"
		slot4 = slot0
		slot2 = slot2.tabDatas:atproxy(slot4)
		slot2.select = true
		uv2 = "onClosePanel"
		slot2 = slot2.showFilterPanel
		slot2 = slot2.set
		uv4 = "onClosePanel"
		slot4 = slot4.filterType:read() == 1

		slot2(slot2, slot4)

		uv2 = "onClosePanel"
		slot2 = slot2.showSearchPanel
		slot2 = slot2.set
		uv4 = "onClosePanel"
		slot4 = slot4.filterType:read() == 2

		slot2(slot2, slot4)

		uv2 = "onClosePanel"
		uv4 = "onClosePanel"

		slot2.cardFilterTips:visible(slot4.filterType:read() == 2)
	end)
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

	if matchLanguage({
		"en"
	}) then
		slot0.nameInput:setFontSize(40)
		slot0.nameInput:y(slot0.nameInput:y() - 5)
		slot0.nameInput:get("btnDelete"):y(slot0.nameInput:height() / 2)
	end

	slot0:initSearchPanel()
end

function slot0.onClosePanel(slot0)
	itertools.invoke({
		slot0.showAttrList,
		slot0.showRarityList
	}, "set", false)
end

function slot0.initSearchPanel(slot0)
	slot0.nameInput:setPlaceHolderColor(ui.COLORS.DISABLED.GRAY)
	slot0.nameInput:setTextColor(ui.COLORS.NORMAL.DEFAULT)

	slot0.historyTagStr = idler.new("")

	if slot0.targetStr ~= "" and slot0.filterType:read() == 2 then
		slot0.historyTagStr:set(slot0.targetStr)

		slot2 = 1000
		slot3 = slot0.historyItem:clone():show()

		slot3:addTo(slot0.posNode, 10)
		slot3:get("text"):text(slot0.targetStr)

		slot5 = slot2

		if slot3:get("text"):width() < slot2 then
			slot5 = math.max(90, slot3:get("text"):width())
		else
			slot3:get("text"):hide()

			slot4 = beauty.singleTextLimitWord(slot0.targetStr, {
				fontSize = 40,
				color = ui.COLORS.NORMAL.DEFAULT
			}, {
				width = slot2
			}):addTo(slot3, 1, "singleText")
		end

		slot5 = slot5 + 90

		slot3:width(slot5)
		slot3:get("bg"):width((slot5 - 10) / slot3:get("bg"):scale()):x(slot5 / 2)
		slot4:xy(slot5 / 2 - 20, slot3:height() / 2)
		slot3:get("btnClose"):show():x(slot5 - 40)
		slot3:xy(slot5 / 2, slot0.posNode:height() / 2)

		slot0.targetStr = ""

		bind.touch(slot0, slot0.posNode, {
			methods = {
				ended = function ()
					uv0 = "targetStr"
					uv1 = "targetStr"
					slot0.targetStr = slot1.historyTagStr:read()
					uv0 = "targetStr"

					slot0.historyTagStr:set("")
				end
			}
		})
		bind.touch(slot0, slot3:get("btnClose"), {
			methods = {
				ended = function ()
					uv0 = "targetStr"
					slot0.targetStr = ""
					uv0 = "targetStr"

					slot0.historyTagStr:set("", true)
				end
			}
		})
	end

	idlereasy.when(slot0.historyTagStr, function (slot0, slot1)
		if slot1 == "" then
			uv2 = ""
			slot2 = slot2.posNode
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = ""
			uv4 = ""

			slot2.nameInput:show():text(slot4.targetStr)
		else
			uv2 = ""
			slot2 = slot2.posNode
			slot2 = slot2.show

			slot2(slot2)

			uv2 = ""

			slot2.nameInput:hide()
		end
	end)
	slot0:refreshSearchHistoryPanel()
end

function slot0.refreshSearchHistoryPanel(slot0)
	slot0.historyPanel:removeAllChildren()

	slot2 = {}

	for slot6, slot7 in pairs(userDefault.getForeverLocalKey("historySearchTag", {}, {
		rawData = true
	})) do
		table.insert(slot2, {
			key = slot6,
			time = slot7
		})
	end

	table.sort(slot2, function (slot0, slot1)
		return slot1.time < slot0.time
	end)

	slot3 = 0
	slot4 = slot0.historyPanel:height()
	slot6 = 320
	slot7 = 1

	for slot11, slot12 in ipairs(slot2) do
		slot13 = slot0.historyItem:clone():show()

		slot13:get("btnClose"):hide()
		slot13:get("text"):text(slot12.key)

		slot15 = slot6

		if slot13:get("text"):width() < slot6 then
			slot15 = math.max(90, slot13:get("text"):width())
		else
			slot13:get("text"):hide()

			slot14 = beauty.singleTextLimitWord(slot12.key, {
				fontSize = 40,
				color = ui.COLORS.NORMAL.DEFAULT
			}, {
				width = slot6
			}):addTo(slot13, 1, "singleText" .. slot11)
		end

		slot15 = slot15 + 40

		slot13:width(slot15)
		slot13:get("bg"):width((slot15 - 10) / slot13:get("bg"):scale()):x(slot15 / 2)
		slot14:xy(slot15 / 2, slot13:height() / 2)

		if slot0.historyPanel:width() < slot3 + slot15 then
			slot3 = 0
			slot4 = slot4 - slot13:height()

			if slot7 + 1 > 3 then
				for slot20 = 1, slot11 - 1 do
				end

				userDefault.setForeverLocalKey("historySearchTag", {
					[slot2[slot20].key] = slot2[slot20].time
				}, {
					new = true
				})

				break
			end
		end

		slot13:addTo(slot0.historyPanel)
		slot13:xy(slot3 + slot15 / 2, slot4 - slot13:height() / 2)

		slot3 = slot3 + slot15

		bind.touch(slot0, slot13, {
			methods = {
				ended = function ()
					uv0 = "targetStr"
					uv1 = "key"
					slot0.targetStr = slot1.key
					uv0 = "targetStr"

					slot0.historyTagStr:set("", true)
				end
			}
		})
	end
end

function slot0.onSearchClear(slot0)
	slot0.targetStr = ""

	slot0.historyTagStr:set("", true)
end

function slot0.onAttrItemClick(slot0, slot1, slot2, slot3)
	slot0.showAttrList:set(false)

	if slot0.attr12Choose == 1 then
		slot0.attr1:set(slot2.k)
	else
		slot0.attr2:set(slot2.k)
	end
end

function slot0.onSelectedAll(slot0)
	slot0.showRarityList:set(false)

	uv4 = "showRarityList"

	slot0.rarity:set(table.maxn(slot4()))
end

function slot0.onRarityItemClick(slot0, slot1, slot2, slot3)
	slot0.showRarityList:set(false)
	slot0.rarity:set(slot3.rarity)
end

function slot0.onAttr1Click(slot0)
	slot0.showRarityList:set(false)

	if not slot0.showAttrList:read() or slot0.attr12Choose == 2 then
		slot0.attr12Choose = 1

		slot0.attrListPanel:x(slot0.attrListPanelOriginX)
		slot0.showAttrList:set(true)

		return
	end

	slot0.showAttrList:set(false)
end

function slot0.onAttr2Click(slot0)
	slot0.showRarityList:set(false)

	if not slot0.showAttrList:read() or slot0.attr12Choose == 1 then
		slot0.attr12Choose = 2

		slot0.attrListPanel:x(slot0.attrListPanelOriginX + 280)
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

function slot0.onTabItemClick(slot0, slot1, slot2)
	slot0.filterType:set(slot2)
end

function slot0.onSureClick(slot0)
	if slot0.filterType:read() == 1 then
		slot0.targetStr = ""
	else
		slot0.attr1:set(ui.ATTR_MAX)
		slot0.attr2:set(ui.ATTR_MAX)
		slot0.rarity:set(ui.RARITY_LAST_VAL)
		slot0.atkType:set({
			[game.ATTRDEF_ENUM_TABLE.damage] = true,
			[game.ATTRDEF_ENUM_TABLE.specialDamage] = true
		}, true)

		if slot0.historyTagStr:read() ~= "" then
			slot0.targetStr = slot0.historyTagStr:read()
		else
			slot0.targetStr = slot0.nameInput:getStringValue()

			if #slot0.targetStr > 0 then
				if string.gsub(slot0.targetStr, "[%s]", "") == "" then
					gGameUI:showTip(gLanguageCsv.searchOnlySpace)

					return
				end

				slot2 = userDefault.getForeverLocalKey("historySearchTag", {}, {
					rawData = true
				})
				slot2[slot0.targetStr] = time.getTime()
				slot3 = {}

				for slot7, slot8 in pairs(slot2) do
					table.insert(slot3, {
						key = slot7,
						time = slot8
					})
				end

				table.sort(slot3, function (slot0, slot1)
					return slot1.time < slot0.time
				end)

				for slot8 = 1, #slot3 do
				end

				userDefault.setForeverLocalKey("historySearchTag", {
					[slot3[slot8].key] = slot3[slot8].time
				}, {
					new = true
				})
				slot0:refreshSearchHistoryPanel()
			end
		end
	end

	slot0.cb(slot0.attr1:read(), slot0.attr2:read(), slot0.rarity:read(), slot0.atkType:read(), slot0.filterType:read(), slot0.targetStr)
	slot0:onClose()
end

return slot0
