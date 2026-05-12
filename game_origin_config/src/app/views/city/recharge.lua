slot0 = class("RechargeView", cc.load("mvc").ViewBase)

function slot1(slot0, slot1, slot2)
	slot3 = rich.createWithWidth("#C0x5B545B#" .. slot0, slot1, nil, slot2):align(cc.p(0, 0), 0, 0)

	return ccui.Layout:create():size(slot2, slot3:size().height):add(slot3)
end

function slot2(slot0)
	return matchLanguage({
		"cn"
	}) and gCommonConfigCsv.rechargeVip <= slot0 and dataEasy.isUnlock(gUnlockCsv.vipDistinguished) or not matchLanguage({
		"cn"
	}) and csvSize(gVipCsv[gGameModel.monthly_record:read("vip")].monthGift) >= 1
end

slot0.RESOURCE_FILENAME = "recharge.json"
slot0.RESOURCE_BINDING = {
	rechargePanel = "rechargePanel",
	["rechargePanel.item"] = "rechargeItem",
	["topPanel.maxPanel"] = "topMaxPanel",
	["privilegePanel.bg"] = "privilegePanelBg",
	["privilegePanel.panel"] = "privilegeItem",
	["privilegePanel.mask"] = "mask",
	["topPanel.normalPanel"] = "topNormalPanel",
	["topPanel.barBg"] = "barBg",
	privilegePanel = "privilegePanel",
	["topPanel.btn"] = {
		varname = "topPanelBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
			}
		}
	},
	["topPanel.btnVip"] = {
		varname = "btnVip",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onVipClick")
				}
			},
			{
				event = "visible",
				idler = bindHelper.self("vipSum"),
				method = function ()
					error("Decompilation failed")
					-- Exception in function building!
					-- Traceback (most recent call last):
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
					--     return _build_function_definition(prototype, state.header)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
					--     node.statements.contents = _build_function_blocks(state, instructions)
					--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
					--     statement, line_marked_elements = _build_statement(state, addr, instruction)
					--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
					--     return _build_var_assignment(state, addr, instruction)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
					--     assn = func(*args, **kwargs)
					--            ^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
					--     expression = _build_const_expression(state, addr, instruction)
					--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
					--     return _build_string_constant(state, instruction.CD)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
					--     node.value = state.constants.complex_constants[index]
					--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
					-- IndexError: list index out of range
				end
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "onHonourableVip",
					onNode = function (slot0)
						slot0:xy(170, 170)
					end
				}
			}
		}
	},
	["topPanel.btn.label"] = {
		binds = {
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			},
			{
				event = "text",
				idler = bindHelper.self("selectRecharge"),
				method = function (slot0)
					if slot0 then
						return gLanguageCsv.spacePrivilege
					end

					return gLanguageCsv.spaceRecharge
				end
			}
		}
	},
	["topPanel.bar"] = {
		varname = "topBar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				maskImg = "common/icon/mask_bar_red.png",
				data = bindHelper.self("expProgress")
			}
		}
	},
	["topPanel.barNum"] = {
		varname = "barNum",
		binds = {
			event = "text",
			idler = bindHelper.self("expProgressNum")
		}
	},
	["rechargePanel.list"] = {
		varname = "rechargeList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				backupCached = false,
				data = bindHelper.self("rechargeDatas"),
				item = bindHelper.self("rechargeItem"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.sortValue ~= slot1.sortValue then
						return slot1.sortValue < slot0.sortValue
					end

					return slot0.csvId < slot1.csvId
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg

					slot1:get("icon"):texture(slot4.icon)
					slot1:get("price"):text(string.format(gLanguageCsv.symbolMoney, slot4.rmbDisplay))
					text.addEffect(slot1:get("price"), {
						color = ui.COLORS.NORMAL.WHITE,
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})
					slot1:get("gain"):text(slot4.rmb)
					slot1:get("extraInfo"):text(string.format(gLanguageCsv.rechargeFirstExtra, slot4.firstPresent))
					slot1:get("extraInfo"):visible(slot3.rechargeBuyTimes == 0 and slot4.firstPresent ~= 0)
					slot1:get("doublePanel"):visible(slot3.rechargeBuyTimes == 0 and slot4.firstPresent ~= 0)
					bind.touch(slot0, slot1, {
						clicksafe = true,
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onRechargeClick")
			}
		}
	},
	["privilegePanel.pageView"] = {
		varname = "pageView",
		binds = {
			event = "extend",
			class = "pageview",
			props = {
				data = bindHelper.self("privilegeDatas"),
				item = bindHelper.self("privilegeItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					idlereasy.if_(slot3.show, function ()
						uv0 = "get"
						slot0 = slot0:get("list")
						slot1 = slot0:size()

						slot0:setScrollBarEnabled(false)
						slot0:setItemsMargin(15)
						slot0:removeAllChildren()

						for slot5 = 1, math.huge do
							uv6 = "list"

							if slot6.vipDescCfg["desc" .. slot5] == nil or slot6 == "" then
								break
							end

							uv7 = "size"

							slot0:pushBackCustomItem(slot7(slot6, 40, slot1.width))
						end

						slot2 = slot0.adaptTouchEnabled

						slot2(slot0)

						uv2 = "get"
						slot2 = slot2:get("name")
						slot3 = slot2
						slot4 = string.format
						uv6 = "setScrollBarEnabled"

						slot2.text(slot3, slot4("V%d %s", slot6, gLanguageCsv.privilege))

						slot2 = uiEasy.createItemsToList
						uv3 = "setItemsMargin"
						uv4 = "get"
						slot5 = slot4
						uv5 = "list"

						slot2(slot3, slot4.get(slot5, "propList"), slot5.vipCfg.gift, {
							scale = 1,
							margin = 0
						})

						uv2 = "get"
						slot4 = "oldPrice"
						slot2 = slot2:get(slot4)
						slot2 = slot2.text
						uv4 = "list"

						slot2(slot2, slot4.vipCfg.oldPrice)

						uv2 = "get"
						slot4 = "line"
						slot2 = slot2:get(slot4)
						slot2 = slot2.size
						uv4 = "get"
						slot4 = slot4:get("oldPrice")
						slot5 = slot4
						uv5 = "get"

						slot2(slot2, 100 + slot4.size(slot5).width, slot5:get("line"):size().height)

						uv2 = "get"
						slot4 = "price"
						slot2 = slot2:get(slot4)
						slot3 = slot2
						uv4 = "list"
						slot4 = slot4.vipCfg.newPrice

						slot2.text(slot3, slot4)

						uv3 = "setItemsMargin"
						uv4 = "get"
						slot4 = slot4:get("btn")
						slot5 = {
							methods = {
								ended = functools.partial(slot8.clickCell, slot9, slot10)
							}
						}
						uv8 = "setItemsMargin"
						uv9 = "setScrollBarEnabled"
						uv10 = "list"

						bind.touch(slot3, slot4, slot5)

						uv4 = "list"
						slot4 = slot4.hasBuy
						uv4 = "list"
						slot4 = slot4.vipLevelEnough
						uv4 = "list"

						function slot4(slot0, slot1, slot2, slot3)
							uv4 = "get"
							slot4 = slot4:get("btn")
							slot5 = slot4:get("label")

							cache.setShader(slot4, false, "hsl_gray")
							text.deleteAllEffect(slot5)
							text.addEffect(slot5, {
								color = ui.COLORS.DISABLED.WHITE
							})

							if slot1 then
								slot5:text(gLanguageCsv.hasBuy)
								slot4:setTouchEnabled(false)
							else
								slot5:text(gLanguageCsv.spaceBuy)
								slot4:setTouchEnabled(true)

								if slot2 and not slot3 then
									uv10 = "btn"

									slot5:text(string.format(gLanguageCsv.lvnCanBuy, slot10.vipCfg.giftLevelLimit))
								elseif slot2 then
									cache.setShader(slot4, false, "normal")
									text.addEffect(slot5, {
										color = ui.COLORS.NORMAL.WHITE,
										glow = {
											color = ui.COLORS.GLOW.WHITE
										}
									})
								end
							end
						end

						uv4 = "setItemsMargin"
						uv5 = "setScrollBarEnabled"

						idlereasy.any({
							slot4,
							slot4,
							slot4.roleLevelEnough
						}, slot4):anonyOnly(slot4, slot5)
					end)
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				clickCell = bindHelper.self("onPrivilegeGiftBuy"),
				afterBuild = bindHelper.self("onPrivilegeAfterBuild")
			}
		}
	},
	["privilegePanel.leftBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPrivilegeLeftBtnClick")
			}
		}
	},
	["privilegePanel.rightBtn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPrivilegeRightBtnClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:enableSchedule()
	adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.rechargeList,
			"width"
		},
		{
			slot0.rechargeList,
			"pos",
			"left"
		},
		{
			slot0.privilegePanelBg,
			"width"
		}
	})

	slot1 = slot1 or {}

	gGameModel.currday_dispatch:getIdlerOrigin("vipGift"):set(true)
	slot0:initModel()
	gGameUI.topuiManager:createView("recharge", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init()
	slot0.pageView:setTouchEnabled(false)
	slot0.privilegePanel:get("panel.list"):setScrollBarEnabled(false)
	slot0.privilegePanel:get("panel.propList"):setScrollBarEnabled(false)
	slot0:setBarSize()

	slot0.selectRecharge = idler.new(not slot1.showPrivilege and not slot1.privilegeIndex)

	for slot6, slot7 in orderCsvPairs(csv.recharges) do
		if matchLanguage(slot7.languages) and slot7.type == 1 then
			-- Nothing
		end
	end

	slot0.rechargeDatas = idlers.newWithMap({
		[slot6] = {
			rechargeBuyTimes = 0,
			csvId = slot6,
			cfg = slot7
		}
	})

	idlereasy.when(slot0.recharges, function (slot0, slot1)
		uv2 = "rechargeDatas"

		for slot5, slot6 in slot2.rechargeDatas:pairs() do
			slot8 = slot6
			slot7 = slot6.proxy(slot8)
			uv8 = "rechargeDatas"
			slot7.rechargeBuyTimes = slot8:getRechargeBuyTimes(slot5)
			slot7.sortValue = slot7.cfg.sortValue
		end

		uv2 = "rechargeDatas"

		if slot2.rechargeList.sortItems then
			uv2 = "rechargeDatas"

			slot2.rechargeList:sortItems()
		end
	end)

	slot0.expProgress = idler.new(0)
	slot0.expProgressNum = idler.new("")

	if slot1.showPrivilege or slot1.privilegeIndex then
		slot4 = slot0.vipLevel:read()
		slot5 = math.min(slot4 + 1, game.VIP_LIMIT)

		for slot9 = slot4, 1, -1 do
			if slot0.vipGift:read()[slot9] ~= 0 then
				slot5 = slot9

				break
			end
		end

		slot0.showPrivilegeIndex = slot5
	else
		slot0.showPrivilegeIndex = slot0.vipLevel:read()
	end

	slot0.showPrivilegeIndex = cc.clampf(slot0.showPrivilegeIndex, 1, game.VIP_LIMIT)
	slot0.privilegeIndex = idler.new(slot0.showPrivilegeIndex)

	for slot7 = 1, game.VIP_LIMIT do
	end

	slot0.privilegeDatas = {
		[slot7] = {
			show = idler.new(slot7 == slot0.showPrivilegeIndex),
			vipDescCfg = csv.vip_desc[slot7 + 1],
			vipCfg = gVipCsv[slot7],
			hasBuy = idler.new(false),
			vipLevelEnough = idler.new(false),
			roleLevelEnough = idler.new(false)
		}
	}

	idlereasy.any({
		slot0.vipLevel,
		slot0.vipSum
	}, function (slot0, slot1, slot2)
		slot3 = math.min(slot1, game.VIP_LIMIT)
		slot4 = slot3

		if slot3 == game.VIP_LIMIT then
			uv5 = "math"
			slot5 = slot5.topNormalPanel
			slot5 = slot5.hide

			slot5(slot5)

			uv5 = "math"
			slot5 = slot5.topMaxPanel
			slot5 = slot5.show

			slot5(slot5)

			uv5 = "math"

			slot5.topMaxPanel:get("vipIcon"):texture(ui.VIP_ICON[slot3])
		else
			slot4 = slot3 + 1
			uv5 = "math"
			slot5 = slot5.topMaxPanel
			slot5 = slot5.hide

			slot5(slot5)

			uv5 = "math"
			slot5 = slot5.topNormalPanel
			slot5 = slot5.show

			slot5(slot5)

			uv5 = "math"
			slot5 = slot5.topNormalPanel:multiget("label1", "vipIcon1", "label2", "diamondIcon", "num", "label3", "vipIcon2")

			slot5.num:text(gVipCsv[slot4].upSum - slot2)
			slot5.vipIcon2:texture(ui.VIP_ICON[slot4])

			if slot3 < 1 then
				itertools.invoke({
					slot5.label1,
					slot5.vipIcon1
				}, "hide")
				slot5.label2:x(slot5.label1:x())
				adapt.oneLinePos(slot5.label2, {
					slot5.diamondIcon,
					slot5.num,
					slot5.label3,
					slot5.vipIcon2
				}, cc.p(10, 0))
			else
				itertools.invoke({
					slot5.label1,
					slot5.vipIcon1
				}, "show")
				slot5.vipIcon1:texture(ui.VIP_ICON[slot3])
				adapt.oneLinePos(slot5.label1, {
					slot5.vipIcon1,
					slot5.label2,
					slot5.diamondIcon,
					slot5.num,
					slot5.label3,
					slot5.vipIcon2
				}, cc.p(10, 0))
			end
		end

		uv5 = "min"

		if slot5(slot2) and not userDefault.getForeverLocalKey("rechargeVip", false) then
			uv5 = "math"

			if slot5:isShowVipGift() then
				uv5 = "math"

				slot5:onVipClick()
				userDefault.setForeverLocalKey("rechargeVip", true)
			end
		end

		uv5 = "math"
		slot5 = slot5.setBarSize

		slot5(slot5)

		uv5 = "math"
		slot5 = slot5.expProgress
		slot5 = slot5.set

		slot5(slot5, math.min(100 * slot2 / gVipCsv[slot4].upSum, 100))

		uv5 = "math"

		slot5.expProgressNum:set(string.format("%d/%d", slot2, gVipCsv[slot4].upSum))
	end)
	idlereasy.when(slot0.vipLevel, function (slot0, slot1)
		uv3 = "ipairs"

		for slot5, slot6 in ipairs(slot3.privilegeDatas) do
			slot6.vipLevelEnough:set(slot5 <= slot1)
		end
	end)
	idlereasy.when(slot0.roleLevel, function (slot0, slot1)
		uv3 = "ipairs"

		for slot5, slot6 in ipairs(slot3.privilegeDatas) do
			slot6.roleLevelEnough:set(slot6.vipCfg.giftLevelLimit <= slot1)
		end
	end)
	idlereasy.when(slot0.vipGift, function (slot0, slot1)
		for slot5, slot6 in pairs(slot1) do
			uv7 = "pairs"

			if slot7.privilegeDatas[slot5] then
				slot7.hasBuy:set(slot6 == 0 and true or false)
			end
		end
	end)
	idlereasy.when(slot0.selectRecharge, function (slot0, slot1)
		if slot1 == true then
			slot2 = gGameUI.topuiManager
			slot2 = slot2.updateTitle

			slot2(slot2, gLanguageCsv.recharge, "RECHARGE")

			uv2 = "gGameUI"
			slot2 = slot2.rechargePanel
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "gGameUI"

			slot2.privilegePanel:hide()
		else
			slot2 = gGameUI.topuiManager
			slot2 = slot2.updateTitle

			slot2(slot2, gLanguageCsv.privilege, "PRIVILEGE")

			uv2 = "gGameUI"
			slot2 = slot2.rechargePanel
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "gGameUI"

			slot2.privilegePanel:show()
		end
	end)
	idlereasy.when(slot0.privilegeIndex, function (slot0, slot1)
		slot2 = cc.clampf(slot1, 1, game.VIP_LIMIT)
		uv2 = "cc"
		slot2 = slot2.privilegePanel:get("leftBtn")
		slot2 = slot2.visible

		slot2(slot2, slot2 > 1)

		uv2 = "cc"
		slot2 = slot2.privilegePanel:get("rightBtn")
		slot2 = slot2.visible

		slot2(slot2, slot1 < game.VIP_LIMIT)

		uv2 = "cc"
		slot2 = slot2.showPrivilegePage

		slot2(slot2, slot1)

		uv2 = "cc"

		slot2.pageView:setCurrentPageIndex(slot1 - 1)
	end)
	slot0:initPrivilegeListener()
	widget.addAnimationByKey(slot0.btnVip, "effect/guizu.skel", "efc1", "effect_loop", 6):alignCenter(slot0.btnVip:size())
	slot0.btnVip:setEnabled(slot0:isShowVipGift())
end

function slot0.initModel(slot0)
	slot0.recharges = gGameModel.role:getIdler("recharges")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.vipSum = gGameModel.role:getIdler("vip_sum")
	slot0.vipGift = gGameModel.role:getIdler("vip_gift")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.roleLevel = gGameModel.role:getIdler("level")
end

function slot0.initPrivilegeListener(slot0)
	uiEasy.addTouchOneByOne(slot0.mask, {
		ended = function (slot0, slot1, slot2)
			uv3 = "selectRecharge"

			if not slot3.selectRecharge:read() and math.abs(slot1) > 100 and math.abs(slot2) < math.abs(slot1) then
				slot3 = slot1 > 0 and -1 or 1
				uv4 = "selectRecharge"

				slot4.privilegeIndex:modify(function (slot0)
					uv2 = "cc"

					return true, cc.clampf(slot0 + slot2, 1, game.VIP_LIMIT)
				end)
			end
		end
	})
end

function slot0.getRechargeBuyTimes(slot0, slot1)
	if slot0.recharges:read()[slot1] then
		if (slot2.reset or 0) > 0 then
			return 0
		end

		return slot2.cnt
	end

	return 0
end

function slot0.onPrivilegeAfterBuild(slot0, slot1)
	slot1:setCurrentPageIndex(slot0.showPrivilegeIndex - 1)
end

function slot0.onChangeClick(slot0)
	slot0.selectRecharge:modify(function (slot0)
		return true, not slot0
	end)
end

function slot0.onRechargeClick(slot0, slot1, slot2, slot3)
	gGameApp:payCustom(slot0):params({
		rechargeId = slot2
	}):wait(5):doit()
end

function slot0.onPrivilegeGiftBuy(slot0, slot1, slot2, slot3)
	if not slot3.vipLevelEnough:read() then
		gGameUI:showTip(gLanguageCsv.vipNotEnough)
	elseif not slot3.roleLevelEnough:read() then
		gGameUI:showTip(string.format(gLanguageCsv.lvnCanBuy, slot3.vipCfg.giftLevelLimit))
	elseif matchLanguage({
		"kr"
	}) then
		dataEasy.sureUsingDiamonds(function ()
			uv0 = "rmb"
			slot0 = slot0.rmb
			slot1 = slot0
			uv1 = "read"

			if slot0.read(slot1) < slot1.vipCfg.newPrice then
				gGameUI:showTip(gLanguageCsv.noDiamondGoRecharge)
			else
				uv5 = "vipCfg"

				gGameApp:requestServer("/game/role/vipgift/buy", function (slot0)
					gGameUI:showGainDisplay(slot0)
				end, slot5)
			end
		end, slot3.vipCfg.newPrice, nil, string.format(gLanguageCsv.sureBuyVipGift, slot2))
	else
		gGameUI:showDialog({
			clearFast = true,
			btnType = 2,
			content = string.format(gLanguageCsv.sureBuyVipGift, slot2),
			cb = slot5,
			dialogParams = {
				clickClose = false
			}
		})
	end
end

function slot0.onPrivilegeLeftBtnClick(slot0)
	slot0.privilegeIndex:modify(function (slot0)
		return true, slot0 - 1
	end)
end

function slot0.onPrivilegeRightBtnClick(slot0)
	slot0.privilegeIndex:modify(function (slot0)
		return true, slot0 + 1
	end)
end

function slot0.showPrivilegePage(slot0, slot1)
	if slot1 >= 1 and slot1 <= game.VIP_LIMIT then
		slot0.privilegeDatas[slot1].show:set(true)

		return true
	end
end

function slot0.isShowVipGift(slot0)
	return matchLanguage({
		"cn"
	}) or csvSize(gVipCsv[gGameModel.monthly_record:read("vip")].monthGift) >= 1
end

function slot0.onVipClick(slot0)
	if matchLanguage({
		"cn"
	}) then
		gGameUI:stackUI("city.recharge_vip")
	else
		gGameUI:stackUI("city.vip_distinguished")
	end
end

function slot0.setBarSize(slot0)
	if gCommonConfigCsv.rechargeVip <= slot0.vipSum:read() then
		uv6 = "barBg"

		if slot6(slot5) then
			slot4 = ((slot0.topPanelBtn:x() - slot0.barBg:x() - slot0.topPanelBtn:width() / 2 - 62) / slot0.barBg:scale() * slot2 - slot0.btnVip:width() * slot0.btnVip:scale() - slot1) / slot2
		end
	end

	slot6 = slot0.barBg:x() + slot4 * slot2 / 2

	slot0.barBg:width(slot4)
	slot0.topBar:setContentSize(slot4, slot0.topBar:height())
	slot0.topBar:x(slot6)
	slot0.barNum:x(slot6)
end

return slot0
