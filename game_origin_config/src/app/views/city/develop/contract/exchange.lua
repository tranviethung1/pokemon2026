slot0 = 4
slot1 = {
	LEFT = 1,
	RIGHT = 2
}
slot2 = {
	1,
	2,
	5,
	6
}
slot3 = {
	3,
	4,
	7,
	8
}
slot4 = 290
slot5 = 225

function slot6(slot0, slot1, slot2, slot3)
	uv8 = "cfg"
	slot9 = slot3.cfg.pos.x or 0
	uv9 = "contractCfg"

	slot1:get("imgIcon"):texture(slot3.contractCfg.icon):xy(slot8 + slot9, slot9 + (slot4.pos.y or 0)):scale(1.5)
	slot1:get("imgBg"):texture(string.format("city/develop/contract/exchange/img_qyzz_%s.png", csv.contract.contract[slot4.contractCsvID].quality))
	slot1:get("imgType"):texture(string.format("city/develop/contract/log_type%s.png", csv.contract.contract[slot4.contractCsvID].type))
	slot1:get("imgType"):scale(1.2)
	adapt.setTextScaleWithWidth(slot1:get("name"), slot5.name, 320)
	cache.setShader(slot1, false, slot4.exchangeTimes <= slot3.count and "hsl_gray" or "normal")

	if slot4.redPoint == 1 then
		bind.extend(slot0, slot1, {
			class = "red_hint",
			props = {
				listenData = {
					id = slot4.contractCsvID
				},
				specialTag = {
					"isNewContract"
				},
				onNode = function (slot0)
					slot0:xy(380, 450)
				end
			}
		})
	end

	bind.click(slot0, slot1, {
		method = functools.partial(slot0.itemClick, slot1, slot0:getIdx(slot2), slot3)
	})
end

