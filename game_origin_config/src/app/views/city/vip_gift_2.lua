slot1 = class("VipGift2View", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "vip_gift_2.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	itemTitle = "itemTitle",
	itemGift = "itemGift",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				itemTitle = bindHelper.self("itemTitle"),
				itemGift = bindHelper.self("itemGift"),
				preloadCenter = bindHelper.self("preloadCenter"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.title then
						slot1:height(slot0.itemTitle:height())

						slot4 = slot0.itemTitle:clone():show():addTo(slot1):alignCenter(slot1:size())

						slot4:get("icon"):texture(ui.VIP_ICON[slot3.title])
						adapt.setTextScaleWithWidth(slot4:get("title", nil, 230))
					else
						slot1:height(slot0.itemGift:height())

						slot4 = slot0.itemGift:clone():show():addTo(slot1):alignCenter(slot1:size())

						uiEasy.createItemsToList(slot0, slot4:get("list"), slot3.cfg.gift, {
							scale = 1
						})

						slot5 = slot4:get("btn"):multiget("rmb", "icon", "price")
						slot6 = nil

						if slot3.rechargeCfg or slot3.hasBuy then
							slot5.icon:hide()
							slot5.price:hide()

							if slot3.hasBuy then
								slot5.rmb:show():text(gLanguageCsv.hasBuy)
							else
								text.addEffect(slot5.rmb, {
									glow = {
										color = ui.COLORS.GLOW.WHITE
									}
								})
								slot5.rmb:show():text(string.format(gLanguageCsv.goodsMoney, slot3.rechargeCfg.rmbDisplay))
							end

							slot6 = slot5.rmb
						else
							slot5.rmb:hide()
							slot5.icon:show()
							slot5.price:show():text(slot3.cfg.rmbCost)
							text.addEffect(slot5.price, {
								glow = {
									color = ui.COLORS.GLOW.WHITE
								}
							})
							adapt.oneLineCenterPos(cc.p(slot4:get("btn"):width() / 2, slot4:get("btn"):height() / 2), {
								slot5.icon,
								slot5.price
							}, cc.p(10, 0))

							slot6 = slot5.price
						end

						if slot3.hasNext then
							slot7, slot8, slot9 = time.getYearMonthDay(slot3.cfg.endDate, true)
							slot10, slot11 = time.getHourAndMin(slot3.cfg.endTime, true)

							slot4:get("tip"):setFontSize(36)
							slot4:get("tip"):show():text(string.formatex(gLanguageCsv.vipGift2Tip1, {
								year = slot7,
								month = slot8,
								day = slot9,
								hour = slot10,
								min = string.format("%02d", slot11)
							}))
						else
							slot4:get("tip"):hide()
						end

						bind.touch(slot0, slot4:get("btn"), {
							methods = {
								ended = functools.partial(slot0.clickCell, slot3)
							}
						})

						slot8 = slot3.cfg.vipLevel <= gGameModel.role:read("vip_level") and 1 or 3

						if slot3.hasBuy then
							slot8 = 2
						end

						uiEasy.setBtnShader(slot4:get("btn"), slot6, slot8)
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBuyClick")
			}
		}
	}
}
slot1.RESOURCE_STYLES = {
	full = true
}

function slot1.onCreate(slot0, slot1)
	slot0.activityID = slot1

	slot0:initModel()
	slot0:enableSchedule()

	slot0.datas = idlers.new()
	slot0.isRefresh = idler.new(true)

	idlereasy.any({
		slot0.vipGift2,
		slot0.vipLevel,
		slot0.isRefresh
	}, function (slot0, slot1, slot2)
		slot1 = slot1 or {}
		uv4 = "dataEasy"
		slot4 = table.deepcopy(gGameModel.forever_dispatch:getIdlerOrigin("vipGift2Click"):read(), true)
		slot6 = 0

		for slot10, slot11 in ipairs(dataEasy.getVipGift2(slot4)) do
			if not slot11.title then
				slot4[slot11.id] = true

				if slot11.hasNext then
					slot12, slot13 = time.getHourAndMin(slot11.cfg.endTime, true)
					slot5 = math.min(time.getNumTimestamp(slot11.cfg.endDate, slot12, slot13), time.getTime() + 8640000)
				end

				uv12 = "getVipGift2"

				if not slot12.preloadCenter and not slot11.hasBuy then
					uv12 = "getVipGift2"
					slot12.preloadCenter = slot6 + 1
				end
			else
				slot6 = slot10
			end
		end

		slot7 = gGameModel.forever_dispatch:getIdlerOrigin("vipGift2Click")
		slot7 = slot7.set

		slot7(slot7, slot4, true)

		uv7 = "getVipGift2"
		slot8 = slot7

		slot7.schedule(slot8, function (slot0)
			uv2 = "time"

			if slot2 < time.getTime() then
				uv1 = "getTime"

				slot1.isRefresh:notify()
			end
		end, 1, 1, 1)

		slot7 = dataEasy.tryCallFunc
		uv8 = "getVipGift2"

		slot7(slot8.list, "updatePreloadCenterIndex")

		uv7 = "getVipGift2"

		slot7.datas:update(slot3)
	end)
end

function slot1.initModel(slot0)
	slot0.vipGift2 = gGameModel.role:getIdler("vip_gift_2")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.rmb = gGameModel.role:getIdler("rmb")
end

function slot1.onBuyClick(slot0, slot1, slot2)
	if slot0.vipLevel:read() < slot2.cfg.vipLevel then
		gGameUI:showTip(gLanguageCsv.vipGift2Tip2)

		return
	end

	if not slot2.rechargeCfg and slot0.rmb:read() < slot2.cfg.rmbCost then
		gGameUI:showTip(gLanguageCsv.buyRMBNotEnough)

		return
	end

	gGameUI:showDialog({
		btnType = 2,
		isRich = true,
		title = gLanguageCsv.spaceTips,
		content = string.format(gLanguageCsv.vipGift2Tip3, slot2.rechargeCfg and string.format(gLanguageCsv.goodsMoney, slot2.rechargeCfg.rmbDisplay) or string.format("#Icommon/icon/icon_diamond.png-56-56#%s", slot2.cfg.rmbCost), uiEasy.getVipStr(slot2.cfg.vipLevel).str),
		dialogParams = {
			clickClose = false
		},
		cb = function ()
			uv0 = "rechargeCfg"

			if slot0.rechargeCfg then
				uv2 = "gGameApp"
				uv4 = "rechargeCfg"
				slot4 = slot4.cfg.rechargeID
				uv4 = "gGameApp"
				slot4 = slot4.activityID
				uv4 = "rechargeCfg"
				slot4 = slot4.id
				uv4 = "rechargeCfg"

				gGameApp:payDirect(slot2, {
					buyTimes = 1,
					rechargeId = slot4,
					yyID = slot4,
					csvID = slot4,
					name = slot4.rechargeCfg.name
				}):doit()
			else
				uv4 = "gGameApp"
				uv5 = "rechargeCfg"

				gGameApp:requestServer("/game/yy/award/get", function (slot0)
					gGameUI:showGainDisplay(slot0)
				end, slot4.activityID, slot5.id)
			end
		end
	})
end

return slot1
