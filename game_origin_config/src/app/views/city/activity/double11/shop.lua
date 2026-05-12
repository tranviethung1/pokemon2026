slot0 = {
	canbuy = 1,
	refresh = 2,
	sellout = 3
}
slot1 = class("ActivityDouble11Shop", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "double11_shop.json"
slot1.RESOURCE_BINDING = {
	["leftPanel.item"] = "tabItem",
	["singlePanel.item"] = "singleItem",
	bg2 = "shopBg",
	["bagPanel.subList"] = "bagSublist",
	["bagPanel.item"] = "bagItem",
	singlePanel = "singlePanel",
	leftPanel = "leftPanel",
	bagPanel = "bagPanel",
	time = "time",
	["singlePanel.subList"] = "singleSublist",
	bg = "bg",
	["bagPanel.item.item"] = "iconItem",
	tip = {
		varname = "tip",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(255, 255, 235, 255)
				}
			}
		}
	},
	["leftPanel.item.normal.name"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(216, 148, 115, 255)
				}
			}
		}
	},
	["leftPanel.item.select.name"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(129, 61, 45, 255)
				}
			}
		}
	},
	["leftPanel.list"] = {
		varname = "tabList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabData"),
				item = bindHelper.self("tabItem"),
				itemAction = {
					isAction = true
				},
				showTab = bindHelper.self("showTab"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = slot1:get("select")
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot5:show()

						text.addEffect(slot5:get("name"), {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot6:get("name"):text(slot3.desc)

					if matchLanguage({
						"en"
					}) then
						slot6:get("name"):setFontSize(26)
					elseif matchLanguage({
						"kr"
					}) then
						slot6:get("name"):setFontSize(30)
					end

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
	["singlePanel.centerList"] = {
		varname = "singleList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				leftPadding = 20,
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
					slot5 = slot1:multiget("title", "tip", "mask", "price", "item", "icon", "hot", "btnBuy")

					slot5.title:text(slot4.name)
					adapt.setTextScaleWithWidth(slot5.title, slot4.name, 300)

					if slot4.hot == "" then
						slot5.hot:visible(false)
					else
						slot5.hot:visible(true)
						slot5.hot:texture(slot4.hot)
					end

					if slot4.refresh then
						slot5.tip:text(string.format(gLanguageCsv.directBuyGiftDailyBuy, slot3.leftTimes, slot4.limit))
					else
						slot5.tip:text(string.format(gLanguageCsv.directBuyGiftOnetimeBuy, slot3.leftTimes, slot4.limit))
					end

					for slot9, slot10 in ipairs(dataEasy.getItemData(slot4.item)) do
						bind.extend(slot0, slot5.icon, {
							class = "icon_key",
							props = {
								data = {
									key = slot10.key,
									num = slot10.num
								},
								onNode = function (slot0)
								end
							}
						})
					end

					slot5.price:get("num"):text(slot4.oldPrice)

					slot6 = slot5.btnBuy

					slot6:setTouchEnabled(false)
					slot5.btnBuy:get("rmb"):visible(false)
					cache.setShader(slot6, false, "normal")

					if slot3.rmb then
						slot9 = 40

						slot5.btnBuy:get("text"):text(slot3.rmb)

						if type(slot3.rmb) ~= "string" then
							slot8:visible(true)

							slot9 = 70
						end
					elseif slot3.price then
						slot7:text(string.format(gLanguageCsv.symbolMoney, slot3.price))
					end

					uv10 = "cfg"

					if slot3.state == slot10.canbuy then
						slot5.mask:hide()
						slot6:setTouchEnabled(true)
						bind.touch(slot0, slot6, {
							clicksafe = true,
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
						text.addEffect(slot7, {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						slot5.mask:show()
						slot5.hot:visible(false)
						cache.setShader(slot6, false, "hsl_gray")
						text.deleteAllEffect(slot7)

						slot10 = slot7

						text.addEffect(slot10, {
							color = ui.COLORS.DISABLED.WHITE
						})

						uv10 = "cfg"

						if slot3.state == slot10.sellout then
							slot5.mask:get("label"):text(gLanguageCsv.sellout)
						else
							slot5.mask:get("label"):text(gLanguageCsv.nextDayRefresh5)
						end
					end

					slot0:setRenderHint(0)
					slot1:get("imgBoard"):setVisible(slot2 == 1)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBuyClick")
			}
		}
	},
	["bagPanel.centerList"] = {
		varname = "bagList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				leftPadding = 40,
				asyncPreload = 9,
				columnSize = 3,
				data = bindHelper.self("bagDatas"),
				item = bindHelper.self("bagSublist"),
				cell = bindHelper.self("bagItem"),
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
					slot5 = slot1:multiget("name", "boxImg", "mask", "btnBuy", "item", "list", "tip", "hot")

					slot5.name:text(slot4.name)
					slot5.boxImg:texture(slot4.icon)

					if matchLanguage({
						"kr"
					}) then
						slot5.hot:setAnchorPoint(0.5, 1)
						adapt.setTextScaleWithWidth(slot5.name, slot4.name, 300)
					else
						adapt.setTextScaleWithWidth(slot5.name, slot4.name, 235)
					end

					if slot4.hot == "" or slot4.hot == nil then
						slot5.hot:visible(false)
					else
						slot5.hot:visible(true)
						slot5.hot:texture(slot4.hot)
					end

					slot5.boxImg:texture(slot4.icon)

					if slot4.refresh then
						slot5.tip:text(string.format(gLanguageCsv.directBuyGiftDailyBuy, slot3.leftTimes, slot4.limit))
					else
						slot5.tip:text(string.format(gLanguageCsv.directBuyGiftOnetimeBuy, slot3.leftTimes, slot4.limit))
					end

					slot5.list:removeAllChildren()
					slot5.list:setScrollBarEnabled(false)
					slot5.list:setGravity(ccui.ListViewGravity.bottom)

					slot7 = csvSize(slot4.item) == 1 and slot5.item:size().width / 2 or 0

					for slot11, slot12 in ipairs(dataEasy.getItemData(slot4.item)) do
						slot15 = slot5.item:clone():show()
						slot16 = slot15:size()

						bind.extend(slot0, slot15, {
							class = "icon_key",
							props = {
								data = {
									key = slot12.key,
									num = slot12.num
								},
								onNode = function (slot0)
									uv3 = "xy"
									uv4 = "width"
									uv4 = "xy"

									slot0:xy(slot3.width / 2 + slot4, slot4.height / 2)
									slot0:scale(0.7)
								end
							}
						})
						slot5.list:pushBackCustomItem(slot15)
					end

					slot5.list:adaptTouchEnabled():setItemAlignCenter()

					slot8 = slot5.btnBuy

					slot8:setTouchEnabled(false)
					cache.setShader(slot8, false, "normal")

					if slot3.rmb then
						slot10 = 40

						slot5.btnBuy:get("text"):text(slot3.rmb)

						if type(slot3.rmb) ~= "string" then
							slot10 = 70
						end
					elseif slot3.price then
						slot9:text(string.format(gLanguageCsv.symbolMoney, slot3.price))
					end

					uv11 = "cfg"

					if slot3.state == slot11.canbuy then
						slot5.mask:hide()
						slot8:setTouchEnabled(true)
						bind.touch(slot0, slot8, {
							clicksafe = true,
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
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
						slot5.hot:visible(false)
						cache.setShader(slot8, false, "hsl_gray")
						text.deleteAllEffect(slot9)

						slot11 = slot9

						text.addEffect(slot11, {
							color = ui.COLORS.DISABLED.WHITE
						})

						uv11 = "cfg"

						if slot3.state == slot11.sellout then
							slot5.mask:get("label"):text(gLanguageCsv.sellout)
						else
							slot5.mask:get("label"):text(gLanguageCsv.nextDayRefresh5)
						end
					end

					slot0:setRenderHint(0)
					slot1:get("imgBoard"):setVisible(slot2 == 1)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBuyClick")
			}
		}
	}
}

function slot1.onCreate(slot0)
	slot5 = {
		onClose = slot6
	}
	slot6 = slot0:createHandler("onClose")

	gGameUI.topuiManager:createView("default", slot0, slot5):init({
		subTitle = "ACTIVITY",
		title = gLanguageCsv.double11Shop
	})
	slot0:initModel()

	slot1 = {}

	slot0.tip:text(gLanguageCsv.double11ShopTip)

	for slot5, slot6 in ipairs(slot0.yyOpen:read()) do
		if csv.yunying.yyhuodong[slot6].type == game.YYHUODONG_TYPE_ENUM_TABLE.directBuyGift and slot7.clientParam.double11 then
			table.insert(slot1, {
				desc = slot7.desc,
				id = slot6,
				sortWeight = slot7.sortWeight,
				type = slot7.clientParam.type
			})
		end
	end

	slot0.datas = slot1
	slot0.timeId = slot1[1].id

	table.sort(slot1, function (slot0, slot1)
		if slot0.sortWeight ~= slot1.sortWeight then
			return slot0.sortWeight < slot1.sortWeight
		end

		return slot0.id < slot1.id
	end)
	slot0:initCountDown()

	if slot1[1].id then
		if slot1[1].type == "item" then
			slot0.singlePanel:visible(true)
			slot0.bagPanel:visible(false)
		elseif slot1[1].type == "gift" then
			slot0.singlePanel:visible(false)
			slot0.bagPanel:visible(true)
		end

		slot0.tabData:update(slot1)
		slot0.activityId:set(slot2)
		slot0.showTab:addListener(function (slot0, slot1, slot2)
			uv3 = "tabData"
			slot3 = slot3.tabData:atproxy(slot1)
			slot3.select = false
			uv3 = "tabData"
			slot3.tabData:atproxy(slot0).select = true
		end)

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

			uv9 = "csv"

			for slot11, slot12 in ipairs(slot9.datas) do
				if slot12.type == "item" then
					uv13 = "csv"

					if not slot13.clickTab then
						uv14 = "csv"

						dataEasy.tryCallFunc(slot14.singleList, "updatePreloadCenterIndex")
					end

					uv13 = "csv"

					slot13.singleDatas:update(slot7)
				elseif slot12.type == "gift" then
					uv13 = "csv"

					if not slot13.clickTab then
						uv14 = "csv"

						dataEasy.tryCallFunc(slot14.bagList, "updatePreloadCenterIndex")
					end

					uv13 = "csv"

					slot13.bagDatas:update(slot7)
				end
			end
		end)
	end
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyOpen = gGameModel.role:getIdler("yy_open")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.level = gGameModel.role:read("level")
	slot0.activityId = idler.new()
	slot0.tabData = idlers.new()
	slot0.singleDatas = idlers.new()
	slot0.bagDatas = idlers.new()
	slot0.showTab = idler.new(1)
end

function slot1.onLeftItemClick(slot0, slot1, slot2, slot3)
	if slot0.activityId:read() ~= slot3.id then
		slot0.activityId:set(slot3.id)

		slot0.clickTab = true

		slot0.showTab:set(slot2)

		for slot7, slot8 in ipairs(slot0.datas) do
			if slot3.id == slot8.id then
				if slot8.type == "item" then
					dataEasy.tryCallFunc(slot0.singleList, "setItemAction", {
						isAction = true
					})
					slot0.singlePanel:visible(true)
					slot0.bagPanel:visible(false)
				elseif slot8.type == "gift" then
					dataEasy.tryCallFunc(slot0.bagList, "setItemAction", {
						isAction = true
					})
					slot0.singlePanel:visible(false)
					slot0.bagPanel:visible(true)
				end
			end
		end
	end
end

function slot1.onBuyClick(slot0, slot1, slot2, slot3)
	if not slot3.rmb then
		gGameApp:payDirect(slot0, {
			rechargeId = slot3.cfg.rechargeID,
			yyID = slot0.activityId:read(),
			csvID = slot3.csvId,
			name = slot3.cfg.name,
			buyTimes = slot3.buyTimes
		}, slot0.clientBuyTimes):serverCb(function ()
			uv1 = "csv"
			slot1 = gGameUI

			slot1:showGainDisplay(csv.yunying.directbuygift[slot1.csvId].item, {
				raw = false
			})
		end):doit()
	else
		if slot0.rmb:read() < slot3.rmb then
			uiEasy.showDialog("rmb", nil, {
				dialog = false
			})

			return
		end

		dataEasy.sureUsingDiamonds(function ()
			uv4 = "/game/yy/award/get"
			uv5 = "requestServer"

			gGameApp:requestServer("/game/yy/award/get", function (slot0)
				uv1 = "clientBuyTimes"
				slot1 = slot1.clientBuyTimes
				slot2 = slot1

				slot1.notify(slot2)

				uv2 = "notify"

				gGameUI:showGainDisplay(csv.yunying.directbuygift[slot2.csvId].item, {
					raw = false
				})
			end, slot4, slot5.csvId)
		end, slot3.rmb)
	end
end

function slot1.getBuyInfoCb(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		uv1 = "clientBuyTimes"

		slot1.clientBuyTimes:notify()
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot1, slot2)
end

function slot1.initCountDown(slot0)
	slot2 = csv.yunying.yyhuodong[slot0.timeId]
	slot3, slot4 = time.getHourAndMin(slot2.endTime)

	bind.extend(slot0, slot0.time, {
		class = "cutdown_label",
		props = {
			endTime = time.getNumTimestamp(slot2.endDate, slot3, slot4),
			callFunc = function ()
				uv1 = "adapt"

				adapt.setTextScaleWithWidth(slot1, nil, 180)
			end,
			endFunc = function ()
				uv0 = "time"

				slot0.time:text(gLanguageCsv.activityOver)
			end
		}
	})
end

return slot1
