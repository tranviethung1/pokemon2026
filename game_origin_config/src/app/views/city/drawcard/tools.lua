return {
	hasCard = function (slot0)
		slot1 = {}
		slot5 = nil

		for slot9, slot10 in ipairs(slot0) do
			if slot10.key == "card" then
				if -1 < csv.unit[csv.cards[slot10.num.id].unitID].rarity then
					slot2 = slot12
					slot5 = slot10
				end
			else
				uv11 = "csv"

				if slot11.is2choose1item(slot10[1]) and dataEasy.getCfgByKey(slot10[1]).specialArgsMap["choose" .. math.random(1, 2)].card then
					slot5 = {
						num = {
							id = slot11.specialArgsMap["choose" .. slot12].card.id
						}
					}
				end
			end
		end

		if slot5 then
			table.insert(slot1, slot5)
		end

		return #slot1 > 0, slot1
	end,
	is2choose1item = function (slot0)
		if not slot0 then
			return false
		end

		if dataEasy.getCfgByKey(slot0) and slot1.type == game.ITEM_TYPE_ENUM_TABLE.chooseGift and slot1.specialArgsMap and csvSize(slot1.specialArgsMap) == 2 then
			for slot5, slot6 in csvMapPairs(slot1.specialArgsMap) do
				if not slot6.card then
					return false
				end
			end

			return true
		end

		return false
	end,
	addLight = function (slot0, slot1)
		slot3 = slot1.parentEffect

		for slot12 = 1, slot1.count do
			slot14 = slot1.datas[slot12].key == "card"
			slot15 = slot1.cloneItem:clone()

			slot15:addTo(slot1.parent, 1000)
			slot15:show()
			bind.extend(slot0, slot15, {
				class = "icon_key",
				props = {
					effect = "drawcard",
					data = {
						key = slot14 and "card" or slot13[1],
						num = slot14 and slot13.num.id or slot13[2]
					},
					specialKey = {
						maxLimit = true
					}
				}
			})

			slot17 = false

			if slot14 then
				slot17 = csv.unit[csv.cards[slot13.num.id].unitID].rarity >= 4
			end

			widget.addAnimationByKey(slot15, "effect/xianshichouka.skel", "guanquan", slot17 and "effect_gjguangquan_loop" or "effect_guangquan_loop", 1000):scale(2):alignCenter(slot15:size())
			slot15:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.CallFunc:create(function ()
				uv0 = "getPosition"
				slot0, slot1 = slot0:getPosition()
				uv3 = "icon_move"
				slot2 = "icon_move" .. slot3
				uv3 = "getPosition"
				slot4 = slot3
				uv4 = "getPosition"
				slot5 = slot4
				uv5 = "getPosition"
				slot6 = slot5
				slot5 = slot5.getBonePosition(slot6, slot2)
				uv6 = "getPosition"
				slot7 = slot6
				uv7 = "getPosition"
				slot8 = slot7
				uv8 = "getPosition"
				slot9 = slot8
				uv9 = "getScaleX"

				slot9:rotate(slot6.getBoneRotation(slot7, slot2)):scaleX(slot7.getBoneScaleX(slot8, slot2)):scaleY(slot8.getBoneScaleY(slot9, slot2)):xy(slot5.x * slot3.getScaleX(slot4) + slot0, slot5.y * slot4.getScaleY(slot5) + slot1)
			end))))
		end
	end,
	addCardImg = function (slot0, slot1)
		slot2 = 0
		slot3 = slot1:getChildByName("effect")

		for slot7, slot8 in ipairs(slot0) do
			slot9 = slot1:getChildByName("showCard")

			performWithDelay(slot1, function ()
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
			end, (slot7 - 1) * 70 / 30)
		end

		return slot2 - 0.13333333333333333
	end
}
