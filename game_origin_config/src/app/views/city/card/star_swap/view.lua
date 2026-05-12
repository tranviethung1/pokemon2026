slot0 = require("app.views.city.card.star_swap.tools")
slot2 = class("StarSwapView", cc.load("mvc").ViewBase)
slot3 = {
	{
		name = gLanguageCsv.starAid1,
		unlockKey = gUnlockCsv.cardStarTemporarySwap
	},
	{
		name = gLanguageCsv.starExchange1,
		unlockKey = gUnlockCsv.cardStarSwap
	}
}
slot2.RESOURCE_FILENAME = "star_rating_main.json"
slot2.RESOURCE_BINDING = {
	["leftPanel.item"] = "leftItem",
	["centerPanel.btnLeft.iconLeft"] = "iconLeft",
	["tabPanel.item"] = "tabItem",
	["centerPanel.rightLight"] = "rightLight",
	["centerPanel.btnRight.iconRight"] = "iconRight",
	["centerPanel.starItem"] = "starItem",
	["leftPanel.exchangePanel"] = "exchangeLeftPanel",
	["centerPanel.bottomNoUse"] = "bottomNoUse",
	["leftPanel.exchangePanel.downPanel"] = "exchangeDownPanel",
	centerPanel = "centerPanel",
	["tabPanel.awardPanel"] = "awardPanel",
	["centerPanel.bottom.consumeList"] = "costList",
	["centerPanel.rightBottom"] = "rightBottom",
	["leftPanel.aidPanel"] = "aidLeftPanel",
	["centerPanel.leftLight"] = "leftLight",
	["centerPanel.leftBottom"] = "leftBottom",
	["centerPanel.bottom"] = "centerBottom",
	["leftPanel.exchangePanel.btnDetail1"] = {
		varname = "btnDetail1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickSDetailBtn")
			}
		}
	},
	["leftPanel.exchangePanel.btnDetail2"] = {
		varname = "btnDetail2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickSPlusDetailBtn")
			}
		}
	},
	["leftPanel.aidPanel.list"] = {
		varname = "leftList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("leftListData"),
				item = bindHelper.self("leftItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("selImg"):visible(slot3.isSel)
					slot1:get("clickPanel"):visible(not slot3.isSel)
					slot1:get("bg1"):visible(slot3.isAiding)
					slot1:get("chillDown"):visible(time.getTime() < slot3.chillDown)

					if csvSize(slot3.rarities) == 1 then
						if slot3.rarities[1] == 3 then
							slot1:get("iconPanel.icon2"):hide()
							slot1:get("iconPanel.icon1"):y(slot1:get("iconPanel.icon1"):y() - 40)
						elseif slot3.rarities[1] == 4 then
							slot1:get("iconPanel.icon1"):hide()
							slot1:get("iconPanel.icon2"):y(slot1:get("iconPanel.icon2"):y() + 45)
						end
					end

					slot1:get("lock"):visible(not slot3.vipLevelEnough)

					slot10 = slot3.unlockParam

					slot1:get("vipTip"):visible(not slot3.vipLevelEnough):text(string.format(gLanguageCsv.aConditionsUnlock, uiEasy.getVipStr(slot10).str))

					slot5 = {
						slot1:get("content.leftBg"),
						slot1:get("content.rightBg")
					}
					slot6 = {
						slot1:get("content.leftEmpty"),
						slot1:get("content.rightEmpty")
					}

					for slot10 = 1, 2 do
						slot12 = slot5[slot10]:get("clipping") and slot11:get("logo")

						if itertools.size(slot3.iconData[slot10]) == 0 and slot12 then
							slot12:removeSelf()
						end

						slot14 = slot5[slot10]:size()

						if itertools.size(slot13) > 0 then
							if not slot12 then
								ccui.ImageView:create(dataEasy.getUnitCsv(slot13.id, slot13.skinId).cardIcon):alignCenter(slot14):scale(1.5):addTo(slot11 or cc.ClippingNode:create(cc.Sprite:create("city/card/star_swap/box_xjjh_tx.png"):alignCenter(slot14)):setAlphaThreshold(0.1):size(slot14):alignCenter(slot14):addTo(slot5[slot10], 3, "clipping"), 3, "logo")
							else
								slot12:texture(slot15.cardIcon)
							end

							slot6[slot10]:hide()
							slot5[slot10]:show()
						else
							slot6[slot10]:visible(slot3.chillDown <= slot4)
							slot5[slot10]:hide()
						end
					end

					if not slot3.vipLevelEnough then
						itertools.invoke(slot5, "hide")
						itertools.invoke(slot6, "hide")
					end

					bind.touch(slot0, slot1:get("clickPanel"), {
						methods = {
							ended = functools.partial(slot0.clickItem, slot2, slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				clickItem = bindHelper.self("onChangeItemIndex")
			}
		}
	},
	["tabPanel.list"] = {
		varname = "tabList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabsData"),
				item = bindHelper.self("tabItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = slot1:get("clickText")
					slot7 = slot1:get("normalText")

					slot1:name(slot2 == 1 and "starAidItem" or "starExchangeItem")
					slot1:get("btnClick"):visible(slot3.isSel)
					slot1:get("btnNormal"):visible(not slot3.isSel)
					slot6:visible(slot3.isSel)
					slot7:visible(not slot3.isSel)
					slot6:getVirtualRenderer():setLineSpacing(-10)
					slot7:getVirtualRenderer():setLineSpacing(-10)
					bind.extend(slot0, slot1, {
						class = "red_hint",
						props = {
							state = not slot3.isSel,
							specialTag = slot2 == 1 and "starSwapAid" or "starSwapExchange",
							onNode = function (slot0)
								slot0:xy(140, 260)
							end
						}
					})
					adapt.setAutoText(slot6, slot3.txt, 240)
					adapt.setAutoText(slot7, slot3.txt, 240)
					uiEasy.updateUnlockRes(slot3.unlockKey, slot1, {
						pos = cc.p(120, 240)
					}):anonyOnly(slot0, slot0:getIdx(slot2))
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onChangePage")
			}
		}
	},
	["centerPanel.btnLeft"] = {
		varname = "leftBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClockLeftBtn")
			}
		}
	},
	["centerPanel.btnRight"] = {
		varname = "rightBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClockRightBtn")
			}
		}
	},
	["centerPanel.leftStarList"] = {
		varname = "leftStarList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("starLeftDatas"),
				item = bindHelper.self("starItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("img"):texture(slot3.icon)
				end
			}
		}
	},
	["centerPanel.rightStarList"] = {
		varname = "rightStarList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("starRightDatas"),
				item = bindHelper.self("starItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("img"):texture(slot3.icon)
				end
			}
		}
	},
	["centerPanel.btnConfirm"] = {
		varname = "btnConfirm",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickConfirm")
			}
		}
	},
	["centerPanel.bottom.consumeLabel"] = {
		varname = "consumeLabel",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(66, 61, 66, 255)
				}
			}
		}
	},
	["centerPanel.btnConfirm.text"] = {
		varname = "textConfirm",
		binds = {
			{
				event = "text",
				idler = bindHelper.self("confirmText")
			},
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			}
		}
	},
	["centerPanel.chillDown"] = {
		varname = "chillDown",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(57, 93, 94, 255)
				}
			}
		}
	},
	["centerPanel.leftBottom.leftName"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(66, 61, 66, 255)
				}
			}
		}
	},
	["centerPanel.leftBottom.leftLevel"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(66, 61, 66, 255)
				}
			}
		}
	},
	["centerPanel.rightBottom.rightName"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(66, 61, 66, 255)
				}
			}
		}
	},
	["centerPanel.rightBottom.rightLevel"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(66, 61, 66, 255)
				}
			}
		}
	},
	["leftPanel.btnHelp"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickRule")
			}
		}
	},
	["leftPanel.btnHelp.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(91, 84, 91, 255)
				}
			}
		}
	},
	["tabPanel.awardPanel.icon"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReceive")
			}
		}
	},
	["tabPanel.awardPanel.receiveText"] = {
		varname = "receiveText",
		binds = {
			{
				event = "text",
				idler = bindHelper.self("receiveCount")
			},
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c4b(91, 84, 91, 255)
					}
				}
			}
		}
	},
	["tabPanel.awardPanel.receiveTip"] = {
		varname = "receiveTip",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(91, 84, 91, 255)
				}
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot6 = {
		onClose = slot7
	}
	slot7 = slot0:createHandler("onClose")

	gGameUI.topuiManager:createView("default", slot0, slot6):init({
		subTitle = "POKEMON STAR",
		title = gLanguageCsv.starTitle
	})
	slot0:initModel()
	slot0:enableSchedule()

	slot0.leftListData = idlers.newWithMap({})
	slot2 = {}

	for slot6, slot7 in orderCsvPairs(csv.card_star_swap_field) do
		table.insert(slot2, {
			isAiding = false,
			chillDown = 0,
			vipLevelEnough = false,
			isSel = false,
			filedId = slot7.id,
			rarities = slot7.rarities,
			unlockType = slot7.unlockType,
			unlockParam = slot7.unlockParam,
			iconData = {}
		})
	end

	slot0.leftListData:update(slot2)

	slot0.selectAidData = idlertable.new({})
	slot0.selectExchangeData = idlertable.new({})
	slot0.starLeftDatas = idlertable.new({})
	slot0.starRightDatas = idlertable.new({})
	slot0.confirmText = idler.new("")
	slot0.pageIdx = idler.new(slot1 or 1)
	slot0.aidItemIdx = idler.new(1)
	slot0.receiveCount = idler.new(0)
	slot0.tabsData = idlers.newWithMap({})
	slot3 = {
		[slot7] = {
			isSel = false,
			txt = slot8.name,
			unlockKey = slot8.unlockKey
		}
	}
	uv5 = "gGameUI"

	for slot7, slot8 in ipairs(slot5) do
		-- Nothing
	end

	if not dataEasy.isShow(gUnlockCsv.cardStarSwap) then
		table.remove(slot3, 2)
	end

	slot0.tabsData:update(slot3)
	idlereasy.when(slot0.vipLevel, function (slot0, slot1)
		uv2 = "leftListData"

		for slot5, slot6 in slot2.leftListData:ipairs() do
			slot7.vipLevelEnough = slot6:proxy().unlockType == 1 and slot7.unlockParam <= slot1 or false
		end
	end)
	idlereasy.when(slot0.fieldSeat, function (slot0, slot1)
		uv3 = "table"
		slot4 = true
		slot2 = table.deepcopy(slot3.selectAidData:read(), slot4)
		uv4 = "table"

		for slot6 = 1, slot4.leftListData:size() do
			slot2[slot6] = slot2[slot6] or {}

			if slot1[slot6] and itertools.size(slot1[slot6].cards) > 0 and slot1[slot6].cards[1] ~= 0 then
				uv7 = "table"
				slot7.leftListData:atproxy(slot6).isAiding = true

				for slot10, slot11 in ipairs(slot1[slot6].cards) do
					uv13 = "deepcopy"
					slot2[slot6][slot10] = slot13.getAidCardData(slot11)
				end
			else
				uv7 = "table"
				slot7 = slot7.leftListData:atproxy(slot6)
				slot7.isAiding = false
				uv7 = "table"
				slot7.leftListData:atproxy(slot6).iconData = {}
				slot2[slot6] = {}
			end

			if slot1[slot6] and slot1[slot6].cd and slot1[slot6].cd > 0 then
				uv7 = "table"
				slot7.leftListData:atproxy(slot6).chillDown = slot1[slot6].cd
			end
		end

		uv3 = "table"

		slot3.selectAidData:set(slot2, true)
	end)
	slot0.pageIdx:addListener(function (slot0, slot1)
		uv2 = "tabsData"
		slot2 = slot2.tabsData:atproxy(slot1)
		slot2.isSel = false
		uv2 = "tabsData"
		slot2.tabsData:atproxy(slot0).isSel = true
	end)
	slot0.aidItemIdx:addListener(function (slot0, slot1)
		uv2 = "leftListData"
		slot2 = slot2.leftListData:atproxy(slot1)
		slot2.isSel = false
		uv2 = "leftListData"
		slot2.leftListData:atproxy(slot0).isSel = true
	end)
	idlereasy.any({
		slot0.pageIdx,
		slot0.aidItemIdx
	}, function (slot0, slot1, slot2)
		if slot1 == 1 then
			uv3 = "refreshCenterUI"
			uv5 = "refreshCenterUI"

			slot3:refreshCenterUI(slot5.selectAidData:read()[slot2])
			gGameModel.currday_dispatch:getIdlerOrigin("starAidDailyClick"):set(true)
		else
			uv3 = "refreshCenterUI"
			slot3 = slot3.refreshCenterUI
			uv5 = "refreshCenterUI"

			slot3(slot3, slot5.selectExchangeData:read())

			uv3 = "refreshCenterUI"

			if slot3.receiveCount:read() > 0 and not gGameUI.guideManager:isInGuiding() then
				uv3 = "refreshCenterUI"

				slot3:popReceiveView()
			end

			gGameModel.currday_dispatch:getIdlerOrigin("starExchangeDailyClick"):set(true)
		end

		uv3 = "refreshCenterUI"
		slot3 = slot3.exchangeLeftPanel
		slot3 = slot3.visible

		slot3(slot3, slot1 == 2)

		uv3 = "refreshCenterUI"

		slot3.aidLeftPanel:visible(slot1 == 1)
	end)
	idlereasy.when(slot0.selectAidData, function (slot0, slot1)
		uv3 = "leftListData"

		for slot5 = 1, slot3.leftListData:size() do
			uv6 = "leftListData"
			slot6.leftListData:atproxy(slot5).iconData = slot1[slot5] or {}
		end

		uv2 = "leftListData"

		if slot2.pageIdx:read() == 1 then
			uv2 = "leftListData"
			uv4 = "leftListData"

			slot2:refreshCenterUI(slot1[slot4.aidItemIdx:read()])
		end
	end)
	idlereasy.when(slot0.selectExchangeData, function (slot0, slot1)
		uv2 = "pageIdx"

		if slot2.pageIdx:read() == 2 then
			uv2 = "pageIdx"

			slot2:refreshCenterUI(slot1)
		end
	end)
	idlereasy.any({
		slot0.rmb,
		slot0.gold,
		slot0.items
	}, function ()
		uv0 = "selectType"

		if slot0.selectType then
			uv0 = "selectType"

			if slot0.selectRarity then
				uv0 = "selectType"
				uv2 = "selectType"
				uv3 = "selectType"
				uv4 = "selectType"

				slot0:updateCostList(slot2.selectType, slot3.selectRarity, slot4.maxStar)
			end
		end

		uv0 = "selectType"

		slot0.selectExchangeData:notify()
	end)
	idlereasy.when(slot0.deliverRecord, function (slot0, slot1)
		uv2 = "getReceiveCount"
		slot3 = slot1
		uv3 = "receiveCount"
		slot3 = slot3.receiveCount
		slot4 = slot3
		slot5 = slot2.getReceiveCount(slot3)

		slot3.set(slot4, slot5)

		uv4 = "receiveCount"
		uv5 = "receiveCount"

		adapt.oneLinePos(slot4.receiveTip, slot5.receiveText, cc.p(10, 0))
	end)
	slot0.costList:setScrollBarEnabled(false)
	slot0.exchangeLeftPanel:get("tipText"):text(gLanguageCsv.starExchangeTimes)
	slot0.exchangeLeftPanel:get("name"):text(gLanguageCsv.starConfigTimes)
	slot0.exchangeLeftPanel:get("resume"):text(gLanguageCsv.starSConfigTimes2)
	slot0.exchangeLeftPanel:get("name1"):text(gLanguageCsv.starConfigTimes)
	slot0.exchangeLeftPanel:get("resumeCount"):text("/" .. string.format(gLanguageCsv.starSConfigTimes1, gCommonConfigCsv.cardStarSwapRaritySTimesLimit))
	widget.addAnimationByKey(slot0.centerPanel, "starswap/xingjizhuanyi.skel", "centerSpine", "effect_loop", 100):scale(2):anchorPoint(cc.p(0.5, 0.5)):xy(772, 1022)

	if gGameUI.guideManager:checkFinished(292) then
		function ()
			gGameUI.guideManager:checkGuide({
				specialName = "starSwap1",
				endCb = function ()
					uv0 = "receiveCount"

					if slot0.receiveCount:read() > 0 then
						uv0 = "receiveCount"

						slot0:popReceiveView()
					end
				end
			})
		end()
	else
		gGameUI.guideManager:checkGuide({
			specialName = "starSwap",
			endCb = function ()
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
	end
end

function slot2.initModel(slot0)
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.fieldSeat = gGameModel.role:getIdler("card_star_swap_fields")
	slot0.deliverRecord = gGameModel.role:getIdler("card_star_swap_times_deliver_record")
	slot0.exchangeTimeCd = gGameModel.role:getIdler("card_star_swap_times_cd")
	slot0.preExchangeNum = gGameModel.role:getIdler("card_star_swap_times")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.items = gGameModel.role:getIdler("items")
end

function slot2.refreshCenterUI(slot0, slot1)
	slot3 = slot0.pageIdx:read()

	if itertools.size(slot1) == 0 then
		slot0.centerBottom:hide()
		slot0.bottomNoUse:hide()
	else
		slot4 = nil

		for slot9, slot10 in pairs(slot1) do
			slot4 = slot10.rarity
			slot5 = math.max(0, slot10.star)
		end

		slot0:updateCostList(slot3, slot4, slot5)
	end

	itertools.invoke({
		slot0.leftLight,
		slot0.rightLight,
		slot0.btnConfirm
	}, "hide")
	uiEasy.setBtnShader(slot0.leftBtn, nil, 1)
	uiEasy.setBtnShader(slot0.rightBtn, nil, 1)
	slot0:addOrDelStarEffect(slot1[1] and slot1[1].star, slot1[2] and slot1[2].star, slot3 == 1 and slot0.leftListData:atproxy(slot0.aidItemIdx:read()).isAiding)

	if slot3 == 1 then
		slot0:refreshTempSwapUI(slot1)
	else
		slot0:refreshForeverSwapUI(slot1)
	end

	for slot7 = 1, 2 do
		if itertools.size(slot1 and slot1[slot7]) > 0 then
			slot10 = gGameModel.cards:find(slot8.dbid):read("card_id", "skin_id", "star", "advance", "equips", "level", "name")
			slot11 = dataEasy.getUnitCsv(slot10.card_id, slot10.skin_id)
			slot12 = {
				slot0.leftBtn,
				slot0.rightBtn
			}

			({
				slot0.iconLeft,
				slot0.iconRight
			})[slot7]:hide()
			({
				slot0.leftBottom,
				slot0.rightBottom
			})[slot7]:show()

			slot15 = slot12[slot7]:x()
			slot16 = slot12[slot7]:y() - 230
			slot17 = "leftAnim"

			if slot7 == 1 then
				slot20 = "leftAnim"

				slot0.centerPanel:removeChildByName(slot20)

				uv20 = "itertools"

				slot0.starLeftDatas:set(slot20.getStarData(slot10.star))
			else
				uv20 = "itertools"

				slot0.starRightDatas:set(slot20.getStarData(slot10.star))
				slot0.centerPanel:removeChildByName("rightAnim")

				slot17 = "rightAnim"
			end

			widget.addAnimation(slot0.centerPanel, slot11.unitRes, "standby_loop", 1):xy(slot15, slot16):scale(slot11.scaleU * 2):name(slot17):setSkin(slot11.skin)
			slot0:updateBottom({
				name = slot10.name,
				cardId = slot10.card_id,
				skinId = slot10.skin_id,
				advance = slot10.advance,
				level = slot10.level,
				index = slot7
			})
		else
			slot0:clearCenter(slot7)
		end
	end
end

function slot2.refreshTempSwapUI(slot0, slot1)
	slot0.awardPanel:hide()

	slot3 = time.getTime()

	if slot0.leftListData:atproxy(slot0.aidItemIdx:read()).isAiding then
		slot0.confirmText:set(gLanguageCsv.starStopAid)
		slot0.leftLight:show()
		slot0.rightLight:show()
	else
		slot0.confirmText:set(string.format(gLanguageCsv.starAid, " "))
	end

	if slot3 < slot4.chillDown then
		slot7 = ""

		slot0:unSchedule("SwapView")

		if 86400 < math.min(csv.card_star_swap_field[slot2].chillDown * 3600, math.ceil(slot4.chillDown - slot3)) then
			slot0.chillDown:text(string.format(gLanguageCsv.starAidCd, math.ceil(slot5 / slot6)))
		else
			slot8 = time.getTime() + slot5

			slot0:schedule(function ()
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
			end, 1, 0, "SwapView")
		end

		slot0.chillDown:show()
	else
		if itertools.size(slot1) == 2 then
			slot0.btnConfirm:show()
		end

		slot0.chillDown:hide()
	end

	if slot4.isAiding or slot3 < slot4.chillDown then
		itertools.invoke({
			slot0.iconLeft,
			slot0.iconRight,
			slot0.leftBtn,
			slot0.rightBtn
		}, "hide")
	else
		itertools.invoke({
			slot0.iconLeft,
			slot0.iconRight,
			slot0.leftBtn,
			slot0.rightBtn
		}, "show")
	end
end

function slot2.refreshForeverSwapUI(slot0, slot1)
	slot0.awardPanel:show()
	itertools.invoke({
		slot0.chillDown,
		slot0.exchangeLeftPanel:get("noUseNum1"),
		slot0.exchangeLeftPanel:get("noUseNum2"),
		slot0.btnDetail1,
		slot0.btnDetail2
	}, "hide")

	slot4 = 3
	slot5 = time.getTime()
	uv7 = "awardPanel"
	uv8 = "awardPanel"
	uv9 = "awardPanel"
	slot8 = dataEasy.getNumByKey(slot9.SNOUSEPROPKEY)
	uv10 = "awardPanel"
	slot10 = dataEasy.getNumByKey(slot7.SPROPKEY) + dataEasy.getNumByKey(slot8.SPLUSPROPKEY) + slot8 + dataEasy.getNumByKey(slot10.SPLUSNOUSEPROPKEY)
	slot13 = slot0.exchangeLeftPanel:get("resumeCount"):x()

	slot0.exchangeLeftPanel:get("number"):x(slot13)
	slot0.exchangeLeftPanel:get("number2"):x(slot13)

	if slot8 > 0 then
		slot2:text(slot8 + slot6):show()
		slot0.btnDetail1:show()
		slot11:text("/" .. gCommonConfigCsv.starSwapSMax)
		adapt.oneLinePos(slot0.btnDetail1, slot11, cc.p(5, 0), "right")
		adapt.oneLinePos(slot11, slot2, cc.p(0, 0), "right")
	else
		slot11:text(slot6 .. "/" .. gCommonConfigCsv.starSwapSMax)
	end

	if slot9 > 0 then
		slot3:text(slot9 + slot7):show()
		slot0.btnDetail2:show()
		slot12:text("/" .. gCommonConfigCsv.starSwapSPlusMax)
		adapt.oneLinePos(slot0.btnDetail2, slot12, cc.p(5, 0), "right")
		adapt.oneLinePos(slot12, slot3, cc.p(0, 0), "right")
	else
		slot12:text(slot7 .. "/" .. gCommonConfigCsv.starSwapSPlusMax)
	end

	if not slot0.preExchangeNum:read()[slot4] then
		slot0.exchangeLeftPanel:get("resumeNum"):setTextColor(cc.c4b(91, 84, 91, 255)):text(gCommonConfigCsv.cardStarSwapRaritySDefaultTimes)

		slot10 = slot10 + gCommonConfigCsv.cardStarSwapRaritySDefaultTimes

		slot0.exchangeDownPanel:hide()
	else
		slot18 = slot15[slot4] + math.floor(math.max(0, slot5 - slot0.exchangeTimeCd:read()[slot4]) / (gCommonConfigCsv.cardStarSwapRaritySTimesCD * 3600))

		slot14:text(slot18)

		slot10 = slot10 + slot18

		if slot18 == 0 then
			slot14:setTextColor(cc.c4b(247, 107, 69, 255))
		else
			slot14:setTextColor(cc.c4b(91, 84, 91, 255))
		end

		if gCommonConfigCsv.cardStarSwapRaritySTimesLimit <= slot18 then
			slot0.exchangeDownPanel:hide()
		else
			slot0.exchangeDownPanel:show()

			slot20 = ""

			if 86400 < math.min(gCommonConfigCsv.cardStarSwapRaritySTimesCD * 3600, math.ceil(slot16[slot4] + gCommonConfigCsv.cardStarSwapRaritySTimesCD * 3600 * (slot17 + 1) - slot5)) then
				slot0.exchangeDownPanel:get("time"):text(string.format(gLanguageCsv.day, math.ceil(slot19 / slot21)))
				adapt.oneLinePos(slot0.exchangeDownPanel:get("rightBrace"), {
					slot0.exchangeDownPanel:get("time"),
					slot0.exchangeDownPanel:get("icon"),
					slot0.exchangeDownPanel:get("leftBrace")
				}, cc.p(5, 0), "right")
			else
				slot0:unSchedule("exchangeView")

				slot23 = time.getTime() + slot19

				slot0:schedule(function ()
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
				end, 1, 0, "exchangeView")
			end
		end
	end

	adapt.oneLinePos(slot0.exchangeLeftPanel:get("resumeCount"), slot14, cc.p(5, 0), "right")
	itertools.invoke({
		slot0.iconLeft,
		slot0.iconRight,
		slot0.leftBtn,
		slot0.rightBtn
	}, "show")

	slot0.allCount = slot10

	if slot10 <= 0 then
		uiEasy.setBtnShader(slot0.leftBtn, nil, 3)
		uiEasy.setBtnShader(slot0.rightBtn, nil, 3)
	elseif itertools.size(slot1) == 2 then
		slot0.btnConfirm:show()
	end

	slot0.confirmText:set(string.format(gLanguageCsv.starExchange, " "))
end

function slot2.addOrDelStarEffect(slot0, slot1, slot2, slot3)
	slot4 = {
		slot0.centerPanel:get("leftStarPanel"),
		slot0.centerPanel:get("rightStarPanel")
	}

	if not slot3 or not slot1 or not slot2 then
		for slot8 = 1, 2 do
			slot4[slot8]:removeAllChildren()
		end

		return
	end

	for slot8, slot9 in ipairs({
		slot1,
		slot2
	}) do
		slot4[slot8]:removeAllChildren()

		for slot16 = 1, slot9 > 6 and 6 or slot9 do
			slot4[slot8]:z(10)
			widget.addAnimationByKey(slot4[slot8], "starswap/xingji.skel", "effctStar" .. slot16, "effect_loop", 0):xy(32 + 66 * (slot16 - 1), 35):scale(1.8):setCascadeOpacityEnabled(true):opacity(60)
		end
	end
end

function slot2.updateBottom(slot0, slot1)
	slot4 = {
		{
			name = slot0.leftBottom:get("leftName"),
			level = slot0.leftBottom:get("leftLevel"),
			icon = slot0.leftBottom:get("leftIcon")
		},
		{
			name = slot0.rightBottom:get("rightName"),
			level = slot0.rightBottom:get("rightLevel"),
			icon = slot0.rightBottom:get("rightIcon")
		}
	}
	slot5 = slot1.index

	slot4[slot5].icon:show():texture(ui.RARITY_ICON[dataEasy.getUnitCsv(slot1.cardId, slot1.skinId).rarity])
	uiEasy.setIconName("card", slot1.cardId, {
		noColor = true,
		space = true,
		node = slot4[slot5].name,
		name = slot1.name,
		advance = slot1.advance
	})
	slot4[slot5].name:show()
	slot4[slot5].level:show():text(string.format(gLanguageCsv.starLevel, slot1.level))
	adapt.oneLinePos(slot4[slot5].level, slot4[slot5].icon, cc.p(24, 0))
end

function slot2.clearCenter(slot0, slot1)
	if slot1 == 1 then
		slot0.starLeftDatas:set({})
		slot0.centerPanel:removeChildByName("leftAnim")
		slot0.leftBottom:hide()
	else
		slot0.starRightDatas:set({})
		slot0.centerPanel:removeChildByName("rightAnim")
		slot0.rightBottom:hide()
	end
end

function slot2.onClickRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1200
	})
