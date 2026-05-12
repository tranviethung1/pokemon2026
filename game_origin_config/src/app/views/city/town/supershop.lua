slot0 = class("TownSupershopView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "town_supershop.json"
slot0.RESOURCE_BINDING = {
	currencyPanel = "currencyPanel",
	["centerPanel.item"] = "item",
	["currencyPanel.num"] = "currencyNumLabel",
	refreshPanel = "refreshPanel",
	tip = "tip",
	["centerPanel.subList"] = "subList",
	countdown = {
		varname = "textCountdown",
		binds = {
			event = "text",
			idler = bindHelper.self("countdown"),
			method = function (slot0)
				return string.format(gLanguageCsv.nextRefreshTime, time.getCutDown(slot0).str)
			end
		}
	},
	["refreshPanel.btn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRefreshClick")
			}
		}
	},
	["centerPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				asyncPreload = 12,
				data = bindHelper.self("shopData"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					actionTime = 0.2,
					duration = 0.1,
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = csv.town.supermarket[slot3.csvID]
					slot5 = slot1:multiget("name", "icon", "num", "btnBuy", "maskPanel")

					slot5.icon:hide()
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							simpleShow = true,
							data = {
								key = slot3.itemID
							},
							specialKey = {
								maxStar = true
							},
							onNode = function (slot0)
								slot3 = false

								slot0:setTouchEnabled(slot3)

								uv3 = "setTouchEnabled"

								slot0:xy(slot3.icon:xy()):scale(1.5):z(3)
							end
						}
					})

					slot6 = uiEasy.setIconName(slot3.itemID, nil, {
						node = slot5.name
					})
					slot7 = slot1:width() - 150

					if matchLanguage({
						"en",
						"kr"
					}) then
						adapt.setTextAdaptWithSize(slot5.name, {
							margin = -5,
							vertical = "center",
							maxLine = 2,
							horizontal = "center",
							size = cc.size(slot1:width() - 150, 120)
						})
					else
						adapt.setTextScaleWithWidth(slot5.name, slot5.name:text(), slot1:width() - 150)
					end

					slot5.num:text("x" .. mathEasy.getShortNumber(slot4.itemCount))

					slot8 = slot5.btnBuy:multiget("txt", "icon")
					slot9, slot10 = csvNext(slot4.costMap)

					slot8.icon:texture(dataEasy.getIconResByKey(slot9))
					slot8.txt:text(slot10)
					adapt.oneLineCenterPos(cc.p(slot5.btnBuy:width() / 2, slot5.btnBuy:height() / 2), {
						slot8.icon,
						slot8.txt
					}, cc.p(10, 0))

					slot11 = slot4.limitType ~= 0
					slot12 = slot4.limitTimes
					slot14 = nil

					if not slot3.lockShow and (gGameModel.town:read("buildings")[1].level < slot4.centerBuildingRange[1] or slot4.centerBuildingRange[2] < slot15) then
						slot13 = true
						slot14 = gLanguageCsv.buildingCenter .. string.format(gLanguageCsv.reachLevelCanBuy, slot4.centerBuildingRange[1])
					end

					slot1:removeChildByName("emm")
					slot5.maskPanel:hide()

					slot15 = slot5.maskPanel:multiget("bg", "lockTxt", "lock", "lockCondition", "txt")

					slot15.bg:size(405, 496)
					itertools.invoke(slot15, "visible", false)
					slot15.txt:show()
					slot1:setTouchEnabled(true)

					if slot13 then
						slot5.maskPanel:show()
						slot15.bg:visible(true)
						itertools.invoke(slot15, "visible", true)
						slot15.txt:hide()

						if slot14 then
							slot15.lockCondition:text(slot14)
						end

						slot1:setTouchEnabled(false)
					elseif slot11 then
						slot16, slot17 = nil

						if slot4.limitType == 1 then
							slot17 = slot12

							if tonumber(slot3.shopLimit[2]) == tonumber(time.getTodayStrInClock()) then
								slot17 = math.max(slot12 - (slot3.shopLimit[1] or 0), 0)
							end

							slot16 = string.format(gLanguageCsv.currDayBuyLimit, slot17, slot12)
						elseif slot4.limitType == 2 then
							slot17 = slot12

							if tonumber(slot3.shopLimit[2]) == tonumber(time.getWeekStrInClock()) then
								slot17 = math.max(slot12 - (slot3.shopLimit[1] or 0), 0)
							end

							slot16 = string.format(gLanguageCsv.currWeekBuyLimit, slot17, slot12)
						elseif slot4.limitType == 3 then
							slot17 = slot12

							if tonumber(slot3.shopLimit[2]) == tonumber(time.getMonthStrInClock()) then
								slot17 = math.max(slot12 - (slot3.shopLimit[1] or 0), 0)
							end

							slot16 = string.format(gLanguageCsv.currMonthBuyLimit, slot17, slot12)
						else
							slot16 = string.format(gLanguageCsv.foreverBuyLimit, math.max(slot3.shopLimit[1] and slot12 - slot3.shopLimit[1] or slot12, 0), slot12)
						end

						slot5.maskPanel:visible(slot17 == 0)
						slot15.bg:visible(slot17 == 0)

						slot18 = rich.createByStr(slot16, 40)

						slot18:formatText()
						slot18:addTo(slot1, 10, "emm"):xy(slot5.btnBuy:x(), slot5.btnBuy:y() + 65)
						slot1:setTouchEnabled(slot17 ~= 0)
						cache.setShader(slot5.btnBuy, false, slot17 == 0 and "hsl_gray" or "normal")
						cache.setShader(slot8.icon, false, slot17 == 0 and "hsl_gray" or "normal")
					else
						slot5.maskPanel:visible(slot3.buyTimes == true)
						slot15.bg:visible(slot3.buyTimes == true)
						cache.setShader(slot5.btnBuy, false, slot3.buyTimes and "hsl_gray" or "normal")
						cache.setShader(slot8.icon, false, slot3.buyTimes and "hsl_gray" or "normal")

						if slot3.buyTimes then
							text.addEffect(slot8.txt, {
								color = ui.COLORS.DISABLED.WHITE
							})
						else
							text.addEffect(slot8.txt, {
								color = ui.COLORS.NORMAL.WHITE
							})
						end

						slot1:setTouchEnabled(slot3.buyTimes ~= true)
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot0.onCreate(slot0)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "SUPERMARKET",
		title = gLanguageCsv.townSupermarket
	})
	slot0:initModel()
	slot0.currencyPanel:get("icon"):texture(dataEasy.getIconResByKey("coin16"))

	slot0.currencyNum = idler.new()

	idlereasy.when(dataEasy.getListenNumByKey("coin16"), function (slot0, slot1)
		uv2 = "currencyNumLabel"

		slot2.currencyNumLabel:text(slot1)

		slot5 = 45
		uv5 = "currencyNumLabel"
		slot5 = slot5.currencyPanel:get("icon")
		uv5 = "currencyNumLabel"

		adapt.oneLineCenterPos(cc.p(115, slot5), {
			slot5,
			slot5.currencyPanel:get("num")
		}, cc.p(10, 0))
	end)
	slot0.tip:text(gLanguageCsv.townSupermarketTip)
	text.addEffect(slot0.tip, {
		color = cc.c4b(245, 90, 0, 255),
		outline = {
			color = cc.c4b(255, 255, 255, 255)
		}
	})
	adapt.setTextAdaptWithSize(slot0.tip, {
		size = cc.size(250, 180)
	})
	idlereasy.when(slot0.townShopRefreshTimes, function (slot0, slot1)
		slot1 = slot1 or 0
		slot3 = gVipCsv[gGameModel.role:read("vip_level")].townShopRefreshLimit
		slot4 = slot3 - slot1
		uv5 = "gGameModel"
		slot5.leftTimes = slot4
		slot7 = csvSize
		slot6 = gCostCsv.townshop_refresh_cost[math.min(slot1 + 1, slot7(gCostCsv.townshop_refresh_cost))]
		uv7 = "gGameModel"
		slot7.curRefreshCost = slot6
		uv7 = "gGameModel"
		slot7 = slot7.refreshPanel:multiget("txt1", "icon", "cost", "txt2", "times", "txt3", "btn")

		slot7.cost:text(slot6)
		slot7.times:text(string.format("%d/%d", slot4, slot3))
		text.addEffect(slot7.times, {
			color = slot4 == 0 and ui.COLORS.NORMAL.ALERT_ORANGE or ui.COLORS.NORMAL.LIGHT_GREEN
		})
		adapt.oneLinePos(slot7.btn, {
			slot7.txt3,
			slot7.times,
			slot7.txt2,
			slot7.cost,
			slot7.icon,
			slot7.txt1
		}, {
			cc.p(5, 0),
			cc.p(5, 0),
			cc.p(5, 0),
			cc.p(30, 0),
			cc.p(0, 0),
			cc.p(0, 0)
		}, "right")
	end)

	slot0.shopData = idlers.new()

	idlereasy.any({
		slot0.townShopItems,
		slot0.townShopBuy,
		slot0.shopLimit,
		slot0.vipLevel,
		slot0.level
	}, function ()
		uv0 = "initData"

		slot0:initData()
	end)

	slot0.countdown = idler.new(slot0:getTimeShow())

	slot0:enableSchedule():schedule(function ()
		uv0 = "countdown"

		slot0.countdown:modify(function (slot0)
			if slot0 == 0 then
				uv1 = "initData"
				slot2 = slot1

				slot1.initData(slot2)

				uv2 = "initData"

				return true, slot2:getTimeShow()
			end

			return true, slot0 - 1
		end)
	end, 1)
