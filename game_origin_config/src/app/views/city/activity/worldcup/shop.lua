slot0 = {
	canbuy = 1,
	refresh = 2,
	sellout = 3
}
slot1 = class("WorldcupShopView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "worldcup_shop.json"
slot1.RESOURCE_BINDING = {
	bg2 = "bg",
	timeText = "timeText",
	time = "time",
	["singlePanel.subList"] = "singleSublist",
	singlePanel = "singlePanel",
	["singlePanel.item"] = "singleItem",
	["singlePanel.centerList"] = {
		varname = "singleList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				leftPadding = 15,
				xMargin = 5,
				asyncPreload = 12,
				columnSize = 4,
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

					slot1:get("panel"):multiget("title", "tip", "mask", "item", "icon", "num", "btnBuy").title:text(slot6)

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
							noListener = true,
							simpleShow = true,
							data = {
								key = slot3.id,
								num = slot3.id == "card" and slot3.num or nil
							},
							onNode = function (slot0)
								slot0:scale(1.2)
								slot0:setTouchEnabled(false)
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

					cache.setShader(slot8, false, "normal")
					slot9:text(slot3.costNum)
					slot10:x(slot8:width() / 2 - slot10:getBoundingBox().width - slot9:size().width / 2 + 20)

					slot14 = slot10

					adapt.oneLinePos(slot14, slot9, cc.p(10, 0), "left")

					uv14 = "cfg"

					if slot3.state == slot14.canbuy then
						slot5.mask:hide()
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

					slot1:get("di"):visible(slot0:getIdx(slot2).col == 1)
					bind.touch(slot0, slot1:get("panel"), {
						clicksafe = true,
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
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

function slot1.onCreate(slot0)
	slot0.topView = gGameUI.topuiManager:createView("worldcup", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "WORLDCUP",
		title = gLanguageCsv.worldcup
	})

	slot0:initTitle()
	slot0:initModel()

	slot1 = csv.yunying.yyhuodong[slot0.activityId]
	slot2 = slot1.huodongID
	slot0.yyCfg = slot1
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

		slot6.singleDatas:update(slot5)
	end)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.worldCupdata = gGameModel.role:getIdler("worldcup")
	slot0.singleDatas = idlers.new()
	slot4 = "yy_open"

	for slot4, slot5 in ipairs(gGameModel.role:read(slot4)) do
		if csv.yunying.yyhuodong[slot5].type == game.YYHUODONG_TYPE_ENUM_TABLE.itemBuy2 and slot6.clientParam.type == "worldcup" then
			slot0.activityId = slot5

			break
		end
	end
end

function slot1.initTitle(slot0)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "WORLDCUP",
		title = gLanguageCsv.worldcup
	})
end

function slot1.onBuyClick(slot0, slot1, slot2, slot3)
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

return slot1
