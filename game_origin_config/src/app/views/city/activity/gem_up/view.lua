function slot0(slot0, slot1)
	return cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(1, cc.p(slot0, slot1 + 30)), cc.MoveTo:create(1, cc.p(slot0, slot1 - 30))))
end

slot1 = require("app.views.city.activity.view")
slot2 = class("GemUpView", Dialog)
slot2.RESOURCE_FILENAME = "activity_gem.json"
slot2.RESOURCE_BINDING = {
	freePanel = "freePanel",
	iconBg = "iconBg",
	bg = "bg",
	icon3 = "icon3",
	iconTxt2 = "iconTxt2",
	iconTxt1 = "iconTxt1",
	bgAnima = "bgAnima",
	item1 = "item1",
	item2 = "item2",
	txt = "timeTxt",
	item3 = "item3",
	icon2 = "icon2",
	icon1 = "icon1",
	iconTxt3 = "iconTxt3",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	replacement = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("replacement")
			}
		}
	},
	["replacement.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.ORANGE
				}
			}
		}
	},
	time = {
		varname = "time",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = cc.c4b(139, 47, 28, 255)
				}
			}
		}
	},
	resolvePanel = {
		varname = "resolvePanel",
		binds = {
			event = "click",
			method = bindHelper.self("resolveGem")
		}
	},
	imgBg = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("awardBrowse")
			}
		}
	},
	["extract1.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.BLUE
				}
			}
		}
	},
	["extract2.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.ORANGE
				}
			}
		}
	},
	extract1 = {
		varname = "drawOnePanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:onDrawClick(1)
				end)
			}
		}
	},
	extract2 = {
		varname = "drawTenPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:onDrawClick(10)
				end)
			}
		}
	},
	["iconBg.btn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleShow")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.drawOnePanel:get("textFree"):visible(false)

	slot0.activityID = slot1

	slot0.resolvePanel:get("icon"):visible(userDefault.getForeverLocalKey("gemUpReplacement", false))

	if matchLanguage({
		"en"
	}) then
		adapt.setTextAdaptWithSize(slot0.resolvePanel:get("title"), {
			margin = 0,
			vertical = "center",
			maxLine = 2,
			horizontal = "left",
			size = cc.size(400, 120)
		})
	end

	slot0.whetherResolve = slot2 and 1 or 0

	slot0.timeTxt:text(string.format("%02d:00", time.getRefreshHour()))
	slot0:initModel()
	slot0:setCountdown(slot1)
	slot0.bg:visible(false)

	slot3 = widget.addAnimation(slot0.bgAnima, "fushichouqu/fwxd.skel", "effect_loop", 10):alignCenter(slot0.bgAnima:size()):scale(2)
	slot4 = widget.addAnimation(slot0.bgAnima, "fushichouqu/fwxd_wz.skel", "effect_loop", 20):alignCenter(slot0.bgAnima:size()):scale(2)

	idlereasy.when(gGameModel.daily_record:getIdler("limit_up_gem_free_count"), function (slot0, slot1)
		if slot1 == 0 then
			uv2 = "freePanel"
			slot2 = slot2.freePanel:get("txt")
			slot2 = slot2.text

			slot2(slot2, gLanguageCsv.freeCount)

			uv2 = "freePanel"

			slot2.freePanel:get("time"):text(1 .. "/" .. 1)
		end

		uv2 = "freePanel"
		slot2 = slot2.freePanel
		slot2 = slot2.visible

		slot2(slot2, slot1 == 0)

		uv2 = "freePanel"
		slot2 = slot2.drawOnePanel:get("icon")
		slot2 = slot2.visible

		slot2(slot2, slot1 ~= 0)

		uv2 = "freePanel"
		slot2 = slot2.freePanel:get("icon")
		slot2 = slot2.visible

		slot2(slot2, slot1 ~= 0)

		uv2 = "freePanel"
		slot2 = slot2.drawOnePanel:get("textFree")
		slot2 = slot2.visible

		slot2(slot2, slot1 == 0)

		uv2 = "freePanel"
		slot2 = slot2.drawOnePanel:get("txt1")
		slot2 = slot2.visible

		slot2(slot2, slot1 ~= 0)

		uv2 = "freePanel"

		slot2.drawOnePanel:get("num"):visible(slot1 ~= 0)
	end)

	slot5 = csv.yunying.yyhuodong[slot1]
	slot0.numUp = slot5.paramMap.drawLimit
	slot6 = slot5.clientParam.up
	slot0.rmbDown = slot5.paramMap.RMB1
	slot0.rmbUp = slot5.paramMap.RMB10

	slot0.drawOnePanel:get("num"):text(slot0.rmbDown)
	adapt.oneLinePos(slot0.drawOnePanel:get("num"), slot0.drawOnePanel:get("icon"), cc.p(10, 0), "left")
	slot0.drawTenPanel:get("num"):text(slot0.rmbUp)
	adapt.oneLinePos(slot0.drawTenPanel:get("num"), slot0.drawTenPanel:get("icon"), cc.p(10, 0), "left")

	for slot10 = 1, 3 do
		if slot6[slot10] then
			slot0["item" .. slot10]:get("gem"):texture(ui.GEM_SUIT_ICON[slot6[slot10]])
			slot0["iconTxt" .. slot10]:text(gLanguageCsv["gemSuit" .. slot6[slot10]])
		else
			slot0.item2:x(slot0.item2:x() + 260)
			slot0.iconTxt2:x(slot0.iconTxt2:x() + 260)
			slot0.item1:x(slot0.item1:x() + 180)
			slot0.iconTxt1:x(slot0.iconTxt1:x() + 180)
			slot0["item" .. slot10]:visible(false)
			slot0["iconTxt" .. slot10]:visible(false)
		end

		if csvSize(slot6) == 2 then
			if slot10 == 1 then
				uv13 = "drawOnePanel"

				slot0.item1:runAction(slot13(slot0.item1:x() + 180, slot0.item1:y()))
				widget.addAnimation(slot0.icon1, "fushichouqu/fwxd_hezi.skel", "effect_loop", 10):xy(720, 375):scale(2)
			elseif slot10 == 2 then
				uv13 = "drawOnePanel"

				slot0.item2:runAction(slot13(slot0.item2:x() + 260, slot0.item1:y()))
				widget.addAnimation(slot0.icon2, "fushichouqu/fwxd_hezi.skel", "effect_loop", 10):xy(790, 375):scale(2)
			end
		else
			uv13 = "drawOnePanel"

			slot0["item" .. slot10]:runAction(slot13(slot0["item" .. slot10]:x(), slot0.item1:y()))
			widget.addAnimation(slot0["icon" .. slot10], "fushichouqu/fwxd_hezi.skel", "effect_loop", 10):xy(530, 375):scale(2)
		end
	end

	idlereasy.when(gGameModel.role:getIdler("rmb"), function ()
		uv0 = "textColor"

		slot0:textColor()
	end)
	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		slot2 = 0
		uv3 = "info"

		if slot1[slot3] then
			uv3 = "info"

			if slot1[slot3].info.draw_counter then
				uv3 = "info"
				slot2 = slot1[slot3].info.draw_counter
			end
		end

		uv3 = "draw_counter"
		slot3 = slot3.iconBg:get("num")
		slot4 = slot3
		uv7 = "draw_counter"

		slot3.text(slot4, slot2 .. "/" .. slot7.numUp)

		uv4 = "draw_counter"
		slot4 = slot4.iconBg
		slot5 = slot4
		uv5 = "draw_counter"

		adapt.oneLinePos(slot4.get(slot5, "num"), slot5.iconBg:get("btn"), cc.p(10, 0), "left")
	end)
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot2.setCountdown(slot0, slot1)
	slot0:enableSchedule()

	slot2 = csv.yunying.yyhuodong[slot1]
	slot3 = 0

	bind.extend(slot0, slot0.time, {
		class = "cutdown_label",
		props = {
			endTime = gGameModel.role:read("yy_endtime")[slot1],
			endFunc = function ()
				uv0 = "time"

				slot0.time:text(gLanguageCsv.activityOver)
			end
		}
	})