end

function slot0.initModel(slot0)
	slot0.townShopRefreshTimes = gGameModel.daily_record:getIdler("town_shop_refresh_times")
	slot0.townShopItems = gGameModel.town_shop:getIdler("items")
	slot0.townShopBuy = gGameModel.town_shop:getIdler("buy")
	slot0.shopLimit = gGameModel.role:getIdler("shop_limit")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.level = gGameModel.role:getIdler("level")
end

function slot0.initData(slot0)
	slot4 = {}

	for slot8, slot9 in pairs(slot0.townShopItems:read()) do
		table.insert(slot4, {
			index = slot8,
			csvID = slot9[1],
			itemID = slot9[2],
			buyTimes = (slot0.townShopBuy:read() or {})[slot8],
			shopLimit = (slot0.shopLimit:read().town_shop or {})[slot8] or {}
		})
	end

	table.sort(slot4, function (slot0, slot1)
		return slot0.index < slot1.index
	end)
	dataEasy.tryCallFunc(slot0.list, "updatePreloadCenterIndex")
	slot0.shopData:update(slot4)
end

function slot0.getTimeShow(slot0)
	slot1 = time.getNowDate()
	slot3 = 0

	for slot7, slot8 in ipairs({
		time.getRefreshHour()
	}) do
		if slot1.hour < slot8 then
			slot3 = slot7

			break
		end
	end

	return time.getTimestamp({
		year = slot1.year,
		month = slot1.month,
		day = slot3 == 0 and slot1.day + 1 or slot1.day,
		hour = slot2[slot3 == 0 and 1 or slot3]
	}) - time.getTime()
