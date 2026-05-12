slot0 = require("app.views.city.activity.yy_bet.prompt_box")
slot1 = class("PromptBox", slot0)
slot1.RESOURCE_FILENAME = rawget(slot0, "RESOURCE_FILENAME")
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))

function slot1.initTools(slot0)
	slot0.tools = require("app.views.city.activity.contest_bet.tools")
end

function slot1.initTipCsv(slot0)
	slot0.buyTips = gLanguageCsv.contestBetExchangeRmb
end

return slot1
