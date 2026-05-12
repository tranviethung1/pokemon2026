slot0 = game.YYHUODONG_TYPE_ENUM_TABLE
slot1 = require("app.views.city.activity.view")
slot2 = {
	BOUGHT = 1,
	CAN_BUY = 0,
	CAN_NOT_BOUGHT = 2
}
slot3 = class("ActivityExclusiveLimitDialog", Dialog)
slot3.RESOURCE_FILENAME = "activity_exclusive_limit.json"
slot3.RESOURCE_BINDING = {
	item = "item",
	timeLabel = "timeLabel",
	iconItem = "iconItem",
	close = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	rule = {
		varname = "rule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRules")
			}
		}
	},
	title = {
		varname = "title",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 5,
					color = cc.c4b(209, 50, 18, 255)
				}
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 20,
				asyncPreload = 4,
				paddings = 10,
				data = bindHelper.self("itemsData"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.boughtStatus ~= slot1.boughtStatus then
						return slot0.boughtStatus < slot1.boughtStatus
					end

					if slot0.isRMB ~= slot1.isRMB then
						return slot1.isRMB
					end

					return slot0.price < slot1.price
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("title", "levelTitle", "boxImage", "listUp", "listDown", "price", "mask", "despLabel")

					if itertools.size(slot3.cfg.item) == 1 or slot6 == 2 then
						uiEasy.createItemsToList(slot0, slot4.listUp, dataEasy.getItemData(slot3.cfg.item), {
							scale = 0.6,
							onAfterBuild = function ()
								uv0 = "listUp"

								slot0.listUp:setItemAlignCenter()
							end
						})
						slot4.listDown:visible(false)
						slot4.listUp:y(slot4.listUp:y() - slot4.listUp:height() / 2)
					else
						slot7 = {}

						for slot12 = slot6, 1, -1 do
							table.insert(slot7, slot5[slot12])
							table.remove(slot5, slot12)

							if (slot6 == 3 or slot6 == 4) and 0 + 1 == 2 then
								break
							elseif (slot6 == 5 or slot6 == 6) and slot8 == 3 then
								break
							end
						end

						uiEasy.createItemsToList(slot0, slot4.listUp, slot5, {
							scale = 0.6,
							onAfterBuild = function ()
								uv0 = "listUp"

								slot0.listUp:setItemAlignCenter()
							end
						})
						uiEasy.createItemsToList(slot0, slot4.listDown, slot7, {
							scale = 0.6,
							onAfterBuild = function ()
								uv0 = "listDown"

								slot0.listDown:setItemAlignCenter()
							end
						})
					end

					slot4.listUp:width(400)
					slot4.listDown:width(400)
					slot4.title:get("txt"):text(slot3.cfg.titleName)
					slot4.levelTitle:get("txt"):text(slot3.cfg.name)
					slot4.despLabel:text(string.format(gLanguageCsv.exclusiveRestrictionBuyTime, slot3.cfg.limit))
					slot4.boxImage:texture(slot3.cfg.icon)

					slot8 = slot4.price

					if slot3.isRMB then
						slot4.price:get("dia"):hide()
						slot4.price:get("diaPrice"):hide()
						slot4.price:get("rmb"):show():text(string.format(gLanguageCsv.symbolMoney, csv.recharges[slot3.cfg.rechargeID].rmbDisplay))
					else
						slot4.price:get("rmb"):hide()
						slot4.price:get("dia"):show()
						slot4.price:get("diaPrice"):show():text(slot3.cfg.rmbCost)
					end

					if slot3.hasBoughtNum < slot3.cfg.limit then
						slot8:setTouchEnabled(true)
						bind.touch(slot0, slot8, {
							clicksafe = false,
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
						slot4.mask:hide()
					else
						slot4.mask:get("title"):text(gLanguageCsv.sellout)
						slot8:setTouchEnabled(false)
						slot4.mask:setTouchEnabled(true)
						slot4.mask:show()
					end
				end,
				itemAction = {
					isAction = false
				},
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				clickCell = bindHelper.self("clickCell")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	gGameModel.forever_dispatch:getIdlerOrigin("exclusiveLimitDatas"):set(true)

	slot0.activityId = slot1

	slot0:initModel()
	slot0:initData()
	slot0:initUI()
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot3.initModel(slot0)
	slot0.itemsData = idlers.new()
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.product = slot0.yyhuodongs:read()[slot0.activityId].stamps
	slot0.clientBuyTimes = idler.new(true)

	idlereasy.any({
		slot0.clientBuyTimes,
		slot0.yyhuodongs
	}, function (slot0, slot1, slot2)
		uv3 = "product"
		uv4 = "product"
		slot3.product = slot2[slot4.activityId].stamps
		uv3 = "product"

		slot3:initData()
	end, true)
end

function slot3.initData(slot0)
	slot1 = {}
	slot3 = csv.yunying.yyhuodong[slot0.activityId].huodongID

	for slot7, slot8 in pairs(slot0.product) do
		slot8 = dataEasy.getPayClientBuyTimes("directBuyData", slot0.activityId, slot7, slot8)
		slot9 = csv.yunying.luxurydirectbuygift[slot7]
		slot10 = slot9.limit - slot8
		slot11 = true
		slot12 = 0

		if slot9.limit - slot8 > 0 then
			uv13 = "csv"
			slot10 = slot13.CAN_BUY
		else
			uv13 = "csv"
			slot10 = slot13.BOUGHT
		end

		if slot9.rechargeID ~= -1 then
			slot11 = true
			slot12 = csv.recharges[slot9.rechargeID].rmb
		else
			slot11 = false
			slot12 = slot9.rmbCost
		end

		table.insert(slot1, {
			csvId = slot7,
			cfg = slot9,
			boughtStatus = slot10,
			isRMB = slot11,
			price = slot12,
			hasBoughtNum = slot8
		})
	end

	slot0.itemsData:update(slot1)
end

function slot3.initUI(slot0)
	slot0.title:text(gLanguageCsv.exclusiveRestrictionTip)
	slot0.rule:hide()
	slot0:setTimeLabel()
end

function slot3.setTimeLabel(slot0)
	slot0.endTime = gGameModel.role:read("yy_endtime")[slot0.activityId]

	if slot0.endTime - time.getTime() < 0 then
		slot0.timeLabel:text(gLanguageCsv.activityOver)
	end

	slot0:enableSchedule():schedule(function ()
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
	end, 1, 0)
end

function slot3.clickCell(slot0, slot1, slot2, slot3)
	if slot3.isRMB then
		gGameApp:payDirect(slot0, {
			rechargeId = slot3.cfg.rechargeID,
			yyID = slot0.activityId,
			csvID = slot3.csvId,
			name = slot3.cfg.titleName,
			buyTimes = slot3.hasBoughtNum
		}, slot0.clientBuyTimes):doit()
	else
		if gGameModel.role:read("rmb") < slot3.cfg.rmbCost then
			uiEasy.showDialog("rmb")

			return
		end

		gGameApp:requestServer("/game/yy/award/get", function (slot0)
			uv1 = "clientBuyTimes"

			slot1.clientBuyTimes:notify()

			uv3 = "notify"

			gGameUI:showGainDisplay(slot3.cfg.item, {
				raw = false
			})
		end, slot0.activityId, slot3.csvId)
	end
end

function slot3.onRules(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot3.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.giftRluer)
		end),
		slot2.noteText(123002, 123006)
	}
end

return slot3
