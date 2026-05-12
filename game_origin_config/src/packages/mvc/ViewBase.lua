slot0 = 6
slot1 = 0
slot2 = class("ViewBase", cc.Node)
slot3 = cclass("loading", cc.Node)

function slot4(slot0, slot1, ...)
	if DEBUG < 2 then
		return
	end

	if tostring(slot1):match("ccui.") == nil then
		printDebug(slot0, slot2, ...)
	end
end

function slot5(slot0)
	return getCallTrace(slot0, function (slot0)
		return slot0.source:find("/app/views/")
	end)
end

function slot2.ctor(slot0, slot1, slot2, slot3)
	uv4 = "ctor"

	slot4.ctor(slot0)

	slot0.app_ = slot1
	slot0.parent_ = slot2
	slot0.inited_ = 0

	if device.platform == "windows" then
		uv4 = "app_"
		slot0.from_ = slot4().desc
	end

	if slot3 then
		for slot7, slot8 in pairs(slot3) do
			if type(slot8) ~= "table" or slot8.__handler ~= true then
				error(string.format("%s is not handler, %s, please use ViewBase:createHandler", slot7, slot8))
			end

			slot0[slot7] = slot8
		end
	end

	if slot0.__class and rawget(slot0.__class, "RESOURCE_FILENAME") then
		slot0:createResourceNode(slot4)
	end

	slot5 = slot0.__class and rawget(slot0.__class, "RESOURCE_BINDING")

	if slot4 and slot5 then
		slot0.deferBinds_ = {}

		slot0:createResourceBinding(slot5)
	end

	slot0:enableNodeEvents()

	if slot0.onUpdate then
		slot0:enableUpdate()
	end
end

function slot2.init(slot0, ...)
	if slot0.parent_ and slot0.parent_.rebuiltIniting_ and not slot0.rebuiltIniting_ then
		slot0.initArgs_ = functools.args(...)
		slot0.parent_.rebuilt_[slot0] = true

		return slot0:beginRebuild()
	end

	slot0.inited_ = 1

	idlersystem.onViewBaseCreateBegin(slot0)

	slot0.initArgs_ = functools.args(...)

	if device.platform == "windows" then
		for slot4 = 1, slot0.initArgs_:size() do
			if type(slot0.initArgs_:at(slot4)) ~= "table" or slot5.__handler ~= true then
				assert(not isIdler(slot5), "idler could not be onCreate's arg, it will be lost when ViewBase rebuild, use ViewBase:createHandler reimplement")
				assert(type(slot5) ~= "function", "function could not be onCreate's arg, it will be problem when ViewBase rebuild, use ViewBase:createHandler replace")
			end
		end
	end

	slot0:onCreate_(...)

	slot0.inited_ = 4

	if slot0.rebuilding_ then
		slot0:onRebuild(slot0.parent_)
	end

	slot0.inited_ = 5
	slot1 = idlersystem.onViewBaseCreateEnd

	slot1(slot0)

	uv1 = "parent_"
	slot0.inited_ = slot1

	return slot0
end

function slot2.isRebuilding(slot0)
	return slot0.rebuilding_
end

function slot2.beRebuilding(slot0)
	if slot0:isRebuilding() then
		return true
	end

	if slot0.parent_ and slot0.parent_.rebuiltIniting_ and not slot0.rebuiltIniting_ and not slot0.parent_.rebuilt_[slot0] then
		return true
	end

	return false
end

function slot2.beginRebuild(slot0)
	slot0.rebuilding_ = true
	slot0.rebuilt_ = {}
	slot0.rebuiltIniting_ = true

	slot0:ctor(slot0.app_, slot0.parent_)

	slot1, slot2 = xpcall(function ()
		uv0 = "init"
		uv2 = "init"

		slot0:init(slot2.initArgs_:unpack())
	end, function (...)
		uv0 = "rebuiltIniting_"
		slot0.rebuiltIniting_ = false

		__G__TRACKBACK__(...)
	end)
	slot0.rebuiltIniting_ = false

	if not slot1 then
		printError("beginRebuild error %s %s", slot1, slot2)

		slot0.rebuilding_ = false

		return
	end

	for slot6, slot7 in pairs(slot0:getChildren()) do
		if slot7.beginRebuild and not slot0.rebuilt_[slot7] then
			slot0.rebuilt_[slot7] = true

			slot7:beginRebuild()
		end
	end

	return slot0
end

