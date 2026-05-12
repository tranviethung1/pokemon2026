slot0 = {
	noReach = 2,
	received = 3,
	canReceive = 1
}
slot1 = class("ServerOpenDiscountView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_server_open_discount.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	["newPrice.num"] = "newNum",
	["oldPrice.num"] = "oldNum",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 20,
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = slot3,
							onNode = function (slot0)
								slot0:y(210)
							end
						}
					})

					if matchLanguage({
						"en"
					}) then
						slot1:get("name"):setContentSize(220, 130)
					end

					slot1:get("name"):text(uiEasy.setIconName(slot3.key))
					slot1:get("name"):getVirtualRenderer():setLineSpacing(-10)
					text.addEffect(slot1:get("name"), {
						outline = {
							color = ui.COLORS.OUTLINE.WHITE
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	},
	buyBtn = {
		varname = "buyBtn",
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.self("onBuy")
			}
		}
	},
	txt = {
		varname = "txt",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c4b(255, 238, 204, 255)
					},
					color = cc.c4b(166, 141, 116, 255)
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3, slot4)
	slot0.activityId = slot1
	slot0.currDay, slot0.showTab, slot0.tabIndex = slot3()

	slot0:initModel()

	slot0.data = slot2
	slot0.datas = idlertable.new({})
	slot0.originX = slot0.list:x()

	idlereasy.any({
		slot0.currDay,
		slot0.showTab,
		slot0.yyhuodongs,
		slot0.tabIndex
	}, function (slot0, slot1, slot2, slot3, slot4)
		if slot4 == -1 then
			return
		end

		uv5 = "activityId"
		slot6 = (slot3[slot5.activityId] or {}).valinfo or {}
		uv7 = "activityId"

		if slot7.data[slot2][slot4] then
			slot8, slot9 = csvNext(slot7[1].cfg.costMap)
			uv10 = "activityId"

			slot10.newNum:text(slot9)

			slot10, slot11 = csvNext(slot7[1].cfg.priceShow)
			slot8 = slot10
			uv10 = "activityId"

			slot10.oldNum:text(slot11)

			slot10 = {}

			for slot14, slot15 in csvMapPairs(slot7[1].cfg.award) do
				if slot14 == "cards" then
					for slot19, slot20 in ipairs(slot15) do
						table.insert(slot10, {
							key = "card",
							num = slot20
						})
					end
				else
					table.insert(slot10, {
						key = slot14,
						num = slot15
					})
				end
			end

			uv11 = "activityId"
			slot11 = slot11.datas
			slot12 = slot11

			slot11.set(slot12, slot10)

			slot11 = slot7[1].cfg.countType
			uv12 = "activityId"

			slot12.txt:text(string.format(gLanguageCsv.activityBuyLimit, 0, slot7[1].cfg.buyMax))

			if slot6[slot7[1].id] and slot6[slot7[1].id].times and slot6[slot7[1].id].times > 0 then
				slot12 = cache.setShader
				uv13 = "activityId"

				slot12(slot13.buyBtn, false, "hsl_gray")

				uv12 = "activityId"
				slot12 = slot12.txt
				slot12 = slot12.text

				slot12(slot12, string.format(gLanguageCsv.activityBuyLimit, 1, slot7[1].cfg.buyMax))

				uv12 = "activityId"
				slot12 = slot12.buyBtn:get("label")
				slot12 = slot12.text

				slot12(slot12, gLanguageCsv.sellout)

				uv12 = "activityId"

				slot12.buyBtn:setTouchEnabled(false)
			elseif slot1 < slot2 then
				slot12 = cache.setShader
				uv13 = "activityId"

				slot12(slot13.buyBtn, false, "hsl_gray")

				uv12 = "activityId"
				slot12 = slot12.buyBtn:get("label")
				slot12 = slot12.text

				slot12(slot12, gLanguageCsv.rushToPurchase)

				uv12 = "activityId"

				slot12.buyBtn:setTouchEnabled(false)
			elseif slot11 ~= 2 and slot2 <= slot1 then
				slot12 = cache.setShader
				uv13 = "activityId"

				slot12(slot13.buyBtn, false, "normal")

				uv12 = "activityId"
				slot12 = slot12.buyBtn:get("label")
				slot12 = slot12.text

				slot12(slot12, gLanguageCsv.rushToPurchase)

				uv12 = "activityId"

				slot12.buyBtn:setTouchEnabled(true)
			elseif slot11 == 2 and slot2 < slot1 then
				slot12 = cache.setShader
				uv13 = "activityId"

				slot12(slot13.buyBtn, false, "hsl_gray")

				uv12 = "activityId"
				slot12 = slot12.buyBtn:get("label")
				slot12 = slot12.text

				slot12(slot12, gLanguageCsv.overdue)

				uv12 = "activityId"

				slot12.buyBtn:setTouchEnabled(false)
			elseif slot11 == 2 and slot1 == slot2 then
				slot12 = cache.setShader
				uv13 = "activityId"

				slot12(slot13.buyBtn, false, "normal")

				uv12 = "activityId"
				slot12 = slot12.buyBtn:get("label")
				slot12 = slot12.text

				slot12(slot12, gLanguageCsv.rushToPurchase)

				uv12 = "activityId"

				slot12.buyBtn:setTouchEnabled(true)
			end
		end
	end, "discount")
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyEndtime = gGameModel.role:read("yy_endtime")
	slot0.rmb = gGameModel.role:getIdler("rmb")
end

function slot1.onBuy(slot0)
	slot2, slot3 = csvNext(slot0.data[slot0.showTab:read()][slot0.tabIndex:read()][1].cfg.costMap)

	if slot0.rmb:read() < slot3 then
		uiEasy.showDialog("rmb")
	else
		gGameUI:showDialog({
			btnType = 2,
			clearFast = true,
			isRich = true,
			content = dataEasy.getTextScrollStrs(string.format(gLanguageCsv.serverOpenDiscount, slot3)),
			cb = function ()
				uv4 = "gGameApp"
				uv5 = "requestServer"

				gGameApp:requestServer("/game/yy/award/get", function (slot0)
					uv1 = "showTab"

					if slot1.showTab:read() == 0 then
						sdk.trackEvent("discount_7d1")
					else
						uv1 = "showTab"

						if slot1.showTab:read() == 1 then
							sdk.trackEvent("discount_7d2")
						end
					end

					gGameUI:showGainDisplay(slot0)
				end, slot4.activityId, slot5.id)
			end,
			dialogParams = {
				clickClose = false
			}
		})
	end
end

return slot1
