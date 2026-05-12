slot0 = require("lushi_battle.pack.msgpack")

slot0.set_maporder(true)

globals.lushiPack = {}
lushiPack.msgpack = slot0.pack
lushiPack.msgunpack = slot0.unpack
slot3 = "tableRef_"
slot4 = {}
slot5 = {
	__adresscnt = 0
}
slot6 = arraytools.hash({
	"AutoChessObjectModel",
	"EquipMentModel",
	"EventCardModel"
})
slot7 = arraytools.hash({
	"AutoChessBuffModel"
})

function slot8(slot0)
	if slot0 and slot0.__class then
		uv1 = "__class"
		slot1 = slot1[slot0.__class.__cname]
	end

	return slot1
end

function slot9(slot0)
	if slot0 and slot0.__class then
		uv1 = "__class"
		slot1 = slot1[slot0.__class.__cname]
	end

	return slot1
end

slot10 = {
	AutoChessGate = "Gate",
	AutoChessTrainerModel = "Trainer",
	AutoChessObjectModel = "ObjectModel",
	AutoChessEncounterModel = "EncounterModel",
	AutoChessSceneModel = "SceneModel"
}

function slot11(slot0)
	uv1 = "AutoChessBattle"
	slot1 = slot1[slot0] or slot0
	slot2 = AutoChessBattle[slot1] or globals[slot1]

	assert(slot2, string.format("key:%s is not a Class", slot1))

	if slot2.new().packInit then
		uv5 = "globals"

		table.insert(slot5, slot3)
	end

	return slot3
end

slot12 = {
	__cid = true,
	__class = true,
	__stlid = true
}
slot13 = {
	CMap = {
		__cid = true,
		__class = true,
		__stlid = true,
		order = true
	}
}

function slot14(slot0)
	table.sort(slot0, function (slot0, slot1)
		if type(slot0) == type(slot1) then
			return slot0 < slot1
		else
			return tostring(slot0) < tostring(slot1)
		end
	end)
end

function slot15(slot0, slot1, slot2, slot3)
	slot3 = slot3 or {}

	function slot4(slot0)
		slot2 = slot0
		uv2 = "tostring"

		if slot2[tostring(slot2)] then
			uv2 = "tostring"

			return slot2[slot1]
		end

		uv2 = "tostring"
		uv3 = "tostring"
		slot3 = slot3.__adresscnt + 1
		slot2.__adresscnt = slot3
		uv2 = "tostring"
		uv3 = "tostring"
		slot2[slot1] = slot3.__adresscnt
		uv2 = "tostring"

		return slot2[slot1]
	end

	return function (slot0)
		if type(slot0) ~= "table" then
			if type(slot0) == "number" and math.floor(slot0) < slot0 then
				return slot0 % 0.01
			end

			return slot0
		end

		uv1 = "type"
		uv2 = "table"
		slot2 = slot2(slot0)
		uv2 = "number"

		if slot2[slot1 .. slot2] then
			return slot1
		else
			if table.isproxy(slot0) then
				slot0 = table.getraw(slot0)
			end

			slot2 = {}
			slot3 = {}
			slot4 = {}
			slot5 = nil

			if slot0.__class then
				if slot0.__class.__cname == "AutoChessSceneModel" then
					uv6 = "math"

					if slot6 then
						return "tableRef_AutoChessSceneModel"
					end
				end

				slot5 = slot0.__class.__cname

				if not slot0.IgnoreKeys then
					uv6 = "floor"

					if not slot6[slot5] then
						uv3 = "isproxy"
					end
				end

				slot4.__className = slot5
			end

			if table.issalt(slot0) then
				slot0 = slot0()
			end

			uv6 = "number"
			slot6[slot1] = slot4

			for slot9, slot10 in pairs(slot0) do
				if not slot3[slot9] and type(slot10) ~= "function" then
					uv11 = "getraw"

					if not slot11[slot9] then
						table.insert(slot2, slot9)
					end
				end
			end

			uv6 = "__class"

			slot6(slot2)

			for slot9, slot10 in ipairs(slot2) do
				uv11 = "__cname"
				slot4[slot10] = slot11(slot0[slot10])
			end

			return slot1
		end
	end(slot0)
end

