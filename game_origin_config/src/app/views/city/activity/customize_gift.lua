function slot0(slot0)
	for slot5, slot6 in ipairs(slot0) do
		if not slot6.isFisAwards then
			slot1 = 0 + 1
		end
	end

	return slot1
end

function slot1(slot0, slot1, slot2, slot3)
	bind.extend(slot0, slot1:get("pic"), {
		class = "icon_key",
		props = {
			data = slot2,
			onNode = function (slot0)
				slot1 = slot0.setTouchEnabled
				uv3 = "setTouchEnabled"

				slot1(slot0, slot3)

				uv1 = "scale"

				slot1:scale(0.9)
			end
		}
	})
end

function slot2(slot0, slot1, slot2, slot3, slot4)
	slot3:visible(true)

	if slot4.isFisAwards then
		slot3:get("add"):hide()

		slot5 = slot3:get("select")
		slot5 = slot5.hide

		slot5(slot5)

		uv5 = "visible"

		slot5(slot0, slot3, dataEasy.getItemData(slot4.showAwards)[1], true)
	elseif slot4.choose and slot4.choose > 0 then
		slot3:get("add"):hide()
		slot3:get("select"):visible(slot1.isCanBuy)

		slot6 = slot4.choose
		uv6 = "visible"

		slot6(slot0, slot3, dataEasy.getItemData(slot4.showAwards[slot6])[1], not slot1.isCanBuy)

		if slot1.isCanBuy then
			bind.touch(slot0, slot3:get("pic"), {
				clicksafe = false,
				methods = {
					ended = functools.partial(slot0.clickCell, slot1, slot2, slot4.optionSlotNum, slot4.showAwards, slot4.choose)
				}
			})
		end
	else
		slot3:get("add"):show()
		slot3:get("select"):hide()
		slot3:get("pic"):hide()
		bind.touch(slot0, slot3:get("add"), {
			clicksafe = false,
			methods = {
				ended = functools.partial(slot0.clickCell, slot1, slot2, slot4.optionSlotNum, slot4.showAwards, 0)
			}
		})
	end
end

slot3 = class("ActivityCustomizeGiftDialog", Dialog)
slot3.RESOURCE_FILENAME = "activity_customize_gift.json"
slot3.RESOURCE_BINDING = {
	icon = "icon",
	item = "item",
	panel = "panel",
	close = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	tip = {
		varname = "tip",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(229, 69, 69, 255)
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
				margin = 0,
				paddings = 10,
				asyncPreload = 4,
				data = bindHelper.self("itemsData"),
				item = bindHelper.self("panel"),
				itemAction = {
					isAction = false
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.isCanBuy ~= slot1.isCanBuy then
						return slot0.isCanBuy
					end

					if slot0.rmb ~= slot1.rmb then
						return slot0.rmb < slot1.rmb
					end
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("name", "icon1", "icon2", "icon3", "icon4", "textContent", "btn").name:text(slot3.name)

					if matchLanguage({
						"kr"
					}) then
						slot4.name:setFontSize(44)
					end

					slot4.textContent:get("bg"):visible(not slot3.isCanBuy)
					slot4.textContent:get("btn"):visible(slot3.isCanBuy)
					slot4.textContent:get("btn"):get("red"):show()
					slot4.textContent:get("limitLabel"):text(string.format(gLanguageCsv.foreverLimit, slot3.buyTimes - slot3.hasBoughtNum, slot3.buyTimes))

					if slot3.hasAllChoose then
						text.addEffect(slot4.textContent:get("btn"):get("title"), {
							color = ui.COLORS.WHITE
						})
						cache.setShader(slot4.textContent:get("btn"):get("red"), false, "normal")
					else
						text.addEffect(slot4.textContent:get("btn"):get("title"), {
							color = cc.c4b(222, 218, 209, 255)
						})
						cache.setShader(slot4.textContent:get("btn"):get("red"), false, "hsl_gray")
					end

					slot4.textContent:get("btn"):get("title"):text(string.format(gLanguageCsv.symbolMoney, slot3.rmbDisplay))

					slot9 = {
						ended = functools.partial(slot0.clickBuy, slot3)
					}

					bind.touch(slot0, slot4.textContent:get("btn"), {
						clicksafe = false,
						methods = slot9
					})

					for slot9 = 1, 4 do
						slot1:get("icon" .. slot9):visible(false)

						if slot9 <= itertools.size(slot3.awards) then
							uv11 = "multiget"
							uv14 = "name"

							slot11(slot0, slot3, slot14(slot3.awards), slot10, slot3.awards[slot9])
						end
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("pushView"),
				clickBuy = bindHelper.self("clickBuy")
			}
		}
	},
	timeLabel = {
		varname = "timeLabel"
	},
	["panel.name"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.WHITE
				}
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	gGameModel.forever_dispatch:getIdlerOrigin("customizeGiftClick"):set(true)

	slot0.activityId = slot1
	slot0.huodongID = csv.yunying.yyhuodong[slot0.activityId].huodongID
	slot0.timeout = false

	slot0:initModel()
	slot0:initData()
	slot0:initUI()
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot3.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.itemsData = idlers.new()
	slot0.clientBuyTimes = idler.new(true)
