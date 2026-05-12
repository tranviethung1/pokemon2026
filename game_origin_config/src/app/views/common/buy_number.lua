slot0 = cc.load("mvc").ViewBase
slot1 = class("BuyNumberView", Dialog)
slot1.RESOURCE_FILENAME = "card_buy_capacity.json"
slot1.RESOURCE_BINDING = {
	["pricePanel.priceNote"] = "priceNote",
	["content.num"] = "addNum",
	["content.leftTimesInfo"] = "leftTimesInfo",
	["pricePanel.price"] = "priceText",
	content = "content",
	title = "title",
	["content.text1"] = "contentText",
	["content.leftTimes2"] = "leftTimes2",
	["content.leftTimes1"] = "leftTimes1",
	["pricePanel.icon"] = "priceIcon",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("callBackView")
			}
		}
	},
	buyBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuyItem")
			}
		}
	},
	["buyBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.params = slot1
	slot0.cb = slot2
	slot3 = gGameModel.role:read("vip_level")
	slot0.conversionNumMax = slot1.itemType ~= 1 and gVipCsv[slot3].megaItemMaxTimes or gVipCsv[slot3].megaCommonItemMaxTimes

	slot0.title:text(gLanguageCsv.conversionNum)
	slot0.leftTimesInfo:text(gLanguageCsv.surplusTitle)
	slot0.contentText:text(gLanguageCsv.hintConversionNumber)

	slot0.conversionChanceMax = slot0.params.itemType ~= 1 and gCommonConfigCsv.megaBuyChanceLimit or gCommonConfigCsv.megaCommonBuyChanceLimit

	slot0.leftTimes2:text("/" .. slot0.conversionChanceMax)

	slot0.conversionBuyAddTimes = slot0.params.itemType ~= 1 and gCommonConfigCsv.megaBuyAddTimes or gCommonConfigCsv.megaCommonBuyAddTimes

	slot0.addNum:text("+" .. slot0.conversionBuyAddTimes)

	if slot1.icon then
		slot0.priceIcon:texture(slot1.icon)
	end

	slot0:conversionUpdata()
	Dialog.onCreate(slot0, {
		blackType = 2,
		clickClose = false
	})
end

function slot1.dataJudge(slot0)
	slot2 = gGameModel.daily_record:read("mega_convert_buy_times") and slot1[slot0.params.id] or 0
	slot3 = slot0.params.itemType ~= 1 and "mega_item_convert_cost" or "mega_commonitem_convert_cost"

	return gCostCsv[slot3][math.min(slot2 + 1, csvSize(gCostCsv[slot3]))], slot2
end

function slot1.conversionUpdata(slot0)
	slot1, slot2 = slot0:dataJudge()

	slot0.priceText:text(slot1)
	text.addEffect(slot0.priceText, {
		color = slot1 <= gGameModel.role:read("rmb") and ui.COLORS.QUALITY_OUTLINE[1] or ui.COLORS.NORMAL.ALERT_ORANGE
	})
	slot0.leftTimes1:text(slot0.conversionChanceMax - slot2)
	slot0.leftTimes2:x(slot0.leftTimes1:x() + slot0.leftTimes1:width())
	text.addEffect(slot0.leftTimes1, {
		color = slot2 <= slot0.conversionChanceMax and ui.COLORS.QUALITY_OUTLINE[1] or ui.COLORS.NORMAL.ALERT_ORANGE
	})
	adapt.oneLineCenterPos(cc.p(200, 0), {
		slot0.priceNote,
		slot0.priceText,
		slot0.priceIcon
	}, cc.p(8, 0))
	adapt.oneLineCenterPos(cc.p(800, 260), {
		slot0.leftTimesInfo,
		slot0.leftTimes1,
		slot0.leftTimes2
	}, cc.p(8, 0))
end

function slot1.onBuyItem(slot0)
	slot1, slot2 = slot0:dataJudge()

	if slot0.conversionChanceMax <= slot2 then
		gGameUI:showTip(gLanguageCsv.purchaseLimit)

		return
	end

	if gGameModel.role:read("rmb") < slot1 then
		gGameUI:showTip(gLanguageCsv.rmbNotEnough)

		return
	end

	if slot0.conversionNumMax < (gGameModel.role:read("mega_convert_times") and slot4[slot0.params.id] or 0) + slot0.conversionBuyAddTimes then
		gGameUI:showTip(gLanguageCsv.megaConvertTimesLimit)

		return
	end

	dataEasy.sureUsingDiamonds(function ()
		uv4 = "gGameApp"

		gGameApp:requestServer("/game/develop/mega/convert/buy", function (slot0)
			slot1 = gGameUI
			slot1 = slot1.showTip

			slot1(slot1, gLanguageCsv.hasBuy)

			uv1 = "gGameUI"

			slot1:conversionUpdata()
		end, slot4.params.id)
	end, slot1)
end

function slot1.callBackView(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
