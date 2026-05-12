slot0 = {
	canbuy = 1,
	refresh = 2,
	sellout = 3
}
slot1 = require("app.views.city.activity.view")
slot2 = class("ActivityDirectBuyGiftView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "activity_direct_buy_gift.json"
slot2.RESOURCE_BINDING = {
	item = "item",
	icon404 = "icon404",
	time = "time",
	rightBg = "rightBg",
	bg404 = "bg404",
	listitem = "listitem",
	["rightPanel.item"] = "rightItem",
	rightPanel = "rightPanel",
	["rightPanel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("rightData"),
				item = bindHelper.self("rightItem"),
				showTab = bindHelper.self("showTab"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot6:get("name"):text(slot3.desc)

					if matchLanguage({
						"kr"
					}) then
						adapt.setTextScaleWithWidth(slot6:get("name"), nil, 250)
					elseif matchLanguage({
						"en"
					}) then
						adapt.setTextAdaptWithSize(slot6:get("name"), {
							margin = -5,
							vertical = "center",
							maxLine = 2,
							horizontal = "center",
							size = cc.size(255, 70)
						})
					end

					bind.extend(slot0, slot1, {
						class = "red_hint",
						props = {
							specialTag = "activityDirectBuyGiftExternal",
							state = slot0.showTab:read() ~= slot2,
							listenData = {
								id = slot3.id,
								huodongID = csv.yunying.yyhuodong[slot3.id].huodongID
							},
							onNode = function (slot0)
								slot0:xy(280, 120)
							end
						}
					})
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCellItem, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCellItem = bindHelper.self("onLeftItemClick")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				asyncPreload = 9,
				data = bindHelper.self("datas"),
				item = bindHelper.self("listitem"),
				cell = bindHelper.self("item"),
				columnSize = bindHelper.self("rightColumnSize"),
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
					slot5 = slot1:multiget("title", "times", "bottomPanel", "mask", "list", "item", "icon")

					slot5.title:text(slot4.name)
					slot5.title:x(slot1:width() / 2)
					slot5.title:y(640)
					adapt.setTextAdaptWithSize(slot5.title, {
						margin = -8,
						vertical = "top",
						maxLine = 2,
						horizontal = "center",
						size = cc.size(330, 70)
					})
					slot5.icon:texture(slot4.icon)

					if slot4.refresh then
						slot5.times:text(string.format(gLanguageCsv.directBuyGiftDailyBuy, slot3.leftTimes, slot4.limit))
						text.addEffect(slot5.times, {
							color = ui.COLORS.DISABLED.YELLOW
						})
					else
						slot6 = gLanguageCsv.directBuyGiftOnetimeBuy

						if slot3.status == 1 then
							slot6 = gLanguageCsv.directBuyGiftWeek
						elseif slot3.status == 2 then
							slot6 = gLanguageCsv.directBuyGiftMonth
						end

						slot5.times:text(string.format(slot6, slot3.leftTimes, slot4.limit))
						text.addEffect(slot5.times, {
							color = ui.COLORS.QUALITY[4]
						})
					end

					slot5.list:removeAllChildren()
					slot5.list:setScrollBarEnabled(false)
					slot5.list:setGravity(ccui.ListViewGravity.bottom)

					slot6 = 0
					slot8 = csvSize(slot4.item) == 1 and slot5.item:size().width / 2 or 0

					for slot12, slot13 in ipairs(dataEasy.getItemData(slot4.item)) do
						slot16 = slot5.item:clone():show()
						slot17 = slot16:size()

						bind.extend(slot0, slot16, {
							class = "icon_key",
							props = {
								data = {
									key = slot13.key,
									num = slot13.num
								},
								onNode = function (slot0)
									uv3 = "xy"
									uv4 = "width"
									uv4 = "xy"

									slot0:xy(slot3.width / 2 + slot4, slot4.height / 2):scale(0.8)
								end
							}
						})
						slot5.list:pushBackCustomItem(slot16)
					end

					slot5.list:adaptTouchEnabled():setItemAlignCenter()

					slot9 = slot5.bottomPanel:get("btn")
					slot10 = slot5.bottomPanel:get("panel")
					slot11 = slot5.bottomPanel:get("panel"):get("price")

					slot9:setTouchEnabled(false)
					slot5.bottomPanel:get("panel"):get("rmb"):visible(false)
					cache.setShader(slot9, false, "normal")

					if slot3.rmb then
						slot13 = 40

						slot11:text(slot3.rmb)

						if type(slot3.rmb) ~= "string" then
							slot12:visible(true)
							slot11:x(slot12:width() / 2 + slot11:width() / 2 + slot12:x())

							slot13 = 70
						end

						slot5.bottomPanel:get("panel"):width(slot11:width() + slot12:width())
						slot5.bottomPanel:get("panel"):x(slot9:x() - slot13)
					elseif slot3.price then
						slot11:text(string.format(gLanguageCsv.symbolMoney, slot3.price))
					end

					slot13 = slot3.rmb and type(slot3.rmb) == "string" and true or false
					uv15 = "cfg"

					if slot3.state == slot15.canbuy then
						slot5.mask:hide()
						slot9:setTouchEnabled(true)
						bind.touch(slot0, slot9, {
							clicksafe = true,
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
						text.addEffect(slot11, {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						slot5.mask:show()

						slot13 = false

						cache.setShader(slot9, false, "hsl_gray")
						text.deleteAllEffect(slot11)

						slot15 = slot11

						text.addEffect(slot15, {
							color = ui.COLORS.DISABLED.WHITE
						})

						uv15 = "cfg"

						if slot3.state == slot15.sellout then
							slot5.mask:get("label"):text(gLanguageCsv.sellout)
						else
							slot5.mask:get("label"):text(string.format(gLanguageCsv.nextDayRefreshFormat, time.getRefreshHour()))
						end
					end

					if matchLanguage({
						"en"
					}) then
						slot11:anchorPoint(0.5, 0.5)
						slot10:x(slot9:size().width / 2)
						slot5.mask:get("img"):size(slot5.mask:get("label"):size().width + 45, slot5.mask:get("img"):size().height)
					end

					bind.extend(slot0, slot5.bottomPanel, {
						class = "red_hint",
						props = {
							state = slot13,
							onNode = function (slot0)
								slot0:xy(355, 110)
							end
						}
					})
					slot0:setRenderHint(0)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBuyClick")
			}
		}
	}
}

function slot2.onCreate(slot0)
	sdk.trackEvent("op_pack")

	slot5 = {
		onClose = slot6
	}
	slot6 = slot0:createHandler("onClose")

	gGameUI.topuiManager:createView("default", slot0, slot5):init({
		subTitle = "SPECIAL GIFT BAG",
		title = gLanguageCsv.specialGiftBag
	})
	slot0:initModel()

	slot1 = {}

	for slot5, slot6 in ipairs(slot0.yyOpen:read()) do
		if csv.yunying.yyhuodong[slot6].type == game.YYHUODONG_TYPE_ENUM_TABLE.directBuyGift and (slot7.independent == 1 or slot7.independent == 2) and not slot7.clientParam.double11 then
			table.insert(slot1, {
				desc = slot7.desc,
				id = slot6,
				sortWeight = slot7.sortWeight
			})
		end
	end

	table.sort(slot1, function (slot0, slot1)
		if slot0.sortWeight ~= slot1.sortWeight then
			return slot0.sortWeight < slot1.sortWeight
		end

		return slot0.id < slot1.id
	end)
	slot0.time:hide()

	if slot1[1].id then
		slot0.icon404:visible(false)
		slot0.bg404:visible(false)
		slot0.rightData:update(slot1)
		slot0.activityId:set(slot2)

		slot0.rightColumnSize = 3

		slot0.showTab:addListener(function (slot0, slot1, slot2)
			uv3 = "rightData"
			slot3 = slot3.rightData:atproxy(slot1)
			slot3.select = false
			uv3 = "rightData"
			slot4 = true
			slot3.rightData:atproxy(slot0).select = slot4
			uv4 = "rightData"

			if csv.yunying.yyhuodong[slot4.activityId:read()].clientParam.isShowCountDown ~= false then
				uv4 = "rightData"
				slot4 = slot4.time
				slot4 = slot4.show

				slot4(slot4)

				uv4 = "rightData"
				slot4 = slot4.time
				slot5 = slot4
				slot4 = slot4.get(slot5, "icon")
				uv5 = "rightData"
				slot5 = slot5.time
				slot6 = slot5
				uv6 = "rightData"
				slot6 = slot6.time
				slot7 = slot6
				slot8 = "time"
				uv7 = "atproxy"
				uv8 = "rightData"
				uv9 = "rightData"

				slot7.setCountdown(slot8, slot9.activityId:read(), slot5.get(slot6, "title"), slot6.get(slot7, slot8), {
					tag = 1,
					labelChangeCb = function ()
						uv1 = "adapt"
						uv3 = "oneLinePos"
						uv3 = "cc"

						adapt.oneLinePos(slot1, {
							slot3,
							slot3
						}, cc.p(5, 0), "right")
					end
				})

				return
			end

			uv4 = "rightData"

			slot4.time:hide()
		end)
		slot0.time:visible(csv.yunying.yyhuodong[slot2].clientParam.isShowCountDown ~= false)
		gGameModel.currday_dispatch:getIdlerOrigin("activityDirectBuyGift"):set(true)

		slot0.clientBuyTimes = idler.new(true)

		idlereasy.any({
			slot0.yyhuodongs,
			slot0.clientBuyTimes,
			slot0.activityId
		}, function (slot0, slot1, slot2, slot3)
			slot7 = {}

			for slot11, slot12 in csvPairs(csv.yunying.directbuygift) do
				if slot12.huodongID == csv.yunying.yyhuodong[slot3].huodongID then
					uv13 = "csv"

					if slot12.levelLimit <= slot13.level then
						uv13 = "yunying"
						slot13 = slot13.canbuy
						slot16 = slot12.status

						if math.max(0, slot12.limit - dataEasy.getPayClientBuyTimes("directBuyData", slot3, slot11, ((slot1[slot3] or {}).stamps or {})[slot11] or 0)) == 0 then
							if slot12.refresh then
								uv17 = "yunying"
								slot13 = slot17.refresh
							else
								uv17 = "yunying"
								slot13 = slot17.sellout
							end
						end

						slot17, slot18 = nil

						if slot12.rmbCost == 0 then
							slot17 = gLanguageCsv.freeToReceive
						elseif slot12.rmbCost >= 1 then
							slot17 = slot12.rmbCost
						else
							slot18 = csv.recharges[slot12.rechargeID].rmbDisplay
						end

						table.insert(slot7, {
							csvId = slot11,
							cfg = slot12,
							state = slot13,
							buyTimes = slot14,
							leftTimes = slot15,
							price = slot18,
							rmb = slot17,
							status = slot16,
							sort = slot12.sort
						})
					end
				end
			end

			uv8 = "csv"

			if not slot8.isTabChange then
				uv9 = "csv"

				dataEasy.tryCallFunc(slot9.list, "updatePreloadCenterIndex")
			else
				uv8 = "csv"
				slot8.isTabChange = false
			end

			uv8 = "csv"

			slot8.datas:update(slot7)
		end)
	else
		slot0.rightBg:visible(false)
	end
end

function slot2.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyOpen = gGameModel.role:getIdler("yy_open")
	slot0.level = gGameModel.role:read("level")
	slot0.activityId = idler.new()
	slot0.rightData = idlers.new()
	slot0.datas = idlers.new()
	slot0.showTab = idler.new(1)

	slot0.rightItem:visible(false)
end

function slot2.onLeftItemClick(slot0, slot1, slot2, slot3)
	if slot0.activityId:read() ~= slot3.id then
		dataEasy.tryCallFunc(slot0.list, "setItemAction", {
			isAction = true
		})

		slot0.isTabChange = true

		slot0.activityId:set(slot3.id)
		slot0.showTab:set(slot2)

		if slot2 == 3 then
			sdk.trackEvent("check_allpack")
		end
	end
end

function slot2.onBuyClick(slot0, slot1, slot2, slot3)
	if not slot3.rmb then
		gGameApp:payDirect(slot0, {
			rechargeId = slot3.cfg.rechargeID,
			yyID = slot0.activityId:read(),
			csvID = slot3.csvId,
			name = slot3.cfg.name,
			buyTimes = slot3.buyTimes
		}, slot0.clientBuyTimes):doit()
	else
		gGameApp:requestServer("/game/yy/award/get", function (slot0)
			uv1 = "clientBuyTimes"
			slot1 = slot1.clientBuyTimes
			slot2 = slot1

			slot1.notify(slot2)

			uv2 = "notify"

			gGameUI:showGainDisplay(csv.yunying.directbuygift[slot2.csvId].item, {
				raw = false
			})
		end, slot4, slot3.csvId)
	end
end

return slot2
