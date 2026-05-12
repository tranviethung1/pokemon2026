slot0 = {
	item = {
		gCommonConfigCsv.drawChipItemCostPrice,
		[10] = gCommonConfigCsv.draw10ChipItemCostPrice
	},
	rmb = {
		gCommonConfigCsv.drawChipCostPrice,
		[10] = gCommonConfigCsv.draw10ChipCostPrice
	}
}
slot1 = gCommonConfigCsv.chipUpLimit
slot2 = {
	item = 538,
	rmb = 537
}
slot3 = {
	"city/drawcard/draw/icon_jfbx_dk.png",
	"city/drawcard/draw/icon_jfbx.png",
	"city/drawcard/draw/icon_jfbx1.png",
	"city/drawcard/draw/icon_jfbx2.png",
	"city/drawcard/draw/icon_jfbx3.png",
	"city/drawcard/draw/icon_jfbx3_dk.png"
}
slot4 = {
	"city/drawcard/draw/box_wdd.png",
	"city/drawcard/draw/box_ydd.png"
}
slot6 = class("ChipDrawView", cc.load("mvc").ViewBase)
slot6.RESOURCE_FILENAME = "chip_draw.json"
slot6.RESOURCE_BINDING = {
	["panelUpRight.drawCountPanel.goldRecord"] = "itemRecord",
	bg = "bg",
	["panelDownRight.drawTenPanel2.costInfo"] = "diamond10CostInfo",
	["panelMidRight.downPanel.item4.number"] = "number4",
	["panelDownLeft.drawOnePanel.textFree"] = "item1FreeTxt",
	selectSuitItem = "selectSuitItem",
	["panelMidRight.downPanel"] = "downPanel",
	["panelDownLeft.drawOnePanel.costInfo.textCost"] = "item1Cost",
	["panelUpRight.txtTip"] = "txtTip",
	["panelUpRight.drawCountPanel.txtGoldRecord"] = "txtGoldRecord",
	["panelDownLeft.drawTenPanel.costInfo.textCost"] = "item10Cost",
	["panelUpRight.drawCountPanel.diamondRecord"] = "diamondRecord",
	["panelMidRight.downPanel.item2.number"] = "number2",
	["panelUpRight.drawCountPanel"] = "drawCountPanel",
	["panelDownRight.drawOnePanel2.textFree"] = "diamond1FreeTxt",
	["panelMidRight.downPanel.item3.number"] = "number3",
	["panelDownLeft.drawTenPanel.costInfo"] = "item10CostInfo",
	["panelDownRight.drawOnePanel2.costInfo.textCost"] = "diamond1Cost",
	["panelDownLeft.drawOnePanel.costInfo"] = "item1CostInfo",
	["panelUpRight.drawCountPanel.txtDiamondRecord"] = "txtDiamondRecord",
	["panelDownRight.drawOnePanel2.costInfo"] = "diamond1CostInfo",
	["panelMidRight.downPanel.item1.number"] = "numberAll",
	["panelDownRight.drawTenPanel2.costInfo.textCost"] = "diamond10Cost",
	["panelDownLeft.drawOnePanel"] = {
		varname = "item1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:draw("item", 1)
				end)
			}
		}
	},
	["panelDownLeft.drawOnePanel.cutDownPanel.textTime"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("time"),
			method = function (slot0)
				if slot0 == 0 then
					return ""
				end

				return time.getCutDown(slot0).clock_str
			end
		}
	},
	["panelDownLeft.drawTenPanel"] = {
		varname = "item10",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:draw("item", 10)
				end)
			}
		}
	},
	["panelDownLeft.drawTenPanel.btnDraw.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.ORANGE
				}
			}
		}
	},
	["panelDownLeft.drawOnePanel.btnDraw"] = {
		binds = {
			event = "extend",
			class = "red_hint",
			props = {
				state = bindHelper.self("itemSign"),
				onNode = function (slot0)
					slot0:xy(430, 200)
				end
			}
		}
	},
	["panelDownLeft.drawOnePanel.btnDraw.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.BLUE
				}
			}
		}
	},
	["panelDownLeft.typePanel.imgAdd"] = {
		varname = "preview1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("showPreview1")
			}
		}
	},
	["panelDownRight.drawOnePanel2"] = {
		varname = "rmb1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:draw("rmb", 1)
				end)
			}
		}
	},
	["panelDownRight.drawOnePanel2.cutDownPanel.textTime"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("time"),
			method = function (slot0)
				if slot0 == 0 then
					return ""
				end

				return time.getCutDown(slot0).clock_str
			end
		}
	},
	["panelDownRight.drawTenPanel2"] = {
		varname = "rmb10",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:draw("rmb", 10)
				end)
			}
		}
	},
	["panelDownRight.drawOnePanel2.btnDraw"] = {
		binds = {
			event = "extend",
			class = "red_hint",
			props = {
				state = bindHelper.self("rmbSign"),
				onNode = function (slot0)
					slot0:xy(430, 200)
				end
			}
		}
	},
	["panelDownRight.drawOnePanel2.btnDraw.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.BLUE
				}
			}
		}
	},
	["panelDownRight.drawTenPanel2.btnDraw.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.ORANGE
				}
			}
		}
	},
	["panelDownRight.typePanel2.imgAdd"] = {
		varname = "preview2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("showPreview2")
			}
		}
	},
	["panelMidRight.btnRate"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("clickBtnRate")
			}
		}
	},
	["panelMidRight.btnRate.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["panelUpRight.panelSelectSuit"] = {
		varname = "panelSelectSuit",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnSelectSuit")
			}
		}
	},
	["panelMidRight.downPanel.item1.bar"] = {
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("livenessPoint1")
			}
		}
	},
	["panelMidRight.downPanel.item2.bar"] = {
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("livenessPoint2")
			}
		}
	},
	["panelMidRight.downPanel.item3.bar"] = {
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("livenessPoint3")
			}
		}
	},
	["panelMidRight.downPanel.item2"] = {
		binds = {
			event = "click",
			method = bindHelper.defer(function (slot0)
				return slot0:onAwardClick(1)
			end)
		}
	},
	["panelMidRight.downPanel.item3"] = {
		binds = {
			event = "click",
			method = bindHelper.defer(function (slot0)
				return slot0:onAwardClick(2)
			end)
		}
	},
	["panelMidRight.downPanel.item4"] = {
		binds = {
			event = "click",
			method = bindHelper.defer(function (slot0)
				return slot0:onAwardClick(3)
			end)
		}
	}
}
slot6.RESOURCE_STYLES = {
	full = true
}

