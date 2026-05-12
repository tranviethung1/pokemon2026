slot0 = require("app.views.city.activity.yy_bet.battle_array")
slot1 = class("ContestBetBattleArray", slot0)
slot1.RESOURCE_FILENAME = rawget(slot0, "RESOURCE_FILENAME")
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))

function slot1.initTools(slot0)
	slot0.tools = require("app.views.city.activity.contest_bet.tools")
end

return slot1
