slot0 = require("app.views.city.card.rebirth.tools")
slot1 = require("app.views.city.card.helditem.tools")
slot2 = 1
slot3 = class("ChooseHeldItemView", Dialog)
slot3.RESOURCE_FILENAME = "rebirth_select_card.json"
slot3.RESOURCE_BINDING = {
	["tipPanel.textTip"] = "textTip",
	item = "item",
	innerList = "innerList",
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
				topPadding = 10,
				columnSize = 6,
				asyncPreload = 24,
				data = bindHelper.self("heldItemDatas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:removeChildByName("name")
					slot1:get("icon.imgSel"):visible(slot3.isSel)
					bind.extend(slot0, slot1:get("icon"), {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.csvId,
								num = slot3.num,
								dbId = slot3.dbId
							},
							specialKey = {
								lv = slot3.lv
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

					slot4 = csv.held_item.items[slot3.csvId]

					text.addEffect(beauty.singleTextLimitWord(slot4.name, {
						fontSize = 40
					}, {
						width = 200
					}):xy(100, 17):addTo(slot1, 2, "name"), {
						color = slot4.quality == 1 and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.QUALITY[slot6]
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onCellClick")
			}
		}
	},
	tipPanel = {
		binds = {
			event = "visible",
			idler = bindHelper.self("showTip")
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.handlers = slot1.handlers

	slot0:initModel()
	adapt.setTextAdaptWithSize(slot0.textTip, {
		vertical = "center",
		horizontal = "center",
		size = cc.size(500, 200)
	})

	slot0.showTip = idler.new(false)
	slot0.heldItemDatas = idlers.newWithMap({})
	slot3 = {}

	for slot9, slot10 in ipairs(slot0.myHeldItem:read()) do
		if gGameModel.held_items:find(slot10):read("exist_flag", "card_db_id", "advance", "level", "sum_exp", "held_item_id").exist_flag and (slot11.sum_exp > 0 or slot11.advance > 0) then
			slot13 = {
				cfg = csv.held_item.items[slot11.held_item_id],
				csvId = slot11.held_item_id,
				dbId = slot10,
				num = 1,
				isSel = slot1.curSel == slot10,
				cardDbID = slot11.card_db_id,
				lv = slot11.level,
				advance = slot14
			}
			uv14 = "handlers"
			slot13.isDress, slot13.isExc = slot11.advance.isExclusive(slot13)

			table.insert(slot3, slot13)

			slot4 = 0 + 1
		end
	end

	table.sort(slot3, function (slot0, slot1)
		if slot0.cfg.quality ~= slot1.cfg.quality then
			return slot3 < slot2
		end

		return slot1.csvId < slot0.csvId
	end)
	slot0.heldItemDatas:update(slot3)
	slot0.showTip:set(slot4 == 0)
	Dialog.onCreate(slot0)
end

function slot3.initModel(slot0)
	slot0.myHeldItem = gGameModel.role:getIdler("held_items")
end

function slot3.onCellClick(slot0, slot1, slot2, slot3)
	function slot4()
		uv0 = "heldItemDatas"
		uv2 = "atproxy"
		slot0 = slot0.heldItemDatas:atproxy(slot2.k)
		slot0.isSel = true
		uv0 = "heldItemDatas"

		if slot0.handlers then
			uv0 = "heldItemDatas"
			uv1 = "heldItemDatas"
			uv3 = "atproxy"

			slot0.handlers(slot1.heldItemDatas:atproxy(slot3.k))
		end

		uv0 = "heldItemDatas"

		slot0:onClose()
	end

	if slot3.isDress then
		gGameUI:showDialog({
			btnType = 2,
			isRich = true,
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
			content = string.format(gLanguageCsv.heldItemIsDress, uiEasy.getCardName(slot3.cardDbID))
		})
	else
		slot4()
	end
end

return slot3
