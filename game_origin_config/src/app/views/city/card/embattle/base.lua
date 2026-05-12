slot1 = class("CardEmbattleView", cc.load("mvc").ViewBase)
slot2 = {
	{
		pos = cc.p(0, 50),
		size = cc.size(450, 250)
	},
	{
		pos = cc.p(0, 20),
		size = cc.size(500, 250)
	},
	{
		pos = cc.p(0, 20),
		size = cc.size(500, 250)
	},
	{
		pos = cc.p(0, 50),
		size = cc.size(450, 250)
	},
	{
		pos = cc.p(0, 20),
		size = cc.size(500, 250)
	},
	{
		pos = cc.p(0, 20),
		size = cc.size(500, 250)
	}
}
slot3 = {
	2,
	4,
	6,
	1,
	3,
	5
}
slot4 = {
	[game.EMBATTLE_FROM_TABLE.default] = {
		initModelFunc = function (slot0)
			return gGameModel.role:getIdler("battle_cards")
		end,
		getWeatherID = function (slot0)
			return (gGameModel.role:read("battle_extra") or {}).weather or 0
		end,
		getArmsData = function (slot0)
			return table.deepcopy((gGameModel.role:read("battle_extra") or {}).arms or {}, true)
		end,
		getSendRequest = function (slot0)
			if slot0.clientBattleCards:size() == 0 then
				return
			end

			return gGameApp:requestServerCustom("/game/battle/card"):params(slot0.clientBattleCards, {
				weather = slot0.selectWeatherID:read(),
				arms = table.deepcopy(slot0.selectArms:read(), true)
			})
		end
	},
	[game.EMBATTLE_FROM_TABLE.arena] = {
		initModelFunc = function (slot0)
			idlereasy.when(gGameModel.arena:getIdler("record"), function (slot0, slot1)
				slot2 = {}
				uv3 = "fightCb"
				uv4 = "cards"

				slot4:set(slot3.fightCb and slot1.cards or slot1.defence_cards)
			end)

			return idlertable.new({})
		end,
		getWeatherID = function (slot0)
			slot2 = (gGameModel.arena:read("record") and gGameModel.arena:read("record").defence_extra or {}).weather

			if slot0.fightCb then
				slot2 = (gGameModel.arena:read("record") and gGameModel.arena:read("record").extra or {}).weather
			end

			return slot2 or 0
		end,
		getArmsData = function (slot0)
			slot2 = (gGameModel.arena:read("record") and gGameModel.arena:read("record").defence_extra or {}).arms

			if slot0.fightCb then
				slot2 = (gGameModel.arena:read("record") and gGameModel.arena:read("record").extra or {}).arms
			end

			return table.deepcopy(slot2 or {}, true)
		end,
		getSendRequest = function (slot0)
			if slot0.fightCb then
				return gGameApp:requestServerCustom("/game/pw/battle/deploy"):params(slot0.clientBattleCards, nil, {
					weather = slot0.selectWeatherID:read(),
					arms = table.deepcopy(slot0.selectArms:read(), true)
				})
			else
				return gGameApp:requestServerCustom("/game/pw/battle/deploy"):params(nil, slot0.clientBattleCards, nil, {
					weather = slot2,
					arms = slot1
				})
			end
		end
	},
	[game.EMBATTLE_FROM_TABLE.huodong] = {
		initModelFunc = function (slot0)
			idlereasy.when(gGameModel.role:getIdler("huodong_cards"), function (slot0, slot1)
				uv2 = "fromId"

				if not slot1[slot2.fromId] then
					for slot7, slot8 in pairs(gGameModel.role:read("battle_cards")) do
						if gGameModel.cards:find(slot8) then
							slot11 = slot9
							slot10 = slot9.read(slot11, "card_id", "skin_id", "fighting_point", "level", "star", "advance", "created_time")
							uv11 = "fromId"

							if slot11:limtFunc(slot8, slot10.card_id, slot10.skin_id, slot10.fighting_point, slot10.level, slot10.star, slot10.advance, slot10.created_time, 1) then
								-- Nothing
							end
						end
					end

					uv4 = "gGameModel"

					slot4:set({
						[slot7] = slot8
					})
				else
					uv2 = "gGameModel"
					uv4 = "fromId"

					slot2:set(slot1[slot4.fromId])
				end
			end)

			return idlertable.new({})
		end,
		getWeatherID = function (slot0)
			return (gGameModel.role:read("huodong_extra") and gGameModel.role:read("huodong_extra")[slot0.fromId] or {}).weather or 0
		end,
		getArmsData = function (slot0)
			return table.deepcopy((gGameModel.role:read("huodong_extra") and gGameModel.role:read("huodong_extra")[slot0.fromId] or {}).arms or {}, true)
		end,
		getSendRequest = function (slot0)
			return gGameApp:requestServerCustom("/game/huodong/card"):params(slot0.fromId, slot0.clientBattleCards, {
				weather = slot0.selectWeatherID:read(),
				arms = table.deepcopy(slot0.selectArms:read(), true)
			})
		end
	},
	[game.EMBATTLE_FROM_TABLE.input] = {
		initModelFunc = function (slot0)
			return slot0.inputCards
		end,
		getSendRequest = function (slot0)
		end
	},
	[game.EMBATTLE_FROM_TABLE.gymChallenge] = {
		initModelFunc = function (slot0)
			if itertools.size(dataEasy.fixInMeteorCards(userDefault.getForeverLocalKey("gym_emabttle" .. slot0.gymId, {}))) == 0 or function ()
				slot0 = {}
				uv2 = "pairs"

				for slot4, slot5 in pairs(slot2) do
					if slot0[slot5] then
						return true
					end

					slot0[slot5] = true
				end

				return false
			end() then
				return idlertable.new(table.shallowcopy(gGameModel.role:read("battle_cards")))
			else
				for slot9, slot10 in pairs(slot1) do
					if itertools.map(gGameModel.role:read("cards"), function (slot0, slot1)
						return slot1, slot0
					end)[stringz.hextobin(slot10)] then
						-- Nothing
					end
				end

				return idlertable.new({
					[slot9] = slot11
				})
			end
		end,
		getWeatherID = function (slot0)
			return userDefault.getForeverLocalKey("gym_emabttle_weather" .. slot0.gymId, 0)
		end,
		getArmsData = function (slot0)
			return userDefault.getForeverLocalKey("gym_emabttle_arms" .. slot0.gymId, {})
		end,
		getSendRequest = function (slot0)
		end
	},
	[game.EMBATTLE_FROM_TABLE.onekey] = {
		initModelFunc = function (slot0)
			return idlertable.new({})
		end,
		getWeatherID = function (slot0)
			if slot0.deployType ~= 2 then
				if slot0.deployType == 3 then
					return {}
				end

				return 0
			end

			return nil
		end,
		getArmsData = function (slot0)
			if slot0.deployType ~= 2 then
				return {}
			end

			return nil
		end,
		getSendRequest = function (slot0)
		end
	},
	[game.EMBATTLE_FROM_TABLE.onlineFight] = {
		initModelFunc = function (slot0)
			return gGameModel.cross_online_fight:getIdler("cards")
		end,
		getWeatherID = function (slot0)
			return (gGameModel.cross_online_fight:read("extra") or {}).weather or 0
		end,
		getArmsData = function (slot0)
			return table.deepcopy((gGameModel.cross_online_fight:read("extra") or {}).arms or {}, true)
		end,
		getSendRequest = function (slot0)
			return gGameApp:requestServerCustom("/game/cross/online/deploy"):params(slot0.clientBattleCards, nil, 1, {
				weather = slot0.selectWeatherID:read(),
				arms = table.deepcopy(slot0.selectArms:read(), true)
			})
		end
	},
	[game.EMBATTLE_FROM_TABLE.huodongBoss] = {
		initModelFunc = function (slot0)
			if dataEasy.fixInMeteorCards(userDefault.getForeverLocalKey("huodongboss_emabttle", {})) == nil or itertools.size(slot1) == 0 then
				return idlertable.new(table.shallowcopy(gGameModel.role:read("battle_cards")))
			else
				for slot8, slot9 in pairs(slot1) do
					if itertools.map(gGameModel.role:read("cards"), function (slot0, slot1)
						return slot1, slot0
					end)[stringz.hextobin(slot9)] then
						-- Nothing
					end
				end

				return idlertable.new({
					[slot8] = slot10
				})
			end
		end,
		getWeatherID = function (slot0)
			return userDefault.getForeverLocalKey("huodongboss_emabttle_weather", 0)
		end,
		getArmsData = function (slot0)
			return userDefault.getForeverLocalKey("huodongboss_emabttle_arms", {})
		end,
		getSendRequest = function (slot0)
		end
	},
	[game.EMBATTLE_FROM_TABLE.ready] = {
		initModelFunc = function (slot0)
			return slot0.inputCards
		end,
		getWeatherID = function (slot0)
			return slot0.inputExtra and slot0.inputExtra.weather or 0
		end,
		getArmsData = function (slot0)
			return slot0.inputExtra and slot0.inputExtra.arms or {}
		end,
		getSendRequest = function (slot0)
		end
	},
	[game.EMBATTLE_FROM_TABLE.hunting] = {
		initModelFunc = function (slot0)
			slot1 = gGameModel.hunting:read("hunting_route")[slot0.route].cards or {}

			if itertools.size(gGameModel.hunting:read("hunting_route")[slot0.route].card_states or {}) == 0 then
				for slot7, slot8 in pairs(table.deepcopy(gGameModel.role:read("battle_cards"), true)) do
					if gGameModel.cards:find(slot8) and slot9:read("level") < 10 then
						slot3[slot7] = nil
					end
				end

				return idlertable.new(table.shallowcopy(slot3))
			else
				for slot9, slot10 in pairs(slot1) do
					if itertools.map(gGameModel.role:read("cards"), function (slot0, slot1)
						return slot1, slot0
					end)[slot10] then
						-- Nothing
					end
				end

				return idlertable.new({
					[slot9] = slot10
				})
			end
		end,
		getWeatherID = function (slot0)
			return (gGameModel.hunting:read("hunting_route")[slot0.route].extra or {}).weather or 0
		end,
		getArmsData = function (slot0)
			return table.deepcopy((gGameModel.hunting:read("hunting_route")[slot0.route].extra or {}).arms or {}, true)
		end,
		getSendRequest = function (slot0)
			slot2 = slot0.selectWeatherID:read()

			return gGameApp:requestServerCustom("/game/hunting/battle/deploy"):params(slot0.route, gGameModel.hunting:read("hunting_route")[slot0.route].node or 1, slot0.clientBattleCards, {
				weather = slot0.selectWeatherID:read(),
				arms = table.deepcopy(slot0.selectArms:read(), true)
			})
		end
	}
}

