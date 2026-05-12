slot1 = class("GymChallengeEmbattleView", require("app.views.city.card.embattle.base"))
slot1.RESOURCE_FILENAME = "gym_embattle3.json"
slot1.RESOURCE_BINDING = {
	upItem = "upItem",
	rightTop = "rightTop",
	battlePanel = "battlePanel",
	rightDown = "rightDown",
	attrItem = "attrItem",
	bottomPanel = "bottomPanel",
	spritePanel = "spriteItem",
	["rightTop.textNote"] = "textNote",
	["rightTop.imgBg"] = "attrBg",
	["battlePanel.ahead.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["battlePanel.back.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightDown.btnChallenge"] = {
		varname = "btnChallenge",
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.self("fightBtn")
			}
		}
	},
	["rightDown.btnChallenge.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightDown.btnOneKeySet"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("oneKeyEmbattleBtn")
			}
		}
	},
	["rightDown.btnOneKeySet.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightTop.arrList"] = {
		varname = "arrList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("limitInfo"),
				item = bindHelper.self("attrItem"),
				textNote = bindHelper.self("textNote"),
				attrBg = bindHelper.self("attrBg"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgIcon"):texture(ui.ATTR_ICON[slot3])
				end,
				onAfterBuild = function (slot0)
					slot2 = csvSize(slot0.data)
					slot3 = slot0.item:size().width * slot2 + slot0:getItemsMargin() * (slot2 - 1)

					slot0:setAnchorPoint(cc.p(1, 0.5))
					slot0:width(slot3)
					slot0:xy(cc.p(600, 50))
					adapt.oneLinePos(slot0, slot0.textNote, cc.p(0, 0), "right")
					slot0.attrBg:width(slot3 + slot0.textNote:width() + 40)
					slot0.attrBg:x(slot0.textNote:x() - 40)
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose", false)
	}):init({
		subTitle = "FORMATION",
		title = gLanguageCsv.formation
	})
	slot0:initDefine(slot1)
	slot0:initParams(slot1)
	slot0:initModel(slot1)
	slot0:initRoundUIPanel()
	slot0:initHeroSprite()
	slot0:initBottomList()
	slot0:initBattleChange()
	slot0.battleCardsData:set(slot0:getOneKeyCardDatas())
end

function slot1.initDefine(slot0, slot1)
	slot0.deployNum = csv.gym.gate[slot1.gateId].deployNum
	slot0.oneTeamNum = csv.gym.gate[slot1.gateId].deployCardNumLimit
	slot0.deployType = csv.gym.gate[slot1.gateId].deployType
	slot0.embattleMax = slot0.deployNum * slot0.oneTeamNum
	slot0.panelNum = slot0.deployNum * 6
	slot0.gymId = slot1.gymId
	slot0.k = slot1.k
end

function slot1.initModel(slot0, slot1)
	uv2 = "initModel"

	slot2.initModel(slot0, slot1)
	slot0.selectWeatherID:modify(function (slot0)
		if itertools.isempty(slot0) then
			slot0 = {
				[slot4] = 0
			}
			uv2 = "itertools"

			for slot4 = 1, slot2.deployNum do
			end
		end

		return true, slot0
	end, true)
	slot0.selectArms:modify(function (slot0)
		if itertools.isempty(slot0) then
			slot0 = {
				[slot4] = {}
			}
			uv2 = "itertools"

			for slot4 = 1, slot2.deployNum do
			end
		end

		return true, slot0
	end, true)
end

function slot1.initParams(slot0, slot1)
	slot1 = slot1 or {}
	slot0.from = game.EMBATTLE_FROM_TABLE.onekey
	slot0.sceneType = game.SCENE_TYPE.gym
	slot0.fightCb = slot1.fightCb
	slot0.limitInfo = csv.gym.gate[slot1.gateId].deployNatureLimit
	slot0.checkBattleArr = slot1.checkBattleArr or function ()
		return true
	end
end

