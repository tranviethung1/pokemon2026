slot0 = {
	"login/tag_hot.png",
	"login/tag_limtime.png",
	"login/tag_new.png"
}
slot1 = game.YYHUODONG_TYPE_ENUM_TABLE
slot2 = {
	main = {
		subTitle = "ACTIVITY",
		tabLine = "login/box_tagline.png",
		leftBg = "activity/img_tag_d.png",
		tabSelectedBg = "login/tab_popupsel.png",
		independent = {
			0,
			4
		},
		tabNormalColor = ui.COLORS.NORMAL.DEFAULT,
		title = gLanguageCsv.activity
	},
	award = {
		subTitle = "WELFARE",
		tabLine = "login/box_tagline.png",
		leftBg = "activity/img_tag_d.png",
		tabSelectedBg = "login/tab_popupsel.png",
		independent = {
			3,
			5
		},
		tabNormalColor = ui.COLORS.NORMAL.DEFAULT,
		title = gLanguageCsv.welfare
	}
}
slot3 = {
	[slot1.directBuyGift] = {
		specialTag = "activityBuyGift"
	},
	[slot1.itemExchange] = {
		specialTag = "activityItemExchange"
	},
	[slot1.monthlyCard] = {
		specialTag = "activityMonthlyCard"
	},
	[slot1.regainStamina] = {
		specialTag = "activityRegainStamina"
	},
	[slot1.generalTask] = {
		specialTag = "activityGeneralTask"
	},
	[slot1.rechargeGift] = {
		specialTag = "activityRechargeGift"
	},
	[slot1.levelFund] = {
		specialTag = "activityLevelFund"
	},
	[slot1.Retrieve] = {
		specialTag = "activityRetrieve"
	},
	[slot1.weeklyCard] = {
		specialTag = "activityWeeklyCard"
	},
	[slot1.serverOpen] = {
		specialTag = "activityServerOpen"
	}
}
slot4 = class("ActivityView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "activity.json"
slot4.RESOURCE_BINDING = {
	["leftPanel.item"] = "tabItem",
	leftPanel = "leftPanel",
	["rightPanel.topPanel"] = "rightTopPanel",
	["leftPanel.bg"] = {
		binds = {
			event = "texture",
			data = bindHelper.self("independentStyle"),
			method = function (slot0)
				uv1 = "leftBg"

				return slot1[slot0].leftBg
			end
		}
	},
	["leftPanel.list"] = {
		varname = "tabList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 8,
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("tabItem"),
				independentStyle = bindHelper.self("independentStyle"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.sortWeight ~= slot1.sortWeight then
						return slot0.sortWeight < slot1.sortWeight
					end

					return slot0.id < slot1.id
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					uv5 = "csv"
					slot5 = slot5[slot0.independentStyle]

					if matchLanguage({
						"en"
					}) then
						adapt.setTextAdaptWithSize(slot1:get("name"), {
							margin = -8,
							vertical = "center",
							maxLine = 2,
							horizontal = "center",
							str = csv.yunying.yyhuodong[slot2].desc,
							size = cc.size(slot1:width() - 50, 70)
						})
					else
						adapt.setTextScaleWithWidth(slot1:get("name"), slot4.desc, slot1:width() - 30)
					end

					slot6 = slot1:get("line"):texture(slot5.tabLine)
					slot7 = slot6

					slot6.visible(slot7, not slot3.isLast)

					uv7 = "yunying"

					if slot7[slot4.type] then
						uv8 = "yunying"
						slot7 = table.deepcopy(slot8[slot6], true)
						slot7.state = not slot3.selected
						slot7.listenData = maptools.extend({
							slot7.listenData or {},
							{
								activityId = slot2
							}
						})

						bind.extend(slot0, slot1, {
							class = "red_hint",
							props = slot7
						})
					end

					uiEasy.showHoudongId(slot1, slot3.id, {
						dy1 = 45,
						dy2 = -45,
						width = 300
					})
					slot1:get("selected"):texture(slot5.tabSelectedBg):visible(slot3.selected)

					if slot3.selected then
						text.addEffect(slot1:get("name"), {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						text.deleteAllEffect(slot1:get("name"))
						text.addEffect(slot1:get("name"), {
							color = slot5.tabNormalColor
						})
					end

					slot7 = slot1:get("icon")
					slot7 = slot7.hide

					slot7(slot7)

					uv7 = "yyhuodong"

					if slot7[slot4.icon1] then
						slot9 = "icon"
						uv9 = "yyhuodong"

						slot1:get(slot9):texture(slot9[slot4.icon1]):show():scale(0.9)
					end

					bind.click(slot0, slot1, {
						method = functools.partial(slot0.clickCell, slot2, slot3)
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	["rightPanel.topPanel.name"] = {
		varname = "rightTopPanelName",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						color = cc.c4b(243, 146, 101, 255)
					},
					shadow = {
						size = 8,
						color = cc.c4b(153, 67, 28, 102),
						offset = cc.size(0, -8)
					}
				}
			}
		}
	},
	["rightPanel.topPanel.title"] = {
		varname = "rightTopPaneltitle",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 3,
						color = cc.c4b(255, 71, 46, 255)
					}
				}
			}
		}
	},
	["rightPanel.topPanel.iconAll"] = {
		varname = "iconAll",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("oneKeyiconAllBtn")
			}
		}
	}
}