end

function slot0.onRefreshClick(slot0)
	if slot0.leftTimes <= 0 then
		gGameUI:showTip(gLanguageCsv.refreshLimit)

		return
	end

	if gGameModel.role:read("rmb") < slot0.curRefreshCost then
		uiEasy.showDialog("rmb")

		return
	end

	gGameUI:showDialog({
		btnType = 2,
		isRich = true,
		strs = "#C0x5B545B#" .. string.format(gLanguageCsv.shopRefreshCommonBox, slot0.curRefreshCost),
		cb = function ()
			gGameApp:requestServer("/game/town/shop/refresh", function (slot0)
				gGameUI:showTip(gLanguageCsv.refreshSuccessful)
			end, false)
		end,
		dialogParams = {
			clickClose = false
		}
	})
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	slot4 = slot0.shopData:atproxy(slot2.k)
	slot0.data = slot4
	slot5 = csv.town.supermarket[slot4.csvID]
	slot0.num = slot5.itemCount
	slot6 = nil
	slot7 = 1
	slot8 = {
		function ()
			uv1 = "tonumber"

			return tonumber(slot1.shopLimit[2]) == tonumber(time.getTodayStrInClock())
		end,
		function ()
			uv1 = "tonumber"

			return tonumber(slot1.shopLimit[2]) == tonumber(time.getWeekStrInClock())
		end,
		function ()
			uv1 = "tonumber"

			return tonumber(slot1.shopLimit[2]) == tonumber(time.getMonthStrInClock())
		end,
		function ()
			return true
		end
	}

	if slot5.limitType and slot5.limitType > 0 then
		if slot8[slot5.limitType] or slot8[4]() then
			slot7 = slot5.limitTimes - (slot3.shopLimit[1] or 0)
		end

		slot6 = "num"
	end

	gGameUI:stackUI("common.buy_info", nil, , slot5.costMap, {
		id = slot4.itemID,
		num = slot0.num
	}, {
		maxNum = slot7,
		contentType = slot6
	}, slot0:createHandler("showBuyInfo"))
end

function slot0.showBuyInfo(slot0, slot1)
	gGameApp:requestServer("/game/town/shop/buy", function (slot0)
		uv5 = "gGameUI"
		slot5 = slot5.data.itemID
		uv5 = "gGameUI"
		uv6 = "showGainDisplay"

		gGameUI:showGainDisplay({
			{
				slot5,
				slot5.num * slot6
			}
		}, {
			raw = false
		})
	end, slot0.data.index, slot0.data.csvID, slot0.data.itemID, slot1)
end

return slot0
