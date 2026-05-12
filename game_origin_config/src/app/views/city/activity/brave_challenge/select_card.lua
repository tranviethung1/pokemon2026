slot0 = require("app.views.city.activity.brave_challenge.adapt")
slot1 = 3
slot2 = {
	clearance = 4,
	failure = 2,
	uncondition = 0,
	gainCard = 1,
	gainBuff = 3
}
slot3 = 0.5
slot4 = {
	cc.p(95, 100),
	cc.p(295, 100),
	cc.p(495, 100),
	cc.p(695, 100),
	cc.p(895, 100),
	cc.p(1095, 100),
	cc.p(1455, 100),
	cc.p(1655, 100)
}
slot5 = {
	cc.p(-522, 165),
	cc.p(11, 165),
	cc.p(546, 165)
}
slot7 = class("BraveChallengeSelectCardView", cc.load("mvc").ViewBase)
slot7.RESOURCE_FILENAME = "activity_brave_challenge_view_select_card.json"
slot7.RESOURCE_BINDING = {
	["bottomPanel.commonTipPanel"] = "commonTipPanel",
	selectPanel = "selectPanel",
	["bottomPanel.btnFilter"] = "btnFilter",
	item01 = "item01",
	["bottomPanel.rateTipPanel"] = "rateTipPanel",
	item02 = "item02",
	starItem = "starItem",
	selectItem = "selectItem",
	["bottomPanel.txtTip"] = "txtTip",
	bottomPanel = "bottomPanel",
	["bottomPanel.btnStart"] = {
		varname = "btnStart",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnGame")
			}
		}
	},
	["bottomPanel.btnStart.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.ORANGE
				}
			}
		}
	},
	["bottomPanel.btnFilter.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(246, 82, 102, 255)
				}
			}
		}
	},
	["bottomPanel.cardList"] = {
		varname = "cardList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 3,
				data = bindHelper.self("allCardDatas"),
				item = bindHelper.self("item01"),
				cloneItem = bindHelper.self("item02"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = 1

					slot1:removeAllChildren()

					for slot9, slot10 in pairs(slot3) do
						slot11 = 7

						if slot10.unlockType == 0 then
							slot11 = slot5
							slot5 = slot5 + 1
						else
							slot4 = slot4 + 1
						end

						slot12 = slot0.cloneItem:clone()
						slot15 = slot1

						slot12:addTo(slot15)

						uv15 = "removeAllChildren"

						slot12:xy(slot15[slot11])
						slot12:multiget("imgSelect", "imgLock", "imgNew").imgSelect:visible(slot10.battle == 1)
						slot13.imgLock:visible(not slot10.isUse)
						bind.extend(slot0, slot12, {
							class = "card_icon",
							props = {
								unitId = slot10.unitId,
								advance = slot10.advance,
								rarity = slot10.rarity,
								star = slot10.star,
								grayState = (slot10.battle == 1 or not slot10.isUse) and 1 or 0,
								isNew = slot10.isNew,
								levelProps = {
									data = slot10.level
								},
								onNode = function (slot0)
									slot0:xy(-4, -4)
								end
							}
						})

						if slot10.isUse then
							bind.touch(slot0, slot12, {
								methods = {
									ended = functools.partial(slot0.clickCell, slot10, slot2, slot9)
								}
							})
						else
							bind.touch(slot0, slot12, {
								methods = {
									ended = functools.partial(slot0.clickCellTwo, slot10)
								}
							})
						end
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onSelectCard", true),
				clickCellTwo = bindHelper.self("onDelockTip", true)
			}
		}
	},
	["selectItem.panelAddInfo.txtUp"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.OUTLINE.ORANGE
				}
			}
		}
	}
}

