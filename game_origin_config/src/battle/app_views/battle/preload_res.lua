slot0 = {}

function slot1(slot0, slot1, slot2)
	if slot2.buffId == nil then
		return
	end

	for slot6, slot7 in pairs(slot2.buffId) do
		if type(slot7) == "number" then
			if not csv.buff[slot7] then
				return errorInWindows(string.format("error: 预加载 [buff] 表资源时出错, 试图在该表中查找一个不存在的buffId=%s", slot7))
			end

			if slot8.effectRes then
				slot0[slot8.effectRes] = (slot0[slot8.effectRes] or 0) + 1
			end

			if slot8.textResPath then
				slot0[slot8.textResPath] = (slot0[slot8.textResPath] or 0) + 1
			end

			if slot8.iconResPath then
				slot0[slot8.iconResPath] = (slot0[slot8.iconResPath] or 0) + 1
			end

			if slot8.playEffect then
				slot0[slot8.playEffect] = (slot0[slot8.playEffect] or 0) + 1
			end

			if slot8.fixShow then
				slot0[slot8.fixShow] = (slot0[slot8.fixShow] or 0) + 1
			end

			if slot8.easyEffectFunc == "change" then
				loadHeroUnit(slot0, slot1, slot2.buffValue1[1])
			end
		end
	end
end

function slot2(slot0, slot1, slot2)
	if not csv.skill_process[slot2] then
		return errorInWindows(string.format("error: 预加载 [skill_process] 表资源时出错, 试图在该表中查找一个不存在的processId=%s", slot2))
	end

	if slot3.effectRes then
		slot0[slot3.effectRes] = (slot0[slot3.effectRes] or 0) + 1
	end

	if slot3.shotEffect then
		slot0[slot3.shotEffect] = (slot0[slot3.shotEffect] or 0) + 1
	end

	uv4 = "csv"

	slot4(slot0, slot1, slot3)

	if slot3.callerId ~= nil and slot3.callerId > 0 then
		loadHeroUnit(slot0, slot1, slot3.callerId)

		if slot3.callerEffect then
			slot0[slot3.callerEffect] = (slot0[slot3.callerEffect] or 0) + 1
		end
	end
end

function slot3(slot0, slot1, slot2)
	if not csv.effect_event[slot2] then
		return errorInWindows(string.format("error: 预加载 [effect_event] 表资源时出错, 试图在该表中查找一个不存在的eventID=%s", slot2))
	end

	if slot3.sound then
		slot1[slot3.sound.res] = true
	end

	if slot3.music then
		slot1[slot3.music.res] = true
	end

	if slot3.effectRes then
		slot0[slot3.effectRes] = (slot0[slot3.effectRes] or 0) + 1
	end
end

function slot4(slot0, slot1, slot2)
	if not csv.skill[slot2] then
		return errorInWindows(string.format("error: 预加载 [skill] 表资源时出错, 试图在该表中查找一个不存在的skillId=%s", slot2))
	end

	for slot7, slot8 in ipairs(slot3.effectBigName) do
		slot0[slot9] = (slot0["config/big_hero/normal/" .. slot8 .. ".png"] or 0) + 1
	end

	if slot3.sound then
		slot1[slot3.sound.res] = true
	end
end

function slot5(slot0, slot1, slot2)
	if not csv.unit[slot2] then
		return errorInWindows(string.format("error: 预加载 [unit] 表资源时出错, 试图在该表中查找一个不存在的unitId=%s", slot2))
	end

	uv4 = "csv"
	slot4[slot2] = true
	slot0[slot3.unitRes] = (slot0[slot3.unitRes] or 0) + 1

	for slot7, slot8 in ipairs(slot3.skillList) do
		uv9 = "unit"

		slot9(slot0, slot1, slot8)
	end

	if slot3.deathSound then
		slot1[slot3.deathSound] = true
	end
end

function globals.visitFightResources()
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