end

function slot2.getRuleContext(slot0, slot1)
	slot3 = {
		adaptContext.noteText(129201, 129228)
	}

	if dataEasy.isUnlock(gUnlockCsv.cardStarSwap) then
		table.insert(slot3, slot2.noteText(129229, 129250))
	end

	return slot3
end

function slot2.onReceive(slot0)
	if slot0.receiveCount:read() <= 0 then
		gGameUI:showTip(gLanguageCsv.starNotReceive)

		return
	end

	slot0:popReceiveView()
end

function slot2.popReceiveView(slot0)
	gGameUI:stackUI("city.card.star_swap.receive_box", nil, , {
		count = slot0.receiveCount
	})
end

function slot2.onSetDbId(slot0, slot1, slot2, slot3)
	if not slot3 then
		return
	end

	slot2 = slot2 == 0 and 2 or 1
	slot5 = table.deepcopy(slot0.selectExchangeData:read(), true)

	for slot9, slot10 in pairs(table.deepcopy(slot0.selectAidData:read(), true)) do
		for slot14, slot15 in pairs(slot10) do
			if slot15 and slot3.dbid == slot15.dbid then
				slot4[slot9][slot14] = nil
			end
		end
	end

	for slot9, slot10 in pairs(slot5) do
		if slot10 and slot3.dbid == slot10.dbid then
			slot5[slot9] = nil
		end
	end

	if slot0.pageIdx:read() == 1 then
		slot6 = slot4[slot1] or {}
		slot6[slot2] = slot3
		slot4[slot1] = slot6
	else
		slot5[slot2] = slot3
	end

	slot0.selectAidData:set(slot4, true)
	slot0.selectExchangeData:set(slot5, true)