function slot6.clickBtnRate(slot0)
	gGameUI:stackUI("city.card.chip.rate_preview")
end

function slot6.onCreate(slot0)
	slot0.preview1:visible(false)
	slot0.preview2:visible(false)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "CHIP",
		title = gLanguageCsv.chipTitle
	})
	widget.addAnimationByKey(slot0.bg, "chip/xdck.skel", "effectBg", "effect_loop", -1):alignCenter(slot0.bg:size())
	slot0.bg:scale(2)
	slot0:initModel()

	slot0.itemSign = idler.new(true)
	slot0.rmbSign = idler.new(true)
	slot0.selectUpSuitID = {}

	slot0:initSelectSuitUI()
	idlereasy.when(slot0.items, function (slot0, slot1)
		uv2 = "set"
		slot2 = slot2.set
		uv4 = "item"
		slot4 = slot1[slot4.item]

		slot2(slot2, slot4)

		uv2 = "rmb"
		uv4 = "item"

		slot2:set(slot1[slot4.rmb])
	end)

	function slot3(slot0, slot1, slot2, slot3, slot4)
		uv7 = "multiget"
		slot7 = slot7[slot1][slot3] <= slot4
		slot8 = slot0:multiget("textNote", "textCost", "imgIcon").textCost
		slot9 = slot8
		slot8 = slot8.text

		if slot3 > slot2 or not (slot2 .. "/" .. slot3) then
			uv10 = "multiget"
			slot10 = slot10[slot1][slot3]
		end

		slot8(slot9, slot10)

		slot8 = slot5.imgIcon
		slot9 = slot8
		slot8 = slot8.texture
		slot10 = dataEasy.getIconResByKey

		if slot6 then
			uv11 = "textNote"

			if not slot11[slot1] then
				slot11 = slot1
			end
		end

		slot8(slot9, slot10(slot11))
		adapt.oneLineCenterPos(cc.p(175, 35), {
			slot5.textNote,
			slot5.textCost,
			slot5.imgIcon
		})
		slot5.textCost:color((slot6 or not not slot7) and ui.COLORS.NORMAL.WHITE or ui.COLORS.NORMAL.RED)
	end

	function slot4(slot0, slot1, slot2, slot3, slot4)
		slot6 = slot0
		slot5 = slot0.multiget(slot6, "textNote", "textCost", "imgIcon")
		uv6 = "multiget"
		slot10 = "/"
		uv11 = "multiget"

		slot5.textCost:text(slot2 .. slot10 .. slot11[slot1][slot3])

		uv10 = "textNote"

		slot5.imgIcon:texture(dataEasy.getIconResByKey(slot10[slot1]))
		adapt.oneLineCenterPos(cc.p(175, 35), {
			slot5.textNote,
			slot5.textCost,
			slot5.imgIcon
		})
		slot5.textCost:color(slot6[slot1][slot3] <= slot2 and ui.COLORS.NORMAL.WHITE or ui.COLORS.NORMAL.RED)
	end

	idlereasy.any({
		idler.new(0)
	}, function (slot0, slot1, slot2)
		slot1 = slot1 or 0
		uv3 = "item1CostInfo"
		uv4 = "item"
		slot4 = slot4.item1CostInfo

		slot3(slot4, "item", slot1, 1, slot2)

		uv3 = "item1CostInfo"
		uv4 = "item"

		slot3(slot4.item10CostInfo, "item", slot1, 10, slot2)
	end)
	idlereasy.any({
		idler.new(0),
		slot0.rmb
	}, function (slot0, slot1, slot2)
		slot1 = slot1 or 0
		uv3 = "diamond1CostInfo"
		uv4 = "rmb"
		slot4 = slot4.diamond1CostInfo

		slot3(slot4, "rmb", slot1, 1, slot2)

		uv3 = "diamond1CostInfo"
		uv4 = "rmb"

		slot3(slot4.diamond10CostInfo, "rmb", slot1, 10, slot2)
	end)
	idlereasy.any({
		slot0.itemDrawCount,
		slot0.vip_level
	}, function (slot0, slot1, slot2)
		slot3 = gVipCsv[slot2].itemDrawChipCountLimit
		uv4 = "gVipCsv"
		slot4 = slot4.itemRecord
		slot5 = slot4

		slot4.text(slot5, slot1 .. "/" .. slot3)

		uv5 = "gVipCsv"
		slot5 = slot5.itemRecord
		slot6 = {
			color = slot1 < slot3 and ui.COLORS.NORMAL.GREEN or ui.COLORS.NORMAL.RED
		}

		text.addEffect(slot5, slot6)

		uv5 = "gVipCsv"
		uv6 = "gVipCsv"

		adapt.oneLinePos(slot5.txtGoldRecord, slot6.itemRecord, cc.p(6, 0))
	end)
	idlereasy.any({
		slot0.rmbDrawCount,
		slot0.vip_level
	}, function (slot0, slot1, slot2)
		slot3 = gVipCsv[slot2].rmbDrawChipCountLimit
		uv4 = "gVipCsv"
		slot4 = slot4.diamondRecord
		slot5 = slot4

		slot4.text(slot5, slot1 .. "/" .. slot3)

		uv5 = "gVipCsv"
		slot5 = slot5.diamondRecord
		slot6 = {
			color = slot1 < slot3 and ui.COLORS.NORMAL.GREEN or ui.COLORS.NORMAL.RED
		}

		text.addEffect(slot5, slot6)

		uv5 = "gVipCsv"
		uv6 = "gVipCsv"

		adapt.oneLinePos(slot5.txtDiamondRecord, slot6.diamondRecord, cc.p(6, 0))
	end)
	idlereasy.when(slot0.itemFreeCount, function (slot0, slot1)
		slot2 = slot1 == 0
		uv3 = "item1CostInfo"
		slot3 = slot3.item1CostInfo
		slot3 = slot3.visible

		slot3(slot3, not slot2)

		uv3 = "item1CostInfo"
		slot3 = slot3.item1FreeTxt
		slot3 = slot3.visible

		slot3(slot3, slot2)

		uv3 = "item1CostInfo"
		slot3 = slot3.item1:get("cutDownPanel")
		slot3 = slot3.visible

		slot3(slot3, not slot2)

		uv3 = "item1CostInfo"

		slot3.itemSign:set(slot2)
	end)
	idlereasy.when(slot0.rmbFreeCount, function (slot0, slot1)
		slot2 = slot1 == 0
		uv3 = "diamond1CostInfo"
		slot3 = slot3.diamond1CostInfo
		slot3 = slot3.visible

		slot3(slot3, not slot2)

		uv3 = "diamond1CostInfo"
		slot3 = slot3.diamond1FreeTxt
		slot3 = slot3.visible

		slot3(slot3, slot2)

		uv3 = "diamond1CostInfo"
		slot3 = slot3.rmb1:get("cutDownPanel")
		slot3 = slot3.visible

		slot3(slot3, not slot2)

		uv3 = "diamond1CostInfo"

		slot3.rmbSign:set(slot2)
	end)

	slot0.time = idler.new(function ()
		if time.getNumTimestamp(tonumber(time.getTodayStr()), time.getRefreshHour()) < time.getTime() then
			slot1 = slot1 + 86400
		end

		return slot1 - slot0
	end())
	slot9 = 1
	slot10 = 0

	slot0:enableSchedule():schedule(function (slot0)
		uv1 = "time"

		slot1.time:modify(function ()
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
		end)
	end, slot9, slot10)

	slot0.ChipAwardTab = {}
	slot0.siteStateTab = {}
	slot0.awardIdTabel = {}

	for slot9, slot10 in orderCsvPairs(csv.draw_count) do
		if slot10.drawType == 6 then
			slot0.ChipAwardTab[slot9] = slot10
		end
	end

	for slot9 = 1, 3 do
		slot0["livenessPoint" .. slot9] = idler.new(0)
		slot0.siteStateTab[slot9] = 2
	end

	slot0:initAward()
	slot0.txtTip:text(gLanguageCsv.chipDrawSuitUp01)
