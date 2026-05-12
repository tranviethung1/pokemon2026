slot0 = class("CardEquipView", cc.load("mvc").ViewBase)

function slot1(slot0, slot1)
	return cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(0.1), cc.MoveTo:create(0.3, cc.p(slot0, slot1 + 10)), cc.DelayTime:create(0.1), cc.MoveTo:create(0.3, cc.p(slot0, slot1))))
end

slot2 = {
	"showStrengthenItem",
	"showStarItem",
	"showAwakeItem",
	"showSignetItem"
}
slot0.RESOURCE_FILENAME = "card_equip.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	["panel.name"] = "panelName",
	["panel.icon"] = "icon",
	panel = "panel",
	["panel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("equipDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						event = "extend",
						class = "equip_icon",
						props = {
							data = slot3,
							selected = slot3.isSel,
							onNode = function (slot0)
								slot0:setTouchEnabled(false)

								slot1 = slot0:get("imgArrow")
								slot2 = slot1.visible
								uv4 = "setTouchEnabled"

								slot2(slot1, slot4.state == true)

								uv2 = "setTouchEnabled"

								if not slot2.originY then
									uv2 = "setTouchEnabled"
									uv3 = "setTouchEnabled"
									slot2.originX, slot3.originY = slot1:xy()
								end

								uv2 = "setTouchEnabled"

								if slot2.action then
									slot2 = slot1.stopAction
									uv4 = "setTouchEnabled"

									slot2(slot1, slot4.action)

									uv2 = "setTouchEnabled"
									slot2.action = nil
								end

								uv2 = "setTouchEnabled"

								if slot2.state then
									uv2 = "setTouchEnabled"
									uv3 = "get"
									uv4 = "setTouchEnabled"
									slot4 = slot4.originX
									uv5 = "setTouchEnabled"
									slot2.action = slot3(slot4, slot5.originY)
									uv4 = "setTouchEnabled"

									slot1:runAction(slot4.action)
								end

								slot0:xy(10, 10)
							end
						}
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = function ()
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
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onEquipClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	adapt.centerWithScreen(nil, "right", nil, {
		{
			slot0.panel,
			"pos",
			"center"
		}
	})

	slot0.selectDbId, slot0.selectIndex, slot0.tabKey, slot0.state = slot1 or function ()
		return gGameModel.role:read("cards")[1], idler.new(1), idler.new(1), idler.new(2)
	end()

	slot0:initModel()

	slot0.equipDatas = idlers.newWithMap({})

	idlereasy.any({
		slot0.equips,
		slot0.tabKey,
		slot0.state,
		slot0.items,
		slot0.level
	}, function (slot0, slot1, slot2, slot3, slot4, slot5)
		uv6 = "equipDatas"
		slot6 = slot6.equipDatas
		slot6 = slot6.update
		slot8 = clone

		slot6(slot6, slot8(slot1))

		uv6 = "equipDatas"
		uv8 = "equipDatas"
		slot6.equipDatas:atproxy(slot8.selectIndex:read()).isSel = true

		if slot3 == 2 then
			uv7 = "equipDatas"

			for slot9 = 1, slot7.equipDatas:size() do
				uv10 = "equipDatas"
				slot12 = slot10.equipDatas:atproxy(slot9).equip_id
				uv12 = "equipDatas"
				uv13 = "update"

				if slot12[slot13[slot2]] then
					uv12 = "equipDatas"
					uv13 = "update"
					slot13 = slot13[slot2]
					uv13 = "equipDatas"

					slot12[slot13](slot13, csv.equips[slot12], slot10)
				end
			end
		end

		uv6 = "equipDatas"

		slot6.selectIndex:notify()
	end):anonyOnly(slot0)
	slot0.selectIndex:addListener(function (slot0, slot1)
		uv2 = "equipDatas"

		if slot2.equipDatas:atproxy(slot1) then
			slot2.isSel = false
		end

		uv3 = "equipDatas"

		if slot3.equipDatas:atproxy(slot0) == nil then
			return
		end

		slot4 = csv.equips[slot3.equip_id]
		slot5, slot6 = nil

		if slot3.awake ~= 0 then
			slot5 = slot4.name1 .. gLanguageCsv["symbolRome" .. slot3.awake]
			slot6 = slot4.icon2
		else
			slot5 = slot4.name0
			slot6 = slot4.icon
		end

		slot7, slot8 = dataEasy.getQuality(slot3.advance)
		uv10 = "equipDatas"

		text.addEffect(slot10.panelName, {
			color = slot7 == 1 and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.QUALITY[slot7]
		})

		slot9 = slot5
		uv9 = "equipDatas"
		slot9 = slot9.panelName
		slot9 = slot9.text

		slot9(slot9, slot9 .. slot8)

		uv9 = "equipDatas"

		slot9.icon:texture(slot6)

		slot3.isSel = true
	end)
end

function slot0.initModel(slot0)
	idlereasy.when(slot0.selectDbId, function (slot0, slot1)
		slot2 = gGameModel.cards
		slot3 = slot2
		slot2 = slot2.find(slot3, slot1)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.equips = idlereasy.assign(slot2.getIdler(slot6, "equips"), slot6.equips)
		uv3 = "gGameModel"

		slot3.selectIndex:notify()
	end)

	slot0.items = gGameModel.role:getIdler("items")
	slot0.level = gGameModel.role:getIdler("level")
end

function slot0.showStarItem(slot0, slot1, slot2)
	slot3 = slot2.star ~= slot1.starMax
	slot4 = true
	slot8 = slot1.starSeqID

	for slot8, slot9 in csvMapPairs(csv.base_attribute.equip_star[slot2.star]["costItemMap" .. slot8]) do
		if slot8 ~= "gold" and dataEasy.getNumByKey(slot8) < slot9 then
			slot4 = false

			break
		end
	end

	slot2.state = slot4 and slot3

	if slot2.star == slot1.starMax and dataEasy.isUnlock(gUnlockCsv.equipAbility) then
		slot6 = true
		slot7 = (slot2.ability or 0) ~= slot1.abilityMax
		slot11 = slot1.abilitySeqID

		for slot11, slot12 in csvMapPairs(csv.base_attribute.equip_ability[slot5]["costItemMap" .. slot11]) do
			if dataEasy.getNumByKey(slot11) < slot12 then
				slot6 = false

				break
			end
		end

		slot2.state = slot6 and slot7
	end
end

function slot0.showStrengthenItem(slot0, slot1, slot2)
	slot3 = slot0.level:read()
	slot5 = slot1.strengthMax[csvSize(slot1.strengthMax)]

	if slot2.level < slot1.strengthMax[slot2.advance] then
		slot2.state = true
	else
		for slot10, slot11 in csvMapPairs(gEquipAdvanceCsv[slot2.equip_id][slot2.advance].costItemMap) do
			if dataEasy.getNumByKey(slot10) < slot11 and true then
				slot6 = false

				break
			end
		end

		slot2.state = slot1.roleLevelMax[slot2.advance] <= slot3 and slot6
	end
end

function slot0.showAwakeItem(slot0, slot1, slot2)
	slot4 = true
	slot5 = (slot2.awake or 0) ~= slot1.awakeMax
	slot9 = slot1.awakeSeqID

	for slot9, slot10 in csvMapPairs(csv.base_attribute.equip_awake[slot3]["costItemMap" .. slot9]) do
		if dataEasy.getNumByKey(slot9) < slot10 then
			slot4 = false

			break
		end
	end

	slot2.state = slot4 and slot5

	if slot3 == slot1.awakeMax and dataEasy.isUnlock(gUnlockCsv.equipAwakeAbility) then
		slot7 = true
		slot8 = (slot2.awake_ability or 0) ~= slot1.awakeAbilityMax
		slot12 = slot1.awakeAbilitySeqID

		for slot12, slot13 in csvMapPairs(csv.base_attribute.equip_awake_ability[slot6]["costItemMap" .. slot12]) do
			if dataEasy.getNumByKey(slot12) < slot13 then
				slot7 = false

				break
			end
		end

		slot2.state = slot7 and slot8
	end
end

function slot0.showSignetItem(slot0, slot1, slot2)
	slot3 = true

	if slot2.signet ~= slot1.signetStrengthMax[table.getn(slot1.signetStrengthMax)] then
		slot8 = slot1.signetStrengthSeqID

		for slot8, slot9 in csvMapPairs(csv.base_attribute.equip_signet[slot2.signet]["costItemMap" .. slot8]) do
			if dataEasy.getNumByKey(slot8) < slot9 then
				slot3 = false

				break
			end
		end
	end

	if slot2.signet_advance ~= slot1.signetAdvanceMax and slot2.signet == (slot2.signet_advance + 1) * 5 then
		for slot9, slot10 in csvPairs(csv.base_attribute.equip_signet_advance) do
			if slot10.advanceIndex == slot1.advanceIndex and slot10.advanceLevel == slot2.signet_advance + 1 then
				slot14 = slot10.advanceSeqID

				for slot14, slot15 in csvMapPairs(csv.base_attribute.equip_signet_advance_cost[slot2.signet_advance]["costItemMap" .. slot14]) do
					if dataEasy.getNumByKey(slot14) < slot15 then
						slot3 = false

						break
					end
				end
			end
		end
	end

	slot2.state = slot3 and slot5
end

function slot0.onEquipClick(slot0, slot1, slot2, slot3)
	slot0.selectIndex:set(slot2)
end

function slot0.getAttrNum(slot0, slot1, slot2, slot3)
	if not csv.equips[slot0.equip_id]["attrStarC" .. slot1] then
		return 0
	end

	slot6 = slot0.star + 1
	slot7 = slot0.advance
	slot8 = slot0.level
	slot9 = slot0.awake or 0
	slot12 = slot0.awake_ability or 0
	slot3 = slot3 or {}
	slot13 = slot6
	slot14 = slot0.ability or 0
	slot15 = slot7
	slot16 = slot8
	slot17 = slot0.signet or 0
	slot22 = slot4["awakeAttrNum" .. slot1]
	slot23 = slot4.abilityAttr
	slot24 = slot4["signetAttrNum" .. slot1]
	slot25 = slot4["awakeAbilityAttrNum" .. slot1]
	slot26 = slot4["attrType" .. slot1]
	slot27 = slot4["attrStarC" .. slot1][slot6] * (slot4["attrNum" .. slot1][slot7] + slot4["attrStarNum" .. slot1][slot6] + slot4["attrAdvanceNum" .. slot1][slot7] * slot8)
	slot28 = nil

	if ({
		star = function ()
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
		ability = function ()
			uv0 = "abilityMax"
			uv1 = "tonumber"

			if slot0 ~= slot1.abilityMax then
				uv0 = "sub"
				uv3 = "tonumber"
				uv4 = "abilityMax"
				slot0 = slot0 * (100 + tonumber(string.sub(slot3.abilityAttr[slot4 + 1], 1, -2))) / 100
				uv2 = 1
			else
				uv2 = slot2
			end

			uv0 = "abilityMax"

			if slot0 > 0 then
				uv0 = "sub"
				uv3 = "tonumber"
				uv4 = "abilityMax"
				slot0 = slot0 * (100 + tonumber(string.sub(slot3.abilityAttr[slot4], 1, -2))) / 100
				uv3 = 1
			end

			uv0 = "sub"
			uv1 = "string"

			return slot0, slot1
		end,
		advance = function ()
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
		strengthen = function ()
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
		awake = function ()
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
		signet = function ()
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
		awakeAbility = function ()
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
	})[slot2] then
		slot27, slot28 = slot29[slot2]()
	end

	return slot26, slot27, slot28 or slot18[slot13] * (slot19[slot15] + slot20[slot13] + slot21[slot15] * slot16)
end

return slot0
