slot0 = cc.load("mvc").ViewBase
slot2 = class("embattleView", require("app.views.city.card.embattle.base"))
slot3 = 6
slot2.RESOURCE_FILENAME = "experience_embattle.json"
slot2.RESOURCE_BINDING = {
	spritePanel = "spriteItem",
	textLimit = "textLimit",
	battlePanel = "battlePanel",
	bottomMask = "bottomMask",
	bottomPanel = "bottomPanel",
	btnGHimg = {
		varname = "btnBuff",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTeamBuffClick")
			}
		}
	},
	btnWeather = {
		varname = "btnWeather",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTeamWeatherClick")
			}
		}
	},
	btnChallenge = {
		varname = "btnChallenge",
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.self("fightBtn")
			}
		}
	},
	["ahead.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["back.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["btnChallenge.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.spriteItem:get("attrBg"):hide()
	slot0.btnBuff:hide()
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose", true)
	}):init({
		subTitle = "EXPERIENCE",
		title = gLanguageCsv.testPlay
	})
	adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.btnChallenge,
			"pos",
			"right"
		}
	})

	slot2 = csv.experience.cards[slot1] and csv.experience.cards[slot1].cardID or slot1
	slot0.cardData = csv.experience.list[slot2]
	slot0.cardID = slot2

	slot0:initModel()
	slot0:updateData()
	slot0:initSpriteItem()
	slot0:initBottomList()
	idlereasy.when(slot0.clientBattleCards, function (slot0, slot1)
		uv2 = "refreshTeamWeather"
		slot3 = slot2

		slot2.refreshTeamWeather(slot3, slot1)

		uv3 = "initHeroSprite"

		for slot5 = 1, slot3 do
			uv6 = "refreshTeamWeather"

			slot6:initHeroSprite(slot5)
		end
	end)
	idlereasy.when(slot0.draggingIndex, function (slot0, slot1)
		uv3 = "heroSprite"

		for slot5 = 1, slot3 do
			uv6 = "item"

			if slot6.heroSprite[slot5].item:get("sprite") then
				slot6:setCascadeOpacityEnabled(true)

				if slot1 == 0 then
					slot6:opacity(255)
				elseif slot1 == -1 then
					slot6:opacity(155)
				elseif slot1 == slot5 then
					slot6:opacity(255)
				else
					slot6:opacity(155)
				end
			end
		end
	end)
	idlereasy.when(slot0.selectIndex, function (slot0, slot1)
		uv3 = "heroSprite"

		for slot5 = 1, slot3 do
			uv6 = "item"

			slot6.heroSprite[slot5].item:get("imgBg.imgSel"):visible(slot1 == slot5)
		end
	end)
	idlereasy.when(slot0.selectWeatherID, function (slot0, slot1)
		if not slot1 or slot1 == 0 then
			uv2 = "btnWeather"

			slot2.btnWeather:hide()

			return
		end

		uv2 = "btnWeather"
		slot2 = slot2.btnWeather
		slot2 = slot2.show

		slot2(slot2)

		uv2 = "btnWeather"

		slot2.btnWeather:get("icon"):texture(csv.weather_system.weather[slot1].iconRes)
	end)
end

