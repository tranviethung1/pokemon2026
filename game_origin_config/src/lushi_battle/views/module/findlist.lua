slot0 = class("FindList", battleModule.CBase)
slot1 = 300

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.findList = slot0.parent.findList
	slot0.sprArrow = slot0.findList:get("sprArrow")
	slot2 = rich.createWithWidth("#C0xFFC843##Pfont/youmi1.ttf##LOC0x363136##L00100000##LOS5#发现一张牌", 72, nil, 380):addTo(slot0.findList, 1):xy(slot0.findList:width() / 2, slot0.findList:height() / 2 + 520)
	slot0.cards = {}
	slot0.isActive = false
end

function slot0.onShowFindList(slot0, slot1)
	if slot1 then
		slot0.isActive = true

		slot0:initCards()
	else
		slot0.isActive = false

		slot0:clearAll()
	end

	slot0.findList:setVisible(slot1)
end

function slot0.createSpr(slot0, slot1)
	slot2 = FindListItem.new(slot0.parent, slot1, tostring(slot1) .. "list")

	slot2:addTo(slot0.findList)
	slot2:init()
	slot2:onAddToScene()

	return slot2
end

function slot0.initCards(slot0)
	for slot5, slot6 in ipairs(slot0.parent:getSceneModel().findCards) do
		table.insert(slot0.cards, slot0:createSpr(slot6))
	end

	slot0:updatePos()
end

function slot0.updatePos(slot0)
	slot1 = slot0.findList:width() / 2 - 480
	slot2 = slot0.findList:height() / 2 + 110

	for slot7, slot8 in ipairs(slot0.cards) do
		function ()
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
		end(slot8)
	end
end

function slot0.clearAll(slot0)
	for slot4, slot5 in ipairs(slot0.cards) do
		slot5:sceneDelObj(slot0.parent.deleteObjLayer)
	end

	slot0.cards = {}

	slot0.parent:clearDeleteObjLayer()
end

function slot0.onFindListItem(slot0, slot1)
	if not slot0.isActive then
		return
	end

	slot0.parent:handleOperation(lushi.OperateTable.findCardConfirm, slot1.model.seat)
	slot0:onShowFindList(false)
end

return slot0
