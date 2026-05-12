slot0 = false

if device.platform == "windows" then
	-- Nothing
end

slot1 = 4
slot2 = {
	TIP = 2,
	NORMAL = 1,
	HIDE = 3
}
slot3 = {
	LEFT = 1,
	RIGHT = 2
}
slot4 = {
	1,
	2,
	5,
	6
}
slot5 = {
	3,
	4,
	7,
	8
}
slot6 = 340
slot7 = 200

function slot8(slot0, slot1)
	slot2 = cc.GLProgram:create("shader/ver_shader.vsh", "shader/glow_part.fsh")

	slot2:link()
	slot2:updateUniforms()

	slot3 = cc.GLProgramState:getOrCreateWithGLProgram(slot2)

	slot0:get("imgIcon"):setGLProgramState(slot3)
	slot3:setUniformFloat("NUM", slot1)
end

slot9 = {
	{
		res = "city/medal/box_dikuang3.png",
		color = cc.c4b(103, 123, 89, 255)
	},
	{
		res = "city/medal/box_dikuang2.png",
		color = cc.c4b(95, 114, 134, 255)
	},
	{
		res = "city/medal/box_dikuang1.png",
		color = cc.c4b(163, 129, 32, 255)
	},
	{
		res = "city/medal/box_dikuang.png",
		color = cc.c4b(159, 108, 70, 255)
	}
}

function slot10(slot0, slot1, slot2, slot3)
	slot4 = slot0:getIdx(slot2)
	slot5 = slot1:get("panel"):multiget("imgBg", "imgIcon", "name", "get", "show", "getTime", "proPanel")

	if slot3.haveData then
		slot7 = slot5.imgBg
		slot8 = slot7
		uv9 = "getIdx"

		slot7.texture(slot8, slot9[slot4.k <= 4 and slot4.k or math.abs(slot4.k - 9)].res)

		uv8 = "get"

		if slot3.cfg.type == slot8.TIP and slot3.curPro == 0 then
			slot5.imgIcon:texture("city/medal/icon_yincangxunzhang.png")
		else
			slot5.imgIcon:texture(slot6.res)
		end

		uv9 = "panel"
		slot10 = slot6.pos.x
		uv10 = "multiget"

		slot5.imgIcon:xy(slot9 + slot10, slot10 + slot6.pos.y)
		slot5.name:text(slot6.medalName)

		if matchLanguage({
			"cn",
			"tw"
		}) then
			adapt.setTextScaleWithWidth(slot5.name, nil, 350)
		else
			adapt.setTextAdaptWithSize(slot5.name, {
				maxLine = 2,
				vertical = "center",
				horizontal = "center",
				size = cc.size(400, 150)
			})
		end

		uv11 = "getIdx"

		text.addEffect(slot5.name, {
			outline = {
				size = 4,
				color = slot11[slot4.k <= 4 and slot4.k or math.abs(slot4.k - 9)].color
			}
		})
		slot5.show:visible(slot3.medalShow)
		slot5.proPanel:visible(not slot3.isOther)
		slot5.proPanel:get("txt"):text(string.format("%d/%d", slot3.curPro, slot3.maxNum))
		slot5.proPanel:get("img"):setPercent(slot3.curPro / slot3.maxNum * 100)

		uv11 = "getIdx"

		text.addEffect(slot5.proPanel:get("txt"), {
			outline = {
				size = 4,
				color = slot11[slot4.k <= 4 and slot4.k or math.abs(slot4.k - 9)].color
			}
		})
		slot5.getTime:visible(slot3.isOther)
		slot5.get:visible(slot3.canGet == 1)

		if slot3.canGet == 1 then
			slot7 = widget.addAnimationByKey(slot5.imgBg, "effect/jiedianjiangli.skel", "effect", "effect_loop", 6):scale(0.4):xy(100, 120)
		end

		if slot3.isOther then
			slot5.getTime:text(string.format("%d.%d.%d %s", slot3.getTime.year, slot3.getTime.month, slot3.getTime.day, gLanguageCsv.homeVisitGain))

			uv10 = "getIdx"

			text.addEffect(slot5.getTime, {
				color = slot10[slot4.k <= 4 and slot4.k or math.abs(slot4.k - 9)].color
			})
		end

		uv7 = "imgBg"

		slot7(slot1:get("panel"), slot3.showShadow)
		bind.click(slot0, slot1:get("panel"), {
			method = functools.partial(slot0.itemClick, slot1:get("panel"), slot4, slot3)
		})
	else
		itertools.invoke({
			slot5.proPanel,
			slot5.imgIcon,
			slot5.name,
			slot5.get,
			slot5.show,
			slot5.getTime
		}, "hide")
	end