function slot7.onCreate(slot0, slot1)
	slot0.parent = slot1.parent
	slot0.data = slot1.data.datas

	slot0:initModel()

	slot0.selectIndex = idler.new()
	slot0.allCardDatas = idlers.newWithMap({})
	slot0.selectCardData = idlertable.new({})
	slot0.filterCondition = idlertable.new()
	slot0.commonCardDatas = {}
	slot0.rateCardDatas = {}
	slot0.activityId = slot0.id:read()

	slot0:initBaseCardData()

	slot0.showPanel = {}
	slot0.baseInfo = slot0.parent:getBaseInfo()

	slot0:initShowPanel()
	idlereasy.when(slot0.selectCardData, function (slot0, slot1)
		uv3 = "showSelectCard"

		for slot5 = 1, slot3 do
			uv6 = "showSelectCard"

			slot6:showSelectCard(slot5, slot1[slot5])
		end
	end)
	idlereasy.when(slot0.filterCondition, function ()
		uv0 = "reflushDatas"

		slot0:reflushDatas()
	end)
	slot0:initFilterBtn()
	slot0:initSelectPanel()
	slot0:initDownPanel()
	slot0:runStartAction()
end

function slot7.initShowPanel(slot0)
	uv2 = "selectItem"

	for slot4 = 1, slot2 do
		slot7 = slot0.selectPanel
		uv7 = "clone"
		slot0.showPanel[slot4] = slot0.selectItem:clone():show():addTo(slot7):xy(slot7[slot4])
	end
end

function slot7.openAddCardView(slot0)
	slot0.addCards = idler.new(0)

	idlereasy.when(slot0.addCards, function (slot0, slot1)
		uv2 = "data"

		if slot1 < itertools.size(slot2.data.add or {}) then
			uv3 = "data"

			slot3:checkCards(slot2[slot1 + 1])
		end
	end)
end

function slot7.initDownPanel(slot0)
	slot0.txtTip:text(string.format(gLanguageCsv.bcSelectCardTip03, slot0.baseInfo.sameTimes))
end

function slot7.runStartAction(slot0)
	slot1, slot2 = slot0.bottomPanel:xy()

	slot0.bottomPanel:xy(slot1, slot2 - 600)
	slot0.selectPanel:visible(false)
	performWithDelay(slot0, function ()
		uv0 = "bottomPanel"
		slot0 = slot0.bottomPanel
		slot0 = slot0.runAction
		slot6 = cc.MoveTo
		slot7 = slot6
		uv8 = "runAction"
		uv10 = "cc"
		uv11 = "Sequence"
		uv7 = "runAction"

		slot0(slot0, cc.Sequence:create(cc.EaseOut:create(slot6.create(slot7, slot8, cc.p(slot10, slot11)), slot7), cc.CallFunc:create(function ()
			uv0 = "selectPanel"
			slot0 = slot0.selectPanel
			slot0 = slot0.visible

			slot0(slot0, true)

			uv0 = "selectPanel"

			slot0:openAddCardView()
		end), nil))

		uv0 = "bottomPanel"

		slot0.parent:setType(2)
	end, 0.016666666666666666)
end

function slot7.runEndAction(slot0)
	slot0.selectPanel:visible(false)

	slot1, slot2 = slot0.bottomPanel:xy()
	slot9 = cc.MoveTo
	slot10 = slot9
	uv11 = "selectPanel"
	uv10 = "selectPanel"

	slot0.bottomPanel:runAction(cc.Sequence:create(cc.EaseOut:create(slot9.create(slot10, slot11, cc.p(slot1, slot2 - 600)), slot10), cc.CallFunc:create(function ()
	end), nil))
end

function slot7.initModel(slot0)
	slot0.id = gGameModel.brave_challenge:getIdler("yyID")
	slot0.unlockCards = gGameModel.brave_challenge:getIdler("unlock_cards")
	slot0.status = gGameModel.brave_challenge:getIdler("status")
end

function slot7.initSelectPanel(slot0)
	for slot4 = 1, 3 do
		slot6 = slot0.showPanel[slot4]:get("imgBg")
		slot8 = slot6:size()
		slot7 = slot6:get("imgSel") or widget.addAnimationByKey(slot5, "effect/buzhen2.skel", "imgSel", "effect_loop", 5):xy(slot6:x(), slot6:y() + 20):scale(0.6)
	end
