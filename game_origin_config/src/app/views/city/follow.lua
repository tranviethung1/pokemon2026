slot1 = class("FollowView", cc.load("mvc").ViewBase)

function slot2(slot0)
	slot1 = ""

	if not slot0 then
		slot2 = clone(ui.RARITY_ICON)
		slot2[table.maxn(slot2) + 1] = slot1

		return slot2
	end

	return ui.RARITY_ICON[slot0] or slot1, not ui.RARITY_ICON[slot0]
end

slot1.RESOURCE_FILENAME = "follow.json"
slot1.RESOURCE_BINDING = {
	btnFlip = "btnFlip",
	["rightPanel.noData"] = "noData",
	role = "role",
	["rightPanel.subList"] = "subList",
	["rightPanel.item"] = "item",
	card = "card",
	["rightPanel.rarityItem"] = "rarityItem",
	rightPanel = "rightPanel",
	btnSure = {
		varname = "btnSure",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnSureClick")
			}
		}
	},
	["rightPanel.btnSure.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightPanel.btnAll"] = {
		varname = "btnAll",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSelectedAll")
			}
		}
	},
	["rightPanel.rarityList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 50,
				data = bindHelper.self("rarityDatas"),
				item = bindHelper.self("rarityItem"),
				dataOrderCmp = function (slot0, slot1)
					return slot1.rarity < slot0.rarity
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					uv4 = "rarity"

					slot1:get("img"):texture(slot4(slot3.rarity))
					slot1:get("selected"):hide()

					if slot3.selected then
						slot1:get("selected"):show()
					end

					slot1:onClick(functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3))
				end
			},
			handlers = {
				itemClick = bindHelper.self("onRarityItemClick")
			}
		}
	},
	["rightPanel.item.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.ALERT_ORANGE
				}
			}
		}
	},
	["rightPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				yMargin = 10,
				columnSize = 5,
				asyncPreload = 25,
				xMargin = 10,
				topPadding = 10,
				leftPadding = 10,
				data = bindHelper.self("cardsDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				dataFilterGen = bindHelper.self("onFilterFurns", true),
				dataOrderCmp = function (slot0, slot1)
					if slot0.feelLevel == slot1.feelLevel then
						return slot1.rarity < slot0.rarity
					end

					return slot1.feelLevel < slot0.feelLevel
				end,
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:get("icon"), {
						class = "card_icon",
						props = {
							unitId = dataEasy.getUnitId(slot3.cardId, slot3.skinId),
							rarity = slot3.rarity,
							onNode = function (slot0)
							end
						}
					})
					slot1:get("select"):hide()
					slot1:get("txt"):hide()

					if slot3.selected then
						slot1:get("select"):show()
					end

					if slot3.followed then
						slot1:get("txt"):show()
					end

					slot1:onClick(functools.partial(slot0.itemClick, slot2, slot3))
				end
			},
			handlers = {
				itemClick = bindHelper.self("onCardItemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("checkSelectCard")
	}):init({
		notShow = false,
		subTitle = "FOLLOW",
		title = gLanguageCsv.follow
	})
	gGameUI:disableTouchDispatch(nil, true)

	slot0.cb = slot1.cb
	slot0.followCardPanel = slot1.panel:get("followCardPanel")

	slot0:initModel()
	slot0:updataData()
	adapt.setTextAdaptWithSize(slot0.noData:get("txt"), {
		maxLine = 3,
		vertical = "center",
		horizontal = "center",
		size = cc.size(500, 150)
	})
end

function slot1.initModel(slot0)
	slot0.rarity = idler.new(0)
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.cardFeels = gGameModel.role:getIdler("card_feels")
	slot0.followCardId = gGameModel.role:read("follow_sprite")
	slot0.cardsDatas = idlers.newWithMap({})
	slot0.rarityDatas = idlers.newWithMap(table.deepcopy(ui.RARITY_DATAS))
	slot0.selectedCardDbid = idler.new(slot0.followCardId[1])

	slot0.rarity:addListener(function (slot0, slot1)
		slot2 = dataEasy.tryCallFunc
		uv3 = "dataEasy"
		slot4 = "filterSortItems"

		slot2(slot3.list, slot4, false)

		uv2 = "dataEasy"
		uv4 = "dataEasy"

		slot2.noData:visible(slot4.list:getChildrenCount() <= 2)

		uv2 = "dataEasy"

		for slot5, slot6 in slot2.rarityDatas:pairs() do
			if slot5 == slot0 then
				uv7 = "dataEasy"
				slot7.rarityDatas:atproxy(slot5).selected = true
			elseif slot5 == slot1 then
				uv7 = "dataEasy"
				slot7.rarityDatas:atproxy(slot5).selected = false
			end
		end

		uv2 = "dataEasy"
		slot2 = slot2.btnAll:get("normal")
		slot2 = slot2.visible

		slot2(slot2, slot0 ~= 0)

		uv2 = "dataEasy"

		slot2.btnAll:get("select"):visible(slot0 == 0)
	end)
	slot0.selectedCardDbid:addListener(function (slot0, slot1)
		uv2 = "cardsDatas"

		for slot5, slot6 in slot2.cardsDatas:pairs() do
			if slot0 == slot6:read().dbid then
				uv7 = "cardsDatas"
				slot7 = slot7.initCard
				uv9 = "cardsDatas"

				slot7(slot7, slot9.cardsDatas:atproxy(slot5))

				uv7 = "cardsDatas"
				slot7.cardsDatas:atproxy(slot5).selected = true
			elseif slot1 == slot6:read().dbid then
				uv7 = "cardsDatas"
				slot7.cardsDatas:atproxy(slot5).selected = false
			end
		end
	end)
