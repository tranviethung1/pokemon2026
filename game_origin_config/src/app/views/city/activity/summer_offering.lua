slot1 = class("ActivitySummerOfferingView", require("app.views.city.activity.anniversary"))
slot2 = game.YYHUODONG_TYPE_ENUM_TABLE
slot1.RESOURCE_FILENAME = "activity_summer_offering.json"
slot1.RESOURCE_BINDING = {
	beachIce = "shavedIce",
	shop = "shop",
	volleyball = "volleyball",
	bg = "bg",
	summerChallenge = "summerChallenge",
	countdown = {
		varname = "countdown",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c4b(91, 84, 91, 255)
					}
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0:createTitle()
	slot0:enableSchedule()

	slot0.isRunning = false

	slot0:createTable()

	for slot5, slot6 in ipairs(slot1) do
		if slot0.tb[csv.yunying.yyhuodong[slot6.id].type] then
			slot0.tb[slot7.type].data = slot6
		end
	end

	slot0:refreshPanel()
end

function slot1.createTitle(slot0)
	slot1 = gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "SUMMER",
		title = gLanguageCsv.summerActivity
	})
end

function slot1.bindClick(slot0, slot1, slot2, slot3)
	bind.touch(slot0, slot1, {
		methods = {
			ended = function ()
				uv0 = "gGameUI"

				if slot0 then
					uv0 = "showTip"

					if slot0 then
						gGameUI:showTip(gLanguageCsv.activityOver)
					else
						uv0 = "gLanguageCsv"
						uv2 = "gGameUI"

						slot0:onItemClick(slot2)
					end
				else
					gGameUI:showTip(gLanguageCsv.huodongNoOpen)
				end
			end
		}
	})
end

function slot1.createTable(slot0)
	uv3 = "matchLanguage"
	slot3 = slot3.shavedIce
	uv3 = "matchLanguage"
	slot3 = slot3.summerChallenge
	uv3 = "matchLanguage"
	slot3 = slot3.volleyball
	uv3 = "matchLanguage"
	slot0.tb = {
		[slot3] = {
			node = slot0.shavedIce,
			redHintPos = cc.p(250, 95)
		},
		[slot3] = {
			node = slot0.summerChallenge,
			redHintPos = matchLanguage({
				"kr"
			}) and cc.p(295, 95) or cc.p(280, 95)
		},
		[slot3] = {
			node = slot0.volleyball,
			redHintPos = cc.p(255, 98)
		},
		[slot3.itemBuy2] = {
			node = slot0.shop,
			redHintPos = cc.p(280, 100)
		}
	}
end

return slot1
