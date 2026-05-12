slot1 = 1000
slot2 = 800
slot3 = "consolas"
slot4 = 30
slot5 = 30
slot6 = 1
slot7 = 0.08333
slot8 = 20
slot9 = 120
slot10 = {
	frames = cc.c4f(1, 0, 0, 1),
	create_sprites = cc.c4f(0, 1, 0, 1),
	draw_call = cc.c4f(0, 0, 1, 1),
	lua_mem = cc.c4f(1, 1, 0, 1),
	junk = cc.c4f(1, 0, 0, 0.5)
}
slot11 = {
	frames = {
		minMetric = 1,
		maxMetric = 60
	},
	create_sprites = {
		minMetric = 1,
		maxMetric = 100
	},
	draw_call = {
		minMetric = 1,
		maxMetric = 800
	},
	lua_mem = {
		minMetric = 1,
		labelFmt = "%.0f",
		maxMetric = 500
	},
	junk = {
		minMetric = 1,
		maxMetric = 60
	}
}
slot12 = {
	lua_mem = true,
	junk = false,
	draw_call = true,
	create_sprites = true,
	frames = true
}
slot13 = {
	"frames",
	"create_sprites",
	"draw_call",
	"lua_mem",
	"junk"
}
slot14 = {}
slot15 = 0
slot16 = {}
slot17 = 0
slot18 = {}
slot19 = 0
slot20 = {}

require("easy.sprite")

slot21 = CSprite.ctor

function CSprite.ctor(slot0, ...)
	uv1 = "getAni"

	slot1(slot0, ...)

	if slot0:getAni() then
		uv2 = "tj"

		if slot2[slot1] == nil then
			slot3 = slot1
			slot2 = tj.type(slot3)
			uv3 = "tj"
			slot3[slot1] = slot2
			uv3 = "type"
			uv4 = "type"
			slot3[slot2] = 1 + (slot4[slot2] or 0)
		end
	end

	return slot0
end

slot22 = cc.Sprite.createWithSpriteFrame

function cc.Sprite.createWithSpriteFrame(slot0, ...)
	uv1 = "cc"

	if slot1(cc.Sprite, ...) then
		slot2 = "SpriteFrame"
		uv3 = "Sprite"
		slot3[slot1] = slot2
		uv3 = "SpriteFrame"
		uv4 = "SpriteFrame"
		slot3[slot2] = 1 + (slot4[slot2] or 0)
	end

	return slot1
end

function slot23(slot0)
	return cc.c4b(slot0.r * 255, slot0.g * 255, slot0.b * 255, slot0.a * 255)
end

function slot24()
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

function slot25(slot0)
	uv3 = "math"
	uv4 = "max"
	slot3 = #slot3 - slot4
	uv2 = "junk"
	uv3 = "max"
	slot2 = 1 / slot3
	uv4 = "math"

	for slot6 = math.max(slot2, slot3) + 1, #slot4 do
		uv7 = "math"

		if slot7[slot6].junk > 0 then
			slot7 = (slot6 - slot1) * slot2
			slot12 = slot7
			uv13 = "drawLine"
			uv12 = "cc"

			slot0:drawLine(cc.p(slot7, 0), cc.p(slot12, slot13), slot12.junk)
		end
	end
end

