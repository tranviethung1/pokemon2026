slot0 = {
	gLanguageCsv.recover,
	gLanguageCsv.recover,
	gLanguageCsv.revive
}
slot1 = require("app.views.city.adventure.random_tower.tools")
slot2 = cc.load("mvc").ViewBase
slot3 = class("RandomTowerUseBuffView", Dialog)
slot3.RESOURCE_FILENAME = "random_tower_use_buff.json"
slot3.RESOURCE_BINDING = {
	textNum = "textNum",
	textNote = "textNote",
	item = "item",
	subList = "subList",
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
							star = slot3.star,
							dbid = slot3.dbid,
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

function slot3.onCreate(slot0, slot1, slot2)
	slot0:initModel()

	slot0.cb = slot2
	slot4 = slot0.roomInfo:read().buff[slot1]
	slot5 = csv.random_tower.buffs[slot4]
	slot0.boardID = slot1
	slot0.buffId = slot4
	uv10 = "initModel"

	slot0.textNote:text(string.format(gLanguageCsv.selectCardSupply, slot10[slot5.supplyType]))

	slot0.cardDatas = idlers.new()
	slot6 = {}
	slot7 = slot0.cardStates
	slot8 = slot7
	uv8 = "cb"

	for slot12, slot13 in pairs(slot8.getCards(slot5.supplyTarget)) do
		uv14 = "cb"

		if slot14.reachCondition(slot5.condition, slot7.read(slot8)[slot13], slot13) then
			table.insert(slot6, slot0:getCardData(slot13))
		end
	end

	table.sort(slot6, function (slot0, slot1)
		return slot1.fight < slot0.fight
	end)
	slot0.cardDatas:update(slot6)

	slot0.selectIdx = idler.new(0)

	slot0.textNum:text("0/1")
	adapt.oneLinePos(slot0.textNote, slot0.textNum, cc.p(5, 0))
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
	Dialog.onCreate(slot0)
end

function slot3.getCardData(slot0, slot1)
	slot3 = 1
	slot4 = 0

	if slot0.cardStates:read()[slot1] then
		slot3 = slot2[1]
		slot4 = slot2[2]
	end

	slot6 = gGameModel.cards:find(slot1):read("card_id", "skin_id", "name", "level", "star", "advance", "fighting_point")
	slot7 = csv.cards[slot6.card_id]
	slot8 = dataEasy.getUnitCsv(slot6.card_id, slot6.skin_id)

	return {
		selectState = false,
		id = slot6.card_id,
		unitId = slot8.id,
		rarity = slot8.rarity,
		level = slot6.level,
		star = slot6.star,
		advance = slot6.advance,
		dbid = slot1,
		fight = slot6.fighting_point,
		hp = slot3,
		mp = slot4
	}
end

function slot3.initModel(slot0)
	slot0.cardStates = gGameModel.random_tower:getIdler("card_states")
	slot0.roomInfo = gGameModel.random_tower:getIdler("room_info")
	slot0.cards = gGameModel.role:getIdler("cards")
end

function slot3.onitemClick(slot0, slot1, slot2, slot3)
	slot0.selectIdx:set(slot2.k)
end

function slot3.onBtnSure(slot0)
	if not slot0.cardDatas:atproxy(slot0.selectIdx:read()) then
		return
	end

	gGameApp:requestServerCustom("/game/random_tower/buff/used"):params(slot1.dbid):onResponse(function ()
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

		slot1(slot2, slot3.cb)

		uv1 = "cb"
		uv2 = "addCallbackOnExit"

		slot1.onClose(slot2)
	end)
end

return slot3
