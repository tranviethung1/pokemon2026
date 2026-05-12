slot1 = class("SnowBallView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "snow_ball_view.json"
slot1.RESOURCE_BINDING = {
	["centerPanel.btnGame"] = {
		varname = "btnGame",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onPlayGameClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					state = bindHelper.self("gameRedHint"),
					onNode = function (slot0)
						slot0:xy(450, 200)
					end
				}
			}
		}
	},
	["centerPanel.textTipTime"] = {
		varname = "textTipTime",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(82, 76, 85, 255)
				}
			}
		}
	},
	["centerPanel.btnAdd"] = {
		varname = "btnAdd",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddClick")
			}
		}
	},
	["rightDownPanel.btnAward"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onRewardClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					state = bindHelper.self("awardRedHint"),
					onNode = function (slot0)
						slot0:xy(200, 200)
					end
				}
			}
		}
	},
	["rightDownPanel.btnRank"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRankClick")
			}
		}
	},
	["rightDownPanel.btnRule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.activityId = slot1

	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "SNOW GAME",
		title = gLanguageCsv.snowBallGame
	})
	slot0:initModel()
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.awardRedHint = idler.new(false)
	slot0.gameRedHint = idler.new(false)
	slot0.cost = 0
	slot0.times = 0
	slot0.canBuy = false
	slot0.canPlay = false
	slot1 = csv.yunying.yyhuodong[slot0.activityId].paramMap

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		slot2 = slot1[slot2.activityId] or {}
		slot3 = slot2.info or {
			top_role = 0,
			sign = 0,
			top_time = 0,
			days = 0,
			total_point = 0,
			times = 0,
			rank = 0,
			top_point = 0,
			buy_times = 0,
			isGuide = 0
		}
		uv4 = "activityId"
		slot4.roleData = slot3
		uv4 = "activityId"
		slot5 = slot2.snowball
		slot4.snowData = slot5
		uv4 = "activityId"
		uv5 = "info"
		slot6 = slot3.times
		slot4.times = slot5.times + slot3.buy_times - slot6
		uv4 = "activityId"
		uv6 = "info"
		slot5 = slot3.buy_times < slot6.buyTimes
		slot4.canBuy = slot5
		uv4 = "activityId"
		uv5 = "activityId"
		slot5 = slot5.times > 0
		slot4.canPlay = slot5
		uv4 = "info"
		slot4 = slot4.buyCost
		uv5 = "activityId"
		slot5 = slot5.gameRedHint
		slot5 = slot5.set
		uv7 = "activityId"

		slot5(slot5, slot7.times > 0)

		uv5 = "activityId"

		slot5.awardRedHint:set(false)

		slot5 = pairs

		for slot8, slot9 in slot5(slot2.stamps or {}) do
			if slot9 == 1 then
				uv10 = "activityId"

				slot10.awardRedHint:set(true)

				break
			end
		end

		uv5 = "activityId"
		slot5.cost = slot3.buy_times + 1 <= itertools.size(slot4) and slot4[slot3.buy_times + 1] or slot4[itertools.size(slot4)]
		uv5 = "activityId"
		uv8 = "activityId"

		slot5.textTipTime:text(gLanguageCsv.todayNumber .. slot8.times)

		slot8 = 280
		uv8 = "activityId"
		slot8 = slot8.textTipTime
		uv8 = "activityId"

		adapt.oneLineCenterPos(cc.p(310, slot8), {
			slot8,
			slot8.btnAdd
		}, {
			cc.p(5, 0)
		})

		if slot3.isGuide == 0 then
			uv5 = "activityId"

			slot5.btnGame:get("Image_36"):texture("activity/snow_ball/txt_xqdbs_ksjx.png")
		else
			uv5 = "activityId"

			slot5.btnGame:get("Image_36"):texture("activity/snow_ball/txt_xqdbs_ksyx.png")
		end
	end)
end

function slot1.onPlayGameClick(slot0)
	if slot0.canPlay then
		gGameUI:stackUI("city.activity.snow_ball.choose_role", nil, {
			blackLayer = true
		}, slot0.activityId)
	else
		gGameUI:showTip(gLanguageCsv.gameTimesLimit)
	end
end

function slot1.onRewardClick(slot0)
	gGameUI:stackUI("city.activity.snow_ball.reward", nil, {
		blackLayer = true
	}, slot0.activityId)
end

function slot1.onRankClick(slot0)
	gGameApp:requestServer("/game/rank", function (slot0)
		uv7 = "gGameUI"

		gGameUI:stackUI("city.activity.snow_ball.rank", nil, , slot0.view, slot7.roleData)
	end, "snowball", 0, 50)
end

function slot1.onAddClick(slot0)
	if slot0.canBuy == false then
		gGameUI:showTip(gLanguageCsv.buyTimesLimit)

		return
	end

	gGameUI:showDialog({
		btnType = 2,
		clearFast = true,
		isRich = true,
		cb = function ()
			uv0 = "cost"

			if gGameModel.role:read("rmb") < slot0.cost then
				uiEasy.showDialog("rmb")
			else
				uv4 = "cost"

				gGameApp:requestServer("/game/yy/snowball/buy", function (slot0)
					gGameUI:showTip(gLanguageCsv.buySuccess)
				end, slot4.activityId)
			end
		end,
		title = gLanguageCsv.spaceTips,
		content = string.format(gLanguageCsv.buyGameTimes, slot0.cost),
		dialogParams = {
			clickClose = false
		}
	})
end

function slot1.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(110001, 110100)
	}
end

return slot1
