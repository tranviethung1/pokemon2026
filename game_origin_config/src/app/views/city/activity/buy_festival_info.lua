slot0 = 30
slot1 = cc.load("mvc").ViewBase
slot2 = class("BuyFestivalInfoView", Dialog)
slot2.RESOURCE_FILENAME = "common_send_text.json"
slot2.RESOURCE_BINDING = {
	["buyBtn.text"] = "panelText",
	input = "input",
	num3 = "num3",
	title = "title",
	num2 = "num2",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	buyBtn = {
		varname = "buyBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuyItem")
			}
		}
	}
}

function slot2.initModel(slot0)
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.sendredPacket = gGameModel.daily_record:getIdler("huodong_redPacket_send")

	if slot0.activity.type == game.YYHUODONG_TYPE_ENUM_TABLE.huodongCrossRedPacket then
		slot0.sendredPacket = gGameModel.daily_record:getIdler("huodong_cross_redPacket_send")
	end
end

function slot2.onCreate(slot0, slot1, slot2)
	slot0.cb = slot2
	slot3 = csv.yunying.yyhuodong[slot1]
	slot0.activity = slot3

	slot0:initModel()

	if not slot3 then
		return false
	end

	slot0.num2:text("x" .. slot3.paramMap.totalCount)
	slot0.num3:text(slot3.paramMap.totalVal)
	blacklist:addListener(slot0.input, "*", functools.partial(slot0.nameAdapt, slot0))
	slot0.panelText:text(gLanguageCsv.commonTextOk)
	Dialog.onCreate(slot0)
end

function slot2.nameAdapt(slot0, slot1)
	uv6 = "input"

	slot0.input:text(string.utf8limit(slot1 or slot0.input:text(), slot6, true))
end

function slot2.onBuyItem(slot0)
	slot0:nameAdapt()

	if slot0.sendredPacket:read() == gVipCsv[slot0.vipLevel:read()].huodongRedPacketSend then
		gGameUI:showTip(gLanguageCsv.redPacketSendLimit)

		return false
	end

	slot2 = nil
	slot2 = (string.len(slot0.input:text()) < 1 or slot0.input:text() == gLanguageCsv.festival or slot0.input:text()) and gLanguageCsv.festival
	slot3 = "/game/yy/red/packet/send"

	if slot0.activity.type == game.YYHUODONG_TYPE_ENUM_TABLE.huodongCrossRedPacket then
		slot3 = "/game/yy/cross/red/packet/send"
	end

	gGameApp:requestServer(slot3, function (slot0)
		uv1 = "addCallbackOnExit"
		slot2 = slot1
		slot1 = slot1.addCallbackOnExit
		uv3 = "addCallbackOnExit"

		slot1(slot2, slot3.cb)

		uv1 = "cb"
		uv2 = "addCallbackOnExit"

		slot1.onClose(slot2)
	end, slot2)
end

return slot2
