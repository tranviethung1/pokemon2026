slot1 = 25
slot2 = class("FishingBagView", Dialog)
slot2.RESOURCE_FILENAME = "fishing_bag.json"
slot2.RESOURCE_BINDING = {
	["rightRod.get.lockTip"] = "rodGetLock",
	["rightBait.get.costTip.icon"] = "baitCostIcon",
	["rightRod.value.scaleUp"] = "rodValScaleUp",
	["rightRod.value.upSpeed"] = "rodValUpSpe",
	["rightPartner.get.cost.cost.cost"] = "partnerCostCost",
	["rightBait.value.autoSuccessRate"] = "baitValAutoSuccessRate",
	["rightRod.value.scaleUp.txt"] = "rodScaleUpTxt",
	rightPartner = "rightPartner",
	rightRod = "rightRod",
	["rightRod.value.upSpeed.txt"] = "rodUpSpeTxt",
	["rightBait.value.lowerRange.name"] = "baitLowerRangeName",
	["rightBait.value"] = "baitVal",
	["rightRod.value.upSpeed.name"] = "rodUpSpeName",
	center = "center",
	["rightRod.get.costTip.cost2"] = "rodCostCost2",
	["center.subList"] = "subList",
	["rightRod.get.lockTip.cost"] = "rodLockCost",
	["rightBait.value.autoSuccessRate.name"] = "baitAutoSuccessRateName",
	["rightBait.value.lowerWait"] = "baitValLowerWait",
	["rightRod.value.waitTime.name"] = "rodWaitTimeName",
	["rightBait.value.autoSuccessRate.txt"] = "baitAutoSuccessRateTxt",
	["rightRod.get.costTip.cost"] = "rodCostCost",
	["center.item"] = "item",
	["rightRod.value.speed"] = "rodValSpe",
	["rightRod.value.autoSuccessRate.txt"] = "rodAutoSuccessRateTxt",
	["rightBait.value.lowerWait.txt"] = "baitLowerWaitTxt",
	["rightRod.specialGet"] = "rodSpecialGet",
	["rightBait.get.lockTip"] = "baitGetLock",
	["rightRod.value.waitTime.txt"] = "rodWaitTimeTxt",
	["rightBait.value.lowerRange.txt"] = "baitLowerRangeTxt",
	["rightBait.get.costTip.cost2"] = "baitCostCost2",
	btn = "btnItem",
	["rightPartner.get.cost.cost.cost2"] = "partnerCostCost2",
	["rightRod.get.costTip.icon"] = "rodCostIcon",
	["rightPartner.get.cost.need.need1"] = "partnerNeed1",
	["rightRod.get.costTip"] = "rodGetCost",
	["rightBait.get.lockTip.cost"] = "baitLockCost",
	["rightBait.value.lowerRange"] = "baitValLowerRange",
	["rightRod.value.scaleUp.name"] = "rodScaleUpName",
	["rightBait.value.lowerWait.name"] = "baitLowerWaitName",
	["rightRod.value.speed.txt"] = "rodSpeTxt",
	["rightRod.value.waitTime"] = "rodValWaitTime",
	["rightRod.value"] = "rodVal",
	["rightPartner.get.cost.cost.icon"] = "partnerCostIcon",
	["rightRod.value.autoSuccessRate.name"] = "rodAutoSuccessRateName",
	["rightBait.get.costTip.cost"] = "baitCostCost",
	["rightPartner.get.cost.need.txt"] = "partnerTxt",
	["rightBait.specialGet"] = "baitSpecialGet",
	["rightBait.get.costTip"] = "baitGetCost",
	rightBait = "rightBait",
	["rightRod.value.autoSuccessRate"] = "rodValAutoSuccessRate",
	["rightPartner.get.cost"] = "partnerGetCost",
	["rightPartner.get.cost.need.need2"] = "partnerNeed2",
	["rightRod.value.speed.name"] = "rodSpeName",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["left.list"] = {
		varname = "btnList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("btnDatas"),
				item = bindHelper.self("btnItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("btnNormal")
					slot5 = slot1:get("btnSelected")

					slot5:visible(slot3.selected)
					slot4:visible(not slot3.selected)
					slot4:get("txt"):text(slot3.txt)
					slot5:get("txt"):text(slot3.txt)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onSelectClick")
			}
		}
	},
	["center.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				data = bindHelper.self("itemDatas"),
				columnSize = 4,
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				leftPadding = slot1,
				topPadding = slot1,
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "fishtools_icon",
						props = {
							num = true,
							lock = true,
							data = {
								key = slot3.id,
								typ = slot3.typ,
								needLv = slot3.needLv,
								lock = slot3.isLock
							},
							onNode = function (slot0)
								uv1 = "selectEffect"

								if slot1.selectEffect then
									uv1 = "selectEffect"
									slot1 = slot1.selectEffect
									slot1 = slot1.removeSelf

									slot1(slot1)

									uv1 = "selectEffect"
									slot3 = cc.p(0.5, 0.5)

									slot1.selectEffect:align(slot3, 100, 100)

									uv3 = "selectEffect"
									slot3 = slot3.selectEffect

									slot0:add(slot3, -1)

									slot1 = "common/box/box_selected.png"
									slot2 = 1
									uv3 = "selectEffect"

									if slot3.typ == 3 then
										slot1 = "common/box/box_portrait_select.png"
										slot2 = 0.9
									end

									uv3 = "selectEffect"
									slot3 = slot3.selectEffect
									slot3 = slot3.scale

									slot3(slot3, slot2)

									uv3 = "selectEffect"

									slot3.selectEffect:texture(slot1)
								end
							end
						}
					})

					slot4 = slot0:getIdx(slot2)

					slot1:get("use"):visible(slot3.isUse)

					slot5 = "common/box/mask_fangd.png"
					slot6 = 1
					slot7 = 1

					if slot3.typ == 3 then
						slot5 = "common/box/mask_d.png"
						slot6 = 1.2
						slot7 = 0.7
					end

					slot1:get("use"):texture(slot5)
					slot1:get("use"):scale(slot6)
					slot1:get("use"):get("txt"):scale(slot7):xy(slot1:get("use"):width() / 2, slot1:get("use"):height() / 2)
					text.addEffect(slot1:get("use"):get("txt"), {
						outline = {
							size = 3,
							color = cc.c4b(91, 84, 91, 255)
						}
					})
					bind.click(slot0, slot1, {
						method = functools.partial(slot0.itemClick, slot4, slot3)
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["rightRod.get.btnBuy"] = {
		varname = "rodBtnBuy",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRodBtnBuy")
			}
		}
	},
	["rightRod.get.btnUse"] = {
		varname = "rodBtnUse",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnUse")
			}
		}
	},
	["rightBait.get.btnBuy"] = {
		varname = "baitBtnBuy",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBaitBtnBuy")
			}
		}
	},
	["rightBait.get.btnUse"] = {
		varname = "baitBtnUse",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnUse")
			}
		}
	},
	["rightPartner.get.btnBuy"] = {
		varname = "partnerBtnBuy",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPartnerBtnBuy")
			}
		}
	},
	["rightPartner.get.btnUse"] = {
		varname = "partnerBtnUse",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnUse")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	Dialog.onCreate(slot0)
	slot0:initModel()

	slot0.selectEffect = ccui.ImageView:create("common/box/box_selected.png"):alignCenter(slot0.item:size()):retain()
	slot0.selectItemRefresh = true
	slot0.showTab = idler.new(slot1 or 1)
	slot0.itemDatas = idlers.new({})
	slot0.selectItem = idler.new(1)

	idlereasy.any({
		slot0.fishLevel,
		slot0.items,
		slot0.showTab,
		slot0.partner,
		slot0.selectRod,
		slot0.selectBait,
		slot0.selectPartner
	}, function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		slot8 = {}

		if slot3 == 1 then
			for slot12, slot13 in csvPairs(csv.fishing.rod) do
				slot8[slot12] = {
					typ = 1,
					csvID = slot12,
					id = slot13.itemId,
					name = slot13.name,
					desc = slot13.desc,
					extraSpeed = slot13.extraSpeed,
					lowerSpeed = slot13.lowerSpeed,
					extraZone = slot13.extraZone,
					extraProbability = slot13.extraProbability,
					lowerWait = slot13.lowerWait,
					needLv = slot13.needLv,
					cost = slot13.cost,
					isLock = slot2[slot13.itemId],
					fishLevel = slot1,
					isUse = slot5 == slot12
				}
			end
		elseif slot3 == 2 then
			for slot12, slot13 in csvPairs(csv.fishing.bait) do
				slot15 = csv.fishing.bait[slot12].scene
				uv15 = "csvPairs"

				if itertools.map(slot15, function (slot0, slot1)
					return slot1, true
				end)[slot15] then
					table.insert(slot8, {
						typ = 2,
						csvID = slot12,
						id = slot13.itemId,
						name = slot13.name,
						desc = slot13.desc,
						cost = slot13.cost,
						lowerRandom = slot13.lowerRandom,
						lowerWait = slot13.lowerWait,
						extraProbability = slot13.extraProbability,
						needLv = slot13.needLv,
						isLock = slot2[slot13.itemId],
						fishLevel = slot1,
						isUse = slot6 == slot12
					})
				end
			end

			table.sort(slot8, function (slot0, slot1)
				return slot0.csvID < slot1.csvID
			end)
		elseif slot3 == 3 then
			for slot12, slot13 in csvPairs(csv.fishing.partner) do
				slot8[slot12] = {
					typ = 3,
					csvID = slot12,
					id = slot13.unitId,
					name = slot13.name,
					desc = slot13.desc,
					cost = slot13.cost,
					needLv = slot13.needLv,
					isLock = slot4[slot12],
					fishLevel = slot1,
					isUse = slot7 == slot12
				}
			end
		end

		uv9 = "csv"

		if slot9.selectItemRefresh then
			uv9 = "csv"
			slot9.selectItemRefresh = false
			slot9 = 1

			for slot13, slot14 in pairs(slot8) do
				if slot14.isUse then
					slot9 = slot13

					break
				end
			end

			uv10 = "csv"

			slot10.selectItem:set(slot9)
		end

		uv9 = "csv"

		if slot8[slot9.selectItem:read()] then
			uv11 = "csv"
			slot8[slot9].selectEffect = slot11.selectEffect
		end

		uv10 = "csv"
		slot10 = slot10.itemDatas
		slot10 = slot10.update

		slot10(slot10, slot8)

		uv10 = "csv"
		slot10.idx = slot3
		uv10 = "csv"

		slot10.selectItem:notify()
	end)

	slot3 = {
		{
			selected = false,
			txt = gLanguageCsv.rod
		},
		{
			selected = false,
			txt = gLanguageCsv.bait
		},
		{
			selected = false,
			txt = gLanguageCsv.partner
		}
	}
	slot0.btnDatas = idlers.new(slot3)

	slot0.btnDatas:update(slot3)

	slot0.panel = {
		slot0.rightRod,
		slot0.rightBait,
		slot0.rightPartner
	}

	slot0.showTab:addListener(function (slot0, slot1, slot2)
		uv3 = "btnDatas"
		slot3 = slot3.btnDatas:atproxy(slot1)
		slot3.selected = false
		uv3 = "btnDatas"
		slot3.btnDatas:atproxy(slot0).selected = true
	end)
	slot0.selectItem:addListener(function (slot0, slot1)
		uv2 = "itemDatas"
		slot2 = slot2.itemDatas:atproxy(slot1)

		if slot0 ~= slot1 and slot2 and slot2.selectEffect ~= nil then
			slot2.selectEffect = nil
		end

		uv3 = "itemDatas"

		if slot3.itemDatas:atproxy(slot0) then
			if slot0 ~= slot1 then
				uv5 = "itemDatas"

				if slot3.selectEffect ~= slot5.selectEffect then
					uv4 = "itemDatas"
					slot3.selectEffect = slot4.selectEffect
				end
			end

			uv4 = "itemDatas"
			uv7 = "itemDatas"

			slot4:resetShowPanel(slot3, slot7.idx)
		end
	end)
end

function slot2.resetShowPanel(slot0, slot1, slot2)
	slot0.panel[1]:visible(slot2 == 1)
	slot0.panel[2]:visible(slot2 == 2)
	slot0.panel[3]:visible(slot2 == 3)
	bind.extend(slot0, slot0.panel[slot2], {
		class = "fishtools_icon",
		props = {
			data = {
				key = slot1.id,
				typ = slot1.typ
			},
			onNode = function (slot0)
				slot4 = 0.5
				slot5 = 0.5
				uv4 = "align"
				uv5 = "cc"
				slot6 = "icon"
				slot4 = slot4.panel[slot5]:get(slot6)
				slot5 = slot4
				uv5 = "align"
				uv6 = "cc"

				slot0:align(cc.p(slot4, slot5), slot4.x(slot5) - 35, slot5.panel[slot6]:get("icon"):y() - 35):scale(1.3):z(3)
			end
		}
	})
	slot0.panel[slot2]:get("name"):text(slot1.name)

	slot3 = slot1.desc

	if slot2 == 1 or slot2 == 2 then
		slot3 = csv.items[slot1.id].desc
	end

	beauty.textScroll({
		isRich = true,
		align = "center",
		list = slot0.panel[slot2]:get("list"),
		strs = "#C0x5B545B#" .. slot3
	})

	if slot2 == 1 then
		slot0.rodSpeTxt:text("+" .. slot1.extraSpeed * 100 .. "%")
		slot0.rodValSpe:visible(slot1.extraSpeed ~= 0)
		adapt.oneLinePos(slot0.rodSpeName, slot0.rodSpeTxt, cc.p(30, 0), "left")
		slot0.rodUpSpeTxt:text("-" .. slot1.lowerSpeed * 100 .. "%")
		slot0.rodValUpSpe:visible(slot1.lowerSpeed ~= 0)
		adapt.oneLinePos(slot0.rodUpSpeName, slot0.rodUpSpeTxt, cc.p(30, 0), "left")
		slot0.rodScaleUpTxt:text("+" .. (slot1.extraZone - 1) * 100 .. "%")
		slot0.rodValScaleUp:visible(slot1.extraZone ~= 0)
		adapt.oneLinePos(slot0.rodScaleUpName, slot0.rodScaleUpTxt, cc.p(30, 0), "left")
		slot0.rodAutoSuccessRateTxt:text("+" .. slot1.extraProbability * 100 .. "%")
		slot0.rodValAutoSuccessRate:visible(slot1.extraProbability ~= 0)
		adapt.oneLinePos(slot0.rodAutoSuccessRateName, slot0.rodAutoSuccessRateTxt, cc.p(30, 0), "left")
		slot0.rodWaitTimeTxt:text("-" .. slot1.lowerWait * 100 .. "%")
		slot0.rodValWaitTime:visible(slot1.lowerWait ~= 0)
		adapt.oneLinePos(slot0.rodWaitTimeName, slot0.rodWaitTimeTxt, cc.p(30, 0), "left")

		if slot1.extraSpeed ~= 0 then
			table.insert({}, "extraSpeed")
		end

		if slot1.lowerSpeed ~= 0 then
			table.insert(slot5, "lowerSpeed")
		end

		if slot1.extraZone ~= 0 then
			table.insert(slot5, "extraZone")
		end

		if slot1.extraProbability ~= 0 then
			table.insert(slot5, "extraProbability")
		end

		if slot1.lowerWait ~= 0 then
			table.insert(slot5, "lowerWait")
		end

		for slot10 = 1, table.length(slot5) do
			if slot5[slot10] == "extraSpeed" then
				slot0.rodValSpe:y((5 - slot10) / 2 * 90)
			elseif slot5[slot10] == "lowerSpeed" then
				slot0.rodValUpSpe:y(slot11)
			elseif slot5[slot10] == "extraZone" then
				slot0.rodValScaleUp:y(slot11)
			elseif slot5[slot10] == "extraProbability" then
				slot0.rodValAutoSuccessRate:y(slot11)
			elseif slot5[slot10] == "lowerWait" then
				slot0.rodValWaitTime:y(slot11)
			end
		end

		slot7, slot8 = csvNext(slot1.cost)

		slot0.rodGetLock:visible(slot1.fishLevel < slot1.needLv)
		slot0.rodLockCost:text(string.format(gLanguageCsv.fishingLvNotEnough, slot1.needLv))
		slot0.rodBtnBuy:setTouchEnabled(slot1.needLv <= slot1.fishLevel)
		cache.setShader(slot0.rodBtnBuy, false, slot1.needLv <= slot1.fishLevel and "normal" or "hsl_gray")
		slot0.rodBtnUse:setTouchEnabled(slot1.needLv <= slot1.fishLevel)
		cache.setShader(slot0.rodBtnUse, false, slot1.needLv <= slot1.fishLevel and "normal" or "hsl_gray")
		slot0.rodBtnBuy:visible(slot1.isLock == nil)
		slot0.rodBtnUse:visible(slot9 ~= nil)

		if slot9 == nil then
			slot0.rodGetCost:visible(slot7 ~= nil)
			slot0.rodSpecialGet:visible(slot7 == nil)

			if slot7 ~= nil then
				slot0.rodCostCost2:text(slot8)
				slot0.rodCostIcon:texture(dataEasy.getIconResByKey(slot7))
				adapt.oneLineCenterPos(cc.p(165, slot0.rodCostCost:y()), {
					slot0.rodCostCost,
					slot0.rodCostCost2,
					slot0.rodCostIcon
				}, cc.p(5, 0))
			else
				itertools.invoke({
					slot0.rodBtnBuy,
					slot0.rodBtnUse
				}, "hide")
			end
		else
			itertools.invoke({
				slot0.rodGetCost,
				slot0.rodSpecialGet
			}, "hide")
		end
	elseif slot2 == 2 then
		slot0.baitLowerRangeTxt:text("-" .. slot1.lowerRandom * 100 .. "%")
		slot0.baitValLowerRange:visible(slot1.lowerRandom ~= 0)
		adapt.oneLinePos(slot0.baitLowerRangeName, slot0.baitLowerRangeTxt, cc.p(30, 0), "left")
		slot0.baitLowerWaitTxt:text("-" .. slot1.lowerWait * 100 .. "%")
		slot0.baitValLowerWait:visible(slot1.lowerWait ~= 0)
		adapt.oneLinePos(slot0.baitLowerWaitName, slot0.baitLowerWaitTxt, cc.p(30, 0), "left")
		slot0.baitAutoSuccessRateTxt:text("+" .. slot1.extraProbability * 100 .. "%")
		slot0.baitValAutoSuccessRate:visible(slot1.extraProbability ~= 0)
		adapt.oneLinePos(slot0.baitAutoSuccessRateName, slot0.baitAutoSuccessRateTxt, cc.p(30, 0), "left")

		if slot1.lowerRandom ~= 0 then
			table.insert({}, "lowerRandom")
		end

		if slot1.lowerWait ~= 0 then
			table.insert(slot5, "lowerWait")
		end

		if slot1.extraProbability ~= 0 then
			table.insert(slot5, "extraProbability")
		end

		for slot10 = 1, table.length(slot5) do
			if slot5[slot10] == "lowerRandom" then
				slot0.baitValLowerRange:y((3 - slot10) / 2 * 90)
			elseif slot5[slot10] == "lowerWait" then
				slot0.baitValLowerWait:y(slot11)
			elseif slot5[slot10] == "extraProbability" then
				slot0.baitValAutoSuccessRate:y(slot11)
			end
		end

		slot0.baitGetLock:visible(slot1.fishLevel < slot1.needLv)
		slot0.baitLockCost:text(string.format(gLanguageCsv.fishingLvNotEnough, slot1.needLv))
		slot0.baitBtnBuy:setTouchEnabled(slot1.needLv <= slot1.fishLevel)
		cache.setShader(slot0.baitBtnBuy, false, slot1.needLv <= slot1.fishLevel and "normal" or "hsl_gray")
		slot0.baitBtnUse:setTouchEnabled(slot1.needLv <= slot1.fishLevel)
		cache.setShader(slot0.baitBtnUse, false, slot1.needLv <= slot1.fishLevel and "normal" or "hsl_gray")

		slot7, slot8 = csvNext(slot1.cost)

		slot0.baitBtnBuy:visible(slot7 ~= nil)
		slot0.baitBtnUse:visible(slot7 ~= nil)
		slot0.baitGetCost:visible(slot7 ~= nil)
		slot0.baitSpecialGet:visible(slot7 == nil)
		slot0.baitGetLock:x(slot7 == nil and 400 or 310)

		if slot7 ~= nil then
			slot0.baitCostCost2:text(slot8)
			slot0.baitCostIcon:texture(dataEasy.getIconResByKey(slot7))
			adapt.oneLineCenterPos(cc.p(150, slot0.baitCostCost:y()), {
				slot0.baitCostCost,
				slot0.baitCostCost2,
				slot0.baitCostIcon
			}, cc.p(5, 0))
		end

		if slot1.isLock ~= nil and slot7 == nil then
			slot0.baitBtnBuy:show()
			slot0.baitBtnUse:show()
			slot0.baitBtnBuy:setTouchEnabled(false)
			cache.setShader(slot0.baitBtnBuy, false, "hsl_gray")
		elseif slot1.isLock ~= nil then
			slot0.baitBtnUse:show()
			slot0.baitBtnUse:setTouchEnabled(true)
			cache.setShader(slot0.baitBtnUse, false, "normal")
		elseif slot1.isLock == nil and slot7 == nil then
			slot0.baitBtnBuy:hide()
			slot0.baitBtnUse:hide()
		end
	elseif slot2 == 3 then
		if slot1.fishLevel < slot1.needLv then
			text.addEffect(slot0.partnerTxt, {
				color = cc.c4b(183, 176, 158, 255)
			})
			text.addEffect(slot0.partnerNeed2, {
				color = cc.c4b(183, 176, 158, 255)
			})
		else
			text.addEffect(slot0.partnerTxt, {
				color = cc.c4b(91, 84, 91, 255)
			})
			text.addEffect(slot0.partnerNeed2, {
				color = cc.c4b(91, 84, 91, 255)
			})
		end

		slot0.partnerNeed2:text(gLanguageCsv.fishingLvTip2 .. slot1.needLv)
		slot0.partnerTxt:hide()

		if slot0.pokedex:read()[csv.unit[slot1.id].cardID] == nil then
			text.addEffect(slot0.partnerNeed1, {
				color = cc.c4b(183, 176, 158, 255)
			})
		else
			text.addEffect(slot0.partnerNeed1, {
				color = cc.c4b(91, 84, 91, 255)
			})
		end

		slot0.partnerBtnBuy:setTouchEnabled(slot1.needLv <= slot1.fishLevel and slot0.pokedex:read()[slot5.cardID] ~= nil)
		cache.setShader(slot0.partnerBtnBuy, false, slot1.needLv <= slot1.fishLevel and slot0.pokedex:read()[slot5.cardID] ~= nil and "normal" or "hsl_gray")

		slot6, slot7 = csvNext(slot1.cost)

		slot0.partnerCostCost2:text(slot7)
		slot0.partnerCostIcon:texture(dataEasy.getIconResByKey(slot6))
		adapt.oneLineCenterPos(cc.p(175, slot0.partnerCostCost:y()), {
			slot0.partnerCostCost,
			slot0.partnerCostCost2,
			slot0.partnerCostIcon
		}, cc.p(5, 0))
		slot0.partnerBtnBuy:visible(slot1.isLock == nil)
		slot0.partnerBtnUse:visible(slot1.isLock ~= nil)
		slot0.partnerGetCost:visible(slot1.isLock == nil)
	end
end

function slot2.onRodBtnBuy(slot0)
	slot2 = "num"

	if slot0.itemDatas:atproxy(slot0.selectItem:read()).typ == 1 then
		slot2 = nil
	end

	slot4, slot5 = csvNext(slot1.cost)

	gGameUI:stackUI("common.buy_info", nil, , {
		[slot4] = slot5
	}, {
		id = slot1.id
	}, {}, slot0:createHandler("rodBuyInfo"))
end

function slot2.rodBuyInfo(slot0, slot1)
	gGameApp:requestServer("/game/fishing/item/unlock", function (slot0)
		gGameUI:showTip(gLanguageCsv.hasBuy)
	end, "rod", slot0.itemDatas:atproxy(slot0.selectItem:read()).csvID)
end

function slot2.onBaitBtnBuy(slot0)
	slot1 = slot0.itemDatas:atproxy(slot0.selectItem:read())
	slot3, slot4 = csvNext(slot1.cost)

	gGameUI:stackUI("common.buy_info", nil, , {
		[slot3] = slot4
	}, {
		id = slot1.id
	}, {
		contentType = "num"
	}, slot0:createHandler("baitBuyInfo"))
end

function slot2.baitBuyInfo(slot0, slot1)
	gGameApp:requestServer("/game/fishing/bait/buy", function (slot0)
		gGameUI:showTip(gLanguageCsv.hasBuy)
	end, slot0.itemDatas:atproxy(slot0.selectItem:read()).csvID, slot1)
end

function slot2.onPartnerBtnBuy(slot0)
	slot2, slot3 = csvNext(slot0.itemDatas:atproxy(slot0.selectItem:read()).cost)

	if slot2 == "rmb" and slot0.rmb:read() < slot3 then
		uiEasy.showDialog("rmb")
	elseif slot2 == "gold" and slot0.gold:read() < slot3 then
		uiEasy.showDialog("gold")
	else
		slot4 = "partner"

		if slot2 == "rmb" then
			dataEasy.sureUsingDiamonds(function ()
				uv4 = "gGameApp"
				uv5 = "requestServer"

				gGameApp:requestServer("/game/fishing/item/unlock", function (slot0)
					gGameUI:showTip(gLanguageCsv.hasBuy)
				end, slot4, slot5.csvID)
			end, slot3)
		else
			slot5()
		end
	end
end

function slot2.onBtnUse(slot0)
	slot1 = {
		"rod",
		"bait",
		"partner"
	}

	if slot0.itemDatas:atproxy(slot0.selectItem:read()).isLock == nil then
		gGameUI:showTip(gLanguageCsv.noBaitCount)

		return
	end

	if slot2.typ == 1 and slot0.selectRod:read() == slot2.csvID or slot2.typ == 2 and slot0.selectBait:read() == slot2.csvID or slot2.typ == 3 and slot0.selectPartner:read() == slot2.csvID then
		gGameUI:showTip(gLanguageCsv.useSuccess)
	elseif slot0.isAuto:read() == true then
		gGameUI:showTip(gLanguageCsv.switchToolsNeedStopAutoFishing)
	else
		gGameApp:requestServer("/game/fishing/prepare", function (slot0)
			gGameUI:showTip(gLanguageCsv.useSuccess)
		end, slot1[slot2.typ], slot2.csvID)
	end
end

function slot2.onSelectClick(slot0, slot1, slot2)
	slot0.selectItemRefresh = true

	dataEasy.tryCallFunc(slot0.list, "setItemAction", {
		isAction = true
	})
	slot0.showTab:set(slot2)
end

function slot2.onItemClick(slot0, slot1, slot2, slot3)
	slot2.data = slot3

	slot0.selectItem:set(slot2.k)
end

function slot2.initModel(slot0)
	slot0.fishLevel = gGameModel.fishing:getIdler("level")
	slot0.partner = gGameModel.fishing:getIdler("partner")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.selectRod = gGameModel.fishing:getIdler("select_rod")
	slot0.selectBait = gGameModel.fishing:getIdler("select_bait")
	slot0.selectPartner = gGameModel.fishing:getIdler("select_partner")
	slot0.pokedex = gGameModel.role:getIdler("pokedex")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.isAuto = gGameModel.fishing:getIdler("is_auto")
end

return slot2
