slot0 = class("CardCapacityView", Dialog)
slot0.RESOURCE_FILENAME = "card_buy_capacity.json"
slot0.RESOURCE_BINDING = {
	["pricePanel.priceNote"] = "priceNote",
	["content.leftTimes2"] = "leftTimes2",
	["pricePanel.price"] = "priceText",
	content = "content",
	["content.leftTimesInfo"] = "leftTimesInfo",
	["content.leftTimes1"] = "leftTimes1",
	["pricePanel.icon"] = "priceIcon",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["content.num"] = {
		binds = {
			event = "text",
			data = "+" .. gCommonConfigCsv.cardBagCapacityIncrease
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

function slot0.onCreate(slot0)
	slot0:initModel()

	slot0.price = idler.new(0)

	adapt.oneLineCenterPos(cc.p(775, 400), {
		slot0.Text1,
		slot0.num
	}, cc.p(10, 0))

	slot0.leftTimes = idlereasy.any({
		slot0.vipLevel,
		slot0.nowBuyNum
	}, function (slot0, slot1, slot2)
		uv4 = "gVipCsv"

		if slot4:refreshNumPanel(slot2, gVipCsv[slot1].cardbgBuyNum) == 0 and game.VIP_LIMIT <= slot1 then
			slot4 = -1
		end

		slot5 = gCostCsv.cardbag_buy_cost
		slot7 = slot2 + 1
		uv7 = "gVipCsv"

		slot7.price:set(slot5[math.min(slot7, table.length(slot5))])

		return true, slot4
	end)

	idlereasy.any({
		slot0.price,
		slot0.rmb
	}, function (slot0, slot1, slot2)
		uv3 = "priceText"

		slot3.priceText:text(slot1)

		uv5 = "priceText"

		text.addEffect(slot5.priceText, {
			color = slot2 < slot1 and ui.COLORS.NORMAL.RED or ui.COLORS.NORMAL.DEFAULT
		})

		slot7 = -17
		uv7 = "priceText"
		slot7 = slot7.priceNote
		uv7 = "priceText"
		slot7 = slot7.priceText
		uv7 = "priceText"

		adapt.oneLineCenterPos(cc.p(200, slot7), {
			slot7,
			slot7,
			slot7.priceIcon
		}, cc.p(20, 0))
	end)
	Dialog.onCreate(slot0, {
		clickClose = false
	})
end

function slot0.refreshNumPanel(slot0, slot1, slot2)
	slot3 = slot2 - slot1

	slot0.leftTimes1:text(slot3)
	text.addEffect(slot0.leftTimes1, {
		color = slot3 > 0 and cc.c4b(116, 190, 109, 255) or ui.COLORS.NORMAL.DEFAULT
	})
	slot0.leftTimes2:text("/" .. slot2)
	adapt.oneLineCenterPos(cc.p(slot0.content:width() / 2, slot0.leftTimes2:y()), {
		slot0.leftTimesInfo,
		slot0.leftTimes1,
		slot0.leftTimes2
	}, cc.p(0, 0))

	return slot3
end

function slot0.initModel(slot0)
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.nowBuyNum = gGameModel.role:getIdler("card_capacity_times")
	slot0.cardCapacity = gGameModel.role:getIdler("card_capacity")
end

function slot0.onBuyItem(slot0)
	idlereasy.do_(function (slot0, slot1, slot2, slot3)
		if slot1 == -1 then
			gGameUI:showTip(gLanguageCsv.cardCapacityBuyLimit)
		elseif slot1 == 0 then
			uiEasy.showDialog("vip", {
				titleName = gLanguageCsv.cardCapacityBuy,
				content = {
					gLanguageCsv.cardCapacityBuyMax,
					string.format(gLanguageCsv.commonVipIncrease, gLanguageCsv.buy)
				}
			})
		elseif slot2 < slot3 then
			uiEasy.showDialog("rmb")
		else
			dataEasy.sureUsingDiamonds(function ()
				gGameApp:requestServer("/game/role/card_capacity/buy", function (slot0)
					gGameUI:showTip(gLanguageCsv.hasBuy)
					sdk.trackEvent("dia_backpack")
				end)
			end, slot3)
		end
	end, slot0.cardCapacity, slot0.leftTimes, slot0.rmb, slot0.price)
end

return slot0
