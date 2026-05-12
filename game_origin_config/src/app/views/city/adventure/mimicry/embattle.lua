slot0 = cc.load("mvc").ViewBase
slot2 = require("app.views.city.adventure.mimicry.tools")
slot3 = class("MimicryEmbattle", require("app.views.city.card.embattle.fake_embattle"))
slot4 = {
	hide = 1,
	limit = 2,
	unlock = 3
}
slot5 = {
	slot4.hide,
	slot4.hide,
	slot4.limit,
	slot4.hide,
	slot4.unlock,
	slot4.unlock,
	slot4.unlock,
	slot4.unlock,
	slot4.unlock
}
slot6 = {
	2,
	4,
	6,
	1,
	3,
	5
}
slot7 = {
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
slot3.RESOURCE_FILENAME = "mimicry_embattle.json"
slot3.RESOURCE_BINDING = {
	btnReady = "btnReady",
	bottomPanel = "bottomPanel",
	["limitPanel.subItem"] = "limitSubItem",
	["limitCardPanel.subItem"] = "limitCardSubItem",
	limitPanel = "limitPanel",
	textLimit = "textLimit",
	battlePanel = "battlePanel",
	rightDown = "rightDown",
	bossPanel = "bossPanel",
	bottomMask = "bottomMask",
	["limitPanel.rareItem"] = "rareItem",
	fightNote = "fightNote",
	limitCardPanel = "limitCardPanel",
	["limitCardPanel.cell"] = "limitCell",
	textTip = "textTip",
	limitSkillPanel = "limitSkillPanel",
	spritePanel = "spriteItem",
	btnGHimg = {
		varname = "btnGHimg",
		binds = {
			event = "extend",
			class = "buff_arms",
			props = {
				noTeamArm = true,
				battleCards = bindHelper.self("clientBattleCards"),
				arms = bindHelper.self("selectArms"),
				sceneType = bindHelper.self("sceneType"),
				getCardAttrsEx = bindHelper.self("getCardAttrsEx", true),
				isRefresh = bindHelper.self("isRefresh")
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
				ended = bindHelper.defer(function (slot0)
					slot0:fightBtn(cc.clampf(cc.clampf(gGameModel.daily_record:read("mimicry_battle_times"), 0, csv.mimicry.base[1].battleTimesLimit), 0, 3))
				end)
			}
		}
	},
	btnQuickChallenge = {
		varname = "btnQuickChallenge",
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:fightBtn(1)
				end)
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
	},
	["limitPanel.limitList"] = {
		varname = "limitList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				data = bindHelper.self("limitData"),
				item = bindHelper.self("limitSubItem"),
				cell = bindHelper.self("rareItem"),
				columnSize = bindHelper.self("limitColumnSize"),
				xMargin = bindHelper.self("xMargins"),
				yMargin = bindHelper.self("yMargins"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = ""

					if slot0.specialLimitType() == 1 or slot5 == 3 then
						slot4 = ui.RARITY_ICON[slot3]
					elseif slot5 == 2 then
						slot4 = ui.ATTR_ICON[slot3]
					end

					slot1:get("icon"):texture(slot4)
				end,
				onAfterBuild = function (slot0)
					slot0:setClippingEnabled(false)
				end
			},
			handlers = {
				specialLimitType = bindHelper.self("specialLimitType")
			}
		}
	},
	["limitCardPanel.limitCardList"] = {
		varname = "limitCardList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				data = bindHelper.self("limitCardData"),
				item = bindHelper.self("limitCardSubItem"),
				cell = bindHelper.self("limitCell"),
				xMargin = bindHelper.self("xMargins"),
				yMargin = bindHelper.self("yMargins"),
				columnSize = bindHelper.self("limitColumnSize"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(csv.unit[csv.cards[slot3].unitID].icon)
				end,
				onAfterBuild = function (slot0)
					slot0:setClippingEnabled(false)
				end
			}
		}
	}
}

