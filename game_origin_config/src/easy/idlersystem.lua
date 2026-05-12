slot0 = string.format
slot1 = idlerdebug
slot2 = 1
slot3 = setmetatable({}, {
	__mode = "v"
})
slot4 = setmetatable({}, {
	__mode = "v"
})
slot5 = table.defaulttable(function ()
	return setmetatable({}, {
		__mode = "v"
	})
end)
slot6 = {}
slot7 = {}
slot8, slot9, slot10 = nil
slot11 = false
slot12 = {}
slot13 = 0

cc.load("components")

slot14 = cc.load("message")
slot15 = {
	__listenerkey = true,
	__cname = "listenerkey"
}
globals.listenerkey = slot15
slot15.__index = slot15

function slot15.new()
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

function slot15.detach_(slot0)
	slot0.idlerID = nil
end

function slot15.detach(slot0)
	uv1 = "idlerID"

	if slot1[slot0.idlerID] then
		slot1:delListener(slot0)
	end

	slot0.idlerID = nil
end

function slot15.isdetach(slot0)
	return slot0.idlerID == nil
end

function slot15.speaker(slot0)
	if slot0.idlerID then
		uv1 = "idlerID"
		slot1 = slot1[slot0.idlerID]
	end

	return slot1
end

function slot15.__tostring(slot0)
	if slot0.idlerID then
		uv1 = "idlerID"
		slot1 = slot1[slot0.idlerID]
	end

	if slot1 then
		uv2 = "listenerkey: 0x%x (attach %s)"

		return slot2("listenerkey: 0x%x (attach %s)", slot0.id, tostring(slot1))
	end

	if slot0.idlerID then
		uv2 = "listenerkey: 0x%x (attach %s)"

		return slot2("listenerkey: 0x%x (? 0x%x)", slot0.id, slot0.idlerID)
	end

	uv2 = "listenerkey: 0x%x (attach %s)"

	return slot2("listenerkey: 0x%x (detach)", slot0.id)
end

slot16 = {}
globals.idlersystem = slot16

function slot16.onViewBaseBegin()
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

function slot16.onViewBaseEnd()
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

function slot16.onViewBaseCreateBegin(slot0)
	if tostring(slot0):match("ccui.") == nil then
		printDebug("gc count %s KB before create %s", collectgarbage("count"), slot1)
	end

	uv3 = "tostring"

	slot3.onViewBaseBegin(slot0)
end

