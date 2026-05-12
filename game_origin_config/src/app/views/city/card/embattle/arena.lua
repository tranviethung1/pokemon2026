slot0 = require("app.views.city.card.embattle.base")
slot1 = class("CardEmbattleArenaView", slot0)
slot1.RESOURCE_FILENAME = "card_embattle.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))
slot1.RESOURCE_BINDING.useDefaultBattle = {
	varname = "useDefaultBattle",
	binds = {
		event = "click",
		method = bindHelper.self("onUseDefaultBattle")
	}
}
slot1.RESOURCE_BINDING.btnGHimg = {
	varname = "btnGHimg",
	binds = {
		event = "extend",
		class = "buff_arms",
		props = {
			redHintTag = "arenaArmsTag",
			battleCards = bindHelper.self("clientBattleCards"),
			arms = bindHelper.self("selectArms"),
			sceneType = bindHelper.self("sceneType"),
			getCardAttrsEx = bindHelper.self("getCardAttrsEx", true),
			isRefresh = bindHelper.self("isRefresh")
		}
	}
}

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

	slot1 = slot0.fightCb and true or false

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

		slot1(slot1, (gGameModel.role:read("battle_extra") or {}).weather or 0)

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
	end, slot0.fightCb and "arena_cards" or "arena_defence_cards", not slot0.deploymentFlag:read())
end

function slot1.setDeploymentFlag(slot0)
	slot0.deploymentFlag:set(gGameModel.role:read("deployments_sync")[slot0.fightCb and "arena_cards" or "arena_defence_cards"] or false)
end

function slot1.initDeployment(slot0)
	slot0.deploymentFlag = idler.new(false)

	idlereasy.when(slot0.deploymentFlag, function (slot0, slot1)
		uv2 = "useDefaultBattle"

		slot2.useDefaultBattle:get("checkBox"):setSelectedState(slot1)
	end)
	idlereasy.any({
		slot0.clientBattleCards,
		slot0.selectWeatherID,
		slot0.selectArms
	}, function (slot0, slot1)
		uv2 = "deploymentFlag"

		slot2.deploymentFlag:set(false)
	end, true)
	slot0:setDeploymentFlag()
end

function slot1.oneKeyEmbattleBtn(slot0)
	uv1 = "oneKeyEmbattleBtn"

	slot1.oneKeyEmbattleBtn(slot0)
	slot0.deploymentFlag:set(false)
end

return slot1