function slot3.initParams(slot0, slot1)
	slot0.route = slot1.route
	slot0.inputCards = slot1.inputCards
	slot0.sceneType = slot1.sceneType or -1
	slot0.from = slot1.from or game.EMBATTLE_FROM_TABLE.default
	slot0.fightCb = slot1.fightCb
	slot0.fromId = slot1.fromId
	slot0.startCb = slot1.startCb
	slot0.xMargins = 0
	slot0.yMargins = 0
	slot0.limitColumnSize = 4
	slot0.bossID = slot1.bossID
	slot0.isQuick = slot1.isQuick
	slot0.bossCfg = csv.mimicry.boss[slot0.bossID]
	slot0.bossLimitCfg = csv.mimicry.boss_limit[slot1.limitID]
	slot0.specialLimitType = slot0.bossLimitCfg.specialLimitType
	slot0.checkBattleArr = slot1.checkBattleArr or function ()
		return true
	end
end

function slot3.initBottomList(slot0)
	slot0.cardListView = gGameUI:createView("city.adventure.mimicry.mimicry_card_list", slot0.bottomPanel):init({
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
		limtFunc = slot0.limtFunc,
		isQuick = slot0.isQuick,
		bossID = slot0.bossID
	}, true)
end

function slot3.initHeroSprite(slot0)
	slot5 = slot0.battlePanel
	slot5 = slot5.y
	slot1 = slot0:convertToWorldSpace(cc.p(slot0.battlePanel:x(), slot5(slot5)))
	slot0.offsetX = slot0.battlePanel:x() - slot1.x
	slot0.offsetY = slot0.battlePanel:y() - slot1.y
	slot0.heroSprite = {}

	slot0.spriteItem:get("held"):hide()

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
		slot3 = true
		uv5 = "panelNum"

		for slot7 = 1, slot5.panelNum do
			uv8 = "panelNum"
			slot8 = slot8.heroSprite[slot7]
			slot9 = slot8.idx
			slot12 = slot8.posx
			uv12 = "heroSprite"

			slot8.sprite:xy(slot12, slot8.posy):z(10 + slot12[slot7])

			slot10 = slot8.sprite:get("fightPoint")

			slot8.sprite:get("attrBg"):hide()

			if slot1[slot7] then
				slot2 = 0 + 1

				if slot1[slot7] then
					uv13 = "panelNum"

					if slot13:getCardAttrs(slot12) then
						uv13 = "panelNum"
						slot14 = slot13
						uv14 = "panelNum"
						slot13.getCardAttrs(slot14, slot12).battle = slot14:getBattle(slot7)
					end
				end

				uv13 = "panelNum"
				slot14 = slot13
				slot13 = slot13.getCardAttr(slot14, slot12, "card_id")
				uv14 = "panelNum"
				slot14 = slot14:getCardAttr(slot12, "skin_id")
				slot15 = dataEasy.getUnitCsv(slot13, slot14)
				slot16 = {
					card_id = slot13,
					skin_id = slot14
				}

				if not slot8.dbdata or not itertools.equal(slot8.dbdata, slot16) then
					slot8.sprite:get("icon"):removeAllChildren()
					widget.addAnimation(slot8.sprite:get("icon"), slot15.unitRes, "standby_loop", 11):scale(slot15.scale):xy(50, 50):setSkin(slot15.skin)

					slot8.dbdata = slot16
				end

				uv17 = "panelNum"

				if slot17.btnGHimg.teamBuffs then
					uiEasy.setTeamBuffItem(slot8.sprite, slot13, (slot17.flags or {
						1,
						1,
						1,
						1,
						1,
						1
					})[slot7])
				end
			elseif slot8.dbdata then
				slot8.sprite:get("icon"):removeAllChildren()

				slot8.dbdata = nil

				slot10:hide()
			end
		end

		uv4 = "panelNum"
		slot4 = slot4.battleNum
		slot5 = slot4
		slot4 = slot4.set
		uv8 = "panelNum"

		slot4(slot5, slot2 .. "/" .. slot8.embattleMax)

		uv4 = "idx"
		uv5 = "panelNum"
		slot5 = slot5.specialLimitType
		uv5 = "sprite"

		if slot4[slot5] == slot5.unlock then
			uv4 = "panelNum"
			slot5 = slot4
			slot4 = slot4.skillUnlockJudge(slot5)
			uv5 = "panelNum"
			slot5 = slot5.limitSkillPanel:get("iconLock")
			slot5 = slot5.setVisible

			slot5(slot5, not slot4)

			uv5 = "panelNum"

			slot5.limitSkillPanel:get("skillIcon"):setColor(slot4 and cc.c4b(255, 255, 255, 255) or cc.c4b(91, 84, 91, 153))
		end

		uv4 = "panelNum"

		if slot4.specialLimitType == 3 then
			uv4 = "panelNum"
			slot5 = slot4.bossLimitCfg.specialLimitParameter.count

			for slot10, slot11 in pairs(slot1) do
				if itertools.include(slot4.rarities, csv.unit[slot11].rarity) then
					slot6 = 0 + 1
				end
			end

			uv7 = "panelNum"

			slot7.limitPanel:get("txt"):text(string.format(gLanguageCsv.mimicryNumLimit, slot6, slot5))
		end
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

