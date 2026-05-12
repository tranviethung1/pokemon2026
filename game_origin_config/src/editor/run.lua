slot0 = "img/editor/btn_1.png"
slot1 = "img/editor/btn.png"
slot3 = require("3rd.msgpack")
slot4 = slot3.pack
slot5 = slot3.unpack
slot6 = nil

return {
	onRunLua = function ()
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
	end,
	onRunLuaInEditBox = function (slot0)
		slot1 = cc.LayerColor:create(cc.c4b(60, 60, 60, 200), display.sizeInView.width, display.sizeInView.height)

		slot1:setAnchorPoint(cc.p(0, 0))
		slot1:setPosition(0, 0)
		slot1:setTouchMode(cc.TOUCHES_ONE_BY_ONE)
		slot1:setSwallowsTouches(true)
		slot1:setTouchEnabled(true)
		slot1:setName("codeLayer")
		slot1:registerScriptTouchHandler(function (...)
			return true
		end)
		slot0.node:addChild(slot1)

		slot2 = ccui.ScrollView:create()

		slot2:setScrollBarEnabled(true)
		slot2:setScrollBarAutoHideEnabled(false)
		slot2:setScrollBarWidth(100)
		slot2:setScrollBarColor(cc.c3b(255, 0, 0))
		slot2:setDirection(1)
		slot2:setLayoutType(1)
		slot2:setInertiaScrollEnabled(true)
		slot2:setContentSize(cc.size(2000, 1000))
		slot2:setAnchorPoint(cc.p(0.5, 0.5))
		slot2:setInnerContainerSize(cc.size(2000, 10000))
		slot2:setPosition(display.cx + display.uiOrigin.x, display.cy)
		slot1:addChild(slot2)

		slot6 = 2000
		slot7 = 10000
		uv6 = "cc"
		slot3 = ccui.EditBox:create(cc.size(slot6, slot7), slot6)

		slot3:setFontSize(72)
		slot3:setMaxLength(1048576)

		slot6 = slot3

		slot2:addChild(slot6)

		uv6 = "LayerColor"
		uv7 = "cc"
		slot4 = ccui.Button:create(slot6, slot7)

		slot4:setTitleText("运行")
		slot4:setTitleFontSize(20)
		slot4:setPressedActionEnabled(true)
		slot4:setPosition(display.cx + display.uiOrigin.x - 500, 200)
		slot4:setScale(3)

		slot5 = 0

		slot4:addClickEventListener(function ()
			uv0 = "getText"
			slot0 = slot0:getText()

			print("--------- begin of script ---------")
			print(slot0)
			print("--------- end of script ---------")
			print("run it:")
			assert(loadstring(slot0))()
		end)

		slot8 = slot4

		slot1:addChild(slot8)

		uv8 = "LayerColor"
		uv9 = "cc"
		slot6 = ccui.Button:create(slot8, slot9)

		slot6:setTitleText("退出")
		slot6:setTitleFontSize(20)
		slot6:setPressedActionEnabled(true)
		slot6:setPosition(display.cx + display.uiOrigin.x + 500, 200)
		slot6:setScale(3)

		slot7 = 0

		slot6:addClickEventListener(function ()
			uv0 = "removeFromParent"

			slot0:removeFromParent()
		end)
		slot1:addChild(slot6)
	end
}
