slot0 = require("app.views.city.handbook.tools")
slot1 = 4
slot2 = {
	[0] = "city/handbook/tag_green.png",
	"city/handbook/tag_blue.png",
	"city/handbook/tag_purple.png",
	"city/handbook/tag_yellow.png",
	"city/handbook/tag_orange.png",
	"city/handbook/tag_red.png"
}

function slot3(slot0)
	slot5 = ccui.Scale9Sprite:create()

	slot5:initWithFile(slot0.rect, slot0.path)
	slot5:size(slot0.size)
	slot5:setRotation(slot0.rotation or 0)

	return slot5
end

function slot4(slot0, slot1)
	slot3 = false

	if itertools.size(slot0) == 0 then
		slot3 = true
		slot0 = slot1
	end

	slot4 = 2
	slot5 = #slot0
	slot6 = #slot1
	slot7 = slot0[1]:size()

	for slot11, slot12 in ipairs(slot0) do
		if slot12:getChildByName("line1") then
			slot13:visible(true)
		else
			slot15 = cc.rect(25, 9, 1, 1)
			uv15 = "itertools"

			slot15({
				path = "city/handbook/box_line_bg.png",
				size = cc.size(58, 18),
				rect = slot15
			}):xy(slot7.width + slot4, slot7.height / 2):visible(not slot3 and slot11 <= slot6):addTo(slot12, -2, "line1")

			slot15 = {
				path = "city/handbook/box_line_1.png",
				size = cc.size(82, 28),
				rect = cc.rect(25, 14, 1, 1)
			}
			uv15 = "itertools"

			slot15(slot15):xy(slot7.width + slot4, slot7.height / 2):addTo(slot12, -1, "redline1")
		end
	end

	if slot5 == 1 and slot6 > 1 then
		for slot11, slot12 in ipairs(slot0) do
			slot13 = slot12:getChildByName("line1")

			slot13:x(slot7.width - 18)
			slot13:size(26, 18)

			slot14 = slot12:getChildByName("redline1")

			slot14:x(slot7.width - 18)
			slot14:size(58, 28)
		end

		slot8 = slot7.width + 3
		slot9 = slot7.height / 2
		slot10 = slot0[1]
		slot11 = (slot6 - 1) * (slot7.height + 15)
		slot13 = cc.rect(25, 9, 1, 1)
		uv13 = "itertools"

		slot13({
			rotation = 90,
			path = "city/handbook/box_line_bg.png",
			size = cc.size(slot11 + 18, 18),
			rect = slot13
		}):xy(slot8, slot9):addTo(slot10, -3, "line2")

		slot13 = {
			rotation = 90,
			path = "city/handbook/box_line_1.png",
			size = cc.size(slot11 + 28, 32),
			rect = cc.rect(25, 9, 1, 1)
		}
		uv13 = "itertools"
		slot16 = -2
		slot17 = "redline2"

		slot13(slot13):xy(slot8 + 2, slot9):addTo(slot10, slot16, slot17)

		slot9 = slot7.height / 2
		slot8 = 20

		for slot16, slot17 in ipairs(slot1) do
			slot19 = cc.rect(25, 9, 1, 1)
			uv19 = "itertools"

			slot19({
				path = "city/handbook/box_line_bg.png",
				size = cc.size(17, 18),
				rect = slot19
			}):xy(slot8, slot9):addTo(slot17, -2, "line3")

			slot19 = {
				path = "city/handbook/box_line_1.png",
				size = cc.size(43, 28),
				rect = cc.rect(25, 14, 1, 1)
			}
			uv19 = "itertools"

			slot19(slot19):xy(slot8 - 2, slot9):addTo(slot17, -1, "redline3")
		end
	end
end

