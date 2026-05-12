slot0 = require("app.views.topui.config")
slot2 = class("TopuiBattleBetView", require("app.views.topui.base"))
slot2.RESOURCE_FILENAME = "topui_battlebet.json"
slot2.RESOURCE_BINDING = maptools.extend({
	slot0.title,
	slot0.gold,
	slot0.diamond,
	slot0.battlebet
})

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, {
		"title"
	}, slot1)
	idlereasy.when(dataEasy.getListenNumByKey("yycoin"), function (slot0, slot1)
		uv2 = "yyCoinNum"

		slot2.yyCoinNum:text(mathEasy.getShortNumber(slot1, 2))
	end)

	if slot1.notShow then
		slot0.goldPanel:hide()
		slot0.diamondPanel:hide()
	end

	slot0.activityId = slot1.activityId

	slot0.yyCoinIcon:texture(dataEasy.getIconResByKey("yycoin"))
end

function slot2.onBattlebetCoinClick(slot0)
	if gGameUI:goBackInStackUI("city.activity.yy_bet.prompt_box") or gGameUI:goBackInStackUI("city.activity.contest_bet.prompt_box") then
		return
	end

	if csv.yunying.yyhuodong[slot0.activityId].type == game.YYHUODONG_TYPE_ENUM_TABLE.yyBet then
		gGameUI:stackUI("city.activity.yy_bet.prompt_box", nil, , slot0.activityId)
	elseif slot1.type == game.YYHUODONG_TYPE_ENUM_TABLE.contestBet then
		gGameUI:stackUI("city.activity.contest_bet.prompt_box", nil, , slot0.activityId)
	end
end

return slot2