function slot2.updateData(slot0)
	slot1 = table.deepcopy(slot0.cardData.cards)

	for slot7, slot8 in pairs(slot0.cardData.deployLock) do
		if slot8 == 0 then
			slot3 = 0 + 1
		end
	end

	slot0.battleNum = slot3

	if slot0.clientBattleCards:size() > 0 then
		return
	end

	slot5 = {}
	slot6 = {
		0,
		0,
		0,
		0,
		0,
		0
	}
	slot7 = {
		0,
		0,
		0,
		0,
		0,
		0
	}

	for slot12, slot13 in csvPairs(slot0.cardData.autoCards) do
		if not slot5[slot12] then
			if slot13 == 0 then
				table.insert({}, slot12)
			elseif slot2[slot13] == 1 then
				printError("pos(%s) was lock, cardID(%s)", slot13, slot0.cardData.id)
			else
				slot6[slot13] = slot12
				slot7[slot13] = slot12
			end

			slot5[slot12] = true
		end

		table.insert(slot1, slot12)
	end

	uv10 = "table"

	for slot12 = 1, slot10 do
		if slot6[slot12] == 0 and slot2[slot12] == 0 and slot8[1] then
			slot13 = slot8[1]
			slot6[slot12] = slot13
			slot7[slot12] = slot13

			table.remove(slot8, 1)
		end
	end

	slot0.clientBattleCards:set(slot7)
	slot0.battleCardsData:set(slot6)

	for slot13, slot14 in pairs(slot1) do
		slot17 = csv.unit[csv.cards[csv.experience.cards[slot14].cardID].unitID]
	end

	slot0.allCardDatas:update({
		[slot14] = {
			isNew = false,
			csvID = slot14,
			cardID = slot15.cardID,
			card_id = slot15.cardID,
			unitID = slot16.unitID,
			unit_id = slot16.unitID,
			level = slot15.level,
			star = slot15.star,
			advance = slot15.advance,
			rarity = slot17.rarity,
			attr1 = slot17.natureType,
			attr2 = slot17.natureType2,
			markId = slot16.cardMarkID,
			atkType = slot16.atkType,
			battle = slot5[slot14] and 1 or 0,
			lock = slot4[slot14] or -1
		}
	})
end

function slot2.initBottomList(slot0, slot1)
	slot0.cardListView = gGameUI:createView(slot1 or "city.card.embattle.experience_card_list", slot0.bottomPanel):init({
		base = slot0,
		clientBattleCards = slot0.clientBattleCards,
		battleCardsData = slot0.battleCardsData,
		deleteMovingItem = slot0.deleteMovingItem,
		createMovePanel = slot0.createMovePanel,
		moveMovePanel = slot0.moveMovePanel,
		isMovePanelExist = slot0.isMovePanelExist,
		onCardClick = slot0.onCardClick,
		allCardDatas = slot0.allCardDatas,
		moveEndMovePanel = slot0.moveEndMovePanel,
		limtFunc = slot0.limtFunc
	}, true)
end

function slot2.initModel(slot0)
	slot0.clientBattleCards = idlertable.new(slot0._clientBattleCards or {})
	slot0.battleCardsData = idlertable.new(slot0._battleCardsData or {})
	slot0.allCardDatas = idlers.newWithMap(slot0._allCardDatas or {})
	slot0.selectIndex = idler.new(0)
	slot0.draggingIndex = idler.new(0)
	slot0.selectWeatherID = idlereasy.new()
end

function slot2.initHeroSprite(slot0, slot1)
	slot2 = slot0.heroSprite[slot1].item

	if not slot0:getCardAttrs(slot0.clientBattleCards:read()[slot1]) then
		if slot2:getChildByName("sprite") then
			slot2:getChildByName("sprite"):hide()
		end

		slot2:get("attrBg"):hide()

		return
	end

	slot4 = csv.unit[slot3.unit_id]
	slot5 = slot2:get("imgBg")

	if slot2.csvID == slot3.csvID and slot2:getChildByName("sprite") then
		slot2:getChildByName("sprite"):show()
	else
		slot2:removeChildByName("sprite")
		slot2:removeChildByName("lock")
		slot2:removeChildByName("lock1")
		widget.addAnimationByKey(slot2, slot4.unitRes, "sprite", "standby_loop", 4):scale(slot4.scale * (0.8 + (slot1 - 1) % 3 * 0.1)):xy(slot5:x(), slot5:y() + 15):setSkin(slot4.skin)

		slot2.csvID = slot3.csvID

		if slot3.lock > 0 then
			slot0:createLockEffect(slot2, slot1)
		end
	end

	uiEasy.setTeamBuffItem(slot2, slot3.cardID, (slot0.teamBuff and slot0.teamBuff.flags or {
		1,
		1,
		1,
		1,
		1,
		1
	})[slot1])
end