function slot5(slot0, slot1, slot2, slot3)
	for slot7 = 1, math.huge do
		if not slot1:get("item" .. slot7) then
			break
		end

		slot8:removeFromParent()
	end

	if slot3[1].itemType == "title" then
		slot1:get("imgTitle"):visible(true)
		slot1:get("imgBg"):visible(true)
		slot1:get("list"):visible(false)
		slot1:get("imgTitle"):texture(ui.RARITY_ICON[slot3[1].val])

		slot8 = "imgBg"
		uv8 = "math"

		slot1:get(slot8):texture(slot8[slot3[1].val])

		slot6 = slot1:get("imgTitle"):getBoundingBox()

		slot1:size(cc.size(slot0:size().width, slot6.height))
		slot1:get("imgTitle"):y(slot6.height / 2)
		slot1:get("imgBg"):y(slot6.height / 2)
	elseif slot5 == 2 then
		slot1:get("imgBg"):visible(false)
		slot1:get("imgTitle"):visible(false)
		slot1:get("list"):visible(false)

		slot7 = {}

		for slot11, slot12 in ipairs(slot3) do
			if not slot7[csv.cards[slot12.cfg.cardID].branch] then
				slot7[slot14] = {}
			end

			slot12.develop = slot13.develop
			slot12.currRealBranch = slot13.branch
			slot12.branch = {}
			slot12.order = slot11

			table.insert(slot7[slot14], slot12)
		end

		slot8 = nil
		slot9 = csvSize(slot7)

		if slot7[0] and slot9 > 1 then
			slot9 = slot9 - 1
		end

		slot10 = slot7[0] and #slot7[0] or 0

		slot1:size(cc.size(slot4, 202 * slot9 + (slot9 - 1) * 3 + 40 - 10))

		slot12 = {}
		slot13 = {}

		for slot18, slot19 in pairs(slot7) do
			table.sort(slot19, function (slot0, slot1)
				return slot0.develop < slot1.develop
			end)

			if slot18 ~= 0 then
				slot14 = 0 + 1
			end

			slot20 = {}
			slot21 = slot18 ~= 0 and slot10 or 0

			for slot25, slot26 in ipairs(slot19) do
				slot27 = csv.cards[slot26.cfg.cardID]
				slot28 = slot27.develop
				slot29 = slot27.branch
				slot30 = slot0.cloneItem:clone()

				slot30:visible(true)
				slot1:addChild(slot30, 10, "item" .. slot26.order)

				slot31 = slot30:size()

				if slot26.isHas then
					slot8 = slot30
				end

				slot30:get("cardPanel"):show()
				bind.extend(slot0, slot30:get("cardPanel"), {
					class = "card_icon",
					props = {
						cardId = slot26.cfg.cardID,
						rarity = csv.unit[slot27.unitID].rarity,
						grayState = slot26.isHas and 0 or 2,
						selected = slot26.isSel,
						onNode = function (slot0)
							slot0:xy(14, 3)
						end
					}
				})

				slot33 = slot11 / 2 + (slot31.height + 15) * (slot9 / 2 - slot14 + 0.5)

				if slot9 == 1 or slot29 == 0 then
					slot33 = slot11 / 2
				end

				slot34 = slot21 + slot25

				slot30:xy(slot31.width / 2 + (slot34 - 1) * slot31.width, slot33)

				if not slot12[slot34] then
					slot12[slot34] = {}

					table.insert(slot13, slot34)
				end

				table.insert(slot12[slot34], slot30)
				bind.touch(slot0, slot30:get("cardPanel"), {
					methods = {
						ended = functools.partial(slot0.clickCell, slot2, slot26.order, slot26.cfg.cardID, slot5)
					}
				})
			end
		end

		table.sort(slot13)

		slot16 = true

		for slot20, slot21 in ipairs(slot13) do
			slot22 = slot12[slot21]
			uv23 = "huge"

			slot23({}, slot22)

			slot15 = slot22
		end

		slot17 = false

		for slot21, slot22 in ipairs(slot13) do
			slot23 = slot12[slot22]

			for slot28, slot29 in ipairs(slot23) do
				if not slot8 or slot8 == slot29 then
					if #slot23 == 1 then
						slot16 = false
					else
						slot17 = true
					end
				end

				for slot33 = 1, 3 do
					if slot29:getChildByName("redline" .. slot33) then
						slot34:visible(slot16 and slot29:getChildByName("line" .. slot33):visible())
					end
				end
			end

			if slot17 then
				slot16 = not slot16 or slot16
			end

			slot17 = false
		end
	else
		slot1:get("imgTitle"):visible(false)
		slot1:get("imgBg"):visible(false)
		slot1:get("list"):visible(true)

		slot6 = slot0.cloneItem:size()

		slot1:size(cc.size(slot4, slot6.height + 10))
		slot1:get("list"):size(cc.size(slot4, slot6.height + 10))
		bind.extend(slot0, slot1:get("list"), {
			class = "listview",
			props = {
				data = slot3,
				item = slot0.cloneItem,
				topPadding = padding,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:size()

					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							cardId = slot3.cfg.cardID,
							rarity = csv.unit[csv.cards[slot3.cfg.cardID].unitID].rarity,
							grayState = slot3.isHas and 0 or 2,
							selected = slot3.isSel,
							onNode = function (slot0)
								slot0:xy(14, 3)
							end
						}
					})

					slot8 = slot1

					slot1.visible(slot8, true)

					uv8 = "size"
					uv13 = "size"
					uv14 = "csv"
					uv17 = "cards"

					bind.touch(slot8, slot1, {
						methods = {
							ended = functools.partial(slot13.clickCell, slot14, slot2, slot3.cfg.cardID, slot17)
						}
					})
				end
			}
		})
	end
end

