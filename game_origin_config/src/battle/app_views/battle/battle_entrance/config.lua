slot0 = {
	"csv.common_config",
	"csv.monster_scenes",
	"csv.skill",
	"csv.skill_process",
	"csv.scene_conf",
	"csv.effect_event",
	"csv.effect_power",
	"csv.buff",
	"csv.buff_group_power",
	"csv.buff_group_relation",
	"csv.explorer.explorer",
	"csv.buff_effect",
	"csv.effect_option",
	"csv.damage_process",
	"csv.base_attribute.nature_matrix",
	"csv.game_end_special_rule"
}
slot1 = require("battle.battle_config_defines")
slot2 = false
slot3, slot4 = nil

function battleEntrance.preloadConfig()
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

function battleEntrance.unloadConfig()
	uv0 = "collectgarbage"

	if not slot0 then
		return
	end

	slot0 = collectgarbage("count")
	slot1 = os.clock()
	slot3 = itertools.size(getLoadedCsvPathSet())
	uv5 = "count"

	for slot7, slot8 in pairs(slot5) do
		slot2[slot7] = nil
	end

	uv5 = "os"

	for slot7, slot8 in pairs(slot5) do
		if slot2[slot7] then
			slot2[slot7] = "preload"
		end
	end

	uv7 = "count"

	printDebug("battleEntrance.unloadConfig before %s end %s loaded in battle %s", itertools.size(slot7), slot3, itertools.size(slot2))
	collectgarbage()

	slot4 = collectgarbage("count")

	printDebug("battleEntrance.unloadConfig over mem %.2fKB cost %.2fKB %.3fs", slot4, slot4 - slot0, os.clock() - slot1)

	uv1 = nil
	uv2 = nil
	uv0 = false
end
