slot0 = require("app.views.city.activity.month_card")

function slot1(slot0, slot1, slot2, slot3)
	slot1:get("imgIcon"):hide()
	slot1:get("imgFrag"):hide()
	bind.extend(slot0, slot1, {
		class = "icon_key",
		props = {
			simpleShow = true,
			data = {
				key = slot3.itemId
			},
			specialKey = {
				maxStar = true
			},
			onNode = function (slot0)
				slot3 = false

				slot0:setTouchEnabled(slot3)

				uv3 = "setTouchEnabled"

				slot0:xy(slot3:get("imgIcon"):xy()):scale(1.5):z(2)
			end
		}
	})

	slot4 = csv.mystery_shop[slot3.csvId]
	slot8 = "x" .. slot4.itemCount

	slot1:get("textNum"):text(slot8)

	slot6, slot7 = csvNext(slot4.costMap)
	uv8 = "get"

	slot1:get("btnBuy.icon"):texture(dataEasy.getIconResByKey(slot6))
	slot1:get("btnBuy.txt"):text(math.ceil(tonumber(slot7) * (1 - (slot8.getPrivilegeAddition("mysteryShopDiscount") or 0))))
	adapt.oneLineCenterPos(cc.p(162, 55), {
		slot1:get("btnBuy.icon"),
		slot1:get("btnBuy.txt")
	}, cc.p(10, 0))
	uiEasy.setIconName(slot3.itemId, slot4.itemCount, {
		node = slot1:get("textName")
	})

	slot11 = slot3.leftNum

	if slot4.limitTimes > 0 then
		slot1:get("textLimiteNum"):text(slot11 .. "/" .. slot10)

		slot12 = ui.COLORS.NORMAL.FRIEND_GREEN

		if slot11 == 0 then
			slot12 = ui.COLORS.NORMAL.ALERT_ORANGE
		end

		text.addEffect(slot1:get("textLimiteNum"), {
			color = slot12
		})
	end

	slot1:get("textLimiteNote"):visible(slot10 > 0)
	slot1:get("textLimiteNum"):visible(slot10 > 0)

	if slot4.discountDesc == "" and slot8 < 1 then
		slot12 = dataEasy.getDiscountText(slot8)
	end

	slot1:get("flag"):visible(string.len(slot12) > 0)
	slot1:get("flag.textVal"):text(slot12)

	if matchLanguage({
		"kr",
		"en"
	}) then
		adapt.setTextScaleWithWidth(slot1:get("flag.textVal"), nil, 90)
	end

	slot13 = slot4.vipStart
	slot14 = slot4.levelRange

	slot1:get("lock"):visible(slot11 == 0)
	slot1:setTouchEnabled(true)

	if slot11 == 0 then
		slot1:setTouchEnabled(false)
		slot1:get("lock.textLock"):text(gLanguageCsv.sellout)
		slot1:get("lock.textLock"):x(207)
		slot1:get("lock.imgLock"):visible(false)
		slot1:get("lock.textTip"):visible(false)
	elseif slot0.vip():read() < slot13 or slot0.roleLv():read() < slot14[1] then
		slot1:setTouchEnabled(false)
		slot1:get("lock.imgLock"):visible(true)
		slot1:get("lock.textLock"):text(gLanguageCsv.notUnlock)
		adapt.oneLinePos(slot1:get("lock.imgLock"), slot1:get("lock.textLock"))
		slot1:get("lock.textTip"):text(string.format(gLanguageCsv.levelAndVip, slot14[1], uiEasy.getVipStr(slot13).str))
	end
end