function slot5(slot0, slot1, ...)
	uv2 = "from"
	slot3 = slot0.from
	uv3 = "from"

	return slot2[slot3][slot1] or slot3[game.EMBATTLE_FROM_TABLE.default][slot1](slot0, ...)
end

slot1.RESOURCE_FILENAME = "card_embattle.json"
slot1.RESOURCE_BINDING = {
	fightNote = "fightNote",
	dailyGateTipsPos = "dailyGateTipsPos",
	bottomPanel = "bottomPanel",
	textNotRole = "emptyTxt",
	bottomMask = "bottomMask",
	textLimit = "textLimit",
	battlePanel = "battlePanel",
	rightDown = "rightDown",
	spritePanel = "spriteItem",
	btnGHimg = {
		varname = "btnGHimg",
		binds = {
			event = "extend",
			class = "buff_arms",
			props = {
				battleCards = bindHelper.self("clientBattleCards"),
				arms = bindHelper.self("selectArms"),
				sceneType = bindHelper.self("sceneType"),
				getCardAttrsEx = bindHelper.self("getCardAttrsEx", true),
				isRefresh = bindHelper.self("isRefresh"),
				redHintTag = bindHelper.self("redHintTag")
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
	btnJump = {
		varname = "btnJump",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("cardBagBtn")
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
	["fightNote.textFightPoint"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("fightSumNum")
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
	["btnJump.textNote"] = {
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
	},
	["rightDown.btnOneKeySet"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("oneKeyEmbattleBtn")
			}
		}
	},
	["rightDown.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("battleNum")
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
	btnReady = {
		varname = "btnReady",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("oneReadyBtn")
			}
		}
	},
	["btnReady.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightDown.btnSaveReady"] = {
		varname = "btnSaveReady",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("oneSaveReadyBtn")
			}
		}
	},
	["rightDown.btnSaveReady.textNote"] = {
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

function slot1.onCreate(slot0, slot1)
	slot1 = slot1 or {}

	slot0.spriteItem:get("attrBg"):hide()
	slot0:initDefine()
	slot0.btnJump:z(5)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose", true)
	}):init({
		subTitle = "FORMATION",
		title = slot1.readyIdx and gLanguageCsv.presetFormation or gLanguageCsv.formation
	})
	slot0:initParams(slot1)
	slot0:initModel(slot1)
	slot0:initReadTeam(slot1)
	slot0:initHeroSprite()
	slot0:initBottomList()
	slot0:initRoundUIPanel()
	slot0:initBattleChange()

	if slot0.startCb and slot0:startCb() then
		slot0.clientBattleCards:set(slot2)
	end