function slot3.limtFunc(slot0, slot1)
	uv2 = "specialLimitType"
	slot3 = slot0.specialLimitType
	uv3 = "hide"

	if slot2[slot3] == slot3.hide and not slot0:battleUpJudge(slot1) then
		return nil
	end

	slot2 = csv.cards[slot1.card_id]
	slot3 = csv.unit[slot1.unit_id]

	return {
		getTime = 0,
		fighting_point = 0,
		card_id = slot1.card_id,
		csvID = slot1.csvID,
		unit_id = slot1.unit_id,
		rarity = slot3.rarity,
		attr1 = slot3.natureType,
		attr2 = slot3.natureType2,
		level = slot1.level,
		star = slot1.star,
		advance = slot1.advance,
		battle = slot1.inBattle,
		atkType = slot2.atkType,
		markId = slot2.cardMarkID,
		held_item = slot1.held_item,
		skin_id = slot1.skin_id
	}
end

function slot3.createMovePanel(slot0, slot1)
	if slot0.movePanel then
		slot0.movePanel:removeSelf()
	end

	slot2 = csv.unit[slot1.unit_id]

	slot0.spriteItem:clone():addTo(slot0:getResourceNode(), 1000):show()

	if slot1.held_item then
		slot3:get("held"):get("heldIcon"):texture(csv.held_item.items[gGameModel.held_items:find(slot4):read("held_item_id")].icon)
		slot3:get("held"):show()
	end

	slot5 = slot3:get("icon"):size()

	widget.addAnimationByKey(slot3:get("icon"), slot2.unitRes, "hero", "run_loop", 1000):scale(slot2.scale):alignCenter(slot5):setSkin(slot2.skin)
	widget.addAnimationByKey(slot3:get("icon"), "effect/buzhen.skel", "effect", "effect_loop", 1002):scale(1):alignCenter(slot5)

	slot0.movePanel = slot3

	slot0.draggingIndex:set(-1)

	return slot3
end

function slot3.onCardClick(slot0, slot1, slot2)
	slot3 = nil

	if slot1.battle > 0 then
		if slot0:canBattleDown(slot1.battle) then
			slot0:downBattle(slot4)
			slot0:playHeldAction(slot1, slot0:getIdxByDbId(slot0:getKey(slot1)), nil, true)

			slot3 = gLanguageCsv.downToEmbattle
		else
			slot3 = gLanguageCsv.battleCannotEmpty
		end
	else
		slot7, slot8, slot9 = slot0:canBattleUp(slot1, slot0:getIdxByDbId())

		if not slot7 then
			slot3 = gLanguageCsv.battleCardCountEnough
		elseif slot0:hasSameMarkIDCard(slot1) then
			slot3 = gLanguageCsv.alreadyHaveSameSprite
		elseif not slot8 then
			slot3 = slot9
		else
			slot0:upBattle(slot4, slot6)
			slot0:playHeldAction(slot1, nil, slot6)

			slot3 = gLanguageCsv.addToEmbattle
		end
	end

	if slot2 and slot3 then
		gGameUI:showTip(slot3)
	end
end

