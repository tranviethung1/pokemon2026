slot0 = {
	ZIXUNA = 1,
	TUPO = 2
}

function slot1(slot0)
	for slot5, slot6 in ipairs(slot0) do
		if not slot6.isFisAwards then
			slot1 = 0 + 1
		end
	end

	return slot1
end

function slot2(slot0, slot1, slot2, slot3)
	bind.extend(slot0, slot1:get("icon"), {
		class = "icon_key",
		props = {
			data = slot2,
			onNode = function (slot0)
				uv3 = "setTouchEnabled"

				slot0:setTouchEnabled(slot3)
			end
		}
	})
end

function slot3(slot0, slot1, slot2)
	if slot1.isFisAwards then
		slot2:get("add"):hide()

		slot3 = slot2:get("select")
		slot3 = slot3.hide

		slot3(slot3)

		uv3 = "isFisAwards"

		slot3(slot0, slot2, dataEasy.getItemData(slot1.showAwards)[1], true)
	elseif slot1.choose and slot1.choose > 0 then
		slot2:get("add"):hide()
		slot2:get("select"):visible(slot1.canbuy)

		slot4 = slot1.choose
		uv4 = "isFisAwards"

		slot4(slot0, slot2, dataEasy.getItemData(slot1.showAwards[slot4])[1])
		bind.touch(slot0, slot2, {
			clicksafe = false,
			methods = {
				ended = functools.partial(slot0.clickCell, slot1, slot1.choose)
			}
		})
	else
		slot2:get("select"):hide()
		slot2:get("add"):show()
		slot2:get("icon"):hide()
		bind.touch(slot0, slot2, {
			clicksafe = false,
			methods = {
				ended = functools.partial(slot0.clickCell, slot1, 0)
			}
		})
	end
end