end

function slot2.onClockLeftBtn(slot0)
	slot0:onAddCard(1)
end

function slot2.onClockRightBtn(slot0)
	slot0:onAddCard(0)
end

function slot2.onAddCard(slot0, slot1)
	if slot0.pageIdx:read() == 2 and slot0.allCount and slot0.allCount <= 0 then
		gGameUI:showTip(gLanguageCsv.noChangeCount)

		return
	end

	slot2 = {
		[slot8] = slot4[slot8] and slot4[slot8].dbid
	}
	slot4 = slot0.pageIdx:read() == 1 and slot0.selectAidData:read()[slot0.aidItemIdx:read()] or slot0.selectExchangeData:read()

	for slot8 = 1, 2 do
	end

	gGameUI:stackUI("city.card.star_swap.choose_card", nil, , {
		from = slot0.pageIdx:read(),
		selDbIds = slot2,
		curSelDbId = slot2[slot1 + 1],
		seatRarity = slot0.leftListData:atproxy(slot3).rarities,
		handlers = slot0:createHandler("onSetDbId", slot3, slot1)
	})
end

function slot2.onExchangeSuccess(slot0)
	slot0.selectExchangeData:set({}, true)
end

function slot2.isShowNoUsebottom(slot0)
	if slot0.pageIdx:read() == 2 then
		if slot0.selectRarity == 3 then
			uv2 = "pageIdx"

			if dataEasy.getNumByKey(slot2.SNOUSEPROPKEY) <= 0 and slot0.selectRarity == 4 then
				uv2 = "pageIdx"

				if dataEasy.getNumByKey(slot2.SPLUSNOUSEPROPKEY) > 0 then
					return true
				end
			end
		end
	end

	return false
