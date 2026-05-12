slot0 = require("app.views.city.adventure.random_tower.tools")
slot1 = require("app.views.city.card.embattle.base")
slot2 = class("CardEmbattleRandomView", slot1)
slot2.RESOURCE_FILENAME = "card_embattle.json"
slot2.RESOURCE_BINDING = clone(rawget(slot1, "RESOURCE_BINDING"))

function slot2.getFightSumNum(slot0, slot1)
	uv3 = "calcFightingPointFunc"

	for slot7, slot8 in pairs(slot1) do
		slot9 = slot0:getCardAttr(slot8, "fighting_point")
		slot2 = 0 + slot3.calcFightingPointFunc()(slot8)
	end

	return slot2
end

function slot2.getCardStates(slot0)
	return gGameModel.random_tower:read("card_states") or {}
end

function slot2.initBottomList(slot0)
	slot0.cardListView = gGameUI:createView("city.card.embattle.random_card_list", slot0.bottomPanel):init({
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

function slot2.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	if slot5 < 10 then
		return nil
	end

	uv10 = "limtFunc"
	slot10 = slot10.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot10.states = slot0:getCardStates()[slot1] or {
		1,
		0
	}

	return slot10
end

function slot2.embattleBtnFunc(slot0, slot1, slot2)
	uv3 = "embattleBtnFunc"

	if not slot3.embattleBtnFunc(slot0, slot1, slot2) then
		return false
	end

	return (slot0:getCardStates()[slot2.dbid] or {
		1,
		1
	})[1] > 0
end

return slot2
