slot0 = require("app.views.city.card.embattle.base")
slot1 = class("CardEmbattleCloneView", slot0)
slot1.RESOURCE_FILENAME = "card_embattle.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))
slot1.RESOURCE_BINDING.btnGHimg = {
	varname = "btnGHimg",
	binds = {
		event = "extend",
		class = "buff_arms",
		props = {
			redHintTag = "cloneBattleArms",
			battleCards = bindHelper.self("clientBattleCards"),
			arms = bindHelper.self("selectArms"),
			sceneType = bindHelper.self("sceneType"),
			getCardAttrsEx = bindHelper.self("getCardAttrsEx", true),
			isRefresh = bindHelper.self("isRefresh")
		}
	}
}

function slot1.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, slot1)
	slot0.fightNote:hide()
	slot0.cardListView:hide()
	slot0.rightDown:hide()
	slot0.bottomMask:show()

	slot0.originWeatherID = nil

	slot0.selectWeatherID:set(nil)
	slot0.selectArms:set(nil)
end

function slot1.initRoundUIPanel(slot0)
	slot0.btnChallenge:visible(true)
	slot0.rightDown:visible(false)
	slot0.btnJump:visible(false)
end

function slot1.initParams(slot0, slot1)
	slot1 = slot1 or {}
	slot0.sceneType = game.SCENE_TYPE.clone
	slot0.fightCb = slot1.fightCb
	slot0.from = game.EMBATTLE_FROM_TABLE.input
	slot0.inputCardAttrs = slot1.inputCardAttrs
	slot0.inputCards = slot1.inputCards
	slot0.checkBattleArr = slot1.checkBattleArr or function ()
		return true
	end
end

function slot1.showItemFightPoint(slot0, slot1, slot2, slot3)
	slot1:show()
	slot1:get("text"):text(slot0:getCardAttr(slot3, "fighting_point"))
	slot1:get("bg"):size(slot1:get("text"):size().width + 80, slot1:get("bg"):size().height)
	slot1:y(slot2.everyPos.headPos.y + 100)
end

function slot1.getCardAttr(slot0, slot1, slot2)
	return slot0.inputCardAttrs:read()[slot1][slot2]
end

function slot1.getCardAttrIdler(slot0, slot1, slot2)
	return slot0.inputCardAttrs:read()[slot1][slot2]
end

function slot1.onCardClick(slot0, slot1, slot2)
end

function slot1.getCardAttrs(slot0, slot1)
	if slot0.inputCardAttrs:read()[slot1] then
		return {
			battle = 1,
			card_id = slot2.card_id,
			dbid = slot2.id,
			unit_id = dataEasy.getUnitId(slot2.card_id, slot2.skin_id)
		}
	end
end

return slot1