end

function slot1.initDefine(slot0)
	slot0.embattleMax = 6
	slot0.panelNum = 6
end

function slot1.initParams(slot0, slot1)
	slot0.route = slot1.route
	slot0.inputCards = slot1.inputCards
	slot0.inputExtra = slot1.inputExtra
	slot0.sceneType = slot1.sceneType or -1
	slot0.from = slot1.from or game.EMBATTLE_FROM_TABLE.default
	slot0.fightCb = slot1.fightCb
	slot0.fromId = slot1.fromId
	slot0.startCb = slot1.startCb
	slot0.checkBattleArr = slot1.checkBattleArr or function ()
		return true
	end
	slot0.redHintTag = string.format("%s_%s", slot0.from, slot0.fromId or "")
end

function slot1.initBottomList(slot0, slot1)
	slot0.cardListView = gGameUI:createView(slot1 or "city.card.embattle.embattle_card_list", slot0.bottomPanel):init({
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

function slot1.getCardAttr(slot0, slot1, slot2)
	return gGameModel.cards:find(slot1):read(slot2)
end

function slot1.getCardAttrIdler(slot0, slot1, slot2)
	return gGameModel.cards:find(slot1):getIdler(slot2)
end

function slot1.initModel(slot0)
	slot0.cards = gGameModel.role:getIdler("cards")
	slot1 = idlers.newWithMap({})
	slot0.allCardDatas = slot1
	uv1 = "cards"
	slot0.battleCardsData = slot1(slot0, "initModelFunc")
	slot0.clientBattleCards = idlertable.new({})
	slot0.fightSumNum = idler.new(0)
	slot0.battleNum = idler.new("")
	slot0.selectIndex = idler.new()
	slot1 = idler.new(0)
	slot0.draggingIndex = slot1
	uv1 = "cards"
	slot0.selectWeatherID = slot1(slot0, "getWeatherID")
	slot0.originWeatherID = slot0.selectWeatherID
	slot1 = idlereasy.new(slot0.selectWeatherID)
	slot0.selectWeatherID = slot1
	uv1 = "cards"
	slot0.selectArms = slot1(slot0, "getArmsData")
	slot0.originArms = slot0.selectArms
	slot0.selectArms = idlereasy.new(table.deepcopy(slot0.selectArms, true))
	slot0.isRefresh = idler.new(true)
	slot1 = {}
	slot2 = 0

	idlereasy.when(slot0.battleCardsData, function ()
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
	end)
end

function slot1.getFightSumNum(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		slot2 = 0 + slot0:getCardAttr(slot7, "fighting_point")
	end

	return slot2
end

function slot1.sendRequeat(slot0, slot1, slot2)
	if not itertools.equal(slot0.battleCardsData:read(), slot0.clientBattleCards:read()) or slot0.originWeatherID ~= slot0.selectWeatherID:read() or not itertools.equal(slot0.originArms or {}, table.deepcopy(slot0.selectArms:read(), true) or {}) then
		if not slot0.checkBattleArr(slot0.clientBattleCards:read()) then
			if slot2 then
				slot1()
			else
				gGameUI:showTip(gLanguageCsv.lineupInconsistency)
			end

			return
		end

		uv6 = "itertools"

		if not slot6(slot0, "getSendRequest") then
			return slot1()
		end

		if slot2 then
			slot6:onBeforeSync(slot1):doit()
		else
			slot6:doit(slot1)
		end
	else
		slot1()
	end
end

function slot1.initRoundUIPanel(slot0)
	adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.fightNote,
			"pos",
			"right"
		},
		{
			slot0.btnChallenge,
			"pos",
			"right"
		},
		{
			slot0.btnJump,
			"pos",
			"right"
		},
		{
			slot0.rightDown,
			"pos",
			"right"
		}
	})

	slot1 = slot0.fightCb and true or false

	slot0.rightDown:visible(not slot1)
	slot0.btnChallenge:visible(slot1)
	slot0.btnJump:visible(slot0.from == game.EMBATTLE_FROM_TABLE.default)
