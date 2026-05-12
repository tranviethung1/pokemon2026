function slot0(slot0, slot1, slot2, slot3)
	if slot2 then
		slot0:text(slot2)
	end

	if slot3 then
		slot1:text(slot3)
	end

	adapt.oneLinePos(slot0, slot1)
end

function slot1(slot0, slot1)
	if not slot1 then
		return 0
	end

	for slot6, slot7 in ipairs(slot0) do
		if slot7[slot1] then
			slot2 = slot2 + slot7[slot1]
		else
			for slot11, slot12 in pairs(slot7.items or {}) do
				if slot11 == slot1 then
					slot2 = slot2 + slot12
				end
			end
		end
	end

	return slot2
end

slot2 = cc.load("mvc").ViewBase
slot3 = class("GateSweepView", Dialog)
slot3.RESOURCE_FILENAME = "gate_sweep.json"
slot3.RESOURCE_BINDING = {
	["sweepInfo.textNoteNum1"] = "textNoteNum1",
	["title.textNote1"] = "titleNode1",
	itemTitle = "itemTitle",
	["sweepInfo.textNoteNum2"] = "textNoteNum2",
	["title.textNote2"] = "titleNode2",
	imgBG = "imgBG",
	item1 = "item1",
	successItem = "successItem",
	bottomItem = "bottomItem",
	item = "item",
	list = "list",
	innerList = "innerList",
	["item.textTip"] = "textTip",
	["title.btnClose"] = {
		varname = "btnClose",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSpeedClick")
			}
		}
	},
	btnSure = {
		varname = "sureBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["sureBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["againBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	btnAgain = {
		varname = "againBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAgainClick")
			}
		}
	},
	panelBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSpeedClick")
			}
		}
	},
	sweepInfo = {
		varname = "sweepInfo",
		binds = {
			event = "visible",
			idler = bindHelper.self("isShowTargetInfo")
		}
	},
	bottomList = {
		varname = "bottomList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				preloadBottom = true,
				asyncPreload = 6,
				data = bindHelper.self("bottomDatas"),
				item = bindHelper.self("bottomItem"),
				item1 = bindHelper.self("item1"),
				startGateId = bindHelper.self("startGateId"),
				isDouble = bindHelper.self("isDouble"),
				innerList = bindHelper.self("innerList"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("textTitle", "innerList")

					if slot3.effect then
						slot4.textTitle:hide()
						slot4.innerList:hide()

						slot5 = slot1:size()
						slot6 = CSprite.new("level/saodangchenggong.skel")

						slot6:addTo(slot1, 100)
						slot6:setAnchorPoint(cc.p(0.5, 0.5))
						slot6:xy(slot5.width / 2, slot5.height / 2)
						slot6:visible(true)
						slot6:play("saodangchenggong")
						slot6:addPlay("saodangchenggong_loop")
						slot6:retain()
					else
						slot5 = ""

						slot4.textTitle:text((not slot3.isTotal or gLanguageCsv.totalGot) and csv.endless_tower_scene[slot0.startGateId + slot2 - 1].sceneName)

						slot6 = slot3.items

						if slot3.gold and not slot6.gold then
							slot6.gold = slot3.gold
						end

						slot7 = {}

						for slot11, slot12 in pairs(slot6) do
							if slot11 == "gold" then
								-- Nothing
							elseif slot11 == 452 then
								slot13.sort = 2
							elseif slot11 == 451 then
								slot13.sort = 3
							elseif type(slot11) ~= "number" then
								slot13.sort = 4
							else
								slot13.sort = slot11 + 4
							end

							table.insert(slot7, {
								key = slot11,
								value = slot12,
								sort = 1
							})
						end

						table.sort(slot7, function (slot0, slot1)
							return slot0.sort < slot1.sort
						end)

						slot8 = nil
						slot10 = 6
						slot11 = math.ceil(itertools.size(slot6) / 6)
						slot12 = slot0.innerList:height() * slot11 + slot4.innerList:getItemsMargin() * (slot11 - 1)

						slot1:height(slot1:height() + slot12 - slot0.innerList:height())
						slot4.innerList:height(slot12)

						slot16 = slot0.innerList
						slot17 = slot16
						slot16 = slot16.height(slot17)

						slot4.textTitle:y(slot4.textTitle:y() + slot12 - slot16)

						for slot16, slot17 in pairs(slot7) do
							slot9 = 0 + 1
							slot18, slot19 = mathEasy.getRowCol(slot9, slot10)

							if slot9 % slot10 == 1 then
								slot4.innerList:pushBackCustomItem(slot0.innerList:clone():tag(slot18):show())
							end

							slot20 = slot0.item1:clone():show()

							bind.extend(slot0, slot20, {
								class = "icon_key",
								props = {
									data = {
										key = slot17.key,
										num = slot17.value
									},
									isDouble = slot0.isDouble,
									specialKey = {
										maxLimit = true
									}
								}
							})
							slot8:pushBackCustomItem(slot20)
						end
					end
				end
			}
		}
	}
}
slot3.RESOURCE_STYLES = {
	backGlass = true
}