function slot4.addTabListClipping(slot0)
	slot1 = slot0.tabList

	slot1:retain()
	slot1:removeFromParent()

	slot2 = slot1:size()
	slot3 = ccui.Scale9Sprite:create()

	slot3:initWithFile(cc.rect(200, 49, slot2.width, slot2.height), "activity/mask_tab_activity.png")
	slot3:size(slot2):anchorPoint(0, 0):xy(slot1:xy())
	cc.ClippingNode:create(slot3):setAlphaThreshold(0.1):add(slot1):addTo(slot0.leftPanel, slot1:z())
	slot1:release()
end

function slot4.onCreate(slot0, slot1, slot2)
	gGameModel.currday_dispatch:getIdlerOrigin("activityDirectBuyGift"):set(true)

	slot3 = slot1 or "main"
	slot0.independentStyle = slot3
	uv3 = "gGameModel"
	slot3 = slot3[slot0.independentStyle]
	slot0.yyOpen = gGameModel.role:read("yy_open")
	slot0.yyEndtime = gGameModel.role:read("yy_endtime")

	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		title = slot3.title,
		subTitle = slot3.subTitle
	})

	slot5 = slot0

	slot0.addTabListClipping(slot5)

	uv5 = "currday_dispatch"
	slot5 = slot5.monthlyCard
	uv5 = "currday_dispatch"
	slot5 = slot5.itemExchange
	uv5 = "currday_dispatch"
	slot5 = slot5.generalTask
	uv5 = "currday_dispatch"
	slot5 = slot5.itemBuy
	uv5 = "currday_dispatch"
	slot5 = slot5.directBuyGift
	uv5 = "currday_dispatch"
	slot5 = slot5.clientShow
	uv5 = "currday_dispatch"
	slot5 = slot5.regainStamina
	uv5 = "currday_dispatch"
	slot5 = slot5.levelFund
	uv5 = "currday_dispatch"
	slot5 = slot5.rechargeGift
	uv5 = "currday_dispatch"
	slot5 = slot5.Retrieve
	uv5 = "currday_dispatch"
	slot5 = slot5.weeklyCard
	uv5 = "currday_dispatch"
	slot5 = slot5.qualityExchange
	uv5 = "currday_dispatch"
	slot0.viewDatas = {
		[slot5] = {
			viewName = "city.activity.month_card",
			showRightInfo = false
		},
		[slot5] = {
			viewName = "city.activity.item_exchange",
			showRightInfo = true
		},
		[slot5] = {
			viewName = "city.activity.general_task",
			showRightInfo = true
		},
		[slot5] = {
			viewName = "city.activity.item_buy",
			showRightInfo = true
		},
		[slot5] = {
			viewName = "city.activity.buy_gift",
			showRightInfo = true
		},
		[slot5] = {
			viewName = "city.activity.client_show",
			showRightInfo = false
		},
		[slot5] = {
			viewName = "city.activity.regain_stamina",
			showRightInfo = false
		},
		[slot5] = {
			viewName = "city.activity.level_fund",
			showRightInfo = false
		},
		[slot5] = {
			viewName = "city.activity.recharge_gift",
			showRightInfo = false
		},
		[slot5] = {
			viewName = "city.activity.resource_retrieve",
			showRightInfo = true
		},
		[slot5] = {
			viewName = "city.activity.weekly_card",
			showRightInfo = false
		},
		[slot5] = {
			viewName = "city.activity.quality_exchange_helditem",
			showRightInfo = true
		},
		[slot5.serverOpen] = {
			viewName = "city.activity.new_new_world_task",
			showRightInfo = false
		}
	}
	slot0.subViews = {}
	slot0.activityId = idler.new()
	slot0.tabDatas = idlers.new()

	slot0:onTabData(1, slot2)
	slot0.activityId:addListener(function (slot0, slot1)
		if slot1 then
			uv2 = "tabDatas"
			slot2.tabDatas:atproxy(slot1).selected = false
		end

		if slot0 then
			uv2 = "tabDatas"
			slot2.tabDatas:atproxy(slot0).selected = true
		end

		uv2 = "tabDatas"

		if slot2.subViews[slot1] then
			uv2 = "tabDatas"

			slot2.subViews[slot1]:hide()
		end

		if csv.yunying.yyhuodong[slot0] then
			uv4 = "tabDatas"

			if table.deepcopy(slot4.viewDatas[slot2.type], true) then
				uv4 = "tabDatas"

				slot4.rightTopPanel:visible(slot3.showRightInfo)

				uv5 = "tabDatas"
				slot5 = slot5.rightTopPanel:get("bg")
				slot5 = slot5.texture

				slot5(slot5, slot2.clientParam.topBg or "activity/banner_activity@.png")

				uv5 = "tabDatas"

				slot5.rightTopPanelName:text(slot2.desc)

				if slot2.clientParam.type == "newNewWorld2" then
					slot3.viewName = "city.activity.new_new_world_gift"
					slot3.showRightInfo = false
				end

				uv5 = "tabDatas"

				if not slot5.subViews[slot0] then
					uv5 = "tabDatas"
					uv9 = "tabDatas"
					slot5.subViews[slot0] = gGameUI:createView(slot3.viewName, slot9):init(slot0, unpack(slot3.params or {}))
				else
					uv5 = "tabDatas"
					slot5 = slot5.subViews[slot0]
					slot5 = slot5.show

					slot5(slot5)

					uv5 = "tabDatas"

					if slot5.subViews[slot0].onInit then
						uv5 = "tabDatas"

						slot5.subViews[slot0]:onInit()
					end
				end

				slot5 = false

				if slot2.type == 12 or slot2.type == 14 then
					slot5 = true
					uv6 = "tabDatas"

					slot6:estimateType(slot2.type)
				end

				uv6 = "tabDatas"

				slot6.iconAll:visible(slot5)
			else
				uv4 = "tabDatas"

				slot4.rightTopPanel:visible(false)
				printWarn("activityType(%d) was not define", slot2.type)
			end

			uv4 = "tabDatas"
			slot4 = slot4.rightTopPanel
			slot5 = slot4
			uv5 = "tabDatas"
			slot5 = slot5.rightTopPanel
			slot6 = slot5
			uv6 = "tabDatas"
			slot7 = slot2.clientParam.isShowCountDown ~= false

			slot4.get(slot5, "timeLabel"):visible(slot7)
			slot5.get(slot6, "time"):visible(slot7)
			slot6.rightTopPanel:get("timeBg"):visible(slot7)

			if slot7 then
				uv8 = "atproxy"
				uv9 = "tabDatas"

				slot8.setCountdown(slot9, slot0, slot4, slot5, {
					labelChangeCb = function ()
						slot0 = adapt.oneLinePos
						uv1 = "adapt"
						uv2 = "oneLinePos"

						slot0(slot1, slot2, cc.p(20, 0))

						uv0 = "cc"
						slot2 = "timeBg"
						uv2 = "adapt"
						slot3 = slot2
						uv3 = "oneLinePos"

						slot0.rightTopPanel:get(slot2):size(slot2.size(slot3).width + slot3:size().width + 35, 50)
					end
				})
			end

			uv9 = "tabDatas"

			slot9.rightTopPanel:get("name"):setVisible(slot2.clientParam.isShowTitle ~= false)
		end
	end)
	idlereasy.when(gGameModel.role:getIdler("yyhuodongs"), function (slot0, slot1)
		uv3 = "csv"

		if csv.yunying.yyhuodong[slot3.activityId:read()].type == 14 then
			uv3 = "csv"

			slot3:estimateType(14)
		end
	end)
	sdk.isBuySubscribe()
