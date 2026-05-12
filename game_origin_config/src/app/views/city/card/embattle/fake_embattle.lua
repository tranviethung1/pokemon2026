slot0 = cc.load("mvc").ViewBase
slot1 = require("app.views.city.card.embattle.base")
slot2 = class("FakeCardEmbattleView", slot1)
slot3 = require("app.views.city.zawake.tools")
slot4 = {
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
slot5 = {
	2,
	4,
	6,
	1,
	3,
	5
}
slot6 = {
	[game.EMBATTLE_FROM_TABLE.default] = {
		initModelFunc = function (slot0)
			return idlertable.new({})
		end,
		getSendRequest = function (slot0)
			if slot0.clientBattleCards:size() == 0 then
				return
			end
		end,
		getWeatherID = function (slot0)
			return (gGameModel.role:read("battle_extra") or {}).weather or 0
		end,
		getArmsData = function (slot0)
			return table.deepcopy((gGameModel.role:read("battle_extra") or {}).arms or {}, true)
		end
	},
	[game.EMBATTLE_FROM_TABLE.mimicry] = {
		initModelFunc = function (slot0)
			return idlertable.new(gGameModel.mimicry:read("battle_cards")[slot0.bossID] or {})
		end,
		getWeatherID = function (slot0)
			return userDefault.getForeverLocalKey("mimicry_weather", 0)
		end,
		getArmsData = function (slot0)
			return nil
		end
	}
}

function slot7(slot0, slot1, ...)
	uv2 = "from"
	slot3 = slot0.from
	uv3 = "from"

	return slot2[slot3][slot1] or slot3[game.EMBATTLE_FROM_TABLE.default][slot1](slot0, ...)
end

slot2.RESOURCE_FILENAME = "card_embattle.json"
slot2.RESOURCE_BINDING = clone(rawget(slot1, "RESOURCE_BINDING"))

function slot2.onCreate(slot0, slot1)
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
	slot0:initHeroSprite()
	slot0:initBottomList()
	slot0:initRoundUIPanel()
	slot0:initBattleChange()

	if slot0.startCb and slot0:startCb() then
		slot0.clientBattleCards:set(slot2)
	end
end

function slot2.initBottomList(slot0)
	slot0.cardListView = gGameUI:createView("city.adventure.mimicry.fake_card_list", slot0.bottomPanel):init({
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

function slot2.getCardAttr(slot0, slot1, slot2)
	return slot0.allCardDatas:atproxy(slot1)[slot2]
end

function slot2.initModel(slot0)
	slot0.cards = gGameModel.role:getIdler("cards")
	slot1 = idlers.new({})
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
	slot0.selectArms = idlereasy.new(slot0.selectArms)
	slot0.isRefresh = idler.new(true)
end

function slot2.initRoundUIPanel(slot0)
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
			slot0.rightDown,
			"pos",
			"right"
		}
	})

	slot1 = slot0.fightCb and true or false

	slot0.fightNote:hide()
	slot0.btnJump:hide()
	slot0.rightDown:visible(not slot1)
	slot0.btnChallenge:visible(slot1)
end

function slot2.getKey(slot0, slot1)
	if not slot1 then
		return nil
	end

	return slot1.unit_id
end

function slot2.getCardAttrs(slot0, slot1)
	return slot0.allCardDatas:atproxy(slot1)
end

function slot2.fightBtn(slot0)
	if not next(slot0.clientBattleCards:read()) then
		gGameUI:showTip(gLanguageCsv.noSpriteAvailable)

		return
	end

	for slot6, slot7 in pairs(slot1) do
		-- Nothing
	end

	slot0:fightCb({
		[slot6] = slot0:getCardAttrs(slot7)
	})
end

function slot2.getTeamWeatherLocal(slot0, slot1, slot2)
	if not dataEasy.isUnlock(gUnlockCsv.weather) then
		return {}
	end

	for slot7 = 1, 6 do
		if slot0:getCardAttrs(slot1[slot7]) then
			slot11 = csv.unit[slot8.unit_id]
		end
	end

	return dataEasy.getTeamWeather(nil, slot2, {
		cardsData = {
			[slot7] = {
				cardID = slot8.card_id,
				unitID = slot10,
				attr1 = slot11.natureType,
				attr2 = slot11.natureType2,
				star = slot8.star,
				advance = slot8.advance,
				level = slot8.level
			}
		}
	})
end

function slot2.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

function slot2.onTeamWeatherClick(slot0)
	gGameUI:stackUI("city.weather.weather_select", nil, , {
		cardsData = slot0:getTeamWeatherLocal(slot0.clientBattleCards:read(), true),
		weatherID = slot0.selectWeatherID
	})
end

function slot2.refreshTeamWeather(slot0, slot1)
	dataEasy.getListenUnlock(gUnlockCsv.weather, function (slot0)
		uv1 = "getTeamWeatherLocal"
		uv3 = "dataEasy"
		slot3 = nil
		uv4 = "getTeamWeatherLocal"
		uv3 = "getTeamWeatherLocal"

		slot3.selectWeatherID:set(dataEasy.getWeatherID(slot3, slot4.selectWeatherID:read(), {
			result = slot1:getTeamWeatherLocal(slot3)
		}))
	end):anonyOnly(slot0)
end

function slot2.limtFunc(slot0, slot1)
	slot2 = csv.cards[slot1.card_id]
	slot3 = csv.unit[slot1.unit_id]

	return {
		getTime = 0,
		fighting_point = 0,
		card_id = slot1.card_id,
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

return slot2
