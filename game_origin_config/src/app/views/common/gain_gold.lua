slot0 = {
	0.38,
	0.4,
	0.5,
	0.54,
	0.58,
	0.6
}
slot1 = require("app.views.city.activity.month_card")
slot2 = cc.load("mvc").ViewBase
slot3 = class("GainGoldView", Dialog)
slot3.RESOURCE_FILENAME = "common_gain_gold.json"
slot3.RESOURCE_BINDING = {
	boxPanel = "boxPanel",
	["onePanel.priceNote"] = "priceNote",
	["goldPanel.info"] = "goldPanelInfo",
	["onePanel.icon"] = "icon",
	["numPanel.info"] = "numPanelInfo",
	["goldPanel.icon"] = "gainIcon",
	["numPanel.num2"] = "gainTimes2",
	refreshBg = "refreshBg",
	goldPanel = "goldPanel",
	["boxPanel.bar"] = "boxBar",
	["numPanel.bg"] = "numPanelBg",
	tenPanel = "tenPanel",
	refresh3 = "refresh3",
	["numPanel.doublePanel"] = "doublePanel",
	refresh1 = "refresh1",
	["goldPanel.bg"] = "goldPanelBg",
	["goldPanel.num"] = "gainNum",
	onePanel = "onePanel",
	["numPanel.num1"] = "gainTimes1",
	refreshIcon = "refreshIcon",
	["onePanel.price"] = "price",
	["onePanel.free"] = "free",
	refresh2 = "refresh2",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["onePanel.btn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onGainClick(1)
				end)
			}
		}
	},
	["tenPanel.btn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onGainClick(10)
				end)
			}
		}
	},
	["onePanel.btn.text"] = {
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
	["tenPanel.btn.text"] = {
		varname = "tenBtnText",
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot3.onCreate(slot0)
	slot0:initModel()
	slot0.refresh2:text(time.getRefreshHour())
	adapt.oneLinePos(slot0.refresh3, {
		slot0.refresh2,
		slot0.refresh1,
		slot0.refreshIcon
	}, {
		cc.p(10, 0),
		cc.p(10, 0),
		cc.p(10, 0)
	}, "right")
	slot0.refreshBg:width(slot0.refresh3:width() + slot0.refresh2:width() + slot0.refresh1:width() + slot0.refreshIcon:width() + 100)

	slot1 = {
		17,
		33,
		53,
		76
	}
	slot0.leftTimes = idlereasy.any({
		slot0.vipLevel,
		slot0.lianjinTimes,
		slot0.trainerLevel,
		slot0.trainerSkills
	}, function (slot0, slot1, slot2, slot3, slot4)
		uv6 = "gVipCsv"
		slot6 = gVipCsv[slot1].lianJinTimes + (slot6.getPrivilegeAddition("lianjinFreeTimes") or 0) + dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.LianjinBuyTimes)
		slot5 = slot6 + dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.LianjinFreeTimes)
		uv6 = "lianJinTimes"

		slot6:refreshNumPanel(slot2, slot5)

		if slot5 - slot2 == 0 and game.VIP_LIMIT <= slot1 then
			slot6 = -1
		end

		for slot11, slot12 in orderCsvPairs(gVipCsv[slot1].lianJinGift) do
			table.insert({}, slot11)
		end

		uv9 = "getPrivilegeAddition"
		uv9 = "lianJinTimes"

		if not slot9.percent then
			uv9 = "lianJinTimes"
			slot11 = mathEasy.showProgress(slot9, slot7, slot2)
			slot9.percent = clone(slot11)
			uv9 = "lianJinTimes"
			uv11 = "lianJinTimes"

			slot9.boxBar:setPercent(slot11.percent)
		else
			uv10 = "lianJinTimes"

			slot10:enableSchedule():schedule(function ()
				uv0 = "percent"

				if slot0 > 0.0005 then
					uv0 = "percent"
					slot0 = slot0 - 0.0005
					uv0 = 0.0005
				end

				uv0 = "boxBar"
				uv1 = "boxBar"
				slot0.percent = slot1.percent + 1
				uv0 = "boxBar"
				slot0 = slot0.boxBar
				slot1 = slot0
				slot0 = slot0.setPercent
				uv3 = "setPercent"
				uv4 = "boxBar"

				slot0(slot1, math.min(slot3, slot4.percent))

				uv0 = "boxBar"
				uv1 = "setPercent"

				if slot1 <= slot0.percent then
					uv0 = "boxBar"

					slot0:unSchedule("GainGoldViewPercent")
				end
			end, 0.01, 0, "GainGoldViewPercent")
		end

		uv9 = "lianJinTimes"

		if slot9.goldPanel:get("privilege") then
			uv9 = "lianJinTimes"

			slot9.goldPanel:get("privilege"):removeSelf()
		end

		uv11 = "lianJinTimes"

		uiEasy.setPrivilegeRichText(game.PRIVILEGE_TYPE.LianjinDropRate, slot11.goldPanel, gLanguageCsv.gold, cc.p(20, 155), true)

		return true, slot6
	end)

	idlereasy.any({
		slot0.lianjinTimes,
		slot0.lianjinFreeTimes,
		slot0.leftTimes
	}, function (slot0, slot1, slot2, slot3)
		slot4 = math.max(slot1 - slot2, 0)
		uv4 = "math"
		slot5 = gCostCsv.lianjin_cost
		slot7 = slot4 + 1
		uv7 = "max"
		slot7.cost = slot5[math.min(slot7, table.length(slot5))]

		if slot2 < (slot4.getPrivilegeAddition("lianjinFreeTimes") or 0) + dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.LianjinFreeTimes) then
			uv7 = "max"
			slot7.cost = 0
		end

		for slot13 = 1, cc.clampf(slot3, 1, 10) - math.max(slot4 - slot2, 0) do
			slot7 = 0 + slot5[math.min(slot1 + slot13, table.length(slot5))]
		end

		uv10 = "max"
		slot10.tenCost = slot7
		uv10 = "max"
		slot10 = slot10.free
		slot10 = slot10.visible
		uv12 = "max"
		slot12 = slot12.cost <= 0

		slot10(slot10, slot12)

		uv10 = "max"
		slot10 = slot10.icon
		slot10 = slot10.visible
		uv12 = "max"
		slot12 = slot12.cost > 0

		slot10(slot10, slot12)

		uv10 = "max"
		uv12 = "max"
		slot12 = slot12.cost > 0
		slot10 = slot10.price:visible(slot12)
		slot10 = slot10.text
		uv12 = "max"
		slot12 = slot12.cost

		slot10(slot10, slot12)

		uv10 = "max"
		slot10 = slot10.priceNote
		slot10 = slot10.visible
		uv12 = "max"

		slot10(slot10, slot12.cost > 0)

		uv10 = "max"
		slot10 = slot10.tenPanel:get("price")
		slot10 = slot10.text

		slot10(slot10, slot7)

		uv10 = "max"
		slot12 = string.format

		slot10.tenBtnText:text(slot12(gLanguageCsv.gainGoldMoreTimes, slot8))

		slot10 = adapt.oneLineCenterPos
		uv12 = "max"
		slot12 = slot12.onePanel
		slot13 = slot12
		uv13 = "max"
		slot13 = slot13.price
		slot13 = slot13.y
		uv13 = "max"
		slot13 = slot13.priceNote
		uv13 = "max"
		slot13 = slot13.price
		uv13 = "max"

		slot10(cc.p(slot12.size(slot13).width / 2, slot13(slot13)), {
			slot13,
			slot13,
			slot13.icon
		}, cc.p(15, 0))

		uv10 = "max"
		slot13 = "price"
		slot10 = slot10.tenPanel:multiget("priceNote", slot13, "icon")
		uv13 = "max"

		adapt.oneLineCenterPos(cc.p(slot13.tenPanel:size().width / 2, slot10.price:y()), {
			slot10.priceNote,
			slot10.price,
			slot10.icon
		}, cc.p(15, 0))
	end)
	idlereasy.any({
		slot0.lianjinTimes,
		slot0.lianjinFreeTimes,
		slot0.roleLevel
	}, function (slot0, slot1, slot2, slot3)
		slot4 = math.max(slot1 - slot2, 0)
		uv4 = "math"
		slot6 = math.min(slot4 + 1, table.length(gCostCsv.lianjin_gold_rate))

		if slot2 < (slot4.getPrivilegeAddition("lianjinFreeTimes") or 0) + dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.LianjinFreeTimes) then
			slot6 = 1
		end

		slot8 = slot5[slot6]
		slot7 = gRoleLevelCsv[slot3].lianJinGold * slot8
		uv8 = "math"

		if slot8.getPrivilegeAddition("lianjinRate") then
			slot9 = 1 + slot8
		end

		slot11 = slot7 * slot9
		uv11 = "max"
		slot11 = slot11.gainNum
		slot12 = slot11
		slot14 = math.floor(slot11)

		slot11.text(slot12, "+" .. slot14)

		slot11 = adapt.oneLinePos
		uv12 = "max"
		slot13 = {
			slot14,
			slot14.gainIcon
		}
		uv14 = "max"
		slot14 = slot14.gainNum
		uv14 = "max"

		slot11(slot12.goldPanelInfo, slot13, {
			cc.p(10, 0),
			cc.p(10, 0)
		})

		uv11 = "max"
		uv13 = "max"
		slot13 = slot13.goldPanelInfo
		slot14 = slot13
		uv14 = "max"
		slot14 = slot14.gainNum:width()
		uv14 = "max"

		slot11.goldPanelBg:width(slot13.width(slot14) + slot14 + slot14.gainIcon:width() + 85)
	end)
	idlereasy.any({
		slot0.vipLevel,
		slot0.lianjinGifts
	}, function (slot0, slot1, slot2)
		for slot7, slot8 in orderCsvPairs(gVipCsv[slot1].lianJinGift) do
			slot3 = 0 + 1
			uv9 = "orderCsvPairs"
			slot9 = slot9.boxPanel:get("num" .. slot3)
			slot10 = slot9

			slot9.text(slot10, slot7)

			uv10 = "orderCsvPairs"
			slot10 = slot10.boxPanel:get("num" .. slot3)

			text.addEffect(slot10, {
				outline = {
					color = ui.COLORS.NORMAL.DEFAULT
				}
			})

			uv10 = "orderCsvPairs"
			slot10 = slot10.boxPanel:get("box" .. slot3):texture(string.format("other/gain_gold/icon_box%s%d.png", slot2[slot7] == 0 and "_open" or "", slot3))

			if slot9 == 1 then
				uv12 = "orderCsvPairs"
				slot15 = "effect_loop"
				slot11 = widget.addAnimationByKey(slot12.boxPanel, "effect/jiedianjiangli.skel", "gain_gold_box_effect" .. slot3, slot15, slot10:z() - 1)
				slot12 = slot10:size()
				uv15 = "gVipCsv"

				slot11:scale(slot15[slot3]):x(slot10:x()):y(slot10:y() - 40)

				slot10.effectBox = slot11
			elseif slot10.effectBox then
				slot10.effectBox:hide()
				slot10.effectBox:removeFromParent()

				slot10.effectBox = nil
			end

			uv12 = "orderCsvPairs"

			uiEasy.addVibrateToNode(slot12, slot10, slot9 == 1)

			uv12 = "orderCsvPairs"
			uv17 = "orderCsvPairs"
			uv18 = "orderCsvPairs"

			bind.touch(slot12, slot10, {
				methods = {
					ended = functools.partial(slot17.onBoxClick, slot18, slot9, slot7, slot10)
				}
			})
		end
	end)

	if slot0.relicBuff then
		idlereasy.when(slot0.relicBuff, function (slot0, slot1)
			uv3 = "uiEasy"

			uiEasy.addRelicIcon(slot3:getResourceNode(), slot1, game.RELIC_BUFF.LIANJIN)
		end)
	end

	Dialog.onCreate(slot0)