slot7 = class("HandbookView", cc.load("mvc").ViewBase)
slot7.RESOURCE_FILENAME = "handbook.json"
slot7.RESOURCE_BINDING = {
	center = "center",
	starItem = "starItem",
	["center.textDesc"] = "textDescList",
	textName = "centerName",
	item1 = "item1",
	item = "item",
	btnItem = "btnItem",
	attrTmp = "attrTmp",
	["center.imgIcon"] = "imgIcon",
	["center.textLocation"] = "textLocation",
	["center.imgIconBG"] = "imgIconBG",
	attrItem = "attrItem",
	left = {
		varname = "left",
		binds = {
			event = "extend",
			class = "sort_menus",
			props = {
				expandUp = true,
				data = bindHelper.self("sortTabData"),
				btnClick = bindHelper.self("onSortMenusBtnClick", true),
				btnTouch = bindHelper.self("onCloseOtherView", true),
				showSortList = bindHelper.self("isDownListShow"),
				showSelected = bindHelper.self("sortType"),
				onNode = function (slot0)
					slot0:xy(-1125, -485):z(20)
				end
			}
		}
	},
	["left.textCount"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("hasCount")
		}
	},
	["left.btnAttrSort"] = {
		varname = "btnAttr",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowAttrPanel")
			}
		}
	},
	["left.btnUp"] = {
		varname = "btnTupo",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onShowTupoPanel")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "handbookAdvance"
				}
			}
		}
	},
	["left.list"] = {
		varname = "leftList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 7,
				backupCached = false,
				data = bindHelper.self("cardDatas"),
				item = bindHelper.self("item1"),
				cloneItem = bindHelper.self("item"),
				preloadCenterIndex = bindHelper.self("preloadCenterIndex"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
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
				clickCell = bindHelper.self("onClickItem")
			}
		}
	},
	["left.btnShowAttrAdd"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowAllAttrPanel")
			}
		}
	},
	["center.btnFeel"] = {
		varname = "btnFeel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnFeel")
			}
		}
	},
	["center.btnFeel.note"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["center.btnComment"] = {
		varname = "btnComment",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnComment")
			}
		}
	},
	["center.btnComment.note"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["center.btnDetail"] = {
		varname = "btnDetail",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnDetail")
			}
		}
	},
	["center.btnDetail.note"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["center.attrPanel.hp.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("hpNum")
		}
	},
	["center.attrPanel.attack.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("damageNum")
		}
	},
	["center.attrPanel.special.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("specialDamageNum")
		}
	},
	["center.attrPanel.phyFang.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("defenceNum")
		}
	},
	["center.attrPanel.speFang.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("specialDefenceNum")
		}
	},
	["center.attrPanel.speed.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("speedNum")
		}
	},
	["center.attrPanel.hp.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("hpPercent")
		}
	},
	["center.attrPanel.attack.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("damagePercent")
		}
	},
	["center.attrPanel.special.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("specialDamagePercent")
		}
	},
	["center.attrPanel.phyFang.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("defencePercent")
		}
	},
	["center.attrPanel.speFang.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("specialDefencePercent")
		}
	},
	["center.attrPanel.speed.progressBar"] = {
		binds = {
			event = "percent",
			idler = bindHelper.self("speedPercent")
		}
	},
	["center.starList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("starDatas"),
				item = bindHelper.self("starItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(slot3.icon)
				end
			}
		}
	},
	["center.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("curCardAttrAdd"),
				item = bindHelper.self("attrItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("textName"):text(gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot3.attrType])])
					slot1:get("textNum"):text("+" .. slot3.val)
					slot1:get("imgIcon"):texture(ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot3.attrType]])

					slot9 = slot3.hasRole and cc.c4b(91, 81, 91, 255) or cc.c4b(183, 176, 158, 255)

					text.addEffect(slot6, {
						color = slot9
					})
					text.addEffect(slot7, {
						color = slot9
					})
					adapt.oneLinePos(slot1:get("imgIcon"), slot6, cc.p(24, 0))
					adapt.oneLinePos(slot6, slot7, cc.p(12, 0))

					slot10 = slot7:box()

					slot1:size(slot7:x() + slot10.width + 40, slot10.height)
				end
			},
			handlers = {
				clickItem = bindHelper.self("onChangeView")
			}
		}
	},
	["pageList.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("btnsData"),
				item = bindHelper.self("btnItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("btnClick"):visible(slot3.state)
					slot1:get("btnNormal"):visible(not slot3.state)
					(slot3.state and slot1:get("btnClick") or slot1:get("btnNormal")):get("textNote"):text(slot3.text)
					bind.touch(slot0, slot1:get("btnNormal"), {
						methods = {
							ended = functools.partial(slot0.clickItem, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickItem = bindHelper.self("onChangeView")
			}
		}
	},
	["center.textHeightNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("textHight")
		}
	},
	["center.textWeightNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("textWeight")
		}
	},
	upList = {
		varname = "upList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("cardAttrs"),
				item = bindHelper.self("attrTmp"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgIcon"):texture(ui.ATTR_ICON[slot3])
				end
			}
		}
	},
	["center.attrPanel.textSum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("allVal")
		}
	},
	["center.btnTestPlay"] = {
		varname = "btnTestPlay",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnTestPlay")
			}
		}
	},
	["center.btnTestPlay.note"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	}
}