end

slot12 = class("MedalCollectionView", cc.load("mvc").ViewBase)
slot12.RESOURCE_FILENAME = "medal_collection_view.json"
slot12.RESOURCE_BINDING = {
	pageItem = "pageItem",
	imgBg = "imgBg",
	listPanel = "listPanel",
	subList = "subList",
	item = "item",
	mask = "mask",
	listBehindPanel = "listBehindPanel",
	["listPanel.list"] = {
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
	["listPanel.list1"] = {
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
	["listBehindPanel.rightList"] = {
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
	["listBehindPanel.leftList"] = {
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
	collectNum = {
		varname = "collectNum",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(190, 109, 18, 255)
				}
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
	filter = {
		varname = "filter",
		binds = {
			event = "extend",
			class = "sort_menus",
			props = {
				height = 80,
				btnHeight = 10,
				btnType = 6,
				btnWidth = 135,
				width = 360,
				data = bindHelper.self("sortTabData"),
				showSortList = bindHelper.self("showFilter"),
				menuClick = bindHelper.self("menuClick"),
				btnClick = bindHelper.self("onSortMenusBtnClick", true),
				showSelected = bindHelper.self("showSelected"),
				onNode = function (slot0)
					slot0:xy(-1170, -442)
				end
			}
		}
	},
	attrDetail = {
		varname = "btnAttr",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowAttrClick")
			}
		}
	},
	btnNext = {
		varname = "btnNext",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onNextPageClick")
			}
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

function slot12.onCreate(slot0, slot1, slot2)
	slot0.isOther = slot1 or false
	slot0.otherData = slot2

	gGameUI.topuiManager:createView("union_answer", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		title = slot1 and slot2.name .. gLanguageCsv.medalCollectionMini or gLanguageCsv.medalCollection,
		subTitle = slot1 and "" or "MEDALCOLLECTION"
	})
	slot0:initModel()
	idlereasy.any({
		slot0.medal,
		slot0.medalTask,
		slot0.medalShow
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "updateDatas"
		slot4 = slot4.updateDatas

		slot4(slot4)

		uv4 = "updateDatas"
		slot4 = slot4.updateAttr

		slot4(slot4)

		uv4 = "updateDatas"
		slot4 = slot4.checkNextAward

		slot4(slot4)

		uv4 = "updateDatas"
		slot4 = slot4.updatePageDatas
		uv6 = "updateAttr"
		slot6 = slot6.LEFT

		slot4(slot4, slot6)

		uv4 = "updateDatas"
		slot4 = slot4.updatePageDatas
		uv6 = "updateAttr"

		slot4(slot4, slot6.RIGHT)

		uv4 = "updateDatas"
		slot4 = slot4.collectNum
		slot5 = slot4
		slot4 = slot4.text
		slot6 = string.format
		slot7 = gLanguageCsv.medalCollected
		slot8 = itertools.size
		uv9 = "updateDatas"

		if slot9.isOther then
			uv9 = "updateDatas"

			if not slot9.otherData.medal then
				slot9 = slot1
			end
		end

		slot4(slot5, slot6(slot7, slot8(slot9)))
	end)
	idlereasy.any({
		slot0.sortType
	}, function (slot0, slot1)
		uv2 = "updateDatas"
		slot2 = slot2.updateDatas

		slot2(slot2)

		uv2 = "updateDatas"
		slot2 = slot2.leftPage
		slot2 = slot2.set

		slot2(slot2, 1, true)

		uv2 = "updateDatas"

		slot2.rightPage:set(2, true)
	end)
	idlereasy.when(slot0.leftPage, function (slot0, slot1)
		uv2 = "btnLeft"
		slot2 = slot2.btnLeft
		slot2 = slot2.visible
		slot4 = slot1 > 1

		slot2(slot2, slot4)

		uv2 = "btnLeft"
		slot2 = slot2.updatePageDatas
		uv4 = "visible"

		slot2(slot2, slot4.LEFT)

		uv2 = "btnLeft"

		slot2:checkNextAward()
	end)
	idlereasy.when(slot0.rightPage, function (slot0, slot1)
		uv2 = "btnRight"
		slot2 = slot2.btnRight
		slot2 = slot2.visible
		uv4 = "btnRight"
		slot4 = slot1 < slot4.maxPage

		slot2(slot2, slot4)

		uv2 = "btnRight"
		slot2 = slot2.updatePageDatas
		uv4 = "visible"

		slot2(slot2, slot4.RIGHT)

		uv2 = "btnRight"

		slot2:checkNextAward()
	end)
	slot0:initListener()
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

		uv2 = "btnLeft"
		slot2 = slot2.btnNext
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

		if slot1 ~= 0 then
			uv2 = "btnLeft"

			slot2.showFilter:set(false)
		end

		uv2 = "btnLeft"

		slot2.menuClick:set(slot1 == 0)
	end)
end

function slot12.initModel(slot0)
	slot0.medal = gGameModel.role:getIdler("medal")
	slot0.medalTask = gGameModel.role:getIdler("medal_task")
	slot0.medalShow = gGameModel.role:getIdler("medal_show")
	slot0.copyLeftDatas = idlers.new()
	slot0.copyRightDatas = idlers.new()
	slot0.leftPage = idler.new(1)
	slot0.rightPage = idler.new(2)
	slot0.leftDatas = idlers.new()
	slot0.rightDatas = idlers.new()
	slot0.pageDatas = idlers.newWithMap({})
	slot0.sortTabData = idlertable.new({
		gLanguageCsv.allMedals,
		gLanguageCsv.tipMedal,
		gLanguageCsv.hideMedal
	})
	slot0.sortType = idler.new(1)
	slot0.maxPage = 1
	slot0.imgCount = 0
	slot0.bookActionCount = 0
	slot0.curDir = idler.new(0)
	slot0.runTime = 1
	slot0.showFilter = idler.new(false)
	slot0.menuClick = idler.new(true)
	slot0.showSelected = idler.new(1)
end

function slot12.onSortMenusBtnClick(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot0:checkEmpty(slot3) then
		slot0.sortType:set(slot3)
	else
		gGameUI:showTip(string.format(gLanguageCsv.medalCollectionNoMedal, slot3 == 2 and gLanguageCsv.medalTwo or slot3 == 3 and gLanguageCsv.medalThree))
		slot0.showSelected:set(slot5)
	end
end

function slot12.checkNextAward(slot0)
	if slot0.btnRight:get("nextTipImg") then
		slot0.btnRight:removeChildByName("nextTipImg")
	end

	if slot0.btnLeft:get("nextTipImg") then
		slot0.btnLeft:removeChildByName("nextTipImg")
	end

	slot0.btnNext:hide()
	slot0.btnNext:get("img"):stopActionByTag(666)
	slot0.btnNext:get("img1"):stopActionByTag(888)

	if slot0.isOther then
		return
	end

	slot0.nextPage = nil
	slot0.nextLeftPage = nil
	slot1 = slot0.rightPage
	slot2 = slot1
	uv2 = "btnRight"

	for slot4 = slot1.read(slot2) * slot2 + 1, #slot0.allMedal do
		if slot0.allMedal[slot4] and slot5.canGet == 1 then
			uv7 = "btnRight"
			slot0.nextPage = math.ceil(slot4 / slot7)

			break
		end
	end

	slot2 = slot0.leftPage
	slot3 = slot2
	uv3 = "btnRight"

	for slot4 = 1, (slot2.read(slot3) - 1) * slot3 do
		if slot0.allMedal[slot4] and slot5.canGet == 1 then
			uv7 = "btnRight"
			slot0.nextLeftPage = math.ceil(slot4 / slot7)

			break
		end
	end

	if slot0.nextLeftPage and not slot0.isOther then
		slot1 = ccui.ImageView:create("city/town/map/btn_hd.png")

		slot1:xy(100, 150)
		slot1:addTo(slot0.btnLeft, 50, "nextTipImg")
		slot1:anchorPoint(0, 0)
		slot1:scale(0.8)
		slot1:setFlippedX(true)
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.RotateTo:create(0.2, 9), cc.RotateTo:create(0.05, -18), cc.RotateTo:create(0.2, 0), cc.RotateTo:create(0.1, -10), cc.DelayTime:create(0.8))))
	end

	if slot0.nextPage and not slot0.isOther then
		slot0.btnNext:show()

		slot2 = cc.RepeatForever:create(cc.Sequence:create(cc.ScaleTo:create(0.2, 2.3, 1.8), cc.ScaleTo:create(0.2, 1.9, 2.1), cc.ScaleTo:create(0.1, 2, 2), cc.DelayTime:create(0.8)))

		slot0.btnNext:get("img"):runAction(slot2)
		slot2:setTag(666)

		slot4 = cc.RepeatForever:create(cc.Sequence:create(cc.Spawn:create(cc.ScaleTo:create(0.01, 1.5, 0.7), cc.FadeTo:create(0.01, 0)), cc.Spawn:create(cc.MoveTo:create(0.3, cc.p(230, 105)), cc.ScaleTo:create(0.3, 1, 1), cc.FadeTo:create(0.3, 255)), cc.Spawn:create(cc.MoveTo:create(0.3, cc.p(260, 105)), cc.FadeTo:create(0.2, 0)), cc.Spawn:create(cc.MoveTo:create(0.01, cc.p(190, 105)), cc.DelayTime:create(0.8))))

		slot0.btnNext:get("img1"):runAction(slot4)
		slot4:setTag(888)

		slot5 = ccui.ImageView:create("city/town/map/btn_hd.png")

		slot5:xy(130, 130)
		slot5:addTo(slot0.btnRight, 50, "nextTipImg")
		slot5:anchorPoint(0, 0)
		slot5:scale(0.8)
		slot5:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.RotateTo:create(0.2, -9), cc.RotateTo:create(0.05, 18), cc.RotateTo:create(0.2, 0), cc.RotateTo:create(0.1, 10), cc.DelayTime:create(0.8))))
	end