function slot3.onCardMove(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot7 = slot0.clientBattleCards:read()[slot2]
	slot8 = slot0:getIdxByDbId(slot0:getKey(slot1)) == nil and 0 or 1

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
			slot0:playHeldAction(slot1, nil, slot2)
		elseif slot0:hasSameMarkIDCard(slot1) and slot9 ~= slot2 then
			slot4 = gLanguageCsv.alreadyHaveSameSprite
		else
			slot10, slot11, slot12 = slot0:canBattleUp(slot1, slot2)

			if not slot7 and not slot10 then
				slot4 = gLanguageCsv.battleCardCountEnough
			elseif not slot11 then
				slot4 = slot12
			else
				slot0:upBattle(slot5, slot2)
				slot0:playHeldAction(slot1, nil, slot2)

				slot4 = gLanguageCsv.addToEmbattle
			end
		end
	end

	if slot3 and slot4 then
		gGameUI:showTip(slot4)
	end
end

function slot3.onBattleCardTouch(slot0, slot1, slot2)
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
		else
			if slot0:whichEmbattleTargetPos(slot2) then
				if slot5 ~= slot1 then
					slot0:onCardMove(slot4, slot5, true)
					audio.playEffectWithWeekBGM("formation.mp3")
				else
					slot0:onCardMove(slot4, slot5, false)
				end
			else
				slot0:onCardMove(slot4, slot1, false)
			end

			slot0:playHeldAction(slot4, slot1, slot5)
		end
	end
end

function slot3.playHeldAction(slot0, slot1, slot2, slot3, slot4)
	if slot4 and slot2 then
		slot0.heroSprite[slot2].sprite:get("held"):stopAllActions()
		slot0.heroSprite[slot2].sprite:get("held"):hide()

		return
	end

	if not slot2 and not slot3 then
		return
	end

	if not slot1.held_item then
		if slot3 then
			slot0.heroSprite[slot3].sprite:get("held"):stopAllActions()
			slot0.heroSprite[slot3].sprite:get("held"):hide()
		end

		return
	end

	slot6 = slot0.heroSprite[slot3 or slot2].sprite
	slot8 = csv.held_item.items[gGameModel.held_items:find(slot5):read("held_item_id")]

	if slot2 then
		slot0.heroSprite[slot2].sprite:get("held"):stopAllActions()
		slot0.heroSprite[slot2].sprite:get("held"):hide()
	end

	slot6:get("held"):get("heldIcon"):texture(slot8.icon)
	slot6:get("held"):show()
	slot6:get("held"):get("heldIcon"):setOpacity(255)
	slot6:get("held"):get("heldBg"):setOpacity(255)
	transition.executeSequence(slot6:get("held"):get("heldIcon"), true):delay(2):fadeOut(0.5):done()
	transition.executeSequence(slot6:get("held"):get("heldBg"), true):delay(2):fadeOut(0.5):done()
end

function slot3.initRoundUIPanel(slot0)
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
		},
		{
			slot0.btnQuickChallenge,
			"pos",
			"right"
		}
	})
	slot0:initLimitPanel()

	slot1 = true

	slot0.rightDown:hide()
	slot0.btnChallenge:show()
	slot0.btnQuickChallenge:hide()
	slot0.btnJump:hide()
	slot0.btnReady:hide()

	if slot0.isQuick then
		if math.min(3, cc.clampf(gGameModel.daily_record:read("mimicry_battle_times"), 0, csv.mimicry.base[1].battleTimesLimit)) > 1 then
			slot0.btnQuickChallenge:show()
			slot0.btnChallenge:y(slot0.btnChallenge:getPositionY() - 100)
		end

		slot0.btnChallenge:get("textNote"):text(string.format(gLanguageCsv.mimicryQuickChallenge, math.max(1, slot4)))
	end

	slot0.textTip:anchorPoint(0.5, 0.5):x(display.sizeInView.width / 2):text(gLanguageCsv.mimicryLineup)
end

function slot3.limitPanelShow(slot0, slot1)
	for slot6, slot7 in pairs({
		slot0.limitPanel,
		slot0.limitCardPanel,
		slot0.limitSkillPanel
	}) do
		slot7:setVisible(slot7 == slot1)
	end
end

