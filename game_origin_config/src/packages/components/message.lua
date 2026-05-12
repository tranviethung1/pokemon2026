slot0 = class("Message")
slot1 = 1
slot2 = {}
slot3 = {
	"registerMessage",
	"unregisterMessage",
	"unregisterTarget"
}

function slot0.bind(slot0, slot1)
	uv5 = "cc"

	cc.setmethods(slot1, slot0, slot5)

	slot0.target_ = slot1
end

function slot0.unbind(slot0, slot1)
	uv4 = "cc"

	cc.unsetmethods(slot1, slot4)
	slot0:unregisterTarget()
end

function slot4(slot0, slot1, slot2)
	if type(slot1) ~= "table" then
		slot1 = {
			slot1
		}
	end

	for slot6, slot7 in ipairs(slot1) do
		uv8 = "type"

		if not slot8[slot7] then
			uv8 = "type"
			slot8[slot7] = {}
		end

		uv8 = "type"
		slot8[slot7][slot0] = slot2
	end

	return slot0
end

function slot0.registerMessage(slot0, slot1, slot2)
	uv3 = "target_"

	return slot3(slot0.target_, slot1, slot2)
end

function slot0.unregisterTarget(slot0)
	uv2 = "pairs"

	for slot4, slot5 in pairs(slot2) do
		if slot5[slot0.target_] then
			slot5[slot0.target_] = nil

			if itertools.isempty(slot5) then
				uv6 = "pairs"
				slot6[slot4] = nil
			end
		end
	end
end

function slot5(slot0, slot1)
	if type(slot1) ~= "table" then
		slot1 = {
			slot1
		}
	end

	for slot5, slot6 in ipairs(slot1) do
		uv7 = "type"

		if slot7[slot6] and slot7[slot0] then
			slot7[slot0] = nil

			if itertools.isempty(slot7) then
				uv8 = "type"
				slot8[slot6] = nil
			end
		end
	end
end

function slot0.unregisterMessage(slot0, slot1)
	uv2 = "target_"

	return slot2(slot0.target_, slot1)
end

function slot0.sendMessage(slot0, ...)
	uv1 = "pairs"

	if slot1[slot0] then
		uv2 = "pairs"

		for slot4, slot5 in pairs(slot2[slot0]) do
			if slot5(...) then
				break
			end
		end
	end
end

slot6 = {
	__index = slot6
}

function slot6.remove(slot0)
	uv1 = "key"

	return slot1(slot0.key, slot0.msgs)
end

function slot0.registerMessageListener()
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

function slot0.unregisterMessageListenerByKey(slot0)
	uv1 = "key"

	return slot1(slot0.key, slot0.msgs)
end

return slot0
