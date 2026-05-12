slot0 = game.YYHUODONG_TYPE_ENUM_TABLE
slot1 = {
	noReach = 0,
	received = 2,
	canReceive = 1
}
slot2 = class("ActivityFirstRecharge", Dialog)
slot2.RESOURCE_FILENAME = "activity_first_recharge.json"
slot2.RESOURCE_BINDING = {
	page5 = "page5",
	page1 = "page1",
	["page1.mask"] = "mask1",
	["page3.mask"] = "mask3",
	["page5.mask"] = "mask5",
	dot0 = "dot0",
	dot2 = "dot2",
	pageview = "pageview",
	page2 = "page2",
	["page4.mask"] = "mask4",
	dot4 = "dot4",
	dot1 = "dot1",
	dot3 = "dot3",
	page4 = "page4",
	["page2.mask"] = "mask2",
	page3 = "page3",
	["page1.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["page2.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["page3.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["page4.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["page5.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["page1.buyBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuy")
			}
		}
	},
	["page2.buyBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuy")
			}
		}
	},
	["page3.buyBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuy")
			}
		}
	},
	["page4.buyBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuy")
			}
		}
	},
	["page5.buyBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuy")
			}
		}
	},
	btnLeft = {
		varname = "btnLeft",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onIndexBefore")
			}
		}
	},
	btnRight = {
		varname = "btnRight",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onIndexNext")
			}
		}
	}
}

