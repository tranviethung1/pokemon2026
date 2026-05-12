slot0 = require("easy.bind.extend.listview")
slot1 = require("easy.bind.extend.inject")
slot2 = require("easy.bind.helper")
slot3 = class("sortMenus", cc.load("mvc").ViewBase)
slot4 = {
	RESOURCE_FILENAME = "common_sort_menus.json",
	RESOURCE_BINDING = {
		btn2 = "btn2",
		listBg = "listBg",
		item = "item",
		btn4 = "btn4",
		btn6 = "btn6",
		btn3 = "btn3",
		btn5 = "btn5",
		btn1 = "btn1",
		list = "list"
	}
}
slot3.defaultProps = {
	height = 80,
	btnHeight = 122,
	nowSelected = 1,
	btnType = 1,
	expandUp = false,
	btnWidth = 332,
	maxCount = 5,
	showLock = true,
	width = 308
}

function slot3.initExtend(slot0)
	slot2 = slot0.height
	slot0._width = slot0.width
	slot0.width = cc.Node.width
	slot0.height = cc.Node.height
	slot0.showSortList = slot0.showSortList or idler.new(false)
	slot0.menuClick = slot0.menuClick or idler.new(true)
	slot0.lock = slot0.locked or idler.new(0)
	uv5 = "width"
	slot3 = gGameUI:createSimpleView(slot5, slot0):init()

	slot3.item:size(slot1, slot2):hide()
	slot3.item:get("bg"):size(slot1, slot2)

	slot0.node = slot3

	for slot7 = 1, 6 do
		if slot7 ~= slot0.btnType then
			slot3["btn" .. slot7]:hide()
		end
	end

	setContentSizeOfAnchor(slot4, cc.size(slot0.btnWidth or slot1, slot0.btnHeight or slot2 + (({
		40,
		20,
		20,
		40,
		40,
		0
	})[slot0.btnType] or 40)))

	if slot0.btnType ~= 5 and slot0.btnType ~= 6 then
		text.addEffect(slot3["btn" .. slot0.btnType]:get("title"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			},
			color = slot0.btnType <= 3 and ui.COLORS.NORMAL.WHITE or ui.COLORS.NORMAL.RED
		})
	end

	slot4:get("img"):x(slot6 - 57 * (slot0.btnType == 2 and 0.9 or 1))
	bind.touch(slot3, slot4, {
		methods = {
			ended = function (slot0, slot1)
				uv2 = "showSortList"
				slot2 = slot2.showSortList
				slot2 = slot2.modify

				slot2(slot2, function (slot0)
					return true, not slot0
				end)

				uv2 = "showSortList"

				if slot2.btnTouch then
					uv2 = "showSortList"

					slot2.btnTouch(slot1)
				end
			end
		}
	})
	idlereasy.when(slot0.showSortList, function (slot0, slot1)
		uv2 = "btnType"

		if slot2.btnType ~= 6 then
			uv2 = "btnType"

			if slot2.expandUp then
				uv2 = "expandUp"

				slot2:get("img"):rotate(not slot1 and 0 or 180)
			else
				uv2 = "expandUp"

				slot2:get("img"):rotate(slot1 and 0 or 180)
			end
		end

		uv2 = "get"
		slot2 = slot2.list
		slot2 = slot2.visible

		slot2(slot2, slot1)

		uv2 = "get"

		slot2.listBg:visible(slot1)
	end)
	idlereasy.when(slot0.menuClick, function (slot0, slot1)
		uv2 = "setTouchEnabled"

		slot2:setTouchEnabled(slot1)
	end)

	if slot0.showSelected then
		slot0.showSelected = isIdler(slot0.showSelected) and slot0.showSelected or idler.new(slot0.showSelected)
	else
		slot0.showSelected = idler.new(1)
	end

	slot0.stateData = idlers.new()
	slot0.isFirst = true

	idlereasy.any({
		slot0.data,
		slot0.lock
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
	end):notify()

	slot11 = slot0.parent_
	slot15 = slot0.onItemClick
	slot14 = functools.partial(slot15, slot0)
	uv14 = "height"
	uv15 = "_width"
	uv19 = "cc"
	slot14 = slot14(slot15, slot11, slot3.list, slot0.__handlers, slot19.props(slot11, slot3.list, {
		data = slot0.stateData,
		item = slot3.item,
		onItem = functools.partial(slot0.onItem_, slot0),
		onItemClick = slot14
	}))
	slot14 = slot14.initExtend

	slot14(slot14)

	uv14 = "cc"

	slot14.callOrWhen(slot0.defaultTitle, function (slot0)
		uv1 = "text"

		slot1:text(slot0)
	end)
	slot0.showSelected:addListener(function (slot0, slot1)
		uv2 = "stateData"

		if slot2.stateData:atproxy(slot1) then
			uv2 = "stateData"
			slot2.stateData:atproxy(slot1).selected = false
		end

		uv2 = "stateData"

		if slot2.stateData:atproxy(slot0) then
			uv2 = "stateData"
			slot2 = slot2.stateData:atproxy(slot0)
			slot2.selected = true
			uv2 = "stateData"

			if not slot2.defaultTitle then
				uv2 = "atproxy"
				uv4 = "stateData"

				slot2:text(slot4.stateData:atproxy(slot0).name)
			end

			slot2 = nil
			uv3 = "stateData"

			if slot3.btnType ~= 2 then
				uv3 = "stateData"

				if slot3.btnWidth then
					uv3 = "stateData"

					if not (slot3.btnWidth / 2 - 30) then
						uv3 = "selected"
						slot2 = slot3 / 2 - 30
					end
				end
			else
				uv3 = "stateData"

				if slot3.btnWidth then
					uv3 = "stateData"

					if not (slot3.btnWidth / 2 - 20) then
						uv3 = "selected"
						slot2 = slot3 / 2 - 20
					end
				end
			end

			uv3 = "atproxy"

			slot3:x(slot2)

			if not matchLanguage({
				"cn",
				"tw"
			}) then
				uv4 = "atproxy"
				uv6 = "stateData"

				adapt.setTextScaleWithWidth(slot4, nil, slot6.btnWidth - 100)
			end
		end
	end)
	slot4:show()

	if slot0.onNode then
		slot0.onNode(slot3)
	end

	if slot0.titleAnchorPoint then
		slot5:setAnchorPoint(slot0.titleAnchorPoint)
	end

	slot0.isFirst = false

	return slot0
end

function slot3.onItem_(slot0, slot1, slot2, slot3, slot4)
	if slot0.btnType ~= 2 then
		slot2:get("title"):x(44)
	else
		slot5:x(10)
	end

	slot2:get("bg"):visible(slot4.selected)
	slot5:text(slot4.name)
	slot5:setTextColor(slot4.selected and ui.COLORS.NORMAL.WHITE or ui.COLORS.NORMAL.RED)

	slot7 = math.max(slot0._width - 308 + 230, 230)

	slot5:anchorPoint(0.5, 0.5)
	slot5:x(slot5:x() + slot7 / 2)
	adapt.setTextScaleWithWidth(slot5, nil, slot7)

	slot8 = slot2:get("lock")

	if slot4.lock then
		if slot8 then
			slot8:show()
		elseif slot0.showLock then
			adapt.oneLinePos(slot5, ccui.ImageView:create("common/btn/btn_lock.png"):align(cc.p(0.5, 0.5), 0, slot5:y()):addTo(slot2, 4, "lock"), cc.p(10, 0), "right")
		end
	elseif slot8 then
		slot8:hide()
	end

	if slot0.onItem then
		slot0:onItem(slot2, slot3, slot4)
	end
end

function slot3.lockData(slot0, slot1, slot2, slot3, slot4)
	slot6 = slot0.node["btn" .. slot0.btnType]
	slot9 = slot6:x() - slot3 * slot6:anchorPoint().x - 12
	slot10 = (math.min(slot0.maxCount, #slot1) - 1) * 10

	if not slot0.expandUp then
		slot5.listBg:size(slot3 + 24, slot4 * slot7 + 86 + slot10):anchorPoint(0, 1):xy(slot9, slot6:y() - slot6:size().height * slot8.y)
		slot5.list:size(slot3, slot4 * slot7 + slot10):anchorPoint(0, 1):xy(slot9 + 10, slot5.listBg:y() - 40)
	else
		slot5.listBg:size(slot3 + 24, slot4 * slot7 + 86 + slot10):anchorPoint(0, 0):xy(slot9, slot6:y() + slot6:size().height / 2)
		slot5.list:size(slot3, slot4 * slot7 + slot10):xy(slot9 + 10, slot5.listBg:y() + 46)
	end

	slot0.showSortList:set(false)

	slot11 = cc.clampf(slot0.showSelected:read(), 1, #slot1)

	for slot16, slot17 in ipairs(slot1) do
		-- Nothing
	end

	slot0.stateData:update({
		[slot16] = {
			name = slot17,
			lock = slot2 ~= 0 and slot2 <= slot16,
			selected = slot16 == slot11
		}
	})

	if not slot0.isFirst or slot11 ~= slot0.showSelected:read() then
		slot0.showSelected:set(slot11, true)
	end
end

function slot3.onItemClick(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.showSelected:read()

	if not slot4.lock then
		slot0.showSelected:set(slot3)
		slot0.showSortList:set(false)
	end

	slot0.btnClick(slot2, slot3, slot4, slot5)
end

return slot3
