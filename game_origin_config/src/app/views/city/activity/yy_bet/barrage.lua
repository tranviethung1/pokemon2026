function slot1(slot0, slot1)
	uv3 = "pairs"

	for slot5, slot6 in pairs(slot3.cache[slot1]) do
		if slot6.dbId == slot0.role_db_id and slot6.barrage == slot0.content then
			return true
		end
	end

	return false
end

return {
	cache = {
		{},
		{},
		{},
		{},
		{}
	},
	showing = {},
	selfBarrages = nil,
	showBarrages = true,
	initBarrageData = function (slot0)
		uv3 = "data"
		uv4 = "data"
		slot3.cache[slot2] = slot4.cache[slot0.match] or {}

		for slot6, slot7 in pairs(slot0.data or {}) do
			uv8 = "match"

			if not slot8(slot7, slot2) then
				uv9 = "data"

				table.insert(slot9.cache[slot2], {
					name = slot7.role_name,
					barrage = slot7.content,
					dbId = slot7.role_db_id
				})
			end
		end
	end,
	cleanBarrageData = function (slot0)
		if slot0 then
			uv1 = "cache"
			slot1.cache[slot0] = {}
		else
			uv1 = "cache"
			slot1.cache = {}
		end
	end,
	closeBarrage = function (slot0)
		uv1 = "showBarrages"
		slot1.showBarrages = false
		uv1 = "showBarrages"

		slot1.controlBarrage(slot0)
	end,
	openBarrage = function (slot0)
		uv1 = "showBarrages"
		slot1.showBarrages = true
		uv1 = "showBarrages"

		slot1.controlBarrage(slot0)
	end,
	controlBarrage = function (slot0)
		for slot4, slot5 in pairs(slot0:getChildren()) do
			if slot5 then
				uv8 = "pairs"

				slot5:visible(slot8.showBarrages)
			end
		end
	end,
	barrageAction = function (slot0, slot1)
		function slot2(slot0)
			uv1 = "match"
			slot1 = slot1.match
			uv2 = "width"
			slot3 = slot2
			uv3 = "match"
			slot3 = slot3.range or {
				100,
				100
			}
			slot8 = 1
			uv10 = "range"
			uv8 = "range"
			slot8, slot9 = slot8.getOneBarrage(slot1, math.random(slot8, itertools.size(slot10.cache[slot1])), slot0)
			uv12 = "range"
			slot12 = cc.p
			uv12 = "match"
			slot12 = slot12.danmuDiaph
			slot10 = slot8:visible(slot12.showBarrages):xy(cc.p(slot2.width(slot3), math.random(slot3[1], slot3[2]))):anchorPoint(slot12(0, 0.5)):opacity(slot12)
			slot10 = slot10.addTo
			uv12 = "width"

			slot10(slot10, slot12, 15)

			uv10 = "match"
			slot10 = slot10.rate or {
				5,
				20
			}

			slot8:runAction(cc.Sequence:create(cc.MoveTo:create(math.random(slot10[1], slot10[2]), cc.p(-slot8:width() / 2, slot6)), cc.CallFunc:create(function ()
				uv0 = "showing"

				if slot0 then
					uv0 = "removeFromParent"
					uv1 = "showing"
					slot0.showing[slot1] = nil
				end

				uv0 = "showing"

				slot0:removeFromParent()
			end)))
		end

		slot3 = 0

		slot0:scheduleUpdate(function ()
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
		end, 1, 0, 666)
	end,
	getOneBarrage = function (slot0, slot1, slot2)
		uv3 = "cache"
		slot3 = slot3.cache[slot0] or {}

		if slot2 then
			slot3 = {
				[slot1] = {
					name = slot2.name,
					barrage = slot2.barrage,
					dbId = slot2.dbId
				}
			}
		end

		if slot3[slot1] then
			uv5 = "cache"

			if itertools.include(slot5.showing, slot1) then
				return ccui.Layout:create()
			end
		end

		slot4 = 1

		for slot8 = 1, math.huge do
			uv9 = "cache"

			if not slot9.showing[slot8] then
				uv9 = "cache"
				slot9.showing[slot8] = slot1
				slot4 = slot8

				break
			end
		end

		slot6 = gGameModel.role:read("id") == slot3[slot1].dbId and cc.c4b(244, 236, 15, 255) or ui.COLORS.NORMAL.WHITE
		slot8 = label.create(string.format(gLanguageCsv.brackets .. ": ", slot3[slot1].name), {
			fontSize = 50,
			fontPath = "font/youmi1.ttf",
			color = ui.COLORS.NORMAL.DEFAULT,
			effect = {
				color = slot6,
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		})
		slot9 = label.create(slot3[slot1].barrage, {
			fontSize = 50,
			fontPath = "font/youmi1.ttf",
			color = ui.COLORS.NORMAL.DEFAULT,
			effect = {
				color = slot6,
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		})
		slot10 = ccui.Layout:create():size(slot8:width() + slot9:width(), slot8:height()):anchorPoint(cc.p(0.5, 0.5))

		slot10:setCascadeOpacityEnabled(true)
		slot8:addTo(slot10, 1)
		slot9:addTo(slot10, 1)
		adapt.oneLinePos(slot8, slot9)

		return slot10, slot4
	end,
	sendSelfBarrage = function (slot0, slot1)
		uv2 = "selfBarrages"
		slot2.selfBarrages = slot0
		uv2 = "selfBarrages"

		slot2.initBarrageData(slot1)
	end,
	showBarrage = function (slot0, slot1)
		slot1.rate = slot1.rate or {
			8,
			25
		}
		slot2 = slot1.range or {
			100,
			1000
		}
		slot1.range = slot2
		uv2 = "rate"
		slot2.showing = {}
		uv2 = "rate"
		slot2 = slot2.initBarrageData

		slot2(slot1)

		uv2 = "rate"

		slot2.barrageAction(slot0, slot1)
	end
}