function slot2.onCreate(slot0)
	gGameModel.currday_dispatch:getIdlerOrigin("firstRecharge"):set(true)

	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.vipSum = gGameModel.role:getIdler("vip_sum")
	slot2 = {}
	slot6 = "yy_open"

	for slot6, slot7 in ipairs(gGameModel.role:read(slot6)) do
		slot8 = slot0.yyhuodongs:read()[slot7] or {}

		if csv.yunying.yyhuodong[slot7].independent == 1 then
			uv11 = "gGameModel"

			if slot9.type == slot11.firstRecharge and slot8.flag ~= 2 then
				table.insert(slot2, {
					id = slot7,
					state = slot8.flag,
					sortWeight = slot9.sortWeight
				})
			end
		end
	end

	table.sort(slot2, function (slot0, slot1)
		if slot0.sortWeight ~= slot1.sortWeight then
			return slot0.sortWeight < slot1.sortWeight
		end

		return slot0.id < slot1.id
	end)

	for slot6 = 1, 5 do
		slot0["page" .. slot6]:retain()
		slot0["page" .. slot6]:removeFromParent()
	end

	slot0.activityIDs = slot2
	slot0.isInserPage = false
	slot0.pages = {}
	slot7 = "list"
	slot5 = slot0.page5:get(slot7):y()
	slot0.listPos = {
		{
			x = slot0.page1:get("list"):x(),
			y = slot0.page1:get("list"):y()
		},
		{
			x = slot0.page2:get("list"):x(),
			y = slot0.page2:get("list"):y()
		},
		{
			x = slot0.page3:get("list"):x(),
			y = slot0.page3:get("list"):y()
		},
		{
			x = slot0.page4:get("list"):x(),
			y = slot0.page4:get("list"):y()
		},
		{
			x = slot0.page5:get("list"):x(),
			y = slot5
		}
	}
	uv5 = "currday_dispatch"
	slot5 = slot5.noReach
	uv5 = "currday_dispatch"
	slot5 = slot5.noReach
	uv5 = "currday_dispatch"
	slot5 = slot5.noReach
	uv5 = "currday_dispatch"
	slot5 = slot5.noReach
	uv5 = "currday_dispatch"
	slot0.states = {
		idler.new(slot5),
		idler.new(slot5),
		idler.new(slot5),
		idler.new(slot5),
		idler.new(slot5.noReach)
	}
	slot3 = {
		[3] = cc.size(610, 215),
		[4] = cc.size(808, 215),
		[5] = cc.size(910, 195)
	}

	for slot7 = 1, 5 do
		slot0["dot" .. slot7 - 1]:hide()
	end

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv3 = "ipairs"

		for slot5, slot6 in ipairs(slot3.activityIDs) do
			uv7 = "ipairs"

			slot7["dot" .. slot5 - 1]:show()

			slot8 = slot6.id
			uv8 = "ipairs"
			slot8 = slot8["page" .. csv.yunying.yyhuodong[slot8].clientParam.page]

			if slot6.state ~= 2 then
				uv9 = "ipairs"

				if not slot9.isInserPage then
					uv9 = "ipairs"
					slot9 = slot9.pageview
					slot9 = slot9.addPage

					slot9(slot9, slot8)

					uv9 = "ipairs"
					slot9.pages[slot5] = slot8
				end

				slot8:get("placard"):texture(slot7.clientParam.resBg)

				slot10 = csvSize(slot7.paramMap.award)
				slot11 = slot7.paramMap.type == 2
				slot14 = "bg"
				uv14 = "activityIDs"

				slot8:get(slot14):size(slot14[slot10])

				if slot10 == 4 then
					uv14 = "ipairs"

					slot8:get("list"):x(slot14.listPos[slot7.clientParam.page].x)
				elseif slot10 == 3 then
					uv14 = "ipairs"

					slot9:x(slot14.listPos[slot7.clientParam.page].x + 100)
				elseif slot10 == 5 then
					uv14 = "ipairs"
					slot15 = slot7.clientParam.page
					uv15 = "ipairs"

					slot9:xy(slot14.listPos[slot15].x - 50, slot15.listPos[slot7.clientParam.page].y - 12)
				end

				slot13 = slot8:get("buyBtn"):get("label")

				slot8:get("tip"):hide()

				slot14 = uiEasy.createItemsToList
				uv15 = "ipairs"

				slot14(slot15, slot9, slot7.paramMap.award, {
					scale = slot10 == 5 and 0.9 or 1
				})

				uv14 = "dot"

				if not (slot14[slot6.id] or {}).flag then
					if slot11 then
						uv15 = "ipairs"

						if slot7.paramMap.rmb < slot15.vipSum:read() then
							slot8:get("tip"):show()
						end
					end

					uv15 = "ipairs"
					uv17 = "show"

					slot15.states[slot5]:set(slot17.noReach)
					slot13:text(gLanguageCsv.goToRecharge)
					cache.setShader(slot12, false, "normal")
					text.addEffect(slot13, {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})
					slot12:setTouchEnabled(true)
				elseif slot14.flag == 1 then
					uv15 = "ipairs"
					uv17 = "show"

					slot15.states[slot5]:set(slot17.canReceive)
					slot13:text(gLanguageCsv.spaceReceive)
					cache.setShader(slot12, false, "normal")
					text.addEffect(slot13, {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})
					slot12:setTouchEnabled(true)
				elseif slot14.flag == 2 then
					uv15 = "ipairs"
					uv17 = "show"

					slot15.states[slot5]:set(slot17.received)
					slot13:text(gLanguageCsv.received)
					text.deleteAllEffect(slot13)
					cache.setShader(slot12, false, "hsl_gray")
					slot12:setTouchEnabled(false)
				end

				adapt.setTextScaleWithWidth(slot13, nil, slot12:width() - 80)
				slot8:show()
			else
				slot8:hide()
			end
		end

		uv2 = "ipairs"
		slot2.isInserPage = true
	end)

	slot0.curPage = idler.new(0)
	slot5 = slot0.pageview:getInnerContainer():size().width
	slot6 = #slot0.pageview:getPages()
	slot0.isEnter = false

	slot0.pageview:onScroll(function (slot0)
		uv1 = "getPositionX"
		slot1 = slot1:getPositionX()
		slot2 = {}
		uv5 = "itertools"
		slot5 = slot5.mask1
		uv5 = "itertools"
		slot5 = slot5.mask2
		uv5 = "itertools"
		slot5 = slot5.mask3
		uv5 = "itertools"
		slot5 = slot5.mask4
		uv5 = "itertools"

		itertools.invoke({
			slot5,
			slot5,
			slot5,
			slot5,
			slot5.mask5
		}, "show")

		if slot0.name == "AUTOSCROLL_ENDED" then
			uv4 = "invoke"

			for slot6 = 1, slot4 do
				uv7 = "mask1"

				if math.abs(slot1 - -slot7 * (slot6 - 1)) <= 5 then
					uv8 = "itertools"
					slot8.isEnter = true
					slot8 = itertools.invoke
					uv10 = "itertools"
					slot10 = slot10.mask1
					uv10 = "itertools"
					slot10 = slot10.mask2
					uv10 = "itertools"
					slot10 = slot10.mask3
					uv10 = "itertools"
					slot10 = slot10.mask4
					uv10 = "itertools"

					slot8({
						slot10,
						slot10,
						slot10,
						slot10,
						slot10.mask5
					}, "hide")

					uv8 = "itertools"
					slot8 = slot8.curPage
					slot9 = slot8
					uv9 = "itertools"

					if slot8.read(slot9) ~= slot9.pageview:getCurPageIndex() then
						uv8 = "itertools"
						uv10 = "itertools"

						slot8.curPage:set(slot10.pageview:getCurPageIndex())
					end

					return
				end
			end
		end

		uv3 = "itertools"

		if slot3.isEnter or slot0.name == "AUTOSCROLL_BEGAN" then
			uv3 = "itertools"
			slot3.isEnter = false
			uv5 = "itertools"
			slot5 = slot5.mask1
			uv5 = "itertools"
			slot5 = slot5.mask2
			uv5 = "itertools"
			slot5 = slot5.mask3
			uv5 = "itertools"
			slot5 = slot5.mask4
			uv5 = "itertools"

			itertools.invoke({
				slot5,
				slot5,
				slot5,
				slot5,
				slot5.mask5
			}, "hide")
		end
	end)
	slot0.curPage:addListener(function (slot0, slot1, slot2)
		uv3 = "dot"

		if slot3 > 1 then
			uv3 = "itertools"
			slot4 = "dot" .. slot1
			uv4 = "itertools"
			slot4 = slot4["dot" .. slot0]
			slot5 = itertools.invoke
			slot6 = {
				slot3[slot4]
			}

			if slot1 == slot0 then
				uv7 = "itertools"

				if not slot7.dot1 then
					slot7 = slot4
				end
			end

			slot6[2] = slot7

			slot5(slot6, "show")
			slot3:texture("common/icon/logo_normal_fy.png")
			slot4:texture("common/icon/logo_highlight_fy.png")
		end

		uv3 = "itertools"
		slot3 = slot3.btnRight
		slot3 = slot3.visible
		uv5 = "dot"

		slot3(slot3, slot0 < slot5 - 1)

		uv3 = "itertools"
		slot3 = slot3.btnLeft
		slot3 = slot3.visible

		slot3(slot3, slot0 > 0)

		uv3 = "itertools"

		slot3.pageview:scrollToPage(slot0)
	end)
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot2.onIndexBefore(slot0)
	if slot0.curPage:read() > 0 then
		slot0.curPage:set(slot0.curPage:read() - 1)
	end
end

function slot2.onIndexNext(slot0)
	if slot0.curPage:read() < itertools.size(slot0.pages) - 1 then
		slot1 = slot0.curPage:read() + 1

		slot0.curPage:set(slot1)

		if slot1 == 3 then
			sdk.trackEvent("check_allfirst")
		end
	end
end

function slot2.onBuy(slot0)
	slot1, slot2 = nil
	slot3 = slot0.states[itertools.size(slot0.pages) > 1 and slot0.pageview:getCurPageIndex() + 1 or next(slot0.pages)]
	slot4 = slot3
	uv4 = "itertools"

	if slot3.read(slot4) == slot4.noReach then
		gGameUI:stackUI("city.recharge", nil, {
			full = true
		})
	else
		slot3 = slot0.states[slot1]
		slot4 = slot3
		uv4 = "itertools"

		if slot3.read(slot4) == slot4.canReceive then
			gGameApp:requestServer("/game/yy/award/get", function (slot0)
				gGameUI:showGainDisplay(slot0)
			end, slot0.activityIDs[slot1].id)
		end
	end
end

return slot2