function slot3.setEffect(slot0, slot1)
	slot2 = slot1:size()
	slot3 = CSprite.new("level/saodangchenggong.skel")

	slot3:addTo(slot1, 100)
	slot3:setAnchorPoint(cc.p(0.5, 0.5))
	slot3:xy(slot2.width / 2, slot2.height / 2)
	slot3:visible(true)
	slot3:hide()

	slot0.effect = slot3
end

function slot3.playEffect(slot0)
	if not slot0.effect then
		return
	end

	slot2 = slot0.from == "union"
	slot3 = slot2 and "tiaozhanchenggong" or "saodangchenggong"
	slot4 = slot2 and "tiaozhanchenggong_loop" or "saodangchenggong_loop"

	if slot0.from == "dailyAssistant" then
		slot3 = "saodangwancheng"
	end

	if slot5 then
		slot4 = "saodangwancheng_loop"
	end

	slot1:show()
	slot1:play(slot3)
	slot1:addPlay(slot4)
	slot1:retain()
end

function slot3.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.sweepTimes = 1
	slot0.prenumb1 = 0
	slot2 = 0
	slot0.prenumb2 = slot2
	uv2 = "initModel"

	slot2(slot0.titleNode1, slot0.titleNode2, slot1.title1, slot1.title2)

	slot0.sweepData = slot1.sweepData
	slot2 = slot1.sweepData
	slot3 = slot1.oldRoleLv
	slot4 = slot1.hasExtra
	slot5 = slot1.oldCapture
	slot6 = slot1.curMopUpNum or 0
	slot0.startGateId = slot1.startGateId or 100000
	slot0.cb = slot1.cb
	slot0.checkCb = slot1.checkCb
	slot0.from = slot1.from
	slot0.type = slot1.type
	slot7 = slot1.showType or 1
	slot0.isShowTargetInfo = idler.new(slot1.targetId ~= nil and slot1.targetNum ~= nil)
	slot0.isDouble = slot1.isDouble

	if slot0.from == "gate" or slot0.from == "gainWay" then
		slot0.gateId = slot1.gateId
	elseif slot0.from == "allGate" then
		slot0.gateId = slot1.sweepData[1].gateId
	end

	slot0.catchup = slot1.catchup

	if slot1.targetId and slot1.targetNum then
		uv8 = "sweepTimes"

		slot0.textNoteNum1:text(slot8(slot2, slot1.targetId))

		slot9 = dataEasy.getNumByKey(slot1.targetId)

		bind.extend(slot0, slot0.sweepInfo:get("item"), {
			class = "icon_key",
			props = {
				data = {
					key = slot1.targetId,
					num = slot9
				},
				specialKey = {
					maxLimit = true
				},
				onNode = function (slot0)
					slot0:scale(0.9)
				end
			}
		})

		if slot1.targetNum <= slot9 then
			slot10 = gLanguageCsv.material

			if dataEasy.isFragment(slot1.targetId) then
				slot10 = gLanguageCsv.fragment
			end

			slot11 = slot0.sweepInfo:get("textNote2")

			slot11:text(string.format(gLanguageCsv.hasEnoughItemOrFrag, slot10))
			adapt.setTextAdaptWithSize(slot11, {
				margin = -4,
				vertical = "center",
				horizontal = "left",
				size = cc.size(300, 100)
			})
			slot0.sweepInfo:get("textNoteNum2"):visible(false)
			slot0.sweepInfo:get("textNoteGe2"):visible(false)
		else
			slot0.textNoteNum2:text(slot1.targetNum - slot9)
		end
	end

	adapt.oneLinePos(slot0.sweepInfo:get("textNote1"), {
		slot0.textNoteNum1,
		slot0.sweepInfo:get("textNoteGe1")
	}, {
		cc.p(10, 0)
	}, "left")
	adapt.oneLinePos(slot0.sweepInfo:get("textNote2"), {
		slot0.textNoteNum2,
		slot0.sweepInfo:get("textNoteGe2")
	}, {
		cc.p(10, 0)
	}, "left")

	if slot7 == 2 then
		slot0.sureBtn:x(slot0.imgBG:x())
	end

	slot0.list:setScrollBarEnabled(false)
	slot0.innerList:setScrollBarEnabled(false)
	slot0.bottomList:setScrollBarEnabled(false)
	slot0.item:get("list"):setScrollBarEnabled(false)
	slot0.bottomItem:get("innerList"):setScrollBarEnabled(false)

	slot8 = gGameModel.capture:read("limit_sprites")
	slot9 = 0
	slot10 = 0
	slot0.interval = 0.1
	slot0.canClose = false

	slot0.btnClose:setTouchEnabled(false)
	slot0.againBtn:hide()
	slot0.sureBtn:hide()

	slot11 = itertools.size(slot2)

	if slot0.from == "endlessTower" then
		function ()
			uv0 = "againBtn"
			slot0 = slot0.againBtn
			slot0 = slot0.visible
			uv2 = "visible"

			slot0(slot0, slot2 == 1)

			uv0 = "againBtn"
			slot0 = slot0.sureBtn
			slot1 = slot0
			slot0 = slot0.show

			slot0(slot1)

			uv0 = "sureBtn"
			uv1 = "againBtn"

			if slot0 < slot1.roleLv:read() then
				uv5 = "sureBtn"

				gGameUI:stackUI("common.upgrade_notice", nil, , slot5)
			end

			uv1 = "againBtn"

			performWithDelay(slot1, function ()
				uv0 = "playEffect"

				slot0:playEffect()
				uiEasy.showMysteryShop()

				slot0 = uiEasy.showActivityBoss

				slot0()

				uv0 = "playEffect"
				slot0.canClose = true
				uv0 = "playEffect"

				slot0.btnClose:setTouchEnabled(true)

				if dataEasy.isUnlock(gUnlockCsv.limitCapture) then
					uv1 = "uiEasy"

					for slot3, slot4 in pairs(slot1) do
						if csv.capture.sprite[slot4.csv_id] and slot4.find_time + csv.capture.sprite[slot4.csv_id].time - time.getTime() > 0 and slot4.state == 1 then
							uv7 = "showMysteryShop"

							if not itertools.equal(slot4, slot7[slot3]) then
								gGameUI:stackUI("common.capture_tips")

								break
							end
						end
					end
				end
			end, 0.5)
		end()
		table.insert(slot2, {
			effect = true
		})

		slot0.bottomDatas = idlertable.new(slot2)

		slot0.list:hide()
	else
		slot0.bottomDatas = idlertable.new({})

		slot0.bottomList:hide()
		slot0:enableSchedule():schedule(function (slot0)
			uv1 = "interval"
			uv2 = "list"

			if slot2 <= slot1 then
				uv1 = "scrollToBottom"
				slot1.interval = 10
				uv3 = slot0
				uv1 = "scrollToBottom"
				slot1 = slot1.list
				slot1 = slot1.scrollToBottom

				slot1(slot1, 0.3, true)

				uv1 = "isExtra"

				slot1()

				return false
			end

			uv1 = "isDouble"
			uv3 = 0.3
			uv1 = "isDouble"

			if slot1 - slot0 <= 0 then
				uv1 = "interval"
				uv2 = "list"

				if slot1 < slot2 then
					uv1 = "scrollToBottom"
					uv3 = 0.3
					uv1 = "interval"
					uv0 = 0.3
					uv1 = "successItem"
					uv2 = "interval"
					uv2 = "scrollToBottom"
					slot2 = slot2.isDouble

					if ((slot1.interval + 1)[slot2] or {}).isExtra then
						uv3 = "scrollToBottom"
						slot3 = slot3.successItem:clone()
						slot4 = slot3
						slot3 = slot3.show(slot4)
						uv4 = "scrollToBottom"
						slot4 = slot4.setEffect

						slot4(slot4, slot3)

						uv4 = "scrollToBottom"
						slot4 = slot4.list
						slot4 = slot4.pushBackCustomItem

						slot4(slot4, slot3)

						uv4 = "clone"

						if slot4 == nil then
							uv6 = true
						end
					end

					uv3 = "interval"
					uv4 = "list"

					if slot3 == slot4 then
						uv3 = "show"
						slot3 = slot3.isTotal
					else
						slot3 = false
					end

					if slot1.textDatas then
						if slot1.dailyDatas and slot1.dailyDatas.hasTitle then
							uv4 = "scrollToBottom"
							uv6 = "interval"
							uv5 = "scrollToBottom"
							slot5 = slot4.list
							slot5 = slot5.pushBackCustomItem
							slot7 = slot4.cloneTitleItem(slot5, slot6, slot1.exp or 0, slot1.isExtra, slot3, slot1.dailyDatas)

							slot5(slot5, slot7)

							uv5 = "scrollToBottom"
							uv7 = "scrollToBottom"

							slot5.list:pushBackCustomItem(slot7:cloneTextItem(" ", {
								fontSize = 1
							}))
						end

						uv4 = "scrollToBottom"
						slot5 = slot4
						uv5 = "scrollToBottom"

						slot5.list:pushBackCustomItem(slot4.cloneTextItem(slot5, slot1.textDatas.content, slot1.textDatas.params or {}))
					else
						if not slot1.noTitle then
							uv4 = "scrollToBottom"
							uv6 = "interval"
							uv5 = "scrollToBottom"
							slot5 = slot4.list
							slot5 = slot5.pushBackCustomItem
							slot7 = slot4.cloneTitleItem(slot5, slot6, slot1.exp or 0, slot1.isExtra, slot3, slot1.dailyDatas)

							slot5(slot5, slot7)

							uv5 = "scrollToBottom"
							uv7 = "show"

							slot5:titleItemClone(slot7)
						end

						slot4 = slot1.items

						if slot1.gold and not slot4.gold then
							slot4.gold = slot1.gold
						end

						slot5 = nil
						slot6 = 0
						slot7 = 6
						slot8 = {}

						for slot12, slot13 in pairs(slot4) do
							slot14 = {
								key = slot12,
								value = slot13,
								type = "items"
							}

							if slot12 == "fish" then
								for slot18, slot19 in pairs(slot13) do
									table.insert(slot8, {
										key = slot18,
										value = slot19,
										type = "fish",
										sort = 5
									})
								end
							elseif slot12 == "cards" then
								for slot18, slot19 in pairs(slot13) do
									table.insert(slot8, {
										key = slot18,
										value = slot19,
										type = "cards",
										sort = 6
									})
								end
							elseif slot12 == "carddbIDs" then
								-- Nothing
							elseif slot12 ~= "contractdbIDs" then
								if slot12 == "gold" then
									slot14.sort = 1
								elseif slot12 == 452 then
									slot14.sort = 2
								elseif slot12 == 451 then
									slot14.sort = 3
								elseif type(slot12) ~= "number" then
									slot14.sort = 4
								else
									slot14.sort = slot12 + 4
								end

								table.insert(slot8, slot14)
							end
						end

						table.sort(slot8, function (slot0, slot1)
							return slot0.sort < slot1.sort
						end)

						slot10 = itertools.size(slot8) / 6
						uv10 = "scrollToBottom"
						slot11 = slot10
						uv13 = "interval"
						uv11 = "scrollToBottom"
						slot11 = slot11.list
						slot11 = slot11.pushBackCustomItem

						slot11(slot11, slot10.cloneItem(slot11, math.ceil(slot10), slot13, slot8))

						uv11 = "scrollToBottom"

						if slot11.catchup then
							uv11 = "scrollToBottom"

							if slot11.catchup > 0 then
								slot2 = true
								uv11 = "interval"
								uv12 = "scrollToBottom"

								if slot12.catchup < slot11 then
									slot2 = false
								end
							end
						end

						uv11 = "interval"
						uv12 = "list"

						if slot11 == slot12 then
							slot2 = false
						end

						for slot14, slot15 in pairs(slot8) do
							slot6 = slot6 + 1
							slot16, slot17 = mathEasy.getRowCol(slot6, slot7)

							if slot6 % slot7 == 1 then
								uv18 = "scrollToBottom"

								slot10:get("list"):pushBackCustomItem(slot18.innerList:clone():tag(slot16):show())
							end

							uv18 = "scrollToBottom"
							slot18 = slot18.item1:clone():tag(slot17):show()

							if slot2 and slot15.key ~= "gold" and csv.items[slot15.key] and slot20.isLimitDrop then
								slot19 = false
							end

							if slot15.type == "cards" then
								slot20 = csv.cards[slot15.value.id].unitID
								uv24 = "scrollToBottom"

								bind.extend(slot24, slot18, {
									class = "card_icon",
									props = {
										unitId = slot20,
										rarity = csv.unit[slot20].rarity,
										star = csv.cards[slot15.value.id].star,
										onNodeClick = function (slot0)
											uv1 = "onitemClick"
											uv4 = "value"

											slot1:onitemClick(slot0, slot4.value.id)
										end
									}
								})
							elseif slot15.type == "fish" then
								uv21 = "scrollToBottom"

								bind.extend(slot21, slot18, {
									class = "fish_icon",
									props = {
										onNodeClick = true,
										data = {
											key = slot15.key,
											num = slot15.value
										}
									}
								})
							else
								slot22 = {
									maxLimit = true
								}
								uv22 = "scrollToBottom"

								bind.extend(slot22, slot18, {
									class = "icon_key",
									props = {
										data = {
											key = slot15.key,
											num = slot15.value
										},
										isDouble = slot19,
										specialKey = slot22
									}
								})
							end

							slot5:pushBackCustomItem(slot18)
						end
					end

					uv4 = "clone"

					if slot4 == false then
						uv4 = "interval"
						uv5 = "list"

						if slot4 == slot5 then
							uv4 = "scrollToBottom"
							slot4 = slot4.successItem:clone()
							slot5 = slot4
							slot4 = slot4.show(slot5)
							uv5 = "scrollToBottom"
							slot5 = slot5.setEffect

							slot5(slot5, slot4)

							uv5 = "scrollToBottom"

							slot5.list:pushBackCustomItem(slot4)
						end
					end

					uv4 = "interval"
					uv5 = "list"

					if slot4 == slot5 then
						uv4 = "setEffect"
						uv5 = "list"

						if slot5 < slot4 then
							gGameUI:showTip(gLanguageCsv.sweepAdaptiveTip)
						end
					end

					uv4 = "scrollToBottom"

					slot4.list:scrollToBottom(0.3, true)
				end
			end
		end, 0.016666666666666666, 0, "GateSweepView")
	end

	bind.click(slot0, slot0.imgBG, {
		method = function ()
			uv0 = "interval"
			slot0.interval = 0
		end
	})
	Dialog.onCreate(slot0)