end

function slot12.updateAttr(slot0)
	slot1 = {}

	if slot0.isOther then
		for slot6, slot7 in pairs(slot0.otherData.medal or {}) do
			for slot12 = 1, itertools.size(gMedalCollectionCsv[slot6]) do
				slot13 = gMedalCollectionCsv[slot6][slot12]

				for slot17 = 1, math.huge do
					slot19 = slot13["attrNum" .. slot17]

					if slot13["attrType" .. slot17] and slot18 > 0 then
						if slot1[slot18] then
							if string.find(slot19, "%%") then
								slot1[slot18].num = dataEasy.attrAddition(slot1[slot18].num, slot19)
							else
								slot1[slot18].num = slot1[slot18].num + slot19
							end
						else
							slot1[slot18] = {
								id = slot18,
								num = slot19
							}
						end
					else
						break
					end
				end
			end
		end
	else
		for slot6, slot7 in pairs(slot0.medalTask:read()) do
			if slot7 == 0 and csv.medal[slot6] then
				for slot12 = 1, math.huge do
					slot14 = slot8["attrNum" .. slot12]

					if slot8["attrType" .. slot12] and slot13 > 0 then
						if slot1[slot13] then
							if string.find(slot14, "%%") then
								slot1[slot13].num = dataEasy.attrAddition(slot1[slot13].num, slot14)
							else
								slot1[slot13].num = slot1[slot13].num + slot14
							end
						else
							slot1[slot13] = {
								id = slot13,
								num = slot14
							}
						end
					else
						break
					end
				end
			end
		end
	end

	slot0.attrDatas = slot1
