slot0 = 1
slot1 = 2
slot2 = {
	townLock = 3,
	homeLock = 2,
	canbuy = 1,
	sellout = 4
}
slot3 = {
	all = 1,
	furniture = 2,
	wall = 3,
	board = 4
}
slot4 = {
	all = 1,
	entertainment = 2,
	art = 4,
	life = 3
}
slot5 = class("TownShopView", cc.load("mvc").ViewBase)
slot5.RESOURCE_FILENAME = "town_shop.json"
slot5.RESOURCE_BINDING = {
	["leftPanel.item"] = "tabItem",
	["searchPanel.text"] = "searchText",
	searchPanel = "searchPanel",
	["topPanel.item"] = "topItem",
	bg2 = "shopBg",
	currencyPanel = "currencyPanel",
	singlePanel = "singlePanel",
	topPanel = "topPanel",
	leftPanel = "leftPanel",
	["singlePanel.item"] = "singleItem",
	["singlePanel.subList"] = "singleSublist",
	bg = "bg",
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
	["currencyPanel.num"] = {
		varname = "currencyNumText",
		binds = {
			event = "text",
			idler = bindHelper.self("currencyNum")
		}
	},
	["topPanel.list"] = {
		varname = "topList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("topTab"),
				item = bindHelper.self("topItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("select"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot6:get("name"):text(slot3.name)
					adapt.setTextScaleWithWidth(slot6:get("name"), slot3.name, 150)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCellItem, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCellItem = bindHelper.self("onTopItemClick")
			}
		}
	},
	["searchPanel.btnSearch"] = {
		varname = "btnSearch",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSearchClick")
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
	["leftPanel.list"] = {
		varname = "tabList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("leftTab"),
				item = bindHelper.self("tabItem"),
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
							},
							outline = {
								size = 3,
								color = cc.c4b(129, 61, 45, 255)
							}
						})
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot6:get("name"):text(slot3.name)
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
	["singlePanel.item.panel.lock.tip"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(255, 252, 237, 255)
				}
			}
		}
	},
	["singlePanel.centerList"] = {
		varname = "centerList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				leftPadding = 20,
				asyncPreload = 12,
				columnSize = 4,
				data = bindHelper.self("shopDatas"),
				item = bindHelper.self("singleSublist"),
				cell = bindHelper.self("singleItem"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.state ~= slot1.state then
						return slot0.state < slot1.state
					end

					if slot0.cfg.beginDate > 0 ~= (slot1.cfg.beginDate > 0) then
						return slot2
					end

					if slot0.unlockLevel ~= slot1.unlockLevel then
						return slot0.unlockLevel < slot1.unlockLevel
					end

					if slot0.cfg.sortValue ~= slot1.cfg.sortValue then
						return slot1.cfg.sortValue < slot0.cfg.sortValue
					end

					return slot0.furnitureId < slot1.furnitureId
				end,
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("panel"):multiget("title", "rare", "mask", "price", "item", "icon", "series", "btnBuy", "lock").title:text(slot3.name):z(10)

					if matchLanguage({
						"en",
						"kr"
					}) then
						adapt.setTextAdaptWithSize(slot4.title, {
							margin = -5,
							vertical = "center",
							maxLine = 2,
							horizontal = "center",
							size = cc.size(slot1:width() - 150, 120)
						})
					else
						adapt.setTextScaleWithWidth(slot4.title, slot4.title:text(), slot1:width() - 150)
					end

					slot4.rare:visible(slot3.rare == 1)
					slot4.series:text(string.format(gLanguageCsv.townCollectionSeriesName, slot3.seriesName)):visible(slot3.series ~= 0)
					adapt.setTextScaleWithWidth(slot4.series, nil, 400)
					slot4.icon:texture(slot3.icon):scale(1.1)
					cache.setShader(slot4.btnBuy, false, "normal")

					slot8, slot9 = csvNext(slot3.cost)

					slot4.btnBuy:get("text"):text(slot9)
					slot4.btnBuy:get("rmb"):texture(dataEasy.getIconResByKey(slot8))
					slot4.lock:hide():z(100)
					slot4.mask:z(100)
					slot1:get("panel"):removeChildByName("timeLimit")
					slot1:get("panel"):removeChildByName("timeLimitText")

					if slot3.cfg.beginDate > 0 then
						slot10 = ccui.ImageView:create("common/icon/sign_purple.png"):align(cc.p(0.5, 0.5), 80, 340):setFlippedX(true):addTo(slot1:get("panel"), 21, "timeLimit")

						adapt.setTextScaleWithWidth(label.create(gLanguageCsv.limit, {
							fontSize = 50,
							color = ui.COLORS.NORMAL.WHITE
						}):align(cc.p(0.5, 0.5), 80, 340):addTo(slot1:get("panel"), 22, "timeLimitText"), nil, 70)
					end

					uv11 = "get"

					if slot3.state == slot11.homeLock then
						slot4.lock:show()
						slot4.lock:get("tip"):text(gLanguageCsv.townShopHomeLevelCondition .. slot3.unlockLevel)
					else
						uv11 = "get"

						if slot3.state == slot11.townLock then
							slot4.lock:show()
							slot4.lock:get("tip"):text(gLanguageCsv.townShopCenterLevelCondition .. slot3.unlockLevel)
						else
							uv11 = "get"

							if slot3.state == slot11.canbuy then
								slot4.mask:hide()
								bind.touch(slot0, slot1:get("panel"), {
									clicksafe = true,
									methods = {
										ended = functools.partial(slot0.clickCell, slot2, slot3)
									}
								})
								text.addEffect(slot6, {
									color = ui.COLORS.NORMAL.WHITE,
									glow = {
										color = ui.COLORS.GLOW.WHITE
									}
								})
							else
								slot4.mask:show()
								cache.setShader(slot5, false, "hsl_gray")
								text.deleteAllEffect(slot6)

								slot11 = slot6

								text.addEffect(slot11, {
									color = ui.COLORS.DISABLED.WHITE
								})

								uv11 = "get"

								if slot3.state == slot11.sellout then
									slot4.mask:get("label"):text(gLanguageCsv.sellout)
								else
									slot4.mask:get("label"):text(gLanguageCsv.nextDayRefresh5)
								end
							end
						end
					end

					adapt.oneLineCenterPos(cc.p(slot4.btnBuy:width() / 2, slot4.btnBuy:height() / 2), {
						slot7,
						slot6
					}, cc.p(10, 0))
					slot0:setRenderHint(0)
					slot1:get("imgBoard"):setVisible(slot2 == 1)
					slot1:get("panel"):removeChildByName("spineRes")

					if csv.town.home_furniture[slot3.furnitureId].spineRes ~= "" then
						ccui.ImageView:create("city/town/logo_hd2.png"):xy(310, 230):addTo(slot1:get("panel"), 10, "spineRes")
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBuyClick")
			}
		}
	}
}

