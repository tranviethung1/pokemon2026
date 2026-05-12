slot0 = require("app.views.city.activity.brave_challenge.adapt")
slot1 = 6
slot2 = 6
slot3 = {
	2,
	4,
	6,
	1,
	3,
	5
}
slot4 = {
	mine = 1,
	enemy = 2
}
slot5 = cc.load("mvc").ViewBase
slot7 = class("BraveChallengleEmbattle", require("app.views.city.card.embattle.base"))
slot7.RESOURCE_FILENAME = "activity_brave_challenge_embattle.json"
slot7.RESOURCE_BINDING = {
	["rightDown.textNum"] = "textNum",
	["panelTop.panelSelf"] = "panelSelfBadge",
	battlePanel1 = "leftPanel",
	rightDown = "rightDown",
	["rightDown.textNote"] = "textNote",
	spritePanel = "spriteItem",
	battlePanel2 = "rightPanel",
	bottomPanel = "bottomPanel",
	["panelTop.panelOpp"] = "panelOppBadge",
	["rightDown.btnChallenge"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("fightBtn")
			}
		}
	},
	["rightDown.btnOneKeySet.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["battlePanel1.ahead.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["battlePanel1.back.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["battlePanel2.ahead.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["battlePanel2.back.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["battlePanel1.fightNote.btnGHimg"] = {
		varname = "btnGHimg1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTeamBuffClick1")
			}
		}
	},
	["battlePanel2.fightNote.btnGHimg"] = {
		varname = "btnGHimg2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTeamBuffClick2")
			}
		}
	},
	["panelTop.panelSelf.txt02"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(63, 178, 239, 255)
				}
			}
		}
	},
	["panelTop.panelOpp.txt02"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(246, 82, 102, 255)
				}
			}
		}
	}
}

function slot7.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose", true)
	}):init({
		subTitle = "FORMATION",
		title = gLanguageCsv.formation
	})
	adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.rightDown,
			"pos",
			"right"
		}
	})
	slot0:initModel()

	slot0.fightCb = slot1.fightCb
	slot0.newCards = slot1.newCards
	slot0.emenyDatas = {}
	slot0.heroSprite = {}
	slot0.emenySprite = {}
	slot0.teamSelfBuff = {}
	slot0.teamEnemyBuff = {}
	slot0.panel = {
		{
			parent = slot0.leftPanel,
			list = slot0.heroSprite
		},
		{
			parent = slot0.rightPanel,
			list = slot0.emenySprite
		}
	}

	slot0:updateData()
	slot0:initSpriteItem()
	slot0:initEnemyUI()
	slot0:initSelfBadge(slot0.panelSelfBadge, slot0.badges:read())
	slot0:initBottomList()
	slot0:refreshTeamBuff(slot0.emenyDatas, 2)
	idlereasy.when(slot0.clientBattleCards, function (slot0, slot1)
		uv2 = "refreshTeamBuff"
		slot2 = slot2.refreshTeamBuff
		slot5 = 1

		slot2(slot2, slot1, slot5)

		uv2 = "refreshTeamBuff"
		slot3 = slot2

		slot2.showBattleNum(slot3, slot1)

		uv3 = "showBattleNum"

		for slot5 = 1, slot3 do
			uv6 = "refreshTeamBuff"

			slot6:initHeroSprite(slot5)
		end
	end)
end

function slot7.initModel(slot0)
	slot0.game = gGameModel.brave_challenge:getIdler("game")
	slot0.id = gGameModel.brave_challenge:getIdler("yyID")
	slot0.badges = gGameModel.brave_challenge:getIdler("badges")
	slot0.clientBattleCards = idlertable.new({})
	slot0.battleCardsData = idlertable.new({})
	slot0.allCardDatas = idlers.newWithMap({})
	slot0.selectIndex = idler.new(0)
	slot0.draggingIndex = idler.new(0)
end

function slot7.initParams(slot0)
	slot0.aidNum = 0
	slot0.aidCards = idlertable.new({})
	slot0.originAidCards = idlertable.new({})
end

