slot0 = cc.Node
slot1 = nodetools.get
slot2 = nodetools.multiget

function slot0.get()
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

function slot0.multiget()
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

function slot0.size(slot0, slot1, slot2)
	if slot1 == nil then
		return slot0:getContentSize()
	end

	if slot2 then
		slot0:setContentSize(slot1, slot2)
	else
		slot0:setContentSize(slot1)
	end

	return slot0
end

function slot0.width(slot0, slot1)
	slot2 = slot0:getContentSize()

	if slot1 == nil then
		return slot2.width
	end

	slot0:setContentSize(slot1, slot2.height)

	return slot0
end

function slot0.height(slot0, slot1)
	slot2 = slot0:getContentSize()

	if slot1 == nil then
		return slot2.height
	end

	slot0:setContentSize(slot2.width, slot1)

	return slot0
end

function slot0.parent(slot0, slot1)
	if slot1 == nil then
		return slot0:getParent()
	else
		slot0:setParent(slot1)

		return slot0
	end
end

function slot0.tag(slot0, slot1)
	if slot1 == nil then
		return slot0:getTag()
	else
		slot0:setTag(slot1)

		return slot0
	end
end

function slot0.name(slot0, slot1)
	if slot1 == nil then
		return slot0:getName()
	else
		slot0:setName(slot1)

		return slot0
	end
end

function slot0.xy(slot0, slot1, slot2)
	if slot1 == nil then
		return slot0:getPosition()
	end

	if slot2 then
		slot0:setPosition(slot1, slot2)
	else
		slot0:setPosition(slot1)
	end

	return slot0
end

function slot0.x(slot0, slot1)
	if slot1 == nil then
		return slot0:getPositionX()
	else
		slot0:setPositionX(slot1)

		return slot0
	end
end

function slot0.y(slot0, slot1)
	if slot1 == nil then
		return slot0:getPositionY()
	else
		slot0:setPositionY(slot1)

		return slot0
	end
end

function slot0.z(slot0, slot1)
	if slot1 == nil then
		return slot0:getLocalZOrder()
	else
		slot0:setLocalZOrder(slot1)

		return slot0
	end
end

function slot0.scale(slot0, slot1, slot2)
	if slot1 == nil then
		return slot0:getScale()
	end

	if slot2 then
		slot0:setScale(slot1, slot2)
	else
		slot0:setScale(slot1)
	end

	return slot0
end

function slot0.scaleX(slot0, slot1)
	if slot1 == nil then
		return slot0:getScaleX()
	else
		slot0:setScaleX(slot1)

		return slot0
	end
end

function slot0.scaleY(slot0, slot1)
	if slot1 == nil then
		return slot0:getScaleY()
	else
		slot0:setScaleY(slot1)

		return slot0
	end
end

function slot0.globalZ(slot0, slot1)
	if slot1 == nil then
		return slot0:getGlobalZOrder()
	else
		slot0:setGlobalZOrder(slot1)

		return slot0
	end
end

function slot0.anchorPoint(slot0, slot1, slot2)
	if slot1 == nil then
		return slot0:getAnchorPoint()
	end

	if slot2 then
		slot0:setAnchorPoint(slot1, slot2)
	else
		slot0:setAnchorPoint(slot1)
	end

	return slot0
end

function slot0.opacity(slot0, slot1)
	if slot1 == nil then
		return slot0:getOpacity()
	else
		slot0:setOpacity(slot1)

		return slot0
	end
end

function slot0.color(slot0, slot1)
	if slot1 == nil then
		return slot0:getColor()
	else
		slot0:setColor(slot1)

		return slot0
	end
end

function slot0.visible(slot0, slot1)
	if slot1 == nil then
		return slot0:isVisible()
	else
		slot0:setVisible(slot1)

		return slot0
	end
end

function slot0.text(slot0, slot1)
	if slot1 == nil then
		return slot0:getString()
	else
		slot0:setString(slot1)

		return slot0
	end
end

function slot0.box(slot0, slot1)
	if v == nil then
		return slot0:getBoundingBox()
	else
		slot0:setBoundingBox(slot1)

		return slot0
	end
end

function slot0.alignCenter(slot0, slot1)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))

	return slot0:move(slot1.width / 2, slot1.height / 2)
end

function slot0.listenIdler(slot0, slot1, slot2)
	slot3 = slot1

	if type(slot1) == "string" then
		slot3 = slot0[slot1]
	end

	if slot3 == nil then
		return
	end

	slot4 = slot3:addListener(function ()
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
	slot5 = nil
	slot5 = slot0:onNodeEvent("exit", function (...)
		uv0 = "remove"
		slot0 = slot0.remove

		slot0(slot0)

		uv0 = "detach"

		slot0:detach()
	end)
end