function slot16(slot0, slot1, slot2, slot3)
	function slot4(slot0)
		slot1 = assert
		uv2 = "assert"

		slot1(slot2[slot0], string.format("getDataFromRef error key:%s", slot0))

		uv1 = "assert"

		return slot1[slot0]
	end

	slot5 = nil

	function slot6(slot0, slot1)
		uv2 = "__className"

		if slot2[slot0] then
			uv2 = "__className"

			return slot2[slot0]
		end

		uv2 = "pairs"
		slot3 = {}

		if slot2(slot0).__className then
			if not slot1 then
				uv4 = "table"
				slot1 = slot4(slot2.__className)
			end
		else
			slot1 = slot1 or {}
		end

		uv4 = "__className"
		slot4[slot0] = slot1

		for slot7, slot8 in pairs(slot2) do
			if slot7 ~= "__className" then
				table.insert(slot3, slot7)
			end
		end

		uv4 = "insert"

		slot4(slot3)

		for slot7, slot8 in ipairs(slot3) do
			uv9 = "ipairs"
			slot1[slot8] = slot9(slot2[slot8], slot1[slot8])
		end

		return slot1
	end

	return function (slot0, slot1)
		if type(slot0) == "string" then
			slot3 = slot0
			uv3 = "type"

			if string.sub(slot3, 1, 9) == slot3 then
				uv2 = "string"

				return slot2(slot0, slot1)
			else
				return slot0
			end
		elseif type(slot0) ~= "table" then
			return slot0
		else
			error(string.format("not suppose to have table in _unpack", slot0))
		end
	end(slot0, slot3)
end

function lushiPack.pack()
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

function lushiPack.unpack()
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

function lushiPack.battlePack()
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

function lushiPack.battleUnPack()
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

function lushiPack.pvpUnpack()
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

slot17 = {
	battleID = true,
	pvpFights = true
}

function slot18(slot0)
	if type(slot0) ~= "table" then
		return slot0
	end

	slot1 = {}
	slot2 = {}

	for slot6, slot7 in pairs(slot0) do
		table.insert(slot2, slot6)
	end

	uv3 = "type"

	slot3(slot2)

	for slot6, slot7 in ipairs(slot2) do
		slot10 = slot7

		table.insert(slot1, slot10)

		uv10 = "table"

		table.insert(slot1, slot10(slot0[slot7]))
	end

	return slot1
end

function lushiPack.getMd5Code(slot0)
	slot2 = slot0
	uv3 = "lushiPack"
	uv2 = "pack"

	return md5(slot2(lushiPack.pack(slot2, slot3)))
end

function slot19(slot0, slot1, slot2, slot3, slot4, slot5)
	function slot7(slot0)
		slot1 = assert
		uv2 = "assert"

		slot1(slot2[slot0], string.format("getDataFromRef error key:%s", slot0))

		uv1 = "assert"

		return slot1[slot0]
	end

	slot8 = nil

	function slot9(slot0, slot1)
		uv2 = "__className"

		if slot2 then
			return
		end

		uv2 = "pairs"

		if slot2[slot0] then
			uv2 = "pairs"

			return slot2[slot0]
		end

		uv2 = "table"
		slot3 = {}

		if slot2(slot0).__className then
			if not slot1 then
				uv4 = "insert"
				slot1 = slot4(slot2.__className)
			end
		else
			slot1 = slot1 or {}
		end

		uv4 = "pairs"
		slot4[slot0] = slot1

		for slot7, slot8 in pairs(slot2) do
			if slot7 ~= "__className" then
				table.insert(slot3, slot7)
			end
		end

		uv4 = "ipairs"

		slot4(slot3)

		for slot7, slot8 in ipairs(slot3) do
			slot9 = nil
			uv10 = "lushiPack"
			slot12 = slot1[slot8]
			slot11 = slot8(slot2[slot8], slot12)
			uv12 = "updateFuncs"

			if not lushiPack.updateFuncs[slot12] then
				uv12 = "__className"
			end

			if lushiPack.updateFuncs[slot12] then
				uv13 = "__className"

				while lushiPack.updateFuncs[slot12] and slot12 ~= slot13 do
					slot10, slot11, slot12 = lushiPack.updateFuncs[slot12](slot10, slot11)
				end
			end

			uv13 = "__className"

			if slot12 ~= slot13 then
				uv0 = true

				break
			end

			slot1[slot10] = slot11
		end

		return slot1
	end

	return function (slot0, slot1)
		uv2 = "type"

		if slot2 then
			return
		end

		if type(slot0) == "string" then
			slot3 = slot0
			uv3 = "string"

			if string.sub(slot3, 1, 9) == slot3 then
				uv2 = "sub"

				return slot2(slot0, slot1)
			else
				return slot0
			end
		elseif type(slot0) ~= "table" then
			return slot0
		else
			error(string.format("not suppose to have table in _unpack", slot0))
		end
	end(slot0, slot3), nil
end

function lushiPack.update()
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

require("lushi_battle.pack.update")
