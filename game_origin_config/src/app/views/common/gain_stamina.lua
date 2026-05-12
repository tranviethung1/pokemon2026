slot0 = require("app.views.city.activity.month_card")
slot1 = cc.load("mvc").ViewBase
slot2 = class("GainStaminaView", Dialog)
slot2.RESOURCE_FILENAME = "common_gain_stamina.json"
slot2.RESOURCE_BINDING = {
	downPanel = "downPanel",
	["pricePanel.priceNote"] = "priceNote",
	["pricePanel.price"] = "priceText",
	content = "content",
	["content.doublePanel"] = "doublePanel",
	["content.leftTimes2"] = "leftTimes2",
	["content.leftTimes1"] = "leftTimes1",
	["pricePanel.icon"] = "priceIcon",
	["downPanel.item"] = "item",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["content.num"] = {
		varname = "rmbNum",
		binds = {
			event = "text",
			idler = bindHelper.self("staminaBuyRecover")
		}
	},
	buyBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuyItem")
			}
		}
	},
	["buyBtn.text"] = {
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
	["downPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("staminaItem"),
				dataOrderCmp = function (slot0, slot1)
					if slot0.quality ~= slot1.quality then
						return slot0.quality < slot1.quality
					else
						return slot0.staminanum < slot1.staminanum
					end
				end,
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:get("icon"), {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.num
							},
							onNode = function (slot0)
								uv2 = "bind"
								uv6 = "bind"
								uv7 = "click"
								uv8 = "functools"

								bind.click(slot2, slot0, {
									method = functools.partial(slot6.clickCell, slot7, slot8)
								})
							end
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
	}
}

function slot2.onCreate(slot0)
	slot0:initModel()

	slot0.price = idler.new(0)
	slot0.staminaBuyRecover = idler.new(gCommonConfigCsv.staminaBuyRecover)
	slot0.staminaItem = idlers.newWithMap({})

	slot0.content:get("multiple"):hide()
	adapt.oneLineCenterPos(cc.p(775, 400), {
		slot0.content:get("icon"),
		slot0.content:get("num")
	})

	slot0.leftTimes = idlereasy.any({
		slot0.vipLevel,
		slot0.buyStaminaTimes,
		slot0.trainerLevel
	}, function (slot0, slot1, slot2, slot3)
		slot5 = dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.StaminaBuyTimes)
		uv5 = "gVipCsv"

		if slot5:refreshNumPanel(slot2, gVipCsv[slot1].buyStaminaTimes + slot5) == 0 and game.VIP_LIMIT <= slot1 then
			slot5 = -1
		end

		slot7 = gCostCsv.stamina_buy_cost
		slot6 = clone(slot7)
		uv7 = "buyStaminaTimes"

		if slot7.getPrivilegeAddition("staminaBuyFreeTimes") then
			for slot11 = 1, slot7 do
				table.insert(slot6, 1, 0)
			end
		end

		slot9 = slot2 + 1
		uv9 = "gVipCsv"

		slot9.price:set(slot6[math.min(slot9, table.length(slot6))])

		return true, slot5
	end)

	idlereasy.any({
		slot0.price,
		slot0.rmb
	}, function (slot0, slot1, slot2)
		uv3 = "priceText"

		slot3.priceText:text(slot1)

		uv5 = "priceText"
		slot5 = slot5.priceText
		slot6 = {
			color = slot2 < slot1 and ui.COLORS.NORMAL.RED or ui.COLORS.NORMAL.DEFAULT
		}

		text.addEffect(slot5, slot6)

		uv5 = "priceText"
		slot5 = slot5.priceText
		uv6 = "priceText"
		slot6 = slot6.priceNote

		adapt.oneLinePos(slot5, slot6, cc.p(10, 0), "right")

		uv5 = "priceText"
		uv6 = "priceText"

		adapt.oneLinePos(slot5.priceText, slot6.priceIcon, cc.p(10, 0))
	end)

	slot1 = csv.items
	slot2 = 0

	idlereasy.any({
		slot0.items
	}, function ()
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
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
		--     return _build_numeric_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
		--     number = state.constants.numeric_constants[index]
		--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end)

	if slot0.relicBuff then
		idlereasy.when(slot0.relicBuff, function (slot0, slot1)
			uv3 = "uiEasy"
			slot3 = slot3.content
			uv3 = "uiEasy"

			slot3:relicAddAttr(uiEasy.addRelicIcon(slot3, slot1, game.RELIC_BUFF.BUY_STAMINA), slot1)
		end)
	end

	Dialog.onCreate(slot0, {
		clickClose = false
	})
end

