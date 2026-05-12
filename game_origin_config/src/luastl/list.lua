slot0 = isRef
slot2 = class("CList", require("luastl.stlbase"))
globals.CList = slot2

function slot2.ctor(slot0)
	uv1 = "ctor"

	slot1.ctor(slot0)
	slot0:clear()
end

function slot2.clear(slot0)
	if slot0.m then
		for slot4, slot5 in pairs(slot0.m) do
			uv6 = "m"

			if slot6(slot5) then
				slot5:autorelease()
			end
		end
	end

	slot0.m = {}
	slot0.msize = 0
	slot0.counter = 0
	slot0.head = nil
	slot0.tail = nil
end

function slot2.push_back(slot0, slot1)
	uv2 = "retain"

	if slot2(slot1) then
		slot1:retain()
	end

	slot0.counter = slot0.counter + 1
	slot0.msize = slot0.msize + 1
	slot0.m[slot0.counter] = {
		prev = slot0.tail,
		data = slot1
	}

	if slot0.tail then
		slot0.m[slot0.tail].next = slot2
	end

	slot0.tail = slot2
	slot0.head = slot0.head or slot2
end

function slot2.pop_back(slot0)
	if slot0.tail == nil then
		return nil
	end

	uv3 = "tail"

	if slot3(slot0.m[slot0.tail].data) then
		slot2:autorelease()
	end

	slot0.msize = slot0.msize - 1
	slot0.tail = slot1.prev

	if slot0.tail == nil then
		slot0.head = nil
	else
		slot0.m[slot0.tail].next = nil
	end

	return slot2
end

function slot2.push_front(slot0, slot1)
	uv2 = "retain"

	if slot2(slot1) then
		slot1:retain()
	end

	slot0.counter = slot0.counter + 1
	slot0.msize = slot0.msize + 1
	slot0.m[slot0.counter] = {
		next = slot0.head,
		data = slot1
	}

	if slot0.head then
		slot0.m[slot0.head].prev = slot2
	end

	slot0.head = slot2
	slot0.tail = slot0.tail or slot2
end

function slot2.pop_front(slot0)
	if slot0.head == nil then
		return nil
	end

	uv3 = "head"

	if slot3(slot0.m[slot0.head].data) then
		slot2:autorelease()
	end

	slot0.msize = slot0.msize - 1
	slot0.head = slot1.next

	if slot0.head == nil then
		slot0.tail = nil
	else
		slot0.m[slot0.head].prev = nil
	end

	return slot2
end

function slot2.find(slot0, slot1)
	for slot5, slot6 in pairs(slot0.m) do
		if slot6.data == slot1 then
			return slot5
		end
	end
end

function slot2.index(slot0, slot1)
	return slot0.m[slot1] and slot2.data
end

function slot2.front(slot0)
	return slot0.m[slot0.head] and slot1.data
end

function slot2.back(slot0)
	return slot0.m[slot0.tail] and slot1.data
end

function slot2.size(slot0)
	return slot0.msize
end

function slot2.empty(slot0)
	return slot0.msize == 0
end

function slot2.insert(slot0, slot1, slot2)
	if slot0.m[slot1] == nil then
		return false
	end

	uv4 = "m"

	if slot4(slot2) then
		slot2:retain()
	end

	slot0.counter = slot0.counter + 1
	slot0.msize = slot0.msize + 1
	slot0.m[slot0.counter] = {
		prev = slot3.prev,
		next = slot1,
		data = slot2
	}

	if slot0.head == slot1 then
		slot0.head = slot4
	else
		slot0.m[slot3.prev].next = slot4
	end

	slot3.prev = slot4

	return true
end

function slot2.erase(slot0, slot1)
	if slot0.m[slot1] == nil then
		return
	end

	slot4 = nil
	slot0.m[slot1] = slot4
	uv4 = "m"

	if slot4(slot2.data) then
		slot3:autorelease()
	end

	slot0.msize = slot0.msize - 1

	if slot0.head == slot1 then
		slot0.head = slot2.next
	else
		slot0.m[slot2.prev].next = slot2.next
	end

	if slot0.tail == slot1 then
		slot0.tail = slot2.prev
	else
		slot0.m[slot2.next].prev = slot2.prev
	end

	return slot3
end

function slot2.assign(slot0, slot1)
	if type(slot1) ~= "table" then
		error("CList:assign need table")

		return
	end

	slot0:clear()

	for slot5, slot6 in ipairs(slot1) do
		uv7 = "type"

		if slot7(slot6) then
			slot6:retain()
		end

		slot0:push_back(slot6)
	end
end

function slot2.pairs(slot0)
	slot1 = slot0.head

	return function ()
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
end

return slot2
