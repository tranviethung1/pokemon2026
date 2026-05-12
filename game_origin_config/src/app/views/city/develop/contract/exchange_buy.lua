slot0 = class("ContractExchangeBuyView", Dialog)
slot0.RESOURCE_FILENAME = "contract_exchange_buy.json"
slot0.RESOURCE_BINDING = {
	["topPanel.num"] = "iconNum",
	item = "item",
	["centerPanel.num"] = "numLabel",
	title1 = "title1",
	title2 = "title2",
	["topPanel.iconPanel"] = "iconPanel",
	["topPanel.name"] = "iconName",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["costPanel.list"] = {
		varname = "costList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("costData"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							noListener = true,
							data = slot3,
							grayState = (slot3.isSpecial and slot3.num < slot3.targetNum or false) and 1 or 0,
							onNode = function (slot0)
								slot1 = slot0.setTouchEnabled

								slot1(slot0, false)

								uv1 = "setTouchEnabled"
								slot3 = "btnAdd"
								uv3 = "get"

								slot1:get(slot3):visible(slot3)
							end
						}
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	["centerPanel.subBtn"] = {
		varname = "subBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["centerPanel.addBtn"] = {
		varname = "addBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	},
	btnExchange = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnExchangeClick")
			}
		}
	},
	["btnExchange.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)
	adapt.oneLinePos(slot0.title1, slot0.title2)
	slot0:enableSchedule()
	slot0:initModel()

	slot0.exchangeId = slot1
	slot2 = csv.contract.activate_book[slot1]
	slot0.cfg = slot2
	slot0.id = slot2.contractCsvID

	bind.extend(slot0, slot0.iconPanel, {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot0.id
			}
		}
	})

	slot0.maxNum = math.max(slot0.cfg.exchangeTimes - (slot0.exchangeTimes:read()[slot1] or 0), 0)
	slot3 = dataEasy.getCfgByKey(slot0.id)

	slot0.iconName:text(slot3.name)
	text.addEffect(slot0.iconName, {
		color = ui.COLORS.QUALITY[slot3.quality]
	})
	slot0.iconNum:text(gLanguageCsv.currentOwn .. dataEasy.getNumByKey(slot0.id))

	slot0.num = idler.new(1)
	slot0.selectDBIDs = idlereasy.new({})
	slot0.costData = idlereasy.new({})

	idlereasy.any({
		slot0.gold,
		slot0.rmb,
		slot0.items,
		slot0.contracts,
		slot0.num,
		slot0.selectDBIDs
	}, function ()
		uv0 = "updateData"

		slot0:updateData()
	end)
	idlereasy.when(slot0.num, function (slot0, slot1)
		uv2 = "selectDBIDs"
		slot2 = slot2.selectDBIDs
		slot2 = slot2.set

		slot2(slot2, {})

		uv2 = "selectDBIDs"
		slot2 = slot2.numLabel
		slot2 = slot2.text

		slot2(slot2, slot1)

		uv2 = "selectDBIDs"
		slot2 = slot2.subBtn
		slot2 = slot2.setTouchEnabled
		slot4 = slot1 > 1

		slot2(slot2, slot4)

		uv2 = "selectDBIDs"
		slot2 = slot2.addBtn
		slot3 = slot2
		uv4 = "selectDBIDs"

		slot2.setTouchEnabled(slot3, slot1 < slot4.maxNum)

		uv3 = "selectDBIDs"
		slot3 = slot3.subBtn
		slot5 = slot1 > 1 and "normal" or "hsl_gray"

		cache.setShader(slot3, false, slot5)

		uv3 = "selectDBIDs"
		uv5 = "selectDBIDs"

		cache.setShader(slot3.addBtn, false, slot1 < slot5.maxNum and "normal" or "hsl_gray")
	end)

	slot4 = slot0.costList:getContentSize()

	slot0.costList:setContentSize(cc.size(slot4.width + 320, slot4.height))
	slot0.costList:x(slot0.costList:x() - 100)
end

function slot0.initModel(slot0)
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.contracts = gGameModel.role:getIdler("contracts")
	slot0.exchangeTimes = gGameModel.role:getIdler("contract_books")
end

function slot0.updateData(slot0)
	for slot6, slot7 in ipairs(dataEasy.getItemData(slot0.cfg.costItems)) do
		slot7.targetNum = slot7.num * slot0.num:read()
		slot7.num = dataEasy.getNumByKey(slot7.key)
	end

	for slot6, slot7 in csvMapPairs(slot0.cfg.costContractMap) do
		table.insert(slot1, {
			isSpecial = true,
			key = ui.CONTRACT_QUALITY_ITEM[slot6],
			targetNum = slot7 * slot2,
			num = itertools.size(slot0.selectDBIDs:read()),
			quality = slot6
		})
	end

	slot0.costData:set(slot1)
	slot0.costData:notify()
end

function slot0.onSureCb(slot0, slot1)
	slot0.selectDBIDs:set(slot1)
end

function slot0.onItemClick(slot0, slot1, slot2)
	if slot2.isSpecial then
		gGameUI:stackUI("city.develop.contract.choose", nil, {
			dialog = true
		}, slot0:createHandler("onSureCb"), {
			quality = slot2.quality,
			num = slot2.targetNum
		})

		return
	end

	gGameUI:stackUI("common.gain_way", nil, {
		dialog = true
	}, slot2.key, nil, slot2.targetNum)
end

function slot0.onIncreaseNum(slot0, slot1)
	slot0.num:modify(function (slot0)
		uv3 = "cc"
		uv6 = "clampf"

		return true, cc.clampf(slot0 + slot3, 1, math.max(slot6.maxNum, 1))
	end)
end

function slot0.onChangeNum(slot0, slot1, slot2, slot3)
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

function slot0.onBtnExchangeClick(slot0)
	for slot4, slot5 in slot0.costData:pairs() do
		if slot5.num < slot5.targetNum then
			gGameUI:showTip(gLanguageCsv.materialsNotEnough)

			return
		end
	end

	slot1 = {}

	for slot5, slot6 in slot0.selectDBIDs:pairs() do
		table.insert(slot1, slot6)
	end

	gGameApp:requestServer("/game/contract/convert", function (slot0)
		uv1 = "onCloseFast"

		slot1:onCloseFast()
		gGameUI:showGainDisplay(slot0)
	end, slot0.exchangeId, slot0.num:read(), slot1)
end

return slot0