end

function slot3.titleItemClone(slot0, slot1)
	if slot1.type == "mimicry" then
		if not slot0.mimicryNum then
			slot0.mimicryNum = 1
		else
			slot0.mimicryNum = slot0.mimicryNum + 1
		end

		slot0.itemTitle:clone():show():removeAllChildren()

		if slot1.scaors[slot0.mimicryNum].newBuffs then
			slot4 = slot0.itemTitle:clone():show()

			slot4:removeAllChildren()

			slot5 = rich.createByStr("#C0xF76B45#" .. gLanguageCsv.mimicryEndNewBuff, 36):align(cc.p(0.5, 0.5), slot4:width() / 2, slot4:height() / 2):addTo(slot4, 4):formatText()

			slot0.list:pushBackCustomItem(slot4)
		end

		if slot1.newNum and slot1.newNum == slot0.mimicryNum then
			adapt.oneLinePos(rich.createByStr("#C0x5B545B#" .. string.format(gLanguageCsv.mimicrySaoDangScore, slot3.sum, slot3.bossScores, slot3.buffScores), 40):align(cc.p(0, 0), 0, 0):addTo(slot2, 4):formatText(), cc.Sprite:create("common/icon/txt_new.png"):align(cc.p(0, 0), 0, -10):addTo(slot2, 4), cc.p(15, 0), "left")
		end

		slot0.list:pushBackCustomItem(slot2)
	end