slot3 = class("MysteryShopView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "mystery_shop.json"
slot3.RESOURCE_BINDING = {
	item = "item",
	["info.imgIcon"] = "imgIcon",
	["item.textName"] = "textName",
	slider = "slider",
	["info.textCostNum"] = "textCostNum",
	innerList = "innerList",
	["time.textTime"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("leftTime")
		}
	},
	["info.textRefreshNum"] = {
		varname = "refreshLabel",
		binds = {
			event = "text",
			idler = bindHelper.self("refreshNum")
		}
	},
	["info.btnRefresh"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRefreshItems")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				asyncPreload = 10,
				columnSize = 4,
				data = bindHelper.self("itemsData"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				sliderBg = bindHelper.self("slider"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					uv4 = "bind"

					slot4(slot0, slot1, slot2, slot3)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot3)
						}
					})
				end,
				onBeforeBuild = function (slot0)
					slot1, slot2 = slot0:xy()
					slot3 = slot0:size()
					slot4, slot5 = slot0.sliderBg:xy()
					slot6 = slot0.sliderBg:size()

					slot0:setScrollBarEnabled(true)
					slot0:setScrollBarColor(cc.c3b(241, 59, 84))
					slot0:setScrollBarOpacity(255)
					slot0:setScrollBarAutoHideEnabled(false)
					slot0:setScrollBarPositionFromCorner(cc.p(slot1 + slot3.width - slot4, (slot3.height - slot6.height) / 2 + 5))
					slot0:setScrollBarWidth(slot6.width)
					slot0:refreshView()
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick"),
				roleLv = bindHelper.self("roleLv"),
				vip = bindHelper.self("vip")
			}
		}
	}
}

function slot3.onCreate(slot0)
	slot0.itemsData = idlers.newWithMap({})
	slot0.leftTime = idler.new("")
	slot0.refreshNum = idler.new("")

	slot0:initModel()
	slot0:refreshDatas()
	adapt.setTextAdaptWithSize(slot0.textName, {
		margin = -4,
		vertical = "center",
		maxLine = 2,
		horizontal = "center",
		size = cc.size(370, 80)
	})
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "MYSTERYSHOP",
		title = gLanguageCsv.mysteryShop
	})
	slot0:enableSchedule():schedule(function ()
		slot0, slot1 = uiEasy.isOpenMystertShop()

		if not slot0 then
			slot2 = gGameUI
			slot3 = slot2

			slot2.showTip(slot3, gLanguageCsv.mysteryShopClose)

			uv3 = "uiEasy"

			performWithDelay(slot3, function ()
				uv0 = "onClose"

				slot0:onClose()
			end, 0.016666666666666666)

			return false
		else
			slot3 = slot1
			uv3 = "uiEasy"

			slot3.leftTime:set(time.getCutDown(slot3).str)
		end
	end, 1, 0, 1)
	idlereasy.any({
		slot0.refreshItems,
		slot0.vip
	}, function (slot0, slot1, slot2)
		slot5 = slot1 + 1
		slot4 = math.min(slot5, table.length(gCostCsv.mysteryshop_refresh_cost))
		uv5 = "gCostCsv"
		slot6 = slot5
		uv6 = "gCostCsv"
		slot6 = slot6.textCostNum
		slot7 = slot6
		slot8 = slot5.getCostNum(slot6, slot1)

		slot6.text(slot7, slot8)

		uv7 = "gCostCsv"
		uv8 = "gCostCsv"
		slot8 = slot8.imgIcon

		adapt.oneLinePos(slot7.textCostNum, slot8, nil, "left")

		slot6 = gVipCsv[slot2].mysteryRefresh
		slot7 = slot6 - slot1
		uv8 = "gCostCsv"

		slot8.refreshNum:set(slot7 .. "/" .. slot6)

		slot8 = ui.COLORS.NORMAL.FRIEND_GREEN

		if slot7 == 0 then
			slot8 = ui.COLORS.NORMAL.ALERT_ORANGE
		end

		uv10 = "gCostCsv"

		text.addEffect(slot10.refreshLabel, {
			color = slot8
		})
	end)
end

function slot3.getCostNum(slot0, slot1)
	slot2 = gCostCsv.mysteryshop_refresh_cost

	return slot2[math.min((slot1 or slot0.refreshItems:read()) + 1, table.length(slot2))]
