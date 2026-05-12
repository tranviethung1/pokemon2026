slot0 = {
	{
		attr = "fighting_point",
		name = gLanguageCsv.fighting
	},
	{
		attr = "level",
		name = gLanguageCsv.level
	},
	{
		attr = "rarity",
		name = gLanguageCsv.rarity
	},
	{
		attr = "star",
		name = gLanguageCsv.star
	},
	{
		attr = "getTime",
		name = gLanguageCsv.getTime
	}
}
slot2 = class("EmbattleCardList", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "common_battle_card_list.json"
slot2.RESOURCE_BINDING = {
	textNotRole = "emptyTxt",
	item = "item",
	list = {
		varname = "cardList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 4,
				data = bindHelper.self("allCardDatas"),
				item = bindHelper.self("item"),
				emptyTxt = bindHelper.self("emptyTxt"),
				dataFilterGen = bindHelper.self("onFilterCards", true),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				onItem = function (slot0, slot1, slot2, slot3)
					slot0.initItem(slot1, slot2, slot3)
				end,
				onBeforeBuild = function (slot0)
					slot0.emptyTxt:hide()
				end,
				onAfterBuild = function (slot0)
					if #itertools.values(slot0.data) == 0 then
						slot0.emptyTxt:show()
					else
						slot0.emptyTxt:hide()
					end
				end,
				asyncPreload = 13
			},
			handlers = {
				clickCell = bindHelper.self("onCardItemTouch", true),
				initItem = bindHelper.self("initItem", true)
			}
		}
	},
	btnPanel = {
		varname = "btnPanel",
		binds = {
			event = "extend",
			class = "sort_menus",
			props = {
				expandUp = true,
				data = bindHelper.self("sortDatas"),
				btnClick = bindHelper.self("onSortMenusBtnClick", true),
				onNode = function (slot0)
					slot0:xy(-930, -480):z(18)
				end
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	slot0.base = slot1.base
	slot0.battleCardsData = slot1.battleCardsData
	slot0.allCardDatas = slot1.allCardDatas
	slot0.clientBattleCards = slot1.clientBattleCards
	slot0.limtFunc = handler(slot0.base, slot1.limtFunc)
	slot0.isMovePanelExist = handler(slot0.base, slot1.isMovePanelExist)
	slot0.createMovePanel = handler(slot0.base, slot1.createMovePanel)
	slot0.deleteMovingItem = handler(slot0.base, slot1.deleteMovingItem)
	slot0.moveMovePanel = handler(slot0.base, slot1.moveMovePanel)
	slot0.onCardClick = handler(slot0.base, slot1.onCardClick)
	slot0.moveEndMovePanel = handler(slot0.base, slot1.moveEndMovePanel)

	slot0:initModel()
	slot0:initAllCards()
	slot0:adaptNode(slot2)
	slot0:initFilterBtn()
	idlereasy.any({
		slot0.clientBattleCards,
		slot1.sortSign
	}, function (slot0, slot1)
		uv3 = "dataEasy"

		dataEasy.tryCallFunc(slot3.cardList, "filterSortItems", true)
	end)

	return slot0
end

function slot2.initItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot4.battle > 0 and 1 or 0

	if slot4.inMeteor then
		slot5 = 1
	end

	slot2:setName("item" .. slot1:getIdx(slot3))
	bind.extend(slot1, slot2, {
		class = "card_icon",
		props = {
			unitId = slot4.unit_id,
			advance = slot4.advance,
			rarity = slot4.rarity,
			dbid = slot4.dbid,
			star = slot4.star,
			grayState = slot5,
			levelProps = {
				data = slot4.level
			},
			onNode = function (slot0)
				slot0:xy(-4, -4)
			end
		}
	})
	slot2:get("textNote"):visible(slot4.battle == 1)

	if slot4.inMeteor then
		slot6:text(gLanguageCsv.inMeteorites)
		slot6:show()
	end

	uiEasy.addTextEffect1(slot6)
	slot2:onTouch(functools.partial(slot1.clickCell, slot4))
end

function slot2.initAllCards(slot0)
	idlereasy.any({
		slot0.battleCardsData,
		slot0.cards
	}, function (slot0, slot1, slot2)
		for slot7, slot8 in pairs(slot1) do
			if gGameModel.cards:find(slot8) then
				slot11 = slot9
				slot10 = slot9.read(slot11, "card_id", "skin_id", "fighting_point", "level", "star", "advance", "created_time")
				uv11 = "pairs"
				uv20 = "pairs"

				if slot11.limtFunc(slot8, slot10.card_id, slot10.skin_id, slot10.fighting_point, slot10.level, slot10.star, slot10.advance, slot10.created_time, slot20:getBattle(slot7)) then
					-- Nothing
				end
			else
				slot3[slot7] = slot8
			end
		end

		slot4 = itertools.map({
			[slot7] = slot8
		}, function (slot0, slot1)
			return slot1, slot0
		end)
		slot5 = {}
		slot6 = nil

		for slot10, slot11 in ipairs(slot2) do
			slot6 = slot10 == #slot2

			function slot16(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
				uv8 = "limtFunc"
				uv9 = "getBattle"
				uv10 = "dataEasy"
				uv11 = "getBattle"
				uv19 = "dataEasy"
				uv21 = "tryCallFunc"
				uv22 = "getBattle"
				slot8[slot9] = slot10.limtFunc(slot11, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot19:getBattle(slot21[slot22]))
				uv8 = "cardList"

				if slot8 then
					slot8 = dataEasy.tryCallFunc
					uv9 = "dataEasy"
					slot10 = "updatePreloadCenterIndex"

					slot8(slot9.cardList, slot10)

					uv8 = "dataEasy"
					slot8 = slot8.allCardDatas
					slot8 = slot8.update
					uv10 = "limtFunc"

					slot8(slot8, slot10)

					uv8 = "dataEasy"
					uv10 = "updatePreloadCenterIndex"

					slot8.clientBattleCards:set(slot10, true)
				end
			end

			uv16 = "pairs"

			idlereasy.any(gGameModel.cards:find(slot11):multigetIdler("card_id", "skin_id", "fighting_point", "level", "star", "advance", "created_time"), slot16):anonyOnly(slot16, slot10)
		end
	end)
end

function slot2.getBattle(slot0, slot1)
	if slot1 and slot1 ~= 0 then
		return 1
	else
		return 0
	end
end

function slot2.adaptNode(slot0, slot1)
	if not slot1 then
		return
	end

	adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.cardList,
			"width"
		},
		{
			slot0.cardList,
			"pos",
			"left"
		},
		{
			slot0.btnPanel,
			"pos",
			"left"
		}
	})
end

function slot2.initFilterBtn(slot0)
	slot0.filterCondition = idlertable.new()
	slot0.tabOrder = idler.new(true)
	slot0.seletSortKey = idler.new(1)

	idlereasy.any({
		slot0.filterCondition,
		slot0.seletSortKey,
		slot0.tabOrder
	}, function ()
		uv1 = "dataEasy"

		dataEasy.tryCallFunc(slot1.cardList, "filterSortItems", false)
	end)

	slot1 = slot0:convertToNodeSpace(slot0.btnPanel:parent():convertToWorldSpace(slot0.btnPanel:box()))
	slot2 = gGameUI:getConvertPos(slot0.btnPanel, slot0:getResourceNode())
	slot0.bagFilter = gGameUI:createView("city.card.bag_filter", slot0.btnPanel):init({
		cb = slot0:createHandler("onBattleFilter"),
		others = {
			width = 190,
			height = 122,
			panelOrder = true,
			x = slot2.x + 95,
			y = slot2.y + 61
		}
	}):z(19):xy(-slot1.x, -slot1.y)

	slot0.btnPanel:z(5)
end

function slot2.initModel(slot0)
	slot3 = "cards"
	slot0.cards = gGameModel.role:getIdler(slot3)
	uv3 = "cards"
	slot0.sortDatas = idlertable.new(arraytools.map(slot3, function (slot0, slot1)
		return slot1.name
	end))
end

function slot2.onFilterCards(slot0, slot1)
	slot3 = {}

	if not itertools.isempty(slot0.filterCondition:read()) then
		slot3 = {
			{
				"rarity",
				slot2.rarity < ui.RARITY_LAST_VAL and slot2.rarity or nil
			},
			{
				"attr2",
				slot2.attr2 < ui.ATTR_MAX and slot2.attr2 or nil
			},
			{
				"attr1",
				slot2.attr1 < ui.ATTR_MAX and slot2.attr1 or nil
			},
			{
				"atkType",
				slot2.atkType
			}
		}
	end

	function slot4(slot0, slot1, slot2)
		if slot0[slot1] == nil and (slot1 ~= "attr2" or slot0.attr1 == slot2) then
			return true
		end

		if slot1 == "atkType" then
			for slot6, slot7 in ipairs(slot0.atkType) do
				if slot2[slot7] then
					return true
				end
			end

			return false
		end

		if slot0[slot1] == slot2 then
			return true
		end

		return false
	end

	return function ()
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

function slot2.onSortCards(slot0, slot1)
	slot2 = slot0.seletSortKey
	slot3 = slot2
	uv3 = "seletSortKey"
	slot3 = slot3[slot2.read(slot3)].attr
	slot4 = slot0.tabOrder:read()

	return function (slot0, slot1)
		if slot0.battle ~= slot1.battle then
			return slot1.battle < slot0.battle
		end

		uv2 = "battle"
		uv3 = "battle"

		if slot0[slot2] ~= slot1[slot3] then
			uv4 = "card_id"

			if slot4 then
				return slot3 < slot2
			else
				return slot2 < slot3
			end
		end

		return slot0.card_id < slot1.card_id
	end
end

function slot2.onCardItemTouch(slot0, slot1, slot2, slot3)
	if slot2.inMeteor then
		gGameUI:showTip(gLanguageCsv.cardInMeteorites)

		return
	end

	if slot3.name == "began" then
		slot0.moved = false
		slot0.touchBeganPos = slot3

		slot0.deleteMovingItem()
	elseif slot3.name == "moved" then
		slot4 = math.abs(slot3.x - slot0.touchBeganPos.x)
		slot5 = math.abs(slot3.y - slot0.touchBeganPos.y)

		if not slot0.moved and not slot0.isMovePanelExist() and (ui.TOUCH_MOVED_THRESHOLD <= slot4 or ui.TOUCH_MOVED_THRESHOLD <= slot5) then
			if slot5 > slot4 * 0.7 then
				slot0.createMovePanel(slot0.allCardDatas:atproxy(slot2.dbid))
			end

			slot0.moved = true
		end

		slot0.cardList:setTouchEnabled(not slot0.isMovePanelExist())
		slot0.moveMovePanel(slot3)
	elseif slot3.name == "ended" or slot3.name == "cancelled" then
		if slot0.isMovePanelExist() == false and slot0.moved == false then
			slot0.onCardClick(slot2, true)

			return
		end

		slot0.moveEndMovePanel(slot2)
	end
end

function slot2.onSortMenusBtnClick(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot5 == slot3 then
		slot0.tabOrder:modify(function (slot0)
			return true, not slot0
		end)
	else
		slot0.tabOrder:set(true)
	end

	slot0.seletSortKey:set(slot3)
end

function slot2.onBattleFilter(slot0, slot1, slot2, slot3, slot4)
	slot0.filterCondition:set({
		attr1 = slot1,
		attr2 = slot2,
		rarity = slot3,
		atkType = slot4
	}, true)
end

return slot2