slot8 = class("ContractExchangeView", cc.load("mvc").ViewBase)
slot8.RESOURCE_FILENAME = "contract_exchange.json"
slot8.RESOURCE_BINDING = {
	listPanel = "listPanel",
	subList = "subList",
	item = "item",
	pageItem = "pageItem",
	mask = "mask",
	imgBg = "imgBg",
	tmpListPanel = "tmpListPanel",
	["listPanel.list1"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("leftDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function ()
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
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["listPanel.list2"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("rightDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function ()
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
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["tmpListPanel.list1"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("copyLeftDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function ()
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
		}
	},
	["tmpListPanel.list2"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("copyRightDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function ()
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
		}
	},
	btnLeft = {
		varname = "btnLeft",
		binds = {
			event = "touch",
			longtouch = false,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangePage(slot1, slot2, -2)
			end)
		}
	},
	btnRight = {
		varname = "btnRight",
		binds = {
			event = "touch",
			longtouch = false,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangePage(slot1, slot2, 2)
			end)
		}
	},
	pageList = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("pageDatas"),
				item = bindHelper.self("pageItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	}
}
slot8.RESOURCE_STYLES = {
	full = true
}

function slot8.onCreate(slot0)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "GAIN CONTRACT",
		title = gLanguageCsv.contractExchange
	})
	slot0:initModel()
	idlereasy.when(slot0.exchangeTimes, function ()
		uv0 = "updateDatas"
		slot0 = slot0.updateDatas

		slot0(slot0)

		uv0 = "updateDatas"
		slot0 = slot0.leftPage
		slot0 = slot0.notify

		slot0(slot0)

		uv0 = "updateDatas"

		slot0.rightPage:notify()
	end)
	idlereasy.when(slot0.leftPage, function (slot0, slot1)
		uv2 = "btnLeft"
		slot2 = slot2.btnLeft
		slot2 = slot2.visible
		slot4 = slot1 > 1

		slot2(slot2, slot4)

		uv2 = "btnLeft"
		uv4 = "visible"

		slot2:updatePageDatas(slot4.LEFT)
	end)
	idlereasy.when(slot0.rightPage, function (slot0, slot1)
		uv2 = "btnRight"
		slot2 = slot2.btnRight
		slot2 = slot2.visible
		uv4 = "btnRight"
		slot4 = slot1 < slot4.maxPage

		slot2(slot2, slot4)

		uv2 = "btnRight"
		uv4 = "visible"

		slot2:updatePageDatas(slot4.RIGHT)
	end)
	slot0:initSlideListener()
	idlereasy.when(slot0.curDir, function (slot0, slot1)
		uv2 = "btnLeft"
		slot2 = slot2.btnLeft
		slot3 = slot2
		slot2 = slot2.setTouchEnabled

		if slot1 ~= 0 then
			uv4 = "setTouchEnabled"

			if slot1 ~= slot4.LEFT then
				slot4 = false
			end
		else
			slot4 = true
		end

		slot2(slot3, slot4)

		uv2 = "btnLeft"
		slot2 = slot2.btnRight
		slot3 = slot2
		slot2 = slot2.setTouchEnabled

		if slot1 ~= 0 then
			uv4 = "setTouchEnabled"

			if slot1 ~= slot4.RIGHT then
				slot4 = false
			end
		else
			slot4 = true
		end

		slot2(slot3, slot4)
	end)
end

function slot8.initModel(slot0)
	slot0.exchangeTimes = gGameModel.role:getIdler("contract_books")
	slot0.copyLeftDatas = idlers.new()
	slot0.copyRightDatas = idlers.new()
	slot0.leftPage = idler.new(1)
	slot0.rightPage = idler.new(2)
	slot0.leftDatas = idlers.new()
	slot0.rightDatas = idlers.new()
	slot0.pageDatas = idlers.newWithMap({})
	slot0.maxPage = 1
	slot0.imgCount = 0
	slot0.bookActionCount = 0
	slot0.curDir = idler.new(0)
	slot0.runTime = 1
end

function slot8.updateDatas(slot0)
	slot1 = {}

	for slot6, slot7 in orderCsvPairs(csv.contract.activate_book) do
		table.insert(slot1, {
			id = slot6,
			contractCfg = dataEasy.getCfgByKey(slot7.contractCsvID),
			cfg = slot7,
			count = slot0.exchangeTimes:read()[slot6] or 0
		})
	end

	function slot5(slot0, slot1)
		if slot0.contractCfg.quality ~= slot1.contractCfg.quality then
			return slot1.contractCfg.quality < slot0.contractCfg.quality
		end

		return slot0.id < slot1.id
	end

	table.sort(slot1, slot5)

	slot0.allData = slot1
	uv5 = "exchangeTimes"
	slot0.maxPage = math.ceil(#slot1 / slot5)

	for slot7 = 1, math.ceil(slot0.maxPage / 2) do
	end

	slot0.pageDatas:update({
		[slot7] = {
			select = slot7 == slot0.rightPage:read() / 2
		}
	})
end

function slot8.updatePageDatas(slot0, slot1)
	uv2 = "LEFT"
	slot2 = slot1 == slot2.LEFT and slot0.leftPage:read() or slot0.rightPage:read()
	uv5 = "leftPage"
	uv5 = "leftPage"

	for slot7 = (slot2 - 1) * slot5 + 1, slot2 * slot5 do
		if slot0.allData[slot7] then
			table.insert({}, slot0.allData[slot7])
		end
	end

	uv4 = "LEFT"

	if slot1 == slot4.LEFT then
		slot0.leftDatas:update(slot3)
	else
		slot0.rightDatas:update(slot3)
	end

	if slot0.curDir:read() ~= 0 then
		slot4 = slot0.curDir
		slot5 = slot4
		uv5 = "LEFT"
		slot2 = slot4.read(slot5) == slot5.LEFT and slot0.leftPage:read() or slot0.rightPage:read()
	end

	for slot7 = 1, math.ceil(slot0.maxPage / 2) do
		slot0.pageDatas:atproxy(slot7).select = slot7 == math.ceil(slot2 / 2)
	end
end

function slot8.initSlideListener(slot0)
	uiEasy.addTouchOneByOne(slot0.mask, {
		ended = function (slot0, slot1, slot2)
			if math.abs(slot1) > 100 and math.abs(slot2) < math.abs(slot1) then
				uv3 = "math"
				slot4 = slot3
				slot3 = slot3.bookAction

				if slot1 > 0 then
					uv5 = "abs"

					if not slot5.LEFT then
						uv5 = "abs"
						slot5 = slot5.RIGHT
					end
				end

				slot3(slot4, slot5)
			end
		end
	})
end

function slot8.onChangePage(slot0, slot1, slot2, slot3)
	if slot2.name == "ended" then
		slot5 = slot0
		slot4 = slot0.bookAction

		if slot3 > 0 then
			uv6 = "name"

			if not slot6.RIGHT then
				uv6 = "name"
				slot6 = slot6.LEFT
			end
		end

		slot4(slot5, slot6)
	end
end

function slot8.createSprite(slot0, slot1, slot2)
	if slot1 and slot1 ~= -1 then
		slot3 = {}
		uv5 = "allData"
		uv5 = "allData"

		for slot7 = (slot1 - 1) * slot5 + 1, slot1 * slot5 do
			if slot0.allData[slot7] then
				table.insert(slot3, slot0.allData[slot7])
			end
		end

		slot0.copyLeftDatas:update(slot3)
	else
		slot0.copyLeftDatas:update({})
	end

	if slot2 and slot2 ~= -1 then
		slot3 = {}
		uv5 = "allData"
		uv5 = "allData"

		for slot7 = (slot2 - 1) * slot5 + 1, slot2 * slot5 do
			if slot0.allData[slot7] then
				table.insert(slot3, slot0.allData[slot7])
			end
		end

		slot0.copyRightDatas:update(slot3)
	else
		slot0.copyRightDatas:update({})
	end

	slot3 = 1
	slot4 = cc.utils:captureNodeSprite(slot0.tmpListPanel, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888, slot3, 0, 0)

	slot4:scale(1 / slot3)

	return slot4
end

function slot8.bookAction(slot0, slot1, slot2, slot3)
	if slot0.leftPage:read() <= 1 then
		uv4 = "leftPage"

		if slot1 == slot4.LEFT then
			return
		end
	end

	if slot0.maxPage <= slot0.rightPage:read() then
		uv4 = "leftPage"

		if slot1 == slot4.RIGHT and not slot3 then
			return
		end
	end

	if slot1 ~= slot0.curDir:read() and slot0.curDir:read() ~= 0 then
		return
	end

	gGameUI:disableTouchDispatch(nil, false)

	slot0.bookActionCount = slot0.bookActionCount + 1
	slot4 = slot0.imgCount
	slot0.imgCount = slot4
	uv4 = "leftPage"

	if slot1 == slot4.RIGHT then
		slot0.imgCount = slot0.imgCount - 1
	else
		slot0.imgCount = slot0.imgCount + 1
	end

	slot4 = slot0.imgCount
	slot5 = slot0.listPanel:get("bg"):box()
	slot6 = cc.NodeGrid:create(cc.rect(display.sizeInView.width / 2, display.sizeInView.height / 2 - slot5.height / 2, slot5.width / 2, slot5.height)):addTo(slot0.listPanel, 1000 + slot0.imgCount):xy(slot5.width / 2, 0)
	slot7 = 0.45

	function slot8()
		uv0 = "curDir"
		slot0 = slot0.curDir
		slot0 = slot0.set
		uv2 = "set"

		slot0(slot0, slot2.RIGHT)

		uv0 = "curDir"
		slot0 = slot0.rightPage
		slot1 = slot0
		uv1 = "curDir"
		slot1 = slot1.rightPage
		slot2 = slot1
		slot1 = slot1.read(slot2) + 2
		uv2 = "RIGHT"

		if slot2 then
			uv2 = "RIGHT"
			slot2 = slot2 * 2 > slot0.read(slot1) + 2
		end

		uv3 = "RIGHT"

		if slot3 then
			uv3 = "RIGHT"
			slot1 = slot3 * 2
		end

		uv3 = "rightPage"

		if not slot3 then
			uv3 = "curDir"

			slot3.rightPage:set(slot1, true)
		end

		slot3 = slot1 - 1
		uv4 = "RIGHT"

		if slot4 and slot2 then
			slot3 = -1
		end

		uv4 = "rightPage"

		if slot4 then
			uv3 = "rightPage"
		end

		uv4 = "curDir"
		slot4 = slot4:createSprite(slot3)
		slot5 = slot4:size()
		slot8 = cc.rect

		slot4:setTextureRect(slot8(0, 0, math.ceil(slot5.width / 2) + 10, slot5.height))

		uv8 = "read"

		slot4:addTo(slot8)
		slot4:setFlippedX(true)

		slot7 = slot4

		slot4.setPosition(slot7, cc.p(-10, -1))

		slot6 = slot0
		uv7 = "rightPage"

		if slot7 then
			slot6 = -1
		end

		uv7 = "curDir"
		slot7 = slot7:createSprite(nil, slot6)
		slot10 = cc.rect

		slot7:setTextureRect(slot10(math.floor(slot5.width / 2) - 10, 0, math.ceil(slot5.width / 2), slot5.height))

		slot8 = slot7.addTo
		uv10 = "read"

		slot8(slot7, slot10)

		uv8 = "RIGHT"

		if slot8 and slot2 then
			uv10 = "RIGHT"

			for slot12 = 1, math.min(3, slot10 - slot0 / 2) do
				uv14 = "curDir"

				performWithDelay(slot14, function ()
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
				end, 0.03333333333333333 * slot12)
			end
		end

		slot9 = slot4

		slot4.hide(slot9)

		slot8 = performWithDelay
		uv9 = "curDir"
		uv11 = "curDir"
		uv12 = "size"

		slot8(slot9, function ()
			uv0 = "hide"
			slot0 = slot0.hide

			slot0(slot0)

			uv0 = "show"

			slot0:show()
		end, slot11.runTime * slot12)

		uv8 = "rightPage"

		if not slot8 then
			uv9 = "curDir"
			uv11 = "curDir"

			performWithDelay(slot9, function ()
				uv0 = "leftPage"
				uv2 = "set"

				slot0.leftPage:set(slot2 - 1, true)
			end, slot11.runTime)
		end

		gGameUI:disableTouchDispatch(nil, true)
	end

	function slot9()
		uv0 = "curDir"
		slot0 = slot0.curDir
		slot0 = slot0.set
		uv2 = "set"

		slot0(slot0, slot2.LEFT)

		uv0 = "curDir"
		slot0 = slot0.leftPage
		slot1 = slot0
		uv1 = "curDir"
		slot1 = slot1.leftPage
		slot2 = slot1
		slot1 = slot1.read(slot2) - 2
		uv2 = "curDir"
		slot2 = slot2.leftPage
		slot2 = slot2.set

		slot2(slot2, slot1, true)

		uv2 = "curDir"
		slot2 = slot2:createSprite(slot0.read(slot1))
		slot3 = slot2:size()
		slot6 = cc.rect

		slot2:setTextureRect(slot6(0, 0, math.ceil(slot3.width / 2) + 10, slot3.height))

		uv6 = "LEFT"

		slot2:addTo(slot6)
		slot2:setFlippedX(true)

		slot4 = slot2.setPosition

		slot4(slot2, cc.p(-10, -1))

		uv4 = "curDir"
		slot4 = slot4:createSprite(nil, slot1 + 1)
		slot7 = cc.rect

		slot4:setTextureRect(slot7(math.ceil(slot3.width / 2) - 10, 0, math.ceil(slot3.width / 2), slot3.height))

		uv7 = "LEFT"

		slot4:addTo(slot7)

		slot8 = 0
		slot9 = -1

		slot4:setPosition(cc.p(slot8, slot9))

		slot6 = slot4

		slot4.hide(slot6)

		uv6 = "curDir"
		uv8 = "curDir"
		uv9 = "leftPage"
		slot8 = slot8.runTime * (1 - slot9)

		performWithDelay(slot6, function ()
			uv0 = "hide"
			slot0 = slot0.hide

			slot0(slot0)

			uv0 = "show"

			slot0:show()
		end, slot8)

		uv6 = "curDir"
		uv8 = "curDir"

		performWithDelay(slot6, function ()
			uv0 = "rightPage"
			uv2 = "set"

			slot0.rightPage:set(slot2 + 1, true)
		end, slot8.runTime)
		gGameUI:disableTouchDispatch(nil, true)
	end

	function slot10()
		slot0 = performWithDelay
		uv1 = "performWithDelay"

		slot0(slot1, function ()
			uv0 = "removeFromParent"

			slot0:removeFromParent()
		end, 0.1)

		uv0 = "performWithDelay"
		uv1 = "performWithDelay"
		slot0.bookActionCount = slot1.bookActionCount - 1
		uv0 = "performWithDelay"

		if slot0.bookActionCount <= 0 then
			uv0 = "performWithDelay"
			slot0.bookActionCount = 0
			uv0 = "performWithDelay"
			slot0.imgCount = 0
			uv0 = "performWithDelay"

			slot0.curDir:set(0)
		end
	end

	slot11 = cc.PageTurn3D
	slot12 = slot11
	uv12 = "leftPage"

	if slot1 == slot12.LEFT then
		slot11 = slot11.create(slot12, slot0.runTime, cc.size(40, 40)):reverse()
	end

	uv18 = "leftPage"

	slot6:runAction(cc.Sequence:create(cc.CallFunc:create(slot1 == slot18.RIGHT and slot8 or slot9), slot11, cc.CallFunc:create(slot10)))
end

function slot8.onNextPageClick(slot0)
	uv3 = "bookAction"

	slot0:bookAction(slot3.RIGHT, math.ceil(slot0.nextPage / 2))
end

function slot8.onItemClick(slot0, slot1, slot2, slot3, slot4)
	if slot0.curDir:read() ~= 0 then
		return
	end

	gGameModel.forever_dispatch:getIdlerOrigin("newContract"):modify(function (slot0)
		uv1 = "cfg"
		slot0[slot1.cfg.contractCsvID] = true

		return true, slot0
	end, true)
	gGameUI:stackUI("city.develop.contract.exchange_detail", nil, , slot4.id)
end

return slot8
