slot1 = class("SkyScraperView", cc.load("mvc").ViewBase)
slot2 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(255, 252, 237, 255)
		}
	}
}

function slot3(slot0, slot1)
	slot0:setTouchEnabled(slot1)
	cache.setShader(slot0, false, slot1 and "normal" or "hsl_gray")

	if slot1 then
		text.addEffect(slot0:get("textNote"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
	else
		text.deleteAllEffect(slot0:get("textNote"))
		text.addEffect(slot0:get("textNote"), {
			color = ui.COLORS.DISABLED.WHITE
		})
	end
end

slot1.RESOURCE_FILENAME = "sky_scraper_view.json"
slot1.RESOURCE_BINDING = {
	centerPanel = "centerPanel",
	bg = "bg",
	["centerPanel.tipTime"] = "tipTime",
	["centerPanel.textTipTime"] = "textTipTime",
	icon = "icon",
	["centerPanel.btnGame"] = {
		varname = "btnGame",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlayGameClick")
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
	["centerPanel.btnGame.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["centerPanel.timeText"] = {
		varname = "timeText",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(91, 84, 91, 255)
				}
			}
		}
	},
	["centerPanel.time"] = {
		varname = "time",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(91, 84, 91, 255)
				}
			}
		}
	},
	["leftDownPanel.taskPanel.txt"] = {
		binds = slot2
	},
	["leftDownPanel.rankPanel.txt"] = {
		binds = slot2
	},
	["leftDownPanel.rulePanel.txt"] = {
		binds = slot2
	},
	["leftDownPanel.taskPanel"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onTaskClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "skyScraperTask",
					listenData = {
						activityId = bindHelper.self("activityId")
					}
				}
			}
		}
	},
	["leftDownPanel.rankPanel"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRankClick")
			}
		}
	},
	["leftDownPanel.rulePanel"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityId = slot1

	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "SKY SCRAPER",
		title = gLanguageCsv.skyScraper
	})
	slot0:initModel()
	slot0:updateTime()
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.cost = 0
	slot2 = csv.yunying.yyhuodong[slot0.activityId].paramMap or {}
	slot0.huodongId = slot1.huodongID
	slot0.maxTimes = slot2.times or 0
	slot0.buyCost = slot2.buyCost or {}
	slot0.canBuy = false
	slot0.buyTimes = slot2.buyTimes or 0

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		slot3 = ((slot1[slot2.activityId] or {}).info or {}).task_points or 0
		slot5 = 0
		slot6 = 0
		slot7 = false
		slot8 = 1

		for slot12, slot13 in orderCsvPairs(csv.yunying.skyscraper_medals) do
			uv15 = "activityId"

			if slot13.huodongID == slot15.huodongId and slot4[slot8].medalLevel < slot13.medalLevel then
				slot8 = slot12 or slot8
			end
		end

		for slot12, slot13 in orderCsvPairs(slot4) do
			uv15 = "activityId"

			if slot13.huodongID == slot15.huodongId then
				slot7 = true

				if slot3 < slot6 + slot13.points then
					slot5 = slot12

					break
				end
			end
		end

		if not slot7 then
			slot5 = 1
		elseif slot5 == 0 then
			slot5 = slot8
		end

		uv9 = "activityId"
		slot9 = slot9.icon
		slot9 = slot9.texture

		slot9(slot9, slot4[slot5].resource)

		uv9 = "activityId"
		slot9 = slot9.icon:get("imgRank")
		slot9 = slot9.texture

		slot9(slot9, slot4[slot5].resourceNum)

		uv9 = "activityId"
		slot9 = slot9.icon:get("textRank")
		slot9 = slot9.text

		slot9(slot9, gLanguageCsv[slot4[slot5].medalsName])

		uv9 = "activityId"
		slot9 = slot9.icon:get("textRank")
		slot10 = slot9

		slot9.setTextColor(slot10, cc.c3b(unpack(slot4[slot5].color)))

		uv10 = "activityId"
		slot10 = slot10.icon:get("textRank")

		adapt.setTextScaleWithWidth(slot10, false, 180)

		uv9 = "activityId"
		uv10 = "activityId"
		slot9.times = slot10.maxTimes + slot2.buy_times - slot2.times or 0
		uv9 = "activityId"
		uv11 = "activityId"
		slot12 = "/"
		uv13 = "activityId"

		slot9.tipTime:text(slot11.times .. slot12 .. slot13.maxTimes)

		uv9 = "activityId"
		uv12 = "activityId"

		if slot2.buy_times + 1 <= itertools.size(slot12.buyCost) then
			uv10 = "activityId"

			if not slot10.buyCost[slot2.buy_times + 1] then
				uv10 = "activityId"
				uv12 = "activityId"
				slot10 = slot10.buyCost[itertools.size(slot12.buyCost)]
			end
		end

		slot9.cost = slot10
		uv9 = "activityId"
		uv11 = "activityId"
		slot9.canBuy = slot2.buy_times < slot11.buyTimes
		uv9 = "activityId"
		uv12 = "activityId"
		slot11 = slot2.buy_times ~= slot12.buyTimes

		slot9.btnAdd:visible(slot11)

		uv11 = "activityId"
		slot11 = slot11.centerPanel
		slot12 = slot11
		uv12 = "activityId"
		slot12 = slot12.textTipTime
		slot12 = slot12.y
		uv12 = "activityId"
		slot12 = slot12.textTipTime
		uv12 = "activityId"

		adapt.oneLineCenterPos(cc.p(slot11.size(slot12).width / 2, slot12(slot12)), {
			slot12,
			slot12.tipTime
		}, cc.p(0, 0))
	end)
