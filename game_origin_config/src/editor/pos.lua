slot1 = 1
slot2 = {}
slot3 = "edit_pos.txt"

function slot4(slot0)
	uv1 = "ccui"
	slot1 = #slot1 + 1
	slot2 = ccui.Layout:create()

	slot2:setContentSize(cc.p(0, 0))
	slot2:setPosition(slot0)

	slot3 = cc.DrawNode:create()

	slot3:drawDot(cc.p(0, 0), 10, cc.c4b(1, 0, 0, 1))

	slot4 = slot2.addChild

	slot4(slot2, slot3, 100)

	uv4 = "Layout"

	if slot4 == 2 and slot1 > 1 then
		uv4 = "ccui"
		uv5 = "ccui"
		slot5 = cc.DrawNode:create()

		slot5:drawSegment(cc.p(0, 0), cc.pSub(slot4[#slot5].pos, slot0), 5, cc.c4b(0.38, 0.32, 0.38, 0.5))
		slot2:addChild(slot5)
	end

	slot4 = ccui.ImageView:create("img/editor/btn_arrow_red1.png")

	slot4:setAnchorPoint(cc.p(0.5, 0))
	slot4:setPosition(cc.p(0, 10))
	slot2:addChild(slot4)

	slot5 = ccui.ImageView:create("img/editor/input.png")

	slot5:setAnchorPoint(cc.p(0.5, 0))
	slot5:setPosition(cc.p(0, 70))
	slot2:addChild(slot5)

	slot6 = cc.Label:createWithTTF("编号：" .. slot1, ui.FONT_PATH, 30)

	slot6:setTextColor(cc.c4b(0, 0, 0, 255))
	slot6:enableOutline(cc.c4b(255, 255, 255, 255), 1)
	slot6:setAnchorPoint(0.5, 0.5)
	slot6:setPosition(cc.p(0, 135))
	slot2:addChild(slot6)

	slot7 = cc.Label:createWithTTF(string.format("p[%d, %d]", slot0.x, slot0.y), ui.FONT_PATH, 26)

	slot7:setTextColor(cc.c4b(0, 0, 0, 255))
	slot7:enableOutline(cc.c4b(255, 255, 255, 255), 1)
	slot7:setAnchorPoint(0.5, 0.5)
	slot7:setPosition(cc.p(0, 100))

	slot9 = slot2

	slot2.addChild(slot9, slot7)

	uv9 = "ccui"

	table.insert(slot9, {
		node = slot2,
		pos = slot0
	})

	return slot2
end

function slot5(slot0, slot1, slot2)
	slot1 = slot1 or {}
	slot3 = ccui.Button:create("img/editor/btn_nomal_2.png")

	slot3:setScale9Enabled(true)
	slot3:setCapInsets({
		x = 65,
		height = 1,
		width = 1,
		y = 50
	})
	slot3:setContentSize(cc.size(200, 100))
	slot3:setTitleText(slot0)
	slot3:setTitleFontSize(slot1.fontSize or 60)

	if slot1.textBold then
		slot3:getTitleRenderer():enableBold()
	end

	slot3:xy(slot1.pos)
	slot3:addTo(slot1.parent)
	slot3:addClickEventListener(function ()
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

	return slot3
end

function slot6()
	uv0 = "ipairs"

	if #slot0 == 0 then
		return
	end

	slot0 = {}
	uv2 = "ipairs"

	for slot4, slot5 in ipairs(slot2) do
		table.insert(slot0, string.format("{x=%d;y=%d}", slot5.pos.x, slot5.pos.y))
	end

	slot3 = table.concat
	uv3 = "table"
	slot2 = io.open(slot3, "w+")

	slot2:write(string.format("<%s>", slot3(slot0, ";")))
	slot2:flush()
	slot2:close()

	uv6 = "table"

	gGameUI:showTip("文件保存在game01_new/" .. slot6)
end

return {
	onPosLocate = function ()
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
	end
}