function slot7.resetData(slot0, slot1, slot2)
	slot1 = slot1 or {}
	slot3 = {}
	slot4 = csv.cards
	slot5 = csv.unit

	if slot2 == 1 or slot2 == 2 then
		slot6 = {}

		for slot10, slot11 in ipairs(slot1) do
			slot12 = slot4[slot11.cfg.cardID]

			if not slot3[slot2 == 1 and slot5[slot12.unitID].rarity or slot12.cardMarkID] then
				slot3[slot16] = {}

				table.insert(slot6, slot16)
			end

			table.insert(slot3[slot16], slot11)
		end

		table.sort(slot6, function ()
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

		slot7 = {}

		for slot11, slot12 in ipairs(slot6) do
			table.insert(slot7, slot3[slot12])
		end

		for slot11, slot12 in ipairs(slot7) do
			table.sort(slot12, function (slot0, slot1)
				slot2 = slot0.cfg.cardID
				slot3 = slot1.cfg.cardID
				uv4 = "cfg"

				if slot4 == 1 then
					return slot2 < slot3
				end

				uv4 = "cardID"
				uv5 = "cardID"

				if slot4[slot2].develop ~= slot5[slot3].develop then
					return slot4.develop < slot5.develop
				end

				return slot4.branch < slot5.branch
			end)
		end
	elseif slot2 == 3 then
		slot3[1] = {}

		for slot9, slot10 in ipairs(slot1) do
			if slot0.pokedex:read()[slot10.cfg.cardID] then
				table.insert(slot3[1], slot10)
			end
		end

		for slot9, slot10 in ipairs(slot3) do
			table.sort(slot10, function (slot0, slot1)
				uv2 = "cfg"
				slot3 = slot0.cfg.cardID
				uv3 = "cardID"
				slot4 = slot2[slot3].unitID
				uv4 = "cfg"
				slot5 = slot1.cfg.cardID
				uv5 = "cardID"

				if slot3[slot4].rarity == slot5[slot4[slot5].unitID].rarity then
					return slot0.cfg.cardID < slot1.cfg.cardID
				end

				return slot5 < slot3
			end)
		end
	elseif slot2 == 4 then
		slot3[1] = {}

		for slot9, slot10 in ipairs(slot1) do
			if not slot0.pokedex:read()[slot10.cfg.cardID] then
				table.insert(slot3[1], slot10)
			end
		end

		for slot9, slot10 in ipairs(slot3) do
			table.sort(slot10, function (slot0, slot1)
				uv2 = "cfg"
				slot3 = slot0.cfg.cardID
				uv3 = "cardID"
				slot4 = slot2[slot3].unitID
				uv4 = "cfg"
				slot5 = slot1.cfg.cardID
				uv5 = "cardID"

				if slot3[slot4].rarity == slot5[slot4[slot5].unitID].rarity then
					return slot0.cfg.cardID < slot1.cfg.cardID
				end

				return slot5 < slot3
			end)
		end
	end

	return slot3
end

function slot7.onCreate(slot0, slot1)
	uv2 = "leftColumnSize"
	slot0.leftColumnSize = slot2

	slot0:initModel()
	gGameModel.handbook:getIdlerOrigin("isNew"):set(false)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "HANDBOOK",
		title = gLanguageCsv.handbookTitle
	})

	slot0.isDownListShow = idler.new(false)
	slot0.selItemInfo = slot0.selItemInfo or {}
	slot0.sortTabData = idlertable.new({
		gLanguageCsv.rarity,
		gLanguageCsv.levelUp,
		gLanguageCsv.alreadyHas,
		gLanguageCsv.notOwn
	})
	slot0.isShowNaturePanel = idler.new(false)
	slot0.textDesc = idler.new("")
	slot0.textAddNum = idler.new("")
	slot0.textHight = idler.new("")
	slot0.textWeight = idler.new("")
	slot0.hasCount = idler.new(itertools.size(slot0.pokedex:read()))
	slot0.allVal = idler.new(0)
	slot0.curSelAttrs = idlertable.new({})
	slot0.cardAttrs = idlertable.new({})
	slot0.sortType = idler.new(1)
	slot0._selCardId = slot0._selCardId or (slot1 or {}).cardId
	slot0.selCardId = idler.new(slot0._selCardId or 0)
	slot0.curSelBtn = slot0.curSelBtn or 1
	slot0.btnsData = idlers.newWithMap({
		{
			state = false,
			text = gLanguageCsv.detail,
			func = function ()
				uv0 = "center"
				slot0 = slot0.center
				slot0 = slot0.visible

				slot0(slot0, true)

				uv0 = "center"
				slot0 = slot0.centerName
				slot0 = slot0.visible

				slot0(slot0, true)

				uv0 = "center"

				slot0.upList:visible(true)
			end
		},
		{
			state = false,
			text = gLanguageCsv.produce,
			func = function (slot0)
				uv1 = "center"
				slot1 = slot1.center
				slot1 = slot1.visible

				slot1(slot1, false)

				uv1 = "center"
				slot1 = slot1.centerName
				slot1 = slot1.visible

				slot1(slot1, false)

				uv1 = "center"

				slot1.upList:visible(false)

				uv4 = "center"

				return gGameUI:createView("city.handbook.gain_way", slot4):init(slot0)
			end
		},
		{
			state = false,
			text = gLanguageCsv.skill,
			func = function (slot0)
				uv1 = "center"
				slot1 = slot1.center
				slot1 = slot1.visible

				slot1(slot1, false)

				uv1 = "center"
				slot1 = slot1.centerName
				slot1 = slot1.visible

				slot1(slot1, true)

				uv1 = "center"

				slot1.upList:visible(true)

				uv4 = "center"

				return gGameUI:createView("city.handbook.skill", slot4):init(slot0)
			end
		},
		{
			state = false,
			text = gLanguageCsv.fetter,
			func = function (slot0)
				uv1 = "center"
				slot1 = slot1.center
				slot1 = slot1.visible

				slot1(slot1, false)

				uv1 = "center"
				slot1 = slot1.centerName
				slot1 = slot1.visible

				slot1(slot1, true)

				uv1 = "center"

				slot1.upList:visible(true)

				uv4 = "center"

				return gGameUI:createView("city.handbook.fetter", slot4):init(slot0)
			end
		}
	})
	slot3 = {}

	for slot7 = 1, #game.NATURE_TABLE do
		table.insert(slot3, {
			state = false
		})
	end

	slot0.natureDatas = idlers.newWithMap(slot0._natureDatas or slot3)
	slot0.cardDatas = idlers.newWithMap({})
	slot0.cardTabDatas = {}

	idlereasy.any({
		slot0.sortType,
		slot0.curSelAttrs
	}, function (slot0, slot1, slot2)
		uv3 = "refreshSortCardIdlersData"

		slot3:refreshSortCardIdlersData()
	end)

	slot4 = {
		"hpNum",
		"speedNum",
		"damageNum",
		"defenceNum",
		"specialDamageNum",
		"specialDefenceNum"
	}
	slot5 = {
		"hpPercent",
		"speedPercent",
		"damagePercent",
		"defencePercent",
		"specialDamagePercent",
		"specialDefencePercent"
	}
	slot0.hpNum = idler.new(0)
	slot0.hpPercent = idler.new(0)
	slot0.damageNum = idler.new(0)
	slot0.damagePercent = idler.new(0)
	slot0.specialDamageNum = idler.new(0)
	slot0.specialDamagePercent = idler.new(0)
	slot0.defenceNum = idler.new(0)
	slot0.defencePercent = idler.new(0)
	slot0.specialDefenceNum = idler.new(0)
	slot0.specialDefencePercent = idler.new(0)
	slot0.speedNum = idler.new(0)
	slot0.speedPercent = idler.new(0)
	slot0.curCardAttrAdd = idlers.newWithMap({})
	slot0.starDatas = idlers.new({})
	slot6 = {
		0,
		nil,
		nil,
		nil,
		nil,
		nil,
		0,
		0,
		0,
		0,
		nil,
		nil,
		0
	}

	for slot10, slot11 in pairs(slot0.pokedex:read()) do
		if gHandbookCsv[slot10] then
			for slot16 = 1, math.huge do
				if not slot12["attrType" .. slot16] then
					break
				end

				slot18 = 1

				if slot17 >= 9 then
					slot18 = 2
				end

				slot19, slot20 = dataEasy.parsePercentStr(slot12["attrValue" .. slot16])
				slot6[slot17] = slot6[slot17] + slot19
			end
		end
	end

	slot0.attrDatas = idlers.newWithMap(slot6)

	dataEasy.getListenUnlock(gUnlockCsv.cardComment, function (slot0)
		uv1 = "btnComment"
		slot1 = slot1.btnComment
		slot2 = slot1

		slot1.visible(slot2, slot0)

		uv2 = "btnComment"
		uv4 = "btnComment"
		slot4 = slot4.btnComment
		uv4 = "btnComment"

		adapt.oneLinePos(slot2.btnFeel, {
			slot4,
			slot4.btnTestPlay
		}, cc.p(20, 0), "right")
	end)
	dataEasy.getListenUnlock(gUnlockCsv.testPlay, function (slot0)
		uv1 = "refreshTestPlayBtn"

		slot1:refreshTestPlayBtn()
	end)
	idlereasy.when(slot0.selCardId, function (slot0, slot1)
		uv3 = "csv"

		slot3:refreshTestPlayBtn()

		if csv.cards[slot1] then
			uv3 = "csv"

			slot3.textLocation:text(slot2.location)

			slot4 = gHandbookCsv[slot1].heightAndWeight
			slot5 = slot4[2] .. "kg"
			slot6 = slot4[1] .. "m"
			slot7 = slot2.introduction
			uv8 = "csv"
			slot8 = slot8.centerName
			slot9 = slot8
			slot10 = slot2.name

			slot8.text(slot9, slot10)

			uv9 = "csv"
			uv10 = "csv"
			slot12 = 28

			adapt.oneLinePos(slot9.centerName, slot10.upList, cc.p(slot12, 0))

			slot8 = {}

			for slot12 = 1, math.huge do
				if not slot3["attrType" .. slot12] then
					break
				end

				uv14 = "csv"
				slot14 = slot14.pokedex:read()[slot1] ~= nil
				slot15, slot16 = dataEasy.parsePercentStr(slot3["attrValue" .. slot12])

				if slot16 then
					slot17 = mathEasy.getPreciseDecimal(slot15, 2) .. "%"
				end

				table.insert(slot8, {
					attrType = slot13,
					val = slot17,
					hasRole = slot14
				})
			end

			uv9 = "csv"
			slot9 = slot9.curCardAttrAdd
			slot9 = slot9.update

			slot9(slot9, slot8)

			uv9 = "csv"

			slot9:resetStarData()

			slot10 = 57
			slot9 = cc.c3b(slot10, 253, 57)
			uv10 = "csv"

			if not slot10.pokedex:read()[slot1] then
				slot9 = cc.c3b(150, 184, 227)
				slot5 = "???"
				slot6 = "???"
				slot7 = "???"
			end

			uv10 = "csv"
			slot10 = slot10.textHight
			slot10 = slot10.set

			slot10(slot10, slot6)

			uv10 = "csv"
			slot12 = slot5

			slot10.textWeight:set(slot12)

			uv12 = "csv"
			slot12 = slot12.textDescList

			beauty.textScroll({
				isRich = true,
				strs = "",
				list = slot12
			})

			uv12 = "csv"
			slot12 = "#C0x5B545B#" .. slot7

			beauty.textScroll({
				isRich = true,
				list = slot12.textDescList,
				strs = slot12
			})

			slot11 = csv.unit[slot2.unitID]
			uv12 = "csv"

			if slot12.imgIcon:getChildByName("shiny") then
				uv12 = "csv"

				slot12.imgIcon:removeChildByName("shiny")
			end

			uv12 = "csv"
			slot12 = slot12.imgIcon
			slot12 = slot12.texture

			slot12(slot12, slot11.cardShow)

			uv12 = "csv"

			slot12.imgIcon:show()

			if slot11.shinyRes then
				uv13 = "csv"
				slot14 = cc.p
				uv14 = "csv"
				slot14 = slot14.imgIcon
				slot15 = slot14
				uv15 = "csv"
				slot12 = widget.addAnimationByKey(slot13.imgIcon, slot11.shinyRes, "shiny", "effect_loop", 3):setAnchorPoint(slot14(0.5, 0.5)):xy(slot14.width(slot15) / 2, slot15.imgIcon:height() / 2)
			end

			uv12 = "csv"

			if slot12.imgIconBG:getChildByName("cardSpine") then
				uv12 = "csv"

				slot12.imgIconBG:removeChildByName("cardSpine")
			end

			slot12, slot13, slot14 = dataEasy.getCardMaxStar(slot2.cardMarkID)
			slot16 = csv.cards
			uv17 = "csv"

			if slot11.cardSpineNeedStar == 0 or slot17.pokedex:read()[slot1] ~= nil and slot11.cardSpine and slot15 <= slot12 then
				uv19 = "csv"
				slot20 = cc.p
				uv20 = "csv"
				slot21 = slot11.cardSkinPos.x
				uv21 = "csv"
				slot18 = widget.addAnimationByKey(slot19.imgIconBG, slot11.cardSpine, "cardSpine", "effect_loop", 3):setAnchorPoint(slot20(0.5, 0.5)):xy(slot20.imgIconBG:width() / 2 + slot21, slot21.imgIconBG:height() / 2 + slot11.cardSkinPos.y)
				slot19 = slot18
				slot18 = slot18.scale(slot19, slot11.cardSkinScale)
				uv19 = "csv"

				slot19.imgIcon:hide()
			end

			for slot22, slot23 in ipairs(slot2.specValue) do
				if slot22 > 6 then
					uv24 = "csv"

					slot24.allVal:set(slot23)

					break
				end

				uv24 = "csv"
				uv25 = "cards"
				slot24 = slot24[slot25[slot22]]
				slot25 = slot24
				slot24 = slot24.set

				slot24(slot25, slot23)

				uv24 = "csv"
				uv25 = "refreshTestPlayBtn"

				slot24[slot25[slot22]]:set(slot23 / 255 * 100)
			end

			table.insert({}, slot11.natureType)

			if slot11.natureType2 then
				table.insert(slot19, slot11.natureType2)
			end

			uv20 = "csv"

			slot20.cardAttrs:set(slot19)
		else
			uv3 = "csv"
			slot5 = ""

			slot3.centerName:text(slot5)

			slot3 = beauty.textScroll
			uv5 = "csv"

			slot3({
				isRich = true,
				strs = "",
				list = slot5.textDescList
			})

			uv3 = "csv"
			slot3 = slot3.textAddNum
			slot3 = slot3.set

			slot3(slot3, "")

			uv3 = "csv"
			slot3 = slot3.textHight
			slot3 = slot3.set

			slot3(slot3, "")

			uv3 = "csv"
			slot3 = slot3.textWeight
			slot3 = slot3.set

			slot3(slot3, "")

			uv3 = "csv"

			slot3.imgIcon:visible(false)

			for slot6 = 1, 7 do
				if slot6 > 6 then
					uv7 = "csv"

					slot7.allVal:set(0)

					break
				end

				uv7 = "csv"
				uv8 = "cards"
				slot7 = slot7[slot8[slot6]]
				slot8 = slot7
				slot7 = slot7.set

				slot7(slot8, 0)

				uv7 = "csv"
				uv8 = "refreshTestPlayBtn"

				slot7[slot8[slot6]]:set(0)
			end

			uv3 = "csv"

			slot3.cardAttrs:set({})
		end
	end)

	if matchLanguage({
		"en",
		"kr"
	}) then
		adapt.setTextAdaptWithSize(slot0.textLocation, {
			margin = -5,
			vertical = "center",
			horizontal = "left",
			size = cc.size(570, 100)
		})
	end

	slot0.attrPanel = gGameUI:createView("common.attr_filter", slot0):init({
		isMultiSelect = true,
		selectDatas = slot0:createHandler("natureDatas"),
		panelState = slot0:createHandler("isShowNaturePanel")
	}):anchorPoint(0.5, 0):xy(-720, -195):z(20)

	idlereasy.if_not(slot0.isShowNaturePanel, function ()
		uv0 = "onSureSelNature"

		slot0:onSureSelNature()
	end)
	idlereasy.when(slot0.isShowNaturePanel, function (slot0, slot1)
		uv2 = "attrPanel"

		slot2.attrPanel:visible(slot1)
	end)
	uiEasy.updateUnlockRes(gUnlockCsv.cardLike, slot0.btnFeel, {
		pos = cc.p(120, 100)
	})
	idlereasy.any({
		slot0.cardFeels,
		slot0.selCardId,
		slot0.roleLevel
	}, function (slot0, slot1, slot2)
		uv4 = "csv"

		slot4.btnFeel:get("level"):text((slot1[csv.cards[slot2].cardMarkID] or {}).level or 0)
	end)

	if slot0._sortType or slot1.sortType then
		slot0.sortType:set(slot0._sortType or slot1.sortType)
	end

	slot0:onChangeView(nil, slot0.curSelBtn)

	slot0._selCardId = nil