function slot3.adaptLimitPanel(slot0, slot1)
	slot2 = {}
	slot3, slot4, slot5, slot6 = nil

	if slot1 == "card" then
		slot2 = {
			limitSize = itertools.size(slot0.limitCardData),
			limitList = slot0.limitCardList,
			bg = slot0.limitCardPanel:get("bg"),
			cell = slot0.limitCell
		}
		slot0.xMargins = 5
		slot0.yMargins = -20
	else
		slot2 = {
			limitSize = itertools.size(slot0.limitData),
			limitList = slot0.limitList,
			bg = slot0.limitPanel:get("bg"),
			cell = slot0.rareItem
		}
		slot0.yMargins = -40
	end

	slot7 = 6
	slot8 = math.ceil(slot2.limitSize / slot7)
	slot9 = math.min(math.ceil(slot2.limitSize / slot8), slot7)

	slot2.bg:width(math.max(0, slot8 * slot2.bg:width()))
	slot2.bg:height(math.max(0, slot9 * slot2.cell:height() + (slot9 - 1) * slot0.xMargins + 50))
	slot2.limitList:x(slot2.limitList:x() - (slot8 * slot2.limitList:width() + (slot8 - 1) * slot0.yMargins) / 2 + slot2.limitList:width() / 2)

	slot0.limitColumnSize = slot2.limitSize <= slot7 and slot7 or slot9
end

function slot3.initLimitPanel(slot0)
	slot1 = slot0.bossLimitCfg.specialLimitParameter
	slot0.limitData = {}
	slot0.limitCardData = {}

	function slot2(slot0, slot1)
		uv2 = "limitPanelShow"
		slot3 = slot2
		uv4 = "limitPanelShow"

		slot2.limitPanelShow(slot3, slot4.limitSkillPanel)

		uv3 = "limitPanelShow"
		slot3 = slot3.limitSkillPanel:get("skillIcon")
		slot3 = slot3.setTouchEnabled

		slot3(slot3, true)

		uv3 = "limitPanelShow"
		slot3 = slot3.limitSkillPanel:get("skillIcon")
		slot4 = slot3
		slot5 = csv.skill[slot1].iconRes

		slot3.texture(slot4, slot5)

		slot3 = bind.touch
		uv4 = "limitPanelShow"
		uv5 = "limitPanelShow"

		slot3(slot4, slot5.limitSkillPanel:get("skillIcon"), {
			methods = {
				ended = function ()
					if dataEasy.isSkillChange() then
						uv6 = "dataEasy"
						uv6 = "isSkillChange"

						gGameUI:stackUI("common.skill_detail", nil, , {
							ignoreStar = false,
							hideSkillLevel = false,
							skillLevel = 1,
							skillId = slot6,
							skillIcon = slot6.iconRes
						})

						return
					end

					uv6 = "dataEasy"
					uv6 = "isSkillChange"
					slot6 = slot6.iconRes
					slot0 = gGameUI:stackUI("common.skill_detail", nil, {
						clickClose = true
					}, {
						ignoreStar = false,
						hideSkillLevel = false,
						skillLevel = 1,
						skillId = slot6,
						skillIcon = slot6
					})
					slot1 = slot0:getResourceNode()
					slot2, slot3 = slot1:xy()
					uv6 = "gGameUI"

					slot1:xy(slot6.limitSkillPanel:x() / 2 + 950, slot0.panel:y() + 200)
				end
			}
		})

		uv3 = "limitPanelShow"
		slot3 = slot3.limitSkillPanel:get("skillDesc")
		slot4 = rich.createWithWidth(slot0, 44, nil, 380, nil, cc.p(0, 0))
		slot5 = slot4:anchorPoint(0, 1):xy(0, slot3:height()):addTo(slot3, 2)
		slot5 = slot5.name

		slot5(slot5, "richText")

		uv5 = "limitPanelShow"

		slot5.limitSkillPanel:get("bg"):height(slot4:height() + 300)
	end

	slot3 = {
		function ()
			uv0 = "limitData"
			uv1 = "rarities"
			slot0.limitData = slot1.rarities or {}
			uv0 = "limitData"
			slot0 = slot0.adaptLimitPanel

			slot0(slot0)

			uv0 = "limitData"
			uv2 = "limitData"

			slot0:limitPanelShow(slot2.limitPanel)
		end,
		function ()
			uv0 = "limitData"
			uv1 = "natureTypes"
			slot0.limitData = slot1.natureTypes or {}
			uv0 = "limitData"
			slot0.xMargins = -20
			uv0 = "limitData"
			slot0 = slot0.adaptLimitPanel

			slot0(slot0)

			uv0 = "limitData"
			uv2 = "limitData"

			slot0:limitPanelShow(slot2.limitPanel)
		end,
		function ()
			uv0 = "limitData"
			uv1 = "rarities"
			slot0.limitData = slot1.rarities or {}
			uv0 = "limitData"
			slot0 = slot0.adaptLimitPanel

			slot0(slot0)

			uv0 = "limitData"
			uv2 = "limitData"

			slot0:limitPanelShow(slot2.limitPanel)
		end,
		slot4
	}
	uv4 = "bossLimitCfg"

	if not function ()
		uv0 = "limitCardData"
		uv1 = "cardIDs"
		slot0.limitCardData = slot1.cardIDs or {}
		uv0 = "limitCardData"
		slot0 = slot0.adaptLimitPanel
		slot2 = "card"

		slot0(slot0, slot2)

		uv0 = "limitCardData"
		uv2 = "limitCardData"

		slot0:limitPanelShow(slot2.limitCardPanel)
	end[slot0.specialLimitType] then
		slot0.limitPanel:hide()
	elseif slot3[slot0.specialLimitType] then
		slot3[slot0.specialLimitType]()
	else
		uv4 = "specialLimitParameter"

		slot4.bossType(slot0.bossLimitCfg, slot0.bossCfg, slot2)
	end

	slot0.bossPanel:get("bossIcon"):texture(csv.mimicry.boss[slot0.bossID].cardIcon)
