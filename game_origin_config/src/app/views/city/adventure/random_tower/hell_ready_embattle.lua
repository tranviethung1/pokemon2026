slot0 = cc.load("mvc").ViewBase
slot1 = require("app.views.city.card.embattle.fake_embattle")
slot2 = class("HellRandomTowerReadyEmbattle", slot1)
slot2.RESOURCE_FILENAME = "hell_random_tower_embattle.json"
slot2.RESOURCE_BINDING = clone(rawget(slot1, "RESOURCE_BINDING"))
slot2.RESOURCE_STYLES = {
	full = true
}
slot6.battleCards = bindHelper.self("clientBattleCards")
slot6.arms = bindHelper.self("selectArms")
slot6.sceneType = bindHelper.self("sceneType")
slot6.getCardAttrsEx = bindHelper.self("getCardAttrsEx", true)
slot6.isRefresh = bindHelper.self("isRefresh")
slot5.props = {
	noTeamArm = true
}
slot4.binds = {
	event = "extend",
	class = "buff_arms"
}
slot3.btnGHimg = {
	varname = "btnGHimg"
}
slot6.ended = bindHelper.self("onThemeRuleClick")
slot5.methods = {}
slot4.binds = {
	event = "touch"
}
slot3["themePanel.rule"] = {}
slot5.method = bindHelper.self("onThemeTipClick")
slot4.binds = {
	event = "click"
}
slot3.themeTip = {
	varname = "themeTip"
}
slot6.ended = bindHelper.self("onFightCardRuleClick")
slot5.methods = {}
slot4.binds = {
	event = "touch"
}
slot3["rightPanel.rule"] = {}
slot5.method = bindHelper.self("onFightCardTipClick")
slot4.binds = {
	event = "click"
}
slot3.fightCardTip = {
	varname = "fightCardTip"
}
slot6.ended = bindHelper.self("oneKeyEmbattleBtn")
slot5.methods = {}
slot4.binds = {
	event = "touch"
}
slot3.btnOneKeySet = {
	varname = "btnOneKeySet"
}
slot7.color = ui.COLORS.GLOW.WHITE
slot6.glow = {}
slot5.data = {}
slot4.binds = {
	event = "effect"
}
slot3["btnOneKeySet.textNote"] = {}
slot6.ended = bindHelper.self("onStartGame")
slot5.methods = {}
slot4.binds = {
	event = "touch"
}
slot3.btnStart = {
	varname = "btnStart"
}
slot7 = {
	color = slot8
}
slot8 = ui.COLORS.GLOW.WHITE
slot6.glow = slot7
slot5.data = {}
slot4.binds = {
	event = "effect"
}
slot3["btnStart.textNote"] = {}
slot4, slot5, slot6 = pairs({
	themePanel = "themePanel",
	textTip2 = "textTip2",
	rightPanel = "rightPanel"
})

for slot7, slot8 in slot4, slot5, slot6 do
	slot2.RESOURCE_BINDING[slot7] = slot8
end

