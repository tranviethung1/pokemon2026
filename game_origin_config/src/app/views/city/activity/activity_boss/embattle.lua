slot0 = cc.load("mvc").ViewBase
slot1 = require("app.views.city.card.embattle.base")
slot2 = class("CardEmbattleActivityBossView", slot1)
slot2.RESOURCE_FILENAME = "card_embattle.json"
slot2.RESOURCE_BINDING = clone(rawget(slot1, "RESOURCE_BINDING"))
slot2.RESOURCE_BINDING.btnGHimg = {
	varname = "btnGHimg",
	binds = {
		event = "extend",
		class = "buff_arms",
		props = {
			redHintTag = "activityBossArmsTag",
			battleCards = bindHelper.self("clientBattleCards"),
			arms = bindHelper.self("selectArms"),
			sceneType = bindHelper.self("sceneType"),
			getCardAttrsEx = bindHelper.self("getCardAttrsEx", true),
			isRefresh = bindHelper.self("isRefresh")
		}
	}
}

function slot2.onClose(slot0, slot1)
	if slot0.from == game.EMBATTLE_FROM_TABLE.huodongBoss then
		for slot7, slot8 in pairs(slot0.clientBattleCards:read()) do
			-- Nothing
		end

		userDefault.setForeverLocalKey("huodongboss_emabttle", {
			[slot7] = stringz.bintohex(slot8)
		}, {
			new = true
		})
		userDefault.setForeverLocalKey("huodongboss_emabttle_weather", slot0.selectWeatherID:read(), {
			new = true
		})

		slot6 = userDefault.setForeverLocalKey

		slot6("huodongboss_emabttle_arms", table.deepcopy(slot0.selectArms:read(), true), {
			new = true
		})

		uv6 = "from"

		slot6.onClose(slot0)
	else
		uv2 = "from"

		slot2.onClose(slot0)
	end
end

return slot2