function slot7.initBadge(slot0, slot1, slot2, slot3)
	slot5 = {}

	for slot9, slot10 in pairs(slot2) do
		if csv.brave_challenge.badge[slot10] then
			if slot5[slot11.rarity] == nil then
				slot5[slot11.rarity] = 1
			else
				slot5[slot11.rarity] = slot5[slot11.rarity] + 1
			end
		end
	end

	slot1:multiget("txtRate", "txtCommon", "btnSelfBadges").txtCommon:text(slot5[1] or 0)
	slot6.txtRate:text(slot5[2] or 0)
	slot1:onClick(functools.partial(slot0.onClickBadges, slot0, slot2, slot3))
end

function slot7.initSelfBadge(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in pairs(slot2) do
		for slot12, slot13 in pairs(slot8) do
			table.insert(slot3, slot13)
		end
	end

	uv8 = "pairs"

	slot0:initBadge(slot1, slot3, slot8.mine)
end

function slot7.updateData(slot0)
	slot1 = slot0.game:read()
	slot2 = slot1.cards
	slot4 = {
		[slot11] = true
	}
	slot5 = {}
	slot6 = {}

	for slot10, slot11 in ipairs(slot1.deployments) do
		if slot11 > 0 then
			-- Nothing
		end

		slot5[slot10] = slot11
		slot6[slot10] = slot11
	end

	slot0.clientBattleCards:set(slot6)
	slot0.battleCardsData:set(slot5)

	for slot12, slot13 in pairs(slot2) do
		slot16 = csv.unit[csv.cards[csv.brave_challenge.cards[slot12].cardID].unitID]
	end

	slot0.allCardDatas:update({
		[slot12] = {
			csvID = slot12,
			card_id = slot14.cardID,
			unit_id = slot15.unitID,
			level = slot14.level,
			star = slot14.star,
			advance = slot14.advance,
			rarity = slot16.rarity,
			attr1 = slot16.natureType,
			attr2 = slot16.natureType2,
			markId = slot15.cardMarkID,
			states = slot13,
			battle = slot4[slot12] and 1 or 0,
			isNew = slot0.newCards[slot12] or false
		}
	})
end

function slot7.showBattleNum(slot0, slot1)
	for slot6, slot7 in pairs(slot1) do
		if slot7 ~= 0 then
			slot2 = 0 + 1
		end
	end

	uv8 = "pairs"

	slot0.textNum:text(string.format("%d/%d", slot2, slot8))
	adapt.oneLineCenterPos(cc.p(163, 152), {
		slot0.textNote,
		slot0.textNum
	}, cc.p(5, 0))
end

function slot7.initSpriteItem(slot0)
	for slot4 = 1, 2 do
		uv8 = "panel"

		for slot10 = 1, slot8 do
			slot11 = slot0.panel[slot4].parent:get("item" .. slot10)
			slot12 = slot11:box()
			slot13 = slot11:getParent():convertToWorldSpace(cc.p(slot12.x, slot12.y))
			slot12.y = slot13.y
			slot12.x = slot13.x
			slot0.panel[slot4].list[slot10] = {
				item = slot11,
				rect = slot12,
				idx = slot10
			}

			if slot4 == 1 then
				slot11:onTouch(functools.partial(slot0.onBattleCardTouch, slot0, slot10))
			end
		end
	end

	uv2 = "panel"

	for slot4 = 1, slot2 do
		slot5 = slot0.heroSprite[slot4].item:get("imgBg")
		slot7 = slot5:size()
		slot6 = slot5:get("imgSel") or widget.addAnimationByKey(slot5, "effect/buzhen2.skel", "imgSel", "effect_loop", 2):xy(slot7.width / 2, slot7.height / 2 + 15)
	end

	idlereasy.when(slot0.selectIndex, function (slot0, slot1)
		uv3 = "heroSprite"

		for slot5 = 1, slot3 do
			uv6 = "item"

			slot6.heroSprite[slot5].item:get("imgBg.imgSel"):visible(slot1 == slot5)
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
end

function slot7.initEnemyUI(slot0)
	slot1 = slot0.game:read()
	slot2 = slot1.monsters
	slot4 = csv.brave_challenge.monster[slot1.monsterID]
	slot5 = csv.brave_challenge.cards
	slot9 = slot4.badges
	uv10 = "game"
	slot10 = slot10.enemy

	slot0:initBadge(slot0.panelOppBadge, slot9, slot10)

	slot0.emenyDatas = {}

	for slot9, slot10 in csvPairs(slot4.cards) do
		if slot2[slot9] and slot2[slot9][1] ~= 0 then
			slot0.emenyDatas[slot9] = slot10
		end
	end

	uv7 = "read"

	for slot9 = 1, slot7 do
		slot11 = slot0.emenySprite[slot9]

		if slot5[slot0.emenyDatas[slot9]] then
			slot14 = csv.unit[csv.cards[slot12.cardID].unitID]
			slot15 = slot11.item:get("imgBg")

			widget.addAnimationByKey(slot11.item, slot14.unitRes, "sprite", "standby_loop", 4):scale(-slot14.scale * 0.8, slot14.scale * 0.8):xy(slot15:x(), slot15:y() + 15):setSkin(slot14.skin)
			uiEasy.setTeamBuffItem(slot11.item, slot12.cardID, (slot0.teamEnemyBuff and slot0.teamEnemyBuff.flags or {
				1,
				1,
				1,
				1,
				1,
				1
			})[slot9])
		else
			slot11.item:get("attrBg"):hide()
		end
	end
end

function slot7.initHeroSprite(slot0, slot1)
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
		widget.addAnimationByKey(slot2, slot4.unitRes, "sprite", "standby_loop", 4):scale(slot4.scale * (0.8 + (slot1 - 1) % 3 * 0.1)):xy(slot5:x(), slot5:y() + 15):setSkin(slot4.skin)

		slot2.csvID = slot3.csvID
	end

	slot6 = slot3.card_id

	uiEasy.setTeamBuffItem(slot2, slot3.card_id, (slot0.teamSelfBuff and slot0.teamSelfBuff.flags or {
		1,
		1,
		1,
		1,
		1,
		1
	})[slot1])
end

function slot7.onBattleCardTouch(slot0, slot1, slot2)
	if slot0.clientBattleCards:read()[slot1] == 0 then
		return
	end

	if slot2.name == "began" then
		slot0:deleteMovingItem()
		slot0:createMovePanel(slot0:getCardAttrs(slot0.clientBattleCards:read()[slot1]))

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

function slot7.initBottomList(slot0)
	slot0.cardListView = gGameUI:createView("city.card.embattle.brave_challenge_card_list", slot0.bottomPanel):init({
		base = slot0,
		clientBattleCards = slot0.clientBattleCards,
		battleCardsData = slot0.battleCardsData,
		selectIndex = slot0.selectIndex,
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

function slot7.canBattleDown(slot0)
	return slot0.clientBattleCards:size() > 1
end

function slot7.canBattleUp(slot0)
	for slot5, slot6 in slot0.clientBattleCards:pairs() do
		if slot6 > 0 then
			slot1 = 0 + 1
		end
	end

	uv2 = "clientBattleCards"

	return slot1 < slot2
end

function slot7.whichEmbattleTargetPos(slot0, slot1)
	uv2 = "heroSprite"

	for slot5 = slot2, 1, -1 do
		if cc.rectContainsPoint(slot0.heroSprite[slot5].rect, slot1) then
			return slot5
		end
	end
end

function slot7.deleteMovingItem(slot0)
	slot0.selectIndex:set(0)

	if slot0.movePanel then
		slot0.movePanel:removeSelf()

		slot0.movePanel = nil
	end

	slot0.draggingIndex:set(0)
end

function slot7.moveMovePanel(slot0, slot1)
	if slot0.movePanel then
		slot0.movePanel:xy(slot1)
		slot0.selectIndex:set(slot0:whichEmbattleTargetPos(slot1))
	end
end

function slot7.moveEndMovePanel(slot0, slot1)
	if not slot0.movePanel then
		return
	end

	slot0:onCardMove(slot1, slot0.selectIndex:read(), true)
	slot0:deleteMovingItem()
end

function slot7.isMovePanelExist(slot0)
	return slot0.movePanel ~= nil
end

function slot7.getIdxByDbId(slot0, slot1)
	uv3 = "clientBattleCards"

	for slot5 = 1, slot3 do
		if (slot0.clientBattleCards:read()[slot5] or 0) == slot1 then
			return slot5
		end
	end
end

function slot7.onCardMove(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot8 = slot0:getCardAttrs(slot0.clientBattleCards:read()[slot2])
	slot9 = slot0:getIdxByDbId(slot1.csvID) == nil and 0 or 1

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

function slot7.onCardClick(slot0, slot1, slot2)
	slot3 = nil
	slot5 = slot0:getIdxByDbId(slot1.csvID)

	if slot1.battle > 0 then
		if slot0:canBattleDown() then
			slot0:downBattle(slot4, true)
		else
			slot3 = gLanguageCsv.battleCannotEmpty
		end
	else
		slot6 = slot0:getIdxByDbId(0)

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

function slot7.downBattle(slot0, slot1)
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

function slot7.upBattle(slot0, slot1, slot2)
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

function slot7.hasSameMarkIDCard(slot0, slot1)
	uv3 = "clientBattleCards"

	for slot5 = 1, slot3 do
		if slot0.clientBattleCards:read()[slot5] ~= 0 and slot0:getCardAttrs(slot6).markId == slot1.markId then
			return slot5
		end
	end

	return false
end

function slot7.createMovePanel(slot0, slot1)
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

function slot7.refreshTeamBuff(slot0, slot1, slot2)
	uv6 = "csv"

	for slot8 = 1, slot6 do
		if slot1[slot8] and slot9 ~= 0 then
			slot12 = csv.unit[csv.cards[csv.brave_challenge.cards[slot9].cardID].unitID]
		end
	end

	slot0["btnGHimg" .. slot2]:texture(dataEasy.getTeamBuffBest({
		[slot8] = {
			slot12.natureType,
			slot12.natureType2
		}
	}).buf.imgPath)

	if slot2 == 1 then
		slot0.teamSelfBuff = slot5
	else
		slot0.teamEnemyBuff = slot5
	end
end

function slot7.onClickBadges(slot0, slot1, slot2)
	gGameUI:stackUI("city.activity.brave_challenge.badge", nil, , slot1, slot2)
end

function slot7.onTeamBuffClick1(slot0)
	gGameUI:stackUI("city.card.embattle.attr_dialog", nil, {}, {
		teamBuffs = slot0.teamSelfBuff and slot0.teamSelfBuff.buf.teamBuffs or {}
	})
end

function slot7.onTeamBuffClick2(slot0)
	gGameUI:stackUI("city.card.embattle.attr_dialog", nil, {}, {
		teamBuffs = slot0.teamEnemyBuff and slot0.teamEnemyBuff.buf.teamBuffs or {}
	})
end

function slot7.sendRequeat(slot0, slot1, slot2)
	if not itertools.equal(slot0.battleCardsData:read(), slot0.clientBattleCards:read()) then
		slot6 = true

		for slot10, slot11 in pairs(slot4) do
			if slot11 ~= 0 then
				slot6 = false
			end
		end

		if slot2 and slot6 then
			slot0:onClose()

			return
		end

		slot7 = nil
		uv10 = "battleCardsData"

		gGameApp:requestServerCustom(slot10.url("deploy")):params(slot4, slot0.id:read()):onBeforeSync(slot1):doit()
	else
		slot1()
	end
end

function slot7.fightBtn(slot0)
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

	slot0:sendRequeat(function ()
		uv0 = "fightCb"
		uv1 = "fightCb"
		uv2 = "fightCb"

		slot0.fightCb(slot1, slot2.clientBattleCards)
	end)
end

function slot7.getCardAttrs(slot0, slot1)
	return slot0.allCardDatas:atproxy(slot1)
end

return slot7