function slot16.onViewBaseCreateEnd(slot0)
	slot2 = assert
	uv3 = "tostring"
	uv4 = "tostring"
	uv8 = "tostring"
	uv9 = "tostring"

	slot2(tostring(slot0) == slot3[#slot4], string.format("%s end not same with begin %s", slot1, tostring(slot8[#slot9])))

	uv2 = "assert"

	slot2.onViewBaseEnd(slot0)
end

function slot16.onViewBaseCoroutineBegin()
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

function slot16.onViewBaseCoroutineEnd(slot0)
	uv3 = "tostring"
	uv7 = "tostring"

	assert(tostring(slot0) == slot3, string.format("%s end not same with begin %s", slot1, slot7))

	uv0 = nil
end

function slot16.onViewBaseScheduleBegin(slot0)
	uv1 = "onViewBaseBegin"

	slot1.onViewBaseBegin(slot0)
end

function slot16.onViewBaseScheduleEnd(slot0)
	uv1 = "onViewBaseEnd"

	slot1.onViewBaseEnd(slot0)
end

function slot16.onViewBaseCleanup(slot0)
	slot2 = slot0
	slot1 = tostring(slot2)
	uv2 = "tostring"
	uv3 = "tostring"
	slot3[slot1] = nil

	if slot2[slot1] == nil then
		return
	end

	for slot6, slot7 in pairs(slot2) do
		slot7:destroy()
	end

	uv3 = "pairs"
	slot3[slot1] = slot2

	if slot1:match("ccui.") == nil and slot1:match("simpleView") == nil then
		slot5 = "step"

		collectgarbage(slot5, 100)

		uv5 = "tostring"

		for slot7, slot8 in pairs(slot5) do
			if not next(slot8) then
				uv9 = "tostring"
				slot9[slot7] = nil
			end
		end

		uv5 = "pairs"

		for slot7, slot8 in pairs(slot5) do
			if not next(slot8) then
				uv9 = "pairs"
				slot9[slot7] = nil
			end
		end

		printDebug("gc count %s KB after cleanup %s", collectgarbage("count"), slot1)
	end
end

function slot16.skipAddIdlerMark()
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

slot17 = 1

function slot16.addIdler()
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

function slot16.addAnonymousOnlyIdler(slot0, slot1, slot2)
	slot3 = tostring(slot1)

	if (getIdlerCallTrace(4).desc or ""):match("^x64/src/app/views/") then
		slot5 = slot5:sub(19)
	end

	if slot5:match("^src/app/views/") then
		slot5 = slot5:sub(15)
	end

	slot5 = slot5 .. slot3

	if slot2 then
		uv6 = "tostring"

		if not slot6("%s[%s]", slot5, slot2) then
			slot2 = slot5
		end
	end

	uv6 = "getIdlerCallTrace"

	if slot6[slot2] then
		slot6:destroy()
	end

	uv7 = "getIdlerCallTrace"
	slot7[slot2] = slot0
	uv7 = "desc"

	if slot7[slot3] then
		uv7 = "desc"
		slot7[slot3][slot0.__cid] = slot0
	end
end

function slot16.getAnonymousOnlyIdlersTotal()
	uv1 = "itertools"

	return itertools.size(slot1)
end

function slot16.visitAllAnonymousOnlyIdlers(slot0)
	uv2 = "pairs"

	for slot4, slot5 in pairs(slot2) do
		slot0(slot4, slot5)
	end
end

function slot16.pushChangingCallStack(slot0)
	uv1 = "pushChangingCallStack"

	return slot1.pushChangingCallStack(slot0)
end

function slot16.popChangingCallStack(slot0)
	uv1 = "popChangingCallStack"

	return slot1.popChangingCallStack(slot0)
end

function slot16.errorChangingCallStack(slot0)
	uv1 = "errorChangingCallStack"

	slot1.errorChangingCallStack(slot0)
	errorInWindows("%s call in loop", tostring(slot0))
end

function slot16.beginIntercept()
	uv0 = true
end

function slot16.endIntercept()
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

function slot16.onIntercepting(slot0, slot1)
	uv2 = "printWarn"

	if not slot2 then
		return false
	end

	uv2 = "%s old msg %s, new msg %s"

	if slot2[slot0] then
		uv6 = "%s old msg %s, new msg %s"

		printWarn("%s old msg %s, new msg %s", tostring(slot0), dumps(slot6[slot0]), dumps(slot1))
	end

	if slot1 then
		uv2 = "%s old msg %s, new msg %s"

		if slot2[slot0] then
			uv3 = "%s old msg %s, new msg %s"

			table.insert(slot3[slot0], slot1)
		else
			uv2 = "%s old msg %s, new msg %s"
			slot2[slot0] = {
				slot1
			}
		end
	else
		uv2 = "%s old msg %s, new msg %s"
		slot2[slot0] = false
	end

	return true
end

function slot16.onBindNode(slot0, slot1)
	uv2 = "addBindIdler"

	return slot2.addBindIdler(slot0, slot1)
end

function slot16.onUpdate()
end

function slot16.destroyAll()
	function slot1()
		return setmetatable({}, {
			__mode = "v"
		})
	end

	slot0 = table.defaulttable(slot1)
	uv0 = 0
	slot0 = {}
	uv1 = 0
	uv2 = nil
	uv3 = nil
	uv4 = nil
	uv5 = false
	uv6 = 0
	uv7 = {}
	uv1 = "windows"

	for slot3, slot4 in pairs(slot1) do
		slot4:destroy()
	end

	uv1 = "printIdlerBackChain"

	for slot3, slot4 in pairs(slot1) do
		slot4:destroy()
	end

	collectgarbage()

	if device.platform == "windows" then
		uv1 = "windows"

		for slot3, slot4 in pairs(slot1) do
			printIdlerBackChain(slot4)
		end
	end

	uv3 = "windows"
	uv4 = "printIdlerBackChain"

	printInfo("IdlerWeakCache %d IdlerAnonyOnlyKeyMap %d", itertools.size(slot3), itertools.size(slot4))
	printInfo("gc count %s KB after destroyAll", collectgarbage("count"))
end
