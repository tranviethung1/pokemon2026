slot0 = gLanguageTxtRarity
slot1 = class("MegaConversionView", Dialog)

function slot2(slot0)
	for slot4, slot5 in orderCsvPairs(csv.card_mega) do
		for slot9, slot10 in csvMapPairs(slot5.costItems) do
			if slot9 == slot0 then
				slot14 = "cards"

				for slot14, slot15 in ipairs(gGameModel.role:read(slot14)) do
					if gGameModel.cards:find(slot15):read("card_id") == gCardsMega[slot4].key then
						return slot4
					end
				end

				return
			end
		end
	end
end

slot1.RESOURCE_FILENAME = "card_mega_debris.json"
slot1.RESOURCE_BINDING = {
	title2 = "title2",
	title1 = "title1",
	costPanel = "costPanel",
	debrisItem = "debrisItem",
	timesPanel = "timesPanel",
	item = "item",
	imgIcon = "imgIcon",
	sliderPanel = "sliderPanel",
	["sliderPanel.slider"] = "slider",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	spriteBtn = {
		varname = "spriteBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("spriteBtnFunc")
			}
		}
	},
	debrisBtn = {
		varname = "debrisBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("debrisBtnFunc")
			}
		}
	},
	rule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("ruleFunc")
			}
		}
	},
	clickBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("conversionFunc")
			}
		}
	},
	["timesPanel.add"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("addNumFunc")
			}
		}
	},
	["sliderPanel.subBtn"] = {
		varname = "sliderSubBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["sliderPanel.addBtn"] = {
		varname = "sliderAddBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("costDatas"),
				item = bindHelper.self("item"),
				imgIcon = bindHelper.self("imgIcon"),
				debrisItem = bindHelper.self("debrisItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:removeChildByName("descList")

					slot4 = slot1:multiget("name", "name2", "icon", "item", "add")

					if itertools.size(slot3) == 0 then
						slot4.add:show()
						itertools.invoke({
							slot4.name,
							slot4.icon,
							slot4.item
						}, "hide")
						slot4.name2:hide()
						slot1:width(80)
						slot4.add:x(40)
					else
						slot4.add:hide()
						itertools.invoke({
							slot4.name,
							slot4.icon,
							slot4.item
						}, "show")
						slot4.item:get("add"):hide()
						slot1:width(200)

						if slot3.type == "card" then
							if not slot3.selectId then
								slot4.item:hide()

								uv9 = "removeChildByName"
								slot10 = slot3.cfg.needCards1[1]
								slot6 = gLanguageCsv.selectCardFragments .. string.format(gLanguageCsv.selectRarityCardFragments, slot9[slot10])

								for slot10 = 1, math.huge do
									if itertools.isempty(slot5["needCards" .. slot10]) then
										break
									end

									if slot11[2] ~= -1 then
										slot12 = game.NATURE_TABLE[slot11[2]]
										slot6 = slot6 .. ui.ATTRCOLOR[slot12] .. string.format(gLanguageCsv.selectTypeCardFragments, gLanguageCsv[slot12]) .. "#C0x5B545B#"
									end
								end

								slot4.name:hide()
								slot4.name2:hide()
								beauty.textScroll({
									isRich = true,
									size = {
										width = 280,
										height = 180
									},
									strs = "#C0x5B545B#" .. slot6 .. gLanguageCsv.card,
									fontSize = matchLanguage({
										"cn"
									}) and 34 or 40
								}):xy(slot4.name2:x() - slot4.name2:width() / 2, slot4.name2:y() - slot4.name2:height() / 2):addTo(slot1, 5, "descList")
							else
								slot4.icon:hide()

								slot6 = gGameModel.cards:find(slot3.selectId):read("card_id", "name", "level", "star", "advance")

								bind.extend(slot0, slot4.item, {
									class = "card_icon",
									props = {
										cardId = slot6.card_id,
										advance = slot6.advance,
										star = slot6.star,
										dbid = slot3.selectId,
										rarity = csv.unit[csv.cards[slot6.card_id].unitID].rarity,
										levelProps = {
											data = slot6.level
										},
										onNode = function (slot0)
											slot0:setTouchEnabled(false)
										end
									}
								})
								uiEasy.setIconName("card", slot6.card_id, {
									node = slot4.name
								})
								slot4.name2:hide()
							end
						elseif slot3.type == "frag" then
							slot5, slot6 = nil

							if not slot3.selectId then
								slot4.item:hide()

								uv11 = "removeChildByName"
								slot12 = slot3.cfg.needFrags1[1] - 2
								slot8 = gLanguageCsv.selectCardFragments .. string.format(gLanguageCsv.selectRarityCardFragments, slot11[slot12])

								for slot12 = 1, math.huge do
									if itertools.isempty(slot7["needFrags" .. slot12]) then
										break
									end

									if slot13[2] ~= -1 then
										slot14 = game.NATURE_TABLE[slot13[2]]
										slot8 = slot8 .. ui.ATTRCOLOR[slot14] .. string.format(gLanguageCsv.selectTypeCardFragments, gLanguageCsv[slot14]) .. "#C0x5B545B#"
									end
								end

								slot4.name:hide()
								slot4.name2:hide()
								slot1:removeChildByName("descList")
								beauty.textScroll({
									isRich = true,
									size = {
										width = 280,
										height = 180
									},
									strs = "#C0x5B545B#" .. slot8 .. gLanguageCsv.fragment,
									fontSize = matchLanguage({
										"cn"
									}) and 34 or 40
								}):xy(slot4.name2:x() - slot4.name2:width() / 2, slot4.name2:y() - slot4.name2:height() / 2):addTo(slot1, 5, "descList")
								slot4.item:get("add"):show()

								slot5 = slot3.num
							else
								slot4.icon:hide()
								slot4.name2:hide()
								uiEasy.setIconName(slot3.selectId, slot3.num, {
									node = slot4.name,
									width = slot1:width()
								})
								slot4.item:get("add"):visible(dataEasy.getNumByKey(slot3.selectId) < slot3.num * slot3.targetNum)
								bind.extend(slot0, slot4.item, {
									class = "icon_key",
									props = {
										grayState = slot5 < slot6 and 1 or 0,
										data = {
											key = slot3.selectId,
											num = slot5,
											targetNum = slot6
										},
										onNode = function (slot0)
											slot0:setTouchEnabled(false)
										end
									}
								})
							end
						else
							slot4.icon:hide()

							if dataEasy.getNumByKey(slot3.key) < slot3.num then
								slot4.item:get("add"):show()
							end

							bind.extend(slot0, slot4.item, {
								class = "icon_key",
								props = {
									grayState = slot5 < slot3.num and 1 or 0,
									data = {
										key = slot3.key,
										num = slot5,
										targetNum = slot3.num * (slot3.targetNum or 1)
									},
									onNode = function (slot0)
										slot0:setTouchEnabled(false)
									end
								}
							})
							slot4.name2:hide()
							uiEasy.setIconName(slot3.key, slot3.num, {
								node = slot4.name
							})
						end

						bind.touch(slot0, slot4.icon, {
							methods = {
								ended = function ()
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
							}
						})
						bind.touch(slot0, slot4.item, {
							methods = {
								ended = function ()
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
							}
						})
					end
				end,
				onAfterBuild = function (slot0)
					slot1 = slot0:getInnerItemSize().width
					slot2 = 80
					slot3 = 200
					slot4 = 100

					slot0:x(display.sizeInView.width / 2 - (slot1 + slot2 + slot3 + slot4 * 2) / 2)
					slot0.imgIcon:x(slot0:x() + slot1 + slot4 + slot2 / 2)
					slot0.debrisItem:x(slot0:x() + slot1 + slot2 + slot4 * 2 + slot3 / 2)
				end
			},
			handlers = {
				chooseCard = bindHelper.self("chooseCard")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.debrisItem:y(slot0.debrisItem:y() + 18)

	slot0.cardConvertFlag = true
	slot0.data = slot1

	slot0:initModel()
	slot0:enableSchedule()

	slot0.cardConvertCfg = csv.card_mega_convert[slot1.id]
	slot2 = gLanguageCsv.yaoStone
	slot3 = gVipCsv[slot0.vipLevel]

	if slot0.cardConvertCfg.type == 2 then
		slot0.ruleContent = {
			97001,
			97010
		}
		slot2 = gLanguageCsv.superStone
		slot4 = gLanguageCsv.superStoneRule
		slot0.ruleTitle = slot4
		uv4 = "debrisItem"
		slot0.hadMega = slot4(slot1.id)
	else
		slot0.ruleContent = {
			96001,
			96010
		}
		slot0.ruleTitle = gLanguageCsv.yaoStoneRule
	end

	slot0.title1:text(slot2)
	slot0.title2:x(slot0.title1:x() + slot0.title1:width())
	slot0.timesPanel:get("tip"):text(string.format(gLanguageCsv.megaConvertTimesTip, slot0.cardConvertCfg.type ~= 1 and gCommonConfigCsv.megaConvertTimes or gCommonConfigCsv.megaCommonConvertTimes))
	idlereasy.any({
		slot0.megaConvertTimes,
		slot0.megaConvertBuyTimes
	}, function (slot0, slot1, slot2)
		uv3 = "conversionNum"

		if slot1 then
			uv4 = "id"

			if not slot1[slot4.id] then
				slot4 = 0
			end
		end

		slot3.conversionNum = slot4
		uv3 = "conversionNum"
		slot5 = "num1"
		slot3 = slot3.timesPanel:get(slot5)
		slot4 = slot3
		uv5 = "conversionNum"

		slot3.text(slot4, slot5.conversionNum)

		uv3 = "conversionNum"
		uv4 = "conversionNum"

		if slot4.cardConvertCfg.type ~= 1 then
			uv5 = "conversionNum"

			if not gVipCsv[slot5.vipLevel].megaItemMaxTimes then
				uv5 = "conversionNum"
				slot4 = gVipCsv[slot5.vipLevel].megaCommonItemMaxTimes
			end
		end

		slot3.conversionNumMax = slot4
		uv3 = "conversionNum"
		slot3 = slot3.timesPanel:get("num2")
		slot4 = slot3
		uv6 = "conversionNum"

		slot3.text(slot4, "/" .. slot6.conversionNumMax)

		uv4 = "conversionNum"
		slot6 = "num2"
		uv6 = "conversionNum"
		slot6 = slot6.timesPanel:get("num1")
		uv6 = "conversionNum"

		adapt.oneLinePos(slot4.timesPanel:get(slot6), {
			slot6,
			slot6.timesPanel:get("txt1")
		}, cc.p(0, 0), "right")
	end)

	slot0.selectedData = {
		key = "card",
		csvId = slot1.id
	}
	slot0.costDatas = idlers.newWithMap({})
	slot0.maxNum = 0

	slot0.debrisBtn:get("txt2"):hide()
	slot0.spriteBtn:get("txt2"):hide()
	slot0.debrisBtn:x(slot0.spriteBtn:x())
	slot0.spriteBtn:x(slot0.debrisBtn:x())

	slot0.sliderNum = idler.new(0)

	idlereasy.when(slot0.sliderNum, function (slot0, slot1)
		uv2 = "sliderPanel"
		slot2 = slot2.sliderPanel:get("txt1")
		slot2 = slot2.text

		slot2(slot2, slot1)

		uv2 = "sliderPanel"
		slot2 = slot2.stateUpdate

		slot2(slot2)

		uv2 = "sliderPanel"

		if not slot2.slider:isHighlighted() then
			uv2 = "sliderPanel"

			if slot2.maxNum == 0 then
				slot2 = 0
			else
				uv2 = "sliderPanel"
				slot2 = slot1 / slot2.maxNum
			end

			uv3 = "sliderPanel"

			slot3.slider:setPercent(slot2 * 100)
		end
	end)
	slot0.slider:addEventListener(function (slot0, slot1)
		uv2 = "unScheduleAll"

		slot2:unScheduleAll()

		uv5 = "unScheduleAll"
		slot4 = math.ceil(slot5.maxNum * slot0:getPercent() * 0.01)
		uv6 = "unScheduleAll"
		uv4 = "unScheduleAll"

		slot4.sliderNum:set(cc.clampf(slot4, 0, slot6.maxNum))
	end)
	idlereasy.when(slot0.gold, functools.partial(slot0.costGoldUpdate, slot0))
	idlereasy.any({
		slot0.cards,
		slot0.frags,
		slot0.items
	}, functools.partial(slot0.stateChange, slot0))
	slot0:debrisBtnFunc()
	Dialog.onCreate(slot0, {
		blackType = 2
	})
end

function slot1.initModel(slot0)
	slot0.vipLevel = gGameModel.role:read("vip_level")
	slot0.megaConvertTimes = gGameModel.role:getIdler("mega_convert_times")
	slot0.megaConvertBuyTimes = gGameModel.daily_record:getIdler("mega_convert_buy_times")
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.frags = gGameModel.role:getIdler("frags")
	slot0.gold = gGameModel.role:getIdler("gold")
end

function slot1.getCostGold(slot0)
	slot1 = nil

	return slot0.cardConvertFlag and (slot0.cardConvertCfg.costItemCard.gold or 0) or (slot0.cardConvertCfg.costItemFrag.gold or 0) * math.max(slot0.sliderNum:read(), 1)
end

function slot1.costGoldUpdate(slot0)
	if slot0:getCostGold() == 0 then
		slot0.costPanel:hide()
	else
		slot0.costPanel:show()
		slot0.costPanel:get("num"):text(slot1)
		text.addEffect(slot0.costPanel:get("num"), {
			color = slot1 <= gGameModel.role:read("gold") and ui.COLORS.QUALITY_OUTLINE[1] or ui.COLORS.NORMAL.ALERT_ORANGE
		})
		adapt.oneLineCenterPos(cc.p(260, 40), {
			slot0.costPanel:get("txt1"),
			slot0.costPanel:get("num"),
			slot0.costPanel:get("icon")
		}, cc.p(8, 0))
	end
end

function slot1.stateChange(slot0)
	slot0:stateUpdate()
	slot0.sliderNum:modify(function (slot0)
		uv4 = "math"

		return true, math.min(slot0, slot4.maxNum)
	end, true)
end

function slot1.stateUpdate(slot0)
	slot0.debrisBtn:texture(slot0.cardConvertFlag and "common/btn/btn_nomal_3.png" or "common/btn/btn_nomal_2.png")
	slot0.spriteBtn:texture(slot0.cardConvertFlag and "common/btn/btn_nomal_2.png" or "common/btn/btn_nomal_3.png")
	slot0.debrisBtn:get("txt1"):visible(slot0.cardConvertFlag)
	slot0.debrisBtn:get("txt2"):visible(not slot0.cardConvertFlag)
	slot0.spriteBtn:get("txt1"):visible(slot0.cardConvertFlag)
	slot0.spriteBtn:get("txt2"):visible(not slot0.cardConvertFlag)
	slot0:costGoldUpdate()

	slot1 = slot0.sliderNum:read()
	slot2 = 1
	slot4 = {}

	if slot0.cardConvertFlag then
		slot0.sliderPanel:hide()

		for slot8, slot9 in csvMapPairs(slot0.cardConvertCfg.costItemCard) do
			if slot8 ~= "gold" then
				slot3 = math.min(math.min(math.floor(slot0.conversionNum / slot0.cardConvertCfg.cardConvertNum), 1), math.floor(dataEasy.getNumByKey(slot8) / slot9))

				table.insert(slot4, {
					key = slot8,
					num = slot9
				})
			end
		end

		if slot0.cardConvertCfg.needCards1[1] then
			slot3 = not slot0.selectedData.selectId and 0 or math.min(slot3, 1)

			table.insert(slot4, 1, {
				type = "card",
				cfg = slot0.cardConvertCfg,
				selectId = slot0.selectedData.selectId
			})
		end
	else
		slot0.sliderPanel:show()

		for slot8, slot9 in csvMapPairs(slot0.cardConvertCfg.costItemFrag) do
			if slot8 ~= "gold" then
				slot3 = math.min(slot3, math.floor(dataEasy.getNumByKey(slot8) / slot9))

				table.insert(slot4, {
					key = slot8,
					num = slot9,
					targetNum = math.max(slot1, 1)
				})
			end
		end

		if slot0.cardConvertCfg.needFrags1[1] then
			slot5 = slot0.cardConvertCfg.needFrags1[3]
			slot3 = not slot0.selectedData.selectId and 0 or math.min(slot3, math.floor(dataEasy.getNumByKey(slot0.selectedData.selectId) / slot5))
			slot0.fragExchangeRate = slot5

			table.insert(slot4, 1, {
				type = "frag",
				cfg = slot0.cardConvertCfg,
				num = slot5,
				selectId = slot0.selectedData.selectId,
				targetNum = slot2
			})
		end
	end

	slot0.maxNum = slot3

	slot0.sliderPanel:get("txt2"):text("/" .. slot3)
	uiEasy.setBtnShader(slot0.sliderSubBtn, false, slot1 >= 1 and 1 or 2)
	uiEasy.setBtnShader(slot0.sliderAddBtn, false, slot1 < slot0.maxNum and 1 or 2)

	if slot1 < 1 or slot0.maxNum <= slot1 then
		slot0:unScheduleAll()
	end

	for slot8 = #slot4, 2, -1 do
		table.insert(slot4, slot8, {})
	end

	slot0.costDatas:update(slot4)

	slot5 = dataEasy.getNumByKey(slot0.data.id)

	uiEasy.setIconName(slot0.data.id, nil, {
		node = slot0.debrisItem:get("name")
	})
	slot0.debrisItem:get("title.num"):text(slot5)
	slot0.debrisItem:get("title.txt2"):text("/" .. slot0.data.num)
	text.addEffect(slot0.debrisItem:get("title.num"), {
		color = slot0.data.num <= slot5 and ui.COLORS.QUALITY_OUTLINE[1] or ui.COLORS.NORMAL.ALERT_ORANGE
	})
	adapt.oneLineCenterPos(cc.p(200, 30), {
		slot0.debrisItem:get("title.txt1"),
		slot0.debrisItem:get("title.num"),
		slot0.debrisItem:get("title.txt2")
	}, cc.p(5, 0))
	bind.extend(slot0, slot0.debrisItem:get("item"), {
		class = "icon_key",
		props = {
			data = {
				key = slot0.data.id,
				num = slot2
			}
		}
	})
end

function slot1.chooseCard(slot0, slot1, slot2, slot3)
	if slot3.type == "card" then
		gGameUI:stackUI("city.card.mega.choose_card", nil, {
			dialog = true
		}, slot0.selectedData, slot0:createHandler("stateChange"))
	elseif slot3.type == "frag" then
		gGameUI:stackUI("city.card.mega.fragment_select", nil, {
			dialog = true
		}, slot0.selectedData, slot0:createHandler("stateChange"))
	else
		gGameUI:stackUI("common.gain_way", nil, {
			dialog = true
		}, slot3.key, nil, slot3.num)
	end
end

function slot1.onIncreaseNum(slot0, slot1)
	slot0.sliderNum:set(cc.clampf(slot0.sliderNum:read() + slot1, slot1 > 0 and 1 or 0, math.max(slot0.maxNum, 1)), true)
end

function slot1.onChangeNum(slot0, slot1, slot2, slot3)
	if slot0.cardConvertFlag then
		return
	end

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

function slot1.spriteBtnFunc(slot0)
	if not slot0.cardConvertFlag then
		slot0.selectedData.selectId = nil
		slot0.cardConvertFlag = true

		slot0.sliderNum:set(0, true)
	end
end

function slot1.debrisBtnFunc(slot0)
	if slot0.cardConvertFlag then
		slot0.selectedData.selectId = nil
		slot0.cardConvertFlag = false

		slot0.sliderNum:set(0, true)
	end
end

function slot1.addNumFunc(slot0)
	if slot0.conversionNumMax <= slot0.conversionNum then
		gGameUI:showTip(gLanguageCsv.megaConvertTimesLimit)

		return
	end

	gGameUI:stackUI("common.buy_number", nil, , {
		id = slot0.data.id,
		itemType = slot0.cardConvertCfg.type
	}, slot0:createHandler("stateChange"))
end

function slot1.conversionFunc(slot0)
	if not slot0.selectedData.selectId then
		gGameUI:showTip(gLanguageCsv.materialsNotEnoughMega)

		return
	end

	slot2 = slot0.sliderNum:read()

	if slot0.cardConvertFlag then
		slot2 = slot0.cardConvertCfg.cardConvertNum
	end

	if slot0.conversionNum - slot2 < 0 then
		gGameUI:showTip(gLanguageCsv.conversionInsufficient)

		return
	end

	if slot0.cardConvertFlag and slot0.maxNum <= 0 then
		gGameUI:showTip(gLanguageCsv.materialsNotEnoughMega)

		return
	end

	if not slot0.cardConvertFlag and slot2 <= 0 then
		gGameUI:showTip(gLanguageCsv.selectConversionNumber)

		return
	end

	if gGameModel.role:read("gold") < slot0:getCostGold() then
		gGameUI:showTip(gLanguageCsv.conversionNotGold)

		return
	end

	slot5, slot6 = nil
	slot7 = {}

	if slot0.cardConvertFlag then
		slot5 = string.format(gLanguageCsv.consumeConversionSprite, csv.cards[gGameModel.cards:find(slot1):read("card_id")].name, slot2, csv.items[slot0.data.id].name)
		slot7 = {
			slot0.data.id,
			slot1
		}
		slot6 = "/game/develop/mega/convert/card"
	else
		slot8 = ""

		if dataEasy.isFragment(slot1) then
			slot8 = csv.fragments[slot1].name
		elseif dataEasy.isZawakeFragment(slot1) then
			slot8 = csv.zawake.zawake_fragments[slot1].name
		end

		slot5 = string.format(gLanguageCsv.consumeConversionFigment, (slot0.fragExchangeRate or 0) * slot2, slot8, slot2, csv.items[slot0.data.id].name)
		slot7 = {
			slot0.data.id,
			slot2,
			slot1
		}
		slot6 = "/game/develop/mega/convert/frag"
	end

	slot10 = dataEasy.getNumByKey(slot0.data.id)

	if slot0.hadMega and not userDefault.getForeverLocalKey("hadMegaTip", {})[slot0.hadMega] then
		userDefault.setForeverLocalKey("hadMegaTip", {
			[slot0.hadMega] = true
		})
		gGameUI:showDialog({
			btnType = 2,
			isRich = true,
			title = gLanguageCsv.spaceTips,
			content = gLanguageCsv.megaConvertHadMega,
			cb = function ()
				slot3 = gLanguageCsv.spaceTips
				uv3 = "gGameUI"

				gGameUI:showDialog({
					btnType = 2,
					isRich = true,
					title = slot3,
					content = slot3,
					cb = function ()
						uv0 = "selectedData"
						slot0.selectedData.selectId = nil
						uv2 = "selectId"
						uv5 = "requestServer"

						gGameApp:requestServer(slot2, function (slot0)
							slot1 = gGameUI
							slot1 = slot1.showGainDisplay
							uv4 = "gGameUI"
							uv5 = "showGainDisplay"

							slot1(slot1, {
								[slot4.data.id] = slot5
							})

							uv1 = "gGameUI"

							slot1:stateChange()
						end, unpack(slot5))
					end
				})
			end
		})
	elseif slot0.cardConvertCfg.type == 2 and slot10 <= slot0.data.num and slot0.data.num < slot10 + slot2 then
		gGameUI:showDialog({
			btnType = 2,
			isRich = true,
			title = gLanguageCsv.spaceTips,
			content = gLanguageCsv.megaConvertExceedLimit,
			cb = slot8
		})
	else
		slot8()
	end
end

function slot1.ruleFunc(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1300
	})
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot3 = "text"
			uv3 = "get"

			slot0:get(slot3):text(slot3.ruleTitle)
		end),
		slot2.noteText(unpack(slot0.ruleContent))
	}
end

return slot1