function slot2.initParams(slot0, slot1)
	uv2 = "initParams"

	slot2.initParams(slot0, slot1)
	slot0.topuiView:updateTitle(gLanguageCsv.onlineFightEmbattleTitle, "PREPARE A FORMATION")

	if gGameModel.forever_dispatch:getIdlerOrigin("hellRandomTowerClick"):read() ~= gGameModel.hell_random_tower:read("date") then
		userDefault.setForeverLocalKey("hellRandomTowerReady", {})
		userDefault.setForeverLocalKey("hellRandomTowerReadyWeather", 0)
		gGameModel.forever_dispatch:getIdlerOrigin("hellRandomTowerClick"):set(slot2)
	end

	slot0.sortSign = idler.new(true)
	slot3 = gGameModel.role:read("top6_fighting_point")
	slot5 = csv.hell_random_tower.theme[gGameModel.hell_random_tower:read("theme")]
	slot6 = slot5.readyCardNum
	slot8 = {}
	slot9 = {}
	slot10 = 3
	slot11 = slot0.rightPanel

	if csvSize(slot5.fightCardNum) <= 4 then
		slot10 = 2
		slot14[1] = slot11.text1
		slot14[2] = slot11.text2
		slot13, slot14, slot15 = pairs({})

		for slot16, slot17 in slot13, slot14, slot15 do
			slot17:x(slot17:x() + slot11:multiget("item", "text1", "text2", "list1", "list2", "sublist", "rule").item:width())
		end

		slot14[1] = slot11.list1
		slot14[2] = slot11.list2
		slot14[3] = slot11.sublist
		slot13, slot14, slot15 = pairs({})

		for slot16, slot17 in slot13, slot14, slot15 do
			slot17:x(slot17:x() + slot12)
			slot17:width(slot17:width() - slot12)
		end

		slot0.fightCardTip:get("box"):x(slot0.fightCardTip:get("box"):x() + slot12)
	end

	adapt.oneLinePos(slot11.text2, slot11.rule, cc.p(10, 0))

	slot13 = slot12 / 2 * (2 - math.ceil(slot6 / slot10))

	slot11.list1:y(slot11.list1:y() + slot13 * 2)
	slot11.list1:height(slot11.list1:height() - slot13 * 2)

	slot15[1] = slot11.text2
	slot15[2] = slot11.rule
	slot15[3] = slot11.list2
	slot14, slot15, slot16 = pairs({})

	for slot17, slot18 in slot14, slot15, slot16 do
		slot18:y(slot18:y() + slot13 * 2)
	end

	slot0.fightCardTip:get("box"):y(slot0.fightCardTip:get("box"):y() + slot13)
	slot0.rightPanel:y(slot0.rightPanel:y() - (slot13 + slot12 / 2 * (3 - math.ceil(slot7 / slot10))))

	for slot17 = 1, slot6 do
		table.insert(slot8, {})
	end

	slot0.fightCardUnlock = 0

	for slot17 = 1, slot7 do
		if not (slot3 < slot5.fightCardNum[slot17] * 10000) then
			slot0.fightCardUnlock = slot0.fightCardUnlock + 1
		end

		slot21.isLock = slot18
		slot21.fightCard = slot5.fightCardNum[slot17]

		table.insert(slot9, {})
	end

	slot15.list = slot11.list1
	slot15.data = idlereasy.new(slot8)
	slot15.num = slot6
	slot15.baseIdx = slot0.panelNum
	slot15.box = {}
	slot14[1] = {}
	slot15.list = slot11.list2
	slot17 = slot9
	slot15.data = idlereasy.new(slot17)
	slot15.num = slot7
	slot15.baseIdx = slot0.panelNum + slot6
	slot15.box = {}
	slot14[2] = {}
	slot0.readyData = {}
	slot14, slot15, slot16 = ipairs(slot0.readyData)

	for slot17, slot18 in slot14, slot15, slot16 do
		slot23.data = slot18.data
		slot23.columnSize = slot10
		slot23.item = slot11.sublist
		slot23.cell = slot11.item

		function slot23.onCell(slot0, slot1, slot2, slot3)
			uv5 = "performWithDelay"

			performWithDelay(slot5, function ()
				uv0 = "list"
				slot0 = slot0.list
				slot0 = slot0.refreshView

				slot0(slot0)

				uv0 = "refreshView"
				slot1 = slot0
				slot0 = slot0.box(slot1)
				uv1 = "box"
				slot3 = cc.p
				slot5 = slot0.y
				slot1 = slot1:convertToWorldSpace(slot3(slot0.x, slot5))
				slot0.x = slot1.x
				slot2 = slot1.y
				slot0.y = slot2
				uv2 = "list"
				uv3 = "box"
				uv5 = "convertToWorldSpace"
				slot2.box[slot3:getIdx(slot5).k] = slot0
			end, 0)
			slot1:get("add"):hide()
			slot1:get("lock"):hide()
			slot1:get("panel"):onClick(function (slot0)
			end)

			if slot3.isLock then
				slot1:get("lock"):show()
				slot1:get("panel"):onClick(function (slot0)
					uv4 = "gGameUI"

					gGameUI:showTip(gLanguageCsv.hellRandomTowerEmbattle1, slot4.fightCard)
				end)

				return
			end

			if slot3.unitID then
				slot5 = slot0
				slot4 = slot0.getIdx(slot5, slot2).k
				uv5 = "performWithDelay"
				slot5 = slot5:getCardAttrs(slot3.unitID)

				slot1:get("panel"):show()

				slot10.unitId = slot5.unit_id
				slot10.advance = slot5.advance
				slot10.rarity = slot5.rarity
				slot10.star = slot5.star
				slot11.data = slot5.level
				slot10.levelProps = {}

				function slot10.onNode(slot0)
					uv3 = "alignCenter"

					slot0:alignCenter(slot3:get("panel"):size()):scale(0.9)
				end

				slot9.props = {}

				bind.extend(slot0, slot1:get("panel"), {
					class = "card_icon"
				})
				slot1:get("panel"):onTouch(function (slot0)
					uv1 = "onBattleCardTouch"
					uv3 = "baseIdx"
					uv4 = "onBattleCardTouch"

					slot1:onBattleCardTouch(slot3.baseIdx + slot4, slot0)
				end)

				return
			end

			slot1:get("add"):show()
		end

		slot22.props = {}

		bind.extend(slot0, slot18.list, {
			class = "tableview"
		})
	end
