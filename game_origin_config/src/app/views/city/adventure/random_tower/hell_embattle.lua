slot0 = cc.load("mvc").ViewBase
slot1 = require("app.views.city.card.embattle.fake_embattle")
slot2 = class("HellRandomTowerEmbattle", slot1)
slot2.RESOURCE_FILENAME = "card_embattle.json"
slot2.RESOURCE_BINDING = clone(rawget(slot1, "RESOURCE_BINDING"))
slot2.RESOURCE_BINDING.btnGHimg = {
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
}
slot2.RESOURCE_STYLES = {
	full = true
}

function slot2.initBottomList(slot0)
	uv1 = "initBottomList"

	slot1.initBottomList(slot0, "city.adventure.random_tower.hell_card_list")
end

function slot2.getCardStates(slot0)
	return gGameModel.hell_random_tower:read("card_states") or {}
end

function slot2.limtFunc(slot0, slot1)
	uv2 = "limtFunc"
	slot2 = slot2.limtFunc(slot0, slot1)
	slot2.states = slot0:getCardStates()[slot1.csvID] or {
		1,
		0
	}

	return slot2
end

function slot1.getOneKeyCardDatas(slot0)
	slot1 = {}

	for slot5, slot6 in slot0.allCardDatas:pairs() do
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

	for slot8, slot9 in ipairs(slot1) do
		if slot0:embattleBtnFunc(slot2, slot9) then
			slot2[csv.cards[slot0:getCardAttr(slot0:getKey(slot9), "card_id")].cardMarkID] = true

			if 0 + 1 == slot0.embattleMax then
				break
			end
		end
	end

	return {
		[slot4] = slot10
	}
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

function slot2.isChangeBattleCards(slot0)
	slot1 = slot0.battleCardsData:read()

	for slot6, slot7 in slot0.clientBattleCards:pairs() do
		if slot0:getCardAttrs(slot7) then
			-- Nothing
		end
	end

	if not itertools.equal(slot1, {
		[slot6] = slot8.csvID
	}) then
		return true
	end

	return slot0.originWeatherID ~= slot0.selectWeatherID:read() or not itertools.equal(slot0.originArms or {}, table.deepcopy(slot0.selectArms:read(), true) or {})
end

function slot2.onClose(slot0, slot1, slot2)
	if slot1 == true then
		uv6 = "sendRequeat"

		slot0:sendRequeat(functools.partial(slot6.onClose, slot0), true)
	else
		uv3 = "sendRequeat"

		slot3.onClose(slot0)
	end
end

function slot1.fightBtn(slot0)
	if not next(slot0.clientBattleCards:read()) then
		gGameUI:showTip(gLanguageCsv.noSpriteAvailable)

		return
	end

	slot0:sendRequeat(function ()
		uv0 = "fightCb"
		uv1 = "fightCb"

		slot0.fightCb(slot1)
	end)
end

return slot2
