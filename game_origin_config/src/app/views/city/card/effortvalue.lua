slot0 = {
	ONE_AND_TEN = 1,
	ONE = 2,
	SAVE_AND_CANCEL = 3,
	SAVE = 4
}
slot1 = {
	ONE = 1,
	TEN = 2
}

function slot2(slot0, slot1)
	slot2 = slot1:multiget("icon1", "txtAdvance", "icon2", "txtTip")

	text.addEffect(slot2.txtAdvance, {
		outline = {
			color = cc.c4b(254, 94, 60, 255)
		}
	})
	slot2.txtAdvance:text(dataEasy.getRomanNumeral(slot0))
	adapt.oneLineCenterPos(cc.p(slot2.txtTip:x(), slot2.txtAdvance:y()), {
		slot2.icon1,
		slot2.txtAdvance,
		slot2.icon2
	}, cc.p(15, 0))
end

slot3 = class("CardEffortValueView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "card_effortvalue.json"
slot3.RESOURCE_BINDING = {
	["panel.textAdvanceNote"] = "textAdvanceNote",
	itemAttr = "itemAttr",
	selectPanel = "selectPanel",
	["panel.advancePanel"] = "advancePanel",
	panel = "panel",
	["panel.rightPanel"] = "rightPanel",
	["panel.textAdvance"] = "textAdvance",
	["panel.imgEffortExtra"] = "imgEffortExtra",
	["panel.icon"] = "icon",
	["panel.leftPanel"] = "leftPanel",
	["panel.leftPanel.topPanel"] = "leftTopPanel",
	item = "item",
	["panel.num"] = "num",
	["panel.rightPanel.topPanel"] = "rightTopPanel",
	itemTxt = "itemTxt",
	["panel.advanceMaxPanel"] = "advanceMaxPanel",
	["panel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 30,
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("name", "icon", "num", "changeNum", "bar", "imgMax", "barBg", "currentNum")
					slot5, slot6 = dataEasy.getEffortValueAttrData(slot3.cfg.attrType)

					slot4.name:text(slot5 .. ":")
					slot4.icon:texture(slot6)
					slot4.currentNum:text(slot3.extraVal and slot3.currVal + slot3.extraVal or slot3.currVal)

					if cc.clampf(slot3.currVal - slot3.totalVal, 0, slot3.maxVal) then
						slot4.num:text(math.floor(slot8) .. "/" .. slot7)
						text.addEffect(slot4.num, {
							outline = {
								color = ui.COLORS.OUTLINE.DEFAULT
							}
						})

						if not slot4.bar.myIdler then
							slot4.bar.myIdler = idler.new(math.min(slot8 / slot7 * 100, 100))

							bind.extend(slot0, slot4.bar, {
								event = "extend",
								class = "loadingbar",
								props = {
									maskImg = "city/card/effort_value/bar_red.png",
									data = slot4.bar.myIdler
								}
							})
						else
							slot4.bar.myIdler:set(slot9)
						end
					end

					if cc.clampf(slot3.changeNum or 0, -slot8, slot3.maxVal - slot8) == -0 then
						slot9 = 0
					end

					slot4.imgMax:visible(slot3.maxVal <= slot9 + slot8 and slot3.changeNum ~= nil)

					if slot3.changeNum then
						slot4.changeNum:show()
						slot4.changeNum:text((slot9 >= 0 and "+" or "") .. slot9)
						adapt.oneLinePos(slot4.currentNum, slot4.changeNum, cc.p(15, 0))

						if slot9 <= 0 then
							text.addEffect(slot4.changeNum, {
								color = ui.COLORS.NORMAL.ALERT_ORANGE
							})
						elseif slot9 > 0 then
							text.addEffect(slot4.changeNum, {
								color = ui.COLORS.NORMAL.FRIEND_GREEN
							})
						end

						widget.addAnimationByKey(slot4.bar, "effect/nuizhifankui.skel", "nuizhifankui", "effect", 10):anchorPoint(cc.p(0.5, 0.5)):xy(slot4.barBg:width() / 2, slot4.barBg:height() / 2 + 1):play("effect")
					else
						slot4.changeNum:hide()
					end
				end
			}
		}
	},
	["selectPanel.btnAttr"] = {
		varname = "btnAttr",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onBtnAttr()
				end)
			}
		}
	},
	["selectPanel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 15,
				data = bindHelper.self("selectDatas"),
				item = bindHelper.self("itemAttr"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("list", "selected", "bg")
					slot5 = {}

					for slot9, slot10 in pairs(slot3) do
						if slot9 ~= "selected" then
							table.insert(slot5, {
								key = slot9,
								num = slot10
							})
						end
					end

					slot4.bg:texture(slot2 % 2 == 1 and "common/box/box_t.png" or "common/box/box_t1.png")
					bind.extend(slot0, slot4.list, {
						event = "extend",
						class = "listview",
						props = {
							data = slot5,
							item = bindHelper.parent("itemTxt"),
							dataOrderCmp = function (slot0, slot1)
								return game.ATTRDEF_SIMPLE_ENUM_TABLE[slot0.key] < game.ATTRDEF_SIMPLE_ENUM_TABLE[slot1.key]
							end,
							onItem = function (slot0, slot1, slot2, slot3)
								slot4 = slot1:multiget("name", "num")
								slot5, slot6 = dataEasy.getEffortValueAttrData(game.ATTRDEF_ENUM_TABLE[slot3.key])

								slot4.name:text(slot5 .. ":")
								slot4.num:text(slot3.num)
								text.addEffect(slot4.num, {
									color = slot3.num < 0 and ui.COLORS.NORMAL.ALERT_ORANGE or ui.COLORS.NORMAL.FRIEND_GREEN
								})
							end
						}
					})
					slot4.selected:texture(slot3.selected == true and "common/icon/radio_selected.png" or "common/icon/radio_normal.png")
					bind.touch(slot0, slot4.selected, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	["panel.normalPanel"] = {
		varname = "normalPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onTrainSelectClick(1)
				end)
			}
		}
	},
	["panel.highPanel"] = {
		varname = "highPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onTrainSelectClick(2)
				end)
			}
		}
	},
	["panel.leftPanel.btn"] = {
		varname = "leftBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "onTrainClick"

					return slot0:onTrainClick(slot3.ONE)
				end)
			}
		}
	},
	["panel.rightPanel.btn"] = {
		varname = "rightBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "onTrainClick"

					return slot0:onTrainClick(slot3.TEN)
				end)
			}
		}
	},
	["panel.btnCustom"] = {
		varname = "btnCustom",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCustomClick")
			}
		}
	},
	mask = {
		varname = "mask",
		binds = {
			event = "click",
			method = bindHelper.self("onMaskClick")
		}
	},
	["panel.btnAdd"] = {
		varname = "btnAdd",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAddClick")
			}
		}
	},
	["panel.advancePanel.btn"] = {
		varname = "advanceBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAdvanceClick")
			}
		}
	},
	["panel.btnEffortExtra"] = {
		varname = "btnEffortExtra",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEffortExtraClick")
			}
		}
	},
	["panel.btnDetail"] = {
		varname = "btnDetail",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnDetailClick")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1, slot2)
	slot0.selectDbId = slot1()
	slot0.validAreas = slot2

	slot0:initModel()
	slot0:initCfg()

	slot0.curState = idler.new()
	slot0.tabDatas = idlers.new()
	slot0.trainIndex = idler.new(1)
	slot4 = {}
	slot0.currCost = idlertable.new(slot4)
	uv4 = "selectDbId"
	slot0.trainType = idler.new(slot4.ONE)
	slot0.times = idler.new(0)
	slot0.listIndexs = idlertable.new({})
	slot0.selectDatas = idlers.newWithMap({})

	slot0.selectPanel:hide()
	slot0:adaptUI()

	slot3, slot4 = csvNext(csv.card_effort)
	slot0.normal = slot4.cost1
	slot0.special = slot4.cost2
	slot0.datas = {
		{
			panel = slot0.normalPanel,
			cost = slot0.normal
		},
		{
			panel = slot0.highPanel,
			cost = slot0.special
		}
	}
	slot5 = 0

	idlereasy.any({
		slot0.cardId,
		slot0.effortValue,
		slot0.effortAdvance,
		slot0.level,
		slot0.effortAdvanceExtra,
		slot0.effortValueExtra
	}, function ()
		uv0 = "cardId"
		slot0 = slot0.cardId
		slot1 = slot0
		uv1 = "cardId"
		slot1 = slot1.effortValue
		slot2 = slot1
		uv2 = "cardId"
		slot2 = slot2.effortAdvance
		slot3 = slot2
		uv3 = "cardId"
		slot3 = slot3.effortValueExtra
		slot4 = slot3
		slot3 = slot3.read(slot4)
		uv4 = "cardId"
		slot4 = slot4.level:read()
		slot6 = gCardEffortAdvance[csv.cards[slot0.read(slot1)].effortSeqID][slot2.read(slot3)].advanceLimit
		slot7 = {}
		uv8 = "cardId"
		slot8.canAdvance = true
		uv8 = "cardId"
		slot8.canLimit = false
		uv8 = "cardId"
		slot8.extraLvMax = true
		uv8 = "cardId"
		slot8.limitAdvanceMax = true
		uv8 = "cardId"
		slot9 = {}
		slot8.attrShowIndex = slot9
		uv9 = "cardId"

		for slot11, slot12 in orderCsvPairs(slot9.cfg) do
			slot13 = game.ATTRDEF_TABLE[slot12.attrType]
			slot14, slot15 = dataEasy.getCardEffortMax(slot0, slot13, slot2)

			if slot14 > (slot1.read(slot2)[slot13] or 0) - slot15 then
				uv17 = "cardId"
				slot17.canAdvance = false
			end

			slot17 = table.insert

			slot17(slot7, {
				id = slot11,
				cfg = slot12,
				maxVal = slot14,
				totalVal = slot15,
				currVal = slot16
			})

			uv17 = "cardId"
			slot17.attrShowIndex[slot13] = #slot7
		end

		uv8 = "read"
		uv10 = "cardId"
		slot10 = slot10.advancePanel

		slot8(slot2, slot10)

		uv8 = "read"
		uv10 = "cardId"

		slot8(slot2, slot10.advanceMaxPanel)

		uv8 = "cardId"
		slot8 = slot8.textAdvance
		slot8 = slot8.text

		slot8(slot8, dataEasy.getRomanNumeral(slot2))

		uv8 = "cardId"

		if slot8.canAdvance then
			slot8 = slot2 < slot6
			uv9 = "cardId"
			slot9 = slot9.advancePanel
			slot9 = slot9.visible

			slot9(slot9, slot8)

			uv9 = "cardId"

			slot9.advanceMaxPanel:visible(not slot8)

			if slot8 then
				slot10 = slot2 + 1
				slot9 = gCardEffortAdvance[slot5.effortSeqID][slot10].needLevel
				uv10 = "cardId"

				slot10.advancePanel:get("txtLvTip"):text(string.format(gLanguageCsv.needSpriteLevelArrival, slot9)):visible(slot4 < slot9)
			end

			uv9 = "cardId"
			slot9.canLimit = not slot8 and dataEasy.isUnlock(gUnlockCsv.effortExtra)
			uv9 = "cardId"
			slot7 = slot9:isLimitOpen(slot7, not slot8)
		else
			uv8 = "cardId"
			slot8 = slot8:isLimitOpen(slot7, false)
			slot7 = slot8
			uv8 = "cardId"
			slot8 = slot8.advancePanel
			slot8 = slot8.visible

			slot8(slot8, false)

			uv8 = "cardId"

			slot8.advanceMaxPanel:visible(false)
		end

		slot8 = itertools.invoke
		slot9 = {
			slot10,
			slot10,
			slot10,
			slot10,
			slot10
		}
		uv10 = "cardId"
		uv10 = "cardId"
		uv10 = "cardId"
		uv10 = "cardId"
		uv10 = "cardId"
		uv10 = "cardId"

		if slot10.normalPanel.highPanel.leftPanel.rightPanel.btnCustom.canAdvance then
			uv10 = "cardId"

			if slot10.extraLvMax then
				uv10 = "cardId"

				if slot10.limitAdvanceMax then
					slot10 = "hide"
				end
			end
		else
			slot10 = "show"
		end

		slot8(slot9, slot10)

		uv9 = "cardId"
		slot9 = slot9.textAdvanceNote
		uv10 = "cardId"
		slot10 = slot10.textAdvance

		adapt.oneLinePos(slot9, slot10, cc.p(8, 0))

		slot8 = adapt.oneLinePos
		uv9 = "cardId"
		uv10 = "cardId"

		slot8(slot9.textAdvance, slot10.btnDetail, cc.p(15, 0))

		uv8 = "cardId"
		slot8 = slot8.curState
		slot8 = slot8.notify

		slot8(slot8)

		uv8 = "cardId"

		slot8.tabDatas:update(slot7)
	end)
	slot0.trainIndex:addListener(function (slot0, slot1)
		uv2 = "datas"
		slot2 = slot2.datas[slot1].panel:get("selected")
		slot2 = slot2.texture

		slot2(slot2, "common/icon/radio_normal.png")

		uv2 = "datas"
		slot4 = "common/icon/radio_selected.png"

		slot2.datas[slot0].panel:get("selected"):texture(slot4)

		slot2 = {}
		uv4 = "datas"

		for slot6, slot7 in csvMapPairs(slot4.datas[slot0].cost) do
			table.insert(slot2, {
				id = slot6,
				num = slot7
			})
		end

		uv3 = "datas"

		slot3.currCost:set(slot2)
	end)

	slot0.originLeftX = slot0.leftPanel:x()

	dataEasy.getListenUnlock(gUnlockCsv.effort10, function (slot0)
		if not slot0 then
			uv1 = "originState"
			uv2 = "ONE"
			slot1.originState = slot2.ONE
		else
			uv1 = "originState"
			uv2 = "ONE"
			slot1.originState = slot2.ONE_AND_TEN
		end

		uv1 = "originState"
		uv3 = "originState"

		slot1.curState:set(slot3.originState)
	end)
	idlereasy.when(slot0.listIndexs, function (slot0, slot1)
		slot2 = {}
		slot3 = false

		for slot7, slot8 in pairs(slot1) do
			if slot8 then
				slot3 = true
				uv9 = "pairs"

				for slot12, slot13 in slot9.tabDatas:ipairs() do
					slot15 = slot13:proxy().cfg.attrType
					uv15 = "pairs"

					if slot15.selectDatas:atproxy(slot7 + 1)[game.ATTRDEF_TABLE[slot15]] then
						slot2[slot12] = slot2[slot12] or 0
						uv16 = "pairs"
						slot2[slot12] = slot2[slot12] + slot16.selectDatas:atproxy(slot7 + 1)[slot14]
					end
				end
			end
		end

		uv5 = "pairs"

		cache.setShader(slot5.rightBtn, false, slot3 and "normal" or "hsl_gray")

		uv5 = "pairs"

		for slot7 = 1, slot5.tabDatas:size() do
			uv8 = "pairs"
			slot8.tabDatas:atproxy(slot7).changeNum = slot2[slot7]
		end
	end)
	idlereasy.any({
		slot0.items,
		slot0.currCost,
		slot0.curState
	}, function (slot0, slot1, slot2, slot3)
		slot4, slot5 = next(slot2)
		slot6 = slot5.id
		slot7 = slot5.num
		slot9 = dataEasy.getCfgByKey(slot6).icon

		if math.floor(dataEasy.getNumByKey(slot6) / slot5.num) >= 10 then
			slot10 = 10
		end

		uv11 = "next"
		slot11 = slot11.setHasCurrencyInfo

		slot11(slot11, slot6, slot8, slot9)

		uv11 = "next"

		slot11.times:set(slot10)

		if slot10 == 0 then
			slot10 = 10
		end

		uv11 = "next"
		slot11 = slot11.setPanelShowOrHide

		slot11(slot11, slot10)

		uv11 = "next"

		if slot11.canAdvance then
			uv11 = "next"

			if slot11.limitAdvanceMax then
				uv11 = "next"

				if not slot11.extraLvMax then
					uv11 = "next"

					slot11:initButtonStatus()
				end
			end
		end

		function slot11(slot0, slot1)
			slot7 = "costIcon"
			slot2 = slot0:multiget("num", "icon", "cost", slot7, "txt")

			slot2.costIcon:hide()
			slot2.cost:hide()

			slot5 = 0.9

			slot2.icon:scale(slot5)

			slot3 = slot2.icon
			slot3 = slot3.texture
			uv5 = "multiget"

			slot3(slot3, slot5)

			uv3 = "num"
			slot3 = slot3 * slot1

			slot2.num:text(slot3)

			uv7 = "icon"

			text.addEffect(slot2.num, {
				color = slot3 <= slot7 and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.NORMAL.ALERT_ORANGE
			})
			adapt.oneLineCenterPos(cc.p(slot0:width() / 2, slot0:height() / 2), {
				slot2.txt,
				slot2.num,
				slot2.icon
			}, cc.p(10, 0))
		end

		uv13 = "next"
		slot13 = slot13.leftTopPanel

		slot11(slot13, 1)

		uv13 = "next"
		slot13 = slot13.rightTopPanel

		slot11(slot13, slot10)

		uv13 = "next"
		uv15 = "id"

		cache.setShader(slot13.leftBtn, false, slot3 ~= slot15.SAVE and "normal" or "hsl_gray")
	end)
end

function slot3.initModel(slot0)
	slot0.items = gGameModel.role:getIdler("items")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.roleLv = gGameModel.role:getIdler("level")

	idlereasy.when(slot0.selectDbId, function (slot0, slot1)
		slot2 = gGameModel.cards
		slot3 = slot2
		slot2 = slot2.find(slot3, slot1)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.effortValue = idlereasy.assign(slot2.getIdler(slot6, "effort_values"), slot6.effortValue)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.effortAdvance = idlereasy.assign(slot2.getIdler(slot6, "effort_advance"), slot6.effortAdvance)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.level = idlereasy.assign(slot2.getIdler(slot6, "level"), slot6.level)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.cardId = idlereasy.assign(slot2.getIdler(slot6, "card_id"), slot6.cardId)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.effortAdvanceExtra = idlereasy.assign(slot2.getIdler(slot6, "extra_effort_level"), slot6.effortAdvanceExtra)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.effortValueExtra = idlereasy.assign(slot2.getIdler(slot6, "extra_effort_values"), slot6.effortValueExtra)
	end)
end

function slot3.initCfg(slot0)
	for slot5, slot6 in orderCsvPairs(csv.card_effort) do
		if slot6.attrType ~= game.ATTRDEF_ENUM_TABLE.specialDamage and slot6.advance == 1 then
			-- Nothing
		end
	end

	slot0.cfg = {
		[slot5] = slot6
	}
end

function slot3.setPanelShowOrHide(slot0, slot1)
	slot3 = slot0.trainType
	slot4 = slot3
	uv4 = "curState"
	slot4 = slot4.SAVE_AND_CANCEL <= slot0.curState:read()
	uv5 = "read"

	slot0.selectPanel:visible(slot4 and slot3.read(slot4) == slot5.TEN)
	slot0.mask:visible(slot4)
	itertools.invoke({
		slot0.btnAdd,
		slot0.normalPanel,
		slot0.highPanel
	}, "setTouchEnabled", not slot4)

	if not slot4 then
		slot0.listIndexs:set({})
	end

	slot0.leftPanel:get("btn", "txt"):text(not slot4 and string.format(gLanguageCsv.trainTimes, 1) or gLanguageCsv.spaceCancel)
	slot0.rightPanel:get("btn", "txt"):text(not slot4 and string.format(gLanguageCsv.trainTimes, slot1) or gLanguageCsv.spaceSave)

	if not slot0.canAdvance or not slot0.limitAdvanceMax or not slot0.extraLvMax then
		uv6 = "curState"
		slot6 = slot2 == slot6.ONE

		slot0.rightPanel:visible(not slot6)

		slot7 = slot0.leftPanel
		slot7 = slot7.x

		slot7(slot7, slot6 and slot0.originLeftX / 2 + slot0.rightPanel:x() / 2 or slot0.originLeftX)

		uv7 = "curState"

		if slot2 == slot7.SAVE then
			cache.setShader(slot0.leftBtn, false, "hsl_gray")
		end

		slot7 = cache.setShader
		uv10 = "curState"

		slot7(slot0.rightBtn, false, slot2 == slot10.SAVE_AND_CANCEL and "hsl_gray" or "normal")

		uv7 = "curState"
		slot7 = slot7.SAVE_AND_CANCEL <= slot2

		slot0.leftTopPanel:visible(not slot7)
		slot0.rightTopPanel:visible(not slot7)
	end
end

function slot3.initButtonStatus(slot0)
	if dataEasy.isUnlock(gUnlockCsv.customEffort) then
		uv3 = "dataEasy"

		if slot0.curState:read() == slot3.ONE_AND_TEN then
			slot0.btnCustom:visible(true)
			slot0.btnCustom:size(292, 122)
			slot0.btnCustom:get("txt"):xy(146, 61)
			slot0.leftPanel:get("btn"):size(292, 122)
			slot0.rightPanel:get("btn"):size(292, 122)
			slot0.leftPanel:get("btn"):get("txt"):x(146)
			slot0.rightPanel:get("btn"):get("txt"):x(146)
			slot0.leftPanel:x(slot0.leftPanel:x() - 20)
			adapt.oneLinePos(slot0.leftPanel, {
				slot0.rightPanel,
				slot0.btnCustom
			}, {
				cc.p(-140, 0),
				cc.p(-80, 0)
			})
		end
	else
		slot0.btnCustom:visible(false)
		slot0.leftPanel:get("btn"):size(320, 122)
		slot0.rightPanel:get("btn"):size(320, 122)
		slot0.leftPanel:get("btn"):get("txt"):x(166)
		slot0.rightPanel:get("btn"):get("txt"):x(166)
		adapt.oneLinePos(slot0.leftPanel, slot0.rightPanel, cc.p(90, 0))
	end
end

function slot3.setHasCurrencyInfo(slot0, slot1, slot2, slot3)
	slot4 = slot0.panel:multiget("txtBg", "icon", "num", "btnAdd")

	slot4.num:text(slot2)
	slot4.icon:texture(slot3)

	slot5 = slot2 < 100000 and 290 or (90 + slot4.num:size().width) * 1.33

	slot4.icon:x(slot4.txtBg:x() - slot5 * 0.8 - 20)
	slot4.txtBg:size(slot5, 70)
	adapt.oneLinePos(slot4.btnAdd, slot4.num, cc.p(10, 0), "right")
end

function slot3.adaptUI(slot0)
	if matchLanguage({
		"en"
	}) then
		slot3 = slot0.advancePanel:multiget("icon1", "txtAdvance", "icon2", "txtTip", "txtLvTip")

		adapt.setTextAdaptWithSize(slot0.advanceMaxPanel:get("txtTip"), {
			vertical = "center",
			horizontal = "center",
			size = cc.size(slot0.advanceMaxPanel:width() - 150, 200)
		})
		adapt.setTextAdaptWithSize(slot3.txtTip, {
			vertical = "center",
			horizontal = "center",
			size = cc.size(slot0.advancePanel:width() - 150, 200)
		})
		adapt.setTextAdaptWithSize(slot3.txtLvTip, {
			vertical = "center",
			horizontal = "center",
			size = cc.size(slot0.advancePanel:width() - 150, 200)
		})

		if slot0.level:read() < gCardEffortAdvance[csv.cards[slot0.cardId:read()].effortSeqID][slot0.effortAdvance:read() + 1].needLevel then
			slot4 = 270

			slot3.txtAdvance:y(slot4)
			slot3.icon1:y(slot4)
			slot3.icon2:y(slot4)
			slot3.txtTip:y(slot0.advancePanel:get("txtAdvance"):y() - 65)
			slot3.txtLvTip:y(slot0.advancePanel:get("txtTip"):y() - 69)
		end
	end
end

function slot3.onTrainClick(slot0, slot1)
	if slot0.limitAdvanceMax and slot0.canLimit then
		gGameUI:showTip(gLanguageCsv.effortExtraLvUpMax)

		return
	end

	slot2 = slot0.curState
	slot3 = slot2
	uv3 = "limitAdvanceMax"

	if slot2.read(slot3) <= slot3.ONE then
		uv2 = "canLimit"
		slot2 = slot1 == slot2.ONE and 1 or slot0.times:read()

		if slot0.times:read() == 0 then
			gGameUI:showTip(gLanguageCsv.effortMaterialNotEnough)

			return
		end

		gGameApp:requestServer("/game/card/effort/train", function (slot0)
			uv1 = "request"

			slot1:request(slot0)
		end, slot0.selectDbId, slot0.trainIndex, slot2)
	else
		uv2 = "canLimit"

		if slot1 == slot2.ONE then
			slot2 = slot0.curState
			slot3 = slot2
			uv3 = "limitAdvanceMax"

			if slot2.read(slot3) ~= slot3.SAVE then
				slot0.curState:set(slot0.originState)
			else
				gGameUI:showTip(gLanguageCsv.effortNotCancel)
			end
		else
			slot0:saveTrain()
		end
	end
end

function slot3.onCustomClick(slot0)
	if slot0.limitAdvanceMax and slot0.canLimit then
		gGameUI:showTip(gLanguageCsv.effortExtraLvUpMax)

		return
	end

	if slot0.times:read() == 0 then
		gGameUI:showTip(gLanguageCsv.effortMaterialNotEnough)

		return
	end

	slot1, slot2 = nil

	for slot6, slot7 in ipairs(slot0.currCost:read()) do
		if slot7.id ~= "gold" then
			slot8 = slot0.trainIndex:read()

			gGameUI:stackUI("city.card.effortvalue_custom", nil, , slot0.trainIndex:read(), slot7.id, math.min(math.floor(dataEasy.getNumByKey(slot7.id) / slot7.num), 100), slot0.selectDbId:read(), slot0:createHandler("request"))
		end
	end
end

function slot3.onTrainSelectClick(slot0, slot1)
	slot0.trainIndex:set(slot1)
end

function slot3.request(slot0, slot1)
	slot0.selectDatas:update(slot1.view.result)

	if #slot1.view.result == 1 then
		slot2 = true
		slot3 = 0

		for slot7, slot8 in pairs(slot1.view.result[1]) do
			if slot0.attrShowIndex[slot7] then
				slot10 = slot0.tabDatas:atproxy(slot0.attrShowIndex[slot7])
				slot9 = cc.clampf(slot8, slot10.totalVal - slot10.currVal, slot10.maxVal + slot10.totalVal - slot10.currVal)
			end

			slot3 = slot3 + slot9

			if slot9 < 0 then
				slot2 = false
			end
		end

		if slot3 <= 0 then
			slot2 = false
		end

		uv6 = "selectDatas"

		slot0.trainType:set(slot6.ONE)

		slot4 = slot0.curState
		slot5 = slot4
		slot4 = slot4.set

		if slot2 then
			uv6 = "update"

			if not slot6.SAVE then
				uv6 = "update"
				slot6 = slot6.SAVE_AND_CANCEL
			end
		end

		slot4(slot5, slot6)
		slot0.listIndexs:set({
			[0] = true
		}, true)

		if slot0.selectPanel:isVisible() then
			slot0:onBtnAttr(userDefault.getForeverLocalKey("attrRecommondedState"))
		end
	else
		uv4 = "selectDatas"
		slot4 = slot4.TEN

		slot0.trainType:set(slot4)

		slot0.sign = true
		uv4 = "update"

		slot0.curState:set(slot4.SAVE_AND_CANCEL)
		slot0:onBtnAttr(userDefault.getForeverLocalKey("attrRecommondedState"))
	end
end

function slot3.saveTrain(slot0)
	idlereasy.do_(function (slot0)
		slot1 = {}

		for slot5, slot6 in pairs(slot0) do
			if slot6 then
				table.insert(slot1, slot5)
			end
		end

		if #slot1 == 0 then
			gGameUI:showTip(gLanguageCsv.firstChooseNeedAttr)
		else
			uv6 = "pairs"

			gGameApp:requestServer("/game/card/effort/save", function (slot0)
				uv1 = "curState"
				uv3 = "curState"

				slot1.curState:set(slot3.originState)
			end, slot6.selectDbId, slot1)
		end
	end, slot0.listIndexs)
end

function slot3.onMaskClick(slot0, slot1, slot2)
	slot3 = slot0.trainType
	slot4 = slot3
	uv4 = "trainType"

	if slot3.read(slot4) == slot4.ONE then
		gGameUI:showTip(gLanguageCsv.effortValueOneMask)
	else
		if slot0.validAreas then
			slot4 = false

			for slot8, slot9 in ipairs(slot0.validAreas) do
				if cc.rectContainsPoint(slot9, cc.p(slot2.x, slot2.y)) then
					slot4 = true

					break
				end
			end

			if not slot4 then
				return
			end
		end

		gGameUI:showDialog({
			btnType = 2,
			strs = gLanguageCsv.effortCancel,
			cb = function ()
				uv0 = "curState"
				uv2 = "curState"

				slot0.curState:set(slot2.originState)
			end
		})
	end
end

function slot3.onItemClick(slot0, slot1, slot2, slot3)
	slot0.selectDatas:atproxy(slot2).selected = not slot0.selectDatas:atproxy(slot2).selected

	slot0.listIndexs:modify(function (slot0)
		uv1 = "selectDatas"
		uv2 = "atproxy"
		uv4 = "selectDatas"
		slot0[slot1 - 1] = slot2.selectDatas:atproxy(slot4).selected

		return true, slot0
	end, true)
end

function slot3.onBtnAttr(slot0, slot1)
	slot0.btnAttrSelected = not slot0.btnAttrSelected

	if slot1 ~= nil then
		slot0.btnAttrSelected = slot1
	end

	userDefault.setForeverLocalKey("attrRecommondedState", slot0.btnAttrSelected)
	slot0.btnAttr:texture(slot0.btnAttrSelected == true and "common/icon/radio_selected.png" or "common/icon/radio_normal.png")

	for slot5 = 1, itertools.size(slot0.selectDatas) do
		if slot0.selectDatas:atproxy(slot5) then
			for slot11, slot12 in pairs(slot0.selectDatas:atproxy(slot5)) do
				if slot11 ~= "selected" then
					slot7 = 0 + slot12 * gCommonConfigCsv["attr" .. string.caption(slot11)]
				end
			end

			if slot7 > 0 then
				slot0.selectDatas:atproxy(slot5).selected = slot0.btnAttrSelected

				slot0.listIndexs:modify(function (slot0)
					uv1 = "selectDatas"
					uv2 = "atproxy"
					uv4 = "selectDatas"
					slot0[slot1 - 1] = slot2.selectDatas:atproxy(slot4).selected

					return true, slot0
				end, true)
			end
		end
	end
end

function slot3.onAddClick(slot0)
	slot1, slot2 = next(slot0.currCost:read())

	jumpEasy.jumpTo("gainWay", slot2.id)
end

function slot3.onAdvanceClick(slot0)
	slot1 = csv.cards[slot0.cardId:read()]

	if slot0.canLimit then
		if slot0.level:read() < ((gCardEffortExtra[(slot0.effortAdvanceExtra:read() or 0) + 1] or {}).needLevel or math.huge) then
			gGameUI:showTip(string.format(gLanguageCsv.effortExtraNeedLv, slot4))
		else
			slot0:onEffortExtraClick()
		end
	else
		slot2 = slot0.selectDbId:read()

		if slot0.level:read() < gCardEffortAdvance[slot1.effortSeqID][slot0.effortAdvance:read() + 1].needLevel then
			gGameUI:showTip(string.format(gLanguageCsv.needSpriteLevelArrival, slot3))

			return
		end

		slot5 = gGameModel.cards:find(slot2):read("fighting_point")

		gGameApp:requestServerCustom("/game/card/effort/advance"):params(slot0.selectDbId):onResponse(function ()
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
		end):wait({
			false
		}):doit(function (slot0)
			uv6 = "gGameUI"
			uv7 = "stackUI"
			uv9 = "city.card.common_success"

			gGameUI:stackUI("city.card.common_success", nil, {
				blackLayer = true
			}, slot6, slot7, {
				effortAdvance = slot9.effortAdvance:read()
			})
		end)
	end
end

function slot3.onBtnDetailClick(slot0)
	gGameUI:stackUI("city.card.effortvalue_detail", nil, , slot0.effortAdvance:read(), slot0.cardId:read())
end

function slot3.onEffortExtraClick(slot0)
	if slot0.notShowExtra then
		gGameUI:showTip(gLanguageCsv.effortValNeedMax)
	else
		gGameUI:stackUI("city.card.effortvalue_extra", nil, , slot0.cardId:read(), slot0:createHandler("selectDbId"))
	end
end

function slot3.isLimitOpen(slot0, slot1, slot2)
	slot0.textAdvanceNote:text(gLanguageCsv.effortAdvance)
	itertools.invoke({
		slot0.textAdvance,
		slot0.btnDetail
	}, "show")
	itertools.invoke({
		slot0.imgEffortExtra,
		slot0.btnEffortExtra,
		slot0.advanceMaxPanel
	}, "hide")

	slot3 = slot0.effortAdvanceExtra:read() or 0

	if not slot0.canLimit then
		if slot3 > 0 then
			slot0.notShowExtra = true

			slot0.btnEffortExtra:show()
			uiEasy.setBtnShader(slot0.btnEffortExtra, nil, 3)
		end

		slot0.advanceMaxPanel:visible(slot2)

		return slot1
	end

	slot0.notShowExtra = false
	slot6 = slot0.effortValueExtra:read()
	slot7 = csv.cards[slot0.cardId:read()]

	if slot2 and slot3 == 0 then
		slot0.advancePanel:show()
		slot0.advancePanel:get("txtLvTip"):hide()
		slot0.advanceMaxPanel:hide()
		slot0.advancePanel:get("txtTip"):text(gLanguageCsv.effortExtraTips)
		slot0.advanceBtn:get("txt"):text(gLanguageCsv.effortExtraAdvance)
		uiEasy.setBtnShader(slot0.advanceBtn, slot0.advanceBtn:get("txt"), slot0.level:read() < gCardEffortExtra[slot3 + 1].needLevel and 3 or 1)

		return slot1
	end

	slot0.btnEffortExtra:show()
	itertools.invoke({
		slot0.textAdvance,
		slot0.btnDetail,
		slot0.advanceMaxPanel
	}, "hide")
	slot0.textAdvanceNote:text(gLanguageCsv.effortExtra)

	slot0.limitAdvanceMax = true
	slot9 = {}
	slot10 = 1
	slot11 = table.deepcopy(slot0.attrShowIndex)

	for slot15, slot16 in orderCsvPairs(slot0.cfg) do
		slot17 = game.ATTRDEF_TABLE[slot16.attrType]
		slot18, slot19 = dataEasy.getCardEffortExtraMax(slot17, slot3)

		if slot18 > (slot6[slot17] or 0) - slot19 then
			slot0.limitAdvanceMax = false
		end

		table.insert(slot9, {
			totalVal = 0,
			id = slot15,
			cfg = slot16,
			maxVal = slot18 + slot19,
			currVal = slot20,
			extraVal = slot1[slot11[slot17]].totalVal + slot1[slot11[slot17]].maxVal
		})

		slot0.attrShowIndex[slot17] = #slot9
	end

	slot0.extraLvMax = not slot8

	uiEasy.setBtnShader(slot0.btnEffortExtra, nil, not slot8 and 3 or 1)
	slot0.imgEffortExtra:visible(slot0.limitAdvanceMax and slot0.extraLvMax)

	return slot9
end

return slot3