end

function slot7.checkCards(slot0, slot1)
	gGameUI:stackUI("city.activity.brave_challenge.gain_card", nil, {
		blackLayer = true,
		clickClose = true
	}, slot1, slot0:createHandler("addCount"))
end

function slot7.addCount(slot0)
	slot0.addCards:set(slot0.addCards:read() + 1)
end

function slot7.getCardType(slot0)
	for slot6, slot7 in csvPairs(slot0.parent:getBaseInfo().cards) do
		-- Nothing
	end

	return {
		[slot7] = slot6
	}
end

function slot7.initBaseCardData(slot0)
	slot1 = slot0:getCardType()
	slot2 = {
		[slot8] = true
	}

	for slot7, slot8 in ipairs(gGameModel.brave_challenge:read("unlock_cards")) do
		-- Nothing
	end

	slot4 = {
		[slot10] = true
	}

	for slot9, slot10 in ipairs(slot0.data.add or {}) do
		-- Nothing
	end

	slot6 = {}
	slot7 = {}
	slot0.starAddAttrsData = {}

	for slot11, slot12 in csvPairs(csv.brave_challenge.cards) do
		if slot1[slot12.groupID] then
			slot0.starAddAttrsData[slot12.cardID] = slot12
			slot13 = csv.cards[slot12.cardID]
			slot14 = csv.unit[slot13.unitID]

			if slot12.unlockType == 0 then
				table.insert(slot0.commonCardDatas, {
					battle = 0,
					csvID = slot11,
					cardId = slot12.cardID,
					unitId = slot13.unitID,
					level = slot12.level,
					star = slot12.star,
					advance = slot12.advance,
					rarity = slot14.rarity,
					attr1 = slot14.natureType,
					attr2 = slot14.natureType2,
					atkType = slot13.atkType,
					unlockTarget = slot12.unlockTarget,
					unlockType = slot12.unlockType,
					lockTip = slot12.unlockdesc1,
					isNew = slot4[slot11] or false,
					isUse = true
				})
			else
				slot15.isUse = slot2[slot11] or false

				table.insert(slot0.rateCardDatas, slot15)
			end
		end
	end
end

function slot7.setStructData(slot0, slot1, slot2)
	slot4 = {}

	for slot9, slot10 in pairs(slot1) do
		if (0 + 1) % slot2 == 1 then
			if slot2 < slot5 then
				table.insert({}, slot4)
			end

			slot4 = {}
		end

		table.insert(slot4, slot10)
	end

	if #slot4 > 0 then
		table.insert(slot3, slot4)

		slot4 = {}
	end

	return slot3
end

function slot7.setShowData(slot0, slot1, slot2)
	slot3 = slot0:setStructData(slot1, 6)
	slot5 = #slot3

	if #slot3 < #slot0:setStructData(slot2, 2) then
		slot5 = #slot4
	end

	for slot10 = 1, slot5 do
		for slot15, slot16 in ipairs(slot4[slot10] or {}) do
			table.insert(slot6[slot10], slot16)
		end
	end

	slot0.allCardDatas:update({
		[slot10] = slot3[slot10] or {}
	})
end

