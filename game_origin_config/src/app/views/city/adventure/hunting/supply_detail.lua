slot0 = {
	gLanguageCsv.recover,
	[3] = gLanguageCsv.revive
}
slot1 = {
	all = 2,
	single = 1,
	resurrect = 3
}

function slot2(slot0)
	slot1 = gGameModel.role:read("cards")

	if slot0 == 2 then
		slot1 = table.deepcopy(gGameModel.role:read("huodong_cards")[game.EMBATTLE_HOUDONG_ID.randomTower], true) or {}
	end

	return slot1
end

function slot3(slot0, slot1, slot2)
	if gGameModel.cards:find(slot2):read("level") < 10 then
		return false
	end

	uv4 = "gGameModel"

	if slot0 == slot4.single then
		return slot1 and slot1[1] > 0 and slot1[1] < 1
	end

	uv4 = "gGameModel"

	if slot0 == slot4.resurrect then
		return slot1 and slot1[1] <= 0
	end

	return true
end

slot4 = cc.load("mvc").ViewBase
slot5 = class("HuntingSupplyDetailView", Dialog)
slot5.RESOURCE_FILENAME = "hunting_supply_detail.json"
slot5.RESOURCE_BINDING = {
	textNote = "textNote",
	subList = "subList",
	item = "item",
	["title.textTitle1"] = "textTitle1",
	textNum = "textNum",
	["title.textTitle2"] = "textTitle2",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 7,
				asyncPreload = 38,
				data = bindHelper.self("cardDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:multiget("cardPanel", "mask", "hpBar", "mpBar", "imgDie", "extraCondition2", "gainChance", "btnReward", "btnComplete").imgDie:visible(slot3.hp <= 0)
					slot4.hpBar:setPercent(slot3.hp * 100)

					slot5 = slot3.mp * 100

					if slot3.hp <= 0 then
						slot5 = 0
					end

					slot4.mpBar:setPercent(slot5)

					slot6 = slot1:size()

					bind.extend(slot0, slot4.cardPanel, {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							advance = slot3.advance,
							rarity = slot3.rarity,
							dbid = slot3.dbid,
							star = slot3.star,
							levelProps = {
								data = slot3.level
							},
							onNode = function (slot0)
							end
						}
					})
					slot4.mask:visible(slot3.selectState)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				itemClick = bindHelper.self("onitemClick"),
				afterBuild = bindHelper.self("onAfterBuild")
			}
		}
	},
	btnSure = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnSure")
			}
		}
	}
}

function slot5.onCreate(slot0, slot1)
	slot0.params = slot1

	slot0:initModel()

	slot4 = string.format
	uv6 = "params"

	slot0.textNote:text(slot4(gLanguageCsv.selectCardSupply, slot6[slot1.type]))

	slot0.cardDatas = idlers.new()
	slot2 = {}
	uv4 = "initModel"

	for slot8, slot9 in pairs(slot4(slot1.type)) do
		uv10 = "textNote"

		if slot10(slot1.type, slot0.cardStates[slot9], slot9) then
			table.insert(slot2, slot0:getCardData(slot9))
		end
	end

	table.sort(slot2, function (slot0, slot1)
		return slot1.fight < slot0.fight
	end)
	slot0.cardDatas:update(slot2)

	slot0.selectIdx = idler.new(0)

	slot0.textNum:text("0/1")
	slot0.selectIdx:addListener(function (slot0, slot1)
		uv2 = "cardDatas"
		slot2 = slot2.cardDatas
		slot3 = slot2
		slot2 = slot2.atproxy(slot3, slot0)
		uv3 = "cardDatas"

		if slot3.cardDatas:atproxy(slot1) then
			slot3.selectState = false
		end

		if slot2 then
			uv4 = "cardDatas"
			slot4 = slot4.textNum
			slot5 = slot4
			slot6 = "1/1"

			slot4.text(slot5, slot6)

			uv5 = "cardDatas"
			uv6 = "cardDatas"

			adapt.oneLinePos(slot5.textNote, slot6.textNum, cc.p(5, 0))

			slot2.selectState = true
		end
	end)
	adapt.oneLinePos(slot0.textNote, slot0.textNum, cc.p(5, 0))
	adapt.oneLinePos(slot0.textTitle1, slot0.textTitle2, cc.p(4, 0))
	Dialog.onCreate(slot0)
end

function slot5.getCardData(slot0, slot1)
	slot3 = 1
	slot4 = 0

	if slot0.cardStates[slot1] then
		slot3 = slot2[1]
		slot4 = slot2[2]
	end

	slot6 = gGameModel.cards:find(slot1):read("card_id", "skin_id", "name", "level", "star", "advance", "fighting_point")
	slot7 = csv.cards[slot6.card_id]
	slot8 = dataEasy.getUnitId(slot6.card_id, slot6.skin_id)

	return {
		selectState = false,
		id = slot6.card_id,
		unitId = slot8,
		rarity = csv.unit[slot8].rarity,
		level = slot6.level,
		star = slot6.star,
		advance = slot6.advance,
		dbid = slot1,
		fight = slot6.fighting_point,
		hp = slot3,
		mp = slot4
	}
end

function slot5.initModel(slot0)
	slot0.routeInfo = gGameModel.hunting:read("hunting_route")
	slot0.cardStates = slot0.routeInfo[slot0.params.route].card_states
end

function slot5.onitemClick(slot0, slot1, slot2, slot3)
	slot0.selectIdx:set(slot2.k)
end

function slot5.onBtnSure(slot0)
	if not slot0.cardDatas:atproxy(slot0.selectIdx:read()) then
		return
	end

	gGameApp:requestServerCustom("/game/hunting/supply"):params(slot0.params.route, slot0.params.node, slot0.params.csvId, slot1.dbid):onResponse(function ()
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
	end):wait({
		false
	}):doit(function (slot0)
		uv1 = "addCallbackOnExit"
		slot2 = slot1
		slot1 = slot1.addCallbackOnExit
		uv3 = "addCallbackOnExit"

		slot1(slot2, slot3.params.cb)

		uv1 = "params"
		uv2 = "addCallbackOnExit"

		slot1.onClose(slot2)
	end)
end

return slot5
