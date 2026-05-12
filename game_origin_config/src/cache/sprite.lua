slot0 = class("CSpriteCache")
slot1 = 0
slot2 = table.insert
slot3 = itertools

function slot0.ctor(slot0)
	slot0.autoRelease = {}
	slot0.lifeMap = {}
	slot0.all = CMap.new()
end

function slot0.insert()
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

function slot0.find(slot0, slot1)
	return slot0.all:find(slot1)
end

function slot0.erase(slot0, slot1, slot2)
	if slot0.all:erase(slot1) then
		if slot2 then
			slot2()
		end

		slot3:release():removeSelfToCache()
	end
end

function slot0.clear(slot0)
	uv0 = slot0
	slot0.autoRelease = {}
	slot0.lifeMap = {}

	for slot4, slot5 in slot0.all:pairs() do
		slot5:release()
	end

	slot0.all:clear()
end

function slot0.setLifeTime(slot0, slot1, slot2)
	if slot0.lifeMap[slot1] == nil then
		slot0.lifeMap[slot1] = {
			0,
			slot2
		}
	end

	slot3[2] = slot2
end

function slot0.update(slot0, slot1)
	uv2 = "isempty"

	if not slot2.isempty(slot0.autoRelease) then
		for slot5, slot6 in pairs(slot0.autoRelease) do
			if slot6 and slot0.all:erase(slot5) then
				if type(slot6) == "function" then
					slot6()
				end

				slot7:release():removeSelfToCache()
			end
		end

		slot0.autoRelease = {}
	end

	for slot5, slot6 in pairs(slot0.lifeMap) do
		slot6[1] = slot6[1] + slot1

		if slot6[2] <= slot6[1] then
			slot0.autoRelease[spriteID] = true
			slot0.lifeMap[slot5] = nil
		end
	end
end

return slot0
