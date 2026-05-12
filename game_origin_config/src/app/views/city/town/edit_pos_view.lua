slot0 = 0.75
slot1 = 2
slot2 = true
slot3 = 8
slot4 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	}
}
slot5 = {
	cc.c4b(0.38, 0.32, 0.38, 1),
	cc.c4b(1, 0.98, 0.91, 1),
	cc.c4b(0.95, 0.21, 0.31, 1),
	cc.c4b(0.7, 0.7, 0.65, 1),
	cc.c4b(0.69, 0.91, 0.5, 1),
	cc.c4b(0.39, 0.76, 0.32, 1),
	cc.c4b(0.92, 0.71, 0.18, 1),
	cc.c4b(0.95, 0.43, 0.28, 1),
	cc.c4b(0.7, 0.92, 0.5, 1),
	cc.c4b(0.9, 0.31, 0.31, 1),
	cc.c4b(0.54, 0.8, 0.3, 1),
	cc.c4b(0.55, 0.15, 0.07, 1),
	cc.c4b(0.95, 0.75, 0.3, 1),
	cc.c4b(0.7, 0.4, 0.05, 1),
	cc.c4b(0.23, 0.21, 0.23, 1),
	cc.c4b(0.301, 0.05, 0.01, 1)
}
slot7 = class("TownEidtPathView", cc.load("mvc").ViewBase)
slot8 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(255, 252, 237, 255)
		}
	}
}
slot7.RESOURCE_FILENAME = "town_edit_path.json"
slot7.RESOURCE_BINDING = {
	itemPos = "item",
	["barPanel.slider"] = "slider",
	["panelOpt.btnPath.fieldEnd"] = "fieldPath",
	["panelOpt.btnEnd.fieldEnd"] = "fieldEnd",
	bgPanel = "bg",
	["panelOpt.btnStart.fieldStart"] = "fieldStart",
	barPanel = "barPanel",
	["barPanel.btnSub"] = {
		varname = "sliderSubBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -0.05)
			end)
		}
	},
	["barPanel.btnAdd"] = {
		varname = "sliderAddBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 0.05)
			end)
		}
	},
	["panelOpt.btnSave"] = {
		varname = "btnSave",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnSave")
			}
		}
	},
	["panelOpt.btnReset"] = {
		varname = "btnReset",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnReset")
			}
		}
	},
	["panelOpt.btnSetPos"] = {
		varname = "btnSetPos",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnSetPos")
			}
		}
	},
	["panelOpt.btnSelectPath"] = {
		varname = "btnSelectPath",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnSelectPath")
			}
		}
	},
	["panelOpt.btnDelOne"] = {
		varname = "btnDelOne",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnDelOne")
			}
		}
	},
	["panelOpt.btnDel"] = {
		varname = "btnDel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnDelPos")
			}
		}
	},
	["panelOpt.btnSaveData"] = {
		varname = "btnSaveData",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnSaveData")
			}
		}
	},
	["panelOpt.btnSureImg"] = {
		varname = "btnSureImg",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeImg")
			}
		}
	}
}

