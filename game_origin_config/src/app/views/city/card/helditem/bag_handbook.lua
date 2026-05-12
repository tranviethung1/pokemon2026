slot0 = require("app.views.city.card.helditem.tools")
slot1 = class("BagHandbookView", Dialog)
slot2 = {
	"",
	"btn_green.png",
	"btn_blue.png",
	"btn_purple.png",
	"btn_orange.png",
	"btn_red2.png"
}
slot3 = {
	"",
	"btn_green_1.png",
	"btn_blue_1.png",
	"btn_purple_1.png",
	"btn_orange_1.png",
	"btn_red2_1.png"
}
slot4 = {
	"",
	"label_green.png",
	"label_blue.png",
	"label_purple.png",
	"label_orange.png",
	"label_red2.png"
}

for slot9, slot10 in ipairs({
	1,
	5,
	4,
	3,
	2
}) do
	slot5[slot10] = slot9
end

slot1.RESOURCE_FILENAME = "held_item_bag_handbook.json"
slot1.RESOURCE_BINDING = {
	["right.rightInfo"] = "rightInfo",
	innweList = "innweList",
	["right.center.list"] = "rightCenterList",
	["right.center"] = "rightCenter",
	icon = "icon",
	item1 = "item1",
	item = "item",
	attrInnerList = "attrInnerList",
	left = "left",
	["right.item"] = "rightItem",
	["right.rightInfo.item"] = "rightInfoItem",
	right = {
		varname = "rightPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("isVisibleRight")
		}
	},
	["left.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				leftPadding = 10,
				asyncPreload = 20,
				topPadding = 10,
				columnSize = 4,
				data = bindHelper.self("heldItems"),
				item = bindHelper.self("innweList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("imgSel"):visible(slot3.isSel)

					slot4 = csv.held_item.items
					slot5 = csv.held_item.effect

					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.csvId
							},
							onNode = function (slot0)
								uv1 = "getIdx"
								uv3 = "bind"
								uv3 = "getIdx"
								uv7 = "getIdx"
								uv9 = "click"

								bind.click(slot3, slot0, {
									method = functools.partial(slot7.clickCell, slot1:getIdx(slot3), slot9)
								})
							end
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	["right.textName"] = {
		varname = "heldItemName",
		binds = {
			event = "text",
			idler = bindHelper.self("itemName")
		}
	},
	["right.list"] = {
		varname = "rightlist",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("attrs"),
				item = bindHelper.self("attrInnerList"),
				cell = bindHelper.self("item1"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = game.ATTRDEF_TABLE[slot3.attr]

					slot1:get("imgIcon"):texture(ui.ATTR_LOGO[slot4])
					slot1:get("textAttrName"):text(gLanguageCsv["attr" .. string.caption(slot4)])
					slot1:get("textAttrNum"):text("+" .. slot3.val)
					adapt.oneLinePos(slot1:get("textAttrName"), slot1:get("textAttrNum"), cc.p(10, 0), "left")
				end
			}
		}
	},
	["right.center.btnInfo"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onInfoClick")
			}
		}
	},
	["right.rightInfo.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("rightInfoData"),
				item = bindHelper.self("rightInfoItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:setTouchEnabled(true)

					slot4 = slot1:get("normal")

					slot4:setTouchEnabled(true)

					uv9 = "setTouchEnabled"
					slot9 = slot9[slot3.quality] or "btn_red.png"

					slot4:texture("city/card/helditem/bag/" .. slot9)

					uv9 = "get"

					slot1:get("selected"):texture("city/card/helditem/bag/" .. (slot9[slot3.quality] or "btn_red_1.png"))

					slot6 = nil

					if slot3.select then
						slot4:hide()

						slot6 = slot5:show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					if not slot3.quality then
						slot6:get("txt"):text(gLanguageCsv.all)
					else
						slot6:get("txt"):text(gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot3.quality]])
					end

					adapt.setTextScaleWithWidth(slot6:get("txt"), nil, slot6:width() - 40)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.selectQuality, slot3)
						}
					})
				end
			},
			handlers = {
				selectQuality = bindHelper.self("onSelectQuality")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)
	slot0:initModel()

	slot0.cardDbId = slot1 or slot0.cards:read()[1]
	slot0.isVisibleRight = idler.new(false)
	slot0.heldItems = idlers.newWithMap({})
	slot0.showLeftSelected = idler.new(1)
	slot0.showRightSelected = idler.new(1)

	slot0.attrInnerList:setScrollBarEnabled(false)

	slot0.itemName = idler.new("")
	slot0.curBtnState = idler.new(1)
	slot0.attrs = idlers.newWithMap({})

	idlereasy.when(slot0.isVisibleRight, function (slot0, slot1, slot2)
		slot3 = display.sizeInView.width / 2
		uv4 = "display"
		uv6 = "display"

		slot6.left:x(slot1 and slot3 - slot4.left:size().width / 2 - 17 or slot3)
	end)

	slot2 = csv.held_item.items

	function slot3(slot0, slot1)
		uv2 = "csvId"
		slot3 = slot0.csvId
		uv3 = "csvId"

		if slot2[slot3].quality ~= slot3[slot1.csvId].quality then
			return slot3.quality < slot2.quality
		end

		if slot0.isExc ~= slot1.isExc then
			return slot0.isExc
		end

		if slot0.csvId ~= slot1.csvId then
			return slot0.csvId < slot1.csvId
		end

		return slot0.num < slot1.num
	end

	idlereasy.any({
		slot0.showLeftSelected,
		slot0.showRightSelected,
		slot0.quality
	}, function (slot0, slot1, slot2, slot3)
		slot4 = {}
		uv7 = "ipairs"

		for slot9, slot10 in ipairs(slot7.tableDatas) do
			slot5 = 0 + 1

			if slot3 then
				uv11 = "tableDatas"

				if slot11[slot10.csvId].quality == slot3 then
					table.insert(slot4, clone(slot10))
				end
			else
				table.insert(slot4, clone(slot10))
			end
		end

		table.sort(slot4, function ()
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

		slot6 = slot4[1]
		slot6.isSel = true
		uv6 = "ipairs"
		slot6 = slot6.heldItems
		slot6 = slot6.update

		slot6(slot6, slot4)

		uv6 = "ipairs"
		slot6 = slot6.selIdx
		slot6 = slot6.set

		slot6(slot6, 1, true)

		uv6 = "ipairs"

		slot6.isVisibleRight:set(slot5 > 0)
	end)
	slot0.selIdx:addListener(function (slot0, slot1)
		if slot1 ~= slot0 then
			if slot1 ~= -1 then
				uv2 = "heldItems"

				if slot2.heldItems:atproxy(slot1) then
					uv2 = "heldItems"

					if slot2.heldItems:atproxy(slot1).isSel ~= false then
						uv2 = "heldItems"
						slot2.heldItems:atproxy(slot1).isSel = false
					end
				end
			end

			uv2 = "heldItems"

			if slot2.heldItems:atproxy(slot0).isSel ~= true then
				uv2 = "heldItems"
				slot2.heldItems:atproxy(slot0).isSel = true
			end
		end

		slot2 = csv.held_item.items
		slot3 = csv.held_item.effect
		uv4 = "heldItems"
		slot4 = slot4.heldItems:atproxy(slot0)
		slot5 = 1
		slot6 = gLanguageCsv.spaceEquip
		slot7 = slot4.cfg.name

		if slot4.advance > 0 then
			slot7 = string.format("%s +%d", slot4.cfg.name, slot4.advance)
		end

		uv8 = "heldItems"
		slot8 = slot8.itemName
		slot9 = slot8

		slot8.set(slot9, slot7)

		uv9 = "heldItems"
		slot9 = slot9.heldItemName
		slot10 = {
			color = slot4.cfg.quality and ui.COLORS.QUALITY[slot4.cfg.quality] or ui.COLORS.NORMAL.DEFAULT
		}

		text.addEffect(slot9, slot10)

		uv9 = "heldItems"
		uv10 = "heldItems"

		bind.extend(slot9, slot10.rightItem, {
			class = "icon_key",
			props = {
				noListener = true,
				data = {
					key = slot4.csvId
				}
			}
		})

		slot10 = csv.held_item.advance_attrs[slot4.advance]
		slot14 = {}

		for slot18, slot19 in ipairs(slot4.cfg.attrTypes) do
			table.insert(slot14, {
				attr = slot19,
				val = math.floor(slot4.cfg.attrNumRates[slot18] * slot10["attrRate" .. slot4.cfg.advanceAttrSeq][slot18] * (csv.held_item.level_attrs[slot4.lv]["attrNum" .. slot4.cfg.strengthAttrSeq][slot18] + slot10["attrNum" .. slot4.cfg.advanceAttrSeq][slot18]))
			})
		end

		uv15 = "heldItems"

		slot15.attrs:update(slot14)

		slot15 = {}

		for slot19 = 1, 100 do
			slot20 = slot4.cfg[string.format("effect%dLevelAdvSeq", slot19)]

			if not slot4.cfg["effect" .. slot19] or slot4.cfg["effect" .. slot19] == 0 or not slot20 or 0 < slot20[1] then
				break
			end

			uv22 = "atproxy"

			table.insert(slot15, slot22.getStrinigByData(slot19, slot4))
		end

		slot19 = "\n"
		uv19 = "heldItems"
		slot17 = beauty.textScroll({
			fontSize = 40,
			isRich = true,
			list = slot19.rightCenterList,
			strs = "#C0x5B545B#" .. table.concat(slot15, slot19)
		})
	end)
	idlereasy.when(slot0.quality, function (slot0, slot1)
		uv2 = "rightInfoData"

		for slot5, slot6 in slot2.rightInfoData:pairs() do
			slot7.select = slot6:proxy().quality == slot1

			if slot7.select then
				uv8 = "rightInfoData"
				uv11 = "pairs"

				slot8.icon:texture("city/card/helditem/bag/" .. (slot11[slot1] or "label_red.png"))
			end
		end
	end)
end

function slot1.refreshData(slot0)
	slot2 = {}

	for slot7, slot8 in orderCsvPairs(csv.held_item.items) do
		if slot8.itemsShow and (slot8.quality ~= 6 or dataEasy.isUnlock(gUnlockCsv.helditemBag6)) then
			slot9 = {
				cfg = slot8,
				csvId = slot7,
				num = 1,
				isSel = false,
				lv = 1,
				cardDbID = slot7,
				advance = slot10
			}
			slot10 = 0
			uv10 = "csv"
			slot10, slot9.isExc = slot10.isExclusive(slot9)

			table.insert(slot2, slot9)
		end
	end

	slot0.tableDatas = slot2
	slot4 = {}

	for slot8, slot9 in pairs({
		[slot8.quality] = true
	}) do
		table.insert(slot4, {
			quality = slot8
		})
	end

	table.sort(slot4, function (slot0, slot1)
		return slot1.quality < slot0.quality
	end)
	table.insert(slot4, 1, {})

	slot0.rightInfoData = idlers.newWithMap(slot4)
end

function slot1.initModel(slot0)
	slot0.quality = idler.new()
	slot0.myHeldItem = gGameModel.role:getIdler("held_items")
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.selIdx = idler.new(1)

	slot0:refreshData()
	slot0.item:visible(false)
	slot0.item1:visible(false)
end

function slot1.onInfoClick(slot0, slot1, slot2)
	slot4, slot5 = slot1:getPosition()
	slot6 = slot1:getParent():convertToWorldSpace(cc.p(slot4, slot5))

	gGameUI:stackUI("city.card.helditem.advance_detail", nil, , {
		offy = 120,
		offx = 256,
		data = slot0.heldItems:atproxy(slot0.selIdx:read()),
		target = slot1,
		x = slot6.x,
		y = slot6.y
	})
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	slot0.selIdx:set(slot2.k)
	slot0.isVisibleRight:set(true)
end

function slot1.onSelectQuality(slot0, slot1, slot2)
	slot0.quality:set(slot2.quality)
end

function slot1.onClose(slot0)
	slot1 = gGameModel.cards:find(slot0.cardDbId):read("held_item")

	Dialog.onClose(slot0)
end

return slot1