end

function slot2.initBottomList(slot0)
	uv1 = "initBottomList"
	slot4.panelNum = slot0.panelNum
	slot4.readyData = slot0.readyData
	slot4.sortSign = slot0.sortSign

	slot1.initBottomList(slot0, "city.adventure.random_tower.hell_ready_card_list", {})
end

function slot2.initRoundUIPanel(slot0)
	slot6[1] = slot0.textTip2
	slot5[1] = {
		nil,
		"pos",
		"left"
	}
	slot6[1] = slot0.btnStart
	slot5[2] = {
		nil,
		"pos",
		"right"
	}
	slot6[1] = slot0.btnOneKeySet
	slot5[3] = {
		nil,
		"pos",
		"right"
	}

	adapt.centerWithScreen("left", "right", nil, {})

	slot2[1] = slot0.rightDown
	slot2[2] = slot0.btnChallenge

	itertools.invoke({}, "hide")

	slot2[1] = slot0.btnStart
	slot2[2] = slot0.btnOneKeySet

	itertools.invoke({}, "show")
	slot0.themePanel:hide()
	slot0.themeTip:hide()

	slot1 = gGameModel.hell_random_tower:read("theme")
	slot2 = csv.hell_random_tower.theme[slot1]

	if slot1 > 1 and slot2 then
		slot0.themePanel:show()
		slot0.themeTip:get("box"):removeAllChildren()

		slot4 = slot2.desc
		slot5 = slot2.name

		if csvSize(slot2.validRarity) > 0 then
			slot6 = {}
			slot7 = {}
			slot8, slot9, slot10 = orderCsvPairs(slot2.validRarity)

			for slot11, slot12 in slot8, slot9, slot10 do
				table.insert(slot6, string.format("#I%s-0.6#", ui.RARITY_ICON[slot12]))
				table.insert(slot7, string.format("#I%s-0.8#", ui.RARITY_ICON[slot12]))
			end

			slot4 = string.format(slot4, table.concat(slot6))
			slot5 = table.concat(slot7, " ")
		elseif slot2.actionPoint > 0 then
			slot4 = string.format(slot4, slot2.actionPoint)
		end

		slot7 = rich.createWithWidth(string.format("#L10##C0x5B545B#%s\n#F15# #F40#\n%s", slot2.name, slot4), 40, nil, slot3:width() - 80):anchorPoint(0, 1):addTo(slot3, 888)

		slot3:height(slot7:height() + 100)
		slot7:xy(40, slot3:height() - 40)
		slot0.themePanel:removeChildByName("name")
		rich.createByStr(string.format("#L10##C0x5B545B#%s", slot5), 40):anchorPoint(0, 1):xy(74, 80):addTo(slot0.themePanel, 10, "name")
	end

	slot0.fightCardTip:hide()

	slot4 = slot0.fightCardTip:get("box")

	slot4:removeAllChildren()

	slot6 = rich.createWithWidth(string.format(gLanguageCsv.hellRandomTowerEmbattle2, gGameModel.role:read("top6_fighting_point"), slot0.fightCardUnlock), 40, nil, slot4:width() - 80):anchorPoint(0, 1):addTo(slot4, 888)

	slot4:height(slot6:height() + 100)
	slot6:xy(40, slot4:height() - 40)
