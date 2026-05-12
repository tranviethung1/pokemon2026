slot0 = class("VipShopView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "vip_shop.json"
slot0.RESOURCE_BINDING = {
	currencyPanel = "currencyPanel",
	["currencyPanel.num"] = "currencyNumLabel",
	item = "item",
	subList = "subList",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				leftPadding = 6,
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
					slot1:get("imgBoard"):visible(slot2 == 1)
					bind.extend(slot0, slot4, {
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
								slot0:setTouchEnabled(false)
								slot0:xy(218, 310):scale(1.3):z(3)
							end
						}
					})

					slot6 = uiEasy.setIconName(slot3.itemID, nil, {
						node = slot1:get("panel"):multiget("name", "num", "btnBuy", "maskPanel").name
					})
					slot7 = slot4:width() - 150

					if matchLanguage({
						"en",
						"kr"
					}) then
						adapt.setTextAdaptWithSize(slot5.name, {
							margin = -5,
							vertical = "center",
							maxLine = 2,
							horizontal = "center",
							size = cc.size(slot4:width() - 150, 120)
						})
					else
						adapt.setTextScaleWithWidth(slot5.name, slot5.name:text(), slot4:width() - 150)
					end

					slot5.num:text("x" .. mathEasy.getShortNumber(slot3.count))

					slot8 = slot5.btnBuy:multiget("txt", "icon")
					slot9, slot10 = csvNext(slot3.cfg.costMap)

					slot8.icon:texture(dataEasy.getIconResByKey(slot9))
					slot8.txt:text(slot10)
					adapt.oneLineCenterPos(cc.p(slot5.btnBuy:width() / 2, slot5.btnBuy:height() / 2), {
						slot8.icon,
						slot8.txt
					}, cc.p(10, 0))

					slot11 = slot3.cfg.limitType ~= 0
					slot12 = slot3.cfg.limitTimes

					if not nil and gGameModel.role:read("vip_level") < slot3.cfg.vipStart then
						slot13 = true
						slot14 = string.format(gLanguageCsv.reachVipLevelCanBuy, uiEasy.getVipStr(slot3.cfg.vipStart).str)
					end

					slot4:removeChildByName("emm")
					slot5.maskPanel:hide()

					slot15 = slot5.maskPanel:multiget("bg", "lockTxt", "lock", "lockCondition", "txt")

					itertools.invoke(slot15, "visible", false)
					slot15.txt:show()
					slot4:setTouchEnabled(true)

					if slot13 then
						slot5.maskPanel:show()
						slot15.bg:visible(true)
						itertools.invoke(slot15, "visible", true)
						slot15.txt:hide()

						if slot14 then
							slot15.lockCondition:text(slot14)
						end

						slot4:setTouchEnabled(false)
					elseif slot11 then
						slot16, slot17 = nil

						if slot3.cfg.limitType == 1 then
							slot17 = slot12

							if tonumber(slot3.shopLimit[2]) == tonumber(time.getTodayStrInClock()) then
								slot17 = math.max(slot12 - (slot3.shopLimit[1] or 0), 0)
							end

							slot16 = string.format(gLanguageCsv.currDayBuyLimit, slot17, slot12)
						elseif slot3.cfg.limitType == 2 then
							slot17 = slot12

							if tonumber(slot3.shopLimit[2]) == tonumber(time.getWeekStrInClock()) then
								slot17 = math.max(slot12 - (slot3.shopLimit[1] or 0), 0)
							end

							slot16 = string.format(gLanguageCsv.currWeekBuyLimit, slot17, slot12)
						elseif slot3.cfg.limitType == 3 then
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
						slot18:addTo(slot4, 10, "emm"):xy(slot5.btnBuy:x(), slot5.btnBuy:y() + 65)
						slot4:setTouchEnabled(slot17 ~= 0)
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

						slot4:setTouchEnabled(slot3.buyTimes ~= true)
					end

					bind.touch(slot0, slot4, {
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
	},
	["btnRule.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(236, 150, 70, 255)
				}
			}
		}
	},
	btnRule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnRule")
			}
		}
	}
}
slot0.RESOURCE_STYLES = {
	full = true
}

function slot0.onCreate(slot0)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "SUPERMARKET",
		title = gLanguageCsv.supermarket
	})
	slot0:initModel()
	slot0.currencyPanel:get("icon"):texture(dataEasy.getIconResByKey("coin22"))
	idlereasy.when(dataEasy.getListenNumByKey("coin22"), function (slot0, slot1)
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

	slot0.shopData = idlers.new()

	slot0.shopData:update({
		{}
	})
	idlereasy.any({
		slot0.vipShop,
		slot0.shopLimit,
		slot0.vipLevel,
		slot0.level
	}, function ()
		uv0 = "initData"

		slot0:initData()
	end)
end

function slot0.initModel(slot0)
	slot0.vipShop = gGameModel.role:getIdler("vip_shop")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.level = gGameModel.role:getIdler("level")
	slot0.shopLimit = gGameModel.role:getIdler("shop_limit")
end

function slot0.initData(slot0)
	slot3 = {}

	for slot7, slot8 in orderCsvPairs(csv.vip_shop) do
		if slot0:isShowCondition(slot8) then
			slot10, slot11 = csvNext(slot8.itemMap)

			table.insert(slot3, {
				csvID = slot7,
				cfg = slot8,
				itemID = slot10,
				count = slot11,
				buyTimes = (slot0.vipShop:read() and slot1.buy or {})[slot7],
				shopLimit = (slot0.shopLimit:read().vip_shop or {})[slot7] or {}
			})
		end
	end

	table.sort(slot3, function (slot0, slot1)
		if slot0.cfg.sortValue ~= slot1.cfg.sortValue then
			return slot0.cfg.sortValue < slot1.cfg.sortValue
		end

		return slot0.csvID < slot1.csvID
	end)
	dataEasy.tryCallFunc(slot0.list, "updatePreloadCenterIndex")
	slot0.shopData:update(slot3)
end

function slot0.isShowCondition(slot0, slot1)
	slot3 = gGameModel.role:read("vip_level")

	return slot1.levelRange[1] <= gGameModel.role:read("level") and slot2 <= slot1.levelRange[2] or slot1.showUnable
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = 1
	slot6 = {
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

	if slot3.cfg.limitType and slot3.cfg.limitType > 0 then
		if slot6[slot3.cfg.limitType] or slot6[4]() then
			slot5 = slot3.cfg.limitTimes - (slot3.shopLimit[1] or 0)
		end

		slot4 = "num"
	end

	slot0.data = slot3

	gGameUI:stackUI("common.buy_info", nil, , slot3.cfg.costMap, {
		id = slot3.itemID,
		num = slot3.count
	}, {
		maxNum = slot5,
		contentType = slot4
	}, slot0:createHandler("showBuyInfo"))
end

function slot0.showBuyInfo(slot0, slot1)
	gGameApp:requestServer("/game/vip/shop/buy", function (slot0)
		uv5 = "gGameUI"
		slot5 = slot5.data.itemID
		uv5 = "gGameUI"
		uv6 = "showGainDisplay"

		gGameUI:showGainDisplay({
			{
				slot5,
				slot5.data.count * slot6
			}
		}, {
			raw = false
		})
	end, slot0.data.csvID, slot1)
end

function slot0.onBtnRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot0.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rule)
		end),
		slot2.noteText(134001, 134100)
	}
end

return slot0
