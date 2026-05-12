slot0 = require("app.views.city.card.helditem.tools")
slot1 = class("ActivityQualityExchangeHelditemSelectView", Dialog)
slot1.RESOURCE_FILENAME = "activity_quality_exchange_helditem_select.json"
slot1.RESOURCE_BINDING = {
	tipPanel = "tipPanel",
	innerList = "innerList",
	item = "item",
	["title.textNote2"] = "text2",
	title = "title",
	["title.textNote1"] = "text1",
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
				columnSize = 6,
				asyncPreload = 24,
				data = bindHelper.self("datas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.inMeteor and 1 or 0

					uiEasy.addTextEffect1(slot1:get("tips"))
					slot1:get("tips"):text(gLanguageCsv.inMeteor):visible(slot4 == 1)

					slot5, slot6 = uiEasy.setIconName(slot3.csvId, nil, {
						space = true,
						advance = slot3.advance
					})

					slot1:get("name"):hide()
					slot1:removeChildByName("richName")
					text.addEffect(beauty.singleTextLimitWord(slot5, {
						fontSize = 40
					}, {
						width = 240
					}):xy(slot1:get("name"):xy()):addTo(slot1, 10, "richName"), slot6)
					bind.extend(slot0, slot1:get("icon"), {
						class = "icon_key",
						props = {
							data = {
								key = slot3.csvId,
								num = slot3.num,
								dbId = slot3.dbId
							},
							specialKey = {
								lv = slot3.lv
							},
							grayState = slot4,
							onNode = function (slot0)
								slot0:setTouchEnabled(false)
							end
						}
					})
					bind.touch(slot0, slot1:get("icon"), {
						methods = {
							ended = functools.partial(slot0.itemClick, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.qualities = slot1
	slot0.cb = slot2
	slot0.datas = idlers.new()
	slot0.resetHelditem = idler.new()
	slot3 = {}
	slot4 = 0

	adapt.oneLinePos(slot0.text1, slot0.text2)
	idlereasy.any({
		gGameModel.role:getIdler("held_items"),
		slot0.resetHelditem
	}, function ()
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
	slot0.tipPanel:visible(itertools.size(slot0.datas) == 0)
	Dialog.onCreate(slot0)
end

function slot1.getData(slot0)
	slot3 = {}
	slot4 = {}

	for slot8, slot9 in pairs(gGameModel.role:read("held_items")) do
		if gGameModel.held_items:find(slot9):read("exist_flag", "card_db_id", "advance", "level", "sum_exp", "held_item_id").exist_flag and slot0.qualities[dataEasy.getCfgByKey(slot11.held_item_id).quality] then
			if not dataEasy.getInMeteorHelditemsHash()[slot9] and slot11.sum_exp == 0 and slot11.advance == 0 and not slot11.card_db_id then
				if not slot3[slot12] then
					slot3[slot12] = {
						num = 0,
						cfg = slot13,
						dbId = slot9
					}
				end

				slot3[slot12].num = slot3[slot12].num + 1
			else
				slot14 = {
					isSpecial = true,
					num = 1,
					cfg = slot13,
					csvId = slot12,
					dbId = slot9,
					lv = slot11.level,
					cardDbID = slot11.card_db_id,
					advance = slot11.advance,
					inMeteor = slot15
				}
				uv15 = "dataEasy"
				slot14.isDress, slot14.isExc = slot1[slot9].isExclusive(slot14)

				table.insert(slot4, slot14)
			end
		end
	end

	for slot8, slot9 in pairs(slot3) do
		for slot15 = 1, math.ceil(slot9.num / slot9.cfg.stackShow) do
			slot16 = {
				advance = 0,
				lv = 1,
				num = math.min(slot11, slot10),
				cfg = slot9.cfg,
				csvId = slot8,
				dbId = slot17
			}
			uv17 = "dataEasy"
			slot16.isDress, slot16.isExc = slot9.dbId.isExclusive(slot16)

			table.insert(slot4, slot16)

			slot10 = slot10 - slot11
		end
	end

	table.sort(slot4, dataEasy.sortHelditemCmp)

	return slot4
end

function slot1.onResetHelditem(slot0, slot1)
	slot0.resetHelditem:notify()
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	if slot3.inMeteor then
		gGameUI:showTip(gLanguageCsv.inMeteorites)

		return
	end

	if slot3.isDress then
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			cb = function ()
				uv5 = "gGameUI"
				uv6 = "stackUI"

				gGameUI:stackUI("city.card.helditem.bag", nil, , slot5.cardDbID, slot6:createHandler("onResetHelditem"))
			end,
			content = string.format(gLanguageCsv.qualityExchangeHelditemSelectTip2, ui.QUALITYCOLOR[slot3.cfg.quality], uiEasy.setIconName(slot3.csvId, nil, {
				space = true,
				advance = slot3.advance
			}))
		})

		return
	end

	if slot3.isSpecial then
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			cb = function ()
				uv9 = "gGameUI"

				gGameUI:stackUI("city.card.rebirth.view", nil, {
					full = true
				}, 3, nil, , {
					heldItemId = slot9.dbId
				})
			end,
			content = string.format(gLanguageCsv.qualityExchangeHelditemSelectTip1, ui.QUALITYCOLOR[slot3.cfg.quality], uiEasy.setIconName(slot3.csvId, nil, {
				space = true,
				advance = slot3.advance
			}))
		})

		return
	end

	if slot0.cb then
		slot0.cb(slot3.dbId)
	end

	slot0:onClose()
end

return slot1
