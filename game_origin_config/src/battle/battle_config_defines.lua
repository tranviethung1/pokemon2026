function slot1(slot0, slot1)
	if device.platform == "windows" then
		globals[slot0] = csvReadOnlyInWindows(slot1, slot0)

		printDebug("battle_config_defines - proxy index %s", slot0)
	end
end

function slot2(slot0, slot1)
	uv3 = "table"

	table.insert(slot3, {
		name = slot0,
		init = function ()
			uv0 = "globals"

			if slot0 == nil then
				uv1 = "itertools"

				if globals[slot1] then
					uv2 = "itertools"
					slot0 = itertools.size(globals[slot2])
				end

				return
			end

			uv1 = "itertools"

			if globals[slot1] == nil then
				slot0 = {}
				slot1 = globals
				uv2 = "itertools"
				slot1[slot2] = slot0
				uv1 = "globals"

				slot1(slot0)

				uv1 = "itertools"

				if slot1 ~= "gFormulaConst" then
					uv1 = "size"
					uv2 = "itertools"

					slot1(slot2, slot0)
				end
			end
		end
	})
end

slot2("gMonsterCsv")
slot2("gSceneDemonCorrectCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.scene_demon_correct) do
		if slot0[slot5.index] == nil then
			slot0[slot5.index] = {}
		end

		slot0[slot5.index][slot5.wave] = slot5
	end
end)
slot2("gGameEndSpeRuleCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.game_end_special_rule) do
		if slot0[slot5.markID] == nil then
			slot0[slot5.markID] = {}
		end

		slot0[slot5.markID] = slot5
	end
end)
slot2("gProcessEventCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.skill_process) do
		if slot5.effectEventID then
			slot0[slot4] = csv.effect_event[slot5.effectEventID]
		end
	end
end)
slot2("gEffectByEventCsv")
slot2("gEffectOptionCsv")
slot2("gFormulaConst", function (slot0)
	slot1 = {
		[slot6.key] = slot6.value
	}

	for slot5, slot6 in csvPairs(csv.base_attribute.formula_const) do
		if #slot6.key > 0 then
			-- Nothing
		end
	end

	function slot2(slot0)
		uv1 = "assert"
		slot1 = slot1[slot0]

		assert(slot1, "no formula const " .. slot0)

		if tonumber(slot1) then
			return slot2
		end

		if cache.createFormula(slot1) == nil then
			errorInWindows("evalData key:%s, s:%s", tostring(slot0), tostring(slot1))
		end

		return slot3()
	end

	setmetatable(slot0, {
		__index = function (slot0, slot1)
			if slot1 == "__proxy" or slot1 == "__immutable" then
				return
			end

			if #string.split(slot1, "_") == 1 then
				uv3 = "__proxy"

				if type(slot3(slot2[1])) ~= "table" then
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

			slot3 = slot2[#slot2] == "oc"
			slot4 = {}

			for slot8, slot9 in ipairs(slot2) do
				if slot9 == "oc" then
					break
				end

				uv12 = "__proxy"

				arraytools.merge_two_inplace(slot4, slot12(slot9))
			end

			function slot5()
				uv0 = "unpack"

				if slot0 then
					uv1 = "unpack"

					return unpack(slot1)
				else
					uv0 = "unpack"

					return slot0
				end
			end

			uv7 = "__immutable"

			rawset(slot7, slot1, slot5)

			return slot5
		end,
		__newindex = function (slot0, slot1, slot2)
			error("could not write in here " .. slot1)
		end
	})
end)

slot3 = nil

function slot4()
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

slot2("gBuffGroupRelationCsv", function (slot0)
	for slot4, slot5 in csvPairs(csv.buff_group_relation) do
		slot6 = {}

		for slot10, slot11 in ipairs(slot5.immuneGroup) do
			uv14 = "csvPairs"
			slot6[#slot6 + 1] = arraytools.hash(slot14(slot11))
		end

		slot7 = {}

		for slot11, slot12 in ipairs(slot5.dispelGroup) do
			uv15 = "csvPairs"
			slot7[#slot7 + 1] = arraytools.hash(slot15(slot12))
		end

		slot8 = {}

		for slot12, slot13 in ipairs(slot5.powerGroup) do
			uv16 = "csvPairs"
			slot8[#slot8 + 1] = arraytools.hash(slot16(slot13))
		end

		slot9 = {}

		for slot13, slot14 in ipairs(slot5.immuneFlag) do
			uv17 = "csvPairs"
			slot9[#slot9 + 1] = arraytools.hash(slot17(slot14))
		end

		slot10 = {}

		for slot14, slot15 in ipairs(slot5.dispelFlag) do
			uv18 = "csvPairs"
			slot10[#slot10 + 1] = arraytools.hash(slot18(slot15))
		end

		slot11 = {}

		for slot15, slot16 in ipairs(slot5.powerFlag) do
			uv19 = "csvPairs"
			slot11[#slot11 + 1] = arraytools.hash(slot19(slot16))
		end

		slot0[slot4] = {
			immuneGroup = slot6,
			dispelGroup = slot7,
			powerGroup = slot8,
			immuneFlag = slot9,
			dispelFlag = slot10,
			powerFlag = slot11,
			immuneEffect = slot5.immuneEffect
		}
	end
end)
slot2("gBuffEffect", function (slot0)
	for slot4, slot5 in csvPairs(csv.buff_effect) do
		slot0[slot5.easyEffectFunc] = slot5
	end
end)
slot2("gSceneAttrCorrect", function (slot0)
	for slot4, slot5 in csvPairs(csv.base_attribute.scene_attr_correct) do
		slot0[slot5.sceneID] = slot5
		slot5.hpMaxC = slot5.hpC
		slot5.mp1MaxC = slot5.mp1C
	end

	return slot0
end)
slot2("gCPCorrectionGroups", function (slot0)
	for slot4, slot5 in csvPairs(csv.combat_power_correction) do
		uv7 = "csvPairs"
		slot0[slot4] = arraytools.hash(slot7(slot5.groupKey))
	end
end)
slot2("gExtraRoundTrigger", function (slot0)
	for slot4, slot5 in csvPairs(csv.extra_round_trigger) do
		slot0[slot4] = {
			limitBuff = arraytools.hash(slot5.limitBuff),
			forbiddenBuff = arraytools.hash(slot5.forbiddenBuff),
			forbiddenPassiveSkill = arraytools.hash(slot5.forbiddenPassiveSkill),
			cfgIds = arraytools.hash(slot5.cfgIds),
			disableBattleState = slot5.disableBattleState,
			enableActiveSkillMp = slot5.enableActiveSkillMp
		}
	end
end)

return {}