end

function slot7.jumpToCard(slot0, slot1)
	if slot0._selCardId then
		for slot5, slot6 in ipairs(slot1) do
			for slot10, slot11 in ipairs(slot6) do
				if slot11.cfg and slot11.cfg.cardID == slot0._selCardId then
					slot1[slot5][slot10].isSel = true
					slot0.selItemInfo = {
						row = slot5,
						idx = slot10
					}

					slot0.selCardId:set(slot0._selCardId)

					slot0.preloadCenterIndex = slot5

					return true
				end
			end
		end
	end
end

function slot7.refreshSortCardIdlersData(slot0)
	slot0.leftList:jumpToTop()

	slot1 = slot0.sortType:read()
	slot2 = {}

	for slot6, slot7 in ipairs(gHandbookArrayCsv) do
		if slot0.curSelAttrs:size() > 0 then
			if itertools.include(slot0.curSelAttrs:proxy(), csv.unit[csv.cards[slot7.cardID].unitID].natureType) or itertools.include(slot0.curSelAttrs:proxy(), slot10.natureType2) then
				table.insert(slot2, {
					cfg = slot7,
					itemType = slot0.sortType:read(),
					isHas = slot0.pokedex:read()[slot7.cardID] ~= nil,
					isSel = false
				})
			end
		else
			table.insert(slot2, slot8)
		end
	end

	slot3 = slot1 == 1 and 2 or 1

	if not slot0:jumpToCard(slot0:resetDataStruct(slot0:resetData(slot2, slot1), slot1)) and slot2[slot3] and slot2[slot3][1] then
		slot2[slot3][1].isSel = true
		slot0.selItemInfo = {
			idx = 1,
			row = slot3
		}

		slot0.selCardId:set(slot2[slot3][1].cfg.cardID)
	end

	slot0.cardDatas:update(slot2)