end

function slot6.initAward(slot0)
	slot0.awardIdTabel = {}
	slot0.siteStateTab = {
		2,
		2,
		2
	}
	slot1, slot2, slot3, slot4 = nil
	slot0.awardTab = {}
	slot5 = {}
	slot6 = 0
	slot7 = 0
	slot8, slot9, slot10 = nil
	slot11 = 0
	slot0.awardTab = slot0.ChipAwardTab
	slot11 = slot0.chipAllCount:read() + slot0.chipAllCountTen:read() * 10
	slot2 = slot0.getDiamondAwardState:read()[6] or {} or {}

	function slot12(slot0, slot1, slot2)
		if not (csv.draw_count[slot1] and csv.draw_count[slot1].count) then
			return
		end

		uv4 = "csv"
		slot4 = slot4.awardIdTabel
		slot4[slot0] = slot1
		uv4 = "csv"
		slot4 = slot4.downPanel:get("item" .. slot0 + 1)

		slot4:get("number"):text(slot3 - slot2)

		slot5 = slot4:get("result")
		slot5 = slot5.visible

		slot5(slot5, false)

		uv5 = "csv"

		slot5["livenessPoint" .. slot0]:set(100)

		slot7 = "bg"
		uv7 = "draw_count"

		slot4:get(slot7):texture(slot7[2])
		slot4:get("number"):setTextColor(ui.COLORS.GLOW.YELLOW)

		if slot4:get("effect") then
			slot4:get("effect"):hide()
		end

		uv5 = "count"

		if slot5[slot1] == 0 then
			slot5 = slot4:get("state")
			slot6 = slot5
			slot5 = slot5.texture

			if slot0 == 3 then
				uv7 = "awardIdTabel"

				if not slot7[6] then
					uv7 = "awardIdTabel"
					slot7 = slot7[1]
				end
			end

			slot5(slot6, slot7)

			uv5 = "csv"
			slot5.siteStateTab[slot0] = 0
		else
			uv5 = "count"

			if slot5[slot1] ~= 1 then
				uv5 = "downPanel"

				if slot3 <= slot5 then
					slot5 = slot4:get("state")
					slot6 = slot5
					slot5 = slot5.texture

					if slot0 == 3 then
						uv7 = "awardIdTabel"

						if not slot7[5] then
							uv7 = "awardIdTabel"
							slot7 = slot7[2]
						end
					end

					slot5(slot6, slot7)

					uv5 = "csv"
					slot5.siteStateTab[slot0] = 1

					if not slot4:get("effect") then
						widget.addAnimationByKey(slot4, "effect/jiedianjiangli.skel", "effect", "effect_loop", 0):xy(100, 30):scale(0.7)
					end

					slot4:get("effect"):show()
				else
					slot6 = csv.draw_count[slot1].count - (csv.draw_count[slot1 - 1] and csv.draw_count[slot1 - 1].count or 0)
					uv7 = "csv"
					slot9 = slot0
					slot7 = slot7["livenessPoint" .. slot9]
					slot8 = slot7
					slot7 = slot7.set
					uv9 = "downPanel"

					if not slot9 then
						slot9 = 0
					else
						uv9 = "downPanel"
						slot9 = (slot9 - slot5) / slot6 * 100
					end

					slot7(slot8, slot9)
					slot4:get("number"):setTextColor(ui.COLORS.NORMAL.WHITE)

					slot9 = "bg"
					uv9 = "draw_count"

					slot4:get(slot9):texture(slot9[1])

					slot7 = slot4:get("state")
					slot8 = slot7
					slot7 = slot7.texture

					if slot0 == 3 then
						uv9 = "awardIdTabel"

						if not slot9[4] then
							uv9 = "awardIdTabel"
							slot9 = slot9[3]
						end
					end

					slot7(slot8, slot9)
				end
			end
		end
	end

	if table.nums(slot0.awardTab) >= 3 then
		slot14, slot15 = nil

		for slot19, slot20 in orderCsvPairs(slot0.awardTab) do
			slot14 = slot19

			if slot2[slot19] ~= 0 then
				if slot0.awardTab[slot19 - (0 + 1 - 1) % 3 + 2] then
					slot15 = slot21
				end

				break
			end
		end

		slot16 = 0

		if slot0.awardTab[(slot15 or slot14 - slot13 % 3 - 2) - 1] then
			slot16 = slot0.awardTab[slot15 - 1].count
		end

		slot0.preCount = slot16

		slot12(1, slot15, slot16)
		slot12(2, slot15 + 1, slot16)
		slot12(3, slot15 + 2, slot16)
		slot0.downPanel:get("item1"):get("number"):text(slot11 - slot16)
		slot0.downPanel:visible(true)
	end
