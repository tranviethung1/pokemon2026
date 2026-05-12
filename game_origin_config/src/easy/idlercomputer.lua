slot0 = type
slot1 = checkbool
slot2 = table.insert
slot3 = clone(idler)
globals.idlercomputer = slot3
slot3.__idlercomputer = true
slot3.__class = slot3
slot3.__index = slot3
slot3.__cname = "idlercomputer"
slot3.set = nil
slot3.modify = nil

function globals.isIdlerComputer(slot0)
	uv1 = "table"

	return slot1(slot0) == "table" and slot0.__idlercomputer == true
end

function slot3.new(slot0, slot1, slot2)
	slot4 = {
		working = false,
		listeners = {},
		tickets = slot5,
		__cid = slot5
	}
	uv5 = "setmetatable"
	uv5 = "setmetatable"
	slot3 = setmetatable(slot4, ({}).newid())
	uv4 = "setmetatable"

	slot4.placeNew(slot3, slot0, slot1, slot2)
	idlersystem.addIdler(slot3)

	return slot3
end

function slot3.placeNew(slot0, slot1, slot2, slot3)
	if slot1 then
		slot0.tickets[1] = slot1:addListener(function (slot0, slot1, slot2)
			uv3 = "changed_"
			uv4 = "oldval"
			slot3, slot4 = slot3(slot4, slot0)

			if slot3 then
				uv5 = "oldval"

				return slot5:changed_(slot4, true)
			end

			uv5 = "oldval"
			uv7 = "oldval"

			return slot5:changed_(slot7.oldval)
		end, slot3)
	end

	return slot0
end

function slot3.combine(slot0, slot1, slot2, slot3)
	uv4 = "new"
	slot4 = slot4.new()
	slot5 = {}
	slot6 = {}
	uv7 = "function"

	if slot7(slot1) == "function" then
		slot1 = {
			f = slot1
		}
	end

	for slot10, slot11 in ipairs(slot3) do
		slot5[slot10] = slot11:get_()
		slot6[slot10] = true
		slot4.tickets[slot10] = slot11:addListener(function ()
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
		end, true)
	end

	for slot10, slot11 in ipairs(slot3) do
		if slot0(slot5, slot6, slot10, #slot3) then
			if slot1 and slot1.f then
				slot5 = slot1.f(slot5, slot3)
			end

			slot12, slot4.oldval = slot2(slot4, unpack(slot5, 1, #slot3))

			if slot12 then
				-- Nothing
			end

			if slot1 and slot1.clearlast then
				slot5 = {}
			end

			slot6 = {}

			break
		end
	end

	return slot4
end

function slot3.deafen(slot0)
	for slot4, slot5 in pairs(slot0.tickets) do
		slot5:detach()
	end

	slot0.tickets = {}
end

function slot3.destroy(slot0)
	if slot0.listeners == nil then
		return
	end

	slot0.tickets = nil

	for slot5, slot6 in pairs(slot0.tickets) do
		slot6:detach()
	end

	return idler.destroy(slot0)
end

function slot3.anonyOnly(slot0, slot1, slot2)
	assert(slot1, "anonyOnly force give view param, check your code")
	idlersystem.addAnonymousOnlyIdler(slot0, slot1, slot2)

	return slot0
end
