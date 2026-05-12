slot0 = require("app.views.city.activity.coupon_shop")
slot1 = class("SummerShopView", slot0)
slot1.RESOURCE_FILENAME = "summer_shop.json"
slot1.RESOURCE_BINDING = slot0.RESOURCE_BINDING

function slot1.initData(slot0)
	slot0.itemID = 6394
end

function slot1.initTitle(slot0)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "QUALIFIED SHOP",
		title = gLanguageCsv.summerShop
	})
end

function slot1.initCountDown(slot0)
	slot1 = slot0.time
	slot3, slot4 = slot0.timeText:xy()

	slot1:xy(slot3 + slot0.timeText:width() / 2 + 10, slot4 - slot0.timeText:height() - 10)
	bind.extend(slot0, slot1, {
		class = "cutdown_label",
		props = {
			endTime = gGameModel.role:read("yy_endtime")[slot0.activityId] or 0,
			callFunc = function ()
				uv1 = "adapt"

				adapt.setTextScaleWithWidth(slot1, nil, 265)
			end,
			endFunc = function ()
				uv0 = "time"

				slot0.time:text(gLanguageCsv.activityOver)
			end
		}
	})
end

return slot1