function slot2.refreshNumPanel(slot0, slot1, slot2)
	slot3 = slot2 - slot1

	slot0.leftTimes1:text(slot3)
	text.addEffect(slot0.leftTimes1, {
		color = slot3 > 0 and cc.c4b(116, 190, 109, 255) or ui.COLORS.NORMAL.DEFAULT
	})
	slot0.leftTimes2:text("/" .. slot2)
	adapt.oneLinePos(slot0.leftTimes1, slot0.leftTimes2)

	slot5, slot6 = dataEasy.isDoubleHuodong("buyStamina")

	slot0.doublePanel:visible(slot5)

	if slot5 then
		slot8 = slot0.doublePanel:get("text2")
		slot9 = slot0.doublePanel:get("text3")
		slot10 = slot6[1].count or 0

		text.addEffect(slot8, {
			color = math.max(slot10 - slot1, 0) == 0 and ui.COLORS.NORMAL.ALERT_ORANGE or cc.c4b(116, 190, 109, 255)
		})
		slot8:text(slot11)
		slot9:text(string.format("/%s)", slot10))
		adapt.oneLinePos(slot0.doublePanel:get("text1"), {
			slot8,
			slot9
		}, cc.p(0, 0))
	end

	return slot3
end

function slot2.initModel(slot0)
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.roleLevel = gGameModel.role:getIdler("level")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.buyStaminaTimes = gGameModel.daily_record:getIdler("buy_stamina_times")
	slot0.stamina = gGameModel.role:getIdler("stamina")
	slot0.trainerLevel = gGameModel.role:getIdler("trainer_level")
	slot0.items = gGameModel.role:getIdler("items")

	if dataEasy.isTownRelicBuffUnlock() then
		slot0.relicBuff = gGameModel.town:getIdler("relic_buff")
	end
end

function slot2.onBuyItem(slot0)
	idlereasy.do_(function (slot0, slot1, slot2, slot3)
		function slot4()
			uv2 = "dataEasy"

			dataEasy.sureUsingDiamonds(function ()
				gGameApp:requestServer("/game/role/stamina/buy", function (slot0)
					sdk.trackEvent("buy_stamina")
					gGameUI:showTip(gLanguageCsv.staminaBuySuccess)
				end)
			end, slot2)
		end

		if game.STAMINA_LIMIT <= slot0 then
			gGameUI:showTip(gLanguageCsv.staminaLimitToUse)
		elseif slot1 == -1 then
			gGameUI:showTip(gLanguageCsv.commonVipMax, gLanguageCsv.staminaBuy)
		elseif slot1 == 0 then
			uiEasy.showDialog("vip", {
				titleName = gLanguageCsv.staminaBuy
			}, {
				dialog = true
			})
		elseif slot2 < slot3 then
			uiEasy.showDialog("rmb", nil, {
				dialog = true
			})
		elseif game.STAMINA_LIMIT < gCommonConfigCsv.staminaBuyRecover + gGameModel.role:read("stamina") then
			gGameUI:showDialog({
				btnType = 2,
				isRich = true,
				cb = slot4,
				content = gLanguageCsv.buyEnergyOverflowTips
			})
		else
			slot4()
		end
	end, slot0.stamina, slot0.leftTimes, slot0.rmb, slot0.price)
end

function slot2.onItemClick(slot0, slot1, slot2, slot3)
	if game.STAMINA_LIMIT <= slot0.stamina:read() then
		gGameUI:showTip(gLanguageCsv.staminaFull)

		return
	end

	if slot3.num <= 1 then
		slot0:onUseCb(slot3.key, slot3.num)

		return
	end

	gGameUI:stackUI("common.buy_info", nil, , , {
		id = slot3.key
	}, {
		style = 2,
		flag = "use",
		contentType = "slider",
		num = slot0:createHandler("num"),
		maxNum = slot3.num
	}, slot0:createHandler("onUseCb", slot3.key))
end

function slot2.onUseCb(slot0, slot1, slot2)
	gGameApp:requestServer("/game/role/stamina/use_item", function (slot0)
		gGameUI:showTip(gLanguageCsv.useSuccess)
	end, slot1, slot2)
end

function slot2.relicAddAttr(slot0, slot1, slot2)
	if slot1 and slot2[game.RELIC_BUFF.BUY_STAMINA] and slot2[game.RELIC_BUFF.BUY_STAMINA][1] then
		if not slot0.content:get("relicAttr") then
			slot3 = cc.Label:createWithTTF("(" .. "+" .. slot0.staminaBuyRecover:read() * csv.town.relic_buff[slot2[game.RELIC_BUFF.BUY_STAMINA][1].buff_id].param .. ")", "font/youmi1.ttf", 50):addTo(slot0.content, 10, "relicAttr"):color(ui.COLORS.NORMAL.FRIEND_GREEN):xy(slot0.rmbNum:xy())
		else
			slot3:text(slot7)
		end

		adapt.oneLinePos(slot0.rmbNum, {
			slot3,
			slot1
		}, {
			cc.p(7, 0),
			cc.p(29, 0)
		})
	elseif slot3 then
		slot3:removeFromParent()
	end
end

return slot2
