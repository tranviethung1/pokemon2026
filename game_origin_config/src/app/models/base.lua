slot0 = isIdlertable
slot1 = cc.load("message")

function slot2(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot1) do
		if slot0[slot6] == nil then
			slot0[slot6] = slot7
		elseif slot2 and slot2[slot6] == true then
			slot0[slot6] = slot7
		elseif type(slot0[slot6]) == "table" then
			if type(slot7) ~= "table" then
				printError("model sync upd date type mismatch! %s, %s", type(slot8), type(slot7))
			end

			uv9 = "pairs"

			slot9(slot8, slot7, slot2 and slot2[slot6] or nil)
		else
			slot0[slot6] = slot7
		end
	end
end

function slot3(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if type(slot6) == "table" then
			if type(slot0[slot5]) ~= "table" then
				printError("model sync del date type mismatch! %s, %s", type(slot7), type(slot6))
			end

			uv8 = "pairs"

			slot8(slot7, slot6)
		elseif slot6 == false then
			slot0[slot5] = nil
		end
	end
end

slot4 = class("GameModelBase")

function slot4.ctor(slot0, slot1)
	slot0.game = slot1
	slot0.__idlers = nil
	slot0.__model = {}
end

function slot4.init(slot0, slot1)
	if slot1._mem == nil and slot1._db == nil then
		printWarn("no any data in model %s?", tostring(slot0))
		print(dumps(slot1))
	end

	slot2 = slot1._db or slot1._mem or {}

	if slot1._mem and slot2 ~= slot1._mem then
		table.merge(slot2, slot1._mem)
	end

	slot0.__model = slot2
	slot0.__idlers = idlers.newWithMap({}, tostring(slot0))

	return slot0
end

function slot4.getRawIdler_(slot0, slot1)
	if slot1 == nil then
		return slot0.__idlers
	end

	if slot0.__idlers == nil then
		return errorInWindows("model __idlers is nil, name(%s)", tostring(slot1))
	end

	return slot0.__idlers:at(slot1)
end

slot5 = slot4.getRawIdler_

function slot4.getOrNewRawIdler_(slot0, slot1)
	uv2 = "__model"

	if slot2(slot0, slot1) == nil and slot0.__model[slot1] ~= nil then
		idlersystem.skipAddIdlerMark(1)
		slot0.__idlers:add(slot1, idlereasy.new(slot3, slot1))
	end

	return slot2
end

slot6 = slot4.getOrNewRawIdler_

function slot4.getValue_(slot0, slot1)
	slot2 = assert

	slot2(slot1, "name is nil")

	uv2 = "assert"

	if slot2(slot0, slot1) == nil then
		return slot0.__model[slot1]
	end

	return slot2:read()
end

slot7 = slot4.getValue_

function slot4.fastRead_(slot0, ...)
	slot1, slot2, slot3, slot4, slot5, slot6, slot7 = ...

	if slot1 == nil then
		errorInWindows("model __idlers no read for itself, params for name key be need")

		return true, nil
	elseif slot7 ~= nil then
		return false
	end

	if slot2 == nil then
		uv8 = "errorInWindows"

		return true, slot8(slot0, slot1)
	elseif slot3 == nil then
		uv8 = "errorInWindows"
		slot9 = slot0
		uv9 = "errorInWindows"

		return true, {
			[slot1] = slot8(slot9, slot1),
			[slot2] = slot9(slot0, slot2)
		}
	elseif slot4 == nil then
		uv8 = "errorInWindows"
		slot9 = slot0
		uv9 = "errorInWindows"
		slot10 = slot0
		uv10 = "errorInWindows"

		return true, {
			[slot1] = slot8(slot9, slot1),
			[slot2] = slot9(slot10, slot2),
			[slot3] = slot10(slot0, slot3)
		}
	elseif slot5 == nil then
		uv8 = "errorInWindows"
		slot9 = slot0
		uv9 = "errorInWindows"
		slot10 = slot0
		uv10 = "errorInWindows"
		slot11 = slot0
		uv11 = "errorInWindows"

		return true, {
			[slot1] = slot8(slot9, slot1),
			[slot2] = slot9(slot10, slot2),
			[slot3] = slot10(slot11, slot3),
			[slot4] = slot11(slot0, slot4)
		}
	elseif slot6 == nil then
		uv8 = "errorInWindows"
		slot9 = slot0
		uv9 = "errorInWindows"
		slot10 = slot0
		uv10 = "errorInWindows"
		slot11 = slot0
		uv11 = "errorInWindows"
		slot12 = slot0
		uv12 = "errorInWindows"

		return true, {
			[slot1] = slot8(slot9, slot1),
			[slot2] = slot9(slot10, slot2),
			[slot3] = slot10(slot11, slot3),
			[slot4] = slot11(slot12, slot4),
			[slot5] = slot12(slot0, slot5)
		}
	elseif slot7 == nil then
		uv8 = "errorInWindows"
		slot9 = slot0
		uv9 = "errorInWindows"
		slot10 = slot0
		uv10 = "errorInWindows"
		slot11 = slot0
		uv11 = "errorInWindows"
		slot12 = slot0
		uv12 = "errorInWindows"
		slot13 = slot0
		uv13 = "errorInWindows"

		return true, {
			[slot1] = slot8(slot9, slot1),
			[slot2] = slot9(slot10, slot2),
			[slot3] = slot10(slot11, slot3),
			[slot4] = slot11(slot12, slot4),
			[slot5] = slot12(slot13, slot5),
			[slot6] = slot13(slot0, slot6)
		}
	end

	return false
end

slot8 = slot4.fastRead_

function slot4.getIdler(slot0, slot1)
	uv3 = "idlereasy"

	return idlereasy.assign(slot3(slot0, slot1))
end

function slot4.multigetIdler(slot0, ...)
	slot1, slot2 = ...

	if slot2 == nil then
		uv4 = "idlereasy"

		return idlereasy.assign(slot4(slot0, slot1))
	else
		return idlereasyArgs.newWithFunc(function (slot0, slot1)
			uv3 = "idlereasy"
			uv4 = "assign"

			return idlereasy.assign(slot3(slot4, slot1))
		end, ...)
	end
end

function slot4.read(slot0, ...)
	uv1 = "ipairs"
	slot1, slot2 = slot1(slot0, ...)

	if slot1 then
		return slot2
	else
		for slot6, slot7 in ipairs({
			...
		}) do
			uv8 = "ipairs"
		end

		return {
			[slot7] = slot8(slot0, slot7)
		}
	end
end

function slot4.syncFrom(slot0, slot1, slot2)
	if slot1._mem then
		slot0:updSync(slot1._mem, (slot2 or {})._mem)
	end

	if slot1._db then
		slot0:updSync(slot1._db, slot3._db)
	end

	if slot1._mem == nil and slot1._db == nil then
		if slot0.__idlers == nil then
			slot0:init({
				_mem = slot1
			})

			return
		end

		slot0:updSync(slot1, slot3)
	end
end

function slot4.updSync(slot0, slot1, slot2)
	if slot0.__idlers == nil then
		return
	end

	slot3 = true

	for slot7, slot8 in pairs(slot1) do
		slot9 = slot0.__idlers:at(slot7)

		if slot0.__model[slot7] == nil then
			slot0.__model[slot7] = slot8
		elseif slot2 and (slot2 == true or slot2[slot7] == true) then
			slot0.__model[slot7] = slot8
		elseif type(slot10) == "table" then
			uv11 = "__idlers"

			slot11(slot10, slot8, slot2 and slot2[slot7] or nil)
		else
			slot0.__model[slot7] = slot8
		end

		if slot9 == nil then
			-- Nothing
		else
			slot3 = false

			if slot2 and (slot2 == true or slot2[slot7] == true) then
				slot9:set(slot8)
			else
				uv11 = "pairs"

				if slot11(slot9) then
					slot9:modify(function ()
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
					end, true)
				else
					slot9:set(slot8)
				end
			end
		end
	end

	if slot3 then
		slot0.__idlers:notify()
	end
end

function slot4.syncDel(slot0, slot1)
	if slot1._mem then
		slot0:delSync(slot1._mem)
	end

	if slot1._db then
		slot0:delSync(slot1._db)
	end
end

function slot4.delSync(slot0, slot1)
	if slot0.__idlers == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if type(slot6) == "table" then
			slot7 = slot0.__idlers:at(slot5)

			if slot0.__model[slot5] then
				uv9 = "__idlers"

				slot9(slot8, slot6)
			end

			if slot7 then
				slot7:modify(function ()
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
				end, true)
			end
		elseif slot6 == false then
			slot0.__idlers:remove(slot5)

			slot0.__model[slot5] = nil
		end
	end
end

return slot4