end

function slot7.resetStarData(slot0)
	slot1 = csv.cards[slot0.selCardId:read()]
	slot8, slot3, slot4 = dataEasy.getCardMaxStar(slot1.cardMarkID)
	slot5 = slot0.starDatas
	slot5 = slot5.update

	slot5(slot5, dataEasy.getStarData(slot8))

	uv5 = "csv"
	slot5, slot6, slot7 = slot5.getStarAttrData(slot1.cardMarkID)
	uv8 = "csv"

	slot8.setAttrPanel(slot0.center:get("starAttr"), slot5, slot6, slot7)

	slot9 = slot0.pokedex:read()[slot0.selCardId:read()] ~= nil and cc.c4b(91, 81, 91, 255) or cc.c4b(183, 176, 158, 255)

	text.addEffect(slot0.center:get("starAttr.textName"), {
		color = slot9
	})
	text.addEffect(slot0.center:get("starAttr.textNum"), {
		color = slot9
	})
end

function slot7.resetDataStruct(slot0, slot1, slot2)
	if slot2 == 2 then
		return slot1
	end

	slot3 = {}

	if slot2 == 1 then
		slot4 = false

		for slot8, slot9 in ipairs(slot1) do
			slot10 = {}

			for slot14, slot15 in ipairs(slot9) do
				if not false then
					slot4 = true

					table.insert(slot3, {
						{
							itemType = "title",
							val = csv.unit[csv.cards[slot15.cfg.cardID].unitID].rarity
						}
					})
				end

				if slot14 % 4 == 1 then
					if slot14 > 4 then
						table.insert(slot3, slot10)
					end

					slot10 = {}
				end

				table.insert(slot10, slot15)
			end

			if #slot10 > 0 then
				table.insert(slot3, slot10)

				slot10 = {}
			end
		end
	else
		slot4 = {}

		for slot9, slot10 in ipairs(slot1[1] or {}) do
			if slot9 % 4 == 1 then
				if slot9 > 4 then
					slot5 = 0 + 1

					table.insert(slot3, slot4)
				end

				slot4 = {}
			end

			table.insert(slot4, slot10)
		end

		if #slot4 > 0 then
			table.insert(slot3, slot4)
		end
	end

	return slot3
