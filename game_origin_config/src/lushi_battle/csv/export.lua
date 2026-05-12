slot0, slot1 = nil
AutoChessCsv.Model2CsvCls = {
	AutoChessObjectModel = AutoChessCsv.CsvObject,
	EquipMentModel = AutoChessCsv.CsvObject,
	EventCardModel = AutoChessCsv.CsvObject,
	AutoChessSceneModel = AutoChessCsv.CsvScene,
	AutoChessBuffModel = AutoChessCsv.CsvBuff,
	AutoChessTrainerModel = AutoChessCsv.CsvTrainer
}
slot2 = {
	sumBuffOverlayByGroup = true,
	getDamageState = true,
	__index = true,
	new = true,
	team = true,
	getDamageStateByTarget = true,
	__newindex = true,
	level = true
}

function slot3(slot0)
	if AutoChessCsv.Model2CsvCls[tj.type(slot0)] then
		return slot1.new(slot0), slot0
	end

	return slot0, slot0
end

function slot4(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		uv7 = "pairs"

		if not slot7[slot5] and type(slot6) == "function" then
			slot7 = assert
			uv8 = "type"

			slot7(slot8[slot5] == nil, string.format("%s `%s` already in protected env", type(slot1), slot5))

			uv7 = "type"

			slot7[slot5] = function ()
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
end

function slot5(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		uv7 = "pairs"

		if not slot7[slot5] and type(slot6) == "function" then
			slot7 = assert
			uv8 = "type"

			slot7(slot8[slot5] == nil, string.format("%s `%s` already in protected env", type(slot1), slot5))

			uv7 = "type"

			slot7[slot5] = function ()
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
end

function slot6(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0 == slot6 then
			return true
		end
	end

	return false
end

function slot7(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		for slot10, slot11 in pairs(slot1) do
			if slot6 == slot11 then
				return true
			end
		end
	end

	return false
end

function slot8(slot0, slot1)
	return slot1 < slot0
end

function slot9(slot0, slot1)
	return slot0 < slot1
end

function slot10(slot0, slot1)
	return slot1 <= slot0
end

function slot11(slot0, slot1)
	return slot0 <= slot1
end

function slot12(slot0, slot1, slot2, slot3)
	if slot1 < slot0 then
		return slot2
	end

	return slot3
end

function slot13(slot0, slot1, slot2, slot3)
	if slot0 < slot1 then
		return slot2
	end

	return slot3
end

function slot14(slot0, slot1, slot2, slot3)
	if slot1 <= slot0 then
		return slot2
	end

	return slot3
end

function slot15(slot0, slot1, slot2, slot3)
	if slot0 <= slot1 then
		return slot2
	end

	return slot3
end

function slot16(slot0, slot1, slot2)
	if slot1 == 0 then
		return slot2
	end

	return slot0 / slot1
end

function slot17(slot0)
	if slot0 == nil or slot0 == false or slot0 == 0 then
		return 0
	end

	return 1
end

function slot18(slot0)
	if slot0 == nil or slot0 == false or slot0 == 0 then
		return false
	end

	return true
end

function slot19(...)
	return {
		...
	}
end

function slot20(...)
	slot1 = {}

	for slot5, slot6 in pairs({
		...
	}) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot21(slot0, slot1)
	if slot0 and slot0.__valueTypeTable then
		return slot0:get(slot1)
	end

	return 0
end

function slot22(slot0, slot1)
	if (slot1 or 1) < 1 then
		return {}
	end

	if table.length(slot0) <= slot1 then
		return table.unpack(slot0)
	end

	if slot1 == 1 then
		return slot0[ymrand.random(1, table.length(slot0))]
	end

	for slot5 = 0, table.length(slot0) - slot1 - 1 do
		slot6 = table.length(slot0)
		slot0[ymrand.random(1, slot6)] = slot0[slot6]

		arraytools.pop(slot0)
	end

	return table.unpack(slot0)
end

function slot23()
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

function AutoChessCsv.doFormula(slot0, slot1, slot2)
	if slot1.fillEnv then
		uv5 = "fillEnv"

		slot1:fillEnv(slot5(slot1))
	else
		uv5 = "fillEnv"

		setmetatable(slot1, slot5(slot1))
	end

	return eval.doFormula(slot0, slot1, slot2)
end

function AutoChessCsv.makeFindEnv(slot0, slot1, slot2)
	slot3 = battlePlay.Gate.ForceNumber
	slot0 = slot0 or slot1
	slot4 = {
		self = slot0,
		selectObj = slot1,
		skillSegType = slot2 and slot2.skillSegType,
		skillFixType = slot2 and slot2.skillFixType,
		team = slot1 and slot1.team or slot0.team,
		forceNumber = slot3,
		rowNumber = slot5,
		csvSelf = slot5,
		csvSelectObj = slot5(slot1),
		doFormula = eval.doFormula,
		getfenv = getfenv,
		dumps = dumps,
		trigger = slot2.trigger
	}
	uv5 = "battlePlay"
	slot5 = slot3 / 2(slot0)
	uv5 = "battlePlay"
	slot4.env = slot4

	return slot4
end

function AutoChessCsv.makeProtectedEnv(slot0, slot1, slot2)
	slot3 = slot0 and slot0.scene or scene and scene.scene or slot2 and slot2.scene

	assert(slot3, "no scene be contained in params")

	slot4 = {
		scene = AutoChessCsv.CsvScene.new(slot3),
		env = slot4
	}

	if slot0 then
		uv5 = "scene"
		slot5 = slot5(slot0)
		slot4.self = slot5
		uv5 = "scene"
		slot4.selfTrainer = slot5(slot0.scene.trainer[slot0.team]) or AutoChessCsv.NilTrainer
	end

	if slot2 then
		slot4.self = slot4.self or AutoChessCsv.NilObject
		slot4.buff = AutoChessCsv.CsvBuff.new(slot2)

		if not slot2.caster or slot2.caster ~= slot0 or not slot4.self then
			if slot2.caster then
				uv5 = "scene"

				if not slot5(slot2.caster) then
					slot5 = AutoChessCsv.NilObject
				end
			end
		end

		slot4.caster = slot5
		uv5 = "scene"
		slot4.holder = slot5(slot2.holder)
		slot4.target = slot4.holder
		slot4.fromSkillLevel = slot2.fromSkillLevel

		if not slot4.selfTrainer then
			if slot2.caster then
				uv5 = "scene"

				if not slot5(slot2.caster.scene.trainer[slot2.caster.team]) then
					slot5 = AutoChessCsv.NilTrainer
				end
			end

			slot4.selfTrainer = slot5
		end
	end

	slot5 = protectedEnv(slot4)
	uv8 = "assert"

	slot5:fillEnv(slot8(slot5), true)

	return slot5
end

function AutoChessCsv.makeDamageProcessEnv(slot0, slot1, slot2, slot3)
	slot4 = slot0 and slot0.scene or slot1 and slot1.scene

	assert(slot4, "no scene be contained in params")

	slot5 = {
		arg = slot2.args,
		scene = AutoChessCsv.CsvScene.new(slot4),
		processId = slot2.id,
		env = slot5,
		setBaseAttr = ObjectAttrs.setBaseAttr,
		addBaseAttr = ObjectAttrs.addBaseAttr,
		updateMaxBaseAttr = ObjectAttrs.updateMaxBaseAttr,
		isAttr = functools.partial(function (slot0, slot1)
			return slot0[slot1] and true or false
		end, ObjectAttrs.AttrsTable)
	}
	slot6 = {
		[slot11] = 0
	}
	slot7 = nil

	for slot11, slot12 in pairs(slot3) do
		if not ObjectAttrs.AttrsTable[slot11] then
			slot5[slot11] = slot12
		else
			slot5[slot11] = function (slot0)
				uv2 = "final"

				return slot0.final[slot2]
			end
		end
	end

	slot5.base = table.salttable(slot6)
	slot5.base2 = table.salttable(slot6)
	slot5.buff = table.salttable(slot6)
	slot5.final = table.salttable(slot3)
	slot5.setValue = functools.partial(function (slot0, slot1, slot2)
		for slot6, slot7 in ipairs(slot1) do
			if slot0.isAttr(slot7) then
				slot0:setBaseAttr(slot7, slot2[slot6])
			else
				slot0[slot7] = slot2[slot6]
			end
		end

		return slot0
	end, slot5)
	slot5.updateMaxValue = functools.partial(function (slot0, slot1, slot2)
		for slot6, slot7 in ipairs(slot1) do
			if slot0.isAttr(slot7) then
				slot0:updateMaxBaseAttr(slot7, slot2[slot6])
			else
				slot0["G_" .. slot7] = math.max(slot0["G_" .. slot7] or 0, slot2[slot6])
			end
		end

		return slot0
	end, slot5)

	if slot0 then
		uv8 = "scene"
		slot5.attacker = slot8(slot0)
	end

	if slot1 then
		uv8 = "scene"
		slot5.target = slot8(slot1)
	end

	return slot5
end

function slot25(slot0, slot1, slot2)
	slot3 = rawget(slot0, slot2)

	if slot1[slot2] then
		if slot3 then
			assert(slot3.model == slot4, string.format("%s not same in protected, %s, %s", slot2, tostring(slot3.model), tostring(slot4)))

			return nil, slot4
		else
			uv5 = "rawget"

			return slot5(slot4)
		end
	else
		return nil, slot3 and slot3.model
	end
end

function AutoChessCsv.fillFuncEnv(slot0, slot1)
	slot1 = slot1 or {}
	uv3 = "self"
	slot3, slot4 = slot3(slot0, slot1, "self")
	slot1.self = nil

	if slot3 then
		-- Nothing
	end

	if slot4 and slot4.curAttackMeObj then
		uv5 = "curAttackMeObj"
		slot2.attackMeObj = slot5(slot4.curAttackMeObj)
	end

	uv5 = "self"
	slot5, slot6 = slot5(slot0, slot1, "skill")
	slot1.skill = nil

	if slot5 then
		slot2.skill = slot5
		slot2.owner = slot0.obj
	end

	slot7 = slot6 and slot6:getLevel() or 1
	uv7 = "self"
	slot9 = nil
	slot1.target = slot9
	uv9 = "self"
	slot9, slot10 = slot9(slot0, slot1, "buff")
	slot1.buff = nil

	if slot9 then
		slot2.buff = slot9
		uv11 = "curAttackMeObj"
		slot11 = slot11(slot10.caster)
		slot2.caster = slot11
		uv11 = "curAttackMeObj"
		slot2.holder = slot11(slot10.holder)
		slot2.target = slot2.target or slot2.holder
		slot2.fromSkillLevel = slot10.fromSkillLevel
	end

	for slot14, slot15 in pairs(slot1) do
		uv16 = "self"
		slot1[slot14] = slot16(slot0, slot1, slot14)
	end

	for slot14, slot15 in pairs({
		self = slot3,
		skillLevel = slot7,
		target = slot7(slot0, slot1, "target")
	}) do
		assert(slot1[slot14] == nil, string.format("`%s` already in args", slot14))

		slot1[slot14] = slot15
	end

	return slot0:fillEnvInFront(slot1)
end

function AutoChessCsv.makeEnv(slot0)
	slot0.self = nil
	slot0.skill = nil
	slot0.buff = nil

	return AutoChessCsv.fillFuncEnv(AutoChessCsv.makeProtectedEnv(slot0.self, slot0.skill, slot0.buff), slot0)
end

function AutoChessCsv.makeCardInfoEnv(slot0)
	slot1 = slot0.scene

	assert(slot1, "no scene be contained in params")

	slot2 = {
		scene = slot3,
		env = slot2
	}
	uv3 = "scene"
	slot3 = AutoChessCsv.CsvScene.new(slot1)(slot0)
	slot2.self = slot3
	uv3 = "scene"
	slot2.selfTrainer = slot3(slot0.scene.trainer[slot0.team]) or AutoChessCsv.NilTrainer
	slot3 = protectedEnv(slot2)
	getmetatable(slot3).ymrand = nil
	uv7 = "assert"

	slot3:fillEnv(slot7(slot3), true)

	return slot3
end