end

function slot2.onThemeRuleClick(slot0)
	slot0.themeTip:show()
end

function slot2.onThemeTipClick(slot0)
	slot0.themeTip:hide()
end

function slot2.onFightCardRuleClick(slot0)
	slot0.fightCardTip:show()
end

function slot2.onFightCardTipClick(slot0)
	slot0.fightCardTip:hide()
end

function slot2.getOneKeyCardDatas(slot0)
	slot1 = {}
	slot2, slot3, slot4 = slot0.allCardDatas:pairs()

	for slot5, slot6 in slot2, slot3, slot4 do
		table.insert(slot1, slot6:read())
	end

	table.sort(slot1, function (slot0, slot1)
		if slot0.rarity ~= slot1.rarity then
			return slot1.rarity < slot0.rarity
		end

		if slot0.star ~= slot1.star then
			return slot1.star < slot0.star
		end

		if slot0.card_id ~= slot1.card_id then
			return slot0.card_id < slot1.card_id
		end

		if slot0.skin_id ~= slot1.skin_id then
			return slot1.skin_id < slot0.skin_id
		end

		return slot0.csvID < slot1.csvID
	end)

	slot2 = {}
	slot3 = {}
	slot4 = {}
	slot5, slot6, slot7 = ipairs(slot0.readyData)

	for slot8, slot9 in slot5, slot6, slot7 do
		slot9.onekeyDatas = {}
	end

	function slot5(slot0)
		uv2 = "ipairs"
		slot1, slot2, slot3 = ipairs(slot2.readyData)

		for slot4, slot5 in slot1, slot2, slot3 do
			if #slot5.onekeyDatas + 1 <= slot5.num then
				if not slot5.data:read()[slot6].isLock then
					table.insert(slot5.onekeyDatas, slot0)

					return
				end
			end
		end
	end

	slot6, slot7, slot8 = ipairs(slot1)

	for slot9, slot10 in slot6, slot7, slot8 do
		if not slot2[csv.cards[slot0:getCardAttr(slot0:getKey(slot10), "card_id")].cardMarkID] then
			if #slot4 < slot0.embattleMax then
				table.insert(slot4, slot11)
			else
				slot5(slot11)
			end
		elseif not slot3[slot12] then
			slot5(slot11)
		end

		slot2[slot13.cardMarkID] = true
		slot3[slot12] = true
	end

	return slot4
end

function slot2.onSave(slot0)
	slot2, slot3, slot4 = ipairs(slot0.readyData)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7, slot8, slot9 = slot6.data:pairs()

		for slot10, slot11 in slot7, slot8, slot9 do
			if slot11.unitID then
				slot1[slot5][slot10] = slot11.unitID
			end
		end
	end

	slot2.clientBattleCards = table.deepcopy(slot0.clientBattleCards:read(), true)
	slot2.readyData = {
		[slot5] = {}
	}

	userDefault.setForeverLocalKey("hellRandomTowerReady", {}, {
		new = true
	})
	userDefault.setForeverLocalKey("hellRandomTowerReadyWeather", slot0.selectWeatherID:read(), {
		new = true
	})
