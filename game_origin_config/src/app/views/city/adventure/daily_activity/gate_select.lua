slot0 = {
	gLanguageCsv.doubleReward,
	gLanguageCsv.additionalNumber
}
slot1 = {
	gLanguageCsv.mopUp,
	gLanguageCsv.spaceChallenge
}
slot2 = {
	MOPUP = 1,
	CHALLENGE = 2,
	NOT_UNLOCK = 3
}

function slot3(slot0, slot1, slot2, slot3, slot4)
	return rich.createWithWidth(slot0, 40, nil, slot4):anchorPoint(0, 1):xy(slot1, slot2):addTo(slot3, 6)
end

function slot4(slot0, slot1, slot2)
	if slot2 then
		slot4 = slot0.show

		slot4(slot0)

		uv4 = "gLanguageCsv"

		slot4(gLanguageCsv.todayCharacteristics, 0, 10, slot0, 400)

		uv4 = "gLanguageCsv"

		slot4(string.format(gLanguageCsv.immuneInjury, slot1 == 1 and gLanguageCsv.attrDamage or gLanguageCsv.attrSpecialDamage), 0, -50, slot0, 400)
	else
		uv4 = "gLanguageCsv"

		slot4(gLanguageCsv.todayCharacteristics .. string.format(gLanguageCsv.immuneInjury, slot3), 0, 10, slot0, 1400)
	end
end

function slot5(slot0, slot1, slot2, slot3)
	uv5 = "gLanguageCsv"

	slot5(gLanguageCsv.recommendedToday, 0, slot3 and 2 or -20, slot1, 1400)

	slot5 = {}

	for slot9, slot10 in orderCsvPairs(slot2) do
		table.insert(slot5, {
			id = slot10,
			rarity = csv.unit[csv.cards[slot10].unitID].rarity
		})
	end

	table.sort(slot5, function (slot0, slot1)
		return slot1.rarity < slot0.rarity
	end)

	slot6 = 0

	for slot10, slot11 in ipairs(slot5) do
		slot12 = (matchLanguage({
			"en"
		}) and 300 or matchLanguage({
			"kr"
		}) and 150 or 110) + slot10 * 160
		slot13 = -120

		if slot3 then
			slot1:show()

			if slot10 <= 3 then
				slot13 = -190
				slot12 = (slot10 - 1) * 170
			else
				slot13 = -330
				slot12 = (slot10 - 4) * 170
			end

			slot1:get("bg"):size(560, 390)
		end

		bind.extend(slot0, ccui.Layout:create():size(0, 0):addTo(slot1, 6):xy(slot12, slot13), {
			class = "card_icon",
			props = {
				cardId = slot11.id,
				rarity = slot11.rarity,
				onNode = function (slot0)
					slot0:setTouchEnabled(false):scale(0.7)

					uv4 = "setTouchEnabled"

					slot0:get("imgBG"):texture(ui.QUALITY_BOX[slot4.rarity + 2])
				end
			}
		})
	end
end