slot4 = class("ActivityPreferentialView", Dialog)
slot4.RESOURCE_FILENAME = "activity_preferential_goods.json"
slot4.RESOURCE_BINDING = {
	item = "item",
	goodsBg = "goodsBg",
	bg = "bg",
	leftItem = "leftItem",
	pricePanel = "pricePanel",
	titleImage = "titleImage",
	timeLabel = "timeLabel",
	close = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["leftItem.selected.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(36, 126, 190, 255)
				}
			}
		}
	},
	leftList = {
		varname = "tabList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("leftItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("normal")

					slot1:get("selected"):hide()
					slot1:get("normal"):hide()

					if slot3.selected then
						slot4 = slot1:get("selected")
					end

					slot4:show()
					slot4:get("txt"):text(slot3.name):scale(1):setFontSize(40)

					if matchLanguage({
						"en",
						"kr"
					}) then
						adapt.setTextAdaptWithSize(slot4:get("txt"), {
							vertical = "center",
							horizontal = "center",
							size = cc.size(240, 80)
						})
					else
						adapt.setTextScaleWithWidth(slot4:get("txt"), nil, 220)
					end

					slot1:onClick(functools.partial(slot0.clickCell, slot2))
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	goodsList = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 20,
				data = bindHelper.self("itemsData"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = false
				},
				onItem = function ()
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
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				clickCell = bindHelper.self("onselectClick")
			}
		}
	},
	["pricePanel.btnBuy"] = {
		varname = "btnBuy",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("clickBuy")
			}
		}
	},
	["pricePanel.btnBuy.txt"] = {
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

function slot4.onCreate(slot0, slot1)
	gGameModel.forever_dispatch:getIdlerOrigin("preferentialGoodsClick"):set(true)

	slot0.activityId = slot1
	slot0.huodongID = csv.yunying.yyhuodong[slot0.activityId].huodongID

	slot0:initModel()
	slot0:initUI()
	slot0:initData()
	slot0:initTabData()
	slot0:setTimeLabel()
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot4.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.tabDatas = idlers.newWithMap({})
	slot0.itemsData = idlers.newWithMap({})
	slot0.showTab = idler.new(1)
	slot0.clientBuyTimes = idler.new(true)
	slot0.timeout = false
end

function slot4.initTabData(slot0)
	slot1 = {}

	for slot5, slot6 in orderCsvPairs(csv.yunying.customize_gift) do
		if slot6.huodongID == slot0.huodongID then
			slot7 = table.insert
			slot8 = slot1
			slot9 = {
				id = slot5,
				name = slot6.name
			}

			if itertools.size(slot6.optionalAwards1) > 0 then
				uv10 = "orderCsvPairs"

				if not slot10.ZIXUNA then
					uv10 = "orderCsvPairs"
					slot10 = slot10.TUPO
				end
			end

			slot9.type = slot10

			slot7(slot8, slot9)
		end
	end

	table.sort(slot1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.tabDatas:update(slot1)
	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatas"

		for slot5, slot6 in slot2.tabDatas:pairs() do
			if slot5 == slot0 then
				uv7 = "tabDatas"
				slot7 = slot7.tabDatas:atproxy(slot5)
				slot7.selected = true
				uv7 = "tabDatas"
				slot9 = "img1"
				slot7 = slot7.bg:get(slot9)
				slot7 = slot7.visible
				uv9 = "tabDatas"
				slot9 = slot9.tabDatas
				slot10 = slot9
				uv10 = "pairs"

				slot7(slot7, slot9.atproxy(slot10, slot5).type == slot10.TUPO)

				uv7 = "tabDatas"
				slot9 = "img2"
				uv9 = "tabDatas"
				slot9 = slot9.tabDatas
				slot10 = slot9
				uv10 = "pairs"

				slot7.bg:get(slot9):visible(slot9.atproxy(slot10, slot5).type == slot10.ZIXUNA)
			elseif slot5 == slot1 then
				uv7 = "tabDatas"
				slot7.tabDatas:atproxy(slot5).selected = false
			end
		end

		uv2 = "tabDatas"
		slot2 = slot2.updatePricePanel
		uv4 = "tabDatas"
		slot4 = slot4.itemData[slot0]

		slot2(slot2, slot4)

		uv2 = "tabDatas"
		uv4 = "tabDatas"

		slot2.itemsData:update(slot4.itemData[slot0].awards)
	end)
end

function slot4.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot4.onselectClick(slot0, slot1, slot2, slot3)
	slot10 = slot0.activityId
	uv10 = "gGameUI"

	gGameUI:stackUI("city.activity.preferential_goods_select", nil, , {
		slot3,
		activityId = slot10,
		slotNums = slot10(slot0.itemData[slot0.showTab:read()].awards),
		data = slot0.itemData[slot0.showTab:read()],
		val = slot2
	})
end

function slot4.updatePricePanel(slot0, slot1)
	slot0.pricePanel:get("mask"):visible(not slot1.isCanBuy)
	slot0.pricePanel:get("originalPricePanel.num"):text(string.format(gLanguageCsv.goodsMoney, slot1.rmb))
	uiEasy.setBtnShader(slot0.btnBuy, slot0.btnBuy:get("txt"), slot1.isCanBuy and 1 or 2)
	slot0.pricePanel:get("btnBuy.txt"):text(string.format(gLanguageCsv.symbolMoney, slot1.rmbDisplay))
	slot0.pricePanel:get("limitTxt"):text(string.format(gLanguageCsv.foreverLimit, slot1.buyTimes - slot1.hasBoughtNum, slot1.buyTimes))

	if itertools.size(slot1.awards) >= 5 then
		slot0.goodsBg:width((slot0.item:width() + 35) * itertools.size(slot1.awards))
		slot0.list:x(slot0.pricePanel:x() - slot0.list:width() / 2 + 100)
	else
		slot0.goodsBg:width((slot0.item:width() + 30) * itertools.size(slot1.awards) + 50)
		slot0.list:x(slot0.pricePanel:x() - slot0.list:width() / 2)
	end

	slot0.goodsBg:x(slot0.list:x() + slot0.list:width() / 2 + 10)
end

function slot4.initData(slot0)
	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "itemData"
		uv3 = "itemData"
		slot4 = slot3
		uv5 = "itemData"
		slot5 = slot1[slot5.activityId]
		slot2.itemData = slot3.initCsv(slot4, slot5)
		uv2 = "itemData"
		slot2 = slot2.itemsData
		slot2 = slot2.update
		uv4 = "itemData"
		uv5 = "itemData"
		slot5 = slot5.showTab:read()
		slot4 = slot4.itemData[slot5].awards

		slot2(slot2, slot4)

		uv2 = "itemData"
		uv4 = "itemData"
		uv5 = "itemData"

		slot2:updatePricePanel(slot4.itemData[slot5.showTab:read()])
	end)
end

function slot4.initUI(slot0)
	slot1 = {
		["activity/preferential_novice"] = cc.c4b(255, 238, 209, 255),
		["activity/preferential_double"] = cc.c4b(255, 238, 209, 255)
	}
	slot2 = {
		["activity/preferential_novice"] = cc.c4b(214, 30, 98, 255),
		["activity/preferential_double"] = cc.c4b(214, 30, 98, 255)
	}

	if csv.yunying.yyhuodong[slot0.activityId] and slot3.clientParam and slot3.clientParam.res then
		slot4 = slot3.clientParam.res

		slot0.bg:texture(string.format("%s/%s", slot4, "img_thwx.png"))
		slot0.bg:get("img1"):texture(string.format("%s/%s", slot4, "img_tpbx.png"))
		slot0.bg:get("img2"):texture(string.format("%s/%s", slot4, "img_zxbx.png"))
		slot0.leftItem:get("selected.bg"):texture(string.format("%s/%s", slot4, "btn_xz.png"))
		slot0.titleImage:texture(string.format("%s/%s", slot4, "txt_thwx.png"))

		if slot2[slot4] then
			text.addEffect(slot0.leftItem:get("selected.txt"), {
				outline = {
					color = slot2[slot4]
				}
			})
			text.addEffect(slot0.timeLabel, {
				color = slot2[slot4]
			})
		end

		if slot1[slot4] then
			text.addEffect(slot0.leftItem:get("normal.txt"), {
				color = slot1[slot4]
			})
		end
	end