function slot7.reflushDatas(slot0)
	slot1 = slot0:onFilterCards()
	slot2 = slot0:onSortCards()

	function slot3(slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0) do
			uv7 = "ipairs"

			if slot7(slot6) then
				table.insert(slot1, slot6)
			end
		end

		uv4 = "table"

		table.sort(slot1, slot4)

		return slot1
	end

	slot5 = slot3(slot0.rateCardDatas)

	slot0:setShowData(slot3(slot0.commonCardDatas), slot5)
	slot0.rateTipPanel:visible(#slot5 == 0)
	adapt.setTextScaleWithWidth(slot0.rateTipPanel:get("txt"), nil, 280)
	slot0.commonTipPanel:visible(#slot4 == 0)
end

function slot7.showSelectCard(slot0, slot1, slot2)
	slot3 = csv.brave_challenge.cards
	slot6 = slot0.showPanel[slot1]:get("panelAddInfo")

	if not slot0.selectCardData:read()[slot1] then
		if slot5:getChildByName("sprite") then
			slot5:getChildByName("sprite"):hide()
		end

		slot6:hide()

		return
	end

	slot9 = csv.unit[csv.cards[slot3[slot4].cardID].unitID]
	slot10 = slot5:get("imgBg")

	if slot5.csvID == slot4 and slot5:getChildByName("sprite") then
		slot5:getChildByName("sprite"):show()
	else
		slot5:removeChildByName("sprite")
		widget.addAnimationByKey(slot5, slot9.unitRes, "sprite", "standby_loop", 1):scale(slot9.scale * 0.8):xy(slot10:x(), slot10:y() + 15):setSkin(slot9.skin)

		slot5.csvID = slot4
	end

	if slot0.baseInfo.isStarAttrAdd then
		slot6:show()
		slot0:initDownStar(slot6, slot7.cardID)
	end
end

function slot7.initFilterBtn(slot0)
	slot1 = slot0:convertToNodeSpace(slot0.btnFilter:parent():convertToWorldSpace(slot0.btnFilter:box()))
	slot2 = gGameUI:getConvertPos(slot0.btnFilter, slot0:getResourceNode())

	gGameUI:createView("city.card.bag_filter", slot0.btnFilter):init({
		cb = slot0:createHandler("onBattleFilter"),
		others = {
			height = 122,
			panelOrder = false,
			width = 190,
			isShow = false,
			x = slot2.x,
			y = slot2.y,
			btn = slot0.btnFilter
		}
	}):z(100):xy(-slot1.x, -slot1.y)
end

function slot7.onBtnGame(slot0)
	if table.nums(slot0.selectCardData:read()) ~= 3 then
		gGameUI:showTip(gLanguageCsv.bcSelectCardTip)

		return
	end

	if slot0.status:read() == "start" then
		return
	end

	if slot0.data.jump then
		gGameApp:requestServer("/game/brave_challenge/jump/next", function (slot0)
			slot1 = gGameUI
			slot1 = slot1.disableTouchDispatch
			uv3 = "gGameUI"

			slot1(slot1, slot3, false)

			uv1 = "disableTouchDispatch"

			slot1.parent:openOtherView("city.activity.brave_challenge.challenge_gate", 3, true, slot0.view)
		end, slot0.selectCardData:read())
	else
		uv4 = "nums"

		gGameApp:requestServer(slot4.url("preEnd"), function (slot0)
			slot1 = gGameUI
			slot1 = slot1.disableTouchDispatch
			uv3 = "gGameUI"

			slot1(slot1, slot3, false)

			uv1 = "disableTouchDispatch"

			slot1.parent:openOtherView("city.activity.brave_challenge.challenge_gate", 3, true)
		end, slot0.selectCardData:read(), slot0.activityId)
	end
end

function slot7.onSelectCard(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}

	if table.nums(slot0.selectCardData:read()) >= 3 and slot2.battle == 0 then
		gGameUI:showTip(gLanguageCsv.bcSelectCardTip02)

		return
	end

	for slot9, slot10 in slot0.selectCardData:ipairs() do
		slot5[slot9] = slot10
	end

	if slot2.battle == 0 then
		table.insert(slot5, slot2.csvID)
	else
		for slot9, slot10 in ipairs(slot5) do
			if slot10 == slot2.csvID then
				table.remove(slot5, slot9)

				break
			end
		end
	end

	slot0.allCardDatas:atproxy(slot3)[slot4].battle = slot2.battle == 0 and 1 or 0
	slot6[slot4].isNew = false

	slot0.selectCardData:set(slot5)
end

function slot7.onDelockTip(slot0, slot1, slot2)
	gGameUI:showTip(slot2.lockTip)
end

function slot7.onBattleFilter(slot0, slot1, slot2, slot3, slot4)
	slot0.filterCondition:set({
		attr1 = slot1,
		attr2 = slot2,
		rarity = slot3,
		atkType = slot4
	}, true)
end

function slot7.onFilterCards(slot0)
	slot2 = {}

	if not itertools.isempty(slot0.filterCondition:read()) then
		slot2 = {
			{
				"rarity",
				slot1.rarity < ui.RARITY_LAST_VAL and slot1.rarity or nil
			},
			{
				"attr2",
				slot1.attr2 < ui.ATTR_MAX and slot1.attr2 or nil
			},
			{
				"attr1",
				slot1.attr1 < ui.ATTR_MAX and slot1.attr1 or nil
			},
			{
				"atkType",
				slot1.atkType
			}
		}
	end

	function slot3(slot0, slot1, slot2)
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

function slot7.onSortCards(slot0)
	return function (slot0, slot1)
		if slot0.battle ~= slot1.battle then
			return slot1.battle < slot0.battle
		end

		if slot0.isUse ~= slot1.isUse then
			return slot0.isUse
		end

		if slot0.rarity ~= slot1.rarity then
			return slot3 < slot2
		end

		return slot0.cardId < slot1.cardId
	end
end

function slot7.getCardMaxStar(slot0, slot1, slot2)
	slot6 = nil

	for slot10, slot11 in ipairs(gGameModel.role:read("cards")) do
		slot12 = gGameModel.cards:find(slot11)
		slot14 = slot12:read("star")

		if slot1 == csv.cards[slot12:read("card_id")].cardMarkID and 0 < slot14 and (not slot2 or slot2 and slot15.megaIndex ~= 0) then
			slot4 = slot14
			slot6 = slot11
		end
	end

	return slot4, {
		[slot13] = true
	}, slot6
end

function slot7.getAddNum(slot0, slot1, slot2)
	if slot0.starAddAttrsData[slot1] then
		slot4 = 0

		for slot8, slot9 in ipairs(slot3.starUnlock) do
			if slot9 <= slot2 then
				slot4 = slot8
			end
		end

		if slot4 ~= 0 then
			return dataEasy.attrSubtraction(slot3.addAttributes[slot4], "100%")
		end
	end

	return "0%"
end

function slot7.initDownStar(slot0, slot1, slot2)
	slot3 = csv.cards[slot2]
	slot8 = slot1:multiget("txtUp", "starList", "btnDetail")

	slot8.txtUp:text(slot0:getAddNum(slot2, slot0:getCardMaxStar(slot3.cardMarkID, slot3.megaIndex ~= 0)))

	slot9 = slot8.txtUp:getPositionX()

	if matchLanguage({
		"tw"
	}) then
		slot8.txtUp:x(284)
	end

	if matchLanguage({
		"kr"
	}) then
		slot8.txtUp:x(370)
	end

	bind.extend(slot0, slot8.starList, {
		class = "listview",
		props = {
			data = dataEasy.getStarData(slot6),
			item = bindHelper.self("starItem"),
			onItem = function (slot0, slot1, slot2, slot3)
				slot1:get("icon"):texture(slot3.icon)
			end
		}
	})
	bind.touch(slot0, slot8.btnDetail, {
		methods = {
			ended = functools.partial(slot0.onBtnDetail, slot0, slot8.btnDetail)
		}
	})
end

function slot7.onBtnDetail(slot0, slot1)
	slot3 = slot1:getParent():convertToWorldSpace(cc.p(slot1:xy()))

	gGameUI:stackUI("city.activity.brave_challenge.tip", nil, {
		dispatchNodes = gGameUI.uiRoot:getResourceNode()
	}, {
		pos = cc.p(slot3.x, slot3.y + 50),
		strs = {
			csv.note[125101].fmt,
			csv.note[125102].fmt
		}
	})
end

return slot7