end

function slot3.canBattleUp(slot0, slot1, slot2)
	slot3 = slot0.clientBattleCards:size() < slot0.embattleMax
	slot4 = true
	slot5 = nil
	uv6 = "clientBattleCards"
	slot7 = slot0.specialLimitType
	uv7 = "size"

	if slot6[slot7] ~= slot7.unlock then
		if slot0.specialLimitType == 3 and not slot0:battleUpJudge(slot1, slot2) then
			slot5 = gLanguageCsv.mimicryLimit
		end
	end

	return slot3, slot4, slot5
end

function slot3.skillUnlockJudge(slot0)
	slot1 = slot0.bossLimitCfg.specialLimitParameter
	slot2 = {
		[slot6] = slot0:getCardAttrs(slot7)
	}

	for slot6, slot7 in pairs(slot0.clientBattleCards:read()) do
		-- Nothing
	end

	return ({
		[5] = function ()
			uv1 = "csvMapPairs"

			for slot3, slot4 in csvMapPairs(slot1.cardIDs) do
				slot5 = false
				uv7 = "cardIDs"

				for slot9, slot10 in pairs(slot7) do
					if slot10.card_id == slot4 then
						slot5 = true

						break
					end
				end

				if not slot5 then
					return false
				end
			end

			return true
		end,
		[6] = function ()
			uv1 = "csvMapPairs"

			for slot3, slot4 in csvMapPairs(slot1.cardIDs) do
				uv6 = "cardIDs"

				for slot8, slot9 in pairs(slot6) do
					if slot4 == slot9.card_id then
						return true
					end
				end
			end

			return false
		end,
		[7] = function ()
			slot0 = false
			uv1 = "count"
			slot1 = slot1.count
			uv4 = "pairs"

			for slot6, slot7 in pairs(slot4) do
				uv11 = "count"

				if itertools.include(slot11.rarities, csv.unit[slot7.unit_id].rarity) then
					slot2 = 0 + 1
				end

				if slot1 <= slot2 then
					slot0 = true

					break
				end
			end

			return slot0
		end,
		[8] = function ()
			slot0 = false
			uv1 = "count"
			slot1 = slot1.count
			uv4 = "pairs"

			for slot6, slot7 in pairs(slot4) do
				slot8 = slot7.unit_id
				uv12 = "count"

				if not itertools.include(slot12.natureTypes, csv.unit[slot8].natureType) then
					uv12 = "count"

					if itertools.include(slot12.natureTypes, csv.unit[slot8].natureType2) then
						slot2 = 0 + 1
					end
				end

				if slot1 <= slot2 then
					slot0 = true

					break
				end
			end

			return slot0
		end,
		[9] = function ()
			slot0 = false
			uv2 = "pairs"

			for slot4, slot5 in pairs(slot2) do
				slot6 = slot5.unit_id
				uv10 = "unit_id"

				if not itertools.include(slot10.natureTypes, csv.unit[slot6].natureType) then
					uv10 = "unit_id"

					if itertools.include(slot10.natureTypes, csv.unit[slot6].natureType2) then
						slot0 = true

						break
					end
				end
			end

			return slot0
		end
	})[slot0.specialLimitType]()