end

function slot3.refreshNumPanel(slot0, slot1, slot2)
	slot0.gainTimes1:text(slot1)
	text.addEffect(slot0.gainTimes1, {
		color = slot1 < slot2 and ui.COLORS.NORMAL.FRIEND_GREEN or ui.COLORS.NORMAL.DEFAULT
	})
	slot0.gainTimes2:text("/" .. slot2)
	adapt.oneLinePos(slot0.numPanelInfo, {
		slot0.gainTimes1,
		slot0.gainTimes2
	}, cc.p(5, 0))

	slot4, slot5 = dataEasy.isDoubleHuodong("buyGold")

	slot0.doublePanel:visible(slot4)
	slot0.numPanelBg:height(slot4 and 168 or 114)

	if matchLanguage({
		"en"
	}) then
		slot0.numPanelBg:width(slot4 and 375 or 360)
	elseif matchLanguage({
		"tw"
	}) then
		slot0.numPanelBg:width(slot4 and 390 or 310)
	elseif matchLanguage({
		"kr"
	}) then
		slot0.numPanelBg:width(slot4 and 460 or 400)
	end

	if slot4 then
		slot7 = slot0.doublePanel:get("text2")
		slot8 = slot0.doublePanel:get("text3")
		slot9 = slot5[1].count or 1

		text.addEffect(slot7, {
			color = math.max(slot9 - slot1, 0) == 0 and ui.COLORS.NORMAL.ALERT_ORANGE or ui.COLORS.NORMAL.FRIEND_GREEN
		})
		slot7:text(slot10)
		slot8:text(string.format("/%s)", slot9))
		adapt.oneLinePos(slot0.doublePanel:get("text1"), {
			slot7,
			slot8
		}, cc.p(0, 0))
	end