end

function slot2.onStartGame(slot0)
	slot2 = {}
	slot3 = {
		[slot9.csvID] = slot9.skin_id
	}
	slot4, slot5, slot6 = slot0.clientBattleCards:pairs()

	for slot7, slot8 in slot4, slot5, slot6 do
		if slot0:getCardAttrs(slot8).skin_id > 0 then
			-- Nothing
		end
	end

	if itertools.size({
		[slot7] = slot9.csvID
	}) < 1 then
		gGameUI:showTip(gLanguageCsv.battleCardCountLimit)

		return
	end

	slot6.content = gLanguageCsv.hellRandomTowerEmbattle3

	function slot6.cb()
		uv0 = "onSave"
		slot1 = slot0

		slot0.onSave(slot1)

		uv1 = "onSave"
		slot0, slot1, slot2 = ipairs(slot1.readyData)

		for slot3, slot4 in slot0, slot1, slot2 do
			slot5, slot6, slot7 = slot4.data:pairs()

			for slot8, slot9 in slot5, slot6, slot7 do
				if slot9.unitID then
					uv10 = "onSave"
					slot11 = slot10
					slot10 = slot10.getCardAttrs(slot11, slot9.unitID)
					uv11 = "ipairs"
					uv13 = "onSave"
					slot11[slot4.baseIdx + slot8 - slot13.panelNum] = slot10.csvID

					if slot10.skin_id > 0 then
						uv11 = "readyData"
						slot11[slot10.csvID] = slot10.skin_id
					end
				end
			end
		end

		slot2 = "/game/hell_random_tower/prepare_deploy"
		uv2 = "data"
		uv3 = "ipairs"
		uv4 = "readyData"
		uv6 = "onSave"
		slot5.weather = slot6.selectWeatherID:read()

		gGameApp:requestServerCustom(slot2):params(slot2, slot3, slot4, {}):doit(function (slot0)
			uv1 = "addCallbackOnExit"
			slot1 = slot1.addCallbackOnExit
			uv3 = "addCallbackOnExit"

			slot1(slot1, slot3.params.startGameCb, true)

			uv1 = "addCallbackOnExit"

			slot1:onClose()
		end)
	end

	gGameUI:showDialog({
		isRich = true,
		clearFast = true,
		btnType = 2,
		align = "right"
	})
end

function slot2.oneKeyEmbattleBtn(slot0)
	slot1, slot2, slot3 = ipairs(slot0.readyData)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6, slot7, slot8 = slot5.data:pairs()

		for slot9, slot10 in slot6, slot7, slot8 do
			if slot10.unitID then
				slot0:getCardAttrs(slot10.unitID).battle = 0
			end
		end
	end

	uv1 = "ipairs"

	slot1.oneKeyEmbattleBtn(slot0)

	slot1, slot2, slot3 = ipairs(slot0.readyData)

	for slot4, slot5 in slot1, slot2, slot3 do
		for slot9 = 1, slot5.num do
			slot5.data:proxy()[slot9].unitID = slot5.onekeyDatas[slot9]
		end
	end
end

