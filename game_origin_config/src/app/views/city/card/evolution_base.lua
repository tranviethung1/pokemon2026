function slot0(slot0, slot1)
	slot2 = csv.unit[slot1.unitID]
	slot3 = slot0.cardImg:size()

	slot0.cardImg:removeAllChildren()

	slot4 = widget.addAnimation(slot0.cardImg, slot2.unitRes, "standby_loop")

	slot4:xy(slot3.width / 2, slot3.height / 7):scale(slot2.scale)
	slot4:setSkin(slot2.skin)
	slot0.name:text(slot2.name):show():setTextColor(ui.COLORS.NORMAL.DEFAULT)
	adapt.setTextScaleWithWidth(slot0.name, nil, 350)
	slot0.attr2:visible(slot2.natureType2 ~= nil)

	if slot2.natureType2 then
		slot0.attr2:texture(ui.ATTR_ICON[slot2.natureType2])
	end

	itertools.invoke({
		slot0.rarity,
		slot0.attr1
	}, "show")
	slot0.rarity:texture(ui.RARITY_ICON[slot2.rarity])
	slot0.attr1:texture(ui.ATTR_ICON[slot2.natureType])

	if slot2.natureType2 then
		adapt.oneLineCenterPos(cc.p(290, 80), {
			slot0.rarity,
			slot0.name,
			slot0.attr1,
			slot0.attr2
		}, cc.p(8, 0))
	else
		adapt.oneLineCenterPos(cc.p(290, 80), {
			slot0.rarity,
			slot0.name,
			slot0.attr1
		}, cc.p(8, 0))
	end
end

function slot1(slot0, slot1)
	slot2 = slot0:get("cardImg")

	ccui.ImageView:create("city/card/evolution/img_unknown@.png"):align(cc.p(0.5, 0.5), slot2:x() - 35, slot2:y() * 0.55):addTo(slot2, 2, "ball")
	slot0:get("btnSelect"):visible(false)
	slot0:get("btnChanceShape"):visible(false)
	nodetools.invoke(slot0, {
		"attr2",
		"attr1",
		"rarity",
		"name"
	}, "hide")

	if slot1 then
		slot0:get("name"):text(gLanguageCsv.appearBranch):show()
		slot0:get("name"):setTextColor(ui.COLORS.NORMAL.RED)
		slot0:get("name"):x(slot0:get("name"):x() + 30)
	end
end

function slot2(slot0)
	slot1 = slot0
	slot2 = itertools.size(slot0.branch)

	if slot0.branch[slot0.currBranch] then
		slot1 = slot0.branch[slot0.currBranch]
	end

	return slot1
end

function slot3(slot0, slot1)
	uv2 = "cardImg"
	slot2 = slot2(slot1)

	if slot0.cardImg:get("ball") then
		slot0.cardImg:get("ball"):hide()
	end

	uv3 = "get"

	slot3(slot0, slot2)
end