function slot5.onCreate(slot0)
	gGameModel.currday_dispatch:getIdlerOrigin("homeShopClick"):set(true)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "DECORATION SHOP",
		title = gLanguageCsv.townShop
	})
	slot0:initModel()
	slot0:initDatas()
	slot0.tip:text(gLanguageCsv.townShopTip)
	adapt.setTextAdaptWithSize(slot0.tip, {
		size = cc.size(250, 180)
	})
	slot0.currencyPanel:get("icon"):texture(dataEasy.getIconResByKey("coin16"))
	slot0.searchText:setPlaceHolderColor(cc.c4b(238, 163, 124, 255))

	if matchLanguage({
		"kr"
	}) then
		slot0.searchText:setFontSize(33)
	end

	idlereasy.when(dataEasy.getListenNumByKey("coin16"), function (slot0, slot1)
		uv2 = "currencyNum"

		slot2.currencyNum:set(slot1)
	end)
	idlereasy.when(slot0.myFurniture, function (slot0, slot1)
		uv2 = "updateShopData"

		slot2:updateShopData()
	end, true)
end

function slot5.initModel(slot0)
	slot0.myFurniture = gGameModel.role:getIdler("furniture")
	slot0.tabData = idlers.new()
	slot0.shopDatas = idlers.new()
	slot0.leftTab = idlers.new()
	slot0.topTab = idlers.new()
	slot0.showLeftTab = idler.new(0)
	slot0.showTopTab = idler.new(0)
	slot0.currencyNum = idler.new(dataEasy.getNumByKey("coin16"))
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.rmb = gGameModel.role:getIdler("rmb")
end

