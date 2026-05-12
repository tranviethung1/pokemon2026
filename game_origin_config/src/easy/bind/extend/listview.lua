slot0 = 2010231611
slot1 = require("easy.bind.helper")
slot2 = class("listview", cc.load("mvc").ViewBase)
slot2.defaultProps = {
	preloadBottom = false,
	addLimit = false,
	backupCached = false
}

function slot3(slot0)
	if isIdler(slot0) then
		return slot0, slot0:get_()
	end

	return nil, slot0
end

function slot4(slot0, slot1)
	if not slot0 then
		return
	end

	if false and slot0.copyProperties then
		slot0:copyProperties(slot1)
	else
		slot0:xy(slot1:x(), slot1:y())
		slot0:scale(slot1:scaleX(), slot1:scaleY())
		slot0:visible(slot1:visible())
	end

	for slot5, slot6 in pairs(slot1:getChildren()) do
		uv7 = "copyProperties"

		slot7(slot0:get(slot6:name()), slot6)
	end
end

function slot5(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot3, slot4 = nil

	if slot0:parent() then
		slot3, slot4 = slot0:xy()
	end

	uv5 = "parent"

	slot5(slot0, slot1)

	if slot2 then
		slot0:xy(slot3, slot4):show()
	end
end

function slot2.filterSortData_(slot0)
	slot1 = slot0.data
	slot2 = slot0.dataFilter
	slot3 = slot0.dataOrderCmp

	if slot0.dataFilterGen then
		slot0.dataFilter = slot0.dataFilterGen()
	end

	if slot0.dataOrderCmpGen then
		slot0.dataOrderCmp = slot0.dataOrderCmpGen()
	end

	if slot2 then
		slot0.data = itertools.filter(slot0.dataSource_, function (slot0, slot1)
			if isIdler(slot1) then
				slot1 = slot1:get_()
			end

			uv2 = "isIdler"

			return slot2(slot0, slot1)
		end)
	end

	if slot3 then
		slot0.orderKeys_ = itertools.keys(slot1)

		table.sort(slot0.orderKeys_, function (slot0, slot1)
			uv2 = "isIdler"
			uv3 = "isIdler"
			slot3 = slot3[slot1]

			if isIdler(slot2[slot0]) then
				slot2 = slot2:get_()
			end

			if isIdler(slot3) then
				slot3 = slot3:get_()
			end

			uv4 = "get_"

			return slot4(slot2, slot3)
		end)

		slot0.keyHash_ = arraytools.hash(slot0.orderKeys_, true)
	else
		slot0.orderKeys_ = itertools.keys(slot1)

		table.sort(slot0.orderKeys_)

		slot0.keyHash_ = arraytools.hash(slot0.orderKeys_, true)
	end

	slot0.dirtySort_ = false
end

function slot2.backupOrCleanItems_(slot0)
	if not slot0.backupCached then
		for slot4, slot5 in pairs(slot0.itemNodes_) do
			if slot5.listenerKey_ then
				slot5.listenerKey_:detach()

				slot5.listenerKey_ = nil
			end

			slot5.idler_ = nil
		end

		slot0.itemNodes_ = {}

		return
	end

	slot0.backupItemNodes_ = slot0.backupItemNodes_ or {}

	for slot4, slot5 in pairs(slot0.itemNodes_) do
		slot5:retain()

		if slot0.backupItemNodes_[slot4] and slot6 ~= slot5 then
			if slot6.listenerKey_ then
				slot6.listenerKey_:detach()

				slot6.listenerKey_ = nil
			end

			slot6.idler_ = nil

			slot6:autorelease()
			printWarn("duplicated key %s in listview %s %s", slot4, slot6, slot5)
		end

		slot0.backupItemNodes_[slot4] = slot5
	end

	slot0.itemNodes_ = {}
end

function slot2.cleanBackupItems_(slot0)
	if slot0.backupItemNodes_ then
		for slot4, slot5 in pairs(slot0.backupItemNodes_) do
			if slot5.listenerKey_ then
				slot5.listenerKey_:detach()

				slot5.listenerKey_ = nil
			end

			slot5.idler_ = nil

			slot5:autorelease()
			tolua.setpeer(slot5, nil)
		end

		slot0.backupItemNodes_ = nil
	end
end

function slot2.forceUpdate(slot0, slot1)
	if slot1 then
		if slot0.preloadCenter then
			slot0.preloadCenter_ = isIdler(slot0.preloadCenter) and slot0.preloadCenter:read() or slot0.preloadCenter
		else
			slot0:updatePreloadCenterIndex()
		end
	else
		slot0.preloadCenter_ = slot0.orderKeys_[1]
		slot0.preloadCenterIndex = nil
	end

	slot0:buildExtend()
end

function slot2.filterSortItems(slot0, slot1)
	if slot1 == nil then
		slot1 = true
	end

	slot0:filterSortData_()

	if itertools.equal(slot0.orderKeys_, slot0.orderKeys_) then
		return
	end

	slot0:forceUpdate(slot1)
end

function slot2.initExtend(slot0, slot1)
	slot0.params = slot1

	if slot0.asyncPreload then
		slot0.enterCount = slot0.asyncPreload * 2

		slot0:enableAsyncload()

		if not slot0.disableOnScroll then
			if slot0.addLimit then
				slot2 = slot0:getDirection()
				slot3 = slot0:getInnerContainer()
				slot4 = slot0:getContentSize()

				slot0:onScroll(function (slot0)
					uv1 = "getInnerContainerSize"
					slot2 = slot1
					slot1 = slot1.getInnerContainerSize(slot2)
					uv2 = "ccui"

					if slot2 == ccui.ListViewDirection.horizontal then
						uv2 = "getInnerContainerSize"
						slot3 = slot2
						uv3 = "ListViewDirection"
						uv5 = "horizontal"

						if slot2.getInnerContainerSize(slot3).width - slot5.width + slot3:getPositionX() < 100 or slot0.name == "SCROLL_TO_LEFT" then
							uv5 = "getInnerContainerSize"
							uv6 = "getInnerContainerSize"
							uv7 = "getInnerContainerSize"
							slot5.enterCount = slot6.enterCount + slot7.asyncPreload * 2
							uv5 = "getInnerContainerSize"
							slot5 = slot5.resumeFor

							slot5(slot5)

							uv5 = "getInnerContainerSize"

							slot5:quickFor()
						end
					else
						uv2 = "ListViewDirection"

						if slot2:getPositionY() > -100 or slot0.name == "SCROLL_TO_TOP" then
							uv3 = "getInnerContainerSize"
							uv4 = "getInnerContainerSize"
							uv5 = "getInnerContainerSize"
							slot3.enterCount = slot4.enterCount + slot5.asyncPreload * 2
							uv3 = "getInnerContainerSize"
							slot3 = slot3.resumeFor

							slot3(slot3)

							uv3 = "getInnerContainerSize"

							slot3:quickFor()
						end
					end
				end)
			else
				slot0:onScroll(function (slot0)
					if slot0.name == "SCROLL_TO_TOP" or slot0.name == "SCROLL_TO_BOTTOM" or slot0.name == "SCROLL_TO_LEFT" or slot0.name == "SCROLL_TO_RIGHT" then
						uv1 = "name"

						slot1:quickFor()
					end
				end)
			end
		end
	end

	if slot0.preloadCenter then
		slot0.preloadCenter_ = isIdler(slot0.preloadCenter) and slot0.preloadCenter:read() or slot0.preloadCenter
	end

	slot0.containerSize = slot0:getContentSize()

	slot0:setRenderHint(1)

	slot0.itemNodes_ = {}
	slot0.backupItemNodes_ = nil
	slot2 = false
	slot0.dirtySort_ = slot2
	uv2 = "params"
	slot2, slot3, slot4 = slot2.dataOrIdler(slot0.data)
	slot0.dataSource_ = slot2
	slot0.data = slot2

	if slot4 then
		slot4:addListener(function (slot0, slot1)
			uv2 = "data"
			slot3 = slot1:get_()
			slot2.data = slot3
			uv2 = "data"
			uv3 = "data"
			slot2.dataSource_ = slot3.data

			if slot0.event == "init" then
				uv2 = "data"
				slot2 = slot2.cleanDirtyNodes_

				slot2(slot2)

				uv2 = "data"
				slot2 = slot2.buildExtend

				slot2(slot2)

				uv2 = "data"
				slot2.removeAllFlag_ = false
			elseif slot0.event == "remove_all" then
				uv2 = "data"
				slot2 = slot2.removeAllAndBackup

				slot2(slot2)

				uv2 = "data"
				slot2 = slot2.cleanDirtyNodes_

				slot2(slot2)

				uv2 = "data"
				slot2.dirtySort_ = true
				uv2 = "data"
				slot2.removeAllFlag_ = true
			elseif slot0.event == "add" then
				uv2 = "data"

				if not slot2.removeAllFlag_ then
					uv2 = "data"
					slot2.dirtySort_ = true
					uv2 = "data"

					if slot2.backupCached then
						uv2 = "data"

						slot2:filterSortItems()
					else
						uv2 = "data"

						slot2:makeItem(slot0.key, slot0.val, slot0.idler)
					end
				end
			elseif slot0.event == "remove" then
				uv2 = "data"

				if not slot2.removeAllFlag_ then
					uv2 = "data"
					slot2.dirtySort_ = true
					uv2 = "data"

					if slot2.backupCached then
						uv2 = "data"

						slot2:filterSortItems()
					else
						uv2 = "data"
						slot3 = slot0.key
						uv3 = "data"
						slot3.itemNodes_[slot0.key] = nil

						if slot2.itemNodes_[slot3] then
							if slot2.listenerKey_ then
								slot2.listenerKey_:detach()

								slot2.listenerKey_ = nil
							end

							uv3 = "data"
							uv5 = "data"

							slot3:removeItem(slot5:getIndex(slot2))
						end
					end
				end
			elseif slot0.event == "swap" then
				uv2 = "data"
				slot2.dirtySort_ = true
				uv2 = "data"
				slot3 = slot0.key1
				uv3 = "data"
				slot3 = slot3.itemNodes_[slot0.key2]

				if slot2.itemNodes_[slot3] and slot3 then
					slot4 = slot0.key2
					slot3.key_ = slot0.key1
					slot2.key_ = slot4
					uv4 = "data"
					slot4 = slot4.itemNodes_
					uv6 = "data"
					slot6 = slot6.itemNodes_
					slot6[slot0.key2] = slot2
					slot4[slot0.key1] = slot3
					uv4 = "data"
					uv6 = "data"
					slot7 = slot6
					uv7 = "data"

					slot4:swapItem(slot6.getIndex(slot7, slot2), slot7:getIndex(slot3))
				else
					printWarn("swap item no exist %d %d, %s %s", slot0.key1, slot0.key2, tostring(slot2), tostring(slot3))
				end
			elseif slot0.event == "update" then
				uv2 = "data"

				if slot2.itemNodes_[slot0.key] and slot2.listenerKey_ == nil then
					uv3 = "data"

					slot3:onItemUpdate(slot2, slot0.key, slot0.idler:get_())
				end
			elseif slot0.event == "refresh" then
				slot2 = nil

				if slot0.keys then
					slot2 = itertools.iter(pairs(slot0.keys))
				else
					uv3 = "data"

					if slot3.dirtySort_ then
						uv3 = "data"

						slot3:filterSortData_()
					end

					uv5 = "data"
					slot2 = itertools.iter(ipairs(slot5.orderKeys_))
				end

				itertools.each(slot2, function (slot0, slot1)
					uv2 = "itemNodes_"
					uv3 = "itemNodes_"
					uv4 = "itemNodes_"

					slot4:onItemUpdate(slot2.itemNodes_[slot1], slot1, slot3.data[slot1]:get_())
				end)
			end
		end)
	elseif slot3 then
		slot3:addListener(function (slot0)
			uv1 = "data"
			slot1.data = slot0
			uv1 = "data"
			slot1.dataSource_ = slot0
			uv1 = "data"

			slot1:buildExtend()
		end)
	else
		slot0:buildExtend()
	end

	return slot0
end

function slot2.buildExtend(slot0)
	slot0:setScrollBarEnabled(false)
	slot0:removeAllAndBackup()

	slot1 = slot0.filterSortData_

	slot1(slot0)

	uv1 = "setScrollBarEnabled"
	slot1, slot2 = slot1(slot0.margin)

	if slot2 then
		slot0:setItemsMargin(slot2)
	end

	if slot0.padding then
		slot3 = slot0.containerSize.width
		slot4 = slot0.containerSize.height

		if slot0:getDirection() == ccui.ListViewDirection.horizontal then
			slot3 = slot0.padding
		else
			slot4 = slot0.padding
		end

		slot5 = ccui.Layout:create():size(slot3, slot4)

		slot0:pushBackCustomItem(slot5:clone())
		slot0:pushBackCustomItem(slot5)
	end

	slot0.minPreloadIdx = nil

	if gGameUI.guideManager:isInGuiding() then
		slot0.itemAction = nil
	end

	slot0:onBeforeBuild()

	if slot0.asyncPreload then
		slot0:asyncFor(handler(slot0, "building"), nil, slot0.asyncPreload, handler(slot0, "resetItemAction"))
	else
		slot0:building()
		slot0:resetItemAction()
	end

	return slot0
end

function slot2.building(slot0)
	slot0.itemSize = slot0.itemSize or 999999
	slot1 = nil
	slot2 = slot0.data

	if slot0.preloadBottom then
		slot0.preloadCenterIndex = #slot0.orderKeys_
	end

	slot0.preloadCenterPos = slot0.preloadCenterIndex or slot0.keyHash_[slot0.preloadCenter_]

	if slot0.preloadCenterPos then
		slot4 = nil
		slot0.minPreloadIdx = slot4
		uv4 = "itemSize"
		slot1 = slot4.extendDataIter(function (slot0, slot1)
			uv2 = "minPreloadIdx"
			uv4 = "minPreloadIdx"
			slot4 = slot4.minPreloadIdx or math.huge
			slot3 = math.min(slot4, slot0)
			slot2.minPreloadIdx = slot3
			uv2 = "math"
			uv3 = "min"
			uv4 = "math"

			return slot2[slot0], slot3[slot4[slot0]]
		end, itertools.size(slot0.orderKeys_), slot0.preloadCenterPos)
	else
		if slot0:getDirection() == ccui.ListViewDirection.horizontal then
			slot0:jumpToLeft()
		else
			slot0:jumpToTop()
		end

		slot4 = 0

		function slot1()
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
	end

	slot0.preloadCenterIndex = nil
	slot0.preloadCenter_ = nil
	slot4 = slot0.preloadCenterIndexAdaptFirst_
	slot0.preloadCenterIndexAdaptFirst_ = nil
	slot5 = 0

	itertools.each(slot1, function ()
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
	end)
	slot0:refreshView()
	slot0:cleanBackupItems_()
	slot0:setShowCenterIndex(-1)
	slot0:onAfterBuild_()
end

function slot2.makeItem(slot0, slot1, slot2, slot3)
	if slot0.dirtySort_ then
		slot0:filterSortData_()
	end

	slot4, slot5 = nil

	if slot0.backupItemNodes_ and slot0.backupItemNodes_[slot1] then
		slot5 = slot0.item

		slot0.backupItemNodes_[slot1]:autorelease()

		slot0.backupItemNodes_[slot1] = nil
	else
		slot4 = slot0.item:clone()
	end

	slot4.key_ = slot1

	slot4:stopAllActions()

	if not slot0.keyHash_[slot1] then
		return slot4
	end

	slot6 = slot0.itemNodes_
	slot6[slot1] = slot4
	uv6 = "dirtySort_"

	slot6(slot4, slot5)

	if slot3 then
		if slot4.idler_ ~= slot3 then
			if slot4.listenerKey_ then
				slot4.listenerKey_:detach()
			end

			slot4.idler_ = slot3
			slot4.listenerKey_ = slot3:addListener(function (slot0, slot1, slot2)
				uv3 = "keyHash_"
				uv4 = "onItem_"

				if slot3.keyHash_[slot4] then
					uv3 = "keyHash_"
					uv5 = "keyHash_"
					uv6 = "onItem_"

					slot3:onItem_(slot5, slot6, slot0)
				end
			end, true)

			slot0:onItem_(slot4, slot1, slot3:get_())
		elseif slot0.itemAction and slot0.itemAction.isAction then
			slot0:onItem_(slot4, slot1, slot3:get_())
		else
			slot0:onItem_(slot4, slot1, slot2)
		end
	else
		slot0:onItem_(slot4, slot1, slot2)
	end

	if slot0.onItemClick then
		bind.touch(slot0, slot4, {
			methods = {
				ended = function ()
					uv0 = "setCurSelectedIndex"
					slot0 = slot0.setCurSelectedIndex
					uv2 = "setCurSelectedIndex"
					slot3 = slot2
					slot2 = slot2.getIndex
					uv4 = "getIndex"

					slot0(slot0, slot2(slot3, slot4))

					uv0 = "setCurSelectedIndex"
					uv2 = "getIndex"
					uv3 = "onItemClick"
					uv4 = "setCurSelectedIndex"

					return slot0:onItemClick(slot2, slot3, slot4)
				end
			}
		})
	end

	slot6 = slot0:onItemIndex(slot1, slot2)

	if slot0.padding then
		if (slot6 and slot6 + 1 or slot0:getChildrenCount() - 1) <= slot0:getChildrenCount() then
			slot0:insertCustomItem(slot4, slot7)
		end
	elseif slot6 then
		if slot6 <= slot0:getChildrenCount() then
			slot0:insertCustomItem(slot4, slot6)
		end
	else
		slot0:pushBackCustomItem(slot4)
	end

	return slot4:tag(slot6 or -1):show()
end

function slot2.onItemAction(slot0, slot1, slot2, slot3)
	if slot0.itemAction and slot0.itemAction.isAction then
		if not slot0.asyncPreload or slot2 <= slot0.asyncPreload then
			if slot0.asyncPreload then
				slot5 = math.min(#slot0.orderKeys_, slot0.asyncPreload)
			end

			if slot0.backupCached then
				slot5 = (not (slot0:getDirection() == ccui.ScrollViewDir.vertical) or math.min(slot5, math.ceil(slot0:height() / (slot0.item:height() + slot0:getItemsMargin())))) and math.min(slot5, math.ceil(slot0:width() / (slot0.item:width() + slot0:getItemsMargin())))
			end

			slot5 = math.max(slot5, 1)
			slot7 = slot2

			if slot0.preloadCenterPos then
				if slot0.preloadCenterPos - math.floor((slot5 - 1) / 2) + slot5 > #slot0.orderKeys_ then
					slot8 = #slot0.orderKeys_ - slot5 + 1
				end

				slot7 = cc.clampf(slot3 - math.max(slot8, 1) + 1, 1, slot5)
			end

			slot9 = slot0.itemAction.actionTime or 0.4
			slot10 = math.min(slot8.duration or 0.15, (slot8.durationLimit or 0.3) / slot5)
			slot1.listviewAction_ = true

			for slot15, slot16 in pairs(slot1:getChildren()) do
				slot17, slot18 = slot16:xy()

				if slot6 then
					slot16:y(slot18 - slot0:size().height + slot0.item:height())
				else
					slot16:x(slot17 + slot11.width + slot0.item:width())
				end

				uv22 = "itemAction"

				slot16:stopAllActionsByTag(slot22)

				slot23 = slot17
				uv23 = "itemAction"

				transition.executeSequence(slot16):delay((slot7 - 1) * slot10 + 0.01):easeBegin("EXPONENTIALOUT"):moveTo(slot9, slot23, slot18):easeEnd():func(function ()
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
				end):done():setTag(slot23)
			end
		elseif not slot0.itemAction.alwaysShow then
			slot0.itemAction = nil
		end
	end
end

function slot2.onBeforeBuild(slot0)
end

function slot2.onAfterBuild_(slot0)
	slot0:onAfterBuild()
end

function slot2.onAfterBuild(slot0)
end

function slot2.onItem(slot0, slot1, slot2, slot3)
end

function slot2.onItemUpdate(slot0, slot1, slot2, slot3)
	return slot0:onItem_(slot1, slot2, slot3)
end

function slot2.onItemIndex(slot0, slot1, slot2)
	if slot0.dirtySort_ then
		slot0:filterSortData_()
	end

	slot3 = slot0.keyHash_[slot1]

	if slot0.preloadCenterPos then
		return slot3 < slot0.preloadCenterPos and 0
	end

	return slot3 - 1
end

function slot2.getIdx(slot0, slot1)
	if slot0.dirtySort_ then
		slot0:filterSortData_()
	end

	slot2 = slot0.keyHash_[slot1]

	if slot0.params and slot0.params.row then
		slot2 = {
			row = slot0.params.row,
			col = slot1,
			k = (slot0.params.k or 0) + slot1
		}
	end

	return slot2
end

function slot2.onItemStopAllActions_(slot0, slot1)
	for slot5, slot6 in pairs(slot1:getChildren()) do
		uv9 = "pairs"

		slot6:stopAllActionsByTag(slot9)
	end
end

function slot2.onItem_(slot0, slot1, slot2, slot3)
	if tolua.isnull(slot1) then
		return
	end

	if slot1.listviewAction_ == true then
		slot1.listviewAction_ = false

		slot0:onItemStopAllActions_(slot1)
	end

	slot0.dirtyNodes_ = slot0.dirtyNodes_ or {}
	slot0.dirtyNodes_[slot1] = {
		slot2,
		slot3,
		(slot0.dirtyNodes_[slot1] and slot0.dirtyNodes_[slot1][3] or 0) + 1
	}

	if not (slot0.dirtyNodes_[slot1] ~= nil) then
		slot6 = slot1.retain

		slot6(slot1)

		uv6 = "tolua"

		slot6(slot1, slot0.item)
		slot0:onItem(slot1, slot2, slot3)
		gGameUI:addViewDelayCall(slot0, functools.partial(slot0.onDirtyUpdate, slot0))
	end
end

function slot2.removeAllAndBackup(slot0)
	if slot0.asyncPreload then
		slot0:overFor()
	end

	slot0:backupOrCleanItems_()
	slot0:removeAllItems()
end

function slot2.cleanDirtyNodes_(slot0)
	if slot0.dirtyNodes_ == nil then
		return
	end

	for slot4, slot5 in pairs(slot0.dirtyNodes_) do
		slot4:autorelease()
	end

	slot0.dirtyNodes_ = nil
end

function slot2.onDirtyUpdate(slot0)
	if slot0.dirtyNodes_ == nil then
		return
	end

	for slot4, slot5 in pairs(slot0.dirtyNodes_) do
		slot6, slot7, slot8 = unpack(slot5, 1, 3)

		if slot0.keyHash_[slot6] and slot8 > 1 then
			uv9 = "dirtyNodes_"

			slot9(slot4, slot0.item)
			slot0:onItem(slot4, slot6, slot7)
		end

		slot4:autorelease()
	end

	slot0.dirtyNodes_ = nil
end

function slot2.setItemAction(slot0, slot1)
	slot0.itemAction = slot1
end

function slot2.resetItemAction(slot0)
	if slot0.itemAction and not slot0.itemAction.alwaysShow then
		slot0.itemAction = nil
	end
end

function slot2.updatePreloadCenterIndex(slot0)
	slot0:refreshView()

	if slot0:getCenterItemInCurrentView() then
		slot0.preloadCenterIndex = slot0:getIndex(slot1) + 1 - (slot0.padding and 1 or 0)

		if slot0.minPreloadIdx then
			slot0.preloadCenterIndex = slot0.preloadCenterIndex + slot0.minPreloadIdx - 1
		end
	end
end

function slot2.updatePreloadCenterIndexAdaptFirst(slot0)
	slot0:updatePreloadCenterIndex()

	slot0.preloadCenterIndexAdaptFirst_ = true
end

return slot2
