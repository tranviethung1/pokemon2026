slot0 = class("YyBetShop", cc.load("mvc").ViewBase)
slot1 = {
	canbuy = 1,
	sellout = 2
}
slot0.RESOURCE_FILENAME = "yybet_shop.json"
slot0.RESOURCE_BINDING = {
	["creditsPanel.coupon"] = "imgCoupon",
	item = "item",
	subList = "subList",
	bg = "bg",
	["creditsPanel.textNum"] = {
		varname = "textCreditsNum",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["creditsPanel.text"] = {
		varname = "textCreditsNote",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	centerList = {
		varname = "centerList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				xMargin = 0,
				asyncPreload = 12,
				leftPadding = 1,
				data = bindHelper.self("datas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("title", "tip", "mask", "item", "icon", "num", "btnBuy", "tip", "textLimit")
					slot5 = slot0.getTools().getCsv("shop")[slot3.csvId]
					slot6, slot7 = csvNext(slot5.goods)
					slot8, slot9 = csvNext(slot5.cost)
					slot10 = slot5.desc

					if slot6 == "card" then
						slot10 = csv.cards[slot7.id].name
						slot7 = slot7.id
					else
						slot10 = dataEasy.getCfgByKey(slot6).name
					end

					slot11, slot12 = uiEasy.setIconName(slot6, slot7)

					slot4.title:text(slot11)

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
					end

					text.addEffect(slot4.title, slot12)
					bind.extend(slot0, slot4.icon, {
						class = "icon_key",
						props = {
							noListener = true,
							simpleShow = true,
							data = {
								key = slot6,
								num = slot6 == "card" and slot7 or nil
							},
							specialKey = {
								maxStar = true
							},
							onNode = function (slot0)
								slot0:setTouchEnabled(false)
								slot0:scale(1.2)
							end
						}
					})
					slot4.icon:setTouchEnabled(false)

					if slot6 ~= "card" then
						slot4.num:text("x" .. slot7):show()
					else
						slot4.num:hide()
					end

					slot14 = slot4.btnBuy:get("text")

					cache.setShader(slot4.btnBuy, false, "normal")
					slot14:text(slot9)
					adapt.oneLineCenterPos(cc.p(210, slot14:y()), {
						slot4.btnBuy:get("credits"):texture(slot3.iconRes),
						slot14
					}, cc.p(10, 0))
					slot4.textLimit:text(slot5.exchangeLimit - slot3.step .. "/" .. slot5.exchangeLimit)
					adapt.oneLineCenterPos(cc.p(230, slot4.tip:y()), {
						slot4.tip,
						slot4.textLimit
					}, cc.p(10, 0))

					if slot3.step < slot5.exchangeLimit then
						slot4.mask:hide()
						slot13:setTouchEnabled(true)
						bind.touch(slot0, slot13, {
							clicksafe = true,
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
						bind.touch(slot0, slot1, {
							clicksafe = true,
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
						text.addEffect(slot14, {
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
						slot4.mask:show()
						cache.setShader(slot13, false, "hsl_gray")
						text.deleteAllEffect(slot14)
						text.addEffect(slot14, {
							color = ui.COLORS.DISABLED.WHITE
						})
						slot4.mask:get("label"):text(gLanguageCsv.sellout)
						text.addEffect(slot4.textLimit, {
							color = ui.COLORS.QUALITY[4]
						})
					end

					slot0:setRenderHint(0)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick"),
				getTools = bindHelper.self("getTools")
			}
		}
	},
	leftPanel = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onGet")
				}
			},
			{
				res = "spine/battlebet/zhuchiren.skel",
				action = "standby_loop",
				event = "animation",
				scale = 2.2,
				pos = {
					x = 200,
					y = 50
				}
			}
		}
	},
	["item.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = cc.c4b(255, 255, 255, 255)
				}
			}
		}
	}
}

function slot0.gaussianBg(slot0)
	slot1 = display.sizeInView
	slot2 = 0.5

	cache.setShader(slot0.bg, false, "gaussian_blur"):setUniformVec3("iResolution", cc.Vertex3F(slot1.width * slot2, slot1.height * slot2, 0))
end

function slot0.initTools(slot0)
	slot0.tools = require("app.views.city.activity.yy_bet.tools")
end

function slot0.onCreate(slot0, slot1)
	slot0:initTools()
	slot0:gaussianBg()
	slot0.tools.createTopui(slot0, slot1)

	slot0.activityId = slot1
	slot0.items = gGameModel.role:getIdler("items")

	slot0.bg:texture(slot0.tools.getBgTexture())
	slot0.imgCoupon:texture(dataEasy.getIconResByKey(csv.yunying.yyhuodong[slot1].clientParam.coin))
	idlereasy.when(slot0.items, function (slot0, slot1)
		uv2 = "scoreNum"
		uv3 = "clientParam"
		slot2.scoreNum = slot1[slot3.clientParam.coin] or 0
		uv2 = "scoreNum"
		slot2 = slot2.textCreditsNum
		slot3 = slot2
		uv4 = "scoreNum"
		slot4 = slot4.scoreNum

		slot2.text(slot3, slot4)

		uv3 = "scoreNum"
		uv4 = "scoreNum"

		adapt.oneLinePos(slot3.textCreditsNote, slot4.textCreditsNum)
	end)

	slot0.datas = idlers.new({})
	slot3 = csv.yunying.yyhuodong[slot1].paramMap.base

	idlereasy.when(gGameModel.role:getIdler("yyhuodongs"), function (slot0, slot1)
		uv2 = "stamps1"
		slot4 = {}
		uv6 = "csv"
		uv8 = "csv"

		for slot10, slot11 in orderCsvPairs(slot8.tools.getCsv("shop")) do
			uv13 = "csv"
			slot14 = "base"
			uv14 = "yunying"

			if slot11.shopID == slot13.tools.getCsv(slot14)[slot14].shopID then
				table.insert(slot4, {
					csvId = slot10,
					step = ((slot1[slot2] or {}).stamps1 or {})[slot10] or 0,
					iconRes = dataEasy.getIconResByKey(csv.yunying.yyhuodong[slot6.activityId].clientParam.coin)
				})
			end
		end

		slot7 = dataEasy.tryCallFunc
		uv8 = "csv"

		slot7(slot8.centerList, "updatePreloadCenterIndex")

		uv7 = "csv"

		slot7.datas:update(slot4)
	end)
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	slot4 = slot1.getTools().getCsv("shop")[slot3.csvId]
	slot5, slot6 = csvNext(slot4.goods)
	slot7, slot8 = csvNext(slot4.cost)

	gGameUI:stackUI("common.buy_info", nil, , {
		[slot7] = slot8
	}, {
		id = slot5,
		num = slot6
	}, {
		flag = "exchange",
		contentType = "num",
		maxNum = slot4.exchangeLimit - slot3.step
	}, slot0:createHandler("itemBuy", slot3.csvId, slot8))
end

function slot0.getTools(slot0)
	return slot0.tools
end

function slot0.itemBuy(slot0, slot1, slot2, slot3)
	if slot0.scoreNum < slot2 * slot3 then
		gGameUI:showTip(gLanguageCsv.yyBetTipNotEnough)

		return
	end

	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot1, slot3)
end

return slot0