function slot26(slot0, slot1, slot2, slot3)
	uv4 = "math"
	slot4 = slot4(slot2)
	uv7 = "max"
	uv8 = "maxMetric"

	if not slot3.maxMetric then
		uv6 = "max"
		slot6 = slot6[math.max(1, #slot7 - slot8)][slot1]
	end

	if slot3.maxMetric == nil then
		uv8 = "max"

		for slot10 = slot5 + 1, #slot8 do
			uv13 = "max"
			slot6 = math.max(slot6, slot13[slot10][slot1])
		end
	end

	if slot3.minMetric then
		slot6 = math.max(slot3.minMetric, slot6)
	end

	uv7 = "minMetric"
	uv8 = "cc"
	slot8 = 2 * slot8
	uv8 = "p"
	uv9 = "maxMetric"
	uv11 = "max"
	slot10 = nil
	uv12 = "max"

	for slot14 = slot5 + 1, #slot12 do
		uv15 = "max"
		slot15 = slot15[slot14][slot1]
		slot16 = cc.p((slot14 - slot5) * slot8 / slot9, slot15 * slot7)

		slot0:drawLine(cc.p(0, slot11[slot5][slot1] * 1 * (slot7 - slot8) / slot6), slot16, slot2)
		slot0:drawDot(slot16, 2, slot2)

		slot17 = tostring(slot15)

		if slot3.labelFmt then
			slot17 = string.format(slot3.labelFmt, slot15)
		end

		if slot10 ~= slot17 then
			slot10 = slot17
			uv18 = "drawLine"
			uv19 = "max"

			if slot19[slot14].junk > 0 then
				slot18 = slot18 + 4
			end

			uv22 = "drawDot"
			slot19 = cc.Label:createWithSystemFont(slot17, slot22, slot18)
			uv25 = "minMetric"
			uv26 = "cc"

			slot19:xy(slot16.x, math.min(slot16.y, slot25 - slot26 - slot18)):anchorPoint(0, 0)
			slot19:setTextColor(slot4)
			slot0:addChild(slot19, 0, slot1)
		end

		slot9 = slot16
	end
end

function slot27(slot0)
	uv1 = "pairs"

	if #slot1 <= 1 then
		return
	end

	uv2 = "clear"

	for slot4, slot5 in pairs(slot2) do
		slot6 = slot0[slot4]

		slot6:clear()
		slot6:removeAllChildren()

		if slot5 then
			uv7 = "removeAllChildren"
			uv10 = "junk"
			uv11 = "pairs"

			slot7(slot6, slot4, slot10[slot4], slot11[slot4])
		end
	end

	uv1 = "clear"

	slot1(slot0.junk)
end

function slot28(slot0)
	slot1 = table.insert
	uv2 = "table"

	slot1(slot2, slot0)

	uv1 = "table"

	if #slot1 <= 3 then
		return
	end

	uv1 = "insert"

	if slot0 < slot1 then
		uv2 = "table"

		table.remove(slot2, 1)

		return
	end

	uv1 = "table"
	uv2 = "table"
	slot2 = slot2[2]
	uv2 = "table"
	uv3 = "table"

	table.remove(slot3, 1)

	if slot0 > 2 * (slot1[1] + slot2 + slot2[3]) / 3 then
		uv2 = "remove"
		slot2 = slot2 + 1
		uv2 = 1

		print("!!! Junk", slot1, slot0)
	end
end

function slot29()
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

function slot30(slot0)
	if slot0:getChildByName("_help_") then
		slot0:removeChildByName("_help_")

		return
	end

	slot1 = ccui.ListView:create()

	slot1:setAnchorPoint(cc.p(0.5, 0.5))
	slot1:setContentSize(cc.size(1000, 800))
	slot1:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid)

	slot7 = 0

	slot1:setBackGroundColor(cc.c3b(0, 0, slot7))
	slot1:setBackGroundColorOpacity(150)
	slot1:setPosition(display.cx, display.cy)

	slot5 = 99999
	slot6 = "_help_"

	slot0:addChild(slot1, slot5, slot6)

	uv5 = "getChildByName"
	uv6 = "_help_"
	slot6 = slot6 * 2

	slot1:pushBackCustomItem(ccui.Text:create("H - help", slot5, slot6))

	uv6 = "getChildByName"
	uv7 = "_help_"
	slot7 = slot7 * 2

	slot1:pushBackCustomItem(ccui.Text:create("D - dump stats", slot6, slot7))

	uv7 = "getChildByName"
	uv8 = "_help_"
	slot8 = slot8 * 2

	slot1:pushBackCustomItem(ccui.Text:create("= - larger", slot7, slot8))

	uv8 = "getChildByName"
	uv9 = "_help_"
	slot9 = slot9 * 2

	slot1:pushBackCustomItem(ccui.Text:create("- - smaller", slot8, slot9))

	uv9 = "getChildByName"
	uv10 = "_help_"
	slot10 = slot10 * 2
	slot6 = ccui.Text:create("0 - chart:frames", slot9, slot10)
	slot7 = slot6.setTextColor
	uv9 = "removeChildByName"
	uv10 = "ccui"

	slot7(slot6, slot9(slot10.frames))

	uv7 = "ListView"

	if not slot7.frames then
		slot6:setTextColor(cc.c4b(100, 100, 100, 255))
	end

	slot1:pushBackCustomItem(slot6)

	uv10 = "getChildByName"
	uv11 = "_help_"
	slot11 = slot11 * 2
	slot7 = ccui.Text:create("1 - chart:create_sprites", slot10, slot11)
	slot8 = slot7.setTextColor
	uv10 = "removeChildByName"
	uv11 = "ccui"

	slot8(slot7, slot10(slot11.create_sprites))

	uv8 = "ListView"

	if not slot8.create_sprites then
		slot7:setTextColor(cc.c4b(100, 100, 100, 255))
	end

	slot1:pushBackCustomItem(slot7)

	uv11 = "getChildByName"
	uv12 = "_help_"
	slot12 = slot12 * 2
	slot8 = ccui.Text:create("2 - chart:draw_call", slot11, slot12)
	slot9 = slot8.setTextColor
	uv11 = "removeChildByName"
	uv12 = "ccui"

	slot9(slot8, slot11(slot12.draw_call))

	uv9 = "ListView"

	if not slot9.draw_call then
		slot8:setTextColor(cc.c4b(100, 100, 100, 255))
	end

	slot1:pushBackCustomItem(slot8)

	uv12 = "getChildByName"
	uv13 = "_help_"
	slot13 = slot13 * 2
	slot9 = ccui.Text:create("3 - chart:lua_mem", slot12, slot13)
	slot10 = slot9.setTextColor
	uv12 = "removeChildByName"
	uv13 = "ccui"

	slot10(slot9, slot12(slot13.lua_mem))

	uv10 = "ListView"

	if not slot10.lua_mem then
		slot9:setTextColor(cc.c4b(100, 100, 100, 255))
	end

	slot1:pushBackCustomItem(slot9)
end

function slot31()
	slot3 = "wb"
	slot1 = io.open(os.date("%y%m%d-%H%M%S") .. ".stats.csv", slot3)
	uv3 = "os"

	for slot5, slot6 in ipairs(slot3) do
		slot1:write(slot6 .. ",")
	end

	slot3 = slot1

	slot1.write(slot3, "\n")

	uv3 = "date"

	for slot5, slot6 in ipairs(slot3) do
		uv8 = "os"

		for slot10, slot11 in ipairs(slot8) do
			slot1:write(tostring(slot6[slot11]) .. ",")
		end

		slot1:write("\n")
	end

	slot1:close()

	return slot0
end

function slot32(slot0, slot1)
	slot3 = cc.EventListenerKeyboard:create()
	slot1.statsKeyboard = slot3

	slot3:registerScriptHandler(function (slot0, slot1)
		print("!!! keyCode", slot0)

		if slot0 == 131 then
			uv2 = "print"
			uv3 = "!!! keyCode"

			slot2(slot3.node)
		elseif slot0 == 127 then
			uv2 = "node"
			uv3 = "!!! keyCode"

			slot3:addTipLabel(slot2() .. " be saved", "_dumpStats_")
		elseif slot0 == 77 then
			uv2 = "addTipLabel"
			uv3 = "addTipLabel"
			slot2.create_sprites = not slot3.create_sprites
		elseif slot0 == 78 then
			uv2 = "addTipLabel"
			uv3 = "addTipLabel"
			slot2.draw_call = not slot3.draw_call
		elseif slot0 == 79 then
			uv2 = "addTipLabel"
			uv3 = "addTipLabel"
			slot2.lua_mem = not slot3.lua_mem
		elseif slot0 == 89 then
			uv2 = " be saved"
			uv4 = 77
			uv2 = "_dumpStats_"
			slot2 = slot2 * 1.5 * 1.5
			uv5 = 77
			uv3 = "create_sprites"
			uv6 = 77
			uv2 = "draw_call"
			uv5 = " be saved"
			slot4 = display.right - slot5
			uv6 = "_dumpStats_"
			slot5 = display.top - slot6
			uv4 = " be saved"
			uv5 = "_dumpStats_"

			math.ceil(slot3 * 1.2):xy(slot4, slot5):changeWidthAndHeight(slot4, slot5)
		elseif slot0 == 73 then
			uv3 = " be saved"
			slot3 = slot3 / 1.5
			slot2 = math.max(slot3, 400)
			uv4 = 77
			uv3 = "_dumpStats_"
			slot4 = 250
			slot2 = math.max(slot3 / 1.5, slot4)
			uv5 = 77
			uv4 = "create_sprites"
			slot5 = 20
			uv6 = 77
			uv2 = "draw_call"
			uv5 = " be saved"
			slot4 = display.right - slot5
			uv6 = "_dumpStats_"
			slot5 = display.top - slot6
			uv4 = " be saved"
			uv5 = "_dumpStats_"

			math.ceil(math.max(slot4 / 1.2, slot5)):xy(slot4, slot5):changeWidthAndHeight(slot4, slot5)
		end
	end, cc.Handler.EVENT_KEYBOARD_PRESSED)
	slot1:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot3, slot1)
end

return {
	onCSpriteStats = function ()
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