end

function slot1.initReadTeam(slot0, slot1)
	slot0.readyIdx = slot1.readyIdx

	if slot0.readyIdx then
		slot0.btnSaveReady:visible(true)
	end

	slot3 = dataEasy.isShow(gUnlockCsv.readyTeam)

	slot0.btnReady:visible(slot3)

	if slot3 then
		slot0.btnReady:visible(slot0.from == game.EMBATTLE_FROM_TABLE.default or slot0.from == game.EMBATTLE_FROM_TABLE.onlineFight or (slot1.team and true or false))
	end

	uiEasy.updateUnlockRes(gUnlockCsv.readyTeam, slot0.btnReady, {
		pos = cc.p(285, 102)
	})
end

function slot1.embattleBtnFunc(slot0, slot1, slot2)
	return not slot1[csv.cards[slot0:getCardAttr(slot2.dbid, "card_id")].cardMarkID] and not slot2.inMeteor
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

			if 0 + 1 == slot0.embattleMax then
				break
			end
		end
	end

	return {
		[slot4] = slot9.dbid
	}
end

function slot1.oneKeyEmbattleBtn(slot0)
	slot1 = slot0:getOneKeyCardDatas()

	for slot5, slot6 in slot0.clientBattleCards:pairs() do
		slot0:getCardAttrs(slot6).battle = 0
	end

	for slot5, slot6 in pairs(slot1) do
		slot0:getCardAttrs(slot6).battle = slot0:getBattle(slot5)
	end

	slot0.clientBattleCards:set(slot1)
