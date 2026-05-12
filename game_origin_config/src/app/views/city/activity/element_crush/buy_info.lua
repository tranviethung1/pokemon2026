slot0 = require("app.views.city.activity.month_card")
slot1 = cc.load("mvc").ViewBase
slot2 = class("BuyInfoView", Dialog)
slot3 = {
	open = 4,
	buy = 1,
	exchange = 5,
	sell = 2,
	use = 3
}
slot4 = {
	gLanguageCsv.buyItem,
	gLanguageCsv.sellItem,
	gLanguageCsv.useItem,
	gLanguageCsv.openItem,
	gLanguageCsv.exchangeItem
}
slot5 = {
	gLanguageCsv.spaceBuy,
	gLanguageCsv.spaceSell,
	gLanguageCsv.spaceUse,
	gLanguageCsv.spaceOpen,
	gLanguageCsv.spaceExchange
}
slot6 = {
	gLanguageCsv.cost,
	gLanguageCsv.sellingPrice,
	gLanguageCsv.cost,
	gLanguageCsv.cost,
	gLanguageCsv.cost
}
slot7 = {
	noReach = 1,
	reach = 2,
	over = 3
}
slot2.RESOURCE_FILENAME = "common_buy_info.json"
slot2.RESOURCE_BINDING = {
	["content.sliderPanel"] = "sliderPanel",
	["content.maxNum"] = "maxNumLabel",
	selectPanel = "selectPanel",
	title = "title",
	content = "content",
	["content.sliderPanel.slider"] = "slider",
	priceItem = "priceItem",
	["content.label"] = "ownLabel",
	["selectPanel.txt"] = "selectDesc",
	["content.num"] = "numLabel",
	["content.numPanel"] = "numPanel",
	pricePanel = "pricePanel",
	selectItem = "selectItem",
	["content.maxTip"] = "maxTip",
	["pricePanel.text"] = "priceDesc",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["content.sliderPanel.subBtn"] = {
		varname = "sliderSubBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["content.sliderPanel.addBtn"] = {
		varname = "sliderAddBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	},
	["content.numPanel.subBtn"] = {
		varname = "numSubBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["content.numPanel.addBtn"] = {
		varname = "numAddBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	},
	["content.numPanel.subTenBtn"] = {
		varname = "numSubTenBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -10)
			end)
		}
	},
	["content.numPanel.addTenBtn"] = {
		varname = "numAddTenBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 10)
			end)
		}
	},
	buyBtn = {
		varname = "buyBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuyItem")
			}
		}
	},
	["buyBtn.text"] = {
		varname = "buyBtnText",
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["pricePanel.priceList"] = {
		varname = "priceList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("priceData"),
				item = bindHelper.self("priceItem"),
				priceListWidth = bindHelper.self("priceListWidth"),
				discount = bindHelper.self("discount"),
				flag = bindHelper.self("flag"),
				margin = 26,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("price", "icon", "original", "line")
					slot5 = slot0.discount > 0 and slot0.discount < 1

					slot4.original:visible(slot5)
					slot4.line:visible(slot5)
					slot4.price:text(mathEasy.getPreciseDecimal(slot3.cost * slot0.discount, 0, true))
					slot4.icon:texture("activity/element_crush/icon_xxl_dq.png")
					slot4.original:text(slot3.cost)

					slot7 = slot4.line
					slot8 = slot7

					slot7.width(slot8, (slot4.original:width() * slot4.original:scale() + 18) / slot4.line:scale())

					uv8 = "multiget"

					if slot0.flag ~= slot8.sell then
						text.addEffect(slot4.price, {
							color = slot6 <= slot3.point and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.NORMAL.ALERT_ORANGE
						})
					end

					slot7 = 10
					slot12 = (slot5 and slot4.line:width() * slot4.line:scale() or 0) + slot4.price:width() * slot4.price:scale() + slot4.icon:width() * slot4.icon:scale() + (slot5 and slot7 * 2 or slot7)

					slot1:width(slot12)
					slot0.priceListWidth:set(slot0.priceListWidth:read() + slot12)

					if slot5 then
						adapt.oneLinePos(slot4.line, {
							slot4.price,
							slot4.icon
						}, cc.p(slot7, 0), "left")
					else
						adapt.oneLinePos(slot4.price, slot4.icon, cc.p(slot7, 0), "left")
					end
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				afterBuild = bindHelper.self("onAfterBuildPriceList")
			}
		}
	},
	["selectPanel.list"] = {
		varname = "selectList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("selectData"),
				item = bindHelper.self("selectItem"),
				selectListWidth = bindHelper.self("selectListWidth"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("price", "icon", "selectPanel")

					slot4.icon:texture(dataEasy.getIconResByKey(slot3.key))
					slot4.price:text(slot3.val)
					slot4.selectPanel:get("select"):visible(slot3.selected)

					slot5 = 10
					slot10 = slot4.price:x() + slot4.price:width() + slot4.icon:width() + slot5 * 2

					slot1:width(slot10)
					slot0.selectListWidth:set(slot0.selectListWidth:read() + slot10)
					adapt.oneLinePos(slot4.price, slot4.icon, cc.p(slot5, 0), "left")
					bind.click(slot0, slot1, {
						method = functools.partial(slot0.clickCell, slot2, slot3)
					})
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				afterBuild = bindHelper.self("onAfterBuildSelectList"),
				clickCell = bindHelper.self("onSelectedClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2, slot3, slot4)
	slot3 = slot3 or {}

	slot0:enableSchedule()

	slot0.cb = slot4
	slot0.id = slot2.id
	slot6 = slot2.num
	slot7 = slot2.num or 1
	slot8 = slot3.style or 1
	slot9 = slot3.contentType
	uv10 = "enableSchedule"
	slot0.flag = slot10[slot3.flag or "buy"]
	slot0.num = slot3.num and slot3.num() or idler.new(1)
	slot0.maxNum = slot3.maxNum or math.huge
	slot0.hasMaxNum = slot3.maxNum or 0
	slot0.discount = slot3.discount or 1
	slot0.elementPoint = slot3.elementPoint or 0
	slot10 = slot3.prices or 0
	slot0.prices = slot10
	uv10 = "cb"
	slot0.stackState = slot10.noReach
	uv12 = "id"
	slot12 = slot12[slot0.flag]

	slot0.title:text(slot12)

	uv12 = "num"

	slot0.buyBtnText:text(slot12[slot0.flag])
	slot0.pricePanel:visible(slot1 ~= nil and slot3.selectMap == nil)

	if slot1 then
		uv13 = "style"

		slot0.priceDesc:text(slot13[slot0.flag] .. ": ")
	end

	slot0.priceData = idlers.newWithMap({})
	slot0.priceListWidth = idler.new(0)

	slot0.selectPanel:visible(slot10 ~= nil)

	if slot10 then
		uv13 = "style"

		slot0.selectDesc:text(slot13[slot0.flag] .. ": ")
	end

	slot0.selectListWidth = idler.new(0)
	slot11 = {}

	if slot5 ~= "card" then
		slot11 = dataEasy.getCfgByKey(slot5)
	end

	if slot11.type == game.ITEM_TYPE_ENUM_TABLE.staminaRecover then
		slot0.itemAddStamina = slot11.specialArgsMap.stamina
		slot12 = nil
		slot0.canUseMaxNum, slot14 = math.modf((game.STAMINA_LIMIT - gGameModel.role:read("stamina")) / slot0.itemAddStamina)
		slot0.canUseMaxNum = slot14 == 0 and slot0.canUseMaxNum or slot0.canUseMaxNum + 1
	end

	slot0.maxTip:hide()
	bind.extend(slot0, slot0.content, {
		class = "icon_key",
		props = {
			data = {
				key = slot5,
				num = slot6
			},
			onNode = function (slot0)
				slot0:xy(210, 410):z(3)
			end
		}
	})

	slot13, slot14 = uiEasy.setIconName(slot5, slot6)

	beauty.singleTextAutoScroll({
		align = "left",
		size = cc.size(500, 50),
		strs = {
			fontPath = "font/youmi1.ttf",
			str = slot13
		},
		effect = {
			color = ui.COLORS.NORMAL.DEFAULT
		}
	}):xy(322, 425):addTo(slot0.content, 4)

	slot17 = "hide"

	itertools.invoke({
		slot0.sliderPanel,
		slot0.numPanel
	}, slot17)

	slot15 = {
		slot0.num
	}
	uv17 = "enableSchedule"

	if slot0.flag == slot17.buy then
		for slot19, slot20 in csvMapPairs(slot1) do
			table.insert(slot15, gGameModel.role:getIdler(tostring(slot19)))
		end
	end

	idlereasy.any(slot15, function (slot0, slot1)
		uv2 = "flag"
		uv3 = "buy"

		if slot2.flag ~= slot3.buy then
			uv2 = "flag"
			uv3 = "buy"

			if slot2.flag == slot3.exchange then
				uv2 = "exchange"

				if slot2 ~= "card" then
					uv3 = "exchange"
					uv4 = "exchange"

					if dataEasy.itemStackMax(slot4) <= dataEasy.getNumByKey(slot3) then
						uv2 = "flag"
						uv3 = "card"
						slot2.stackState = slot3.reach
					else
						uv2 = "dataEasy"
						uv4 = "exchange"
						uv4 = "exchange"

						if dataEasy.itemStackMax(slot4) < slot1 * slot2 + dataEasy.getNumByKey(slot4) then
							uv2 = "flag"
							uv3 = "card"
							slot2.stackState = slot3.over
						end
					end
				end
			end
		end

		uv2 = "flag"
		slot2 = slot2.numLabel
		slot2 = slot2.text
		slot4 = slot1

		slot2(slot2, slot4)

		uv2 = "flag"
		slot2 = slot2.initProductCount
		uv4 = "getNumByKey"
		uv5 = "exchange"
		uv6 = "itemStackMax"

		slot2(slot2, slot4, slot5, slot6, slot1)

		uv2 = "flag"
		uv5 = "stackState"

		slot2:setProductData(slot1, slot5)
	end)
	slot0.slider:addEventListener(function (slot0, slot1)
		if slot1 == ccui.SliderEventType.percentChanged then
			uv2 = "ccui"

			slot2:unScheduleAll()

			if slot0:getPercent() == 0 then
				uv3 = "ccui"

				if slot3.lastPercent ~= 0 then
					uv3 = "ccui"
					slot3.lastPercent = slot2

					return
				end
			end

			uv3 = "ccui"
			slot3.lastPercent = slot2
			uv5 = "ccui"
			slot4 = math.ceil(slot5.maxNum * slot2 * 0.01)
			uv7 = "ccui"
			uv4 = "ccui"

			if slot4.canUseMaxNum then
				slot5 = cc.clampf(slot4, 1, math.max(slot7.maxNum, 1))
				uv6 = "ccui"
				slot6 = slot6.canUseMaxNum
				uv5 = "ccui"
				uv6 = "ccui"
				uv8 = "ccui"
				slot3 = cc.clampf(math.ceil(slot6.maxNum * math.min(slot5, slot6) / slot5.maxNum * 100 * 0.01), 1, math.max(slot8.canUseMaxNum, 1))
			end

			uv4 = "ccui"

			slot4.num:set(slot3, true)
		end
	end)

	slot0.selectData = idlers.new()

	if slot0.selectPanel:visible() then
		slot0.selectID = idler.new()
		slot16 = {}

		for slot20, slot21 in csvMapPairs(slot10) do
			table.insert(slot16, {
				selected = false,
				key = slot20,
				val = slot21
			})
		end

		slot16[1].selected = true

		slot0.selectData:update(slot16)
		slot0.selectID:addListener(function (slot0, slot1)
			if slot0 and slot1 then
				uv2 = "selectData"
				slot2 = slot2.selectData:atproxy(slot1)
				slot2.selected = false
				uv2 = "selectData"
				slot2.selectData:atproxy(slot0).selected = true
			end
		end)
		slot0.selectID:set(1)
	end

	Dialog.onCreate(slot0)
end

function slot2.initProductCount(slot0, slot1, slot2, slot3, slot4)
	if slot1 == 1 then
		if slot2 == "card" then
			slot0.ownLabel:hide()
			slot0.maxNumLabel:hide()
		else
			slot0.ownLabel:show()
			slot0.maxNumLabel:text(dataEasy.getNumByKey(slot2))
			adapt.oneLinePos(slot0.ownLabel, slot0.maxNumLabel, cc.p(20, 0))
		end

		slot0.numLabel:hide()
	elseif slot1 == 3 then
		if slot2 == "card" then
			slot0.ownLabel:hide()
			slot0.maxNumLabel:hide()
		else
			slot0.ownLabel:show()
			slot0.maxNumLabel:text(dataEasy.getNumByKey(slot2) .. "/" .. slot0.hasMaxNum)
			adapt.oneLinePos(slot0.ownLabel, slot0.maxNumLabel, cc.p(20, 0))
		end

		slot0.numLabel:hide()
	else
		slot0.ownLabel:hide()
		slot0.numLabel:show()
		slot0.maxNumLabel:text("/" .. math.max(slot0.maxNum, 1))
		adapt.oneLinePos(slot0.numLabel, slot0.maxNumLabel)
	end

	slot0.ownLabel:parent():removeChildByName("decorativeness")

	if dataEasy.isFurnitureItem(slot2) and dataEasy.isTownVisitUnlock() then
		slot0.ownLabel:clone():show():addTo(slot0.ownLabel:parent(), slot0.ownLabel:z(), "decorativeness"):xy(slot0.ownLabel:x(), slot0.ownLabel:y() - 50):text(gLanguageCsv.townHomeDecorate .. dataEasy.getCfgByKey(slot2).decorativeness)
	end

	slot5 = slot4 > 1
	slot6 = slot4 < slot0.maxNum

	if slot0.canUseMaxNum then
		uv8 = "card"

		if slot0.flag == slot8.use then
			slot6 = slot4 < slot0.canUseMaxNum

			slot0.maxTip:hide()

			if slot0.canUseMaxNum <= slot4 then
				slot0.maxTip:show()
				slot0.unScheduleAll()

				if slot0.itemAddStamina * slot4 + gGameModel.role:read("stamina") == game.STAMINA_LIMIT then
					slot0.maxTip:text(gLanguageCsv.energyFull)
					text.addEffect(slot0.maxTip, {
						color = ui.COLORS.NORMAL.DEFAULT
					})
				else
					slot0.maxTip:text(gLanguageCsv.energyOverflow)
					text.addEffect(slot0.maxTip, {
						color = ui.COLORS.NORMAL.ALERT_ORANGE
					})
				end
			end

			adapt.oneLinePos(slot0.numLabel, {
				slot0.maxNumLabel,
				slot0.maxTip
			}, {
				cc.p(0, 0),
				cc.p(10, 0)
			})
		end
	end

	if slot3 == "slider" then
		slot0.sliderSubBtn:setTouchEnabled(slot5)
		slot0.sliderAddBtn:setTouchEnabled(slot6)
		cache.setShader(slot0.sliderSubBtn, false, slot5 and "normal" or "hsl_gray")
		cache.setShader(slot0.sliderAddBtn, false, slot6 and "normal" or "hsl_gray")
		slot0.sliderPanel:show()
		slot0.numPanel:hide()
	elseif slot3 == "num" then
		slot0.numSubBtn:setTouchEnabled(slot5)
		slot0.numAddBtn:setTouchEnabled(slot6)
		cache.setShader(slot0.numSubBtn, false, slot7)
		cache.setShader(slot0.numAddBtn, false, slot8)
		slot0.numSubTenBtn:setTouchEnabled(slot5)
		slot0.numAddTenBtn:setTouchEnabled(slot6)
		cache.setShader(slot0.numSubTenBtn, false, slot7)
		cache.setShader(slot0.numAddTenBtn, false, slot8)
		slot0.numPanel:get("num"):text(slot4)
		slot0.sliderPanel:hide()
		slot0.numPanel:show()
	else
		slot0.sliderPanel:hide()
		slot0.numPanel:hide()
	end
end

function slot2.setProductData(slot0, slot1, slot2)
	slot0.slider:setPercent(math.floor(slot1 / slot0.maxNum * 100))

	if slot0.pricePanel:visible() then
		slot4 = {}

		for slot8, slot9 in csvMapPairs(slot2) do
			table.insert(slot4, {
				key = slot8,
				cost = slot9 * slot1,
				point = slot0.elementPoint
			})
		end

		slot0.priceListWidth:set(0)
		slot0.priceData:update(slot4)
	end
end

function slot2.onIncreaseNum(slot0, slot1)
	slot0.num:modify(function (slot0)
		if slot0 == 1 then
			uv1 = "cc"

			if slot1 == 10 then
				uv6 = "clampf"

				return true, cc.clampf(10, 1, math.max(slot6.maxNum, 1))
			end
		end

		uv3 = "cc"
		uv6 = "clampf"

		return true, cc.clampf(slot0 + slot3, 1, math.max(slot6.maxNum, 1))
	end)
end

function slot2.onChangeNum(slot0, slot1, slot2, slot3)
	if slot2.name == "click" then
		slot0:unScheduleAll()
		slot0:onIncreaseNum(slot3)
	elseif slot2.name == "began" then
		slot0:schedule(function ()
			uv0 = "onIncreaseNum"
			uv2 = "onIncreaseNum"

			slot0:onIncreaseNum(slot2)
		end, 0.05, 0, 1)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0:unScheduleAll()
	end
end

function slot2.onBuyItem(slot0)
	if slot0.elementPoint < slot0.num:read() * slot0.prices then
		gGameUI:showTip(gLanguageCsv.shopCoinNotEnough)

		return
	end

	slot3 = slot0.addCallbackOnExit

	slot3(slot0, functools.partial(slot0.cb, slot1))

	uv3 = "num"

	slot3.onClose(slot0)
end

function slot2.onAfterBuildPriceList(slot0)
	uv4 = "itertools"

	slot0.priceList:width(slot4 * (itertools.size(slot0.priceData) - 1) + slot0.priceListWidth:read())
	adapt.oneLineCenterPos(cc.p(slot0.pricePanel:width() / 2, slot0.priceDesc:y()), {
		slot0.priceDesc,
		slot0.priceList
	}, cc.p(0, -slot0.priceList:height() / 2))
end

function slot2.onAfterBuildSelectList(slot0)
	slot1 = itertools.size(slot0.selectData)

	slot0.selectList:width(slot0.selectListWidth:read())
	adapt.oneLineCenterPos(cc.p(slot0.selectPanel:width() / 2, slot0.selectDesc:y()), {
		slot0.selectDesc,
		slot0.selectList
	}, cc.p(0, -slot0.selectList:height() / 2))
end

function slot2.onSelectedClick(slot0, slot1, slot2, slot3)
	slot0.selectID:set(slot2)
end

return slot2
