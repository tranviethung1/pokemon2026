globals.AutoChessBattle = {}

require("ymrand")
require("lushi_battle.models.defines")
require("battle.models.components.init")
require("lushi_battle.models.guide")
require("lushi_battle.models.target.include")
require("lushi_battle.models.buff.include")
require("lushi_battle.models.object.include")
require("lushi_battle.models.gate")
require("lushi_battle.models.encounter2")
require("lushi_battle.models.operate_manager")
require("lushi_battle.models.scene")
require("lushi_battle.models.pack.include")
require("lushi_battle.csv.include")
require("lushi_battle.models.config_defines")

slot0 = true
slot1 = {}
slot2 = nil
slot2 = {
	[lushi.BuffOverlayType.Normal] = function ()
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
	end,
	[lushi.BuffOverlayType.Cover] = function ()
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
	end,
	[lushi.BuffOverlayType.Coexist] = function (slot0, slot1)
		uv2 = "cfgId"
		uv3 = "cfgId"
		uv5 = "cfgId"

		if slot3.holder.buffOverlayCount[slot2.cfgId] < slot5.overlayLimit then
			uv4 = "holder"

			return slot4, true, true
		end

		uv4 = "holder"

		return slot4, false
	end
}
slot3 = {
	function (slot0, slot1)
		uv2 = "args"

		if math.max(math.min(slot2.args.prob or 1, 1), 0) < 1 and slot3 < ymrand.random() then
			uv5 = "prob"

			return slot5, false
		end
	end,
	function (slot0, slot1)
		uv4 = "buffImmuneEffect"

		if not slot0:buffImmuneEffect(slot4.cfgId, slot1.group) then
			uv3 = "cfgId"

			return slot3, false
		end
	end,
	function (slot0, slot1)
		uv2 = "cfgId"
		uv3 = "cfgId"
		slot3.args.effectBuffs = {}

		for slot7, slot8 in slot0:iterBuffs() do
			if slot8.cfgId == slot2.cfgId then
				uv9 = "cfgId"
				uv10 = "cfgId"
				slot9.holderBuff = slot10.holderBuff or slot8

				table.insert(slot3.effectBuffs, slot8)
			end
		end
	end,
	function (slot0, slot1)
		uv2 = "holderBuff"

		if slot2.holderBuff then
			uv2 = "overlayType"
			slot3 = slot1.overlayType
			uv3 = "holderBuff"

			return slot2[slot3](slot3.holderBuff, slot1)
		end
	end
}

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

slot5 = {
	[lushi.BuffOverlayType.Cover] = function (slot0, slot1, slot2, slot3)
		slot0:over({
			endType = lushi.BuffOverType.overlay
		})
	end,
	[lushi.BuffOverlayType.Coexist] = function (slot0, slot1, slot2, slot3)
		uv6 = "cfgId"

		if slot1.buffOverlayCount[slot3.cfgId] < slot6.overlayLimit and slot3.isFirst then
			slot1.buffOverlayCount[slot4] = slot1.buffOverlayCount[slot4] + 1
		end
	end
}

function slot6(slot0, slot1, slot2, slot3)
	slot3.effectBuffs = nil

	if not slot3.effectBuffs then
		return
	end

	slot6 = cache.newTable()
	slot6.cfgId = slot0
	slot6.triggerBuff = nil
	slot6.isFirst = true
	slot6.over = false

	for slot10, slot11 in ipairs(slot4) do
		if not slot11.isOver then
			uv12 = "effectBuffs"

			slot12[csv.auto_chess.buff[slot0].overlayType](slot11, slot1, slot3, slot6)

			slot6.isFirst = false
		end

		if slot6.over then
			break
		end
	end

	cache.deleteTable(slot6)

	slot7 = slot6.triggerBuff

	if slot6.over then
		return
	end
end

function AutoChessBattle.addBuffToHero(slot0, slot1, slot2, slot3)
	if slot1.isDeleted then
		printWarn("add buff to deleted obj id:%s unitID:%s buffCfgId:%s", slot1.id, slot1.unitID, slot0)

		return
	end

	uv4 = "isDeleted"
	slot4, slot5 = slot4(slot0, slot1, slot2, slot3)

	log.chess.buff_c.canAddCheck_c({
		cfgId = slot0,
		holder = slot1,
		caster = slot2,
		canAdd = slot4,
		canTakeEffect = slot5
	})

	if slot5 then
		uv6 = "printWarn"

		slot6(slot0, slot1, slot2, slot3)
	end

	slot6 = nil

	if slot4 then
		slot3.casterRes = slot2:getBuffIcon()
		slot6 = AutoChessBattle.AutoChessBuffModel.new(slot0, slot1, slot2, slot3)

		slot1.scene:insertBuff(slot6.id, slot6)
		slot1.buffs:insert(slot6.id, slot6)
		slot6:init()
		slot1:triggerBuffOnPoint(lushi.BuffTriggerPoint.onBuffBeAdd, slot6)
	end

	return slot6
end