function slot1.getBattleCards(slot0, slot1)
	slot2 = {}

	for slot6 = 1, 6 do
		table.insert(slot2, slot0.clientBattleCards:read()[(slot1 - 1) * 6 + slot6])
	end

	return slot2
end

function slot1.initBattleChange(slot0)
	idlereasy.when(slot0.clientBattleCards, function (slot0, slot1)
		uv3 = "deployNum"

		for slot5 = 1, slot3.deployNum do
			uv6 = "deployNum"

			slot6:refreshTeamWeather(slot5)
		end
	end)
	idlereasy.when(slot0.selectWeatherID, function (slot0, slot1)
		uv2 = "battlePanel"

		if slot2.battlePanel:get("panel1.btnWeather") then
			uv3 = "battlePanel"

			for slot5 = 1, slot3.deployNum do
				uv6 = "battlePanel"

				if slot1[slot5] == 0 then
					slot6.battlePanel:get("panel" .. slot5 .. ".btnWeather"):hide()
				else
					slot6:show()
					slot6:get("icon"):texture(csv.weather_system.weather[slot1[slot5]].iconRes)
				end
			end
		else
			printWarn("CardEmbattleView.btnWeather not exist")
		end
	end)
end

function slot1.onTeamWeatherClick(slot0, slot1)
	gGameUI:stackUI("city.weather.weather_select", nil, , {
		cardsData = dataEasy.getTeamWeather(slot0:getBattleCards(slot1), true),
		weatherID = slot0.selectWeatherID,
		idx = slot1
	})
end

function slot1.initRoundUIPanel(slot0)
	adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.rightDown,
			"pos",
			"right"
		},
		{
			slot0.rightTop,
			"pos",
			"right"
		}
	})

	if itertools.size(slot0.limitInfo) == 0 then
		slot0.rightTop:hide()
	end
end

