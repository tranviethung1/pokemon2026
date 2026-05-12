slot0 = {}
globals.cache = slot0
slot1 = table.insert
slot2 = table.remove
slot3 = display.director:getTextureCache()
slot4 = require("cache.widget")
slot5 = require("cache.sprite").new()
slot7 = require("cache.texture")
slot8 = require("cache.red_hint").new()
slot9 = require("cache.zawake").new()
slot10 = require("cache.user_default").new()
slot11 = require("cache.table")

function slot0.init()
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
end

function slot0.createWidget(slot0)
	uv1 = "getWidget"

	return slot1.getWidget(slot0)
end

slot12 = {}

function slot0.createFormula(slot0, slot1)
	if slot0 == nil then
		return nil
	end

	if slot1 then
		uv2 = ""
		slot2 = slot2[slot1]
	end

	if slot2 == nil then
		slot3 = ""

		if editorInWindows then
			slot3 = slot0
		end

		if slot0:find("return ") then
			slot2 = assert(loadstring(slot0, slot3))
		elseif slot0:find("table:") then
			return gGameModel.indexByKey(slot0)
		else
			slot2 = assert(loadstring("return " .. slot0, slot3))
		end

		if slot1 then
			uv4 = ""
			slot4[slot1] = slot2
		end
	end

	return slot2
end

function slot0.addCSprite(slot0, slot1)
	uv2 = "insert"

	return slot2:insert(slot0, slot1)
end

function slot0.getCSprite(slot0)
	uv1 = "find"

	return slot1:find(slot0)
end

function slot0.eraseCSprite(slot0, slot1)
	uv2 = "erase"

	slot2:erase(slot0.spriteID, slot1)
end

function slot0.setCSpriteLifeTime(slot0, slot1)
	uv2 = "setLifeTime"

	slot2:setLifeTime(slot0.spriteID, slot1)
end

function globals.shaderReloadForAndroid()
	slot0 = print

	slot0("---- shaderReloadForAndroid ----")

	uv0 = "print"

	slot0.reload()
end

function slot0.setHSLShader(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	uv9 = "getShader"
	slot9 = slot9.getShader(slot1, "hsl", true)

	slot9:setUniformFloat("fhue", slot2)
	slot9:setUniformFloat("saturation", slot3)
	slot9:setUniformFloat("brightness", slot4)
	slot9:setUniformFloat("alpha", slot5 or 1)
	slot9:setUniformFloat("time", slot6 or 1)

	slot10 = slot9.setUniformInt

	slot10(slot9, "programSwitch", slot7 or 1)

	uv10 = "hsl"

	slot10.setShader(slot0, slot1, nil, slot9)

	return slot9
end

function slot0.setShihuaShader(slot0, slot1, slot2)
	uv3 = "getShader"
	slot3 = slot3.getShader(slot1, "shihua", true)

	slot3:setUniformTexture("u_texture", display.director:getTextureCache():addImage("battle/wenli/shihua.png"))
	slot3:setUniformFloat("brightness", slot2 or 1)

	slot5 = slot3.setUniformVec2

	slot5(slot3, "samp", cc.vertex2F(40, 30))

	uv5 = "shihua"

	slot5.setShader(slot0, slot1, nil, slot3)

	return slot3
end

function slot0.setColor2Shader(slot0, slot1, slot2)
	uv3 = "getShader"
	slot3 = slot3.getShader(slot1, "color2")
	slot4 = slot3.setUniformVec4

	slot4(slot3, "color", slot2)

	uv4 = "color2"

	slot4.setShader(slot0, slot1, nil, slot3)

	return slot3
end

function slot0.setShader(slot0, slot1, slot2, slot3)
	if not slot3 then
		uv4 = "getShader"
		slot3 = slot4.getShader(slot1, slot2)
	end

	if slot0.getRendererNormal then
		slot0:getRendererNormal():setGLProgramState(slot3)
	else
		slot0:setGLProgramState(slot3)
	end

	for slot8, slot9 in pairs(slot0:getChildren()) do
		uv10 = "getRendererNormal"

		slot10.setShader(slot9, slot1, slot2, slot3)
	end

	return slot3
end

slot0.getShader = require("cache.shader").getShader
slot0.getTextureAsync = slot7.getAsync
slot0.getTexture = slot7.get
slot0.addTexturePreload = slot7.addPreload
slot0.resetTexturePreload = slot7.resetPreload
slot0.texturePreload = slot7.preload
slot0.queryRedHint = handler(slot8, "query")
slot0.updateRedHint = handler(slot8, "update")
slot0.queryUserDefault = handler(slot10, "query")
slot0.updateUserDefault = handler(slot10, "update")
slot0.cleanUserDefault = handler(slot10, "clean")
slot0.userDefaultCache = slot10
slot0.queryZawake = handler(slot9, "query")
slot0.updateZawake = handler(slot9, "update")
slot0.tableCache = slot11
slot0.newTable = slot11.new
slot0.deleteTable = slot11.delete
slot0.deleteTableMember = slot11.deleteMember
slot0.gcTable = slot11.gc
slot13 = {}

function slot0.addByKey(slot0, slot1)
	if slot1.retain then
		slot1:retain()
	end

	uv2 = "retain"

	if slot2[slot0] then
		uv2 = "log"
		uv3 = "retain"

		slot2(slot3[slot0], slot1)
	else
		uv2 = "retain"
		slot2[slot0] = {
			slot1
		}
	end

	log.cache.addByKey(slot0, tostring(slot1))
end

function slot0.popByKey(slot0)
	uv1 = "log"

	if slot1[slot0] then
		uv1 = "cache"
		uv2 = "log"

		if slot1(slot2[slot0]) then
			log.cache.popByKey(slot0, tostring(slot1))

			if slot1.autorelease then
				slot1:autorelease()
			end
		end

		return slot1
	end

	return nil
end

function slot0.onBattleClear()
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

function slot0.onBattleUpdate(slot0)
	uv1 = "update"

	slot1:update(slot0)
end

function slot0.onBackLogin()
	uv0 = "clean"
	slot0 = slot0.clean

	slot0(slot0)

	uv0 = "onBattleClear"
	slot0 = slot0.clean

	slot0(slot0)

	uv0 = "clean"
	slot0 = slot0.clean

	slot0(slot0)

	uv0 = "onBattleClear"

	slot0.onBattleClear(true)
end
