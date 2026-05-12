globals.EventSprite = class("EventSprite", AutoChessSprite)
slot0, slot1 = nil
slot2 = {
	select = {
		onTouchBegan = function (slot0, slot1, slot2)
			slot1.isMoveInit = false
		end,
		onTouchMoved = function (slot0, slot1, slot2, slot3)
			if slot0:getDrawOutId() and slot4 ~= slot1.model.id then
				return
			end

			if not slot1.isMoveInit then
				slot1:z(999)
				slot0:showSellingPrice(slot1.model:sellingPrice())

				slot1.isMoveInit = true
			end

			if not cc.rectContainsPoint(slot1.longPressRect, slot2) then
				if not slot1:isDrawOut() then
					slot0:onHandCardDrawOut(false, slot1)
				end

				slot5 = AutoChessEasy.getEmbaltteSprByPos(slot2, slot0)

				AutoChessEasy.showPointer(slot0, slot1:x(), slot1:y(), slot2, slot5, true)
				slot0:onPointTo(lushi.PointToType.event, slot5, {
					eventSpr = slot1
				})
			else
				slot0.pointSpr:hide()
			end

			if AutoChessEasy.isInPanel(slot2.x, slot2.y, nil, 0) then
				slot0:showSellingPrice(slot1.model:sellingPrice(), true)
			else
				slot0:showSellingPrice(slot1.model:sellingPrice())
			end
		end,
		onTouchEnded = function (slot0, slot1, slot2, slot3)
			slot0:showSellingPrice()

			slot1.isMoveInit = nil

			if slot3 then
				slot0:onHandCardDrawOut(slot1:isDrawOut(), slot1)

				return
			end

			slot0.pointSpr:hide()
			slot0.pointHeadSpr:hide()
			slot0.pointTailSpr:hide()
			slot0:onPointEnd(lushi.PointToType.event)

			slot4 = AutoChessEasy.getEmbaltteSprByPos(slot2, slot0)

			if slot0:getDrawOutId() == slot1.model.id then
				slot0:onHandCardDrawOut(true, slot1)
			end

			if slot4 then
				slot0:handleOperation(lushi.OperateTable.eventCardMove, slot1.model.id, slot4.id)

				slot0.drawOutId = nil
			elseif AutoChessEasy.isInPanel(slot2.x, slot2.y, nil, 0) then
				slot0:handleOperation(lushi.OperateTable.saleCard, slot1.model.id)
			else
				slot1:resetSpriteState()
			end
		end
	},
	direct = {
		onTouchBegan = function (slot0, slot1, slot2)
			slot1.isMoveInit = false
		end,
		onTouchMoved = function ()
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
		end,
		onTouchEnded = function (slot0, slot1, slot2, slot3)
			slot0:showSellingPrice()

			slot1.isMoveInit = nil

			if slot3 then
				slot0:onHandCardDrawOut(slot1:isDrawOut(), slot1)

				return
			end

			if slot0:getDrawOutId() then
				return
			end

			slot1.holdingHaloVisible:set(nil, "move", true)
			slot1:onHoldingHalo()

			if AutoChessEasy.isInPanel(slot2.x, slot2.y, lushi.ObjectReadyState.embattle) then
				slot0:handleOperation(lushi.OperateTable.eventCardMove, slot1.model.id)
			elseif AutoChessEasy.isInPanel(slot2.x, slot2.y, nil, 0) then
				slot0:handleOperation(lushi.OperateTable.saleCard, slot1.model.id)
			else
				slot1:resetSpriteState()
			end
		end
	}
}

function EventSprite.ctor(slot0, slot1, slot2, slot3)
	AutoChessSprite.ctor(slot0, slot1, slot2, slot3)

	slot0.StateFuncMap = clone(EventSprite.StateFuncMap)

	if slot0.model:isSelectTarget() then
		uv5 = "AutoChessSprite"
		slot0.StateFuncMap.inhand = slot5.select
	else
		uv5 = "AutoChessSprite"
		slot0.StateFuncMap.inhand = slot5.direct
	end
end

function EventSprite.setCardData(slot0)
end

function EventSprite.updateUnit(slot0)
	AutoChessEasy.updateEventPanel(slot0, slot0.model)
end

EventSprite.StateFuncMap = {
	none = {},
	inhand = {},
	inembattle = {},
	shop = AutoChessEasy.shopFunc
}