end

function slot2.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot2.replacement(slot0)
	gGameUI:stackUI("city.activity.gem_up.gem_replacement", nil, , slot0.activityID)
end

function slot2.resolveGem(slot0)
	slot1 = userDefault.getForeverLocalKey("gemUpReplacement", false)

	userDefault.setForeverLocalKey("gemUpReplacement", not slot1)
	slot0.resolvePanel:get("icon"):visible(not slot1)

	slot0.whetherResolve = not slot1 and 1 or 0
end

function slot2.awardBrowse(slot0)
	gGameUI:stackUI("city.card.gem.preview", nil, {
		blackLayer = true,
		clickClose = true
	}, slot0.activityID)
end

function slot2.drawRequest(slot0, slot1, slot2)
	slot3 = gGameModel.daily_record:read("limit_up_gem_free_count")
	slot4 = 0

	if slot0.yyhuodongs:read()[slot0.activityID] and slot0.yyhuodongs:read()[slot0.activityID].info.draw_counter then
		slot4 = slot0.yyhuodongs:read()[slot0.activityID].info.draw_counter
	end

	slot5 = slot1 == 1 and slot0.rmbDown or slot0.rmbUp

	if slot1 == 10 or slot3 == 1 and slot1 == 1 then
		if slot1 == 10 and slot0.numUp == slot4 then
			gGameUI:showTip(gLanguageCsv.gemDrawLimit)

			return
		elseif slot1 == 10 and slot0.numUp - slot4 <= 9 and slot0.numUp - slot4 >= 1 then
			gGameUI:showTip(string.format(gLanguageCsv.leftTimesNotEnough, 10))

			return
		elseif slot1 == 1 and slot0.numUp == slot4 then
			gGameUI:showTip(gLanguageCsv.gemDrawLimit)

			return
		end

		if gGameModel.role:read("rmb") < slot5 then
			uiEasy.showDialog("rmb")

			return
		end
	end

	slot6 = nil

	if (slot1 == 1 and (slot3 == 0 and "limit_up_gem_free1" or "limit_up_gem_rmb1") or "limit_up_gem_rmb10") == "limit_up_gem_rmb10" or slot6 == "limit_up_gem_rmb1" then
		dataEasy.sureUsingDiamonds(function ()
			function slot2(slot0)
				if gLanguageCsv[slot0.err] then
					gGameUI:showTip(gLanguageCsv[slot0.err])
				end
			end

			uv2 = "gGameApp"
			uv3 = "requestServerCustom"
			uv4 = "gGameApp"

			gGameApp:requestServerCustom("/game/yy/limit/gem/draw"):onErrCall(slot2):params(slot2.activityID, slot3, slot4.whetherResolve):doit(function (slot0)
				slot1 = {}

				for slot5, slot6 in pairs(slot0.view.items) do
					slot7 = {
						key = slot6[1],
						num = slot6[2]
					}

					if slot6[3] then
						slot7 = {
							num = 1,
							key = slot6[3],
							decomposed = {
								key = slot6[1],
								num = slot6[2]
							}
						}
					end

					table.insert(slot1, slot7)
				end

				uv2 = "pairs"
				slot2 = slot2.textColor

				slot2(slot2)

				uv2 = "view"

				slot2(random.shuffle(slot1))
			end)
		end, slot5)
	else
		slot7()
	end