end

function slot4.initCsv(slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot4 = {}

	function slot5(slot0, slot1)
		uv2 = "choose"

		if slot2 then
			uv2 = "choose"

			if slot2.choose then
				uv2 = "choose"

				if slot2.choose[slot0] then
					uv2 = "choose"
					slot2 = slot2.choose[slot0][slot1]
				end
			end
		end

		if not csv.yunying.customize_gift[slot0]["optionalAwards" .. slot1][slot2] then
			return 0
		end

		return slot2
	end

	function slot6(slot0)
		uv1 = "stamps"

		if slot1 then
			uv1 = "stamps"

			if slot1.stamps then
				uv1 = "stamps"

				if slot1.stamps[slot0] then
					uv1 = "stamps"

					if slot1.stamps[slot0] > 0 then
						uv1 = "stamps"
						slot1 = slot1.stamps[slot0]
					else
						slot1 = false
					end
				end
			end
		end

		return slot1
	end

	for slot11, slot12 in orderCsvPairs(csv.yunying.customize_gift) do
		if slot12.huodongID == slot0.huodongID then
			slot15 = true

			function (slot0, slot1, slot2, slot3, slot4, slot5)
				if itertools.size(slot2) > 0 then
					if slot3 then
						for slot9, slot10 in ipairs(dataEasy.getItemData(slot2)) do
							table.insert(slot0, {
								showAwards = {
									[slot10.key] = slot10.num
								},
								isFisAwards = slot3,
								optionSlotNum = slot4,
								choose = slot5,
								canbuy = slot1
							})
						end
					else
						table.insert(slot0, {
							showAwards = table.deepcopy(slot2, true),
							isFisAwards = slot3,
							optionSlotNum = slot4,
							choose = slot5,
							canbuy = slot1
						})
					end

					if not slot5 or slot5 == 0 then
						return false
					else
						return true
					end
				end

				return true
			end({}, slot12.buyTimes - (slot6(slot11) or 0) > 0, slot12.awards, true)

			if itertools.size(slot12.optionalAwards1) > 0 then
				for slot19 = 1, math.huge do
					if slot12["optionalAwards" .. slot19] and itertools.size(slot20) > 0 then
						if not slot7(slot14, slot13 > 0, slot20, false, slot19, slot5(slot11, slot19)) then
							slot15 = false
						end
					else
						break
					end
				end
			end

			table.insert(slot2, {
				awards = slot14,
				buyTimes = slot12.buyTimes,
				name = slot12.name,
				rechargeID = slot12.rechargeID,
				rmbDisplay = csv.recharges[slot12.rechargeID].rmbDisplay,
				rmb = slot12.originalCost,
				hasBoughtNum = slot6(slot11) or 0,
				isCanBuy = slot13 > 0,
				csvId = slot11,
				hasAllChoose = slot15
			})
		end
	end

	return slot2
end

function slot4.setTimeLabel(slot0)
	bind.extend(slot0, slot0.timeLabel, {
		class = "cutdown_label",
		props = {
			endTime = gGameModel.role:read("yy_endtime")[slot0.activityId],
			endFunc = function ()
				uv0 = "timeout"
				slot0.timeout = true
				uv0 = "timeout"

				slot0.timeLabel:text(gLanguageCsv.activityOver)
			end,
			callFunc = function (slot0)
				uv1 = "timeLabel"

				slot1.timeLabel:text(gLanguageCsv.exclusiveRestrictionClose .. slot0.str)
			end
		}
	})
end

function slot4.clickBuy(slot0)
	slot1 = slot0.itemData[slot0.showTab:read()]

	if slot0.timeout then
		gGameUI:showTip(gLanguageCsv.activityOver)

		return
	end

	if not slot1.hasAllChoose then
		gGameUI:showTip(gLanguageCsv.selectGiftTip)

		return
	end

	gGameApp:payDirect(slot0, {
		rechargeId = slot1.rechargeID,
		yyID = slot0.activityId,
		csvID = slot1.csvId,
		buyTimes = slot1.hasBoughtNum,
		name = slot1.name
	}, slot0.clientBuyTimes):doit()
end

return slot4