function slot2.endRebuild(slot0)
	for slot4, slot5 in pairs(slot0:getChildren()) do
		if slot5.endRebuild then
			slot5:endRebuild()
		end
	end

	slot0.rebuilding_ = nil
	slot0.rebuilt_ = nil
	slot0.rebuiltIniting_ = nil

	return slot0
end

function slot2.tearDown(slot0)
	if slot0.resourceNode_ then
		slot0.resourceNode_:removeSelf()

		slot0.resourceNode_ = nil
	end

	for slot4, slot5 in pairs(slot0:getChildren()) do
		if slot5.tearDown then
			slot5:tearDown()
		else
			slot5:removeSelf()
		end
	end
end

function slot2.getApp(slot0)
	return slot0.app_
end

function slot2.getResourceNode(slot0, slot1)
	if slot1 then
		return nodetools.get(slot0.resourceNode_, slot1)
	else
		return slot0.resourceNode_
	end
end

function slot2.createHandler(slot0, slot1, ...)
	if type(slot0[slot1]) == "function" then
		assert(type(slot0.__class[slot1]) == "function", "ViewBase:createHandler() - not such method in class")

		slot4 = functools.args(...)

		return functools.tablefunc({
			__handler = true
		}, function (slot0, ...)
			uv2 = "tolua"

			if tolua.isnull(slot2) then
				return
			end

			uv1 = "tolua"
			uv2 = "isnull"
			slot2 = assert

			slot2(type(slot1.__class[slot2]) == "function", "ViewBase:createHandler() - not such method in class")

			uv2 = "__class"

			if slot2:size() == 0 then
				uv3 = "tolua"

				return slot1(slot3, ...)
			else
				uv2 = "__class"
				uv4 = "tolua"

				return slot1(slot4, (slot2 + functools.args(...)):unpack())
			end
		end)
	else
		return functools.tablefunc({
			__handler = true
		}, function ()
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
end

function slot2.createResourceNode(slot0, slot1)
	if slot0.resourceNode_ then
		slot0.resourceNode_:removeSelf()

		slot0.resourceNode_ = nil
	end

	slot0.resource_ = slot1
	slot0.resourceNode_ = cache.createWidget(slot1)

	slot0:addChild(slot0.resourceNode_)
end

function slot2.createResourceBinding(slot0, slot1)
	assert(slot0.resourceNode_, "ViewBase:createResourceBinding() - not load resource node")
	bindUI(slot0, slot0.resourceNode_, slot1)
end

function slot2.deferUntilCreated(slot0, slot1)
	if slot0.deferBinds_ == nil then
		return slot1()
	end

	return table.insert(slot0.deferBinds_, slot1)
end

function slot2.enableUpdate(slot0)
	if slot0.updating_ then
		return
	end

	slot0.updating_ = true

	slot0:scheduleUpdate(function (...)
		uv0 = "onUpdate_"

		return slot0:onUpdate_(...)
	end)
end

function slot2.disableUpdate(slot0)
	slot0.updating_ = false

	slot0:unscheduleUpdate()
end

function slot2.isUpdateEnabled(slot0)
	return slot0.updating_ or false
end

function slot2.onCreate_()
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

function slot2.onUpdate_(slot0, slot1)
	if slot0.updating_ and slot0.onUpdate then
		return slot0:onUpdate(slot1)
	end
end

function slot2.assertInited(slot0)
	slot1 = nil

	if slot0.inited_ == 0 then
		slot1 = string.format("%s(%s), if you want removeSelf in onCreate, plz try performWithDelay or you not init() when create", tj.type(slot0), slot0:name())
	else
		uv3 = "inited_"

		if slot0.inited_ < slot3 then
			slot1 = string.format("%s(%s), may be error in init(), it would cause next other error, inited=%d", tj.type(slot0), slot0:name(), slot0.inited_)
		end
	end

	if slot1 then
		performWithDelay(gGameUI.scene, function ()
			uv1 = "errorInWindows"

			errorInWindows(slot1)
		end, 0)
	end
end

function slot2.onExit(slot0)
	uv1 = "ViewBase:onExit %s"

	slot1("ViewBase:onExit %s", slot0)
	slot0:assertInited()
	slot0.app_.ui:delViewDelayCall(slot0)
	slot0:disableUpdate()

	if #table.keys(cc.components(slot0)) > 0 then
		cc.unbind(slot0, unpack(slot1))
	end

	return cc.Node.onExit(slot0)
end

function slot2.onCleanup(slot0)
	uv1 = "ViewBase:onCleanup %s %s %s"

	slot1("ViewBase:onCleanup %s %s %s", slot0, slot0.__inject, slot0:getName())
	idlersystem.onViewBaseCleanup(slot0)

	return cc.Node.onCleanup(slot0)
end

function slot2.onClose(slot0)
	uv1 = "ViewBase:onClose %s"

	slot1("ViewBase:onClose %s", slot0)
	slot0:delayCallOnExit()
	slot0:removeSelf()
end

function slot2.onRebuild(slot0, slot1)
end

function slot2.onBeforeChildViewCreate(slot0, slot1, slot2)
	if not slot0.rebuilding_ then
		return
	end

	if slot0:getChildByName(slot1) then
		if not slot0.rebuilt_[slot3] then
			slot3:ctor(slot0.app_, slot0, slot2)
		end

		slot0.rebuilt_[slot3] = true
	end

	return slot3
end

function slot2.onStackHide(slot0, slot1)
	if slot0.stackShows_ ~= nil then
		return
	end

	slot1 = slot1 or {}
	slot0.stackShows_ = {}

	for slot5, slot6 in pairs(slot0:getChildren()) do
		if slot6:isVisible() then
			slot0.stackShows_[slot6] = true
		end

		if not slot1[slot6] then
			slot6:hide()
		end
	end
end

function slot2.onStackShow(slot0)
	if slot0.stackShows_ == nil then
		return
	end

	slot0.stackShows_ = nil

	for slot5, slot6 in pairs(slot0:getChildren()) do
		if slot0.stackShows_[slot6] then
			slot6:show()
		end
	end
end

function slot2.addCallbackOnExit(slot0, slot1, slot2)
	if slot1 == nil then
		return slot0
	end

	assert(slot0._cbsOnExit, string.format("%s ViewBase add callback after exited", tostring(slot0)))

	if slot2 then
		table.insert(slot0._cbsOnExit, 1, slot1)
	else
		table.insert(slot0._cbsOnExit, slot1)
	end

	return slot0
end

function slot2.delayCallOnExit(slot0)
	slot0._cbsOnExit = nil

	if slot0._cbsOnExit then
		if next(slot1) then
			performWithDelay(gGameUI.scene, function ()
				uv1 = "ipairs"

				for slot3, slot4 in ipairs(slot1) do
					slot4()
				end
			end, 0)
		end
	else
		errorInWindows("ViewBase delayCallOnExit be call more then once or onCreate not be call")
	end
end

function slot2.bindEasy(slot0, slot1)
	slot2 = slot1

	if type(slot1) == "string" then
		slot2 = nodetools.get(slot0.resourceNode_, path)
	end

	if slot2 == nil then
		return
	end

	return functools.chaincall(bind, slot0, slot2)
end

function slot2.nodeListenIdler(slot0, slot1, slot2, slot3)
	slot4 = slot1

	if type(slot1) == "string" then
		slot4 = nodetools.get(slot0.resourceNode_, path)
	end

	if slot4 == nil then
		return
	end

	slot5 = slot2

	if type(slot2) == "string" then
		slot5 = slot0[slot2]
	end

	if slot5 == nil then
		return
	end

	return slot4:listenIdler(slot5, slot3)
end

function slot2.safeCall(slot0, slot1, ...)
	if tolua.isnull(slot0) then
		return
	end

	if slot0[slot1] == nil then
		return
	end

	return slot2(slot0, ...)
end

for slot10, slot11 in ipairs({
	"schedule",
	"asyncload",
	"message"
}) do
	slot12 = string.caption(slot11)

	slot2[string.format("enable%s", slot12)] = function (slot0)
		slot2 = slot0
		uv2 = "cc"

		if not cc.components(slot2)[slot2] then
			uv4 = "cc"

			cc.bind(slot0, slot4)
		end

		return slot0
	end

	slot2[string.format("disable%s", slot12)] = function (slot0)
		slot2 = slot0
		uv2 = "cc"

		if cc.components(slot2)[slot2] then
			uv4 = "cc"

			cc.unbind(slot0, slot4)
		end

		return slot0
	end

	slot2[string.format("is%sEnabled", slot12)] = function (slot0)
		slot2 = slot0
		uv2 = "cc"

		return cc.components(slot2)[slot2] ~= nil
	end
end

return slot2