function slot2.createLockEffect(slot0, slot1, slot2)
	slot3 = {
		-40,
		0,
		5,
		-40,
		0,
		5
	}
	slot4 = {
		1.8,
		2,
		2.5,
		1.8,
		2,
		2.5
	}
	slot5 = "effect_hou_loop"
	slot6 = widget.addAnimationByKey(slot1, "summer_challenge/jld.skel", "lock", slot5, 2)

	slot6:scale(slot4[slot2])
	slot6:play(slot5)
	slot6:xy(slot1:width() / 2, slot1:height() / 2 + slot3[slot2])

	slot5 = "effect_qian_loop"
	slot7 = widget.addAnimationByKey(slot1, "summer_challenge/jld.skel", "lock1", slot5, 50)

	slot7:scale(slot4[slot2])
	slot7:play(slot5)
	slot7:xy(slot1:width() / 2, slot1:height() / 2 + slot3[slot2])
end

function slot2.initSpriteItem(slot0)
	slot0.heroSprite = {}
	slot1 = slot0.cardData.deployLock
	uv3 = "heroSprite"

	for slot5 = 1, slot3 do
		slot6 = slot0.battlePanel:get("item" .. slot5)
		slot7 = slot6:box()
		slot8 = slot6:getParent():convertToWorldSpace(cc.p(slot7.x, slot7.y))
		slot7.y = slot8.y
		slot7.x = slot8.x
		slot0.heroSprite[slot5] = {
			item = slot6,
			rect = slot7,
			idx = slot5,
			lock = slot1[slot5] == 1
		}

		slot6:get("posLockPanel"):visible(slot1[slot5] == 1)
		slot6:onTouch(functools.partial(slot0.onBattleCardTouch, slot0, slot5))
	end

	uv3 = "heroSprite"

	for slot5 = 1, slot3 do
		slot6 = slot0.heroSprite[slot5].item:get("imgBg")
		slot8 = slot6:size()
		slot7 = slot6:get("imgSel") or widget.addAnimationByKey(slot6, "effect/buzhen2.skel", "imgSel", "effect_loop", 2):xy(slot8.width / 2, slot8.height / 2 + 15)
	end
end

function slot2.createMovePanel(slot0, slot1)
	if slot0.movePanel then
		slot0.movePanel:removeSelf()
	end

	slot2 = csv.unit[slot1.unit_id]
	slot3 = slot0.spriteItem:clone():addTo(slot0:getResourceNode(), 1000)

	slot3:show()

	slot4 = slot3:get("icon"):size()

	widget.addAnimationByKey(slot3:get("icon"), slot2.unitRes, "hero", "run_loop", 1000):scale(slot2.scale):alignCenter(slot4):setSkin(slot2.skin)
	widget.addAnimationByKey(slot3:get("icon"), "effect/buzhen.skel", "effect", "effect_loop", 1002):scale(1):alignCenter(slot4)

	slot0.movePanel = slot3

	slot0.draggingIndex:set(-1)

	return slot3
end

function slot2.deleteMovingItem(slot0)
	slot0.selectIndex:set(0)

	if slot0.movePanel then
		slot0.movePanel:removeSelf()

		slot0.movePanel = nil
	end

	slot0.draggingIndex:set(0)
end

function slot2.moveMovePanel(slot0, slot1)
	if slot0.movePanel then
		slot0.movePanel:xy(slot1)
		slot0.selectIndex:set(slot0:whichEmbattleTargetPos(slot1))
	end
end

function slot2.moveEndMovePanel(slot0, slot1)
	if not slot0.movePanel then
		return
	end

	slot0:onCardMove(slot1, slot0.selectIndex:read(), true)
	slot0:deleteMovingItem()
end

function slot2.isMovePanelExist(slot0)
	return slot0.movePanel ~= nil
end

function slot2.getBattleIdx(slot0)
	uv2 = "clientBattleCards"

	for slot4 = 1, slot2 do
		if (slot0.clientBattleCards:read()[slot4] or 0) == 0 and slot0.cardData.deployLock[slot4] == 0 then
			return slot4
		end
	end
end

