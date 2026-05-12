slot0 = {
	currency = 1,
	exclusive = 2
}
slot1 = require("app.views.city.zawake.tools")
slot2 = cc.load("mvc").ViewBase
slot3 = class("ZawakeDebrisView", Dialog)
slot3.RESOURCE_FILENAME = "zawake_debris.json"
slot3.RESOURCE_BINDING = {
	needNum = "needNumText",
	autoPanel = "autoPanel",
	needSum = "needSum",
	cardPanel1 = "cardPanel1",
	barPanel = "barPanel",
	["barPanel.needFrags"] = "needFrags",
	titleTxt = "title",
	combTipPos = "combTipPos",
	textTips1 = "textTips1",
	cardPanel2 = "cardPanel2",
	textTips = "textTips",
	priceItem = "priceItem",
	item = "item",
	["barPanel.bar"] = "slider",
	textNeed1 = "textNeed1",
	["barPanel.myFrags"] = "myFrags",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnList = {
		varname = "btnList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = slot1:get("title")

					slot5:text(slot3.name)
					adapt.setTextScaleWithWidth(slot5, nil, 210)
					slot1:get("btn"):setBright(not slot3.isSelected)
					slot1:onClick(functools.partial(slot0.itemClick, slot2))

					if slot3.isSelected then
						text.addEffect(slot5, {
							glow = {
								color = ui.COLORS.GLOW.WHITE
							},
							color = ui.COLORS.NORMAL.WHITE
						})
					else
						text.addEffect(slot5, {
							color = ui.COLORS.NORMAL.RED
						})
					end
				end
			},
			handlers = {
				itemClick = bindHelper.self("onChangePage")
			}
		}
	},
	["cardPanel1.card1"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:onChooseClick()
				end)
			}
		}
	},
	["cardPanel2.card1"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					slot0:onChooseClick()
				end)
			}
		}
	},
	["barPanel.subBtn"] = {
		varname = "subBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["barPanel.addBtn"] = {
		varname = "addBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	},
	changeBtn = {
		varname = "changeBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChangeClick")
			}
		}
	},
	["changeBtn.title"] = {
		varname = "btnTxt",
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
	["autoPanel.btnPanel"] = {
		varname = "btnAuto",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAutoClick")
			}
		}
	},
	priceList = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("priceDatas"),
				item = bindHelper.self("priceItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:size()
					slot5 = slot1:multiget("price", "icon", "txt1")

					slot5.price:text(mathEasy.getShortNumber(slot3.num))
					text.addEffect(slot5.price, {
						color = slot3.num <= dataEasy.getNumByKey(slot3.key) and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.NORMAL.ALERT_ORANGE
					})
					slot5.icon:texture(ui.COMMON_ICON[slot3.key])
					adapt.oneLineCenterPos(cc.p(slot4.width / 2, slot4.height / 2), {
						slot5.txt1,
						slot5.price,
						slot5.icon
					}, cc.p(10, 0))
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0:enableSchedule()

	slot0.cb = slot1.cb
	slot0.fragID = slot1.fragID
	slot0.needNum = slot1.needNum
	slot0.zawakeID = slot1.zawakeID
	slot0.stageID = slot1.stageID
	slot0.selectCardDbId = idler.new()
	slot0.costNum = idler.new(0)
	slot0.selectedFragId = idler.new(0)
	slot0.selectEpNum = idler.new(0)
	slot0.isAutoSelect = idler.new(false)

	slot0:initModel()

	if slot0.zawakeID then
		slot7 = "symbolRome" .. slot0.stageID
		uv7 = "enableSchedule"
		slot0.stageMaxText = string.format("%s - %s", gLanguageCsv[slot7], slot7.MAXLEVEL)

		slot0:calculateAutoNum()

		slot0.lastSelectNum = 0

		idlereasy.when(slot0.isAutoSelect, function (slot0, slot1)
			if not slot1 then
				uv2 = "btnAuto"
				slot2 = slot2.btnAuto:get("icon")
				slot2 = slot2.texture
				slot4 = "common/icon/radio_normal.png"

				slot2(slot2, slot4)

				uv2 = "btnAuto"
				uv4 = "btnAuto"

				slot2.selectEpNum:set(slot4.lastSelectNum)
			else
				uv2 = "btnAuto"
				slot2 = slot2.btnAuto:get("icon")
				slot3 = slot2
				slot2 = slot2.texture

				slot2(slot3, "common/icon/radio_selected.png")

				uv2 = "btnAuto"
				uv3 = "btnAuto"
				slot2.lastSelectNum = slot3.selectEpNum:read()
				uv2 = "btnAuto"
				uv5 = "btnAuto"
				uv7 = "btnAuto"
				uv8 = "btnAuto"
				slot8 = slot8.selectedFragId
				slot8 = slot8.read
				uv8 = "btnAuto"

				slot2.selectEpNum:set(math.min(slot5.autoNum - dataEasy.getNumByKey(slot7.fragID), math.floor(dataEasy.getNumByKey(slot8(slot8)) / slot8.fragExchangeRate)))
			end
		end)
	else
		slot0.autoPanel:hide()
		slot0.needSum:hide()
	end

	slot0.tabIdx = idler.new(1)
	uv7 = "fragID"
	slot0.fragExchangeRate = csv.zawake.exchange[slot2].type == slot7.currency and slot5.needFrags[1][3] or slot5.needSpecialFrags[1][2]
	slot0.cardExchangeRate = slot5.cardConvertNum
	slot0.exchangeCsv = slot5
	slot0.priceDatas = idlers.newWithMap({})
	slot0.tabDatas = idlers.newWithMap({
		{
			isSelected = false,
			name = gLanguageCsv.fragChange
		},
		{
			isSelected = false,
			name = gLanguageCsv.cardChange
		}
	})

	slot0.tabIdx:addListener(function (slot0, slot1, slot2)
		uv3 = "tabDatas"

		if slot3.tabDatas:atproxy(slot1) then
			uv3 = "tabDatas"
			slot3.tabDatas:atproxy(slot1).isSelected = false
		end

		uv3 = "tabDatas"

		if slot3.tabDatas:atproxy(slot0) then
			uv3 = "tabDatas"
			slot3.tabDatas:atproxy(slot0).isSelected = true
		end
	end)
	idlereasy.any({
		slot0.tabIdx,
		slot0.gold,
		slot0.selectEpNum
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "updatePrice"

		slot4:updatePrice(slot1 == 2 and 1 or slot3)
	end)
	idlereasy.any({
		slot0.selectCardDbId,
		slot0.tabIdx
	}, function (slot0, slot1, slot2)
		uv3 = "cardPanel1"
		slot3 = slot3.cardPanel1:hide()

		if slot2 == 2 then
			slot3:show()

			if slot1 then
				slot4 = gGameModel.cards:find(slot1)
				slot5 = slot4:read("card_id")
				slot6 = csv.cards[slot5]
				slot8 = dataEasy.getCfgByKey(slot6.fragID).quality
				slot12 = "card"

				uiEasy.setIconName(slot12, slot5, {
					space = true,
					node = slot3:get("textName1"),
					name = slot6.name,
					advance = slot6.advance
				})

				uv12 = "cardPanel1"

				bind.extend(slot12, slot3:get("card1.icon"), {
					class = "card_icon",
					props = {
						unitId = dataEasy.getUnitId(slot5, slot4:read("skin_id")),
						rarity = csv.unit[slot6.unitID].rarity,
						advance = slot4:read("advance"),
						star = slot4:read("star"),
						levelProps = {
							data = slot4:read("level")
						},
						onNode = function (slot0)
							slot0:setTouchEnabled(false)
						end
					}
				})
			else
				slot3:get("textName1"):text(gLanguageCsv.chooseSpriteTips)
			end

			slot3:get("card1.icon"):visible(slot1 ~= nil)

			slot4 = slot3:get("card1.imgAdd")
			slot5 = slot4
			slot4 = slot4.visible

			slot4(slot5, slot1 == nil)

			uv4 = "hide"
			uv5 = "cardPanel1"
			slot5 = slot5.cardExchangeRate
			uv7 = "cardPanel1"

			bind.extend(slot7, slot3:get("card2"), {
				class = "icon_key",
				props = {
					data = {
						key = slot4,
						num = slot5
					}
				}
			})

			slot7 = slot4

			uiEasy.setIconName(slot7, slot5, {
				node = slot3:get("textName2")
			})

			uv7 = "hide"
			slot8 = text.addEffect

			slot8(slot3:get("textName2"), {
				color = ui.COLORS.QUALITY[csv.zawake.zawake_fragments[slot7].quality]
			})

			uv8 = "cardPanel1"
			slot8 = slot8.barPanel
			slot8 = slot8.hide

			slot8(slot8)

			uv8 = "cardPanel1"
			slot8 = slot8.autoPanel
			slot8 = slot8.hide

			slot8(slot8)

			uv8 = "cardPanel1"

			slot8.needSum:hide()
		end

		uv4 = "cardPanel1"

		if slot4.needNum then
			uv4 = "cardPanel1"
			uv9 = "cardPanel1"
			slot9 = slot9.fragID
			uv9 = "cardPanel1"

			slot4.needNumText:text(string.format("%s/%s", dataEasy.getNumByKey(slot9), slot9.needNum))
		else
			uv4 = "cardPanel1"
			slot4 = slot4.textNeed1
			slot4 = slot4.text
			slot7 = ":"

			slot4(slot4, gLanguageCsv.have .. slot7)

			uv4 = "cardPanel1"
			uv7 = "cardPanel1"

			slot4.needNumText:text(dataEasy.getNumByKey(slot7.fragID))
		end
	end)
	idlereasy.any({
		slot0.selectedFragId,
		slot0.selectEpNum,
		slot0.tabIdx,
		slot0.frags
	}, function (slot0, slot1, slot2, slot3, slot4)
		uv5 = "cardPanel2"
		slot5 = slot5.cardPanel2:hide()

		if slot3 == 1 then
			slot6 = slot5.show

			slot6(slot5)

			uv6 = "cardPanel2"

			if slot6.zawakeID then
				uv6 = "cardPanel2"
				slot6 = slot6.autoPanel
				slot6 = slot6.show

				slot6(slot6)

				uv6 = "cardPanel2"

				slot6.needSum:show()

				slot7 = gLanguageCsv.zawakeAutoText
				uv8 = "cardPanel2"
				uv10 = "cardPanel2"
				slot10 = slot10.fragID
				uv10 = "cardPanel2"
				slot6 = string.format(slot7, slot8.stageMaxText, dataEasy.getNumByKey(slot10), slot10.autoNum)
				uv7 = "cardPanel2"

				if slot7.needSum:get("richText") then
					uv7 = "cardPanel2"

					slot7.needSum:removeChildByName("richText")
				end

				slot9 = 0
				uv9 = "cardPanel2"
				slot7 = rich.createWithWidth(slot6, 40, nil, 680, 20):anchorPoint(0.5, 0.5):xy(slot9, -10):addTo(slot9.needSum):name("richText")
				slot8 = slot7.setHorizontalAlignment

				slot8(slot7, 1)

				uv8 = "cardPanel2"

				if slot8.isAutoSelect:read() then
					uv8 = "cardPanel2"

					if not slot8.autoNum then
						uv8 = "cardPanel2"
						slot8 = slot8.needNum
					end
				end

				uv9 = "cardPanel2"
				uv14 = "cardPanel2"

				slot9.needNumText:text(string.format("%s/%s", dataEasy.getNumByKey(slot14.fragID), slot8))
			end

			slot6 = 0

			if slot1 > 0 and dataEasy.getNumByKey(slot1) > 0 then
				uv12 = "cardPanel2"

				slot5:get("card1.imgAdd"):hide()

				slot10 = slot5:get("textName1")
				slot11 = slot10

				slot10.text(slot11, uiEasy.setIconName(slot1))

				uv11 = "cardPanel2"

				bind.extend(slot11, slot5:get("card1.icon"), {
					class = "icon_key",
					props = {
						data = {
							key = slot1,
							num = dataEasy.getNumByKey(slot1),
							targetNum = slot12.fragExchangeRate * (slot2 == 0 and 1 or slot2)
						},
						onNode = function (slot0)
							slot0:setTouchEnabled(false)
						end
					}
				})
				text.addEffect(slot5:get("textName1"), {
					color = ui.COLORS.QUALITY[dataEasy.getCfgByKey(slot1).quality]
				})
			else
				slot5:get("card1.imgAdd"):show()
				slot5:get("textName1"):text(gLanguageCsv.selectFragment)
				text.addEffect(slot5:get("textName1"), {
					color = ui.COLORS.NORMAL.DEFAULT
				})
			end

			slot7 = slot5:get("card1.icon")
			slot7 = slot7.visible

			slot7(slot7, slot1 > 0)

			uv7 = "hide"
			slot10 = 1
			slot8 = math.max(slot2, slot10)
			uv10 = "cardPanel2"

			bind.extend(slot10, slot5:get("card2"), {
				class = "icon_key",
				props = {
					data = {
						key = slot7,
						num = slot8
					}
				}
			})

			slot10 = slot7

			uiEasy.setIconName(slot10, slot8, {
				node = slot5:get("textName2")
			})

			uv10 = "hide"
			slot11 = text.addEffect
			slot13 = {
				color = ui.COLORS.QUALITY[csv.zawake.zawake_fragments[slot10].quality]
			}

			slot11(slot5:get("textName2"), slot13)

			uv11 = "cardPanel2"
			uv13 = "cardPanel2"
			slot11.maxNum = math.floor(slot6 / slot13.fragExchangeRate)
			uv11 = "cardPanel2"

			if not slot11.slider:isHighlighted() then
				uv13 = "cardPanel2"
				slot12 = slot2 / math.floor(slot6 / slot13.fragExchangeRate) * 100
				uv12 = "cardPanel2"

				slot12.slider:setPercent(math.ceil(slot12))

				if slot6 == 0 then
					uv12 = "cardPanel2"

					slot12.slider:setTouchEnabled(false)
				else
					uv12 = "cardPanel2"

					slot12.slider:setTouchEnabled(true)
				end
			end

			uv11 = "cardPanel2"
			slot11 = slot11.barPanel
			slot11 = slot11.show

			slot11(slot11)

			uv11 = "cardPanel2"
			slot11 = slot11.needFrags
			slot11 = slot11.text
			uv14 = "cardPanel2"

			slot11(slot11, "/" .. slot14.maxNum)

			uv11 = "cardPanel2"
			slot13 = slot2

			slot11.myFrags:text(slot13)

			uv13 = "cardPanel2"
			slot13 = slot13.barPanel
			slot14 = slot13
			uv14 = "cardPanel2"
			slot14 = slot14.myFrags
			slot15 = slot14
			slot14 = slot14.y
			slot12 = cc.p(slot13.size(slot14).width / 2, slot14(slot15))
			uv14 = "cardPanel2"
			slot14 = slot14.myFrags
			uv14 = "cardPanel2"

			adapt.oneLineCenterPos(slot12, {
				slot14,
				slot14.needFrags
			})

			uv12 = "cardPanel2"
			slot12 = slot12.addBtn
			uv15 = "cardPanel2"

			uiEasy.setBtnShader(slot12, nil, slot6 >= (slot2 + 1) * slot15.fragExchangeRate and 1 or 2)

			uv12 = "cardPanel2"

			uiEasy.setBtnShader(slot12.subBtn, nil, slot2 > 0 and 1 or 2)
		end
	end)
	slot0.slider:setPercent(0)
	slot0.slider:addEventListener(function (slot0, slot1)
		if slot1 == ccui.SliderEventType.percentChanged then
			uv2 = "ccui"

			slot2:unScheduleAll()

			uv4 = "ccui"
			slot4 = slot4.maxNum * slot0:getPercent() * 0.01
			uv4 = "ccui"

			slot4.selectEpNum:set(math.floor(slot4))
		end
	end)

	if checkLanguage("en") or checkLanguage("kr") then
		adapt.setTextScaleWithWidth(slot0.textTips, nil, 800)
		adapt.setTextScaleWithWidth(slot0.textTips1, nil, 800)
		slot0.textTips:x(slot0.textTips:x() - 150)
		slot0.textTips1:x(slot0.textTips:x())
	end

	Dialog.onCreate(slot0)
end

function slot3.initModel(slot0)
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.cardCapacity = gGameModel.role:getIdler("card_capacity")
	slot0.frags = gGameModel.role:getIdler("frags")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.zawake = gGameModel.role:getIdler("zawake")
end

function slot3.updatePrice(slot0, slot1)
	slot1 = math.max(slot1, 1)
	slot3 = {}
	slot0.costArr = {}

	for slot7, slot8 in csvMapPairs(slot0.tabIdx:read() == 2 and slot0.exchangeCsv.costItemCard or slot0.exchangeCsv.costItemFrag) do
		slot0.costArr[slot7] = slot1 * slot8

		table.insert(slot3, {
			key = slot7,
			num = slot1 * slot8
		})
	end

	slot0.priceDatas:update(slot3)
end

function slot3.onIncreaseNum(slot0, slot1)
	slot0.selectEpNum:modify(function (slot0)
		uv3 = "cc"
		uv6 = "clampf"

		return true, cc.clampf(slot0 + slot3, 0, math.max(slot6.maxNum, 0))
	end)
end

function slot3.onChangeNum(slot0, slot1, slot2, slot3)
	if slot2.name == "click" then
		slot0:unScheduleAll()
		slot0:onIncreaseNum(slot3)
	elseif slot2.name == "began" then
		slot0:schedule(function ()
			uv0 = "onIncreaseNum"
			uv2 = "onIncreaseNum"

			slot0:onIncreaseNum(slot2)
		end, 0.05, 0, 1)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0:unScheduleAll()
	end
end

function slot3.onChangePage(slot0, slot1, slot2)
	slot0.tabIdx:set(slot2)
end

function slot3.onAutoClick(slot0)
	if slot0.selectedFragId:read() == 0 then
		gGameUI:showTip(gLanguageCsv.selectFragment)

		return
	end

	if slot0.autoNum <= dataEasy.getNumByKey(slot0.fragID) then
		gGameUI:showTip(gLanguageCsv.zawakeNeedMax)

		return
	end

	slot0.isAutoSelect:set(not slot0.isAutoSelect:read())
end

function slot3.calculateAutoNum(slot0)
	uv5 = "zawake"

	for slot7 = 1, slot5.MAXLEVEL do
		if ((slot0.zawake:read()[slot0.zawakeID] or {})[slot0.stageID] or 0) < slot7 then
			uv8 = "zawake"
			slot3 = 0 + (slot8.getLevelCfg(slot0.zawakeID, slot0.stageID, slot7).costItemMap[slot0.fragID] or 0)
		end
	end

	slot0.autoNum = slot3

	slot0.autoPanel:get("level"):text(slot0.stageMaxText)
	adapt.oneLinePos(slot0.autoPanel:get("level"), {
		slot0.autoPanel:get("txt"),
		slot0.autoPanel:get("btnPanel")
	}, nil, {
		cc.p(10, 0),
		cc.p(5, 0)
	})
end

function slot3.onChangeClick(slot0)
	function slot1()
	end

	slot2 = dataEasy.getCfgByKey(slot0.fragID).name
	slot3 = ""
	slot4 = {}

	if slot0.tabIdx:read() == 2 then
		if slot0.selectCardDbId:read() == nil then
			gGameUI:showTip(string.format(gLanguageCsv.chooseSpriteTips))

			return
		end

		function slot1()
			uv0 = "costNum"
			slot0 = slot0.costNum
			slot0 = slot0.set

			slot0(slot0, 0)

			uv0 = "costNum"

			slot0.selectCardDbId:set(nil)
		end

		slot4 = {
			cardID = slot0.selectCardDbId:read()
		}
		slot3 = string.format(gLanguageCsv.consumeConversionSprite, csv.cards[gGameModel.cards:find(slot0.selectCardDbId:read()):read("card_id")].name, slot0.cardExchangeRate, slot2)
	else
		slot5 = slot0.selectEpNum:read()

		if slot0.selectedFragId:read() == 0 then
			gGameUI:showTip(string.format(gLanguageCsv.selectFragment))

			return
		end

		if slot5 == 0 then
			gGameUI:showTip(string.format(gLanguageCsv.pleaseSelectNumber, gLanguageCsv.starSkillExchange))

			return
		end

		function slot1()
			uv0 = "selectEpNum"
			slot0 = slot0.selectEpNum
			slot0 = slot0.set

			slot0(slot0, 0, true)

			uv0 = "selectEpNum"
			slot0 = slot0.slider
			slot0 = slot0.setPercent

			slot0(slot0, 0)

			uv0 = "selectEpNum"
			slot0 = slot0.selectedFragId
			slot0 = slot0.set

			slot0(slot0, 0, true)

			uv0 = "selectEpNum"
			slot0 = slot0.isAutoSelect
			slot0 = slot0.set

			slot0(slot0, false)

			uv0 = "selectEpNum"

			if slot0.zawakeID then
				uv0 = "selectEpNum"

				slot0:calculateAutoNum()
			end

			uv0 = "selectEpNum"

			slot0.tabIdx:notify()
		end

		slot4 = {
			fragID = slot0.selectedFragId:read(),
			num = slot5
		}
		slot3 = string.format(gLanguageCsv.consumeConversionFigment, slot0.fragExchangeRate * slot5, dataEasy.getCfgByKey(slot0.selectedFragId:read()).name, slot5, slot2)
	end

	for slot8, slot9 in pairs(slot0.costArr) do
		if dataEasy.getNumByKey(slot8) < slot9 then
			if slot8 == "gold" then
				uiEasy.showDialog("gold")
			else
				gGameUI:showTip(gLanguageCsv.exchangeItemNotEnough)
			end

			return
		end
	end

	function (slot0)
		slot4 = gLanguageCsv.spaceTips
		uv4 = "gGameUI"

		gGameUI:showDialog({
			btnType = 2,
			isRich = true,
			title = slot4,
			content = slot4,
			cb = function ()
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
		})
	end(slot1)
end

function slot3.sendExchange(slot0, slot1, slot2)
	gGameApp:requestServer("/game/card/zawake/exchange", function (slot0)
		slot1 = gGameUI
		slot1 = slot1.showGainDisplay

		slot1(slot1, slot0)

		uv1 = "gGameUI"

		slot1()
	end, slot0.fragID, slot1.cardID, slot1.fragID, slot1.num)
end

function slot3.onChooseClick(slot0)
	slot2 = {
		selectedFragId = slot0.selectedFragId,
		fragID = slot0.fragID,
		isAutoSelect = slot0.isAutoSelect
	}
	slot3 = "city.zawake.choose_fragment"

	if slot0.tabIdx:read() == 2 then
		slot2 = {
			selectCardDbId = slot0.selectCardDbId,
			fragID = slot0.fragID
		}
		slot3 = "city.zawake.choose_card"
	end

	gGameUI:stackUI(slot3, nil, , slot2)
end

function slot3.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot3
