slot0 = require("app.views.city.card.embattle.base")
slot1 = class("CardEmbattleOnlineFightView", slot0)
slot1.RESOURCE_FILENAME = "card_embattle.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))
slot1.RESOURCE_BINDING.useDefaultBattle = {
	varname = "useDefaultBattle",
	binds = {
		event = "click",
		method = bindHelper.self("onUseDefaultBattle")
	}
}

function slot1.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, slot1)

	if slot1.tip then
		gGameUI:showTip(gLanguageCsv.onlineFightTeamChange)
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

	slot1 = false

	slot0.rightDown:visible(not slot1)
	slot0.btnChallenge:visible(slot1)
	slot0.btnJump:visible(false)
	slot0.useDefaultBattle:visible(not slot1)
	slot0:initDeployment()
end

function slot1.onUseDefaultBattle(slot0)
	gGameApp:requestServer("/game/deployment/sync", function ()
		uv0 = "battleCardsData"

		if slot0 then
			uv0 = "notify"

			slot0.battleCardsData:notify()
		end

		uv1 = "notify"
		slot1 = slot1.selectWeatherID
		slot1 = slot1.set

		slot1(slot1, (gGameModel.cross_online_fight:read("extra") or {}).weather or 0)

		uv1 = "notify"
		slot1 = slot1.selectArms
		slot2 = slot1
		slot1 = slot1.modify

		slot1(slot2, function (slot0)
			uv3 = "table"

			return true, table.deepcopy(slot3.arms or {}, true)
		end, true)

		uv1 = "notify"
		uv2 = "notify"
		slot2 = slot2.selectWeatherID
		slot3 = slot2
		slot1.originWeatherID = slot2.read(slot3)
		uv1 = "notify"
		uv3 = "notify"
		slot1.originArms = table.deepcopy(slot3.selectArms:read(), true)
		uv1 = "notify"

		slot1:setDeploymentFlag()
	end, "cross_online_fight", not slot0.deploymentFlag:read())
end

function slot1.setDeploymentFlag(slot0)
	slot0.deploymentFlag:set(gGameModel.role:read("deployments_sync").cross_online_fight or false)
end

function slot1.initDeployment(slot0)
	slot0.deploymentFlag = idler.new(false)

	idlereasy.when(slot0.deploymentFlag, function (slot0, slot1)
		uv2 = "useDefaultBattle"

		slot2.useDefaultBattle:get("checkBox"):setSelectedState(slot1)
	end)
	idlereasy.when(slot0.clientBattleCards, function (slot0, slot1)
		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			slot8 = gGameModel.cards
			slot9 = slot8
			uv9 = "pairs"

			if slot9:confirmBanCard(slot8.find(slot9, slot7):read("card_id")) then
				slot1[slot6] = nil
				slot2 = true
			end
		end

		if slot2 then
			gGameUI:showTip(gLanguageCsv.onlineFightUseMainTeam)
		end

		uv3 = "pairs"

		slot3.deploymentFlag:set(false)
	end, true)
	idlereasy.any({
		slot0.selectWeatherID,
		slot0.selectArms
	}, function (slot0, slot1)
		uv2 = "deploymentFlag"

		slot2.deploymentFlag:set(false)
	end, true)
	slot0:setDeploymentFlag()
end

function slot1.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	if slot0:confirmBanCard(slot2) then
		return nil
	end

	uv10 = "confirmBanCard"

	return slot10.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
end

function slot1.confirmBanCard(slot0, slot1)
	if gGameModel.cross_online_fight:read("round") == "closed" then
		return false
	end

	slot9 = 0
	slot4 = false
	slot5 = {}

	for slot9, slot10 in csvPairs(csv.cross.online_fight.theme_open) do
		if slot10.day == math.floor((time.getTime() - time.getNumTimestamp(gGameModel.cross_online_fight:read("start_date"), 5, 0, slot9)) / 60 / 60 / 24) + 1 then
			slot5 = slot10

			break
		end
	end

	if itertools.size(slot5.invalidMarkIDs or {}) == 0 and itertools.size(slot5.invalidMegaCardIDs or {}) == 0 then
		return false
	end

	for slot9, slot10 in ipairs(slot5.invalidMarkIDs) do
		if csv.cards[slot1].cardMarkID == slot10 then
			return true
		end
	end

	for slot9, slot10 in ipairs(slot5.invalidMegaCardIDs) do
		if slot1 == slot10 then
			return true
		end
	end

	return false
end

function slot1.oneKeyEmbattleBtn(slot0)
	uv1 = "oneKeyEmbattleBtn"

	slot1.oneKeyEmbattleBtn(slot0)
	slot0.deploymentFlag:set(false)
end

return slot1