end

function slot2.onDrawClick(slot0, slot1)
	slot2 = slot1 == 1 and slot0.rmbDown or slot0.rmbUp

	slot0:drawRequest(slot1, function (slot0)
		uv8 = "gGameUI"
		uv9 = "stackUI"
		uv11 = "city.card.gem.result"

		gGameUI:stackUI("city.card.gem.result", nil, , slot0, "rmb", slot8, slot9, 531, slot11:createHandler("drawRequest"), true)
	end)
end

function slot2.textColor(slot0)
	slot1 = ui.COLORS.NORMAL.WHITE
	slot2 = ui.COLORS.RED

	if gGameModel.role:read("rmb") < slot0.rmbDown then
		slot0.drawOnePanel:get("num"):color(slot2)
		slot0.drawTenPanel:get("num"):color(slot2)
	elseif gGameModel.role:read("rmb") < slot0.rmbUp and slot0.rmbDown <= gGameModel.role:read("rmb") then
		slot0.drawOnePanel:get("num"):color(slot1)
		slot0.drawTenPanel:get("num"):color(slot2)
	elseif slot0.rmbUp <= gGameModel.role:read("rmb") then
		slot0.drawOnePanel:get("num"):color(slot1)
		slot0.drawTenPanel:get("num"):color(slot1)
	end
end

function slot2.onRuleShow(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot2.getRuleContext(slot0, slot1)
	slot3 = adaptContext

	return {
		slot3.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.gemUpExtract)
		end),
		slot3.noteText(unpack({
			90001,
			90003
		}))
	}
end

return slot2