function slot1.refreshTeamWeather(slot0, slot1)
	dataEasy.getListenUnlock(gUnlockCsv.weather, function (slot0)
		uv1 = "getBattleCards"
		slot2 = slot1
		uv3 = "selectWeatherID"
		uv2 = "getBattleCards"
		slot2 = slot2.selectWeatherID
		slot3 = slot2
		uv3 = "selectWeatherID"
		slot3 = dataEasy.getWeatherID(slot1.getBattleCards(slot2, slot3), slot2.read(slot3)[slot3])
		slot2 = slot3
		uv3 = "getBattleCards"

		slot3.selectWeatherID:modify(function ()
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
	end):anonyOnly(slot0, "teamWeather" .. slot1)
end

function slot1.fightBtn(slot0)
	if not next(slot0.clientBattleCards:read()) then
		gGameUI:showTip(gLanguageCsv.noSpriteAvailable)

		return
	end

	slot0:sendRequeat(function ()
		uv1 = "table"
		slot2 = true
		uv2 = "table"
		uv4 = "table"

		for slot6 = 1, slot4.deployNum do
		end

		uv3 = "table"
		uv4 = "table"
		uv5 = "table"

		slot3.fightCb(slot4, slot5.clientBattleCards, {
			[slot6] = {
				weather = table.deepcopy(slot2.selectWeatherID:read(), true)[slot6],
				arms = table.deepcopy(slot1.selectArms:read(), slot2)[slot6]
			}
		})
	end)
end

function slot1.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot10 = itertools.map(slot0.limitInfo or {}, function (slot0, slot1)
		return slot1, 1
	end)
	slot12 = csv.unit[csv.cards[slot2].unitID]

	if csvSize(slot0.limitInfo) == 0 or slot10[slot12.natureType] or slot10[slot12.natureType2] then
		uv13 = "itertools"

		return slot13.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	else
		return nil
	end
end

function slot1.getOneKeyCardDatas(slot0)
	slot1 = itertools.values(slot0.allCardDatas)

	table.sort(slot1, function (slot0, slot1)
		if slot0:read().fighting_point == slot1:read().fighting_point then
			return slot1.rarity < slot0.rarity
		else
			return slot1.fighting_point < slot0.fighting_point
		end
	end)

	slot2 = {}

	for slot8, slot9 in pairs(slot1) do
		slot9 = slot9:read()

		if slot0:embattleBtnFunc(slot2, slot9) then
			slot2[csv.cards[slot0:getCardAttr(slot9.dbid, "card_id")].cardMarkID] = {
				dbid = slot9.dbid,
				fighting_point = slot9.fighting_point,
				rarity = slot9.rarity
			}

			if 0 + 1 == slot0.oneTeamNum * slot0.deployNum then
				break
			end
		end
	end

	slot5 = itertools.size({
		[slot4] = slot9.dbid
	})
	slot6 = {}
	slot7 = 0
	slot8 = false

	for slot12 = 1, slot0.deployNum do
		for slot16 = 1, slot0.oneTeamNum do
			slot7 = slot7 + 1
			slot6[6 * (slot12 - 1) + slot16] = clone(slot3[slot7])
			slot17 = slot0.deployNum - slot12
			slot18 = slot5 - slot7

			if slot5 - slot7 == slot0.deployNum - slot12 and slot5 - slot7 ~= 0 then
				slot8 = true

				break
			end
		end

		if slot8 == true then
			break
		end
	end

	if slot8 then
		for slot12 = 1, slot0.deployNum do
			if not slot6[6 * (slot12 - 1) + 1] then
				slot6[6 * (slot12 - 1) + 1] = clone(slot3[slot7 + 1])
			end
		end
	end

	return slot6
end

function slot1.initBottomList(slot0)
	slot0.cardListView = gGameUI:createView("city.adventure.gym_challenge.card_list3", slot0.bottomPanel):init({
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

function slot1.initHeroSprite(slot0)
	slot0.heroSprite = {}
	slot4 = 0

	for slot9 = 1, slot0.deployNum do
		slot10 = slot0.upItem:clone():show():addTo(slot0.battlePanel, 2, "panel" .. slot9):xy(slot0.battlePanel:size().width / 2 - (slot0.upItem:width() + 50) * (slot0.deployNum - 1) / 2 + (slot9 - 1) * (slot2 + slot1), slot3.height / 2 + 110)

		slot10:get("imgOrangeBg.textNote"):text(string.format(gLanguageCsv.unionFightTeam, gLanguageCsv["symbolNumber" .. slot9]))
		bind.extend(slot0, slot10:get("imgBuf"), {
			class = "buff_arms",
			props = {
				redHintTag = "gymChallenge",
				battleCards = slot0.clientBattleCards,
				arms = slot0.selectArms,
				sceneType = slot0.sceneType,
				getCardAttrsEx = functools.partial(slot0.getCardAttrs, slot0),
				idx = slot9,
				isRefresh = slot0.isRefresh,
				onNode = function (slot0)
					slot0:scale(0.65)
				end
			}
		})

		slot14 = {
			methods = {
				ended = functools.partial(slot0.onTeamWeatherClick, slot0, slot9)
			}
		}

		bind.touch(slot0, slot10:get("btnWeather"), slot14)

		for slot14 = 1, 6 do
			slot15 = (slot9 - 1) * 6 + slot14
			slot0.heroSprite[slot15] = {
				sprite = slot10:get("panel" .. slot14),
				idx = slot15
			}
		end
	end

	idlereasy.when(slot0.clientBattleCards, function (slot0, slot1)
		uv3 = "deployNum"

		for slot5 = 1, slot3.deployNum do
			slot6 = {
				[slot10] = slot14
			}

			for slot10 = 1, 6 do
				slot11 = (slot5 - 1) * 6 + slot10
				uv12 = "deployNum"
				slot14 = slot1[slot11]
				uv18 = "deployNum"
				uv19 = "deployNum"

				slot12.heroSprite[slot11].sprite:get("head"):onTouch(functools.partial(slot18.onBattleCardTouch, slot19, slot11))

				if slot14 then
					slot15 = gGameModel.cards:find(slot14)
					slot16 = slot15:read("card_id")
					slot19 = slot13:get("imgEmpty")
					slot20 = slot19

					slot19.hide(slot20)

					uv20 = "deployNum"

					bind.extend(slot20, slot13:get("head"):show(), {
						class = "card_icon",
						props = {
							unitId = dataEasy.getUnitId(slot16, slot15:read("skin_id")),
							cardId = slot16,
							dbid = slot14,
							rarity = slot15:read("rarity"),
							advance = slot15:read("advance"),
							star = slot15:read("star"),
							levelProps = {
								data = slot15:read("level")
							},
							onNode = function (slot0)
								slot0:xy(-6, -6)
							end
						}
					})
				else
					slot13:get("head"):hide()
					slot13:get("imgEmpty"):show()
				end
			end

			uv7 = "deployNum"
			slot7 = slot7.battlePanel:get("panel" .. slot5):get("textNum"):get()
			slot7 = slot7.text
			uv11 = "deployNum"

			slot7(slot7, itertools.size(slot6) .. "/" .. slot11.oneTeamNum)

			uv7 = "deployNum"

			slot7:refreshFightPoint(slot6, slot5)
		end
	end)
end

function slot1.refreshFightPoint(slot0, slot1, slot2)
	for slot7, slot8 in pairs(slot1) do
		slot3 = 0 + slot0:getCardAttr(slot8, "fighting_point")
	end

	slot0.battlePanel:get("panel" .. slot2):get("textZl"):text(slot3)
end

function slot1.createMovePanel(slot0, slot1)
	if slot0.movePanel then
		slot0.movePanel:removeSelf()
	end

	slot2 = slot0.spriteItem:clone():addTo(slot0:getResourceNode(), 1000)

	bind.extend(slot0, slot2, {
		class = "card_icon",
		props = {
			unitId = slot1.unit_id,
			advance = slot1.advance,
			dbid = slot1.dbid,
			rarity = slot1.rarity,
			star = slot1.star,
			levelProps = {
				data = slot1.level
			},
			onNode = function (slot0)
				slot0:xy(-2, -2)
			end
		}
	})
	slot2:show()

	slot0.movePanel = slot2

	return slot2
end

function slot1.onBattleCardTouch(slot0, slot1, slot2)
	if not slot0.clientBattleCards:read()[slot1] then
		return
	end

	if slot2.name == "began" then
		slot0:createMovePanel(slot0:getCardAttrs(slot3))
		slot0.selectIndex:set(slot1)
		slot0.heroSprite[slot1].sprite:get("head"):hide()
		slot0.heroSprite[slot1].sprite:get("imgEmpty"):show()
		slot0.movePanel:xy(slot2.x, slot2.y)
	elseif slot2.name == "moved" then
		slot0:moveMovePanel(slot2)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0.heroSprite[slot1].sprite:get("head"):show()
		slot0.heroSprite[slot1].sprite:get("imgEmpty"):hide()
		slot0:deleteMovingItem()

		if slot2.y < 340 then
			slot0:onCardClick(slot4, true)
		elseif slot0:whichEmbattleTargetPos(slot2) then
			if slot5 ~= slot1 then
				slot0:onCardMove(slot4, slot5, true)
				audio.playEffectWithWeekBGM("formation.mp3")
			else
				slot0:onCardMove(slot4, slot5, false)
			end
		else
			slot0:onCardMove(slot4, slot1, false)
		end
	end
end

function slot1.getIdxByDbId(slot0, slot1)
	if slot1 then
		for slot5 = 1, slot0.panelNum do
			if slot0.clientBattleCards:read()[slot5] == slot1 then
				return slot5
			end
		end
	end

	for slot5 = 1, slot0.deployNum do
		slot7 = (slot5 - 1) * 6 + 1

		for slot11 = slot7, slot7 + 5 do
			if slot0.clientBattleCards:read()[slot11] then
				slot6 = 0 + 1
			end
		end

		if slot6 < slot0.oneTeamNum then
			for slot11 = slot7, slot7 + 5 do
				if not slot0.clientBattleCards:read()[slot11] then
					return slot11
				end
			end
		end
	end
end

function slot1.whichEmbattleTargetPos(slot0, slot1)
	for slot5, slot6 in pairs(slot0.heroSprite) do
		slot7 = slot6.sprite
		slot8 = slot7:box()
		slot9 = slot7:getParent():convertToWorldSpace(cc.p(slot8.x, slot8.y))
		slot8.y = slot9.y
		slot8.x = slot9.x

		if cc.rectContainsPoint(slot8, slot1) then
			return slot5
		end
	end
end

function slot1.onCardMove(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot8 = slot0:getCardAttrs(slot0.clientBattleCards:read()[slot2])
	slot9 = slot0:getBattle(slot0:getIdxByDbId(slot1.dbid))

	if not slot2 then
		-- Nothing
	elseif slot1.battle > 0 then
		if slot0:getBattle(slot2) ~= slot1.battle and slot0:getCardNum(slot1.battle) == 1 and slot7 == nil then
			slot4 = gLanguageCsv.battleNumberNo
		elseif slot10 ~= slot1.battle and slot0:getCardNum(slot10) == slot0.oneTeamNum and slot7 == nil then
			slot4 = gLanguageCsv.battleCardCountEnough
		else
			if slot0:getCardAttrs(slot7) then
				slot0:getCardAttrs(slot7).battle = slot0:getBattle(slot6)
			end

			if slot0:getCardAttrs(slot5) then
				slot0:getCardAttrs(slot5).battle = slot0:getBattle(slot2)
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
		end
	elseif slot0:hasSameMarkIDCard(slot1) and slot11 ~= slot2 then
		slot4 = gLanguageCsv.alreadyHaveSameSprite
	elseif not slot7 and not slot0:canBattleUp(slot10) then
		slot4 = gLanguageCsv.battleCardCountEnough
	else
		slot0:upBattle(slot5, slot2)

		slot4 = gLanguageCsv.addToEmbattle
	end

	if slot3 and slot4 then
		gGameUI:showTip(slot4)
	end
end

function slot1.canBattleDown(slot0, slot1)
	slot3 = (slot1 - 1) * 6 + 1

	for slot7 = slot3, slot3 + 5 do
		if slot0.clientBattleCards:read()[slot7] then
			slot2 = 0 + 1
		end
	end

	return slot2 > 1
end

function slot1.canBattleUp(slot0, slot1)
	if slot1 == nil then
		for slot5 = 1, slot0.deployNum do
			slot7 = (slot5 - 1) * 6 + 1

			for slot11 = slot7, slot7 + 5 do
				if slot0.clientBattleCards:read()[slot11] then
					slot6 = 0 + 1
				end
			end

			if slot6 < slot0.oneTeamNum then
				return true
			end
		end

		return false
	else
		slot3 = (slot1 - 1) * 6 + 1

		for slot7 = slot3, slot3 + 5 do
			if slot0.clientBattleCards:read()[slot7] then
				slot2 = 0 + 1
			end
		end

		return slot2 < slot0.oneTeamNum
	end
end

function slot1.getCardNum(slot0, slot1)
	slot3 = (slot1 - 1) * 6 + 1

	for slot7 = slot3, slot3 + 5 do
		if slot0.clientBattleCards:read()[slot7] then
			slot2 = 0 + 1
		end
	end

	return slot2
end

function slot1.onClose(slot0)
	slot1 = gGameModel.gym:read("date")
	slot3 = {
		[slot7] = stringz.bintohex(slot8)
	}

	for slot7, slot8 in pairs(slot0.clientBattleCards:read()) do
		-- Nothing
	end

	cc.load("mvc").ViewBase.onClose(slot0)
end

return slot1