end

function slot4.onTabClick(slot0, slot1, slot2, slot3)
	slot0.rightTopPaneltitle:visible(csv.yunying.yyhuodong[slot2].type == 33)

	slot5 = slot0.activityId
	slot5 = slot5.set

	slot5(slot5, slot2)

	uv5 = "csv"

	if slot4 == slot5.monthlyCard then
		sdk.trackEvent("check_monsub")
	end
end

function slot4.onTabData(slot0, slot1, slot2)
	slot3 = {
		[slot10] = {
			selected = false,
			id = slot10,
			sortWeight = csv.yunying.yyhuodong[slot10].sortWeight
		}
	}
	slot4 = {}
	slot5 = false

	for slot9, slot10 in ipairs(slot0.yyOpen) do
		uv11 = "ipairs"

		if slot11.isShow(slot10, slot0.independentStyle, slot0.yyEndtime) then
			table.insert(slot4, slot3[slot10])

			if slot2 and slot2 == slot10 then
				slot3[slot10].selected = true
				slot5 = true
			end
		end
	end

	table.sort(slot4, function (slot0, slot1)
		if slot0.sortWeight ~= slot1.sortWeight then
			return slot0.sortWeight < slot1.sortWeight
		end

		return slot0.id < slot1.id
	end)

	if #slot4 >= 1 then
		slot3[slot4[#slot4].id].isLast = true
	end

	if not slot5 then
		if math.min(slot1, #slot4) <= 0 then
			slot2 = nil

			printWarn("no open activity!!!")
		else
			slot6 = slot3[slot4[slot1].id]
			slot6.selected = true
			slot2 = slot6.id
		end
	end

	slot0.tabDatas:update(slot3)
	slot0.rightTopPaneltitle:visible(csv.yunying.yyhuodong[slot2].type == 33)
	slot0.activityId:set(slot2)
end

function slot4.isShow(slot0, slot1, slot2)
	slot4 = false
	uv6 = "csv"

	for slot8, slot9 in ipairs(slot6[slot1].independent) do
		if csv.yunying.yyhuodong[slot0].independent == slot9 then
			slot4 = true

			break
		end
	end

	if slot4 == false then
		return false
	end

	uv6 = "yunying"

	if slot3.type == slot6.dinnerTime then
		return false
	end

	uv6 = "yunying"

	if slot3.type == slot6.monthlyCard and slot3.paramMap.rechargeID ~= 1 then
		return false
	end

	if not (slot2 or gGameModel.role:read("yy_endtime"))[slot0] or slot2[slot0] - time.getTime() <= 0 then
		return false
	end

	uv6 = "yunying"

	if slot3.type == slot6.Retrieve then
		if gGameModel.role:read("yyhuodongs")[slot0] == nil then
			return false
		end

		if slot6.lastday ~= tonumber(time.getTodayStrInClock()) then
			return false
		end

		if slot6.retrieve_award == nil then
			return true
		end

		slot8 = csv.yunying.retrieve[gGameModel.role:read("level")]
		slot9 = 6

		for slot14, slot15 in pairs(slot6.retrieve_award) do
			if slot15.rmb == 1 then
				slot10 = 0 + 1
			end
		end

		return slot10 < slot9
	end

	uv6 = "yunying"

	if slot3.type == slot6.weeklyCard then
		slot8, slot9 = time.getActivityDate(slot0)

		if (gGameModel.role:read("yyhuodongs")[slot0] or {}).buy == nil then
			if time.getTimestamp(slot8) + csv.yunying.yyhuodong[slot0].paramMap.buyDay * 24 * 60 * 60 - time.getTime() <= 0 then
				return false
			end
		elseif time.getTimestamp(slot9) - time.getTime() <= 0 then
			return false
		end
	end

	uv6 = "yunying"

	if slot3.type == slot6.serverOpen then
		slot5 = slot3.huodongID

		if math.max(time.getNumTimestamp(((gGameModel.role:read("yyhuodongs")[slot0] or {}).info or {}).activeday or time.getDate(time.getTime()), time.getRefreshHour()) + slot3.paramMap.showDay * 86400 - time.getTime(), 0) <= 0 then
			return false
		end
	end

	return true
end

function slot4.isDataExist(slot0)
	for slot5, slot6 in ipairs(gGameModel.role:read("yy_open")) do
		uv7 = "main"

		if slot7.isShow(slot6, slot0 or "main") then
			return true
		end
	end

	return false
end

function slot4.setCountdown(slot0, slot1, slot2, slot3, slot4)
	slot0:enableSchedule():unSchedule((slot4 or {}).tag or 1)

	slot7 = ""

	if csv.yunying.yyhuodong[slot1].countType == 0 then
		slot7 = gLanguageCsv.activityDaily
	end

	slot8 = 0

	bind.extend(slot0, slot3, {
		class = "cutdown_label",
		props = {
			endTime = gGameModel.role:read("yy_endtime")[slot1],
			tag = slot5,
			strFunc = function (slot0)
				uv2 = "str"

				return slot0.str .. slot2
			end,
			callFunc = function ()
				uv0 = "labelChangeCb"

				if slot0.labelChangeCb then
					uv0 = "labelChangeCb"

					slot0.labelChangeCb()
				end
			end,
			endFunc = function ()
				uv0 = "text"
				slot0 = slot0.text

				slot0(slot0, gLanguageCsv.activityOver)

				uv0 = "gLanguageCsv"

				if slot0.labelChangeCb then
					uv0 = "gLanguageCsv"

					slot0.labelChangeCb()
				end
			end,
			onNode = function (slot0)
				uv1 = "text"

				slot1:text(gLanguageCsv.activityLeftTime)
			end
		}
	})
end

function slot4.estimateType(slot0, slot1)
	slot2 = slot0.activityId:read()

	if slot1 == 14 then
		slot7 = 2

		for slot11, slot12 in csvPairs(csv.yunying.generaltask) do
			if slot12.huodongID == csv.yunying.yyhuodong[slot2].huodongID and ((gGameModel.role:read("yyhuodongs")[slot2] or {}).stamps or {})[slot11] == 1 then
				slot7 = 1

				break
			end
		end

		uiEasy.setBtnShader(slot0.iconAll, false, slot7)
		slot0.iconAll:get("txt"):text(gLanguageCsv.getAwardAll)
	else
		slot5 = false

		if userDefault.getForeverLocalKey("activityItemExchange", {})[slot2] or {} then
			for slot9, slot10 in pairs(slot4) do
				if slot10 then
					slot5 = true

					break
				end
			end
		end

		uiEasy.setBtnShader(slot0.iconAll, false, 1)
		slot0.iconAll:get("txt"):text(not slot5 and gLanguageCsv.notRemind or gLanguageCsv.anewRemind)

		return slot5
	end
end

function slot4.oneKeyiconAllBtn(slot0)
	if slot0.subViews[slot0.activityId:read()] and slot0.subViews[slot1]:isVisible() then
		if csv.yunying.yyhuodong[slot1].type == 14 then
			gGameApp:requestServer("/game/yy/award/get/onekey", function (slot0)
				slot1 = gGameUI
				slot1 = slot1.showGainDisplay
				slot3 = slot0

				slot1(slot1, slot3)

				uv1 = "gGameUI"
				uv3 = "showGainDisplay"

				slot1:estimateType(slot3)
			end, slot1)
		else
			slot6 = userDefault.getForeverLocalKey("activityItemExchange", {})[slot1] or {}

			for slot10, slot11 in csvPairs(csv.yunying.itemexchange) do
				if slot11.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
					slot6[slot10] = not slot0:estimateType(slot2) and true or false
				end
			end

			slot5[slot1] = slot6

			gGameModel.forever_dispatch:getIdlerOrigin("activityItemExchange"):set(slot5, true)
			slot0.subViews[slot1]:remindUpdata()
			slot0:estimateType(slot2)
		end
	end
end

return slot4
