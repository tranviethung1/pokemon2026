cc.loaded_packages = {}
slot0 = cc.loaded_packages

function cc.register(slot0, slot1)
	uv2 = "printInfo"
	slot2[slot0] = slot1

	printInfo("cc.register() - register module %s", slot0)
end

function cc.load(...)
	assert(#{
		...
	} > 0, "cc.load() - invalid package names")

	slot1 = {}

	for slot5, slot6 in ipairs(slot0) do
		slot7 = assert

		slot7(type(slot6) == "string", string.format("cc.load() - invalid package name \"%s\"", tostring(slot6)))

		uv7 = "assert"

		if not slot7[slot6] then
			slot7 = string.format("packages.%s.init", slot6)
			slot8 = require(slot7)
			slot9 = assert

			slot9(slot8, string.format("cc.load() - package class \"%s\" load failed", slot7))

			uv9 = "assert"
			slot9[slot6] = slot8

			if DEBUG > 1 then
				printInfo("cc.load() - load module \"packages.%s.init\"", slot6)
			end
		end

		uv8 = "assert"
		slot1[#slot1 + 1] = slot8[slot6]
	end

	return unpack(slot1)
end

slot1 = cc.load
slot2 = nil

function cc.bind(slot0, ...)
	assert(type(slot0) == "table" or slot1 == "userdata", string.format("cc.bind() - invalid target, expected is object, actual is %s", slot1))

	slot3 = assert

	slot3(#{
		...
	} > 0, "cc.bind() - package names expected")

	uv3 = "type"

	slot3(...)

	if not slot0.components_ then
		slot0.components_ = {}
	end

	for slot6, slot7 in ipairs(slot2) do
		assert(type(slot7) == "string" and slot7 ~= "", string.format("cc.bind() - invalid package name \"%s\"", slot7))

		if not slot0.components_[slot7] then
			uv8 = "assert"

			for slot12, slot13 in ipairs(slot8[slot7].DEPENDS or {}) do
				if not slot0.components_[slot13] then
					uv14 = "table"

					slot14(slot0, slot13)
				end
			end

			slot9 = slot8:create()
			slot0.components_[slot7] = slot9

			slot9:bind(slot0)
		end
	end

	return slot0
end

function cc.unbind(slot0, ...)
	if not slot0.components_ then
		return
	end

	assert(#{
		...
	} > 0, "cc.unbind() - invalid package names")

	for slot5, slot6 in ipairs(slot1) do
		assert(type(slot6) == "string" and slot6 ~= "", string.format("cc.unbind() - invalid package name \"%s\"", slot6))

		slot7 = slot0.components_[slot6]

		assert(slot7, string.format("cc.unbind() - component \"%s\" not found", tostring(slot6)))
		slot7:unbind(slot0)

		slot0.components_[slot6] = nil
	end

	return slot0
end

function cc.setmethods(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot2) do
		slot8 = slot1[slot7]

		slot0[slot7] = function ()
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
	end
end

function cc.unsetmethods(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot0[slot6] = nil
	end
end

function cc.components(slot0)
	return slot0.components_ or {}
end
