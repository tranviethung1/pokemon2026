slot0 = {
	received = 2,
	noReach = 0,
	canReceive = 1
}
slot1 = class("ActivityFirstRechargeDaily", Dialog)
slot1.RESOURCE_FILENAME = "activity_first_recharge_daily.json"
slot1.RESOURCE_BINDING = {
	list = "list",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	buyBtn = {
		varname = "btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuyClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameModel.currday_dispatch:getIdlerOrigin("firstRechargeDaily"):modify(function ()
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
	end, true)

	slot0.activityId = slot1
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")

	for slot7, slot8 in csvPairs(csv.yunying.generaltask) do
		if slot8.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
			slot0.csvId = slot7

			uiEasy.createItemsToList(slot0, slot0.list, slot8.award, {
				onAfterBuild = function ()
					uv0 = "list"

					slot0.list:setItemAlignCenter()
				end
			})

			break
		end
	end

	uv4 = "gGameModel"
	slot0.state = slot4.noReach

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "stamps"
		slot4 = {}

		for slot8, slot9 in csvPairs(csv.yunying.generaltask) do
			uv11 = "csvPairs"

			if slot9.huodongID == slot11 then
				uv10 = "csv"
				slot11 = slot10.btn:get("label")

				if ((slot1[slot2] or {}).stamps or {})[slot8] == 1 then
					uv12 = "csv"
					uv13 = "yunying"
					slot12.state = slot13.canReceive

					slot11:text(gLanguageCsv.spaceReceive)
					cache.setShader(slot10, false, "normal")
					text.addEffect(slot11, {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})
					slot10:setTouchEnabled(true)
				elseif slot3[slot8] == 0 then
					uv12 = "csv"
					uv13 = "yunying"
					slot12.state = slot13.received

					slot11:text(gLanguageCsv.received)
					text.deleteAllEffect(slot11)
					cache.setShader(slot10, false, "hsl_gray")
					slot10:setTouchEnabled(false)
				else
					uv12 = "csv"
					uv13 = "yunying"
					slot12.state = slot13.noReach

					slot11:text(gLanguageCsv.goToRecharge)
					cache.setShader(slot10, false, "normal")
					text.addEffect(slot11, {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})
					slot10:setTouchEnabled(true)
				end
			end
		end
	end)
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot1.onBuyClick(slot0)
	uv2 = "state"

	if slot0.state == slot2.noReach then
		gGameUI:stackUI("city.recharge", nil, {
			full = true
		})
	else
		uv2 = "state"

		if slot0.state == slot2.canReceive then
			gGameApp:requestServer("/game/yy/award/get", function (slot0)
				gGameUI:showGainDisplay(slot0)
			end, slot0.activityId, slot0.csvId)
		end
	end
end

return slot1