function slot5.initDatas(slot0)
	for slot6, slot7 in orderCsvPairs(csv.town.home_furniture_type) do
		if slot7.showType == 0 then
			-- Nothing
		end
	end

	slot0.furnituresType = {
		[slot6] = {
			name = slot7.name,
			showType = slot7.showType
		}
	}

	slot0:updateShopData()
	slot0.leftTab:update({
		[0] = {
			id = 0,
			select = true,
			sortWeight = 1,
			name = gLanguageCsv.townShopAll
		},
		[slot6] = {
			select = false,
			id = slot6,
			name = slot7.name,
			sortWeight = slot6
		}
	})
	slot0.showLeftTab:addListener(function (slot0, slot1, slot2)
		uv3 = "leftTab"
		slot3 = slot3.leftTab:atproxy(slot1)
		slot3.select = false
		uv3 = "leftTab"
		slot3 = slot3.leftTab:atproxy(slot0)
		slot3.select = true
		uv3 = "leftTab"
		slot3 = slot3.initTopTab

		slot3(slot3, slot0)

		uv3 = "leftTab"

		slot3.showTopTab:set(0, true)
	end)
	slot0.showTopTab:addListener(function (slot0, slot1, slot2)
		uv3 = "topTab"

		if slot3.topTab:atproxy(slot1) then
			uv3 = "topTab"
			slot3.topTab:atproxy(slot1).select = false
		end

		uv3 = "topTab"
		slot3 = slot3.topTab:atproxy(slot0)
		slot3.select = true
		uv3 = "topTab"

		slot3:updateShopPanel()
	end)
end

function slot5.initTopTab(slot0, slot1)
	slot2 = {
		[0] = {
			id = 0,
			select = true,
			sortWeight = 1,
			name = gLanguageCsv.townShopAll
		}
	}

	if slot1 ~= 0 then
		for slot6, slot7 in pairs(slot0.shops[slot1]) do
			slot2[slot6] = {
				select = false,
				id = slot6,
				name = slot0.furnituresType[slot6].name,
				sortWeight = slot6
			}
		end
	end

	slot0.topTab:update(slot2)
end

function slot5.onTopItemClick(slot0, slot1, slot2, slot3)
	slot0.isSearch = nil

	slot0.centerList:jumpToPercentVertical(0)
	slot0.showTopTab:set(slot2)
end

function slot5.onLeftItemClick(slot0, slot1, slot2, slot3)
	slot0.isSearch = nil

	slot0.centerList:jumpToPercentVertical(0)
	slot0.showLeftTab:set(slot2)
end

function slot5.updateShopData(slot0)
	slot1 = gGameModel.role:read("level")
	slot2 = {
		[slot7] = {}
	}
	slot3 = gGameModel.town:read("buildings")

	for slot7, slot8 in orderCsvPairs(csv.town.home_furniture_type) do
		if slot8.showType == 0 then
			-- Nothing
		else
			slot2[slot8.showType][slot7] = {}
		end
	end

	for slot7, slot8 in csvPairs(csv.town.home_shop) do
		slot9, slot10 = csvNext(slot8.itemMap)
		slot13 = csv.town.home_furniture[slot9].type
		slot12 = slot0.furnituresType[slot13].showType
		uv13 = "gGameModel"
		uv14 = "role"

		if slot3[slot14].level < slot8.centerLevel then
			uv14 = "gGameModel"
			slot13 = slot14.townLock or slot13.canbuy
		end

		uv14 = "read"

		if slot3[slot14].level < slot8.homeLevel then
			uv14 = "gGameModel"
			slot13 = slot14.homeLock or slot13
		end

		if slot0.myFurniture:read()[slot9] and slot0.myFurniture:read()[slot9] == slot11.stackMax then
			uv14 = "gGameModel"
			slot13 = slot14.sellout
		end

		slot14 = slot8.levelRange[1] <= slot1 and slot1 <= slot8.levelRange[2]

		if slot8.beginDate > 0 and (tonumber(time.getTodayStrInClock()) < slot8.beginDate or slot8.endDate <= slot15) then
			slot14 = false
		end

		if slot14 then
			slot18 = slot11.series ~= 0 and csv.town.home_furniture_series[slot11.series].name or ""
			uv18 = "gGameModel"

			table.insert(slot2[slot12][slot11.type], {
				furnitureId = slot9,
				cfg = slot8,
				csvID = slot7,
				name = slot11.name,
				rare = slot11.quality,
				max = slot11.stackMax,
				type = slot11.type,
				res = slot11.icon,
				icon = slot11.icon,
				cost = slot8.costMap,
				language = slot8.language,
				itemMap = slot8.itemMap,
				series = slot11.series,
				seriesName = slot18,
				state = slot13,
				unlockLevel = slot13 == slot18.homeLock and slot8.homeLevel or slot8.centerLevel
			})
		end
	end

	slot0.shops = slot2

	slot0:updateShopPanel()
