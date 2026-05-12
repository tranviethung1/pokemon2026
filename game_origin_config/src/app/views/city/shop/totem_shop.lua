slot0 = require("app.views.city.shop.base_shop")
slot1 = class("TotemShopItem", slot0)
slot1.RESOURCE_FILENAME = slot0.RESOURCE_FILENAME
slot1.RESOURCE_BINDING = slot0.RESOURCE_BINDING

function slot1.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, slot1)
end

function slot1.initIdler(slot0, slot1, slot2)
	if game.SHOP_GET_PROTOL[slot1] and not slot2 then
		gGameApp:requestServer(game.SHOP_GET_PROTOL[slot1], function ()
			uv0 = "initCommonIdler"
			uv2 = "initCommonIdler"

			slot0:initCommonIdler(slot2)
		end)
	else
		slot0:initCommonIdler(slot1)
	end
end

function slot1.initCommonIdler(slot0, slot1, slot2)
	slot0.func()
	slot0:initBottomPanel()

	slot3 = gGameModel[slot0.shopInfo.modelName]

	idlereasy.any({
		slot3:getIdler("items"),
		slot3:getIdler("buy"),
		slot0.shopLimit,
		slot0.vipLevel,
		slot0.level,
		slot0.fishLevel
	}, function (slot0, slot1, slot2, slot3, slot4, slot5)
		uv6 = "initData"
		uv8 = "initData"

		slot6:initData(slot8, slot1, slot2, slot3, slot4, slot5)
	end):anonyOnly(slot0)
end

function slot1.initData(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = slot4.totem_shop or {}
	slot8 = nil

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
	end, 1, 0, "totemShop")
end

function slot1.getstartBuyInfo(slot0, slot1, slot2)
	slot3 = nil
	slot4 = 1

	if slot1.type == 1 then
		slot3 = "num"
		slot4 = math.huge
	else
		slot4 = slot1.itemCount
	end

	return slot3, slot4
end

return slot1
