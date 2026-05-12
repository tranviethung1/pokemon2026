slot0 = class("PersonalFigureView", Dialog)
slot1 = {
	{
		val = 1,
		name = gLanguageCsv.spaceAll
	},
	{
		val = 2,
		name = gLanguageCsv.unlockSuccess
	},
	{
		val = 3,
		name = gLanguageCsv.canUnlock
	},
	{
		val = 4,
		name = gLanguageCsv.notUnlock
	}
}
slot2 = {
	ALL = 1,
	UNLOCKED = 2,
	NOT_UNLOCK = 4,
	CAN_UNLOCK = 3
}
slot3 = {
	UNLOCKED = 1,
	NOT_UNLOCK = 3,
	NO_SHOW = 4,
	CAN_UNLOCK = 2
}
slot4 = {
	FIGURE_EXPLAIN = 2,
	FIGURE_ATTR = 1
}
slot5 = 3
slot6 = {
	"effect_shiyongzhong_loop",
	"effect_xuanzhong",
	"effect_jiesuo"
}

function slot7(slot0, slot1, slot2, slot3)
	for slot7 = 1, math.huge do
		if not slot1:get("item" .. slot7) then
			break
		end

		slot8:removeFromParent()
	end

	if slot3[1].sign == "title" then
		slot6 = slot1:get("title")

		slot6:visible(true)
		slot1:get("list"):visible(false)
		slot6:text(slot3[1].typ == 1 and gLanguageCsv.normalFigure or gLanguageCsv.raceFigure)

		slot7 = slot6:getBoundingBox()

		slot1:size(cc.size(slot0:size().width, slot7.height))
		slot6:y(slot7.height / 2 - 10)
	else
		slot1:get("title"):visible(false)
		slot1:get("list"):visible(true)

		slot6 = slot0.cloneItem:size()

		slot1:size(cc.size(slot4, slot6.height))
		slot1:get("list"):size(cc.size(slot4, slot6.height))
		bind.extend(slot0, slot1:get("list"), {
			class = "listview",
			props = {
				data = slot3,
				item = slot0.cloneItem,
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(gRoleFigureCsv[slot3.id].logo):scale(1.7)
					slot1:get("selected"):visible(slot3.isSel)
					slot1:get("used"):visible(slot3.isUse)

					uv8 = "gRoleFigureCsv"

					slot1:get("locked"):visible(slot3.unlocked ~= slot8.UNLOCKED)

					slot5 = slot1:get("locked.lock")
					slot6 = slot5
					slot5 = slot5.visible
					uv8 = "gRoleFigureCsv"

					if slot3.unlocked ~= slot8.UNLOCKED then
						uv8 = "gRoleFigureCsv"

						if slot3.unlocked == slot8.CAN_UNLOCK then
							slot7 = false
						else
							slot7 = true
						end
					end

					slot5(slot6, slot7)

					uv9 = "id"
					slot5 = widget.addAnimationByKey(slot1, "figure/touxiang.json", "effect", slot9[1], 16):alignCenter(slot1:size()):scale(0.55)
					slot6 = slot5
					slot3.figureSprite = slot5.hide(slot6)
					uv6 = "gRoleFigureCsv"

					if slot3.unlocked == slot6.CAN_UNLOCK then
						uv8 = "id"

						widget.addAnimation(slot1, "figure/touxiang.json", slot8[1], 15):alignCenter(slot1:size()):scale(0.55)
					end

					if slot3.isAuto then
						uv7 = "id"

						slot3.figureSprite:show():play(slot7[2])

						slot3.isAuto = false
					end

					uv6 = "get"
					uv11 = "get"
					uv12 = "icon"

					bind.touch(slot6, slot1, {
						methods = {
							ended = functools.partial(slot11.clickCell, slot12, slot2, slot3)
						}
					})
				end
			}
		})
	end
end

