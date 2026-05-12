slot0 = {
	received = 3,
	noReach = 2,
	canReceive = 1
}
slot1 = class("ActivityLevelFund", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_level_fund.json"
slot1.RESOURCE_BINDING = {
	["buyBtn.label"] = "buyLabel",
	item = "item",
	tipsPanel = "tipsPanel",
	tipsBg1 = "tipsBg1",
	tipsBg2 = "tipsBg2",
	buyBtn = {
		varname = "buyBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuyFundClick")
			}
		}
	},
	diamondNum = {
		varname = "diamondNum",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(243, 146, 101, 255)
				}
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				level = bindHelper.self("level"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.state ~= slot1.state then
						return slot0.state < slot1.state
					end

					return slot0.csvId < slot1.csvId
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg
					slot5 = slot1:multiget("list", "num", "receivebtn", "received", "desc")

					uiEasy.createItemsToList(slot0, slot5.list, slot4.award)
					slot5.desc:text(slot4.desc)
					text.addEffect(slot5.num, {
						color = ui.COLORS.NORMAL.FRIEND_GREEN
					})

					slot9 = "%d/%d"

					slot5.num:text(string.format(slot9, slot0.level, slot4.needLevel))

					uv9 = "cfg"

					slot5.receivebtn:visible(slot3.state ~= slot9.received)

					uv9 = "cfg"

					slot5.received:visible(slot3.state == slot9.received)
					slot5.receivebtn:setTouchEnabled(false)
					cache.setShader(slot5.receivebtn, false, "normal")

					slot8 = "label"
					uv8 = "cfg"

					if slot3.state == slot8.canReceive then
						slot5.receivebtn:setTouchEnabled(true)
						text.addEffect(slot5.receivebtn:get(slot8), {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
						bind.touch(slot0, slot5.receivebtn, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
					else
						uv8 = "cfg"

						if slot3.state == slot8.noReach then
							text.addEffect(slot5.num, {
								color = ui.COLORS.NORMAL.ALERT_ORANGE
							})
							cache.setShader(slot5.receivebtn, false, "hsl_gray")
							text.deleteAllEffect(slot6)
							text.addEffect(slot6, {
								color = ui.COLORS.DISABLED.WHITE
							})
						end
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onReceiveClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0:initModel()

	slot2 = csv.yunying.yyhuodong[slot1]

	slot0.diamondNum:text(slot2.paramMap.rmb)

	for slot8, slot9 in csvPairs(csv.yunying.levelfund) do
		if slot9.huodongID == slot2.huodongID and slot9.award.rmb then
			slot4 = 0 + slot9.award.rmb
		end
	end

	slot5 = rich.createByStr(string.format(gLanguageCsv.levelFundTitle1, slot2.paramMap.rmb, slot4), 40):anchorPoint(0, 0.5):xy(slot0.tipsBg1:x() + 20, slot0.tipsBg1:y()):addTo(slot0:getResourceNode()):z(10)
	slot6 = rich.createByStr(string.format(gLanguageCsv.levelFundTitle2, ui.VIP_ICON[slot2.paramMap.vip]), 40):anchorPoint(0, 0.5):xy(slot0.tipsBg2:x() + 20, slot0.tipsBg2:y()):addTo(slot0:getResourceNode()):z(10)

	slot5:formatText()
	slot6:formatText()
	slot0.tipsBg1:width(slot5:width() + 40)
	slot0.tipsBg2:width(slot6:width() + 40)

	slot0.datas = idlers.new()

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "buy"

		if not (slot1[slot2] or {}).buy then
			uv3 = "buyBtn"
			slot3 = slot3.buyBtn
			slot3 = slot3.setTouchEnabled

			slot3(slot3, true)

			uv3 = "buyBtn"
			slot3 = slot3.buyLabel
			slot4 = slot3

			slot3.text(slot4, gLanguageCsv.buy)

			uv4 = "buyBtn"

			text.addEffect(slot4.buyLabel, {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			})
		else
			uv3 = "buyBtn"
			slot3 = slot3.buyBtn
			slot4 = slot3

			slot3.setTouchEnabled(slot4, false)

			uv4 = "buyBtn"
			slot4 = slot4.buyBtn

			cache.setShader(slot4, false, "hsl_gray")

			slot3 = text.deleteAllEffect
			uv4 = "buyBtn"

			slot3(slot4.buyLabel)

			uv3 = "buyBtn"
			slot3 = slot3.buyLabel
			slot4 = slot3

			slot3.text(slot4, gLanguageCsv.hasBuy)

			uv4 = "buyBtn"

			text.addEffect(slot4.buyLabel, {
				color = ui.COLORS.DISABLED.WHITE
			})
		end

		uv6 = "buy"
		slot4 = gGameModel.role:getYYHuoDongTasksProgress(slot6) or {}
		slot5 = {}

		for slot9, slot10 in csvPairs(csv.yunying.levelfund) do
			uv12 = "setTouchEnabled"

			if slot10.huodongID == slot12 then
				uv11 = "buyLabel"
				slot11 = slot11.noReach

				if (slot2.stamps or {})[slot9] == 1 then
					uv12 = "buyLabel"
					slot11 = slot12.canReceive
				elseif slot3[slot9] == 0 then
					uv12 = "buyLabel"
					slot11 = slot12.received
				end

				table.insert(slot5, {
					csvId = slot9,
					cfg = slot10,
					state = slot11,
					progress = slot4[slot9]
				})
			end
		end

		slot6 = dataEasy.tryCallFunc
		uv7 = "buyBtn"

		slot6(slot7.list, "updatePreloadCenterIndex")

		uv6 = "buyBtn"

		slot6.datas:update(slot5)
	end)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.level = gGameModel.role:read("level")
end

function slot1.onReceiveClick(slot0, slot1, slot2, slot3)
	uv5 = "state"

	if slot3.state == slot5.canReceive then
		gGameApp:requestServer("/game/yy/award/get", function (slot0)
			gGameUI:showGainDisplay(slot0)
		end, slot0.activityId, slot3.csvId)
	else
		uv5 = "state"

		if slot3.state == slot5.noReach then
			gGameUI:showTip(gLanguageCsv.notReachedCannotGet)
		end
	end
end

function slot1.onBuyFundClick(slot0)
	slot2 = gGameModel.role:read("rmb")

	if gGameModel.role:read("vip_level") < csv.yunying.yyhuodong[slot0.activityId].paramMap.vip then
		gGameUI:showDialog({
			clearFast = true,
			isRich = true,
			btnType = 2,
			title = "",
			content = gLanguageCsv.fundVipNotEnough,
			cb = function ()
				gGameUI:stackUI("city.recharge", nil)
			end,
			btnStr = gLanguageCsv.showVip,
			dialogParams = {
				clickClose = false
			}
		})

		return
	elseif slot2 < slot1.paramMap.rmb then
		uiEasy.showDialog("rmb")

		return
	end

	gGameUI:showDialog({
		isRich = true,
		btnType = 2,
		title = "",
		content = gLanguageCsv.fundBuyConfirm,
		cb = function ()
			uv4 = "gGameApp"

			gGameApp:requestServer("/game/yy/levelfund/buy", function (slot0)
				gGameUI:showTip(gLanguageCsv.buySuccess)
			end, slot4.activityId)
		end,
		dialogParams = {
			clickClose = false
		}
	})
end

return slot1
