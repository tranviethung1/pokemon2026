slot0 = class("Card", require("app.models.base"))
slot1 = class("Cards", require("app.models.bases"))

function slot1.newModel(slot0, slot1)
	uv2 = "new"

	return slot2.new(slot0.game):init(slot1)
end

function slot1.syncFrom(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot1) do
		if slot0:find(slot6) ~= nil then
			slot8:syncFrom(slot7, slot2 and slot2[slot6])
		else
			slot0:insert(slot6, slot0:newModel(slot7))
			slot0:insertNewFlag_(slot6)
		end
	end

	slot0._statCache = nil
end

function slot1.getStat(slot0)
	if not slot0._statCache then
		slot1 = {
			level = {},
			advance = {},
			star = {},
			equip_advance = {},
			equip_star = {},
			equip_awake = {}
		}
		slot2 = {}
		slot3 = {}
		slot4 = {}

		for slot8, slot9 in slot0:pairs() do
			slot1.advance[slot10] = (slot1.advance[slot9:read("advance")] or 0) + 1
			slot10 = slot9:read("star_original") or slot9:read("star")
			slot1.star[slot10] = (slot1.star[slot10] or 0) + 1
			slot1.level[slot10] = (slot1.level[slot9:read("level")] or 0) + 1
			slot2[slot10] = (slot2[slot9:read("card_id")] or 0) + 1
			slot13 = slot4[slot11] or 0
			slot15 = slot9:read("advance") or 0

			if (slot3[csv.cards[slot9:read("card_id")].cardMarkID] or 0) < (slot9:read("star_original") or slot9:read("star")) then
				slot12 = slot14
			end

			if slot13 < slot15 then
				slot13 = slot15
			end

			slot3[slot11] = slot12
			slot4[slot11] = slot13
			slot19 = "equips"

			for slot19, slot20 in pairs(slot9:read(slot19)) do
				slot1.equip_advance[slot10] = (slot1.equip_advance[slot20.advance] or 0) + 1
				slot1.equip_star[slot10] = (slot1.equip_star[slot20.star] or 0) + 1
				slot1.equip_awake[slot10] = (slot1.equip_awake[slot20.awake] or 0) + 1
			end
		end

		slot0._statCache = {
			level_sum = stat.summator.new(slot1.level),
			advance_sum = stat.summator.new(slot1.advance),
			star_sum = stat.summator.new(slot1.star),
			card_id = slot2,
			equip_advance_sum = stat.summator.new(slot1.equip_advance),
			equip_star_sum = stat.summator.new(slot1.equip_star),
			equip_awake_sum = stat.summator.new(slot1.equip_awake),
			markID_star = slot3,
			markID_advance = slot4
		}
	end

	return slot0._statCache
end

function slot1.getNewFlags(slot0)
	assert(slot0._newflags, "plz initNewFlag before")

	return idlereasy.assign(slot0._newflags)
end

function slot1.initNewFlag(slot0)
	for slot6, slot7 in pairs(userDefault.getForeverLocalKey("newCards", {})) do
		if slot7 == true then
			-- Nothing
		end
	end

	slot0._newflags = idlereasy.new({
		[slot6] = true
	})
end

function slot1.insertNewFlag_(slot0, slot1)
	slot2 = stringz.bintohex(slot1)
	slot0._newflags = slot0._newflags or idlereasy.new({})
	slot0._newflags:proxy()[slot2] = true

	userDefault.setForeverLocalKey("newCards", {
		[slot2] = true
	})
end

function slot1.isNew(slot0, slot1)
	assert(slot0._newflags, "plz initNewFlag before")

	return slot0._newflags:read()[stringz.bintohex(slot1)] or false
end

function slot1.removeNewFlag(slot0, slot1)
	assert(slot0._newflags, "plz initNewFlag before")
	slot0._newflags:modify(function ()
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
	end)
	userDefault.setForeverLocalKey("newCards", {
		[stringz.bintohex(slot1)] = false
	}, {
		delete = true
	})
end

return slot1