end

function slot1.onTaskClick(slot0)
	gGameUI:stackUI("city.activity.sky_scraper.reward", nil, , slot0.activityId)
end

function slot1.onPlayGameClick(slot0)
	if slot0.times == 0 then
		gGameUI:showTip(gLanguageCsv.gameTimesLimit)

		return
	end

	slot2 = 0

	if gGameModel.role:read("yy_endtime")[slot0.activityId] == nil or math.floor(slot1 - time.getTime()) <= 0 then
		gGameUI:showTip(gLanguageCsv.flipCardFinishedClickTip)

		return
	end

	gGameApp:requestServer("/game/yy/skyscraper/start", function (slot0)
		uv6 = "gGameUI"

		gGameUI:stackUI("city.activity.sky_scraper.game", nil, {
			full = true
		}, slot6.activityId)
	end, slot0.activityId)
end

function slot1.onRankClick(slot0)
	gGameApp:requestServer("/game/yy/skyscraper/ranking", function (slot0)
		uv6 = "gGameUI"

		gGameUI:stackUI("city.activity.sky_scraper.rank", nil, , slot6.activityId, slot0.view)
	end, slot0.activityId)
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
		slot2.noteText(161),
		slot2.noteText(116001, 116020)
	}
end

function slot1.onAddClick(slot0)
	slot2 = 0

	if gGameModel.role:read("yy_endtime")[slot0.activityId] == nil or math.floor(slot1 - time.getTime()) <= 0 then
		gGameUI:showTip(gLanguageCsv.flipCardFinishedClickTip)

		return
	end

	if slot0.canBuy == false then
		gGameUI:showTip(gLanguageCsv.buyTimesLimit)

		return
	end

	gGameUI:showDialog({
		isRich = true,
		btnType = 2,
		clearFast = true,
		cb = function ()
			uv0 = "cost"

			if gGameModel.role:read("rmb") < slot0.cost then
				uiEasy.showDialog("rmb")
			else
				uv4 = "cost"

				gGameApp:requestServer("/game/yy/skyscraper/buy", function (slot0)
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

function slot1.updateTime(slot0)
	bind.extend(slot0, slot0.time, {
		class = "cutdown_label",
		props = {
			endTime = gGameModel.role:read("yy_endtime")[slot0.activityId],
			callFunc = function ()
				uv2 = "adapt"
				slot2 = slot2.centerPanel
				slot3 = slot2
				uv3 = "adapt"
				slot3 = slot3.timeText
				slot3 = slot3.y
				uv3 = "adapt"
				slot3 = slot3.timeText
				uv3 = "adapt"

				adapt.oneLineCenterPos(cc.p(slot2.size(slot3).width / 2, slot3(slot3)), {
					slot3,
					slot3.time
				}, cc.p(0, 0))
			end,
			endFunc = function ()
				uv0 = "time"
				slot0 = slot0.time
				slot0 = slot0.text
				slot2 = gLanguageCsv.activityOver

				slot0(slot0, slot2)

				uv0 = "time"
				slot0 = slot0.time
				slot0 = slot0.x
				uv2 = "time"

				slot0(slot0, slot2.time:x() - 180)

				uv0 = "time"

				slot0.timeText:visible(false)
			end
		}
	})
end

return slot1