end

function slot7.initModel(slot0)
	slot0.pokedex = gGameModel.role:getIdler("pokedex")
	slot0.cardFeels = gGameModel.role:getIdler("card_feels")
	slot0.roleLevel = gGameModel.role:getIdler("level")
end

function slot7.onCleanup(slot0)
	slot0._sortType = slot0.sortType:read()
	slot0._selCardId = slot0.selCardId:read()
	slot0._natureDatas = {}

	for slot4, slot5 in slot0.natureDatas:ipairs() do
		table.insert(slot0._natureDatas, table.deepcopy(slot5:read(), true))
	end

	uv1 = "_sortType"

	slot1.onCleanup(slot0)
end

function slot7.onShowAttrPanel(slot0, slot1, slot2)
	slot0.isShowNaturePanel:modify(function (slot0)
		return true, not slot0
	end)
	slot0.isDownListShow:set(false)
end

function slot7.onSureSelNature(slot0, slot1, slot2)
	slot3 = {}

	for slot7 = 1, #game.NATURE_TABLE do
		if slot0.natureDatas:atproxy(slot7).state then
			table.insert(slot3, slot7)
		end
	end

	slot0.curSelAttrs:set(slot3)
end

function slot7.onClickItem(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.cardDatas:atproxy(slot0.selItemInfo.row)[slot0.selItemInfo.idx].isSel = false
	slot0.selItemInfo = {
		row = slot2,
		idx = slot3
	}
	slot0.cardDatas:atproxy(slot2)[slot3].isSel = true

	slot0.selCardId:set(slot4)
end

function slot7.onShowTupoPanel(slot0, slot1, slot2)
	gGameUI:stackUI("city.handbook.break", nil, {
		blackLayer = true
	})
end

function slot7.onSortMenusBtnClick(slot0, slot1, slot2, slot3, slot4)
	if slot3 == slot0.sortType:read() then
		return
	end

	slot0.leftList:getInnerContainer():setPosition(cc.p(0, 0))
	slot0.leftList:setInnerContainerSize(cc.size(0, 0))
	slot0.sortType:set(slot3)
end

function slot7.onCloseOtherView(slot0, slot1, slot2)
	slot0.isShowNaturePanel:set(false)
end

function slot7.onBtnComment(slot0)
	if gHandbookCsv[slot0.selCardId:read()] and not slot1.isOpen then
		gGameUI:showTip(gLanguageCsv.currentVersionNotOpen)

		return
	end

	gGameApp:requestServer("/game/card/comment/list", function (slot0)
		uv5 = "gGameApp"

		gGameApp:requestServer("/game/card/score/get", function (slot0)
			uv6 = "gGameUI"
			slot6 = slot6.selCardId
			slot7 = slot6
			uv7 = "stackUI"

			gGameUI:stackUI("city.card.comment", nil, {
				full = true
			}, slot6.read(slot7), slot7.view, slot0.view)
		end, slot5.selCardId:read())
	end, slot0.selCardId:read(), 0, 20)
end

function slot7.refreshTestPlayBtn(slot0)
	slot0.btnTestPlay:hide()
	adapt.oneLinePos(slot0.btnFeel, {
		slot0.btnComment,
		slot0.btnTestPlay
	}, cc.p(20, 0), "right")

	if not dataEasy.isUnlock(gUnlockCsv.testPlay) then
		return
	end

	if csv.experience.list[slot0.selCardId:read()] and matchLanguageForce(slot2.languages) and slot2.handBookIsShow then
		slot0.btnTestPlay:show()
		adapt.oneLinePos(slot0.btnFeel, {
			slot0.btnComment,
			slot0.btnTestPlay
		}, cc.p(20, 0), "right")
	end
end

function slot7.onBtnTestPlay(slot0)
	gGameUI:stackUI("city.experience.embattle_view", nil, {
		full = true
	}, slot0.selCardId:read())
end

function slot7.onBtnFeel(slot0)
	slot1 = slot0.selCardId:read()
	slot2 = csv.cards[slot1]

	if gHandbookCsv[slot1] and not slot3.isOpen then
		gGameUI:showTip(gLanguageCsv.currentVersionNotOpen)

		return
	end

	if csvSize(slot2.feelItems) <= 0 then
		gGameUI:showTip(gLanguageCsv.notDevelopFeel)

		return
	end

	if not dataEasy.isUnlock(gUnlockCsv.cardLike) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.cardLike))

		return
	end

	if csv.card_mega[slot2.megaIndex] and not dataEasy.isUnlock(gUnlockCsv.mega) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.mega))

		return
	end

	slot5 = csv.cards
	slot6 = false

	for slot10, slot11 in pairs(slot0.pokedex:read()) do
		if slot5[slot10].cardMarkID == slot5[slot0.cardDatas:atproxy(slot0.selItemInfo.row)[slot0.selItemInfo.idx].cfg.cardID].cardMarkID then
			slot6 = true

			break
		end
	end

	if not slot6 then
		gGameUI:showTip(gLanguageCsv.wizardNotActivated)

		return
	end

	gGameUI:stackUI("city.card.feel.view", nil, , slot1)
end

function slot7.onBtnDetail(slot0)
	if gHandbookCsv[slot0.selCardId:read()] and not slot1.isOpen then
		gGameUI:showTip(gLanguageCsv.currentVersionNotOpen)

		return
	end

	gGameUI:stackUI("city.handbook.detail", nil, , slot0.selCardId:read(), slot0:createHandler("resetStarData"))
end

function slot7.onShowAllAttrPanel(slot0)
	gGameUI:stackUI("city.handbook.add_attr", nil, {
		clickClose = true,
		blackLayer = false
	})
end

function slot7.onChangeView(slot0, slot1, slot2, slot3)
	slot0.btnsData:atproxy(slot0.curSelBtn).state = false
	slot0.btnsData:atproxy(slot2).state = true
	slot0.curSelBtn = slot2

	if slot0.btnsData:atproxy(slot2).func then
		if slot0.childView then
			slot0.childView:onClose()
		end

		slot0.childView = slot4({
			selCardId = slot0:createHandler("selCardId")
		})
	end

	adapt.oneLinePos(slot0.centerName, slot0.upList, cc.p(28, 0))
end

return slot7