end

function slot3.initModel(slot0)
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.stamina = gGameModel.role:getIdler("stamina")
end

function slot3.cloneItem(slot0, slot1, slot2, slot3)
	slot6 = slot0.item:clone():tag(slot2):size(1248, 200 * slot1 + 10 * (slot1 - 1)):xy(1000, 1500):show()
	slot7 = slot6:size()

	slot6:get("textTip"):visible(next(slot3) == nil)
	slot6:get("list"):size(1248, slot5):y(0)

	return slot6
end

function slot3.cloneTextItem(slot0, slot1, slot2)
	slot6, slot7 = beauty.textScroll({
		margin = 20,
		size = cc.size(math.min(slot2.width or slot0.list:width(), slot0.list:width()), 300),
		fontSize = slot2.fontSize or 50,
		effect = {
			color = ui.COLORS.NORMAL.DEFAULT
		},
		strs = slot1,
		verticalSpace = slot2.verticalSpace or 10,
		isRich = slot2.isRich,
		align = slot2.align or "center"
	})

	slot6:height(slot7 + 30)

	return slot6
end

function slot3.cloneTitleItem(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot3 == true then
		if slot0.gateId and dataEasy.getWorldLevelExpAdd(math.floor(slot0.gateId / 10000)) then
			slot0.itemTitle:clone():show():get("textTitle"):text(gLanguageCsv.sweepWorldLevelExtra):x(624)
		else
			slot6:get("textTitle"):text(gLanguageCsv.addedBonus):x(624)
		end
	else
		slot7 = string.format(gLanguageCsv.battleTimes, slot1)

		if slot0.from == "allGate" then
			slot12 = 0

			for slot16, slot17 in ipairs(csv.world_map[csv.scene_conf[slot0.sweepData[slot1].gateId].ownerId].seq) do
				if slot8 == slot17 then
					slot12 = slot16
				end
			end

			if slot0.prenumb1 == slot11 and slot0.prenumb2 == slot12 then
				slot0.sweepTimes = slot0.sweepTimes + 1
			else
				slot0.sweepTimes = 1
			end

			slot0.prenumb1 = slot11
			slot0.prenumb2 = slot12
			slot7 = string.format(gLanguageCsv.battleTimes, slot0.sweepTimes)

			slot6:get("textGate"):text(string.format(gLanguageCsv.allBattleTimes, slot11 - 110, slot12))
			text.addEffect(slot6:get("textGate"), {
				outline = {
					size = 4,
					color = cc.c4b(234, 67, 22, 255)
				}
			})
			slot6:get("textGate"):show()
		else
			slot6:get("textGate"):hide()
		end

		if slot0.from == "endlessTower" and not slot4 then
			slot7 = csv.endless_tower_scene[slot0.startGateId + slot1 - 1].sceneName
		end

		if slot4 then
			slot7 = gLanguageCsv.totalGot
		end

		if slot0.gateId and dataEasy.getWorldLevelExpAdd(math.floor(slot0.gateId / 10000)) then
			slot6:get("textTitle"):text(slot7)

			slot9 = csv.scene_conf[slot0.gateId].roleExp

			slot6:get("textExpNum"):text("+" .. slot9 .. "(+" .. slot2 - slot9 .. ")")
		else
			slot6:get("textTitle"):text(slot7)
			slot6:get("textExpNum"):text("+" .. slot2)
		end

		if slot0.from == "union" then
			slot6:get("textExpNum"):text(slot2)
			slot6:get("textExpNote"):text(gLanguageCsv.percentageOfInjuries)
			adapt.oneLinePos(slot6:get("textExpNote"), slot6:get("textExpNum"), cc.p(20, 0), "left")
		end

		if slot0.from == "dailyAssistant" then
			slot8 = ""
			slot9 = ""
			slot10 = string.format(gLanguageCsv.totalTodo, slot2)

			if slot5.hasTitle then
				slot8 = slot5.hasTitle
			else
				slot11 = slot5.feature
				slot8 = gDailyAssistantCsv[slot11].cfg.name

				if slot11 == "endlessTower" then
					slot10 = string.format(gLanguageCsv.totalReset, slot2)
				elseif slot11 == "catch" then
					slot10 = string.format(gLanguageCsv.successAndFailTimes, slot5.win or 0, slot5.fail or 0)
				elseif slot11 == "unionFuben" then
					slot10 = gLanguageCsv.percentageOfInjuries
					slot9 = slot2
				end
			end

			slot6:get("textTitle"):text(slot8)
			slot6:get("textExpNum"):text(slot9)
			slot6:get("textExpNote"):text(slot10)
			adapt.oneLinePos(slot6:get("textTitle"), {
				slot6:get("textExpNote"),
				slot6:get("textExpNum")
			}, cc.p(20, 0), "left")
		end
	end

	slot6:get("textExpNum"):visible(slot2 ~= 0)
	slot6:get("textExpNote"):visible(slot2 ~= 0)

	return slot6
end

function slot3.onAgainClick(slot0)
	if slot0.checkCb and not slot1() then
		return
	end

	slot2 = slot0.addCallbackOnExit

	slot2(slot0, slot0.cb)

	uv2 = "checkCb"

	slot2.onClose(slot0)
end

function slot3.onSpeedClick(slot0)
	if slot0.canClose then
		slot0:onClose()
	else
		slot0.interval = 0
	end
end

function slot3.onClose(slot0)
	if slot0.type == "mimicry" then
		slot0:addCallbackOnExit(slot0.cb)
	end

	uv1 = "type"

	slot1.onClose(slot0)
end

function slot3.onitemClick(slot0, slot1, slot2)
	gGameUI:showItemDetail(slot1, {
		key = "card",
		num = slot2
	})
end

return slot3