end

function slot2.updateCostList(slot0, slot1, slot2, slot3)
	slot0.selectType = slot1
	slot0.selectRarity = slot2
	slot0.maxStar = slot3
	uv4 = "selectType"
	slot4 = slot4.getCostList(slot1, slot2, slot3)
	slot6 = slot0.pageIdx:read() == 1 and slot0.leftListData:atproxy(slot0.aidItemIdx:read()).isAiding
	slot7 = nil

	if slot1 == 1 then
		slot7 = slot0.selectAidData:read()[slot5]
	elseif slot1 == 2 then
		slot7 = slot0.selectExchangeData:read()
	end

	if itertools.size(slot4) == 0 or slot6 or itertools.size(slot7) <= 0 then
		slot0.centerBottom:hide()
		slot0.bottomNoUse:hide()

		return
	end

	uiEasy.createItemsToList(slot0, slot0.costList, slot4, {
		scale = 0.85,
		onAfterBuild = function ()
			uv0 = "costList"

			slot0.costList:setItemAlignCenter()
		end
	})
	slot0.bottomNoUse:visible(slot0:isShowNoUsebottom())
	slot0.centerBottom:show()
end

function slot2.onChangePage(slot0, slot1, slot2, slot3)
	if not dataEasy.isUnlock(slot3.unlockKey) then
		gGameUI:showTip(dataEasy.getUnlockTip(slot3.unlockKey))

		return
	end

	if slot2 == slot0.pageIdx:read() then
		return
	end

	slot0.pageIdx:set(slot2)