end

function slot3.initModel(slot0)
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.roleLevel = gGameModel.role:getIdler("level")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.lianjinTimes = gGameModel.daily_record:getIdler("lianjin_times")
	slot0.lianjinFreeTimes = gGameModel.daily_record:getIdler("lianjin_free_times")
	slot0.lianjinGifts = gGameModel.daily_record:getIdler("lianjin_gifts")
	slot0.trainerLevel = gGameModel.role:getIdler("trainer_level")
	slot0.trainerSkills = gGameModel.role:getIdler("trainer_skills")

	if dataEasy.isTownRelicBuffUnlock() then
		slot0.relicBuff = gGameModel.town:getIdler("relic_buff")
	end
end

function slot3.onGainClick(slot0, slot1)
	idlereasy.do_(function (slot0, slot1)
		if slot0 == -1 then
			gGameUI:showTip(gLanguageCsv.commonVipMax, gLanguageCsv.gainGold)
		elseif slot0 == 0 then
			uiEasy.showDialog("vip", {
				titleName = gLanguageCsv.gainGold
			})
		else
			uv2 = "gGameUI"

			if slot2.cost > 0 then
				uv2 = "gGameUI"

				if slot1 < slot2.cost then
					uiEasy.showDialog("rmb")
				end
			else
				function slot2()
					uv4 = "gGameApp"

					gGameApp:requestServer("/game/role/lianjin", function (slot0)
						uv7 = "gGameUI"

						gGameUI:stackUI("common.gain_gold_display", nil, , slot0.view, slot7)
					end, slot4)
				end

				uv3 = "showTip"

				if slot3 == 1 then
					uv3 = "gGameUI"

					if slot3.cost <= 0 then
						uv3 = "showTip"

						if slot3 == 10 then
							uv3 = "showTip"

							if slot3 == 1 then
								uv3 = "gGameUI"

								if not slot3.cost then
									uv3 = "gGameUI"
									slot3 = slot3.tenCost
								end
							end

							slot4 = dataEasy.sureUsingDiamonds

							slot4(slot2, slot3)

							uv4 = "showTip"

							if slot4 == 10 then
								sdk.trackEvent("dia_gold10x")
							else
								sdk.trackEvent("dia_gold")
							end
						else
							slot2()
						end
					end
				end
			end
		end
	end, slot0.leftTimes, slot0.rmb)
end

function slot3.onBoxClick(slot0, slot1, slot2, slot3)
	if slot1 == 1 then
		gGameApp:requestServerCustom("/game/role/lianjin/total_award"):params(slot2):onResponse(function (slot0)
			uv2 = "uiEasy"

			uiEasy.setBoxEffect(slot2, 1, function ()
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
			end, -30, 20)
		end):wait({
			false
		}):doit(function (slot0)
			gGameUI:showGainDisplay(slot0)
		end)

		return
	end

	if slot1 == 0 then
		gGameUI:showBoxDetail({
			content = "",
			state = 0,
			data = gVipCsv[slot0.vipLevel:read()].lianJinGift[slot2]
		})
	else
		gGameUI:showBoxDetail({
			state = 1,
			data = gVipCsv[slot0.vipLevel:read()].lianJinGift[slot2],
			content = string.format(gLanguageCsv.canGetArriveAtJubaoNumber, slot2)
		})
	end
end

return slot3
