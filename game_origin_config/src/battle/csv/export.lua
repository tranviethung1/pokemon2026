slot0 = nil
battleCsv.Model2CsvCls = {
	ObjectModel = battleCsv.CsvObject,
	MonsterModel = battleCsv.CsvObject,
	BossModel = battleCsv.CsvObject,
	ObjectExtraModel = battleCsv.CsvObject,
	SceneModel = battleCsv.CsvScene,
	SkillModel = battleCsv.CsvSkill,
	BuffSkillModel = battleCsv.CsvSkill,
	PassiveSkillModel = battleCsv.CsvSkill,
	BuffModel = battleCsv.CsvBuff
}
slot1 = {
	sumBuffOverlayByGroup = true,
	getDamageState = true,
	__newindex = true,
	new = true,
	__index = true,
	getDamageStateByTarget = true,
	newWithCache = true,
	force = true,
	level = true
}

function slot2(slot0, slot1)
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

function slot3(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0 == slot6 then
			return true
		end
	end

	return false
end

function slot4(slot0, slot1)
	return slot1 < slot0
end

function slot5(slot0, slot1)
	return slot0 < slot1
end

function slot6(slot0, slot1)
	return slot1 <= slot0
end

function slot7(slot0, slot1)
	return slot0 <= slot1
end

function slot8(slot0, slot1, slot2, slot3)
	if slot1 < slot0 then
		return slot2
	end

	return slot3
end

function slot9(slot0, slot1, slot2, slot3)
	if slot0 < slot1 then
		return slot2
	end

	return slot3
end

function slot10(slot0, slot1, slot2, slot3)
	if slot1 <= slot0 then
		return slot2
	end

	return slot3
end

function slot11(slot0, slot1, slot2, slot3)
	if slot0 <= slot1 then
		return slot2
	end

	return slot3
end

function slot12(slot0, slot1, slot2)
	if slot1 == 0 then
		return slot2
	end

	return slot0 / slot1
end

function slot13(slot0)
	if slot0 == nil or slot0 == false or slot0 == 0 then
		return 0
	end

	return 1
end

function slot14(slot0)
	if slot0 == nil or slot0 == false or slot0 == 0 then
		return false
	end

	return true
end

function slot15(slot0, slot1)
	return itertools.include(slot0, battle.CsvStrToMap[slot1 .. "Iter"])
end

function slot16(...)
	return {
		...
	}
end

function slot17(...)
	slot1 = {}

	for slot5, slot6 in pairs({
		...
	}) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot18(slot0, slot1)
	if slot0 and slot0.__valueTypeTable then
		return slot0:get(slot1)
	end

	return 0
end

function slot19()
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

function battleCsv.doFormula(slot0, slot1, slot2)
	if slot1.fillEnv then
		uv5 = "fillEnv"

		slot1:fillEnv(slot5(slot1))
	else
		uv5 = "fillEnv"

		setmetatable(slot1, slot5(slot1))
	end

	return eval.doFormula(slot0, slot1, slot2)
end

function battleCsv.makeFindEnv(slot0, slot1, slot2)
	slot3 = battlePlay.Gate.ForceNumber
	slot4 = {
		self = slot0,
		selectObj = slot1,
		skillSegType = slot2 and slot2.skillSegType,
		skillFixType = slot2 and slot2.skillFixType,
		force = slot1 and slot1.force or slot0.force,
		forceNumber = slot3,
		rowNumber = slot3 / 2,
		getRowAndColumn = battleEasy.getRowAndColumn,
		mirrorSeat = battleEasy.mirrorSeat,
		attackRangeExtension = battleEasy.attackRangeExtension,
		csvSelf = battleCsv.CsvObject.newWithCache(slot0),
		csvSelectObj = battleCsv.CsvObject.newWithCache(slot1),
		doFormula = eval.doFormula,
		getfenv = getfenv,
		dumps = dumps,
		trigger = slot2.trigger,
		addAttackRangeObjs = slot2.addAttackRangeObjs,
		secSelectObjs = slot2.secSelectObjs,
		extraTargets = slot2.extraTargets,
		ignoreReplaceData = slot2 and slot2.ignoreReplaceData,
		env = slot4
	}

	return slot4
end

function battleCsv.makeProtectedEnv(slot0, slot1, slot2)
	slot3 = slot0 and slot0.scene or scene and scene.scene or slot2 and slot2.scene

	assert(slot3, "no scene be contained in params")

	slot4 = {
		scene = battleCsv.CsvScene.newWithCache(slot3),
		env = slot4
	}

	if slot0 then
		slot4.self = battleCsv.CsvObject.newWithCache(slot0)
	end

	if slot1 then
		slot4.skill = battleCsv.CsvSkill.newWithCache(slot1)
		slot4.owner = slot4.self
	end

	if slot2 then
		slot4.buff = battleCsv.CsvBuff.newWithCache(slot2)
		slot4.caster = slot2.caster and slot2.caster == slot0 and slot4.self or battleCsv.CsvObject.newWithCache(slot2.caster)
		slot4.holder = battleCsv.CsvObject.newWithCache(slot2.holder)
		slot4.target = slot4.holder
		slot4.fromSkillLevel = slot2.fromSkillLevel
		slot4.buffCfgID = slot2.cfgId
	end

	slot5 = protectedEnv(slot4)
	uv8 = "scene"

	slot5:fillEnv(slot8(slot5), true)

	return slot5
end

function battleCsv.makeDamageProcessEnv(slot0, slot1, slot2, slot3)
	slot4 = slot0 and slot0.scene or slot1 and slot1.scene

	assert(slot4, "no scene be contained in params")

	slot5 = {
		arg = slot2.args,
		scene = battleCsv.CsvScene.newWithCache(slot4),
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
	slot5.setSign = functools.partial(function (slot0, slot1, slot2, slot3)
		for slot7, slot8 in ipairs(slot1) do
			if slot0.processId == slot8 then
				if slot3 then
					return slot3
				else
					return "run"
				end
			end
		end

		for slot7, slot8 in ipairs(slot2) do
			if slot0.processId == slot8 then
				return "jump"
			end
		end
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
		slot5.attacker = battleCsv.CsvObject.newWithCache(slot0)
	end

	if slot1 then
		slot5.target = battleCsv.CsvObject.newWithCache(slot1)
	end

	return slot5
end

function slot20(slot0, slot1, slot2)
	slot3 = rawget(slot0, slot2)

	if slot1[slot2] then
		if slot3 then
			assert(slot3.model == slot4, string.format("%s not same in protected, %s, %s", slot2, tostring(slot3.model), tostring(slot4)))

			return nil, slot4
		else
			if battleCsv.Model2CsvCls[tj.type(slot4)] then
				return slot5.newWithCache(slot4), slot4
			end

			return slot4, slot4
		end
	else
		return nil, slot3 and slot3.model
	end
end

function battleCsv.fillFuncEnv(slot0, slot1)
	slot1 = slot1 or {}
	uv3 = "self"
	slot3, slot4 = slot3(slot0, slot1, "self")
	slot1.self = nil

	if slot3 then
		-- Nothing
	end

	if slot4 and slot4.curAttackMeObj then
		slot2.attackMeObj = battleCsv.CsvObject.newWithCache(slot4.curAttackMeObj)
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
		slot2.caster = battleCsv.CsvObject.newWithCache(slot10.caster)
		slot2.holder = battleCsv.CsvObject.newWithCache(slot10.holder)
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

function battleCsv.makeEnv(slot0)
	slot0.self = nil
	slot0.skill = nil
	slot0.buff = nil

	return battleCsv.fillFuncEnv(battleCsv.makeProtectedEnv(slot0.self, slot0.skill, slot0.buff), slot0)
end