end

function slot2.onChangeItemIndex(slot0, slot1, slot2, slot3)
	if not slot3.vipLevelEnough then
		gGameUI:showTip(string.format(gLanguageCsv.starVipLock, uiEasy.getVipStr(slot3.unlockParam).str))

		return
	end

	slot0.aidItemIdx:set(slot2)
end

function slot2.onClickSDetailBtn(slot0)
	uv6 = "gGameUI"
	slot1 = gGameUI:stackUI("city.card.star_swap.star_swap_detail", nil, {
		clickClose = true
	}, slot6.SNOUSEPROPKEY)
	slot2 = slot0.btnDetail1:parent():convertToWorldSpace(cc.p(slot0.btnDetail1:xy()))

	slot1.sevenPanel:xy(slot2.x + 280, slot2.y - slot1.bg:height() / 2 + 45)
end

function slot2.onClickSPlusDetailBtn(slot0)
	uv6 = "gGameUI"
	slot1 = gGameUI:stackUI("city.card.star_swap.star_swap_detail", nil, {
		clickClose = true
	}, slot6.SPLUSNOUSEPROPKEY)
	slot2 = slot0.btnDetail2:parent():convertToWorldSpace(cc.p(slot0.btnDetail2:xy()))

	slot1.sevenPanel:xy(slot2.x + 280, slot2.y - slot1.bg:height() / 2 + 45)
