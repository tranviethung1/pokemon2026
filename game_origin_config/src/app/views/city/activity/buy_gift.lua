slot0 = {
	canbuy = 1,
	refresh = 2,
	sellout = 3
}
slot1 = class("ActivityBuyGiftView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "direct_buy_gift.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
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
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg

					slot1:multiget("title", "times", "bottomPanel", "mask", "list", "subList", "item").title:text(slot4.name)

					if slot4.refresh then
						slot5.times:text(string.format(gLanguageCsv.directBuyGiftDailyBuy, slot3.leftTimes, slot4.limit))
						text.addEffect(slot5.times, {
							color = ui.COLORS.QUALITY[5]
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

					slot6 = nil
					slot9 = csvSize(slot4.item) == 1 and slot5.item:size().width / 2 or 0

					for slot13, slot14 in ipairs(dataEasy.getItemData(slot4.item)) do
						slot15 = slot14.key
						slot16 = slot14.num

						if (0 + 1) % 2 == 1 then
							slot6 = slot5.subList:clone():show():tag(math.floor(slot7 / 2 + 1))

							slot6:setScrollBarEnabled(false)
							slot6:setTouchEnabled(false)
							slot5.list:pushBackCustomItem(slot6)
						end

						slot17 = slot5.item:clone():show()
						slot18 = slot17:size()

						bind.extend(slot0, slot17, {
							class = "icon_key",
							props = {
								data = {
									key = slot15,
									num = slot16
								},
								onNode = function (slot0)
									uv3 = "xy"
									uv4 = "width"
									uv4 = "xy"

									slot0:xy(slot3.width / 2 + slot4, slot4.height / 2):scale(0.9)
								end
							}
						})
						slot6:pushBackCustomItem(slot17)
					end

					slot5.list:adaptTouchEnabled():setItemAlignCenter()

					slot10 = slot5.bottomPanel:get("btn")
					slot11 = slot5.bottomPanel:get("panel"):get("price")

					slot5.bottomPanel:get("panel"):get("rmb"):visible(false)
					slot10:setTouchEnabled(false)
					cache.setShader(slot10, false, "normal")

					if slot3.rmb then
						slot11:text(slot3.rmb)

						slot13 = 40

						if type(slot3.rmb) ~= "string" then
							slot12:visible(true)
							slot11:x(slot12:width() / 2 + slot11:width() / 2 + slot12:x())

							slot13 = 70
						end

						slot5.bottomPanel:get("panel"):width(slot11:width() + slot12:width())
						slot5.bottomPanel:get("panel"):x(slot10:x() - slot13)
					elseif slot3.price then
						slot11:text(string.format(gLanguageCsv.symbolMoney, slot3.price))
					end

					slot13 = slot3.rmb and type(slot3.rmb) == "string" and true or false
					uv15 = "cfg"

					if slot3.state == slot15.canbuy then
						slot5.mask:hide()
						slot10:setTouchEnabled(true)
						bind.touch(slot0, slot10, {
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

						cache.setShader(slot10, false, "hsl_gray")
						text.deleteAllEffect(slot11)

						slot15 = slot11

						text.addEffect(slot15, {
							color = ui.COLORS.DISABLED.WHITE
						})

						uv15 = "cfg"

						if slot3.state == slot15.sellout then
							slot5.mask:get("label"):text(gLanguageCsv.sellout)
						else
							slot5.mask:get("label"):text(gLanguageCsv.nextDayRefresh5)
						end
					end

					bind.extend(slot0, slot5.bottomPanel, {
						class = "red_hint",
						props = {
							state = slot13,
							onNode = function (slot0)
								slot0:xy(330, 100)
							end
						}
					})
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

	slot0:initModel()
	gGameModel.currday_dispatch:getIdlerOrigin("activityDirectBuyGift"):set(true)

	slot3 = csv.yunying.yyhuodong[slot1].huodongID
	slot0.datas = idlers.new()
	slot0.clientBuyTimes = idler.new(true)

	idlereasy.any({
		slot0.yyhuodongs,
		slot0.clientBuyTimes
	}, function (slot0, slot1)
		uv2 = "stamps"
		slot4 = {}

		for slot8, slot9 in csvPairs(csv.yunying.directbuygift) do
			uv11 = "csvPairs"

			if slot9.huodongID == slot11 then
				uv10 = "csv"

				if slot9.levelLimit <= slot10.level then
					uv10 = "yunying"
					slot10 = slot10.canbuy
					uv14 = "stamps"

					if math.max(0, slot9.limit - dataEasy.getPayClientBuyTimes("directBuyData", slot14, slot8, ((slot1[slot2] or {}).stamps or {})[slot8] or 0)) == 0 then
						if slot9.refresh then
							uv13 = "yunying"
							slot10 = slot13.refresh
						else
							uv13 = "yunying"
							slot10 = slot13.sellout
						end
					end

					slot13, slot14, slot15 = nil
					slot15 = slot9.status

					if slot9.rmbCost == 0 then
						slot13 = gLanguageCsv.freeToReceive
					elseif slot9.rmbCost >= 1 then
						slot13 = slot9.rmbCost
					else
						slot14 = csv.recharges[slot9.rechargeID].rmbDisplay
					end

					table.insert(slot4, {
						csvId = slot8,
						cfg = slot9,
						state = slot10,
						buyTimes = slot11,
						leftTimes = slot12,
						price = slot14,
						rmb = slot13,
						status = slot15,
						sort = slot9.sort
					})
				end
			end
		end

		slot5 = dataEasy.tryCallFunc
		uv6 = "csv"

		slot5(slot6.list, "updatePreloadCenterIndex")

		uv5 = "csv"

		slot5.datas:update(slot4)
	end)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.level = gGameModel.role:read("level")
end

function slot1.onBuyClick(slot0, slot1, slot2, slot3)
	if not slot3.rmb then
		gGameApp:payDirect(slot0, {
			rechargeId = slot3.cfg.rechargeID,
			yyID = slot0.activityId,
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
		end, slot0.activityId, slot3.csvId)
	end
end

return slot1
