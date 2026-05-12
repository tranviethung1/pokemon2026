slot0 = require("app.views.city.card.embattle.base")
slot1 = class("CardEmbattleHuntingView", slot0)
slot1.RESOURCE_FILENAME = "card_embattle.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))

function slot1.getCardStates(slot0)
	return gGameModel.hunting:read("hunting_route")[slot0.route].card_states or {}
end

function slot1.initBottomList(slot0)
	slot0.cardListView = gGameUI:createView("city.card.embattle.hunting_card_list", slot0.bottomPanel):init({
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

function slot1.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
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

function slot1.embattleBtnFunc(slot0, slot1, slot2)
	uv3 = "embattleBtnFunc"

	if not slot3.embattleBtnFunc(slot0, slot1, slot2) then
		return false
	end

	return (slot0:getCardStates()[slot2.dbid] or {
		1,
		1
	})[1] > 0
end

return slot1