end

function slot3.initData(slot0)
	idlereasy.any({
		slot0.yyhuodongs
	}, function (slot0, slot1)
		uv2 = "initCsv"
		slot3 = slot2
		uv4 = "initCsv"
		uv3 = "initCsv"
		slot3 = slot3.itemsData
		slot4 = slot3

		slot3.update(slot4, slot2.initCsv(slot3, slot1[slot4.activityId]), function (slot0)
			return slot0.rechargeID
		end)

		uv4 = "initCsv"

		dataEasy.tryCallFunc(slot4.list, "filterSortItems", true)
	end)
end

function slot3.initCsv(slot0, slot1)
	slot2 = {}
	slot4 = {}
	slot5 = {}

	function slot6(slot0, slot1)
		uv2 = "choose"

		if slot2 then
			uv2 = "choose"

			if slot2.choose then
				uv2 = "choose"

				if slot2.choose[slot0] then
					uv2 = "choose"
					slot2 = slot2.choose[slot0][slot1]
				end
			end
		end

		if not csv.yunying.customize_gift[slot0]["optionalAwards" .. slot1][slot2] then
			return 0
		end

		return slot2
	end

	function slot7(slot0)
		uv1 = "stamps"

		if slot1 then
			uv1 = "stamps"

			if slot1.stamps then
				uv1 = "stamps"

				if slot1.stamps[slot0] then
					uv1 = "stamps"

					if slot1.stamps[slot0] > 0 then
						uv1 = "stamps"
						slot1 = slot1.stamps[slot0]
					else
						slot1 = false
					end
				end
			end
		end

		return slot1
	end

	for slot12, slot13 in orderCsvPairs(csv.yunying.customize_gift) do
		if slot13.huodongID == slot0.huodongID then
			slot15 = {}
			slot16 = true
			slot21 = true

			function (slot0, slot1, slot2, slot3, slot4)
				if itertools.size(slot1) > 0 then
					table.insert(slot0, {
						showAwards = table.deepcopy(slot1, true),
						isFisAwards = slot2,
						optionSlotNum = slot3,
						choose = slot4
					})

					if not slot4 or slot4 == 0 then
						return false
					else
						return true
					end
				end

				return true
			end({}, slot13.awards, slot21)

			for slot21, slot22 in ipairs({
				slot13.optionalAwards1,
				slot13.optionalAwards2,
				slot13.optionalAwards3,
				slot13.optionalAwards4
			}) do
				if not slot8(slot14, slot22, false, slot21, slot6(slot12, slot21)) then
					slot16 = false
				end
			end

			table.insert(slot2, {
				awards = slot14,
				buyTimes = slot13.buyTimes,
				name = slot13.name,
				rechargeID = slot13.rechargeID,
				rmbDisplay = csv.recharges[slot13.rechargeID].rmbDisplay,
				rmb = csv.recharges[slot13.rechargeID].rmb,
				hasBoughtNum = slot7(slot12) or 0,
				isCanBuy = slot13.buyTimes - (slot7(slot12) or 0) > 0,
				icon = slot13.icon,
				csvId = slot12,
				hasAllChoose = slot16
			})
		end
	end

	return slot2
end

function slot3.initUI(slot0)
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

function slot3.pushView(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	gGameUI:stackUI("city.activity.customize_gift_select", nil, , slot0.activityId, slot2, slot3, slot4, slot5, slot6)
end

function slot3.clickBuy(slot0, slot1, slot2)
	if slot0.timeout then
		gGameUI:showTip(gLanguageCsv.activityOver)

		return
	end

	if not slot2.hasAllChoose then
		gGameUI:showTip(gLanguageCsv.selectGiftTip)

		return
	end

	for slot7, slot8 in pairs(slot2.awards) do
		if slot8.isFisAwards then
			table.insert({}, slot8.showAwards)
		else
			table.insert(slot3, slot8.showAwards[slot8.choose])
		end
	end

	gGameApp:payDirect(slot0, {
		rechargeId = slot2.rechargeID,
		yyID = slot0.activityId,
		csvID = slot2.csvId,
		buyTimes = slot2.hasBoughtNum,
		name = slot2.name
	}, slot0.clientBuyTimes):doit()
end

return slot3