end

function slot1.initEditor(slot0)
	if not EDITOR_ENABLE then
		return false
	end

	text.addEffect(cc.Label:createWithTTF("↑↓←→调整位置 pageUp pageDown调整缩放", "font/youmi1.ttf", 50):addTo(slot0:getResourceNode(), 666):xy(400, 80):anchorPoint(0, 0.5):color(cc.c4b(255, 255, 0, 255)), {
		outline = {
			color = ui.COLORS.OUTLINE.DEFAULT
		}
	})

	slot0.editorLabel = cc.Label:createWithTTF("位置参数", "font/youmi1.ttf", 50):addTo(slot0:getResourceNode(), 666):xy(700, 150):anchorPoint(0, 0.5):color(cc.c4b(255, 0, 0, 255))

	text.addEffect(slot0.editorLabel, {
		outline = {
			color = ui.COLORS.OUTLINE.DEFAULT
		}
	})

	slot2 = nil

	idlereasy.when(slot0.selectedCardDbid, function (slot0, slot1)
		if slot1 ~= 0 and slot1 ~= nil then
			uv2 = "gGameModel"
			slot2 = slot2.followCardPanel
			uv0 = 460
			slot5 = "card_id"
			slot3 = gGameModel.cards:find(slot1):read(slot5, "unit_id", "skin_id")
			uv5 = "followCardPanel"
			slot6 = slot3.card_id
			uv6 = "gGameModel"
			uv11 = "followCardPanel"
			uv13 = "followCardPanel"

			slot6.editorLabel:text("cardid=" .. slot3.card_id .. " x=" .. slot11:x() - 1750 .. " y=" .. slot13:y() - 460 .. " followscale=" .. mathEasy.getPreciseDecimal(slot5:get("card"):scaleY(), 2, true) / dataEasy.getUnitCsv(slot6, slot3.skin_id).scale)
		else
			uv0 = nil
		end
	end)

	slot3 = false
	slot4 = {
		[27.0] = false,
		[25.0] = false,
		[26.0] = false,
		[28.0] = false,
		[29.0] = false,
		[22.0] = false
	}
	slot7 = cc.EventListenerKeyboard:create()

	slot7:registerScriptHandler(function ()
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
	end, cc.Handler.EVENT_KEYBOARD_PRESSED)
	slot7:registerScriptHandler(function ()
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
	end, cc.Handler.EVENT_KEYBOARD_RELEASED)
	slot0:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot7, slot0)
	slot0:enableSchedule()
	slot0:schedule(function (slot0)
		uv1 = "x"

		if slot1 then
			uv1 = "x"
			slot2 = slot1
			uv2 = "x"
			slot2 = slot2:y()
			slot3 = false
			uv5 = "x"
			slot6 = 2
			slot4 = mathEasy.getPreciseDecimal(slot5:get("card"):scaleY(), slot6, true)
			uv6 = "y"

			for slot8, slot9 in pairs(slot6) do
				if slot9 then
					if slot8 == 26 then
						uv10 = "x"

						slot10:x(slot1.x(slot2) - 1)
					elseif slot8 == 27 then
						uv10 = "x"

						slot10:x(slot1 + 1)
					elseif slot8 == 28 then
						uv10 = "x"

						slot10:y(slot2 + 1)
					elseif slot8 == 29 then
						uv10 = "x"

						slot10:y(slot2 - 1)
					elseif slot8 == 29 then
						uv10 = "x"

						slot10:y(slot2 - 1)
					elseif slot8 == 22 then
						uv10 = "x"
						slot10 = slot10:get("card")
						slot10 = slot10.scaleY

						slot10(slot10, slot4 - 0.01)

						uv10 = "x"

						slot10:get("card"):scaleX(0.01 - slot4)
					elseif slot8 == 25 then
						uv10 = "x"
						slot10 = slot10:get("card")
						slot10 = slot10.scaleY

						slot10(slot10, slot4 + 0.01)

						uv10 = "x"

						slot10:get("card"):scaleX(-0.01 - slot4)
					end

					slot3 = true
				end
			end

			if slot3 then
				uv7 = "mathEasy"
				slot6 = gGameModel.cards:find(slot7.selectedCardDbid:read()):read("card_id", "unit_id", "skin_id")
				slot8 = slot6.card_id
				uv8 = "mathEasy"
				uv13 = "x"
				uv15 = "x"

				slot8.editorLabel:text("cardid=" .. slot6.card_id .. " x=" .. slot13:x() - 1750 .. " y=" .. slot15:y() - 460 .. " followscale=" .. slot4 / dataEasy.getUnitCsv(slot8, slot6.skin_id).scale)
			end
		end
	end, 0, 0.02, 66)