end

function slot2.onClickConfirm(slot0)
	if slot0.pageIdx:read() == 1 then
		slot1 = slot0.aidItemIdx:read()
		slot2 = slot0.selectAidData:read()[slot1]

		if slot0.leftListData:atproxy(slot1).isAiding then
			slot4 = gGameModel.cards:find(slot2[1].dbid):read("advance", "name", "card_id")
			slot7 = gGameModel.cards:find(slot2[2].dbid):read("advance", "name", "card_id")

			gGameUI:showDialog({
				isRich = true,
				btnType = 2,
				cb = function ()
					uv4 = "gGameApp"
					uv5 = "requestServer"
					uv6 = "requestServer"

					gGameApp:requestServer("/game/card/star/swap", function (slot0)
						gGameUI:showTip(gLanguageCsv.starStopAid1)
					end, slot4, slot5[1].dbid, slot6[2].dbid, "off")
				end,
				content = string.format(gLanguageCsv.starStopAid2, string.format(gLanguageCsv.hour, csv.card_star_swap_field[slot0.aidItemIdx:read()].chillDown), uiEasy.setIconName("card", slot4.card_id, {
					noColor = true,
					space = true,
					name = slot4.name,
					advance = slot4.advance
				}), uiEasy.setIconName("card", slot7.card_id, {
					noColor = true,
					space = true,
					name = slot7.name,
					advance = slot7.advance
				})),
				dialogParams = {
					clickClose = false
				}
			})

			return
		end

		gGameUI:stackUI("city.card.star_swap.preview", nil, , {
			leftDbId = slot2[1].dbid,
			rightDbId = slot2[2].dbid,
			type = slot0.pageIdx:read(),
			onShowCost = slot0:createHandler("onShowCost"),
			onShowAidSuccessAnim = slot0:createHandler("onShowAidSuccessAnim"),
			seatId = slot1
		})
	else
		slot1 = slot0.selectExchangeData:read()

		gGameUI:stackUI("city.card.star_swap.preview", nil, , {
			leftDbId = slot1[1].dbid,
			rightDbId = slot1[2].dbid,
			type = slot0.pageIdx:read(),
			onShowCost = slot0:createHandler("onShowCost"),
			onExchangeSuccess = slot0:createHandler("onExchangeSuccess")
		})
	end

	slot0.centerBottom:hide()
	slot0.bottomNoUse:hide()
	slot0.btnConfirm:hide()
end

function slot2.onShowCost(slot0)
	slot1 = slot0.aidItemIdx:read()
	slot4 = nil

	if itertools.size((slot2 ~= 2 or slot0.selectExchangeData:read()) and slot0.selectAidData:read()[slot1]) <= 0 or slot0.pageIdx:read() == 1 and slot0.leftListData:atproxy(slot1).isAiding then
		return
	end

	slot0.btnConfirm:show()
	slot0.bottomNoUse:visible(slot0:isShowNoUsebottom())
	slot0.centerBottom:show()
end

function slot2.onShowAidSuccessAnim(slot0)
	slot1 = slot0.centerPanel:get("centerSpine")

	slot1:play("effect")
	gGameUI:disableTouchDispatch(nil, false)
	slot1:setSpriteEventHandler(function (slot0, slot1)
		if slot1.animation == "effect" then
			uv2 = "animation"

			slot2:addPlay("effect_loop")
			gGameUI:disableTouchDispatch(nil, true)
		end
	end, sp.EventType.ANIMATION_COMPLETE)
end

return slot2