function slot2.initHeroSprite(slot0)
	uv1 = "initHeroSprite"

	slot1.initHeroSprite(slot0)

	slot1 = {}
	slot2, slot3, slot4 = ipairs(slot0.readyData)

	for slot5, slot6 in slot2, slot3, slot4 do
		table.insert(slot1, slot6.data)
	end

	idlereasy.any(slot1, function (slot0, ...)
		slot2[MULTRES] = ...
		slot1, slot2, slot3 = ipairs({})

		for slot4, slot5 in slot1, slot2, slot3 do
			slot6, slot7, slot8 = pairs(slot5)

			for slot9, slot10 in slot6, slot7, slot8 do
				uv11 = "ipairs"

				if slot11:getCardAttrs(slot10.unitID) then
					uv11 = "ipairs"
					slot12 = slot11
					uv12 = "ipairs"
					uv14 = "ipairs"
					slot11.getCardAttrs(slot12, slot10.unitID).battle = slot12:getBattle(slot9 + slot14.readyData[slot4].baseIdx)
				end
			end
		end

		uv1 = "ipairs"

		slot1.sortSign:notify()
	end)
end

function slot2.createMovePanel(slot0, slot1)
	uv2 = "createMovePanel"
	slot2 = slot2.createMovePanel(slot0, slot1)
	slot8.unitId = slot1.unit_id
	slot8.advance = slot1.advance
	slot8.rarity = slot1.rarity
	slot8.star = slot1.star
	slot9.data = slot1.level
	slot8.levelProps = {}

	function slot8.onNode(slot0)
		uv3 = "alignCenter"

		slot0:alignCenter(slot3:size())
	end

	slot7.props = {}

	bind.extend(slot0, ccui.Layout:create():alignCenter(slot2:size()):scale(0.9):addTo(slot2, 1, "cardPanel"), {
		class = "card_icon"
	})
	nodetools.invoke(slot0.movePanel, {
		"imgBg",
		"icon",
		"cardPanel"
	}, "hide")

	return slot2
end

function slot2.moveMovePanel(slot0, slot1)
	if slot0.movePanel then
		slot0.movePanel:xy(slot1)
		slot0.selectIndex:set(slot0:whichEmbattleTargetPos(slot1))

		if slot1.x >= 2000 + display.uiOrigin.x then
			nodetools.invoke(slot0.movePanel, {
				"imgBg",
				"icon"
			}, "hide")
			nodetools.invoke(slot0.movePanel, {
				"cardPanel"
			}, "show")
		else
			nodetools.invoke(slot0.movePanel, {
				"imgBg",
				"icon"
			}, "show")
			nodetools.invoke(slot0.movePanel, {
				"cardPanel"
			}, "hide")
		end
	end
end

function slot2.canBattleDown(slot0)
	return true
end

function slot2.canBattleUp(slot0)
	return slot0:getIdxByDbId() ~= nil
end

function slot2.hasSameCardID(slot0, slot1)
	if not slot1 then
		return false
	end

	for slot5 = 1, slot0.panelNum do
		if slot0.clientBattleCards:read()[slot5] then
			if slot0:getCardAttrs(slot6).card_id == slot1.card_id then
				return slot5
			end
		end
	end

	slot2, slot3, slot4 = ipairs(slot0.readyData)

	for slot5, slot6 in slot2, slot3, slot4 do
		for slot10 = 1, slot6.num do
			if slot6.data:read()[slot10].card_id == slot1.card_id then
				return slot6.baseIdx + slot10
			end
		end
	end

	return false
end

function slot2.onCardClick(slot0, slot1, slot2)
	slot3 = nil

	if slot0:getIdxByDbId(slot0:getKey(slot1)) then
		if slot0:canBattleDown(slot1) then
			slot0:downBattle(slot4)

			slot3 = gLanguageCsv.downToEmbattle
		else
			slot3 = gLanguageCsv.battleCannotEmpty
		end
	else
		slot7 = slot0:getIdxByDbId(nil, true)
		slot8, slot9 = slot0:getKeyByIdx(slot0:getIdxByDbId())

		if not slot0:canBattleUp() or slot9 then
			slot3 = gLanguageCsv.battleCardCountEnough
		elseif slot6 <= slot0.panelNum then
			if slot0:hasSameMarkIDCard(slot1) then
				slot3 = gLanguageCsv.alreadyHaveSameSprite

				if slot7 then
					if not slot0:hasSameCardID(slot1) then
						slot0:upBattle(slot4, slot7)

						slot3 = gLanguageCsv.addToEmbattle
					end
				end
			else
				slot0:upBattle(slot4, slot6)

				slot3 = gLanguageCsv.addToEmbattle
			end
		elseif slot0:hasSameCardID(slot1) then
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

