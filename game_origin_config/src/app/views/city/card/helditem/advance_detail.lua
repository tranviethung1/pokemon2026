slot0 = require("app.views.city.card.helditem.tools")
slot1 = 640
slot2 = 973

function slot3(slot0, slot1, slot2, slot3)
	if slot3.advance == slot0.advance then
		slot4 = gLanguageCsv.advance .. " +" .. slot3.advance .. string.format("(%s)", gLanguageCsv.current)
	end

	slot5 = slot3.rellyAdvance and slot3.rellyAdvance + 1 or slot3.advance + 1

	slot1:get("textTitle"):text(slot4)

	slot6 = slot0.advance < slot3.advance
	slot7 = {}

	for slot11, slot12 in ipairs(slot3.attr) do
		slot13 = csv.held_item.effect[slot12]
		slot16 = 1

		if itertools.size(slot13.exclusiveCards) > 0 then
			slot18 = csv.cards[slot13.exclusiveCards[1]]

			table.insert({}, slot18.name)

			if not slot6 then
				slot22 = game.NATURE_TABLE[csv.unit[slot18.unitID].natureType]
				uv22 = "gLanguageCsv"
				slot14 = slot22.insertColor(slot13.desc, ui.ATTRCOLOR[slot22], true, slot16, true)
			end

			slot16 = slot16 + 1
		end

		slot17 = "#C0x5B545B#"

		if slot6 then
			slot17 = "#C0xB7B09E#"
		end

		if slot13.type == 1 then
			for slot21 = 1, 100 do
				if not slot13["attrNum" .. slot21] then
					break
				end

				table.insert(slot15, dataEasy.getAttrValueString(slot13["attrType" .. slot21], slot13["attrNum" .. slot21][slot3.idx]))
			end

			uv18 = "gLanguageCsv"
			slot14 = slot18.insertColor(slot14, ui.QUALITYCOLOR[2], false, slot16, false, slot17)
		elseif slot13.type == 2 then
			slot19 = csv.skill[slot13.skillID]
			uv19 = "gLanguageCsv"

			table.insert(slot15, eval.doMixedFormula(slot19.insertSkillDescColor(dataEasy.getSkillDesc(slot19), ui.QUALITYCOLOR[2], slot17), {
				skillLevel = slot5,
				math = math
			}))
		end

		table.insert(slot7, string.format(slot14, unpack(slot15)))
	end

	if slot3.isNew then
		slot8 = table.concat(slot7, "\n") .. "#Icommon/icon/txt_new.png#"
	end

	slot9 = "#C0x5B545B#"

	if slot6 then
		slot9 = "#C0xB7B09E#"
	end

	slot10 = rich.createWithWidth(slot9 .. slot8, 40, nil, 920):anchorPoint(0, 1):x(25):addTo(slot1, 10, "attrText")
	slot12 = slot10:size().height + 50

	slot1:size(960, slot12)
	slot1:get("textTitle"):y(slot12 - 25)
	slot10:y(slot12 - 50)
	slot0.baseNodeHeight:modify(function ()
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
end

slot4 = class("HeldItemBreachView", Dialog)
slot4.RESOURCE_FILENAME = "held_item_info.json"
slot4.RESOURCE_BINDING = {
	["baseNode.imgBg"] = "imgBg",
	baseNode = "baseNode",
	item = "item",
	["baseNode.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("infos"),
				item = bindHelper.self("item"),
				advance = bindHelper.self("advance"),
				baseNodeHeight = bindHelper.self("baseNodeHeight"),
				onItem = function ()
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
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				afterBuild = bindHelper.self("onAfterBuild")
			}
		}
	}
}

function slot4.onCreate(slot0, slot1)
	slot0.advance = slot1.data.advance
	slot0.params = slot1
	slot0.baseNodeHeight = idler.new(0)
	slot4 = slot1.data.csvId
	slot5 = csv.held_item.items
	slot6 = slot1.data.cfg.advanceMax
	slot7 = {}
	slot8 = {}
	slot9 = {}
	slot10 = 0

	for slot14 = 1, math.huge do
		if not slot3["effect" .. slot14] or slot15 == 0 then
			break
		end

		slot10 = slot10 + 1

		if not slot8[slot3[string.format("effect%dLevelAdvSeq", slot14)][1]] then
			slot8[slot17] = {}
		end

		table.insert(slot8[slot17], slot15)

		slot9[slot17] = true
	end

	slot11 = {}

	for slot15 = 1, slot10 do
		slot17 = true

		if slot3[string.format("effect%dLevelAdvSeq", slot15)][1] <= slot2 then
			slot17 = false
		end

		for slot22, slot23 in ipairs(slot16) do
			if slot23 <= slot6 and not slot11[slot23] then
				slot11[slot23] = true

				if 0 + 1 > 1 then
					slot17 = false
				end

				slot24 = {}

				for slot28, slot29 in pairs(slot9) do
					if slot28 <= slot23 then
						for slot33, slot34 in pairs(slot8[slot28]) do
							table.insert(slot24, slot34)
						end
					end
				end

				table.insert(slot7, {
					attr = slot24,
					advance = slot23,
					idx = slot22,
					cfg = data,
					isNew = slot17
				})
			end
		end
	end

	table.sort(slot7, function (slot0, slot1)
		return slot0.advance < slot1.advance
	end)

	for slot15 = 2, math.huge do
		slot17 = slot7[slot15 - 1]

		if not slot7[slot15] then
			break
		end

		for slot22 = 1, slot16.advance - slot17.advance - 1 do
			slot23 = clone(slot17)
			slot23.isNew = false
			slot23.advance = slot23.advance + slot22
			slot23.rellyAdvance = slot17.advance

			table.insert(slot7, slot15 - 1 + slot22, slot23)
		end
	end

	slot0.infos = idlertable.new(slot7)

	Dialog.onCreate(slot0, {
		noBlackLayer = true,
		clickClose = true
	})
end

function slot4.onAfterBuild(slot0, slot1)
	slot2 = slot0.infos:size()
	uv4 = "infos"
	slot5 = slot0.baseNodeHeight
	slot5 = slot5.read
	uv5 = "size"
	slot3 = math.min(slot5, math.max(slot4, slot5(slot5)))
	slot4 = slot0.baseNode:size().width

	slot0.baseNode:size(slot4, slot3)
	slot0.imgBg:size(slot4 + 10, slot3 + 5)
	slot0.imgBg:y(slot3 / 2)
	slot0.list:size(960, slot3 - 50)
	slot0.list:y(25)

	slot7, slot8 = slot0:resetPosition(slot0.params.x, slot0.params.y - slot3 / 2 - slot0.params.target:getBoundingBox().height / 2)

	slot0.baseNode:xy(slot7 + (slot0.params.offx or 0), slot8 + (slot0.params.offy or 0))
end

function slot4.resetPosition(slot0, slot1, slot2)
	slot3 = slot1
	slot4 = slot2
	slot6 = slot0:getResourceNode():getBoundingBox()
	slot8 = display.size.width
	slot9 = slot0.baseNode:size()
	slot11 = slot2 - slot9.height / 2

	if display.size.height < slot2 + slot9.height / 2 then
		slot4 = slot7 - 50 - slot9.height / 2
	elseif slot11 < 0 then
		slot4 = slot9.height / 2 + 20
	end

	if slot1 - slot9.width / 2 < 0 then
		slot3 = slot9.width / 2 + 20
	elseif slot8 < slot12 then
		slot3 = slot8 - slot9.width / 2 - 20
	end

	return slot3, slot4
end

return slot4