end

function slot1.initBattleChange(slot0)
	idlereasy.when(slot0.clientBattleCards, function (slot0, slot1)
		uv2 = "refreshTeamWeather"

		slot2:refreshTeamWeather(slot1)
	end)
	idlereasy.when(slot0.selectWeatherID, function (slot0, slot1)
		uv2 = "btnWeather"

		if slot2.btnWeather then
			uv2 = "btnWeather"

			if slot2.originWeatherID == nil or not slot1 or slot1 == 0 then
				uv2 = "btnWeather"

				slot2.btnWeather:hide()
			else
				uv2 = "btnWeather"
				slot2 = slot2.btnWeather
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "btnWeather"

				slot2.btnWeather:get("icon"):texture(csv.weather_system.weather[slot1].iconRes)
			end
		else
			printWarn("CardEmbattleView.btnWeather not exist")
		end
	end)
end

function slot1.initHeroSprite(slot0)
	slot5 = slot0.battlePanel
	slot5 = slot5.y
	slot1 = slot0:convertToWorldSpace(cc.p(slot0.battlePanel:x(), slot5(slot5)))
	slot0.offsetX = slot0.battlePanel:x() - slot1.x
	slot0.offsetY = slot0.battlePanel:y() - slot1.y
	slot0.heroSprite = {}

	for slot5 = 1, slot0.panelNum do
		uv9 = "convertToWorldSpace"
		slot6 = slot0.spriteItem:clone():addTo(slot0.battlePanel, 10 + slot9[slot5], "panel" .. slot5)

		slot6:show()
		slot6:get("imgBg"):hide()

		slot7, slot8 = slot0.battlePanel:get("item" .. slot5):xy()
		slot9 = slot0.battlePanel:get("item" .. slot5):box()
		slot9.x = slot9.x - slot0.offsetX
		slot9.y = slot9.y - slot0.offsetY
		slot0.heroSprite[slot5] = {
			sprite = slot6,
			posx = slot7,
			posy = slot8,
			box = slot9,
			idx = slot5
		}
	end

	for slot5 = 1, slot0.panelNum do
		slot6 = slot0.battlePanel
		slot7 = slot6
		slot6 = slot6.get(slot7, "item" .. slot5, "pos")
		uv7 = "cc"

		if slot7[slot5] then
			uv7 = "cc"
			slot7 = slot7[slot5].size
			uv8 = "cc"
			slot8 = slot8[slot5].pos
			slot9 = display.sizeInView.width / display.size.width
			slot10 = display.sizeInView.height / display.size.height
			slot12 = cc.p(slot9 * slot8.x, slot10 * slot8.y)
			slot13 = slot0.battlePanel:get("item" .. slot5)

			slot6:size(cc.size(slot9 * slot7.width, slot10 * slot7.height)):xy(slot13:size().width / 2 + slot12.x, slot13:size().height / 2 + slot12.y)
		end

		slot6:onTouch(functools.partial(slot0.onBattleCardTouch, slot0, slot5))
	end

	idlereasy.any({
		slot0.clientBattleCards,
		slot0.isRefresh
	}, function (slot0, slot1)
		uv4 = "panelNum"

		for slot6 = 1, slot4.panelNum do
			uv7 = "panelNum"
			slot7 = slot7.heroSprite[slot6]
			slot8 = slot7.idx
			slot11 = slot7.posx
			uv11 = "heroSprite"

			slot7.sprite:xy(slot11, slot7.posy):z(10 + slot11[slot6])
			slot7.sprite:get("attrBg"):hide()

			if slot1[slot6] then
				if slot1[slot6] then
					uv12 = "panelNum"

					if slot12:getCardAttrs(slot11) then
						slot2 = 0 + 1
						uv12 = "panelNum"
						slot13 = slot12
						slot12 = slot12.getCardAttrs(slot13, slot11)
						uv13 = "panelNum"
						slot12.battle = slot13:getBattle(slot6)
						uv12 = "panelNum"
						slot13 = slot12
						slot12 = slot12.getCardAttr(slot13, slot11, "card_id")
						uv13 = "panelNum"
						slot13 = slot13:getCardAttr(slot11, "skin_id")
						slot14 = dataEasy.getUnitCsv(slot12, slot13)
						slot15 = {
							dbid = slot11,
							card_id = slot12,
							skin_id = slot13
						}

						if not slot7.dbdata or not itertools.equal(slot7.dbdata, slot15) then
							slot7.sprite:get("icon"):removeAllChildren()

							slot16 = widget.addAnimation(slot7.sprite:get("icon"), slot14.unitRes, "standby_loop", 11):scale(slot14.scale):xy(50, 50)
							slot17 = slot16.setSkin

							slot17(slot16, slot14.skin)

							slot7.dbdata = slot15
							uv17 = "panelNum"

							if slot17.showItemFightPoint then
								uv17 = "panelNum"

								slot17:showItemFightPoint(slot7.sprite:get("fightPoint"), slot14, slot11)
							end
						end

						uv16 = "panelNum"

						if slot16.btnGHimg then
							uv16 = "panelNum"
							slot16 = slot16.btnGHimg.teamBuffs
						end

						if slot16 then
							uiEasy.setTeamBuffItem(slot7.sprite, slot12, (slot16.flags or {
								1,
								1,
								1,
								1,
								1,
								1
							})[slot6])
						end
					end
				end
			elseif slot7.dbdata then
				slot7.sprite:get("icon"):removeAllChildren()

				slot7.dbdata = nil

				slot9:hide()
			end
		end

		uv3 = "panelNum"
		slot3 = slot3.battleNum
		slot3 = slot3.set
		uv7 = "panelNum"
		slot5 = slot2 .. "/" .. slot7.embattleMax

		slot3(slot3, slot5)

		uv3 = "panelNum"
		uv5 = "panelNum"

		slot3.fightSumNum:set(slot5:getFightSumNum(slot1))
	end)
	idlereasy.when(slot0.draggingIndex, function (slot0, slot1)
		uv3 = "panelNum"

		for slot5 = 1, slot3.panelNum do
			uv6 = "panelNum"

			if slot6.heroSprite[slot5].sprite:get("icon"):getChildren()[1] then
				slot6[1]:setCascadeOpacityEnabled(true)

				if slot1 == 0 then
					slot6[1]:opacity(255)
				elseif slot1 == -1 then
					slot6[1]:opacity(155)
				elseif slot1 == slot5 then
					slot6[1]:opacity(255)
				else
					slot6[1]:opacity(155)
				end
			end
		end
	end)
	slot0:initSelectHalo()