function slot2.checkSameMarkID(slot0, slot1)
	slot2 = {}

	for slot6 = 1, slot0.panelNum do
		if not slot1[slot6] then
			slot7 = slot0:getKeyByIdx(slot6)
		end

		if slot0:getCardAttrs(slot7) then
			if slot2[slot8.markId] then
				return true
			end

			slot2[slot8.markId] = true
		end
	end
end

function slot2.checkSameCardID(slot0, slot1)
	slot2 = {}

	for slot6 = 1, slot0.panelNum do
		if not slot1[slot6] then
			slot7 = slot0:getKeyByIdx(slot6)
		end

		if slot0:getCardAttrs(slot7) then
			if slot2[slot8.card_id] then
				return true
			end

			slot2[slot8.card_id] = true
		end
	end

	slot3, slot4, slot5 = ipairs(slot0.readyData)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8, slot9, slot10 = slot7.data:pairs()

		for slot11, slot12 in slot8, slot9, slot10 do
			if slot0:getCardAttrs(slot1[slot7.baseIdx + slot11] or slot12.unitID) then
				if slot2[slot14.card_id] then
					return true
				end

				slot2[slot14.card_id] = true
			end
		end
	end
end

function slot2.onCardMove(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot6 = slot0:getIdxByDbId(slot0:getKey(slot1))

	if slot2 then
		slot7, slot8 = slot0:getKeyByIdx(slot2)

		if not slot8 then
			if slot6 then
				-- Nothing
			end

			if slot0:checkSameMarkID({
				[slot2] = slot5,
				[slot6] = slot7 or 0
			}) then
				slot4 = gLanguageCsv.alreadyHaveSameSprite
			elseif slot0:checkSameCardID(slot9) then
				slot4 = gLanguageCsv.alreadyHaveSameSprite
			else
				slot0:downBattle(slot5)
				slot0:downBattle(slot7)
				slot0:upBattle(slot7, slot6)
				slot0:upBattle(slot5, slot2)

				if not slot6 then
					slot4 = gLanguageCsv.addToEmbattle
				end
			end
		end
	end

	if slot3 and slot4 then
		gGameUI:showTip(slot4)
	end
end

function slot2.onBattleCardTouch(slot0, slot1, slot2)
	if not slot0:getKeyByIdx(slot1) then
		return
	end

	if slot2.name == "began" then
		slot0:createMovePanel(slot0:getCardAttrs(slot3))
		slot0:moveMovePanel(slot2)
		slot0.selectIndex:set(slot1)

		if slot1 <= slot0.panelNum then
			slot0.heroSprite[slot1].sprite:hide()
		end

		slot0.movePanel:xy(slot2.x, slot2.y)
	elseif slot2.name == "moved" then
		slot0:moveMovePanel(slot2)
	elseif slot2.name ~= "ended" then
		if slot2.name == "cancelled" then
			if slot1 <= slot0.panelNum then
				slot0.heroSprite[slot1].sprite:show()
			end

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
end

function slot2.downBattle(slot0, slot1)
	slot0:upBattle(nil, slot0:getIdxByDbId(slot1))
end

function slot2.upBattle(slot0, slot1, slot2)
	if not slot2 then
		return
	end

	if slot0:getKeyByIdx(slot2) then
		slot0:getCardAttrs(slot3).battle = 0
	end

	if slot2 <= slot0.panelNum then
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
		slot4, slot5, slot6 = ipairs(slot0.readyData)

		for slot7, slot8 in slot4, slot5, slot6 do
			if slot2 - slot8.baseIdx <= slot8.num then
				slot8.data:modify(function (slot0)
					uv1 = "baseIdx"
					uv2 = "unitID"
					slot2 = slot2.baseIdx
					uv2 = "baseIdx"
					slot0[slot1 - slot2].unitID = slot2

					return true, slot0
				end, true)

				return
			end
		end
	end
end

function slot2.whichEmbattleTargetPos(slot0, slot1)
	for slot5 = slot0.panelNum, 1, -1 do
		if cc.rectContainsPoint(slot0.heroSprite[slot5].box, slot1) then
			return slot5
		end
	end

	slot2, slot3, slot4 = ipairs(slot0.readyData)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7, slot8, slot9 = ipairs(slot6.box)

		for slot10, slot11 in slot7, slot8, slot9 do
			if cc.rectContainsPoint(slot11, slot1) then
				return slot6.baseIdx + slot10
			end
		end
	end
end

function slot2.getDataByIdx(slot0, slot1)
	if slot1 <= slot0.panelNum then
		return slot0.clientBattleCards:proxy()[slot1]
	end

	slot2, slot3, slot4 = ipairs(slot0.readyData)

	for slot5, slot6 in slot2, slot3, slot4 do
		if slot1 - slot6.baseIdx <= slot6.num then
			return slot6.data:proxy()[slot1 - slot6.baseIdx]
		end
	end
end

function slot2.getKeyByIdx(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 <= slot0.panelNum then
		return slot0.clientBattleCards:read()[slot1]
	end

	slot2, slot3, slot4 = ipairs(slot0.readyData)

	for slot5, slot6 in slot2, slot3, slot4 do
		if slot1 - slot6.baseIdx <= slot6.num then
			slot7 = slot6.data:read()[slot1 - slot6.baseIdx]

			return slot7.unitID, slot7.isLock
		end
	end
end

function slot2.getIdxByDbId(slot0, slot1, slot2)
	if not slot2 then
		for slot6 = 1, slot0.panelNum do
			if slot0.clientBattleCards:read()[slot6] == slot1 then
				return slot6
			end
		end
	end

	slot3, slot4, slot5 = ipairs(slot0.readyData)

	for slot6, slot7 in slot3, slot4, slot5 do
		for slot11 = 1, slot7.num do
			if slot7.data:read()[slot11].unitID == slot1 then
				return slot7.baseIdx + slot11
			end
		end
	end
end

function slot2.getBattle(slot0, slot1)
	if slot1 and slot1 ~= 0 then
		if slot1 <= slot0.panelNum then
			return math.ceil(slot1 / 6)
		else
			slot3, slot4, slot5 = ipairs(slot0.readyData)

			for slot6, slot7 in slot3, slot4, slot5 do
				if slot1 - slot7.baseIdx <= slot7.num then
					return math.ceil(slot0.panelNum / 6) + 1
				end
			end
		end
	else
		return 0
	end
end

function slot2.onClose(slot0)
	slot1 = slot0.onSave

	slot1(slot0)

	uv1 = "onSave"

	slot1.onClose(slot0)
end

function slot2.limtFunc(slot0, slot1)
	slot2 = gGameModel.hell_random_tower:read("theme")
	slot3 = csv.hell_random_tower.theme[slot2]

	if slot2 > 1 and slot3 then
		if csvSize(slot3.validRarity) > 0 then
			slot4 = false
			slot6, slot7, slot8 = orderCsvPairs(slot3.validRarity)

			for slot9, slot10 in slot6, slot7, slot8 do
				if slot10 == csv.unit[slot1.unit_id].rarity then
					slot4 = true

					break
				end
			end

			if not slot4 then
				return nil
			end
		end
	end

	uv4 = "gGameModel"

	return slot4.limtFunc(slot0, slot1)
end

return slot2
