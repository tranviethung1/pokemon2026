slot1 = {
	canbuy = 1,
	refresh = 2,
	sellout = 3
}
slot2 = {
	[0] = {
		logo = "common/icon/sign_blue.png",
		name = gLanguageCsv.discountSingle
	},
	{
		logo = "common/icon/sign_orange.png",
		name = gLanguageCsv.hotness
	},
	{
		logo = "common/icon/sign_purple.png",
		name = gLanguageCsv.limit
	},
	{
		logo = "common/icon/sign_green.png",
		name = gLanguageCsv.new
	}
}
slot3 = class("ActivityItemBuyView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "activity_item_buy.json"
slot3.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				asyncPreload = 8,
				data = bindHelper.self("datas"),
				columnSize = 4,
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot5 = slot1:multiget("title", "times", "bottomPanel", "mask", "logo", "logoDesc", "oldPrice")

					slot5.title:text(uiEasy.setIconName(slot3.id, slot3.num))
					adapt.setTextAdaptWithSize(slot5.title, {
						margin = -8,
						vertical = "center",
						maxLine = 2,
						horizontal = "center",
						size = cc.size(330, 75)
					})

					slot7 = slot1:size()

					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.id,
								num = slot3.num
							},
							onNode = function (slot0)
								uv3 = "xy"
								uv4 = "xy"

								slot0:xy(slot3.width / 2, slot4.height / 2 + 75)
							end
						}
					})
					slot1:removeChildByName("logoLabel")

					if slot3.cfg.logo then
						uv10 = "cfg"

						slot5.logo:show():texture(slot10[slot4.logo].logo):show()
						slot5.logoDesc:show()

						if slot4.logo == 0 then
							slot5.logoDesc:text(dataEasy.getDiscountText(slot4.rmbCost / slot4.rmbShow))

							if matchLanguage({
								"en"
							}) then
								slot5.logoDesc:scale(1.1)
								slot5.logo:scale(1.15)
								slot5.logoDesc:setTextAreaSize(cc.size(80, 80))
							elseif matchLanguage({
								"kr"
							}) then
								slot5.logoDesc:scale(0.6)
								slot5.logo:scale(1.15)
							else
								adapt.setTextScaleWithWidth(slot5.logoDesc, nil, 70)
							end
						else
							uv10 = "cfg"

							slot5.logoDesc:text(slot10[slot4.logo].name)
						end
					else
						slot5.logo:hide()
						slot5.logoDesc:hide()
					end

					if slot4.refresh then
						slot5.times:text(string.format(gLanguageCsv.directBuyGiftDailyBuy, slot3.leftTimes, slot4.buyMax))
						text.addEffect(slot5.times, {
							color = ui.COLORS.QUALITY[5]
						})
					else
						slot5.times:text(string.format(gLanguageCsv.directBuyGiftOnetimeBuy, slot3.leftTimes, slot4.buyMax))
						text.addEffect(slot5.times, {
							color = ui.COLORS.QUALITY[4]
						})
					end

					slot5.oldPrice:text(slot4.rmbShow)

					slot8 = slot5.bottomPanel:get("btn")
					slot9 = slot5.bottomPanel:get("price")

					slot8:setTouchEnabled(false)
					cache.setShader(slot8, false, "normal")

					slot11 = slot9

					slot9.text(slot11, slot4.rmbCost)

					uv11 = "multiget"

					if slot3.state == slot11.canbuy then
						slot5.mask:hide()
						slot8:setTouchEnabled(true)
						bind.touch(slot0, slot8, {
							methods = {
								ended = functools.partial(slot0.clickCell, t, slot3)
							}
						})
						text.addEffect(slot9, {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						slot5.mask:show()
						cache.setShader(slot8, false, "hsl_gray")
						text.deleteAllEffect(slot9)

						slot11 = slot9

						text.addEffect(slot11, {
							color = ui.COLORS.DISABLED.WHITE
						})

						uv11 = "multiget"

						if slot3.state == slot11.sellout then
							slot5.mask:get("label"):text(gLanguageCsv.sellout)
						else
							slot5.mask:get("label"):text(gLanguageCsv.nextDayRefresh5)
						end
					end

					adapt.oneLineCenterPos(cc.p(125, 50), {
						slot5.bottomPanel:get("icon"),
						slot9
					}, cc.p(15, -5))
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBuyClick")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0:initModel()

	slot3 = csv.yunying.yyhuodong[slot1].huodongID
	slot0.datas = idlers.new()

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "stamps"
		slot4 = {}

		for slot8, slot9 in csvPairs(csv.yunying.itembuy) do
			uv11 = "csvPairs"

			if slot9.huodongID == slot11 then
				uv10 = "csv"
				slot10 = slot10.canbuy

				if math.max(0, slot9.buyMax - (((slot1[slot2] or {}).stamps or {})[slot8] or 0)) == 0 then
					if slot9.refresh then
						uv12 = "csv"
						slot10 = slot12.refresh
					else
						uv12 = "csv"
						slot10 = slot12.sellout
					end
				end

				slot12, slot13 = csvNext(slot9.item)

				table.insert(slot4, {
					csvId = slot8,
					id = slot12,
					num = slot13,
					cfg = slot9,
					state = slot10,
					leftTimes = slot11
				})
			end
		end

		slot6 = slot4

		table.sort(slot6, function (slot0, slot1)
			if slot0.state ~= slot1.state then
				return slot0.state < slot1.state
			end

			return slot0.csvId < slot1.csvId
		end)

		slot5 = dataEasy.tryCallFunc
		uv6 = "yunying"

		slot5(slot6.list, "updatePreloadCenterIndex")

		uv5 = "yunying"

		slot5.datas:update(slot4)
	end)
end

function slot3.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.rmb = gGameModel.role:getIdler("rmb")
end

function slot3.onBuyClick(slot0, slot1, slot2, slot3)
	if slot0.rmb:read() < slot3.cfg.rmbCost then
		uiEasy.showDialog("rmb")
	else
		gGameUI:stackUI("common.buy_info", nil, , {
			rmb = slot5
		}, {
			id = slot3.id,
			num = slot3.num
		}, {
			contentType = "num",
			maxNum = slot3.leftTimes
		}, slot0:createHandler("getBuyInfoCb", slot3.csvId))
	end
end

function slot3.getBuyInfoCb(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot1, slot2)
end

return slot3