slot6 = class("DailyActivityGateSelectView", cc.load("mvc").ViewBase)
slot6.RESOURCE_FILENAME = "daily_activity_gate_select.json"
slot6.RESOURCE_BINDING = {
	["left.leftUp.textTimes"] = "times",
	["right.textNote"] = "topTxt",
	["left.flagIcon"] = "flagIcon",
	["left.textName"] = "title",
	["left.textDesc"] = "desc",
	item = "item",
	left = "left",
	["left.imgEffect"] = "imgEffect",
	["left.imgBg"] = "background",
	["left.doubleFlag"] = "doubleFlag",
	["left.timeInfo.textTime"] = "openTime",
	["right.pos"] = "pos",
	["left.imgIcon"] = "imgIcon",
	["right.btnRank"] = {
		varname = "btnRank",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRankBtn")
			}
		}
	},
	["right.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				backupCached = false,
				data = bindHelper.self("gates"),
				item = bindHelper.self("item"),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				preloadCenterIndex = bindHelper.self("jumpPos"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:setName("item" .. slot0:getIdx(slot2))

					slot4 = slot1:multiget("imgIcon", "textLv", "textLvNum", "list", "btnChallenge", "unLock", "imgLvBg", "imgJxBg", "btnJxWipe", "btnJxNext", "imgJxLogo")

					if slot3.limitGate then
						slot4.unLock:hide()
						slot4.imgJxBg:show()
						slot4.imgJxLogo:show()
						slot4.btnJxWipe:visible(not slot3.isLastGate)
						slot4.btnJxWipe:get("textNote"):setFontSize(50)
						slot4.btnJxNext:visible(not slot3.isLastGate)
						slot4.btnJxNext:get("textNote"):setFontSize(50)
						slot4.btnChallenge:visible(slot3.isLastGate)
						slot4.btnChallenge:setTouchEnabled(slot3.isLastGate)
						slot4.imgJxLogo:get("textNote"):text(string.format(gLanguageCsv.nextLimitGate, slot3.gateLimitNum))
						slot4.btnJxNext:get("textNote"):text(gLanguageCsv.nextGate)

						if slot3.gateLimitNum == 0 then
							cache.setShader(slot4.btnJxWipe, false, "hsl_gray")
							slot4.btnJxNext:get("textNote"):text(gLanguageCsv.challenage)
						end

						text.addEffect(slot4.imgJxLogo:get("textNote"), {
							outline = {
								size = 5,
								color = cc.c4b(209, 50, 18, 255)
							}
						})
						text.addEffect(slot4.btnChallenge:get("textNote"), {
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
						text.addEffect(slot4.btnJxNext:get("textNote"), {
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
						text.addEffect(slot4.btnJxWipe:get("textNote"), {
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
						bind.touch(slot0, slot4.btnChallenge, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
						bind.touch(slot0, slot4.btnJxWipe, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
						bind.touch(slot0, slot4.btnJxNext, {
							methods = {
								ended = functools.partial(slot0.clickLimitNext, slot2, slot3.gateNextId)
							}
						})
					else
						slot4.imgJxBg:hide()
						slot4.btnJxWipe:hide()
						slot4.btnJxNext:hide()
						slot4.imgJxLogo:hide()

						uv7 = "setName"
						uv9 = "item"

						slot4.btnChallenge:get("textNote"):text(slot7[slot3.btnState == slot9.MOPUP and 1 or 2])

						slot8 = {
							color = ui.COLORS.GLOW.WHITE
						}

						text.addEffect(slot4.btnChallenge:get("textNote"), {
							glow = slot8
						})

						uv8 = "item"

						slot4.btnChallenge:get("textNote"):visible(slot3.btnState ~= slot8.NOT_UNLOCK)

						slot5 = slot4.btnChallenge
						slot6 = slot5
						slot5 = slot5.visible
						uv8 = "item"

						if slot3.btnState ~= slot8.CHALLENGE then
							uv8 = "item"

							if slot3.btnState ~= slot8.MOPUP then
								slot7 = false
							end
						else
							slot7 = true
						end

						slot5(slot6, slot7)
						slot4.unLock:get("textNote"):text(slot3.unlockBtnTitle)

						uv8 = "item"

						slot4.unLock:visible(slot3.btnState == slot8.NOT_UNLOCK)
						bind.touch(slot0, slot4.btnChallenge, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
						bind.touch(slot0, slot4.unLock, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickNode, slot2, slot3)
						}
					})
					slot4.imgIcon:texture(slot3.icon)
					slot4.textLv:text(gLanguageCsv.textLv)
					slot4.textLvNum:text(slot3.openLevel)
					slot4.imgLvBg:anchorPoint(0, 0.5):x(slot4.textLv:box().x - 30):width(math.max(145, slot4.textLv:width() + slot4.textLvNum:width() + 60))
					adapt.oneLinePos(slot4.textLv, slot4.textLvNum)
					uiEasy.createItemsToList(slot0, slot4.list, slot3.dropIds, {
						margin = 20,
						scale = 0.8,
						onAfterBuild = function ()
							uv0 = "list"
							slot0 = slot0.list
							slot1 = slot0
							uv2 = "list"
							uv1 = "list"

							if slot0.getInnerItemSize(slot1, slot2.list).width < slot1.list:width() then
								uv2 = "list"
								uv4 = "list"

								slot2.list:x(slot4.list:x() + slot1 - slot0.width)
							end
						end
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick"),
				clickNode = bindHelper.self("onNodeClick"),
				clickLimitNext = bindHelper.self("onSkipBattle")
			}
		}
	}
}

function slot6.onCreate(slot0, slot1, slot2)
	slot0:initModel()

	slot0.csvId = slot1
	slot3 = csv.huodong[slot1]

	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "TRANSCRIPT",
		title = slot3.name
	})
	slot0:setFeltPanel(slot3, slot2)

	slot0.jumpPos = 0
	slot0.gates = idlers.new()
	slot0.gateIds = idlertable.new(table.deepcopy(slot3.gateSeq, true))
	slot0.gateDatas = idlertable.new({})

	slot0.imgEffect:hide()
	slot0.btnRank:visible(slot1 == 1 or slot1 == 2)
	idlereasy.any({
		slot0.giftImmuneType,
		slot0.giftGroup
	}, function (slot0, slot1, slot2)
		uv3 = "list"

		if slot3 == 3 then
			uv3 = "size"

			slot3.list:size(1772, 960)

			slot3 = "city/adventure/selectgate/txt_tgmy.png"

			if slot1 == 1 then
				slot3 = "city/adventure/selectgate/txt_wgmy.png"
			end

			uv4 = "size"
			slot4 = slot4.imgEffect:show()
			slot5 = slot4
			slot4 = slot4.texture

			slot4(slot5, slot3)

			uv4 = "city/adventure/selectgate/txt_tgmy.png"
			uv5 = "size"

			slot4(slot5.pos, slot1, false)

			if slot2 == 1 then
				uv4 = "city/adventure/selectgate/txt_wgmy.png"

				if not slot4.gateSeq then
					uv4 = "city/adventure/selectgate/txt_wgmy.png"
					slot4 = slot4.gateSeq2
				end
			end

			uv5 = "size"

			slot5.gateIds:set(table.deepcopy(slot4, true))
		end
	end)
	idlereasy.when(slot0.fragGroup, function (slot0, slot1)
		uv2 = "list"

		if slot2 == 4 then
			uv2 = "size"
			slot2 = slot2.list
			slot3 = slot2
			slot4 = 1772
			slot5 = 880

			slot2.size(slot3, slot4, slot5)

			slot2 = csv.huodong_gate_fragment[slot1]
			uv3 = "csv"
			uv4 = "size"
			uv5 = "size"

			slot3(slot4, slot5.pos, slot2.markIDs, false)

			uv4 = "size"

			slot4.gateIds:set(slot2.gateGroup)
		end
	end)
	idlereasy.when(slot0.gateIds, function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in orderCsvPairs(slot1) do
			slot9 = gLanguageCsv.currentLevelNotAvailable
			uv10 = "orderCsvPairs"

			if csv.scene_conf[slot7].openLevel <= slot10.roleLv:read() then
				slot9 = gLanguageCsv.notPerfectClearanceNextLevel
			end

			if slot6 == 1 then
				uv10 = "orderCsvPairs"

				if slot8.openLevel <= slot10.roleLv:read() then
					uv10 = "csv"

					if not slot10.CHALLENGE then
						uv10 = "csv"
						slot10 = slot10.NOT_UNLOCK
					end
				end
			end

			slot2[slot6] = {
				limitGate = false,
				gateId = slot7,
				icon = slot8.icon,
				dropIds = slot8.dropIds,
				openLevel = slot8.openLevel,
				btnState = slot10,
				unlockBtnTitle = slot9
			}
		end

		uv3 = "orderCsvPairs"

		slot3.gateDatas:set(slot2)
	end)
	idlereasy.any({
		slot0.huodongsGate,
		slot0.roleLv,
		slot0.gateDatas,
		slot0.huodongsIndex
	}, function (slot0, slot1, slot2, slot3, slot4)
		slot5 = clone(slot3)

		for slot10, slot11 in pairs(slot4) do
			-- Nothing
		end

		uv7 = "clone"

		if ({
			[slot10] = slot11
		})[slot7.csvId] then
			uv7 = "clone"

			if slot6[slot7.csvId] >= #slot5 - 1 then
				uv7 = "clone"

				if slot7.csvId ~= 1 or not dataEasy.isUnlock(gUnlockCsv.goldLimitMode) then
					uv7 = "clone"

					if slot7.csvId == 2 and dataEasy.isUnlock(gUnlockCsv.expLimitMode) then
						uv7 = "clone"

						if slot6[slot7.csvId] + 1 - #slot5 == 0 then
							uv8 = "pairs"

							if not slot8.gateLimitSeq[1] then
								uv8 = "pairs"
								slot8 = slot8.gateLimitSeq[slot7]
							end
						end

						uv10 = "pairs"

						if slot7 ~= csvSize(slot10.gateLimitSeq) or not slot8 then
							uv10 = "pairs"
							slot10 = slot10.gateLimitSeq[slot7 + 1]
						end

						slot11 = csv.scene_conf[slot8]
						slot14 = slot11.openLevel
						uv14 = "csvId"
						slot5[#slot5 + 1] = {
							limitGate = true,
							gateId = slot8,
							gateNextId = slot10,
							icon = slot11.icon,
							dropIds = slot11.dropIds,
							openLevel = slot14,
							gateLimitNum = slot7,
							isLastGate = slot9,
							btnState = slot14.MOPUP
						}
					end
				end
			end
		end

		uv7 = "dataEasy"

		if slot1[slot7] then
			for slot10, slot11 in ipairs(slot5) do
				if not slot11.limitGate then
					slot12 = false
					uv13 = "pairs"

					if slot13.type ~= "gold" then
						uv13 = "pairs"

						if slot13.type ~= "exp" then
							uv13 = "pairs"

							if slot13.type ~= "event" then
								uv13 = "pairs"

								if slot13.type == "contract" then
									uv13 = "dataEasy"

									if (slot1[slot13][slot11.gateId] or 0) == 3 then
										slot12 = true
									end
								elseif slot4 then
									uv13 = "dataEasy"

									if slot10 <= (slot4[slot13] or -1) + 1 then
										uv14 = "pairs"

										if slot14.type == "gift" and dataEasy.isUnlock(gUnlockCsv.dailyGiftGate) or slot5[slot10 + 1] and slot5[slot10 + 1].openLevel <= slot2 then
											slot12 = true
										end
									end
								end
							end
						end
					end

					if slot2 < slot11.openLevel then
						uv14 = "csvId"
						slot5[slot10].btnState = slot14.NOT_UNLOCK
					elseif slot12 then
						uv14 = "csvId"
						slot5[slot10].btnState = slot14.MOPUP

						if slot5[slot10 + 1] and slot5[slot10 + 1].openLevel <= slot2 then
							slot13 = slot5[slot10 + 1]
							uv14 = "csvId"
							slot14 = slot14.CHALLENGE
							slot13.btnState = slot14
							uv13 = "clone"
							uv14 = "clone"
							slot13.jumpPos = slot14.jumpPos + 1
						end
					end
				end
			end
		end

		uv7 = "clone"

		slot7.gates:update(slot5)
	end)

	slot4 = {
		{
			game.PRIVILEGE_TYPE.HuodongTypeGoldTimes,
			game.PRIVILEGE_TYPE.HuodongTypeGoldDropRate,
			gLanguageCsv.gold
		},
		{
			game.PRIVILEGE_TYPE.HuodongTypeExpTimes,
			game.PRIVILEGE_TYPE.HuodongTypeExpDropRate,
			gLanguageCsv.expLiquid
		},
		{
			game.PRIVILEGE_TYPE.HuodongTypeGiftTimes,
			game.PRIVILEGE_TYPE.HuodongTypeGiftDropRate,
			gLanguageCsv.favouriteGift
		},
		{
			game.PRIVILEGE_TYPE.HuodongTypeFragTimes,
			game.PRIVILEGE_TYPE.HuodongTypeFragDropRate,
			gLanguageCsv.spriteFrags
		},
		[7] = {
			game.PRIVILEGE_TYPE.HuodongTypeContractTimes,
			game.PRIVILEGE_TYPE.HuodongTypeContractDropRate,
			gLanguageCsv.contract
		}
	}

	idlereasy.when(slot0.huodongs, function (slot0, slot1)
		uv2 = "huodongType"
		uv3 = "dataEasy"
		slot2 = slot2[slot3.huodongType] or {}
		uv4 = "getPrivilegeVal"

		if slot4 then
			uv4 = "getPrivilegeVal"

			if slot4.show then
				uv4 = "getPrivilegeVal"

				if slot4.type == 2 then
					uv4 = "getPrivilegeVal"
					slot3 = (slot2[1] and dataEasy.getPrivilegeVal(slot2[1]) or 0) + slot4.paramMap.count or 0
				end
			end
		end

		uv4 = "dataEasy"

		if slot1[tonumber(time.getTodayStrInClock())] then
			uv7 = "show"

			if slot1[slot5][slot7] then
				uv7 = "show"
				slot4 = slot4.times + slot3 - slot1[slot5][slot7].times
			end
		end

		slot6 = math.max(slot4, 0)
		slot4 = slot6
		uv6 = "type"
		slot6.surplusTimes = slot4
		uv6 = "type"
		slot6 = slot6.times
		slot6 = slot6.text
		uv10 = "dataEasy"

		slot6(slot6, slot4 .. "/" .. slot10.times + slot3)

		uv6 = "type"

		slot6.topTxt:removeAllChildren()

		if slot2[2] then
			uv7 = "type"
			slot7 = slot7.topTxt
			slot8 = slot7
			slot7 = slot7.size(slot8).width
			uv8 = "type"
			uv7 = "type"
			uv10 = "type"
			uv11 = "huodongType"
			uv12 = "dataEasy"

			slot7:setPrivilegeRichText(slot2[2], slot10.topTxt, slot11[slot12.huodongType][3], cc.p(slot7, slot8.topTxt:size().height), true)
		end
	end)

	if slot0.relicBuff and slot2 and slot2.huodongType then
		slot5 = {
			1,
			2,
			3,
			4,
			nil,
			nil,
			13
		}

		idlereasy.when(slot0.relicBuff, function (slot0, slot1)
			uv2 = "huodongType"
			uv3 = "uiEasy"

			if slot2[slot3.huodongType] then
				uv3 = "addRelicIcon"
				uv5 = "huodongType"
				uv6 = "uiEasy"

				uiEasy.addRelicIcon(slot3.left, slot1, slot5[slot6.huodongType], {
					dir = "left",
					x = 460,
					scale = 0.85,
					y = 275
				})
			end
		end)
	end
end

function slot6.setPrivilegeRichText(slot0, slot1, slot2, slot3, slot4, slot5)
	if dataEasy.getGateAddition(slot1) and slot6 ~= 0 then
		if string.find(tostring(slot6), ".", 1, true) then
			slot6 = slot6 * 100 .. "%"
		end

		slot7 = nil

		return rich.createByStr(slot5 and "#C0x5B545B#(" .. string.format(gLanguageCsv.currentPrivilege, slot3, tostring(slot6)) .. "#C0x5B545B#)" or string.format(gLanguageCsv.currentPrivilege, slot3, tostring(slot6)), 40, nil, , cc.p(0, 0.5)):addTo(slot2, 10, "privilege"):anchorPoint(cc.p(0, 0.5)):xy(slot4):formatText()
	end
end

function slot6.initModel(slot0)
	slot0.huodongs = gGameModel.role:getIdler("huodongs")
	slot0.huodongsGate = gGameModel.role:getIdler("huodongs_gate")
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.giftGroup = gGameModel.global_record:getIdler("huodong_gift_group")
	slot0.fragGroup = gGameModel.global_record:getIdler("huodong_frag_group")
	slot0.giftImmuneType = gGameModel.global_record:getIdler("huodong_gift_immune_type")
	slot0.huodongsIndex = gGameModel.role:getIdler("huodongs_index")

	if dataEasy.isTownRelicBuffUnlock() then
		slot0.relicBuff = gGameModel.town:getIdler("relic_buff")
	end
end

function slot6.setFeltPanel(slot0, slot1, slot2)
	slot0.background:texture(slot1.background)
	slot0.imgIcon:texture(slot1.icon)
	slot0.title:text(slot1.name)
	slot0.doubleFlag:visible(slot2.isDoubleAward)

	if slot2 then
		slot0.flagIcon:visible(slot2.show)

		slot5 = "textNote"
		uv5 = "background"

		slot0.flagIcon:get(slot5):text(slot5[slot2.type])
	end

	slot0.openTime:text(slot1.openTimeDesc)
	slot0.desc:text(slot1.desc)
	slot0.topTxt:text(slot1.desc)
end

function slot6.onRankBtn(slot0)
	if csv.huodong[slot0.csvId].type == "gold" then
		sdk.trackEvent("check_goldrank")
	end

	if slot1.type == "exp" then
		sdk.trackEvent("check_exprank")
	end

	gGameApp:requestServer("/game/rank", function (slot0)
		gGameUI:stackUI("city.adventure.daily_activity.rank", nil, , slot0.view)
	end, "huodong_" .. slot0.csvId, 0, 50)
end

function slot6.onSkipBattle(slot0, slot1, slot2, slot3)
	if slot0.surplusTimes <= 0 then
		gGameUI:showTip(gLanguageCsv.timesLimitBreakBrick)

		return
	end

	slot0.gateId = slot3
	slot4 = slot0:createHandler("onClose")

	gGameUI:stackUI("city.card.embattle.base", nil, {
		full = true
	}, {
		team = true,
		from = game.EMBATTLE_FROM_TABLE.huodong,
		fromId = slot0.csvId,
		fightCb = slot0:createHandler("startFighting"),
		startCb = slot0:createHandler("showTip")
	})
end

function slot6.showTip(slot0, slot1)
	if slot0.csvId == 3 then
		uv2 = "csvId"

		slot2(slot1.dailyGateTipsPos, slot0.giftImmuneType:read(), true)
	end

	if slot0.csvId == 4 then
		slot3 = slot0.fragGroup:read()
		uv3 = "dailyGateTipsPos"

		slot3(slot0, slot1.dailyGateTipsPos, csv.huodong_gate_fragment[slot3].markIDs, true)
	end
end

function slot6.startFighting(slot0, slot1, slot2, slot3)
	battleEntrance.battleRequest("/game/huodong/start", slot2, slot0.csvId, slot0.gateId, slot3):onStartOK(function (slot0)
		uv1 = "onClose"

		if slot1 then
			uv1 = "onClose"

			slot1:onClose(false)

			uv0 = nil
		end
	end):show()
end

function slot6.onItemClick(slot0, slot1, slot2, slot3)
	slot0.gateId = slot3.gateId

	if slot3.limitGate and slot3.gateLimitNum == 0 then
		gGameUI:showTip(gLanguageCsv.notSwipe)
	elseif not slot3.limitGate then
		uv5 = "gateId"

		if slot3.btnState == slot5.MOPUP then
			slot0:onSweepBtn()
		else
			uv5 = "gateId"

			if slot3.btnState == slot5.CHALLENGE then
				slot0:onSkipBattle(slot1, slot2, slot3.gateId)
			else
				uv5 = "gateId"

				if slot3.btnState == slot5.NOT_UNLOCK then
					gGameUI:showTip(gLanguageCsv[slot3.openLevel <= slot0.roleLv:read() and "notPerfectClearanceNextLevel" or "currentLevelNotAvailable"])
				end
			end
		end
	end
end

function slot6.onNodeClick(slot0, slot1, slot2, slot3)
	slot0.gateId = slot3.gateId

	if slot3.limitGate and slot3.gateLimitNum == 0 then
		slot0.gateId = slot3.nextGateId
	end

	uv5 = "gateId"

	if slot3.btnState ~= slot5.MOPUP then
		uv5 = "gateId"

		if slot3.btnState == slot5.CHALLENGE then
			slot0:onSkipBattle(slot1, slot2, slot3.gateId)
		else
			uv5 = "gateId"

			if slot3.btnState == slot5.NOT_UNLOCK then
				gGameUI:showTip(gLanguageCsv[slot3.openLevel <= slot0.roleLv:read() and "notPerfectClearanceNextLevel" or "currentLevelNotAvailable"])
			end
		end
	end
end

function slot6.onSweepBtn(slot0)
	if slot0.surplusTimes <= 0 then
		gGameUI:showTip(gLanguageCsv.saodangTimesNotEnough)

		return
	end

	gGameApp:requestServer("/game/huodong/saodang", function (slot0)
		uv6 = "gGameUI"

		gGameUI:showGainDisplay(slot0, {
			isDouble = dataEasy.isGateIdDoubleDrop(slot6.gateId)
		})
	end, slot0.csvId, slot0.gateId, 1)
end

function slot6.onAfterBuild(slot0)
	slot0.list:jumpToItem(slot0.jumpPos, cc.p(0, 1), cc.p(0, 1))
end

function slot6.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if slot0.openLevel ~= slot1.openLevel then
			return slot0.openLevel < slot1.openLevel
		end

		return slot0.gateId < slot1.gateId
	end
end

return slot6
