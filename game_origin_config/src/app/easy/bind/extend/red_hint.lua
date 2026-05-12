slot0 = require("easy.bind.helper")
slot1 = require("app.easy.bind.helper.red_hint")
slot2 = require("app.easy.bind.helper.red_hint_tags")
slot3 = class("redHint", cc.load("mvc").ViewBase)
slot4 = "_redHint_"
slot5 = "spr"
slot6 = "txt"
slot7 = {
	new = "other/gain_sprite/txt_new.png",
	num = "common/icon/logo_redhint_num.png",
	normal = "common/icon/logo_redhint.png"
}
slot3.defaultProps = {
	showType = "normal",
	state = true
}

function slot8()
	return true
end

function slot3.bindAllCardsByDbid(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	uv4 = "isIdler"

	if slot4.isIdler(slot1) then
		slot3 = slot3:read()
	end

	if not gGameModel.cards:find(slot3) then
		return
	end

	slot4:getIdler():addListener(function ()
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

function slot3.setNum(slot0, slot1)
	uv4 = "getChildByName"
	slot2 = slot0:getChildByName(slot4)
	uv5 = "get"
	slot3 = slot2:get(slot5)
	slot6 = slot1

	slot3:text(slot6)

	uv6 = "text"
	slot4 = slot2:get(slot6)

	slot4:size(math.max(slot3:width() + 51, slot4:height()), slot4:height())
end

function slot3.createPanel(slot0)
	slot1, slot2 = nil

	if slot0.showType ~= "num" then
		uv5 = "showType"
		slot1 = cc.Sprite:create(slot5[slot0.showType])
	else
		slot1 = ccui.Scale9Sprite:create()
		slot6 = 28
		uv6 = "showType"

		slot1:initWithFile(cc.rect(slot6, 30, 13, 7), slot6[slot0.showType])
		slot1:size(cc.size(69, 69))

		slot2 = label.create("", {
			fontSize = 45,
			color = ui.COLORS.NORMAL.WHITE
		}):setHorizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)
	end

	slot1:addTo(ccui.Layout:create():size(slot1:size()):alignCenter(slot0:size()):scale(1):addTo(slot0, 9999, "_redHint_"):xy(slot0:size().width, slot0:size().height), 1, "spr")

	if slot2 then
		slot2:addTo(slot3, 1, "txt")
	end

	return slot3
end

function slot3.bindIdlers(slot0, slot1, slot2, slot3, slot4)
	if slot1 == "unlockKey" then
		slot1 = slot1 .. slot2
		slot2 = dataEasy.getListenUnlock(slot2)

		if not slot0.unlockKeys[slot4] then
			slot0.unlockKeys[slot4] = {}
		end

		slot0.unlockKeys[slot4][slot1] = true
	elseif slot1 == "selectDbId" then
		slot0:bindAllCardsByDbid(slot2, function (...)
			uv0 = "datas"

			if slot0.datas then
				uv0 = "datas"

				slot0.datas:modify(function (slot0)
					return true, slot0
				end)
			end
		end)
	end

	slot5 = string.format("%s/%s/%s", slot3 or "", slot0.selfID, tostring(slot1))
	uv5 = "unlockKey"

	slot5.callOrWhen(slot2, function (slot0)
		uv1 = "datas"

		if slot1.datas then
			uv1 = "datas"

			slot1.datas:modify(function (slot0)
				uv1 = "lua_type"
				uv2 = "table"

				if not (slot0[slot1] ~= slot2) then
					uv3 = "table"
					slot1 = lua_type(slot3) == "table"
				end

				uv2 = "lua_type"
				uv3 = "table"
				slot0[slot2] = slot3

				return slot1, slot0
			end)
		end
	end, slot0, slot5)
end

function slot3.initExtend(slot0)
	uv3 = "getChildByName"

	if not slot0:getChildByName(slot3) then
		slot0:createPanel():hide()
	end

	if slot0.datas then
		slot0.datas:destroy()
	end

	slot0.selfID = tostring(slot0)
	slot2 = idlereasy.new({})
	slot0.datas = slot2
	uv2 = "createPanel"

	slot2.callOrWhen(slot0.state, function (slot0)
		uv1 = "datas"

		slot1.datas:modify(function (slot0)
			uv2 = "state"
			uv2 = "state"
			slot0.state = slot2

			return slot0.state ~= slot2, slot0
		end)
	end, slot0, string.format("%s/state", slot0.selfID))

	slot2 = {}
	slot0.unlockKeys = slot2
	uv2 = "createPanel"

	for slot6, slot7 in pairs(slot2.props(slot0.parent_, slot0, slot0.listenData) or {}) do
		slot0:bindIdlers(slot6, slot7)
	end

	if type(slot0.specialTag) ~= "table" then
		slot0.specialTag = {
			slot0.specialTag
		}
	end

	for slot6, slot7 in pairs(slot0.specialTag) do
		uv8 = "hide"

		for slot12, slot13 in pairs(slot8[slot7] or {}) do
			uv17 = "hide"

			slot0:bindIdlers(slot12, slot17[slot12] or slot13, nil, slot7)
		end
	end

	uv3 = "datas"

	if slot3[slot0.specialTag] then
		uv3 = "datas"

		if slot3.mustInBattleCards[slot0.specialTag] then
			uv3 = "datas"
			slot4 = slot0.datas
			slot4 = slot4.read
			uv4 = "datas"

			if not slot4.isCardInBattleCards(slot3.getCardDBID(slot4(slot4))) then
				return slot1:hide()
			end
		end
	end

	slot3 = 0

	idlereasy.when(slot0.datas, function ()
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

	if slot0.onNode then
		slot0.onNode(slot1)
	end

	return slot0
end

return slot3