end

function slot6.onAwardClick(slot0, slot1)
	slot2 = slot0.awardIdTabel[slot1]

	if slot0.siteStateTab[slot1] == 1 then
		gGameApp:requestServer("/game/draw/sum/box/get", function (slot0)
			uv4 = "gGameUI"

			gGameUI:showGainDisplay(csv.draw_count[slot4].award, {
				raw = false,
				cb = function ()
					uv0 = "downPanel"
					uv3 = "get"
					slot0 = slot0.downPanel:get("item" .. slot3 + 1):get("result")
					slot0 = slot0.visible

					slot0(slot0, false)

					uv0 = "downPanel"

					slot0:initAward()
				end
			})
		end, slot2)

		return
	end

	gGameUI:showBoxDetail({
		data = csv.draw_count[slot2].award,
		content = string.format(gLanguageCsv.accumulatedAward, csv.draw_count[slot2].count - (slot0.preCount or 0)),
		state = slot0.siteStateTab[slot1] == 2 and 1 or 0
	})
end

function slot6.drawRequest(slot0, slot1, slot2, slot3)
	slot4 = gGameModel.role:read("vip_level")
	slot5 = {
		item = slot0.itemDrawCount:read() or 0,
		rmb = slot0.rmbDrawCount:read() or 0
	}
	slot6 = {
		item = gVipCsv[slot4].itemDrawChipCountLimit,
		rmb = gVipCsv[slot4].rmbDrawChipCountLimit
	}
	slot7 = false
	slot8 = slot1 .. slot2

	if slot2 == 1 and ({
		item = slot0.itemFreeCount:read() or 0,
		rmb = slot0.rmbFreeCount:read() or 0
	})[slot1] <= 0 then
		slot8 = slot1 == "item" and "free_item1" or "free1"
		slot7 = true
	end

	if slot2 > slot6[slot1] - slot5[slot1] and not slot7 then
		gGameUI:showTip(gLanguageCsv.chipDrawLimit)

		return
	end

	if slot1 == "item" then
		uv10 = "gGameModel"
		slot10 = slot10[slot1]
		uv10 = "role"

		if dataEasy.getNumByKey(slot10) < slot10[slot1][slot2] and not slot7 then
			gGameUI:showTip(gLanguageCsv.inadequateProps)

			return
		end
	end

	slot10 = slot1
	uv10 = "role"

	if dataEasy.getNumByKey(slot10) < slot10[slot1][slot2] and not slot7 then
		uv10 = "gGameModel"

		if dataEasy.getNumByKey(slot10[slot1]) < slot2 then
			uiEasy.showDialog(slot1)

			return
		end
	end

	slot9 = slot0.items
	slot10 = slot9
	uv10 = "gGameModel"

	if slot8 == "rmb10" and (slot9.read(slot10)[slot10.rmb] or 0) < 10 and userDefault.getCurrDayKey("diamondChipDrawTips", 1) == 1 and dataEasy.isUnlock("ChipDrawTips") then
		uv11 = "role"

		gGameUI:showDialog({
			isRich = true,
			clearFast = true,
			btnType = 2,
			content = string.format(gLanguageCsv.draw10CardTips, slot11[slot1][slot2]),
			cb = function ()
				uv4 = "/game/lottery/chip/draw"
				uv5 = "gGameApp"

				gGameApp:requestServer("/game/lottery/chip/draw", function (slot0)
					slot2 = slot0
					uv2 = "dataEasy"
					slot2 = slot2.initAward

					slot2(slot2)

					uv2 = "mergeRawDate"

					slot2(random.shuffle(dataEasy.mergeRawDate(slot2)))

					uv2 = "initAward"

					if slot2 == "rmb10" then
						uv2 = "random"

						if slot2 < 10 then
							userDefault.setCurrDayKey("diamondChipDrawTips", 0)
						end
					end
				end, slot4, slot5.selectUpSuitID)
			end
		})
	elseif slot8 == "rmb1" and slot9 == 0 or slot8 == "rmb10" and slot9 < 10 then
		uv13 = "role"

		dataEasy.sureUsingDiamonds(slot10, slot13[slot1][slot2])
	else
		slot10()
	end