end

function slot1.updataData(slot0)
	slot3 = {}

	for slot7, slot8 in ipairs(slot0.cards:read()) do
		if gGameModel.cards:find(slot8) then
			slot10 = slot9:read("card_id", "unit_id", "skin_id")

			if gCommonConfigCsv.followSpriteNeedFeelLevel <= ((slot0.cardFeels:read()[csv.cards[slot10.card_id].cardMarkID] or {}).level or 0) and (not slot3[slot10.card_id] or slot3[slot10.card_id] and slot10.skin_id ~= 0 or slot8 == slot0.followCardId[1]) then
				slot3[slot10.card_id] = {
					dbid = slot8,
					cardId = slot10.card_id,
					markId = slot11.cardMarkID,
					rarity = dataEasy.getUnitCsv(slot10.card_id, slot10.skin_id).rarity,
					skinId = slot10.skin_id,
					followed = slot8 == slot0.followCardId[1],
					selected = slot8 == slot0.followCardId[1],
					feelLevel = slot14
				}
			end
		end
	end

	slot0.cardsDatas:update(slot3)
	slot0.noData:visible()

	if itertools.size(slot3) == 0 then
		uiEasy.setBtnShader(slot0.btnSure, slot0.btnSure:get("txt"), 2)
		slot0.noData:show()
	else
		slot0.noData:hide()
	end
end

function slot1.initCard(slot0, slot1)
	slot0.followCardPanel:removeChildByName("card")

	slot2 = dataEasy.getUnitCsv(slot1.cardId, slot1.skinId)
	slot3 = widget.addAnimationByKey(slot0.followCardPanel, slot2.unitRes, "card", "standby_loop", 10)

	slot3:xy(slot2.followSpinePos.x, slot2.followSpinePos.y)
	slot3:scaleX(-slot2.scale * slot2.followSpineScale):scaleY(slot2.scale * slot2.followSpineScale):setSkin(slot2.skin)

	slot3.isTintBlack = gStandbyEffectOptionCsv[slot2.unitRes]

	if slot0.followCardPanel.shaderColor then
		if slot3.isTintBlack then
			slot3:setColor2Shader(slot0.followCardPanel.shaderColor)
		else
			cache.setColor2Shader(slot3, false, slot0.followCardPanel.shaderColor)
		end
	end
end

function slot1.btnSureClick(slot0)
	gGameApp:requestServer("/game/follow/sprite", function (slot0)
		uv1 = "onClose"

		slot1:onClose()
	end, slot0.selectedCardDbid:read() == 0 and "" or slot1)
end

function slot1.onFilterFurns(slot0, slot1)
	slot3 = slot0.rarity:read() == 0

	return function (slot0, slot1)
		uv2 = "rarity"

		if slot2 then
			return true
		else
			uv3 = "dbid"

			if slot1.rarity == slot3 then
				return true, slot1.dbid
			else
				return false
			end
		end

		return false
	end
end

function slot1.onRarityItemClick(slot0, slot1, slot2, slot3)
	slot0.rarity:set(slot3.rarity)
end

function slot1.onCardItemClick(slot0, slot1, slot2, slot3)
	if slot0.selectedCardDbid:read() == slot3.dbid then
		slot0.selectedCardDbid:set(0)
		slot0.followCardPanel:removeChildByName("card")
	else
		slot0.selectedCardDbid:set(slot3.dbid)
	end
end

function slot1.onSelectedAll(slot0)
	slot0.rarity:set(0)
end

function slot1.checkSelectCard(slot0)
	if type and slot0.followCardId[1] ~= slot0.selectedCardDbid:read() then
		gGameUI:showDialog({
			btnType = 2,
			isRich = false,
			clearFast = true,
			cb = function ()
				uv2 = "gGameModel"

				if gGameModel.cards:find(slot2.followCardId[1]) then
					slot2 = slot0
					slot1 = slot0.read(slot2, "card_id", "unit_id", "skin_id")
					uv2 = "gGameModel"

					slot2:initCard({
						cardId = slot1.card_id,
						skinId = slot1.skin_id
					})
				else
					uv1 = "gGameModel"

					slot1.followCardPanel:removeChildByName("card")
				end

				uv1 = "gGameModel"

				slot1:onClose()
			end,
			title = gLanguageCsv.spaceTips,
			content = gLanguageCsv.followSelectExitTip,
			dialogParams = {
				clickClose = false
			}
		})
	else
		slot0:onClose()
	end
end

function slot1.onClose(slot0)
	if slot0.cb then
		slot0:addCallbackOnExit(slot0.cb)
	end

	uv1 = "cb"

	slot1.onClose(slot0)
end

return slot1