end

function slot1.initSelectHalo(slot0)
	for slot4 = 1, slot0.panelNum do
		slot6 = slot0.battlePanel:get("item" .. slot4):size()
		slot8 = slot5:anchorPoint()
		slot9 = widget.addAnimationByKey(slot5, "effect/buzhen2.skel", "imgSel", "effect_loop", 2):xy(slot5:width() * slot8.x, slot5:height() * slot8.y):scale(((slot4 > 3 and slot4 - 3 or slot4) + 7) / 10):hide()
	end

	idlereasy.when(slot0.selectIndex, function (slot0, slot1)
		uv3 = "panelNum"

		for slot5 = 1, slot3.panelNum do
			uv6 = "panelNum"

			slot6.battlePanel:get("item" .. slot5):get("imgSel"):visible(slot1 == slot5)
			slot6:get("imgBg"):visible(slot1 ~= slot5)
		end
	end)
end

function slot1.createMovePanel(slot0, slot1)
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

function slot1.deleteMovingItem(slot0)
	slot0.selectIndex:set(0)

	if slot0.movePanel then
		slot0.movePanel:removeSelf()

		slot0.movePanel = nil
	end

	slot0.draggingIndex:set(0)
end

function slot1.moveMovePanel(slot0, slot1)
	if slot0.movePanel then
		slot0.movePanel:xy(slot1)
		slot0.selectIndex:set(slot0:whichEmbattleTargetPos(slot1))
	end
end

function slot1.moveEndMovePanel(slot0, slot1)
	if not slot0.movePanel then
		return
	end

	slot0:onCardMove(slot1, slot0.selectIndex:read(), true)
	slot0:deleteMovingItem()
end

function slot1.isMovePanelExist(slot0)
	return slot0.movePanel ~= nil
end

function slot1.onCardClick(slot0, slot1, slot2)
	if slot1.inMeteor then
		gGameUI:showTip(gLanguageCsv.cardInMeteorites)

		return
	end

	slot3 = nil
	slot5 = slot0:getIdxByDbId(slot0:getKey(slot1))

	if slot1.battle > 0 then
		if slot0:canBattleDown(slot1.battle) then
			slot0:downBattle(slot4)

			slot3 = gLanguageCsv.downToEmbattle
		else
			slot3 = gLanguageCsv.battleCannotEmpty
		end
	else
		slot6 = slot0:getIdxByDbId()

		if not slot0:canBattleUp() then
			slot3 = gLanguageCsv.battleCardCountEnough
		elseif slot0:hasSameMarkIDCard(slot1) then
			slot3 = gLanguageCsv.alreadyHaveSameSprite
		else
			slot0:upBattle(slot4, slot6)

			slot3 = gLanguageCsv.addToEmbattle
		end
	end

	if slot2 and slot3 then
		gGameUI:showTip(slot3)
	end