end

function slot6.draw(slot0, slot1, slot2)
	slot0:drawRequest(slot1, slot2, function (slot0)
		uv7 = "gGameUI"
		uv8 = "stackUI"
		uv9 = "city.card.chip.result"
		uv10 = "gGameUI"
		uv10 = "stackUI"
		uv10 = "createHandler"
		uv11 = "gGameUI"
		uv11 = "drawRequest"

		gGameUI:stackUI("city.card.chip.result", nil, , slot0, slot7, slot8, slot9[slot10][slot10], slot10[slot11], slot11:createHandler("drawRequest"))
	end)
end

function slot6.initSelectSuitUI(slot0)
	slot0.selectUpSuitID = {}
	slot3 = {}
	slot1 = userDefault.getForeverLocalKey("selectUpSuitID", slot3)
	uv3 = "selectUpSuitID"

	for slot5 = 1, slot3 do
		if slot1[slot5] ~= 0 then
			table.insert(slot0.selectUpSuitID, slot1[slot5])
		end
	end

	uv2 = "selectUpSuitID"

	for slot5 = slot2, 1, -1 do
		if not slot0.panelSelectSuit:get("item0" .. slot5) then
			uv9 = "selectUpSuitID"
			slot6 = slot0.selectSuitItem:clone():xy(600 - 140 * (slot9 + 1 - slot5), 0):addTo(slot0.panelSelectSuit, 1, "item0" .. slot5)
		end

		slot7 = slot6:multiget("imgIcon", "imgAdd")
		slot8 = slot0.selectUpSuitID[slot5] == nil

		slot7.imgAdd:visible(slot8)
		slot7.imgIcon:visible(not slot8)

		if not slot8 then
			slot9, slot10 = next(gChipSuitCsv[slot0.selectUpSuitID[slot5]][6])

			slot7.imgIcon:texture(string.gsub(slot10.suitIcon, "0.png", "2.png"))
		end
	end

	uv5 = "selectUpSuitID"

	slot0.panelSelectSuit:get("img01"):x(520 - slot5 * 140)
end

function slot6.onBtnSelectSuit(slot0)
	gGameUI:stackUI("city.card.chip.select_suit", nil, , {
		callBack = slot0:createHandler("initSelectSuitUI")
	})
end

function slot6.initModel(slot0)
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.vip_level = gGameModel.role:getIdler("vip_level")
	slot1 = gGameModel.daily_record
	slot0.itemDrawCount = slot1:getIdler("draw_chip_item")
	slot0.rmbDrawCount = slot1:getIdler("draw_chip_rmb")
	slot0.itemFreeCount = slot1:getIdler("chip_item_dc1_free_count")
	slot0.rmbFreeCount = slot1:getIdler("chip_rmb_dc1_free_count")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.chipAllCount = gGameModel.lottery_record:getIdler("chip_rmb_dc1_counter")
	slot0.chipAllCountTen = gGameModel.lottery_record:getIdler("chip_rmb_dc10_counter")
	slot0.getDiamondAwardState = gGameModel.role:getIdler("draw_sum_box")
end

return slot6