end

function slot5.updateShopPanel(slot0)
	if slot0.isSearch then
		slot1 = slot0.searchText:getStringValue()
		slot2 = {}

		for slot6, slot7 in pairs(slot0.shops) do
			for slot11, slot12 in pairs(slot7) do
				for slot16, slot17 in pairs(slot12) do
					if string.find(slot17.name, slot1) ~= nil or string.find(slot17.seriesName, slot1) ~= nil then
						table.insert(slot2, slot17)
					end
				end
			end
		end

		dataEasy.tryCallFunc(slot0.centerList, "updatePreloadCenterIndex")
		slot0.shopDatas:update(slot2)
	else
		slot2 = slot0.showTopTab:read()
		slot3 = {}

		if slot0.showLeftTab:read() == 0 then
			for slot7, slot8 in pairs(slot0.shops) do
				for slot12, slot13 in pairs(slot8) do
					for slot17, slot18 in pairs(slot13) do
						table.insert(slot3, slot18)
					end
				end
			end
		elseif slot2 == 0 then
			for slot7, slot8 in pairs(slot0.shops[slot1]) do
				for slot12, slot13 in pairs(slot8) do
					table.insert(slot3, slot13)
				end
			end
		else
			slot3 = slot0.shops[slot1][slot2] or {}
		end

		dataEasy.tryCallFunc(slot0.centerList, "updatePreloadCenterIndex")
		slot0.shopDatas:update(slot3)
	end
end

function slot5.onSearchClick(slot0)
	if slot0.searchText:getStringValue() == "" then
		gGameUI:showTip(gLanguageCsv.townShopSearchNill)

		return
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot0.shops) do
		for slot11, slot12 in pairs(slot7) do
			for slot16, slot17 in pairs(slot12) do
				if string.find(slot17.name, slot1) ~= nil or string.find(slot17.seriesName, slot1) ~= nil then
					table.insert(slot2, slot17)
				end
			end
		end
	end

	if itertools.size(slot2) == 0 then
		gGameUI:showTip(gLanguageCsv.townShopNoSearch)

		return
	end

	slot0.isSearch = true

	slot0.centerList:jumpToPercentVertical(0)
	slot0.showLeftTab:set(0, true)
end

function slot5.onBuyClick(slot0, slot1, slot2, slot3)
	uv5 = "state"

	if slot3.state == slot5.sellout then
		return
	end

	slot4, slot5 = csvNext(slot3.itemMap)

	gGameUI:stackUI("common.buy_info", nil, , slot3.cost, {
		id = slot4,
		num = slot5
	}, {
		style = 3,
		contentType = "num",
		num = slot0:createHandler("num"),
		maxNum = slot3.max
	}, slot0:createHandler("onUseCb", slot3.csvID))
end

function slot5.onUseCb(slot0, slot1, slot2)
	gGameApp:requestServer("/town/home/shop/buy", function (slot0)
		gGameUI:showGainDisplay(slot0.view)
	end, slot1, slot2)
end

return slot5