end

function slot1.canBattleDown(slot0)
	return (slot0.readyIdx and 0 or 1) < slot0.clientBattleCards:size()
end

function slot1.canBattleUp(slot0)
	return slot0.clientBattleCards:size() < slot0.embattleMax
end

function slot1.onCardMove(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot8 = slot0:getCardAttrs(slot0.clientBattleCards:read()[slot2])
	slot9 = slot0:getIdxByDbId(slot0:getKey(slot1)) == nil and 0 or 1

	if slot2 then
		if slot1.battle > 0 then
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
		elseif slot0:hasSameMarkIDCard(slot1) and slot10 ~= slot2 then
			slot4 = gLanguageCsv.alreadyHaveSameSprite
		elseif not slot7 and not slot0:canBattleUp() then
			slot4 = gLanguageCsv.battleCardCountEnough
		else
			slot0:upBattle(slot5, slot2)

			slot4 = gLanguageCsv.addToEmbattle
		end
	end

	if slot3 and slot4 then
		gGameUI:showTip(slot4)
	end
end

function slot1.onBattleCardTouch(slot0, slot1, slot2)
	if not slot0.clientBattleCards:read()[slot1] then
		return
	end

	if slot2.name == "began" then
		slot0:createMovePanel(slot0:getCardAttrs(slot3))
		slot0.selectIndex:set(slot1)
		slot0.heroSprite[slot1].sprite:hide()
		slot0.movePanel:xy(slot2.x, slot2.y)
	elseif slot2.name == "moved" then
		slot0:moveMovePanel(slot2)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0.heroSprite[slot1].sprite:show()
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
	for slot5 = 1, slot0.panelNum do
		if slot0.clientBattleCards:read()[slot5] == slot1 then
			return slot5
		end
	end
end

function slot1.getKey(slot0, slot1)
	if not slot1 then
		return nil
	end

	return slot1.dbid
end

function slot1.getCardAttrsEx(slot0, slot1, slot2)
	return slot0:getCardAttrs(slot2)
end

function slot1.getCardAttrs(slot0, slot1)
	return slot0.allCardDatas:atproxy(slot1)
end

function slot1.downBattle(slot0, slot1)
	slot0:getCardAttrs(slot1).battle = 0
	slot2 = slot0:getIdxByDbId(slot1)

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

function slot1.upBattle(slot0, slot1, slot2)
	if slot0.clientBattleCards:read()[slot2] then
		slot0:getCardAttrs(slot0.clientBattleCards:read()[slot2]).battle = 0
	end

	slot0.clientBattleCards:modify(function (slot0)
		uv1 = "getCardAttrs"
		uv2 = "battle"
		slot0[slot1] = slot2
		uv1 = "getBattle"
		slot2 = slot1
		uv3 = "battle"
		uv2 = "getBattle"
		uv4 = "getCardAttrs"
		slot1.getCardAttrs(slot2, slot3).battle = slot2:getBattle(slot4)

		return true, slot0
	end, true)
end

function slot1.hasSameMarkIDCard(slot0, slot1)
	for slot5 = 1, slot0.panelNum do
		if slot0.clientBattleCards:read()[slot5] and slot0:getCardAttrs(slot6).markId == slot1.markId then
			return slot5
		end
	end

	return false
end

function slot1.whichEmbattleTargetPos(slot0, slot1)
	for slot5 = slot0.panelNum, 1, -1 do
		if cc.rectContainsPoint(slot0.heroSprite[slot5].box, slot1) then
			return slot5
		end
	end
end

function slot1.refreshTeamWeather(slot0, slot1)
	dataEasy.getListenUnlock(gUnlockCsv.weather, function (slot0)
		uv2 = "dataEasy"
		uv3 = "getWeatherID"
		uv2 = "getWeatherID"
		slot2 = slot2.selectWeatherID

		slot2:set(dataEasy.getWeatherID(slot2, slot3.selectWeatherID:read()))
	end):anonyOnly(slot0)
end

function slot1.fightBtn(slot0)
	if not next(slot0.clientBattleCards:read()) then
		gGameUI:showTip(gLanguageCsv.noSpriteAvailable)

		return
	end

	slot0:sendRequeat(function ()
		uv1 = "table"
		slot1 = slot1.selectArms:read()
		slot2 = true
		uv1 = "table"
		uv2 = "table"
		uv3 = "table"
		uv5 = "table"

		slot1.fightCb(slot2, slot3.clientBattleCards, {
			weather = slot5.selectWeatherID:read(),
			arms = table.deepcopy(slot1, slot2)
		})
	end)
end

function slot1.onClose(slot0, slot1, slot2)
	if slot0.readyIdx and slot2 ~= true and slot0:isChangeBattleCards() then
		slot0:teamNotSave(function ()
			uv0 = "sendRequeat"

			if slot0 == true then
				uv0 = "functools"
				uv3 = "partial"
				uv4 = "functools"

				slot0:sendRequeat(functools.partial(slot3.onClose, slot4), true)
			else
				uv0 = "partial"
				uv1 = "functools"

				slot0.onClose(slot1)
			end
		end)
	else
		slot3()
	end
end

function slot1.isChangeBattleCards(slot0)
	slot1 = false

	if slot0.inputCards then
		if slot0.inputCards:size() == slot0.clientBattleCards:size() then
			for slot6, slot7 in pairs(slot0.clientBattleCards:read()) do
				if slot0.inputCards:read()[slot6] ~= slot7 then
					slot1 = true
				end
			end
		else
			slot1 = true
		end
	end

	if slot0.inputExtra then
		if slot0.originWeatherID ~= slot0.selectWeatherID:read() or not itertools.equal(slot0.originArms or {}, table.deepcopy(slot0.selectArms:read(), true) or {}) then
			slot1 = true
		end
	end

	return slot1
end

function slot1.cardBagBtn(slot0)
	slot0:sendRequeat(function ()
		uv1 = "performWithDelay"

		performWithDelay(slot1, function ()
			gGameUI:stackUI("city.card.bag", nil, {
				full = true
			})
		end, 0.016666666666666666)
	end)
end

function slot1.onTeamWeatherClick(slot0)
	gGameUI:stackUI("city.weather.weather_select", nil, , {
		cardsData = dataEasy.getTeamWeather(slot0.clientBattleCards:read(), true),
		weatherID = slot0.selectWeatherID
	})
end

function slot1.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot11 = csv.cards[slot2]
	slot12 = csv.unit[slot11.unitID]

	return {
		card_id = slot2,
		unit_id = dataEasy.getUnitId(slot2, slot3),
		rarity = slot12.rarity,
		attr1 = slot12.natureType,
		attr2 = slot12.natureType2,
		fighting_point = slot4,
		level = slot5,
		star = slot6,
		getTime = slot8,
		dbid = slot1,
		advance = slot7,
		battle = slot9,
		atkType = slot11.atkType,
		markId = slot11.cardMarkID,
		inMeteor = dataEasy.getInMeteorCardsHash()[slot1]
	}
end

function slot1.getBattle(slot0, slot1)
	if slot1 and slot1 ~= 0 then
		return math.ceil(slot1 / 6)
	else
		return 0
	end
end

function slot1.oneReadyBtn(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.readyTeam) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.readyTeam))

		return
	end

	gGameUI:stackUI("city.card.embattle.ready", nil, , {
		sceneType = slot0.sceneType,
		from = slot0.from,
		cb = function (slot0, slot1, slot2)
			uv3 = "clientBattleCards"

			for slot6, slot7 in slot3.clientBattleCards:pairs() do
				uv8 = "clientBattleCards"
				slot8:getCardAttrs(slot7).battle = 0
			end

			for slot6 = 1, 6 do
				if slot0[slot6] then
					uv7 = "clientBattleCards"

					if slot7:getCardAttrs(slot0[slot6]) then
						uv7 = "clientBattleCards"
						slot7:getCardAttrs(slot0[slot6]).battle = 1
					end
				end
			end

			uv3 = "clientBattleCards"
			slot3 = slot3.clientBattleCards
			slot3 = slot3.set

			slot3(slot3, slot0)

			uv3 = "clientBattleCards"
			slot3 = slot3.selectWeatherID
			slot3 = slot3.set

			slot3(slot3, slot2.weather)

			uv3 = "clientBattleCards"
			slot3 = slot3.selectArms
			slot3 = slot3.set

			slot3(slot3, slot2.arms)

			uv3 = "clientBattleCards"

			slot3.clientBattleCards:notify()

			if slot1 then
				slot1()
			end
		end
	})
end

function slot1.oneSaveReadyBtn(slot0)
	gGameApp:requestServer("/game/ready/card/deploy", function (slot0)
		uv1 = "onClose"

		slot1:onClose(nil, true)
		gGameUI:showTip(gLanguageCsv.positionSave)
	end, slot0.readyIdx, slot0.clientBattleCards:read(), {
		weather = slot0.selectWeatherID:read(),
		arms = table.deepcopy(slot0.selectArms:read(), true)
	})
end

function slot1.teamNotSave(slot0, slot1)
	gGameUI:showDialog({
		btnType = 2,
		content = gLanguageCsv.teamNotSave,
		cb = function ()
			uv0 = "oneSaveReadyBtn"

			slot0:oneSaveReadyBtn()
		end,
		cancelCb = slot1
	})
end

return slot1