function slot7.onCreate(slot0)
	gGameUI.topuiManager:createView("town", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "HOME",
		title = gLanguageCsv.town
	})
	slot0:initModel()

	slot0.selectPosList = {}
	slot0.selectPosPanelList = {}
	slot0.selectPosDrawList = {}
	slot0.selectPosPathList = {}
	slot0.selectPosPathPanelList = {}
	slot0.startPos = idler.new(0)
	slot0.endPos = idler.new(0)
	slot0.isSaveSign = false
	slot0.posPathList = {}
	slot0.curSign = 0

	slot0:updateMinMaxScale()
	gGameUI:setMultiTouches(true)
	slot0:setMapScale()
	slot0:initBGScale()
	slot0:setMultTouchEventListener(slot0.bg)
	slot0:addListener(slot0.fieldStart, functools.partial(slot0.onFieldStart, slot0))
	slot0:addListener(slot0.fieldEnd, functools.partial(slot0.onFieldEnd, slot0))
	slot0:addListener(slot0.fieldPath, functools.partial(slot0.onFieldPath, slot0))
	slot0.bg:get("map"):visible(false)
	idlereasy.when(slot0.scale, function (slot0, slot1)
		uv2 = "minScale"
		slot2 = slot2.minScale < slot1
		uv3 = "sliderSubBtn"
		slot3 = slot1 < slot3
		uv4 = "minScale"
		slot4 = slot4.sliderSubBtn
		slot4 = slot4.setTouchEnabled

		slot4(slot4, slot2)

		uv4 = "minScale"
		slot4 = slot4.sliderAddBtn
		slot5 = slot4

		slot4.setTouchEnabled(slot5, slot3)

		uv5 = "minScale"
		slot5 = slot5.sliderSubBtn

		cache.setShader(slot5, false, slot2 and "normal" or "hsl_gray")

		slot4 = cache.setShader
		uv5 = "minScale"

		slot4(slot5.sliderAddBtn, false, slot3 and "normal" or "hsl_gray")

		uv4 = "minScale"

		if not slot4.slider:isHighlighted() then
			uv5 = "minScale"
			uv6 = "sliderSubBtn"
			uv7 = "minScale"
			slot5 = (slot1 - slot5.minScale) / (slot6 - slot7.minScale) * 100
			uv5 = "minScale"

			slot5.slider:setPercent(math.ceil(slot5))
		end

		uv4 = "minScale"

		slot4:setMapScale(slot1)
	end)
	idlereasy.any({
		slot0.startPos,
		slot0.endPos
	}, function (slot0, slot1, slot2)
		uv3 = "fieldStart"
		slot3 = slot3.fieldStart
		slot3 = slot3.text

		slot3(slot3, slot1)

		uv3 = "fieldStart"

		slot3.fieldEnd:text(slot2)

		if slot1 ~= 0 and slot2 ~= 0 then
			slot3 = {
				slot4
			}
			uv4 = "fieldStart"
			uv4 = "fieldStart"

			if #slot4.selectPosList[slot1].posPathList > 0 then
				uv4 = "fieldStart"
				slot4.isSaveSign = true
			end

			uv5 = "fieldStart"

			for slot7, slot8 in ipairs(slot5.posPathList) do
				table.insert(slot3, slot8)
			end

			slot4 = table.insert
			uv6 = "fieldStart"

			slot4(slot3, slot6.selectPosList[slot2])

			uv4 = "fieldStart"

			slot4:drawLine(slot3, slot1 * 100 + slot2)
		end
	end)
end