end

function slot3.battleUpJudge(slot0, slot1, slot2)
	slot4 = csv.unit[dataEasy.getUnitId(slot1.card_id, slot1.skin_id)]
	slot5 = slot4.rarity
	slot6 = slot4.natureType
	slot7 = slot4.natureType2

	if not slot0.bossLimitCfg.specialLimitParameter then
		return true
	end

	if ({
		function ()
			slot0 = false
			uv1 = "rarities"

			if slot1.rarities then
				uv2 = "rarities"
				uv3 = "itertools"
				slot0 = itertools.include(slot2.rarities, slot3)
			end

			return slot0
		end,
		function ()
			slot0 = false
			uv1 = "natureTypes"

			if slot1.natureTypes then
				uv2 = "natureTypes"
				uv3 = "itertools"

				if not itertools.include(slot2.natureTypes, slot3) then
					uv2 = "natureTypes"
					uv3 = "include"
					slot0 = itertools.include(slot2.natureTypes, slot3)
				end
			end

			return slot0
		end,
		function ()
			uv1 = "itertools"
			uv2 = "include"

			if not itertools.include(slot1.rarities, slot2) then
				return true
			else
				slot0 = {
					[slot4] = slot6:getCardAttrs(slot5)
				}
				uv2 = "rarities"

				for slot4, slot5 in pairs(slot2.clientBattleCards:read()) do
					uv6 = "rarities"
				end

				uv1 = "itertools"
				slot1 = slot1.count
				slot2 = 0
				uv4 = "rarities"

				for slot6 = 1, slot4.embattleMax do
					uv7 = "pairs"

					if slot7 == slot6 then
						uv7 = "clientBattleCards"

						if not slot7 then
							slot7 = slot0[slot6]
						end
					end

					if slot7 then
						uv11 = "itertools"

						if itertools.include(slot11.rarities, csv.unit[slot7.unit_id].rarity) then
							slot2 = slot2 + 1
						end

						if slot1 < slot2 then
							return false
						end
					end
				end

				return true
			end
		end,
		function ()
			uv1 = "itertools"
			uv2 = "include"

			return not itertools.include(slot1.cardIDs, slot2.card_id)
		end
	})[slot0.specialLimitType] then
		return slot9[slot0.specialLimitType]()
	end

	return true
end

function slot3.fightBtn(slot0, slot1)
	if not next(slot0.clientBattleCards:read()) then
		gGameUI:showTip(gLanguageCsv.noSpriteAvailable)

		return
	end

	if gGameModel.daily_record:read("mimicry_battle_times") <= 0 then
		gGameUI:showTip(gLanguageCsv.todayChanllengeToMuch)

		return
	end

	slot3 = {
		[slot7] = slot0:getCardAttrs(slot8)
	}

	for slot7, slot8 in pairs(slot2) do
		-- Nothing
	end

	if slot0.isQuick then
		slot0:fightCb(slot3, {
			weather = slot0.selectWeatherID:read(),
			arms = table.deepcopy(slot0.selectArms:read(), true)
		}, slot1, function ()
			uv0 = "onClose"

			slot0:onClose()
		end)
	else
		slot0:fightCb(slot3, slot5)
	end
end

function slot3.onClose(slot0)
	if not slot0.isQuick then
		for slot6, slot7 in pairs(slot0.clientBattleCards:read()) do
			if slot0:getCardAttrs(slot7) then
				if slot8.skin_id and slot8.skin_id ~= 0 then
					-- Nothing
				end
			end
		end

		slot3 = userDefault.getForeverLocalKey("mimicryBattleCard", {})
		slot3[slot0.bossID] = {
			cards = {
				[slot6] = slot8.csvID
			},
			skins = {
				[slot8.card_id] = slot8.skin_id
			}
		}

		userDefault.setForeverLocalKey("mimicryBattleCard", slot3, {
			new = true
		})
		userDefault.setForeverLocalKey("mimicry_weather", slot0.selectWeatherID:read(), {
			new = true
		})
	end

	uv1 = "isQuick"

	slot1.onClose(slot0)
end

return slot3
