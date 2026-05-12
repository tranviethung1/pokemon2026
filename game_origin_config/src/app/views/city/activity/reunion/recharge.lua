slot0 = {
	canbuy = 1,
	refresh = 2,
	sellout = 3
}
slot1 = class("ReunionRechargeView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "reunion_recharge.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	["topPanel.title"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(233, 79, 18, 255)
				},
				shadow = {
					size = 6,
					color = cc.c4b(195, 109, 72, 255),
					offset = cc.size(0, -6)
				}
			}
		}
	},
	["topPanel.title_0"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 5,
					color = cc.c4b(242, 122, 96, 255)
				},
				color = cc.c4b(254, 255, 51, 255)
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
				dataOrderCmp = function (slot0, slot1)
					if slot0.state ~= slot1.state then
						return slot0.state < slot1.state
					end

					return slot0.csvId < slot1.csvId
				end,
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg
					slot5 = slot1:multiget("list", "times", "title", "bottomPanel", "mask", "icon", "item")

					slot5.title:text(slot4.name)
					slot5.icon:texture(slot4.res)

					if slot3.status == 3 then
						slot5.times:visible(false)
					else
						slot6 = gLanguageCsv.activityBuyLimit

						if slot3.status == 1 then
							slot6 = gLanguageCsv.directBuyGiftDailyBuy
						end

						slot5.times:visible(true)
						slot5.times:text(string.format(slot6, slot3.leftTimes, slot4.limitNum))
					end

					slot5.list:removeAllChildren()
					slot5.list:setScrollBarEnabled(false)
					slot5.list:setGravity(ccui.ListViewGravity.bottom)
					slot5.list:width(480)

					slot6 = 0
					slot8 = csvSize(slot4.item) == 1 and slot5.item:size().width / 2 or 0

					for slot12, slot13 in ipairs(dataEasy.getItemData(slot4.item)) do
						slot16 = slot5.item:clone():show()
						slot17 = slot16:size()

						bind.extend(slot0, slot16, {
							class = "icon_key",
							props = {
								data = {
									key = slot13.key,
									num = slot13.num
								},
								onNode = function (slot0)
									uv3 = "xy"
									uv4 = "width"
									uv4 = "xy"

									slot0:xy(slot3.width / 2 + slot4, slot4.height / 2):scale(0.8)
								end
							}
						})
						slot5.list:pushBackCustomItem(slot16)
					end

					slot5.list:adaptTouchEnabled():setItemAlignCenter()

					slot9 = slot5.bottomPanel:get("btn")
					slot10 = slot5.bottomPanel:get("panel")
					slot11 = slot5.bottomPanel:get("panel"):get("price")

					slot9:setTouchEnabled(false)
					slot5.bottomPanel:get("panel"):get("rmb"):visible(false)
					cache.setShader(slot9, false, "normal")

					slot14 = slot11

					slot11.text(slot14, string.format(gLanguageCsv.symbolMoney, slot3.price))

					uv14 = "cfg"

					if slot3.state == slot14.canbuy then
						slot5.mask:hide()
						slot9:setTouchEnabled(true)
						bind.touch(slot0, slot9, {
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
						cache.setShader(slot9, false, "hsl_gray")
						text.deleteAllEffect(slot11)

						slot14 = slot11

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
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBuyClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.yyID = slot1
	slot2 = csv.yunying.yyhuodong[slot1]

	slot0:initModel()

	slot0.datas = idlers.new()
	slot0.clientBuyTimes = idler.new(true)

	idlereasy.any({
		slot0.reunion,
		slot0.clientBuyTimes
	}, function (slot0, slot1, slot2)
		slot3 = slot1.recharge or {}
		slot4 = {}

		for slot8, slot9 in csvPairs(csv.yunying.reunion_recharge) do
			uv11 = "recharge"

			if slot9.huodongID == slot11.huodongID then
				uv10 = "csvPairs"
				slot10 = slot10.canbuy
				uv14 = "csv"
				slot13 = slot9.limitType

				if math.max(0, slot9.limitNum - dataEasy.getPayClientBuyTimes("directBuyData", slot14.yyID, slot8, slot3[slot8] and slot3[slot8][1] or 0)) == 0 then
					uv14 = "csvPairs"
					slot10 = slot14.sellout
				end

				table.insert(slot4, {
					csvId = slot8,
					cfg = slot9,
					state = slot10,
					buyTimes = slot11,
					leftTimes = slot12,
					price = csv.recharges[slot9.rechargeID].rmbDisplay
				})
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
	slot0.reunion = gGameModel.role:getIdler("reunion")
end

function slot1.onBuyClick(slot0, slot1, slot2, slot3)
	gGameApp:payDirect(slot0, {
		rechargeId = slot3.cfg.rechargeID,
		yyID = slot0.yyID,
		csvID = slot3.csvId,
		name = slot3.cfg.name,
		buyTimes = slot3.buyTimes
	}, slot0.clientBuyTimes):doit()
end

return slot1