slot0.RESOURCE_FILENAME = "personal_figure.json"
slot0.RESOURCE_BINDING = {
	name = "figureName",
	costPanel = "costPanel",
	itemSkill = "itemSkill",
	emptyPanel = "emptyPanel",
	conditionList = "conditionList",
	specialTxt = "specialTxt",
	descPanel = "descPanel",
	["addPanel.title1"] = "addPanelTitle1",
	lockSkillPanel = "lockSkillPanel",
	item = "item",
	complete = "complete",
	skillDescPanel = "skillDescPanel",
	itemLogo = "figureSubItem",
	condition = "condition",
	addPanel = "addPanel",
	["addPanel.itemAttr"] = "itemAttr",
	skillTitle = "skillTitle",
	["addPanel.list"] = "attrList",
	skillCurrentTitle = "skillCurrentTitle",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	leftList = {
		varname = "figureList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 7,
				data = bindHelper.self("figureDatas"),
				item = bindHelper.self("item"),
				cloneItem = bindHelper.self("figureSubItem"),
				itemAction = {
					isAction = true
				},
				onItem = function ()
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
				clickCell = bindHelper.self("onClickItem")
			}
		}
	},
	pos = {
		binds = {
			event = "extend",
			class = "sort_menus",
			props = {
				btnWidth = 308,
				height = 80,
				btnHeight = 102,
				btnType = 3,
				width = 310,
				data = bindHelper.self("filterTabData"),
				btnClick = bindHelper.self("onSortMenusBtnClick", true),
				onNode = function (slot0)
					slot0:xy(-1120, -502):z(25)
				end
			}
		}
	},
	btnAdd = {
		varname = "btnAdd",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onChangeClick(1)
				end)
			}
		}
	},
	btnDesc = {
		varname = "btnDesc",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onChangeClick(2)
				end)
			}
		}
	},
	skillList = {
		varname = "skillList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("skillData"),
				item = bindHelper.self("itemSkill"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = "skillPanel"
					uv6 = "get"
					uv7 = "get"
					uv8 = "get"
					slot7 = slot3.state == slot8.NOT_UNLOCK

					slot1:get(slot6):visible(slot3.id ~= -1)
					slot1:get("imgAdd"):visible(slot3.state == slot6.UNLOCKED and slot3.id == -1)
					slot1:get("imgInfo"):visible(slot3.state == slot7.CAN_UNLOCK)
					slot1:get("imgSuo"):visible(slot7)
					slot1:setTouchEnabled(not slot7)

					if slot3.id ~= -1 then
						slot4:get("imgSkill"):texture(csv.skill[slot3.id].iconRes)
					end

					if slot6 then
						uv11 = "skillPanel"
						slot10 = 0.55
						uv10 = "skillPanel"
						slot8 = widget.addAnimation(slot1, "figure/touxiang.json", slot11[1], 15):alignCenter(slot1:size()):scale(slot10):play(slot10[1])
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.btnClick, slot2, slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				afterBuild = bindHelper.self("onAfterBuild"),
				btnClick = bindHelper.self("onBtnClick")
			}
		}
	},
	["btnSave.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	btnSave = {
		varname = "btnSave",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnSaveClick")
			}
		}
	},
	figureIcon = {
		binds = {
			event = "extend",
			class = "role_figure",
			props = {
				data = bindHelper.self("figureId"),
				onNode = function (slot0)
					slot0:scale(0.78)
				end
			}
		}
	},
	shade = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnClickClose")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.cb = slot1

	slot0.attrList:setScrollBarEnabled(false)

	slot0.skillCountLimit = gCommonConfigCsv.figureSkillLimit
	slot0.unLockSkillLimit = {
		0,
		gCommonConfigCsv.figureSkill2,
		gCommonConfigCsv.figureSkill3
	}
	slot0.unLockSkillCost = gCostCsv.figure_skill_unlock_cost
	slot0.selItemInfo = slot0.selItemInfo or {}
	slot3 = slot0

	slot0.initModel(slot3)

	slot0.skillData = idlers.new()
	uv3 = "cb"
	slot0.filterKey = idler.new(slot3.ALL)
	slot0.figureId = idler.new()
	slot0.selectData = idlertable.new({})
	slot0.figureBaseDatas = idlertable.new()
	slot0.figureDatas = idlers.new()
	slot2 = {}
	uv4 = "attrList"

	for slot6, slot7 in pairs(slot4) do
		table.insert(slot2, slot7.name)
	end

	slot0.filterTabData = idlertable.new(slot2)

	idlereasy.any({
		slot0.figures,
		slot0.vipLevel,
		slot0.roleLv,
		slot0.figure,
		slot0.gold,
		slot0.rmb
	}, function (slot0, slot1, slot2, slot3, slot4)
		uv5 = "refreshFigureBaseIdlerData"

		slot5:refreshFigureBaseIdlerData()
	end)
	idlereasy.any({
		slot0.filterKey,
		slot0.figureBaseDatas
	}, function (slot0, slot1, slot2)
		uv3 = "isActive"

		if not slot3.isActive then
			slot4 = gLanguageCsv.withoutSomeFigure
			uv5 = "isActive"
			uv4 = "isActive"
			slot4 = slot4.emptyPanel:get("txt")
			slot4 = slot4.text

			slot4(slot4, string.format(slot4, slot5.filterTabData:read()[slot1]))

			uv4 = "isActive"

			slot4:refreshFigureIdlerData(slot2)
		end
	end)
	slot0.selectData:addListener(function (slot0, slot1)
		uv2 = "btnClickClose"
		slot2 = slot2.btnClickClose

		slot2(slot2)

		uv2 = "btnClickClose"
		slot2 = slot2.setCostItemState

		slot2(slot2, slot0.id, slot0.unlocked, slot0.typ)

		uv2 = "btnClickClose"
		slot2 = slot2.setBtnState

		slot2(slot2, slot0.unlocked)

		uv2 = "btnClickClose"

		slot2:setFigureBaseInfo(slot0.id)
	end)
	idlereasy.any({
		slot0.skillFigure,
		slot0.skillCount
	}, function ()
		uv0 = "selectData"
		slot0 = slot0.selectData
		slot1 = slot0
		slot0 = slot0.read(slot1)
		uv1 = "selectData"

		slot1:setCostItemState(slot0.id, slot0.unlocked, slot0.typ)
	end)

	slot0.showType = idler.new(1)

	idlereasy.when(slot0.showType, function (slot0, slot1)
		uv2 = "FIGURE_ATTR"
		slot2 = slot2.FIGURE_ATTR == slot1
		uv3 = "addPanel"
		slot3 = slot3.addPanel
		slot3 = slot3.visible

		slot3(slot3, slot2)

		uv3 = "addPanel"
		slot3 = slot3.descPanel
		slot3 = slot3.visible

		slot3(slot3, not slot2)

		uv3 = "addPanel"
		slot3 = slot3.btnAdd
		slot3 = slot3.setBright

		slot3(slot3, not slot2)

		uv3 = "addPanel"

		slot3.btnDesc:setBright(slot2)

		if slot2 then
			uv3 = "addPanel"

			if not slot3.btnAdd:get("txt") then
				uv3 = "addPanel"
				slot3 = slot3.btnDesc:get("txt")
			end
		end

		if not slot2 then
			uv4 = "addPanel"

			if not slot4.btnAdd:get("txt") then
				uv4 = "addPanel"
				slot4 = slot4.btnDesc:get("txt")
			end
		end

		text.addEffect(slot3, {
			color = ui.COLORS.NORMAL.WHITE,
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
		text.deleteAllEffect(slot4)
		text.addEffect(slot4, {
			color = ui.COLORS.NORMAL.RED
		})
	end)
	slot0.addPanel:get("desc"):text(gLanguageCsv.personalDesc)
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot0.figure = gGameModel.role:getIdler("figure")
	slot0.figures = gGameModel.role:getIdler("figures")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.gateStar = gGameModel.role:getIdler("gate_star")
	slot0.fightingPoint = gGameModel.role:getIdler("battle_fighting_point")
	slot0.pwRank = gGameModel.role:getIdler("pw_rank")
	slot0.skillFigure = gGameModel.role:getIdler("skill_figures")
	slot0.skillCount = gGameModel.role:getIdler("figure_skill_count")
end

function slot0.refreshFigureBaseIdlerData(slot0)
	slot3 = {}

	for slot7, slot8 in csvPairs(gRoleFigureCsv) do
		if slot8.hide == 0 then
			slot10 = slot0.figure:read() == slot7
			uv10 = "figure"

			function slot10()
				uv1 = "csvNext"

				if csvNext(slot1.unlock) then
					uv1 = "csvNext"
					slot0, slot1 = csvNext(slot1.activeCost)
					uv3 = "csvNext"
					slot2, slot3 = csvNext(slot3.unlock)

					if slot1 <= dataEasy.getNumByKey(slot0) then
						uv4 = "unlock"

						if slot4:getConditionLevel(slot2, slot3) then
							uv4 = "activeCost"
							uv5 = "dataEasy"
							slot4.unlocked = slot5.CAN_UNLOCK
						end
					end
				end
			end

			if slot0.figures:read()[slot7] then
				uv11 = "figure"
			else
				slot10()
			end

			table.insert(slot3, {
				isSel = false,
				isUse = slot10,
				unlocked = slot10.NOT_UNLOCK,
				showIdx = slot8.showIdx,
				typ = slot8.type,
				id = slot7,
				unlocked = slot11.UNLOCKED
			})
		end
	end

	table.sort(slot3, function (slot0, slot1)
		if slot0.unlocked ~= slot1.unlocked then
			return slot0.unlocked < slot1.unlocked
		end

		if slot0.showIdx ~= slot1.showIdx then
			return slot1.showIdx < slot0.showIdx
		end

		return slot0.id < slot1.id
	end)
	slot0.figureBaseDatas:set(slot3)
end

function slot0.refreshFigureIdlerData(slot0, slot1)
	slot2 = slot0.filterKey:read()
	slot3 = {}

	for slot7, slot8 in ipairs(slot1) do
		slot8.isSel = false

		if slot3[slot8.typ] == nil then
			slot3[slot8.typ] = {}
		end

		if slot2 == 1 then
			table.insert(slot3[slot8.typ], slot8)
		elseif slot2 == slot8.unlocked then
			table.insert(slot3[slot8.typ], slot8)
		end
	end

	slot0.emptyPanel:visible(#slot0:resetDataStruct(slot3) == 0)
	slot0.figureDatas:update(slot3)
end

function slot0.resetDataStruct(slot0, slot1)
	slot3 = 0
	slot4 = 0
	slot5 = 0
	slot6 = nil
	slot7 = slot0.selectData:read()

	for slot11, slot12 in ipairs(slot1) do
		if #slot12 > 0 then
			table.insert({}, {
				{
					sign = "title",
					typ = slot11
				}
			})
		end

		slot13 = {}

		for slot17, slot18 in ipairs(slot12) do
			if slot17 % 3 == 1 then
				if slot17 > 3 then
					table.insert(slot2, slot13)
				end

				slot13 = {}
			end

			table.insert(slot13, slot18)

			if slot3 < 3 then
				if slot7.id and slot7.id == slot18.id then
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
						-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
						--     return _build_string_constant(state, instruction.CD)
						--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
						-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
						--     node.value = state.constants.complex_constants[index]
						--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
						-- IndexError: list index out of range
					end(3)
				end

				if slot3 < 2 then
					if slot18.isUse then
						slot19(2)
					end

					if slot3 == 0 then
						slot19(1)
					end
				end
			end
		end

		if #slot13 > 0 then
			table.insert(slot2, slot13)

			slot13 = {}
		end
	end

	if slot6 then
		if slot5 == 0 then
			slot5 = 3
		end

		slot0.selItemInfo = {
			row = slot4,
			idx = slot5
		}
		slot2[slot4][slot5].isSel = true

		slot0.selectData:set(slot6)
	end

	return slot2
end

function slot0.getConditionLevel(slot0, slot1, slot2)
	if slot1 == 1 then
		return slot2 <= slot0.roleLv:read()
	end

	if slot1 == 2 then
		return (slot0.gateStar:read()[slot2] or 0) >= 1
	end

	if slot1 == 5 then
		return slot2 <= slot0.vipLevel:read()
	end

	if slot1 == 6 then
		return slot2 <= slot0.fightingPoint:read()
	end

	if slot1 == 44 then
		return slot2 <= slot0.pwRank:read()
	end

	if slot1 == 79 then
		return slot2 <= gGameModel.role:read("trainer_level")
	end
end

function slot0.setFigureBaseInfo(slot0, slot1)
	slot2 = gRoleFigureCsv[slot1]

	slot0.figureName:text(slot2.name)
	slot0.figureId:set(slot1)
	beauty.textScroll({
		isRich = true,
		list = slot0.descPanel:get("list"),
		strs = "#C0x5B545B#" .. slot2.desc
	})

	slot3 = {}
	slot4 = 0

	for slot8 = 1, 3 do
		if not slot3[slot2["attrNatureType" .. slot8] + 1] then
			slot3[slot4] = {}
		end

		if slot2["attrType" .. slot8] ~= 0 then
			table.insert(slot3[slot4], {
				attrType = slot9,
				attrValue = slot2["attrValue" .. slot8]
			})
		end
	end

	slot0.attrList:removeAllChildren()
	slot0.addPanelTitle1:text(gLanguageCsv.allTeamActiveText)

	for slot8, slot9 in pairs(slot3) do
		for slot13, slot14 in pairs(slot9) do
			slot16 = slot0.itemAttr:clone():show():multiget("txt", "icon")
			slot17 = slot8 == 1 and gLanguageCsv.allSprite or string.format(gLanguageCsv.someSprite, gLanguageCsv[game.NATURE_TABLE[slot8 - 1]])

			slot16.icon:texture(ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot14.attrType]])
			slot16.txt:text(getLanguageAttr(slot14.attrType) .. " +" .. dataEasy.getAttrValueString(slot14.attrType, slot14.attrValue))
			adapt.oneLinePos(slot16.icon, slot16.txt, cc.p(15, 0), "left")
			slot0.attrList:pushBackCustomItem(slot15)
		end

		slot0.addPanel:get("desc"):y(slot0.attrList:y() + slot0.attrList:height() - math.min(slot0.attrList:height(), slot0.attrList:getInnerItemSize().height) - 30)
	end
end

function slot0.setViewHideOrShow(slot0, slot1, slot2)
	uv3 = "UNLOCKED"
	slot3 = slot1 == slot3.UNLOCKED

	slot0.skillCurrentTitle:visible(slot3)
	slot0.skillList:visible(slot3)
	slot0.conditionList:visible(slot3)
	slot0.skillTitle:visible(not slot3 and slot2 == 2)
	slot0.lockSkillPanel:visible(not slot3 and slot2 == 2)

	slot6 = not slot3

	slot0.condition:visible(slot6)

	uv6 = "UNLOCKED"

	slot0.complete:visible(slot1 == slot6.CAN_UNLOCK)
end

function slot0.setCostItemState(slot0, slot1, slot2, slot3)
	slot4 = slot0.setViewHideOrShow

	slot4(slot0, slot2, slot3)

	uv4 = "setViewHideOrShow"

	if slot2 == slot4.UNLOCKED then
		slot4 = {}
		slot5 = gRoleFigureCsv[slot1]

		if slot0.skillFigure:read()[slot1] then
			for slot11, slot12 in pairs(slot7) do
				table.insert(slot4, {
					id = gRoleFigureCsv[slot12].skills[1],
					figureId = slot12
				})
			end
		else
			table.insert(slot4, {
				id = slot5.skills[1],
				figureId = slot1
			})
		end

		slot8 = slot0.skillCount:read()
		slot10 = table.nums(slot0.figures:read())

		for slot14 = 1, slot0.skillCountLimit do
			if slot4[slot14] == nil then
				slot4[slot14] = {}
			end

			slot15.id = slot4[slot14].id or -1
			slot15.figureId = slot15.figureId or -1

			if slot14 <= slot8 then
				uv16 = "UNLOCKED"
				slot15.state = slot16.UNLOCKED
			else
				if slot0.unLockSkillLimit[slot14] <= slot10 then
					uv16 = "UNLOCKED"
					slot15.state = slot16.CAN_UNLOCK

					break
				end

				uv16 = "UNLOCKED"
				slot15.state = slot16.NOT_UNLOCK

				break
			end
		end

		slot0.skillData:update(slot4)
	else
		if slot3 == 2 then
			slot0:setLockSkillPanel(slot1)
		end

		slot0:showActiveState(slot1, slot2)
	end

	slot0:setSkillTip()
end

function slot0.setLockSkillPanel(slot0, slot1)
	slot4 = csv.skill[gRoleFigureCsv[slot1].skills[1]]

	slot0.lockSkillPanel:get("icon"):texture(slot4.iconRes)
	slot0.lockSkillPanel:get("name"):text(slot4.skillName)
	beauty.textScroll({
		isRich = true,
		list = slot0.lockSkillPanel:get("descList"),
		strs = "#C0x5B545B#" .. dataEasy.getSkillDesc(slot4)
	})
end

function slot0.showActiveState(slot0, slot1, slot2)
	slot0.condition:text(gRoleFigureCsv[slot1].unlockDesc)

	uv7 = "gRoleFigureCsv"

	text.addEffect(slot0.condition, {
		color = slot2 == slot7.CAN_UNLOCK and ui.COLORS.NORMAL.FRIEND_GREEN or ui.COLORS.QUALITY[6]
	})
	adapt.oneLinePos(slot0.condition, slot0.complete, cc.p(10, 0))

	if slot3.activeCost then
		slot0.specialTxt:hide()
		slot0.costPanel:show()
		slot0.btnSave:show()
	else
		slot0.specialTxt:show()
		slot0.costPanel:hide()
		slot0.btnSave:hide()

		return
	end

	slot5, slot6 = csvNext(slot4)
	slot7 = slot0.costPanel:multiget("item", "icon", "txt", "title")

	if slot5 == "rmb" or slot5 == "gold" then
		slot7.title:show()
		slot0.costPanel:get("item"):hide()
		slot0.costPanel:get("icon"):texture(string.format("common/icon/icon_%s.png", slot5 == "rmb" and "diamond" or "gold")):show()
		slot0.costPanel:get("txt"):text(slot6):show()
		adapt.oneLinePos(slot7.icon, slot7.txt, cc.p(10, 0), "right")
		adapt.oneLinePos(slot7.txt, slot7.title, cc.p(0, 0), "right")
	else
		slot7.title:hide()
		slot8:show()
		slot0.costPanel:get("icon"):hide()
		slot0.costPanel:get("txt"):hide()

		slot9 = slot0.costPanel:size()
		slot10 = dataEasy.getNumByKey(slot5)

		bind.extend(slot0, slot8, {
			class = "icon_key",
			props = {
				data = {
					key = slot5,
					num = slot10,
					targetNum = slot6
				},
				grayState = slot6 <= slot10 and 0 or 1,
				onNode = function (slot0)
					slot0:scale(0.9)
				end
			}
		})
	end

	text.addEffect(slot0.costPanel:get("txt"), {
		color = slot6 <= dataEasy.getNumByKey(slot5) and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.NORMAL.RED
	})
end

function slot0.setBtnState(slot0, slot1)
	slot2 = gLanguageCsv.spaceActive
	uv3 = "gLanguageCsv"

	if slot1 == slot3.UNLOCKED then
		slot0.btnSave:show()
		slot0.specialTxt:hide()
		slot0.costPanel:hide()

		slot2 = gLanguageCsv.spaceUse
	end

	uv5 = "gLanguageCsv"

	slot0.btnSave:setTouchEnabled(slot1 ~= slot5.NOT_UNLOCK)

	slot3 = cache.setShader
	uv6 = "gLanguageCsv"

	slot3(slot0.btnSave, false, slot1 ~= slot6.NOT_UNLOCK and "normal" or "hsl_gray")

	uv3 = "gLanguageCsv"

	if slot1 == slot3.NOT_UNLOCK then
		text.deleteAllEffect(slot0.btnSave:get("txt"))
	else
		text.addEffect(slot0.btnSave:get("txt"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
	end

	slot0.btnSave:get("txt"):text(slot2)
end

function slot0.setSkillTip(slot0)
	slot4 = ""

	if slot0.skillCount:read() < slot0.skillCountLimit then
		slot4 = (table.nums(slot0.figures:read()) >= slot0.unLockSkillLimit[slot1 + 1] or string.format(gLanguageCsv.unlockSkillLimitTip, slot0.unLockSkillLimit[slot1 + 1])) and string.format(gLanguageCsv.unlockSkillCostTip, slot0.unLockSkillCost[slot1])
	end

	beauty.textScroll({
		isRich = true,
		align = "left",
		list = slot0.conditionList,
		strs = {
			slot4,
			gLanguageCsv.sureChangeSkillTip
		}
	})
end

function slot0.onChangeClick(slot0, slot1)
	slot0.showType:set(slot1)
end

function slot0.btnClickClose(slot0)
	if slot0.showSkillDesc then
		slot0.skillDescPanel:visible(false)

		slot0.showSkillDesc = false
	end
end

function slot0.btnSaveClick(slot0)
	uv3 = "selectData"

	if slot0.selectData:read().unlocked == slot3.UNLOCKED then
		if slot0.figure:read() ~= slot1.id then
			gGameApp:requestServer("/game/role/figure", function ()
				uv0 = "onClose"

				slot0:onClose()
			end, slot1.id)
		end
	else
		if slot0.isActive then
			return
		end

		if gRoleFigureCsv[slot1.id].activeCost then
			slot4, slot5 = csvNext(slot3.activeCost)

			if slot4 == "rmb" then
				dataEasy.sureUsingDiamonds(function ()
					uv0 = "isActive"
					slot0.isActive = true
					uv0 = "isActive"

					slot0.btnSave:setTouchEnabled(false)

					slot3 = "/game/role/figure_active"
					uv3 = "btnSave"

					gGameApp:requestServerCustom(slot3):params(slot3.id):onResponse(function (slot0)
						slot1 = gGameUI
						slot1 = slot1.showTip

						slot1(slot1, gLanguageCsv.activeSuccess)

						uv1 = "gGameUI"
						slot1 = slot1.figureSprite

						slot1:show()

						uv4 = "showTip"

						slot1:play(slot4[3])

						slot2 = slot1.setSpriteEventHandler

						slot2(slot1, function (slot0, slot1)
							uv2 = "setSpriteEventHandler"
							slot3 = slot2

							slot2.setSpriteEventHandler(slot3)

							uv3 = "performWithDelay"

							performWithDelay(slot3, function ()
								uv0 = "isActive"
								slot0.isActive = false
								uv0 = "isActive"
								slot0[1] = true
							end, 0.01)
						end, sp.EventType.ANIMATION_COMPLETE)

						uv2 = "gGameUI"

						if slot2.id == 7 then
							sdk.trackEvent("dia_alexa")
						end
					end):wait({
						false
					}):doit(function (slot0)
						uv1 = "setBtnState"
						slot1 = slot1.setBtnState
						uv3 = "UNLOCKED"

						slot1(slot1, slot3.UNLOCKED)

						uv1 = "setBtnState"
						slot1 = slot1.btnSave
						slot1 = slot1.setTouchEnabled
						slot3 = true

						slot1(slot1, slot3)

						uv1 = "setBtnState"
						uv3 = "setBtnState"

						slot1.filterKey:set(slot3.filterKey:read(), true)
					end)
				end, slot5)
			else
				slot2()
			end
		else
			slot2()
		end
	end
end

function slot0.onSortMenusBtnClick(slot0, slot1, slot2, slot3, slot4)
	dataEasy.tryCallFunc(slot0.figureList, "setItemAction", {
		isAction = true,
		alwaysShow = true
	})
	slot0.filterKey:set(slot3)
	dataEasy.tryCallFunc(slot0.figureList, "setItemAction", {
		isAction = false
	})
end

function slot0.onAfterBuild(slot0)
	slot1 = slot0.skillData:size() == 0
end

function slot0.onBtnClick(slot0, slot1, slot2, slot3)
	uv5 = "state"
	slot4 = slot3.state == slot5.UNLOCKED
	uv6 = "state"

	if slot3.state == slot6.CAN_UNLOCK then
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			strs = {
				string.format(gLanguageCsv.sureBuyFigureSkillTip, slot0.unLockSkillCost[slot0.skillCount:read()]),
				gLanguageCsv.sureChangeSkillTip2
			},
			cb = function ()
				uv4 = "gGameApp"

				gGameApp:requestServer("/game/role/figure/skill/unlock", function (slot0)
				end, slot4)
			end,
			dialogParams = {
				clickClose = false
			}
		})
	end

	if slot4 then
		gGameUI:stackUI("city.personal.skill_choose", nil, {
			clickClose = true
		}, slot0.selectData:read().id, slot3.figureId, slot2)
	end
end

function slot0.onClickItem(slot0, slot1, slot2, slot3, slot4)
	slot0.figureDatas:atproxy(slot0.selItemInfo.row)[slot0.selItemInfo.idx].isSel = false
	slot0.selItemInfo = {
		row = slot2,
		idx = slot3
	}
	slot0.figureDatas:atproxy(slot2)[slot3].isSel = true
	slot0.figureDatas:atproxy(slot2)[slot3].isAuto = true

	slot0.selectData:set(slot4)
end

function slot0.onClose(slot0)
	slot0:addCallbackOnExit(slot0.cb)
	Dialog.onClose(slot0)
end

return slot0