end

function slot3.initModel(slot0)
	slot0.mysteryShopLastTime = gGameModel.mystery_shop:getIdler("last_active_time")
	slot0.items = gGameModel.mystery_shop:getIdler("items")
	slot0.refreshItems = gGameModel.mystery_shop:getIdler("refresh_times")
	slot0.buy = gGameModel.mystery_shop:getIdler("buy")
	slot0.lastTimes = gGameModel.mystery_shop:getIdler("last_times")
	slot0.vip = gGameModel.role:getIdler("vip_level")
	slot0.roleLv = gGameModel.role:getIdler("level")
end

function slot3.refreshDatas(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.items:read()) do
		table.insert(slot1, {
			pos = slot5,
			csvId = slot6[1],
			itemId = slot6[2],
			leftNum = 1 - (slot0.buy:read()[slot5] and 1 or 0),
			sortValue = csv.mystery_shop[slot6[1]].sortValue
		})
	end

	table.sort(slot1, function (slot0, slot1)
		if slot0.sortValue ~= slot1.sortValue then
			return slot0.sortValue < slot1.sortValue
		end

		return slot0.pos < slot1.pos
	end)
	slot0.itemsData:update(slot1)
end

function slot3.onRefreshItems(slot0)
	if gVipCsv[slot0.vip:read()].mysteryRefresh - slot0.refreshItems:read() <= 0 then
		gGameUI:showTip(gLanguageCsv.refreshTimesNotEnough)

		return
	end

	gGameUI:showDialog({
		btnType = 2,
		isRich = true,
		strs = "#C0x5B545B#" .. string.format(gLanguageCsv.shopRefreshCommonBox, slot0:getCostNum()),
		cb = function ()
			gGameApp:requestServer("/game/mystery/refresh", function ()
				slot1 = "myst_refre"

				sdk.trackEvent(slot1)

				slot0 = dataEasy.tryCallFunc
				uv1 = "sdk"

				slot0(slot1.list, "setItemAction", {
					isAction = true
				})

				uv0 = "sdk"

				slot0:refreshDatas()
				gGameUI:showTip(gLanguageCsv.refreshSuccessful)
			end)
		end,
		dialogParams = {
			clickClose = false
		}
	})
end

function slot3.onItemClick(slot0, slot1, slot2, slot3)
	if slot3.leftNum <= 0 then
		return
	end

	slot5 = slot3.csvId
	slot4 = csv.mystery_shop[slot5]
	uv5 = "leftNum"

	gGameUI:stackUI("common.buy_info", nil, , slot4.costMap, {
		id = slot3.itemId,
		num = slot4.itemCount
	}, {
		discount = 1 - (slot5.getPrivilegeAddition("mysteryShopDiscount") or 0)
	}, slot0:createHandler("buyItemCallBack", slot4, slot2, slot3))
end

function slot3.buyItemCallBack(slot0, slot1, slot2, slot3)
	gGameApp:requestServer("/game/mystery/buy", function (slot0)
		slot1 = gGameUI
		slot1 = slot1.showGainDisplay
		slot3 = {
			{
				slot5,
				slot5.itemCount
			}
		}
		uv5 = "gGameUI"
		slot5 = slot5.itemId
		uv5 = "showGainDisplay"
		slot4 = {
			raw = false
		}

		slot1(slot1, slot3, slot4)

		uv1 = "itemId"
		slot1 = slot1.itemsData
		slot2 = slot1
		uv3 = "itemCount"
		slot1 = slot1.atproxy(slot2, slot3.k)
		uv2 = "itemId"
		uv4 = "itemCount"
		slot1.leftNum = slot2.itemsData:atproxy(slot4.k).leftNum - 1
		uv1 = "gGameUI"

		if slot1.itemId == 525 then
			sdk.trackEvent("myst_master")
		end
	end, slot3.pos, slot3.csvId, slot3.itemId)
end

return slot3