slot4 = cc.load("mvc").ViewBase
slot5 = class("CardEvolutionBaseView", Dialog)
slot5.RESOURCE_FILENAME = "card_evolution.json"
slot5.RESOURCE_BINDING = {
	["bottomPanel.icon"] = "bottomIcon",
	branchPanel = "branchPanel",
	["bottomPanel.txt1"] = "txt1",
	["bottomPanel.txtNot1"] = "txtNot1",
	["bottomPanel.txtNot2"] = "txtNot2",
	["bottomPanel.txt2"] = "txt2",
	item1 = "item1",
	item = "item",
	["bottomPanel.txt3"] = "txt3",
	lastTxt = "lastTxt",
	bottomPanel = "bottomPanel",
	effect = {
		varname = "effect",
		binds = {
			event = "visible",
			idler = bindHelper.self("showEffect")
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData"),
				item = bindHelper.self("item"),
				margin = bindHelper.self("listMargin"),
				padding = bindHelper.self("listPadding"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot8 = "cardImg"
					slot4 = slot1:multiget("btnSelect", "next", slot8, "name", "attr1", "attr2", "rarity", "curr", "bottom", "btnSelection", "btnChangeShape", "btnChanceShape")

					for slot8 = 1, 3 do
						slot1:removeChildByName("effect" .. slot8)
					end

					slot5 = slot3.develop == slot3.currDevelop

					bind.touch(slot0, slot4.btnSelect, {
						methods = {
							ended = functools.partial(slot0.clickSelect, slot2)
						}
					})
					bind.touch(slot0, slot4.btnSelection, {
						methods = {
							ended = functools.partial(slot0.clickSelection, slot2)
						}
					})
					bind.touch(slot0, slot4.btnChangeShape, {
						methods = {
							ended = functools.partial(slot0.clickChangeShape, slot2)
						}
					})
					bind.touch(slot0, slot4.btnChanceShape, {
						methods = {
							ended = functools.partial(slot0.clickChangeShape, slot2)
						}
					})
					slot4.curr:visible(false)

					slot6 = slot1:size()
					slot7 = CSprite.new("effect/jinhuajiemian.skel")

					slot7:xy(slot6.width / 2 - 40, slot6.height / 4 - 15)
					slot7:play("effect_down2_loop")
					slot7:addTo(slot1, 4, "effect1")
					slot7:visible(slot5)

					slot8 = CSprite.new("effect/jinhuajiemian.skel")

					slot8:xy(slot6.width / 2 - 40, slot6.height / 4 - 15)
					slot8:play("effect_down_loop")
					slot8:addTo(slot1, 5, "effect2")
					slot8:visible(slot5)

					slot9 = CSprite.new("effect/jinhuajiemian.skel")

					slot9:xy(slot6.width / 2 - 40, slot6.height / 4 - 15)
					slot9:play("effect_up_loop")
					slot9:addTo(slot1, 7, "effect3")
					slot9:visible(slot5)
					slot4.bottom:visible(not slot5)

					if slot3.develop <= slot3.currDevelop then
						if slot4.cardImg:get("ball") then
							slot4.cardImg:get("ball"):hide()
						end

						if slot3.currDevelop == slot3.maxDevelop then
							if slot3.isBranch and slot3.cardSwitchBranch and slot3.develop == slot3.maxDevelop and itertools.size(slot3.branch) > 1 then
								if slot3.branchType == 1 then
									slot4.btnSelection:show()
								elseif slot3.branchType == 2 then
									slot4.btnChangeShape:show()
								end
							else
								slot4.btnSelection:hide()
								slot4.btnChangeShape:hide()
							end
						elseif slot3.isBranch and slot3.cardSwitchBranch and itertools.size(slot3.branch) > 1 then
							if slot3.branchType == 1 then
								slot4.btnSelection:show()
							elseif slot3.branchType == 2 then
								slot4.btnChangeShape:show()
							end
						else
							slot4.btnSelection:hide()
							slot4.btnChangeShape:hide()
						end

						uv10 = "multiget"
						uv12 = "btnSelect"

						slot10(slot4, slot12(slot3))
						slot4.btnSelect:hide()
						slot4.btnChanceShape:hide()
					else
						slot4.btnSelect:visible(itertools.size(slot3.branch) > 1 and slot3.isBranchPoint and slot3.branchType == 1)
						slot4.btnChanceShape:visible(slot10 > 1 and slot3.isBranchPoint and slot3.branchType == 2)

						if not slot3.branch[slot3.currBranch] and slot10 > 1 then
							uv11 = "next"

							slot11(slot1)
						else
							uv11 = "cardImg"

							slot11(slot4, slot3)
						end
					end

					slot4.next:visible(slot2 ~= 1)
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()

					if slot0:getChildrenCount() > 3 then
						slot0:jumpToPercentHorizontal(80)
					end

					slot0:adaptTouchEnabled()
				end
			},
			handlers = {
				clickSelect = bindHelper.self("onSelectBranch"),
				clickSelection = bindHelper.self("onChangeBranch"),
				clickChangeShape = bindHelper.self("onChangeShape")
			}
		}
	},
	["bottomPanel.list"] = {
		varname = "bottomList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 20,
				data = bindHelper.self("showSmallData"),
				item = bindHelper.self("item1"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = dataEasy.getNumByKey(slot3.id)

					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.id,
								num = slot4,
								targetNum = slot3.num
							},
							grayState = slot3.num <= slot4 and 1 or 0
						}
					})
					slot1.panel:setTouchEnabled(false)
					nodetools.invoke(slot1, {
						"mask",
						"add"
					}, "visible", slot4 < slot3.num)
					bind.touch(slot1, slot1, {
						methods = {
							ended = function ()
								uv5 = "gGameUI"
								uv7 = "gGameUI"

								gGameUI:stackUI("common.gain_way", nil, , slot5.id, nil, slot7.num)
							end
						}
					})
				end
			}
		}
	},
	["bottomPanel.num"] = {
		varname = "cost",
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.DEFAULT
			}
		}
	},
	["branchPanel.btnBranch"] = {
		varname = "btnBranch",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSelectBranch")
			}
		}
	},
	["bottomPanel.btnEvolution"] = {
		varname = "btnEvolution",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEvolution")
			}
		}
	},
	["bottomPanel.btnEvolution.title"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot5.onCreate(slot0, slot1)
	slot0.update = idler.new(false)
	slot0.selectDbId = slot1

	slot0:initModel()

	slot0.cardSwitchBranch = dataEasy.isUnlock(gUnlockCsv.cardSwitchBranch)
	slot0.canClick = true
	slot0.showEffect = idler.new(false)
	slot2 = slot0.list:x()
	slot0.showSmallData = idlertable.new({})
	slot3 = {
		slot2 + 680,
		slot2 + 350,
		slot2
	}
	slot0.showData = idlertable.new()
	slot0.currDevelop = idler.new()
	slot4 = userDefault.getForeverLocalKey("evolutionBranch", {})

	if csv.cards[slot0.cardId:read()].branch == 0 and slot4[slot0.cardId:read()] then
		slot6 = slot4[slot0.cardId:read()]
	end

	slot0.currBranch = idler.new(slot6)

	slot0:setDevelopData()

	slot0.maxDevelop = #slot0.mainData
	slot0.oldCurrBranch = slot6

	idlereasy.when(slot0.update, function (slot0, slot1)
		uv2 = "initModel"

		slot2:initModel()
	end)
	idlereasy.when(slot0.cardId, function (slot0, slot1)
		uv2 = "setDevelopData"
		slot3 = slot2
		slot2 = slot2.setDevelopData

		slot2(slot3)

		uv2 = "setDevelopData"
		uv3 = "setDevelopData"
		slot3 = #slot3.mainData
		slot2.maxDevelop = slot3
		uv2 = "setDevelopData"
		uv3 = "maxDevelop"
		slot2.oldCurrBranch = slot3
		uv3 = "setDevelopData"
		slot3 = slot3.cardId:read()
		uv3 = "setDevelopData"

		slot3.currBranch:set(csv.cards[slot3].branch, true)
	end)
	idlereasy.when(slot0.currBranch, function (slot0, slot1)
		uv2 = "cardId"
		slot3 = csv.cards[slot2.cardId:read()]
		slot4 = slot3.cardMarkID
		slot5 = slot3.develop
		uv6 = "cardId"
		slot8 = slot3.develop

		slot6.currDevelop:set(slot8)

		slot6 = {}
		uv8 = "cardId"

		for slot10, slot11 in ipairs(slot8.mainData) do
			if slot1 ~= 0 and not slot11.branch[slot1] and itertools.size(slot11.branch) ~= 0 then
				break
			end

			uv14 = "cardId"

			if slot14.maxDevelop < slot11.develop then
				uv13 = "cardId"
				slot13.maxDevelop = slot11.develop
			end

			if slot11.branch[slot1] then
				uv14 = "cardId"

				if slot14.maxDevelop < slot11.branch[slot1].develop then
					uv13 = "cardId"
					slot13.maxDevelop = slot11.branch[slot1].develop
				end
			end

			slot11.isBranchPoint = false

			if slot12 > 1 and slot1 ~= 0 and slot11.branch[slot1].id == slot2 then
				uv13 = "cardId"

				if slot13.oldCurrBranch ~= 0 then
					slot11.isBranchPoint = true
					slot13 = uiEasy.showConfirmNature
					uv15 = "cardId"

					slot13(slot11.branch[slot15.oldCurrBranch].unitID, slot11.branch[slot1].unitID)

					uv13 = "cardId"
					slot13.oldCurrBranch = slot1
				end
			end

			slot11.currDevelop = slot5
			slot11.currBranch = slot1
			uv13 = "cardId"
			slot13.branchType = slot11.branchType

			table.insert(slot6, slot11)
		end

		slot7 = table.sort

		slot7(slot6, function (slot0, slot1)
			return slot0.develop < slot1.develop
		end)

		uv7 = "cardId"
		slot7.developPos = 1

		for slot10, slot11 in ipairs(slot6) do
			if slot2 == slot11.id then
				uv12 = "cardId"
				slot12.developPos = slot10
			end

			for slot15, slot16 in pairs(slot11.branch) do
				if slot2 == slot16.id then
					uv17 = "cardId"
					slot17.developPos = slot10
				end
			end
		end

		uv7 = "cardId"

		slot7.showData:set(slot6, true)

		uv8 = "cardId"
		slot8.listPadding = #slot6 <= 1 and 120 or 0

		if slot1 ~= 0 then
			uv8 = "cardId"
			slot8 = slot8.list
			slot8 = slot8.setTouchEnabled

			slot8(slot8, slot7 > 3)

			uv8 = "cardId"
			slot8.listMargin = slot7 <= 3 and 2 or -12
		else
			uv8 = "cardId"
			slot8 = slot8.list
			slot8 = slot8.setTouchEnabled

			slot8(slot8, slot7 > 3)

			uv8 = "cardId"
			slot8.listMargin = slot7 <= 3 and 2 or -12
		end

		uv8 = "cardId"

		slot8:bottomPanelRefresh(slot1, slot5)
	end)
	Dialog.onCreate(slot0)
end

function slot5.initModel(slot0)
	slot1 = gGameModel.cards:find(slot0.selectDbId)
	slot0.attrs = slot1:getIdler("attrs")
	slot0.oldFight = slot1:getIdler("fighting_point")
	slot0.cardId = slot1:getIdler("card_id")
	slot0.star = slot1:getIdler("star")
	slot0.advance = slot1:getIdler("advance")
	slot0.level = slot1:getIdler("level")
end

function slot5.setDevelopData(slot0)
	slot0.cardMaskData = {}
	slot0.mainData = {}
	slot0.branchData = {}

	for slot7, slot8 in orderCsvPairs(csv.cards) do
		if matchLanguageForce(slot8.languages) and slot8.canDevelop and slot8.cardMarkID == csv.cards[slot0.cardId:read()].cardMarkID and 0 < slot8.develop then
			slot3 = slot8.develop
		end
	end

	for slot7, slot8 in orderCsvPairs(csv.cards) do
		if matchLanguageForce(slot8.languages) and slot8.canDevelop and slot8.cardMarkID == slot2 then
			if not slot0.cardMaskData[slot8.cardMarkID] then
				slot0.cardMaskData[slot8.cardMarkID] = {}
			end

			table.insert(slot0.cardMaskData[slot8.cardMarkID], slot7)

			if not slot0.branchData[slot8.branch] then
				slot0.branchData[slot8.branch] = {}
			end

			slot9 = false

			if slot8.branch ~= 0 then
				slot9 = true
			end

			table.insert(slot0.branchData[slot8.branch], {
				currBranch = 0,
				isBranchPoint = false,
				currDevelop = slot8.develop,
				currRealBranch = slot8.branch,
				id = slot7,
				unitID = slot8.unitID,
				cardMarkID = slot8.cardMarkID,
				develop = slot8.develop,
				branch = {},
				megaIndex = slot8.megaIndex,
				isBranch = slot9,
				cardSwitchBranch = slot0.cardSwitchBranch,
				branchType = slot8.branchType,
				maxDevelop = slot3
			})
		end
	end

	slot5 = {}

	for slot9, slot10 in pairs(slot0.branchData) do
		if slot9 ~= 0 and 0 < #slot10 then
			slot4 = #slot10
			slot5 = slot10
		end
	end

	table.sort(slot5, function (slot0, slot1)
		return slot0.develop < slot1.develop
	end)

	slot0.mainData = slot0.branchData[0] or {}

	for slot9 = 1, slot4 do
		slot10 = slot5[slot9]

		for slot14, slot15 in pairs(slot0.branchData) do
			table.sort(slot15, function (slot0, slot1)
				return slot0.develop < slot1.develop
			end)

			if slot14 ~= 0 and slot15[slot9] then
				slot10.branch[slot15[slot9].currRealBranch] = slot15[slot9]
			end
		end

		table.insert(slot0.mainData, slot10)
	end

	slot7 = false
	slot8 = csv.cards[slot0.cardId:read()].megaIndex > 0 and true or false

	for slot12, slot13 in pairs(slot0.mainData) do
		if slot13.megaIndex == 0 then
			table.insert({}, slot13)
		else
			slot7 = true
		end
	end

	if not slot8 and slot7 then
		slot0.mainData = slot6
	end
end

function slot5.bottomPanelRefresh(slot0, slot1, slot2)
	slot3 = slot0.star:read()
	slot4 = slot0.level:read()
	slot5 = slot0.advance:read()
	slot6 = nil

	if slot0.showData:proxy()[slot0.developPos + 1] then
		uv8 = "star"
		slot6 = slot8(slot7).id
	end

	slot8 = csv.base_attribute.develop_level[slot6]

	if slot2 < slot0.maxDevelop and slot8 then
		slot9 = 0
		slot10 = {}

		for slot14, slot15 in csvMapPairs(slot8.cost) do
			if slot14 ~= "gold" then
				table.insert(slot10, {
					id = slot14,
					num = slot15
				})
			end
		end

		slot0.showSmallData:set(slot10, true)

		slot0.strs = {}

		function slot11(slot0, slot1)
			if slot1.base ~= 0 then
				slot2 = nil

				if not slot1.special then
					if not slot1.color then
						slot3 = {}

						for slot9 = 1, slot1.base > 6 and 6 or slot4 do
							if slot9 <= slot4 - 6 then
								table.insert(slot3, "#Icommon/icon/icon_star_z.png-50-50#")
							else
								table.insert(slot3, "#Icommon/icon/icon_star.png-50-50#")
							end
						end

						slot2 = slot1.str .. table.concat(slot3, "")
					else
						slot2 = string.format(slot1.str, slot1.color, slot1.state, slot1.base)
					end
				else
					slot3, slot4 = dataEasy.getQuality(slot1.base, false)
					slot2 = string.format(slot1.str, ui.QUALITYCOLOR[slot3], gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot3]], slot4)
				end

				table.insert(slot0, {
					str = slot2,
					state = slot1.base <= slot1.state and 1 or 0,
					tip = slot1.tip
				})
			end
		end

		slot12 = "#C0x60C456#"

		if slot4 < slot8.needLevel then
			slot12 = "#C0xF76B45#"
		end

		if slot8.needLevel ~= 0 then
			slot11(slot0.strs, {
				str = gLanguageCsv.cardLevelArrive,
				state = slot4,
				base = slot8.needLevel,
				tip = gLanguageCsv.spriteEvolutionLevelNotEnough,
				color = slot12
			})
		end

		if slot8.needStar ~= 0 then
			slot11(slot0.strs, {
				str = gLanguageCsv.cardStarArrive,
				state = slot3,
				base = slot8.needStar,
				tip = gLanguageCsv.spriteEvolutionStarNotEnough
			})
		end

		if slot8.needAdvance ~= 0 then
			slot11(slot0.strs, {
				special = true,
				str = gLanguageCsv.cardAdvanceArrive,
				state = slot5,
				base = slot8.needAdvance,
				tip = gLanguageCsv.spriteEvolutionAdvanceNotEnough
			})
		end

		table.sort(slot0.strs, function (slot0, slot1)
			return slot0.state < slot1.state
		end)

		for slot16 = 1, 2 do
			slot0["txt" .. slot16]:visible(false)
			slot0["txtNot" .. slot16]:visible(false)
			slot0.bottomPanel:removeChildByName("richText" .. slot16)
		end

		slot16 = 2

		for slot16 = 1, math.min(#slot0.strs, slot16) do
			slot17, slot18 = slot0["txt" .. slot16]:xy()
			slot19 = "#C0x5B545B#" .. slot16 .. "." .. slot0.strs[slot16].str
			slot20 = " #Icity/card/evolution/logo_tick1.png#"

			if slot0.strs[slot16].state ~= 1 then
				slot20 = "#C0xF76B45#" .. gLanguageCsv.notFinished
			end

			slot21 = rich.createWithWidth(slot19 .. slot20, 40, nil, 1100):anchorPoint(0, 0.5):xy(slot17, slot18):addTo(slot0.bottomPanel, 10, "richText" .. slot16)
		end

		if slot8.cost.gold and slot8.cost.gold ~= 0 then
			slot0.cost:text(slot8.cost.gold)
			slot0.cost:show()
			slot0.bottomIcon:show()
			slot0.txt3:show()
			adapt.oneLineCenterPos(cc.p(slot0.btnEvolution:x(), slot0.btnEvolution:y() + 90), {
				slot0.txt3,
				slot0.cost,
				slot0.bottomIcon
			}, cc.p(10, 0))
			idlereasy.when(gGameModel.role:getIdler("gold"), function (slot0, slot1)
				uv2 = "enoughGold"
				uv3 = "cost"
				slot2.enoughGold = slot3.cost.gold <= slot1
				uv2 = "enoughGold"
				uv4 = "enoughGold"

				slot2.cost:setTextColor(slot4.enoughGold and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.NORMAL.RED)
			end):anonyOnly(slot0, "gold")
		else
			slot0.cost:hide()
			slot0.bottomIcon:hide()
			slot0.txt3:hide()
		end
	end

	slot0:bottomPanelBranchRefresh(slot1, slot2, slot7)
end

function slot5.bottomPanelBranchRefresh(slot0, slot1, slot2, slot3)
	slot4 = slot3 and (slot3.branch[slot1] ~= nil or itertools.size(slot3.branch) <= 1)

	slot0.bottomPanel:visible(slot2 ~= slot0.maxDevelop and slot4)
	slot0.branchPanel:visible(slot2 ~= slot0.maxDevelop and not slot4)

	if slot0.branchType == 2 then
		slot0.branchPanel:get("txt"):text(gLanguageCsv.succeedChanceChangeShapeText)
		adapt.setTextScaleWithWidth(slot0.btnBranch:get("title"), gLanguageCsv.shapeLookText, 300)
	end

	slot0.cardMega = false
	slot5 = false

	for slot10, slot11 in pairs(slot0.cardMaskData[csv.cards[slot0.cardId:read()].cardMarkID]) do
		if csv.cards[slot11].megaIndex > 0 then
			slot5 = true
		end
	end

	if slot5 and slot2 == slot0.maxDevelop and dataEasy.isUnlock(gUnlockCsv.mega) and csv.cards[slot0.cardId:read()].megaIndex == 0 then
		slot0.branchPanel:visible(true)
		slot0.branchPanel:get("txt"):visible(false)
		adapt.setTextScaleWithWidth(slot0.btnBranch:get("title"), gLanguageCsv.megaHouse, 300)

		slot0.cardMega = true

		slot0.lastTxt:visible(false)
	elseif slot2 == slot0.maxDevelop then
		slot0.lastTxt:visible(true)
		slot0.branchPanel:get("txt"):visible(true)
	else
		slot0.lastTxt:visible(false)
	end
end

function slot5.onSelectBranch(slot0, slot1)
	if csv.card_mega[csv.cards[slot0.cardId:read()].megaIndex] and slot3.type == 2 then
		if gGameModel.cards:find(slot0.selectDbId):read("branch_unlock") == false then
			gGameUI:showDialog({
				fontSize = 50,
				btnType = 2,
				isRich = true,
				title = gLanguageCsv.spaceTips,
				content = gLanguageCsv.branchRouteUnlock,
				cb = function ()
					uv5 = "gGameUI"
					slot5 = slot5.cardId
					slot6 = slot5
					uv6 = "gGameUI"

					gGameUI:stackUI("city.card.mega.view", nil, {
						full = true
					}, slot5.read(slot6), slot6:createHandler("updateDbid"))
				end
			})

			return
		elseif slot5 == true then
			gGameUI:stackUI("city.card.evolution_branch", nil, , slot0:createHandler("sendParams"))
		end

		return
	end

	if not slot0.cardMega or slot1 == true then
		if slot0.branchType == 1 then
			gGameUI:stackUI("city.card.evolution_branch", nil, , slot0:createHandler("sendParams"))
		else
			gGameUI:stackUI("city.card.evolution_change_shape", nil, , slot0:createHandler("sendParams"))
		end
	else
		gGameUI:stackUI("city.card.mega.view", nil, {
			full = true
		}, slot0.cardId:read(), slot0:createHandler("updateDbid"))
	end
end

function slot5.onChangeBranch(slot0)
	slot0:onSelectBranch(true)
end

function slot5.onChangeShape(slot0)
	slot0:onSelectBranch(true)
end

function slot5.playAction(slot0, slot1)
	slot0.showEffect:set(true)
	(slot0.effect:getChildByName("effect1") or widget.addAnimationByKey(slot0.effect, "effect/jinhua.skel", "effect1", "effect_down", 1):scale(2):alignCenter(slot0.effect:size())):play("effect_down")
	CSprite.new("effect/jinhua.skel")
	(slot0.effect:getChildByName("effect2") or widget.addAnimationByKey(slot0.effect, "effect/jinhua.skel", "effect2", "effect_up", 3):scale(2):alignCenter(slot0.effect:size())):play("effect_up")

	slot4 = slot0.developPos
	slot6 = slot0.developPos - 1
	uv6 = "showEffect"
	slot7 = csv.unit[slot6(slot0.showData:proxy()[slot6]).unitID]

	slot0.effect:removeChildByName("roleSpine")

	slot8 = widget.addAnimationByKey(slot0.effect, slot7.unitRes, "roleSpine", "standby_loop", 2):alignCenter(slot0.effect:size()):y(380):scale(slot7.scale)

	slot8:setSkin(slot7.skin)
	slot8:setCascadeOpacityEnabled(true)
	performWithDelay(slot0.effect, function ()
		uv1 = "transition"

		transition.fadeOut(slot1, {
			time = 0.16666666666666666
		})
	end, 0.9666666666666667)
	performWithDelay(slot0.effect, function ()
		uv0 = "effect"
		slot0 = slot0.effect
		slot0 = slot0.removeChildByName

		slot0(slot0, "roleSpine")

		uv0 = "effect"
		slot0 = slot0.showData
		slot1 = slot0
		uv1 = "effect"
		slot1 = slot1.developPos
		uv1 = "removeChildByName"
		slot2 = csv.unit[slot1(slot0.proxy(slot1)[slot1]).unitID]
		uv4 = "effect"
		slot5 = slot2.unitRes
		uv5 = "effect"

		widget.addAnimationByKey(slot4.effect, slot5, "roleSpine", "standby_loop", 2):alignCenter(slot5.effect:size()):y(380):scale(slot2.scale):setSkin(slot2.skin)
	end, 8.6)
	performWithDelay(slot0.effect, function ()
		uv0 = "showEffect"
		slot0 = slot0.showEffect
		slot0 = slot0.set

		slot0(slot0, false)

		uv0 = "set"

		if slot0 then
			uv0 = "set"

			slot0()
		end
	end, 11.5)
end

function slot5.onEvolution(slot0)
	if not slot0.canClick then
		return
	end

	slot1 = slot0.cardId:read()

	for slot5, slot6 in ipairs(slot0.strs) do
		if slot6.state == 0 then
			gGameUI:showTip(slot6.tip)

			return
		end
	end

	if not slot0.enoughGold then
		uiEasy.showDialog("gold")

		return
	end

	slot0.canClick = false
	slot2 = {
		false
	}
	slot3 = slot0.showData:proxy()[slot0.developPos + 1]
	slot4 = slot3.currRealBranch

	if slot3.branch[slot0.currBranch:read()] then
		slot4 = slot3.branch[slot0.currBranch:read()].currRealBranch
	end

	slot5 = slot0.oldFight:read()
	slot6 = clone(slot0.attrs:read())

	gGameApp:requestServerCustom("/game/card/develop"):params(slot0.selectDbId, slot4):delay(0.1):doit(function ()
		slot0 = audio.playEffectWithWeekBGM

		slot0("evolution.mp3")

		uv0 = "audio"

		slot0:playAction(function ()
			uv0 = "canClick"
			slot0.canClick = true
			uv5 = "canClick"
			uv6 = "gGameUI"
			uv8 = "stackUI"
			uv8 = "city.card.common_success"

			gGameUI:stackUI("city.card.common_success", nil, {
				blackLayer = true
			}, slot5.selectDbId, slot6, {
				cardOld = slot8,
				attrs = slot8
			})
		end)
	end)
end

function slot5.sendParams(slot0, slot1)
	if slot1 then
		slot0.currBranch:set(slot1)
	end

	return slot0.currDevelop:read(), slot0.mainData, slot0.currBranch:read(), slot0.selectDbId, slot0.currBranch
end

function slot5.updateDbid(slot0)
	slot0.update:set(not slot0.update:read())
end

return slot5
