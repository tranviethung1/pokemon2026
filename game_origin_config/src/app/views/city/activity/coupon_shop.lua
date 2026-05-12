slot0 = {
	canbuy = 1,
	refresh = 2,
	sellout = 3
}
slot1 = class("CouponShop", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "coupon_shop.json"
slot1.RESOURCE_BINDING = {
	time = "time",
	timeText = "timeText",
	["singlePanel.subList"] = "singleSublist",
	["couponPanel.text"] = "couponText",
	singlePanel = "singlePanel",
	["singlePanel.item"] = "singleItem",
	["singlePanel.centerList"] = {
		varname = "singleList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				asyncPreload = 12,
				data = bindHelper.self("singleDatas"),
				item = bindHelper.self("singleSublist"),
				cell = bindHelper.self("singleItem"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.state ~= slot1.state then
						return slot0.state < slot1.state
					end

					if slot0.sort ~= slot1.sort then
						return slot0.sort < slot1.sort
					end

					return slot0.csvId < slot1.csvId
				end,
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg
					slot6, slot7 = uiEasy.setIconName(slot3.id, slot3.num)

					slot1:multiget("title", "tip", "mask", "item", "icon", "num", "btnBuy").title:text(slot6)

					if matchLanguage({
						"en",
						"kr"
					}) then
						adapt.setTextAdaptWithSize(slot5.title, {
							margin = -5,
							vertical = "center",
							maxLine = 2,
							horizontal = "center",
							size = cc.size(slot1:width() - 150, 120)
						})
					end

					text.addEffect(slot5.title, slot7)

					if slot4.refresh then
						slot5.tip:text(string.format(gLanguageCsv.directBuyGiftDailyBuy, slot3.leftTimes, slot4.buyMax))
					else
						slot5.tip:text(string.format(gLanguageCsv.directBuyGiftOnetimeBuy, slot3.leftTimes, slot4.buyMax))
						text.addEffect(slot5.tip, {
							color = ui.COLORS.QUALITY[4]
						})
					end

					bind.extend(slot0, slot5.icon, {
						class = "icon_key",
						props = {
							simpleShow = true,
							data = {
								key = slot3.id,
								num = slot3.id == "card" and slot3.num or nil
							},
							onNode = function (slot0)
								slot0:scale(1.2)
							end
						}
					})

					if slot3.id ~= "card" then
						slot5.num:text("x" .. slot3.num):show()
					else
						slot5.num:hide()
					end

					slot8 = slot5.btnBuy
					slot9 = slot5.btnBuy:get("text")
					slot10 = slot5.btnBuy:get("coupon")

					slot8:setTouchEnabled(false)
					cache.setShader(slot8, false, "normal")
					slot9:text(slot3.costNum)
					slot10:x(slot8:width() / 2 - slot10:getBoundingBox().width - slot9:size().width / 2 + 20)

					slot14 = slot10

					adapt.oneLinePos(slot14, slot9, cc.p(10, 0), "left")

					uv14 = "cfg"

					if slot3.state == slot14.canbuy then
						slot5.mask:hide()
						slot8:setTouchEnabled(true)
						bind.touch(slot0, slot8, {
							clicksafe = true,
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
						text.addEffect(slot9, {
							outline = {
								size = 10,
								color = cc.c4b(129, 61, 45, 25)
							},
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						slot5.mask:show()
						cache.setShader(slot8, false, "hsl_gray")
						text.deleteAllEffect(slot9)

						slot14 = slot9

						text.addEffect(slot14, {
							color = ui.COLORS.DISABLED.WHITE
						})

						uv14 = "cfg"

						if slot3.state == slot14.sellout then
							slot5.mask:get("label"):text(gLanguageCsv.sellout)
						else
							slot5.mask:get("label"):text(gLanguageCsv.nextDayRefresh5)
						end
					end

					slot0:setRenderHint(0)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBuyClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0:initTitle()
	slot0:initModel()
	slot0:initData()

	slot0.couponNum = 0
	slot2 = csv.yunying.yyhuodong[slot0.activityId]
	slot3 = slot2.huodongID
	slot0.yyCfg = slot2

	slot0:initCountDown()

	slot0.clientBuyTimes = idler.new(true)

	idlereasy.any({
		slot0.yyhuodongs,
		slot0.clientBuyTimes
	}, function (slot0, slot1, slot2)
		uv3 = "activityId"
		slot5 = {}

		for slot9, slot10 in csvPairs(csv.yunying.itembuy2) do
			uv12 = "stamps"

			if slot10.huodongID == slot12 then
				uv11 = "csvPairs"
				slot11 = slot11.canbuy

				if math.max(0, slot10.buyMax - (((slot1[slot3.activityId] or {}).stamps or {})[slot9] or 0)) == 0 then
					if slot10.refresh then
						uv13 = "csvPairs"
						slot11 = slot13.refresh
					else
						uv13 = "csvPairs"
						slot11 = slot13.sellout
					end
				end

				slot13, slot14 = csvNext(slot10.item)
				slot15, slot16 = csvNext(slot10.costMap)

				table.insert(slot5, {
					csvId = slot9,
					id = slot13,
					num = slot14,
					costId = slot15,
					costNum = slot16,
					cfg = slot10,
					state = slot11,
					leftTimes = slot12
				})
			end
		end

		slot7 = slot5

		table.sort(slot7, function (slot0, slot1)
			if slot0.state ~= slot1.state then
				return slot0.state < slot1.state
			end

			return slot0.csvId < slot1.csvId
		end)

		slot6 = dataEasy.tryCallFunc
		uv7 = "activityId"

		slot6(slot7.singleList, "updatePreloadCenterIndex")

		uv6 = "activityId"
		slot6 = slot6.singleDatas
		slot7 = slot6

		slot6.update(slot7, slot5)

		uv7 = "activityId"
		slot7 = slot7.itemID
		uv7 = "activityId"
		slot7.couponNum = dataEasy.getNumByKey(slot7)
		uv7 = "activityId"
		uv9 = "activityId"

		slot7.couponText:text(slot9.couponNum)
	end)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyOpen = gGameModel.role:getIdler("yy_open")
	slot0.singleDatas = idlers.new()
end

function slot1.initData(slot0)
	slot0.itemID = 6393
end

function slot1.initTitle(slot0)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "ACTIVITY SHOP",
		title = gLanguageCsv.couponShop
	})
end

function slot1.onBuyClick(slot0, slot1, slot2, slot3)
	if slot0.couponNum < slot3.cfg.costMap[slot3.costId] then
		uiEasy.showDialog(slot0.itemID)

		return
	end

	gGameUI:stackUI("common.buy_info", nil, , slot3.cfg.costMap, {
		id = slot3.id,
		num = slot3.num
	}, {
		style = 2,
		contentType = "num",
		maxNum = slot3.leftTimes
	}, slot0:createHandler("getBuyInfoCb", slot3.csvId))
end

function slot1.getBuyInfoCb(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot1, slot2)
end

function slot1.initCountDown(slot0)
	bind.extend(slot0, slot0.time, {
		class = "cutdown_label",
		props = {
			endTime = gGameModel.role:read("yy_endtime")[slot0.activityId] or 0,
			callFunc = function (slot0)
				uv2 = "adapt"
				uv3 = "oneLinePos"

				adapt.oneLinePos(slot2.timeText, slot3, cc.p(2, 0))
			end,
			endFunc = function ()
				uv0 = "time"

				slot0.time:text(gLanguageCsv.activityOver)
			end
		}
	})
end

return slot1