end

function slot12.checkEmpty(slot0, slot1)
	slot2 = true

	if slot0.isOther then
		for slot7, slot8 in pairs(slot0.otherData.medal or {}) do
			uv9 = "isOther"

			if slot1 == slot9.NORMAL or gMedalCollectionCsv[slot7][1].type == slot1 then
				slot2 = false

				break
			end
		end
	else
		for slot7, slot8 in orderCsvPairs(csv.medal) do
			uv9 = "isOther"

			if slot1 == slot9.NORMAL or slot8.type == slot1 then
				uv10 = "isOther"

				if slot8.type ~= slot10.HIDE or not (slot0.medalTask:read() or {})[slot7] then
					uv10 = "isOther"

					if slot8.type ~= slot10.HIDE then
						slot2 = false

						break
					end
				end
			end
		end
	end

	return slot2
end

function slot12.updateDatas(slot0)
	slot1 = {}
	slot2 = {}

	if slot0.isOther then
		for slot7, slot8 in pairs(slot0.otherData.medal or {}) do
			slot9 = slot0.sortType
			slot10 = slot9
			uv10 = "isOther"

			if slot9.read(slot10) == slot10.NORMAL or gMedalCollectionCsv[slot7][1].type == slot0.sortType:read() then
				table.insert(slot1, {
					showShadow = 1,
					isOther = true,
					haveData = true,
					finish = true,
					cfg = gMedalCollectionCsv[slot7][itertools.size(gMedalCollectionCsv[slot7])],
					medalShow = slot0.otherData.medal_show == slot7,
					maxNum = slot9,
					curPro = slot9,
					getTime = time.getDate(slot8)
				})
			end
		end
	else
		slot3 = slot0.medalTask:read() or {}

		for slot7, slot8 in orderCsvPairs(csv.medal) do
			slot9 = slot0.sortType
			slot10 = slot9
			uv10 = "isOther"

			if slot9.read(slot10) == slot10.NORMAL or slot8.type == slot0.sortType:read() then
				uv10 = "isOther"

				if slot8.type ~= slot10.HIDE or not slot3[slot7] then
					uv10 = "isOther"

					if slot8.type ~= slot10.HIDE then
						slot9 = nil

						if slot3[slot7] then
							slot9 = {
								finish = true,
								isOther = false,
								haveData = true,
								cfg = slot8,
								medalShow = slot0.medalShow:read() == slot8.medalID,
								canGet = slot3[slot7] or 0,
								maxNum = itertools.size(gMedalCollectionCsv[slot8.medalID]),
								showShadow = slot3[slot7] == 1 and (slot2[slot8.medalID] and slot1[slot2[slot8.medalID]].showShadow or 0) or slot8.showShadow,
								curPro = slot3[slot7] == 1 and (slot2[slot8.medalID] and slot1[slot2[slot8.medalID]].curPro or 0) or slot8.sort
							}
						elseif not slot2[slot8.medalID] then
							slot9 = {
								showShadow = 0,
								haveData = true,
								isOther = false,
								curPro = 0,
								finish = false,
								cfg = slot8,
								medalShow = slot0.medalShow:read() == slot8.medalID,
								maxNum = itertools.size(gMedalCollectionCsv[slot8.medalID])
							}
						end

						if slot9 then
							if not slot2[slot8.medalID] then
								table.insert(slot1, slot9)

								slot2[slot8.medalID] = #slot1
							else
								slot1[slot2[slot8.medalID]] = slot9
							end
						end
					end
				end
			end
		end
	end

	function slot5(slot0, slot1)
		return slot0.cfg.medalID < slot1.cfg.medalID
	end

	table.sort(slot1, slot5)

	slot0.allMedal = slot1
	uv5 = "otherData"
	slot0.maxPage = math.ceil(#slot1 / slot5)

	for slot7 = 1, math.ceil(slot0.maxPage / 2) do
	end

	slot0.pageDatas:update({
		[slot7] = {
			select = slot7 == slot0.rightPage:read() / 2
		}
	})
end

function slot12.updatePageDatas(slot0, slot1)
	uv2 = "LEFT"
	slot2 = slot1 == slot2.LEFT and slot0.leftPage:read() or slot0.rightPage:read()
	uv5 = "leftPage"
	uv5 = "leftPage"

	for slot7 = (slot2 - 1) * slot5 + 1, slot2 * slot5 do
		if slot0.allMedal[slot7] then
			table.insert({}, slot0.allMedal[slot7])
		else
			table.insert(slot3, {
				haveData = false
			})
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

function slot12.initListener(slot0)
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

function slot12.onChangePage(slot0, slot1, slot2, slot3)
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

function slot12.createSprite(slot0, slot1, slot2)
	if slot1 and slot1 ~= -1 then
		slot3 = {}
		uv5 = "allMedal"
		uv5 = "allMedal"

		for slot7 = (slot1 - 1) * slot5 + 1, slot1 * slot5 do
			if slot0.allMedal[slot7] then
				table.insert(slot3, slot0.allMedal[slot7])
			else
				table.insert(slot3, {
					haveData = false
				})
			end
		end

		slot0.copyLeftDatas:update(slot3)
	else
		slot0.copyLeftDatas:update({})
	end

	if slot2 and slot2 ~= -1 then
		slot3 = {}
		uv5 = "allMedal"
		uv5 = "allMedal"

		for slot7 = (slot2 - 1) * slot5 + 1, slot2 * slot5 do
			if slot0.allMedal[slot7] then
				table.insert(slot3, slot0.allMedal[slot7])
			else
				if isEmptyPage then
					break
				end

				table.insert(slot3, {
					haveData = false
				})
			end
		end

		slot0.copyRightDatas:update(slot3)
	else
		slot0.copyRightDatas:update({})
	end

	slot3 = 1
	slot4 = cc.utils:captureNodeSprite(slot0.listBehindPanel, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888, slot3, 0, 0)

	slot4:scale(1 / slot3)

	return slot4
end

function slot12.createTestButton(slot0)
	ccui.Text:create(slot0.runTime, ui.FONT_PATH, 36):align(cc.p(1, 0), 0, 14):addTo(ccui.Layout:create():size(100, 100):addTo(slot0.imgBg, 20, "testPanel"):anchorPoint(0.5, 0.5):xy(300, 500), 10, "num")
	text.addEffect(slot0.imgBg:get("testPanel.num"), {
		color = ui.COLORS.NORMAL.DEFAULT
	})

	function slot2(slot0, slot1, slot2)
		slot3 = ccui.Button:create("img/editor/btn.png")

		slot3:setPosition(slot0)
		slot3:setTitleFontSize(30)

		slot4 = slot3.setTitleText

		slot4(slot3, slot1)

		uv4 = "ccui"

		slot4.imgBg:addChild(slot3, 100)
		slot3:onClick(slot2)
	end

	slot2(cc.p(250, 300), "+0.5", function ()
		uv0 = "runTime"
		uv1 = "runTime"
		slot0.runTime = slot1.runTime + 0.5
		uv0 = "runTime"
		slot2 = "testPanel.num"
		uv2 = "runTime"

		slot0.imgBg:get(slot2):text(slot2.runTime)
	end)
	slot2(cc.p(250, 200), "-0.5", function ()
		uv0 = "runTime"
		uv3 = "runTime"
		slot0.runTime = math.max(0.5, slot3.runTime - 0.5)
		uv0 = "runTime"
		slot2 = "testPanel.num"
		uv2 = "runTime"

		slot0.imgBg:get(slot2):text(slot2.runTime)
	end)
end

function slot12.bookAction(slot0, slot1, slot2, slot3)
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

		slot6 = slot4.setPosition

		slot6(slot4, cc.p(-10, -1))

		uv6 = "createSprite"

		if slot6 then
			label.create(string.format("第%s页", slot3), {
				fontSize = 100,
				color = cc.c4b(91, 84, 91, 255)
			}):addTo(slot4, 100, "txt"):xy(slot5.width / 4, slot5.height / 2):scaleX(-1)
		end

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

		uv8 = "createSprite"

		if slot8 then
			label.create(string.format("第%s页", slot6), {
				fontSize = 100,
				color = cc.c4b(91, 84, 91, 255)
			}):addTo(slot7, 100, "txt"):xy(slot5.width / 4, slot5.height / 2)
		end

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
		uv12 = "setTextureRect"

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
		uv2 = "curDir"
		slot2 = slot2.leftPage
		slot2 = slot2.set

		slot2(slot2, slot1.read(slot2) - 2, true)

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

		uv4 = "leftPage"

		if slot4 then
			label.create(string.format("第%s页", slot0), {
				fontSize = 100,
				color = cc.c4b(91, 84, 91, 255)
			}):addTo(slot2, 100, "txt"):xy(slot3.width / 4, slot3.height / 2):scaleX(-1)
		end

		uv4 = "curDir"
		slot4 = slot4:createSprite(nil, slot1 + 1)
		slot7 = cc.rect

		slot4:setTextureRect(slot7(math.ceil(slot3.width / 2) - 10, 0, math.ceil(slot3.width / 2), slot3.height))

		uv7 = "LEFT"

		slot4:addTo(slot7)

		slot5 = slot4.setPosition

		slot5(slot4, cc.p(0, -1))

		uv5 = "leftPage"

		if slot5 then
			label.create(string.format("第%s页", slot1 + 1), {
				fontSize = 100,
				color = cc.c4b(91, 84, 91, 255)
			}):addTo(slot4, 100, "txt"):xy(slot3.width / 4, slot3.height / 2)
		end

		slot6 = slot4

		slot4.hide(slot6)

		uv6 = "curDir"
		uv8 = "curDir"
		uv9 = "read"
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

function slot12.onNextPageClick(slot0)
	uv3 = "bookAction"

	slot0:bookAction(slot3.RIGHT, math.ceil(slot0.nextPage / 2))
end

function slot12.onShowAttrClick(slot0)
	slot0.showFilter:set(false)

	if itertools.size(slot0.attrDatas) == 0 then
		gGameUI:showTip(gLanguageCsv.medalCollectionNoAttr)
	else
		gGameUI:showItemDetailCustom(slot0.btnAttr, {
			isAttr = true,
			data = slot0.attrDatas
		}, "city.medal_collection.tip", {
			tipParams = {
				dir = "left",
				offy = 500,
				offx = 340
			}
		})
	end
end

function slot12.onItemClick(slot0, slot1, slot2, slot3, slot4)
	if slot0.curDir:read() ~= 0 then
		return
	end

	if slot0.isOther then
		gGameUI:showItemDetailCustom(slot2, {
			isAttr = false,
			data = slot4
		}, "city.medal_collection.tip", {
			tipParams = {
				dir = slot3.row == 2 and slot3.col >= 3 and "left" or "right",
				offx = slot3.row == 1 and -500 or slot3.col >= 3 and 150 or -200,
				offy = slot3.row == 1 and -200 or 0
			}
		})
	else
		gGameUI:stackUI("city.medal_collection.detail", nil, {
			clickClose = true
		}, {
			csvId = slot4.cfg.id,
			colorNum = slot3.k <= 4 and slot3.k or math.abs(slot3.k - 9)
		})
	end
end

return slot12