function slot7.initSelectPosList(slot0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in orderCsvPairs(csv.town.npc_path) do
		table.insert(slot0.selectPosList, cc.p(slot7.startPos[1], slot7.startPos[2]))

		slot12 = slot7.startPos[2]
		slot11 = slot6

		slot0:addPosItem(cc.p(slot7.startPos[1], slot12), slot11)

		for slot11, slot12 in orderCsvPairs(slot7.path) do
			slot13 = {
				info = {}
			}

			for slot17, slot18 in ipairs(slot12.info) do
				table.insert(slot13.info, cc.p(slot18[1], slot18[2]))
			end

			slot13.lastPoint = slot12.lastPoint

			slot0:drawLine(slot13.info, slot6 * 100 + slot12.lastPoint)

			slot0.selectPosPathList[slot6] = slot0.selectPosPathList[slot6] or {}

			table.insert(slot0.selectPosPathList[slot6], slot13)
		end
	end
end

function slot7.drawLine(slot0, slot1, slot2)
	slot3 = nil

	if not slot0.bg:get("map2"):get("DrawNode" .. slot2) then
		slot0.bg:get("map2"):addChild(cc.DrawNode:create(), 20, "DrawNode" .. slot2)
	end

	slot5 = slot3

	slot3.clear(slot5)

	slot4 = nil
	uv5 = "bg"
	uv6 = "bg"

	for slot9, slot10 in ipairs(slot1) do
		if slot4 then
			slot3:drawSegment(slot4, slot10, 5, slot5[slot2 % #slot6 + 1])

			slot4 = slot10
		else
			slot4 = slot10
		end
	end

	slot0.selectPosPathPanelList[slot2] = slot3
end

function slot7.initModel(slot0)
	slot0.scale = idler.new(1)
	slot0.allPanel = {
		slot0.center,
		slot0.home,
		slot0.shop,
		slot0.rest
	}
	slot1 = 1
	slot0.lastScale = slot1
	uv1 = "scale"
	slot0.minScale = slot1
	slot0.node = slot0:getResourceNode()
end

function slot7.addListener(slot0, slot1, slot2)
	slot1:addEventListener(function (slot0, slot1)
		uv2 = "text"

		if slot1 == ccui.TextFiledEventType.detach_with_ime then
			uv3 = "ccui"

			slot3(slot2:text())
		elseif slot1 == ccui.TextFiledEventType.attach_with_ime then
			slot0:text("")
		end
	end)
end

function slot7.updateMinMaxScale(slot0)
	slot3 = display.sizeInView.height

	if display.sizeInView.width > slot0.bg:get("map"):getBoundingBox().width * slot0.minScale then
		slot0.minScale = mathEasy.getPreciseDecimal(slot2 / slot1.width, 2) + 0.01
	end

	if slot3 > slot1.height * slot0.minScale and slot0.minScale > mathEasy.getPreciseDecimal(slot3 / slot1.widtheighth, 2) + 0.01 then
		slot0.minScale = mathEasy.getPreciseDecimal(slot3 / slot1.height, 2) + 0.01
	end
end

function slot7.setMapScale(slot0, slot1)
	slot2 = slot0.scalePos or cc.p(display.width / 2, display.height / 2)
	slot1 = slot1 or slot0.scale:read()
	slot3, slot4 = slot0.bg:xy()
	slot5 = slot0.bg:scale()

	slot0.bg:xy((slot3 - slot2.x) / slot5 * slot1 + slot2.x, (slot4 - slot2.y) / slot5 * slot1 + slot2.y)
	slot0.bg:setScale(slot1)

	slot6, slot7 = slot0:adaptMapPos()

	slot0.bg:xy(slot6, slot7)
end

function slot7.initBGScale(slot0)
	slot0.slider:addEventListener(function (slot0, slot1)
		slot3 = slot0
		uv3 = "getPercent"
		uv4 = "minScale"
		slot3 = slot3 - slot4.minScale
		slot5 = slot3 * slot0.getPercent(slot3) * 0.01
		slot7 = slot3
		uv5 = "minScale"
		uv7 = "minScale"

		slot5.scale:set(slot7.minScale + cc.clampf(slot5, 0, slot7))
	end)
end

function slot7.setMultTouchEventListener(slot0, slot1)
	slot0.optLayer = cc.LayerColor:create(cc.c4b(255, 0, 0, 1), display.sizeInView.width, display.sizeInView.width)

	slot0.optLayer:setTouchEnabled(true)
	slot0.optLayer:setSwallowsTouches(true)
	slot0.optLayer:x(-display.uiOrigin.x)
	slot0:addChild(slot0.optLayer, 1)

	slot4 = display.width / 2
	slot5 = display.height / 2
	slot6, slot7 = slot1:getPosition()
	slot0.figureList = {}
	slot8 = nil
	slot9 = false
	slot10 = false
	slot11 = nil
	slot12 = slot0.scale
	slot13 = 1
	slot14 = cc.EventListenerTouchAllAtOnce:create()

	function slot15(slot0)
		for slot5, slot6 in ipairs(slot0) do
			-- Nothing
		end

		return {
			[slot5] = slot6:getLocation()
		}
	end

	slot14:setEnabled(true)
	slot14:registerScriptHandler(function ()
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
	end, cc.Handler.EVENT_TOUCHES_BEGAN)
	slot14:registerScriptHandler(function ()
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
	end, cc.Handler.EVENT_TOUCHES_MOVED)
	slot14:registerScriptHandler(function (slot0, slot1)
		uv2 = "scalePos"

		if slot2 then
			uv0 = nil
			uv2 = "bg"
			slot2.scalePos = nil
		end

		uv2 = "get"

		if #slot2(slot0) == 1 then
			uv3 = "map2"

			if not slot3 then
				uv3 = "bg"
				slot3 = slot3.bg:get("map2")
				slot4 = slot3
				slot3 = slot3.convertToNodeSpace(slot4, slot2[1])
				uv4 = "bg"

				if slot4.curSign == 1 then
					slot5 = math.floor(slot3.x)
					slot7 = slot3.y
					slot3 = cc.p(slot5, math.floor(slot7))
					slot4 = table.insert
					uv5 = "bg"

					slot4(slot5.selectPosList, slot3)

					uv4 = "bg"
					uv7 = "bg"

					slot4:addPosItem(slot3, #slot7.selectPosList)
				else
					uv4 = "bg"

					if slot4.curSign == 2 then
						slot4 = table.insert
						uv5 = "bg"
						slot6 = slot3

						slot4(slot5.posPathList, slot6)

						uv4 = "bg"
						uv6 = "bg"

						slot4.startPos:set(slot6.startPos:read(), true)
					end
				end
			end
		end
	end, cc.Handler.EVENT_TOUCHES_ENDED)
	slot0.optLayer:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot14, slot0.optLayer)
end

function slot7.addPosItem(slot0, slot1, slot2)
	slot3 = slot0.item:clone()
	slot4 = slot3:multiget("txtNum", "txtPos")

	slot4.txtNum:text(slot2)
	slot4.txtPos:text(string.format("p(%d, %d)", slot1.x, slot1.y))
	slot3:xy(slot1.x, slot1.y + 10)
	slot0.bg:get("map2"):addChild(slot3, 25)
	table.insert(slot0.selectPosPanelList, slot3)
	slot0:drawNode(slot1, slot2)
end

function slot7.drawNode(slot0, slot1, slot2)
	slot3 = nil

	if not slot0.bg:get("map2"):get("DrawNode" .. slot2) then
		slot0.bg:get("map2"):addChild(cc.DrawNode:create(), 25, "DrawNode" .. slot2)
	end

	slot3:clear()
	slot3:drawDot(slot1, 10, cc.c4b(1, 0, 0, 1))
	table.insert(slot0.selectPosDrawList, slot3)
end

function slot7.adaptMapPos(slot0, slot1, slot2, slot3)
	if not slot1 then
		slot1, slot2 = slot0.bg:getPosition()
	end

	slot4 = slot0.bg:get("map"):getBoundingBox()
	slot5 = slot0.scale:read()
	slot8 = slot4.width * slot5 * 0.5
	slot9 = slot4.height * slot5 * 0.5

	return math.min(slot8, math.max(display.sizeInView.width - slot8, slot1)), math.min(slot9, math.max(display.sizeInView.height - slot9, slot2))
end

function slot7.onFieldStart(slot0)
	if slot0.selectPosList[tonumber(slot0.fieldStart:text())] then
		if slot0.isSaveSign then
			gGameUI:showDialog({
				isRich = true,
				content = "#C0x5B545B#您确定不需要保存吗",
				btnType = 2,
				cb = function ()
					uv0 = "isSaveSign"
					slot0.isSaveSign = false
					uv0 = "isSaveSign"
					slot0.posPathList = {}
					uv0 = "isSaveSign"
					slot0 = slot0.startPos
					slot1 = slot0
					uv1 = "isSaveSign"
					slot1 = slot1.endPos
					uv1 = "isSaveSign"

					slot1.selectPosPathPanelList[slot0.read(slot1) * 100 + slot1]:removeFromParent()
				end
			})
		else
			slot0.posPathList = {}

			slot0.startPos:set(slot1, true)
		end
	else
		gGameUI:showTip("无效节点")
	end
end

function slot7.onFieldEnd(slot0)
	if slot0.selectPosList[tonumber(slot0.fieldEnd:text())] then
		if slot0.isSaveSign then
			gGameUI:showDialog({
				isRich = true,
				content = "#C0x5B545B#您确定不需要保存吗",
				btnType = 2,
				cb = function ()
					uv0 = "isSaveSign"
					slot0.isSaveSign = false
					uv0 = "isSaveSign"
					slot0.posPathList = {}
					uv0 = "isSaveSign"
					slot0 = slot0.startPos
					slot1 = slot0
					uv1 = "isSaveSign"
					slot1 = slot1.endPos:read()
					uv1 = "isSaveSign"

					slot1.selectPosPathPanelList[slot0.read(slot1) * 100 + slot1]:removeFromParent()
				end
			})
		else
			slot0.posPathList = {}

			slot0.endPos:set(slot1, true)
		end
	else
		gGameUI:showTip("无效节点")
	end
end

function slot7.onFieldPath(slot0)
	slot1 = slot0.fieldPath:text()
	slot2, slot3 = cc.FileUtils:getInstance():fullPathForFilename(slot1)

	if cc.FileUtils:getInstance():fullPathForFilename(slot1) then
		slot0.bg:get("map2"):get("img"):texture(cc.FileUtils:getInstance():fullPathForFilename(slot1))
	end
end

function slot7.onBtnSetPos(slot0)
	slot0.curSign = 1
end

function slot7.onBtnSelectPath(slot0)
	slot0.curSign = 2
end

function slot7.onBtnReset(slot0)
	slot0.posPathList = {}

	slot0.selectPosPathPanelList[slot0.startPos:read() * 100 + slot0.endPos:read()]:removeFromParent()
	slot0.startPos:set(0)
	slot0.endPos:set(0)

	slot0.isSaveSign = false
end

function slot7.onBtnSave(slot0)
	if slot0.startPos:read() == 0 and slot0.endPos:read() == 0 then
		gGameUI:showTip("无效数据")

		return
	end

	slot0.selectPosPathList[slot1] = slot0.selectPosPathList[slot0.startPos:read()] or {}

	table.insert(({
		info = {}
	}).info, slot0.selectPosList[slot1])

	for slot6, slot7 in ipairs(slot0.posPathList) do
		table.insert(slot2.info, slot7)
	end

	table.insert(slot2.info, slot0.selectPosList[slot0.endPos:read()])

	slot2.lastPoint = slot0.endPos:read()

	table.insert(slot0.selectPosPathList[slot1], slot2)

	slot0.isSaveSign = false
	slot0.posPathList = {}

	slot0.startPos:set(0)
	slot0.endPos:set(0)
end

function slot7.onBtnDelOne(slot0)
	table.remove(slot0.selectPosList, #slot0.selectPosList)
	slot0.selectPosPanelList[#slot0.selectPosPanelList]:removeFromParent()
	table.remove(slot0.selectPosPanelList, #slot0.selectPosPanelList)
	slot0.selectPosDrawList[#slot0.selectPosDrawList]:removeFromParent()
	table.remove(slot0.selectPosDrawList, #slot0.selectPosDrawList)
end

function slot7.onBtnDelPos(slot0)
	slot0.selectPosList = {}

	for slot4, slot5 in ipairs(slot0.selectPosPanelList) do
		slot5:removeFromParent()
	end

	slot0.selectPosPanelList = {}

	for slot4, slot5 in ipairs(slot0.selectPosDrawList) do
		slot5:removeFromParent()
	end

	slot0.selectPosDrawList = {}
end

function slot7.onBtnSaveData(slot0)
	slot2 = ""

	for slot6, slot7 in ipairs(slot0.selectPosList) do
		slot8 = "<>"

		if slot0.selectPosPathList[slot6] and #slot0.selectPosPathList[slot6] > 0 then
			slot8 = function (slot0)
				slot1 = "<"

				for slot5, slot6 in ipairs(slot0) do
					for slot10, slot11 in ipairs(slot6.info) do
						slot1 = slot10 == #slot6.info and slot1 .. string.format("<%d;%d>>", slot11.x, slot11.y) or slot1 .. string.format("<%d;%d>>", slot11.x, slot11.y) .. string.format("<%d;%d>", slot11.x, slot11.y)
					end
				end

				return slot1
			end(slot0.selectPosPathList[slot6])
		end

		slot2 = slot2 .. string.format("%d   <x=%d;y=%d>   %s\n", slot6, slot7.x, slot7.y, slot8)
	end

	slot3 = io.open("npc_pos.txt", "w+")

	slot3:write(slot2)
	slot3:flush()
	slot3:close()
	gGameUI:showTip("save is success, text name is npc_pos.txt")
end

function slot7.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

function slot7.onChangeImg(slot0)
end

return slot7