function slot2.onCardClick(slot0, slot1, slot2)
	slot3 = nil
	slot5 = slot0:getIdxByCsvID(slot1.csvID)

	if slot1.battle > 0 then
		if slot1.lock >= 0 then
			gGameUI:showTip(gLanguageCsv.testPlayNoDown)

			return
		end

		if slot0:canBattleDown() then
			slot0:downBattle(slot4, true)
		else
			slot3 = gLanguageCsv.battleCannotEmpty
		end
	else
		slot6 = slot0:getBattleIdx()

		if not slot0:canBattleUp() then
			slot3 = gLanguageCsv.battleCardCountEnough
		elseif slot0:hasSameMarkIDCard(slot1) then
			slot3 = gLanguageCsv.alreadyHaveSameSprite
		else
			slot0:upBattle(slot4, slot6)
		end
	end

	if slot2 and slot3 then
		gGameUI:showTip(slot3)
	end
end

function slot2.canBattleDown(slot0)
	return slot0.clientBattleCards:size() > 1
end

function slot2.canBattleUp(slot0)
	for slot5, slot6 in slot0.clientBattleCards:pairs() do
		if slot6 > 0 then
			slot1 = 0 + 1
		end
	end

	return slot1 < slot0.battleNum
end

function slot2.onCardMove(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot8 = slot0:getCardAttrs(slot0.clientBattleCards:read()[slot2])
	slot9 = slot0:getIdxByCsvID(slot1.csvID) == nil and 0 or 1

	if slot2 then
		if slot0.cardData.deployLock[slot2] == 1 then
			gGameUI:showTip(gLanguageCsv.posLock)

			return
		end

		if slot1.battle > 0 then
			if slot8 and slot8.lock > 0 then
				gGameUI:showTip(gLanguageCsv.testPlayNoMove)

				return
			end

			slot0.clientBattleCards:modify(function ()
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
			end, true)
		else
			if slot8 and slot8.lock >= 0 then
				gGameUI:showTip(gLanguageCsv.testPlayNoMove)

				return
			end

			if slot0:hasSameMarkIDCard(slot1) and slot10 ~= slot2 then
				slot4 = gLanguageCsv.alreadyHaveSameSprite
			elseif not slot7 and not slot0:canBattleUp() then
				slot4 = gLanguageCsv.battleCardCountEnough
			else
				slot0:upBattle(slot5, slot2)

				slot4 = gLanguageCsv.addToEmbattle
			end
		end
	end

	if slot3 and slot4 then
		gGameUI:showTip(slot4)
	end
end

function slot2.onBattleCardTouch(slot0, slot1, slot2)
	if slot0.clientBattleCards:read()[slot1] == 0 then
		return
	end

	if slot0:getCardAttrs(slot0.clientBattleCards:read()[slot1]).lock > 0 then
		gGameUI:showTip(gLanguageCsv.testPlayNoMove)

		return
	end

	if slot2.name == "began" then
		slot0:deleteMovingItem()
		slot0:createMovePanel(slot3)

		slot4 = slot0.heroSprite[slot1].item

		slot4:get("sprite"):hide()
		slot4:get("attrBg"):hide()
		slot0:moveMovePanel(slot2)
	elseif slot2.name == "moved" then
		slot0:moveMovePanel(slot2)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot4 = slot0.heroSprite[slot1].item

		slot4:get("sprite"):show()
		slot4:get("attrBg"):show()
		slot0:deleteMovingItem()

		if slot2.y < 340 then
			slot0:onCardClick(slot3, true)
		elseif slot0:whichEmbattleTargetPos(slot2) then
			if slot5 ~= slot1 then
				slot0:onCardMove(slot3, slot5, true)
				audio.playEffectWithWeekBGM("formation.mp3")
			else
				slot0:onCardMove(slot3, slot5, false)
			end
		else
			slot0:onCardMove(slot3, slot1, false)
		end
	end
end

function slot2.getIdxByCsvID(slot0, slot1)
	uv3 = "clientBattleCards"

	for slot5 = 1, slot3 do
		if slot0.clientBattleCards:read()[slot5] == slot1 then
			return slot5
		end
	end
end

function slot2.getCardAttrs(slot0, slot1)
	return slot0.allCardDatas:atproxy(slot1)
end

function slot2.downBattle(slot0, slot1)
	slot0:getCardAttrs(slot1).battle = 0
	slot2 = slot0:getIdxByCsvID(slot1)

	slot0.clientBattleCards:modify(function ()
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
	end, true)
end

function slot2.upBattle(slot0, slot1, slot2)
	if slot0.clientBattleCards:read()[slot2] ~= 0 then
		slot0:getCardAttrs(slot3).battle = 0
	end

	slot0.clientBattleCards:modify(function (slot0)
		uv1 = "getCardAttrs"
		uv2 = "battle"
		slot0[slot1] = slot2
		uv1 = "isNew"
		uv3 = "battle"
		slot1 = slot1:getCardAttrs(slot3)
		slot1.battle = 1
		uv1 = "isNew"
		uv3 = "battle"
		slot1:getCardAttrs(slot3).isNew = false

		return true, slot0
	end, true)
end

function slot2.hasSameMarkIDCard(slot0, slot1)
	uv3 = "clientBattleCards"

	for slot5 = 1, slot3 do
		if slot0.clientBattleCards:read()[slot5] ~= 0 and slot0:getCardAttrs(slot6).markId == slot1.markId then
			return slot5
		end
	end

	return false
end

function slot2.whichEmbattleTargetPos(slot0, slot1)
	uv2 = "heroSprite"

	for slot5 = slot2, 1, -1 do
		if cc.rectContainsPoint(slot0.heroSprite[slot5].rect, slot1) then
			return slot5
		end
	end
end

function slot2.refreshTeamWeather(slot0)
	slot0.selectWeatherID:set(dataEasy.getWeatherID(nil, slot0.selectWeatherID:read(), {
		result = dataEasy.getTeamWeather(nil, true, {
			isTestPlay = true,
			cardsData = slot0:getBattleCardsInfo()
		})
	}))
end

function slot2.getUnitCfg(slot0, slot1)
	return csv.unit[csv.cards[csv.experience.cards[slot1].cardID].unitID]
end

function slot2.fightBtn(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.clientBattleCards:read()) do
		if slot6 ~= 0 then
			slot1 = true

			break
		end
	end

	if not slot1 then
		gGameUI:showTip(gLanguageCsv.noSpriteAvailable)

		return
	end

	slot0:startFighting()
end

function slot2.startFighting(slot0)
	slot1 = {
		[slot5] = slot6
	}

	for slot5, slot6 in pairs(slot0.clientBattleCards:read()) do
		if slot6 > 0 then
			-- Nothing
		end
	end

	slot2 = nil

	for slot6, slot7 in slot0.allCardDatas:pairs() do
		if slot7:read().cardID == slot0.cardID then
			slot2 = slot8.csvID

			break
		end
	end

	slot5, slot6, slot7 = require("app.models.experience_battle").new(gGameModel):init({
		weahter = slot0.selectWeatherID:read(),
		cards = slot1,
		trialID = slot2
	}):makeNetData()

	gGameApp:requestServer("/game/battle/card/confuse", function (slot0)
		uv1 = "setActualData"
		slot1 = slot1.setActualData

		slot1(slot1, slot0)

		uv1 = "setActualData"

		battleEntrance.battle(slot1:getData(), {
			noShowEndRewards = true
		}):enter()
	end, slot5, slot6, slot7)
end

function slot2.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

function slot2.getBattleCardsInfo(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot1 or slot0.clientBattleCards:read()) do
		if slot7 > 0 then
			table.insert(slot2, slot0:getCardAttrs(slot7))
		end
	end

	return slot2
end

function slot2.onTeamWeatherClick(slot0)
	gGameUI:stackUI("city.weather.weather_select", nil, , {
		cardsData = dataEasy.getTeamWeather(nil, true, {
			isTestPlay = true,
			cardsData = slot0:getBattleCardsInfo()
		}),
		weatherID = slot0.selectWeatherID
	})
end

function slot2.onCleanup(slot0)
	slot0._clientBattleCards = table.deepcopy(slot0.clientBattleCards:read(), true)
	slot0._battleCardsData = table.deepcopy(slot0.battleCardsData:read(), true)

	for slot5, slot6 in slot0.allCardDatas:pairs() do
		-- Nothing
	end

	slot0._allCardDatas = {
		[slot5] = table.deepcopy(slot6:read(), true)
	}
	uv2 = "_clientBattleCards"

	slot2.onCleanup(slot0)
end

return slot2
