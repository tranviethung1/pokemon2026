slot0 = require("app.views.city.activity.brave_challenge.adapt")
slot2 = class("BraveChallengeGateView", cc.load("mvc").ViewBase)
slot3 = 0.5
slot4 = 1
slot5 = {
	ui.COLORS.NORMAL.WHITE,
	ui.COLORS.NORMAL.DEFAULT,
	ui.COLORS.NORMAL.GRAY
}
slot2.RESOURCE_FILENAME = "activity_brave_challenge_gate.json"
slot2.RESOURCE_BINDING = {
	panelLeft = "panelLeft",
	panelTop = "panelTop",
	item01 = "item01",
	["panelTop.btnBadge.txtBadge01"] = "txtBadge01",
	itemGate = "itemGate",
	["panelTop.listInfoLineUp"] = "listInfoLineUp",
	panelDown = "panelDown",
	["itemGate.imgAward.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["panelTop.enemyText"] = {
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
	["panelLeft.listGate"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 10,
				data = bindHelper.self("gateDatas"),
				item = bindHelper.self("itemGate"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("imgDi01", "imgDi02", "imgDi03", "txtInfo", "imgAward").imgDi01:visible(slot3.sign == 1)
					slot4.imgDi02:visible(slot3.sign == 2)
					slot4.imgDi03:visible(slot3.sign == 3)

					uv8 = "multiget"

					text.addEffect(slot4.txtInfo, {
						color = slot8[slot3.sign]
					})
					slot4.txtInfo:text(slot3.name)
					slot4.imgAward:texture(slot3.firstPass and "activity/brave_challenge/icon_yztz_box1.png" or "activity/brave_challenge/icon_yztz_box2.png")
					slot4.imgAward:get("txt"):text(slot3.firstPass and gLanguageCsv.bcGateTip04 or gLanguageCsv.bcGateTip03)
					slot4.imgAward:visible(slot3.sign >= 2)

					if not slot3.firstPass then
						bind.touch(slot0, slot4.imgAward, {
							methods = {
								ended = functools.partial(slot0.showAward, slot2, slot3)
							}
						})
					end
				end,
				preloadCenter = bindHelper.self("floorID")
			},
			handlers = {
				showAward = bindHelper.self("onShowAward")
			}
		}
	},
	["panelTop.listEnemyLineUp"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("enemyDatas"),
				item = bindHelper.self("item01"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							showAttribute = true,
							unitId = slot3.unitId,
							rarity = slot3.rarity,
							advance = slot3.advance,
							isBoss = slot3.isBoss,
							levelProps = {
								data = slot3.level
							},
							onNode = function (slot0)
								slot1, slot2 = slot0:xy()
								slot3 = slot0.scale
								slot5 = 0.8

								slot3(slot0, slot5)

								uv3 = "xy"
								uv5 = "scale"

								slot3:scale(slot5.isBoss and 1 or 0.9)
							end
						}
					})
				end
			}
		}
	},
	["panelTop.btnBadge"] = {
		varname = "btnBadge",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnBadge")
			}
		}
	},
	["panelDown.btnReady"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnReady")
			}
		}
	},
	["panelDown.btnReady.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.ORANGE
				}
			}
		}
	},
	["panelDown.btnQuit"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnQuit")
			}
		}
	},
	["panelDown.btnQuit.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["panelTop.btnBadge.txtBadge02"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(244, 144, 15, 255)
				}
			}
		}
	},
	["panelTop.btnBadge.txtRareBadgeNum"] = {
		binds = {
			{
				event = "text",
				idler = bindHelper.self("rateBadge")
			},
			{
				event = "effect",
				data = {
					outline = {
						color = ui.COLORS.OUTLINE.ORANGE
					}
				}
			}
		}
	},
	["panelTop.btnBadge.txtGenBadgeNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("genBadge")
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.parent = slot1.parent
	slot0.gateDatas = idlertable.new({})
	slot0.enemyDatas = idlertable.new({})
	slot0.genBadge = idler.new(0)
	slot0.rateBadge = idler.new(0)
	slot0.floorID = 1
	slot0.floorDatas = {}
	slot0.sign = false
	slot0.badgeSign = true
	slot0.startGenBader = 0
	slot0.startRateBader = 0
	slot0.lastCards = clone(slot0.gameInfo:read().cards)
	slot0.diffCardHash = {}

	slot0:initFloor()
	slot0:oneKeyCheck(slot1.data)
	idlereasy.when(slot0.gameInfo, function (slot0, slot1)
		if slot1.floorID == 0 or slot1.monsterID == 0 then
			return
		end

		uv2 = "floorID"
		uv3 = "floorID"
		slot2.floorID = slot3.floorDatas[slot1.floorID] or 1
		uv2 = "floorID"
		slot2 = slot2.getFloorConfig
		uv4 = "floorID"

		slot2(slot2, slot4.floorID)

		uv2 = "floorID"
		slot2 = slot2.initMonsterEmbattle

		slot2(slot2, slot1.monsterID)

		uv2 = "floorID"

		slot2:initMonsterInfo(slot1.floorID, slot1.monsterID)

		if slot1.new_badges and table.nums(slot1.new_badges) > 0 then
			uv2 = "floorID"

			if slot2.jumpInfo:read() then
				uv2 = "floorID"

				if slot2.jumpInfo:read().status then
					uv2 = "floorID"

					if slot2.jumpInfo:read().status ~= game.BRAVE_CHALLENGE_JUMP_STATE.OVER then
						return
					end
				end
			end

			uv2 = "floorID"

			slot2:showSelectBadge(slot1.new_badges)
		end

		uv2 = "floorID"
		slot2 = slot2.setCardSprite

		slot2(slot2, slot1.deployments)

		uv2 = "floorID"

		slot2:getDiffCardhash(slot1.cards)
	end)
	idlereasy.when(slot0.badges, function (slot0, slot1)
		uv2 = "getNumByType"

		slot2:getNumByType(slot1)
	end)
	slot0:runStartAction()

	if matchLanguage({
		"en"
	}) then
		adapt.setTextAdaptWithSize(slot0.txtBadge01, {
			vertical = "center",
			horizontal = "center",
			size = cc.size(210, 56)
		})
	end
end

function slot2.initModel(slot0)
	slot0.jumpInfo = gGameModel.brave_challenge:getIdler("jump_info")
	slot0.id = gGameModel.brave_challenge:getIdler("yyID")
	slot0.status = gGameModel.brave_challenge:getIdler("status")
	slot0.gameInfo = gGameModel.brave_challenge:getIdler("game")
	slot0.badges = gGameModel.brave_challenge:getIdler("badges")
	slot0.floors = gGameModel.brave_challenge:getIdler("floors")
	slot0.passTimes = gGameModel.brave_challenge:getIdler("pass_times")
end

function slot2.oneKeyCheck(slot0, slot1)
	slot2 = slot0.jumpInfo:read()

	if not dataEasy.isUnlock(gUnlockCsv.normalBraveChallengeJump) or itertools.size(slot2) == 0 then
		return
	end

	if slot2.status == game.BRAVE_CHALLENGE_JUMP_STATE.POINT then
		if slot1.datas and slot1.datas.award then
			gGameUI:stackUI("city.activity.brave_challenge.jump", nil, , slot1.datas.award)
		else
			gGameApp:requestServer("/game/brave_challenge/jump/next", function (slot0)
				gGameUI:stackUI("city.activity.brave_challenge.jump", nil, )
			end)
		end
	elseif slot2.status == game.BRAVE_CHALLENGE_JUMP_STATE.OVER then
		return
	else
		gGameUI:stackUI("city.activity.brave_challenge.jump", nil, )
	end
end

function slot2.judgeGameIsOver(slot0)
	if slot0.parent.comingSoon then
		performWithDelay(slot0, function ()
			uv0 = "parent"

			slot0.parent:onClose()
		end, 0.016666666666666666)
	end
end

function slot2.initFloor(slot0)
	slot0.floorDatas = {}

	for slot5, slot6 in csvPairs(slot0.parent:getBaseInfo().gateSeq) do
		slot0.floorDatas[slot6] = slot5
	end
end

function slot2.runStartAction(slot0)
	slot1, slot2 = slot0.panelDown:xy()
	slot3, slot4 = slot0.panelLeft:xy()
	slot5, slot6 = slot0.panelTop:xy()

	slot0.panelDown:xy(slot1, slot2 - 300)
	slot0.panelLeft:xy(slot3 - 650, slot4)
	slot0.panelTop:xy(slot5, slot6 + 400)
	slot0.parent:showCardPanel(false)
	performWithDelay(slot0, function ()
		uv0 = "panelDown"
		slot0 = slot0.panelDown
		slot0 = slot0.runAction
		slot4 = cc.MoveTo
		slot5 = slot4
		uv6 = "runAction"
		uv8 = "cc"
		uv9 = "EaseOut"
		uv5 = "runAction"

		slot0(slot0, cc.EaseOut:create(slot4.create(slot5, slot6, cc.p(slot8, slot9)), slot5))

		uv0 = "panelDown"
		slot0 = slot0.panelLeft
		slot0 = slot0.runAction
		slot4 = cc.MoveTo
		slot5 = slot4
		uv6 = "runAction"
		uv8 = "create"
		uv9 = "MoveTo"
		uv5 = "runAction"

		slot0(slot0, cc.EaseOut:create(slot4.create(slot5, slot6, cc.p(slot8, slot9)), slot5))

		uv0 = "panelDown"
		slot0 = slot0.panelTop
		slot0 = slot0.runAction
		slot6 = cc.MoveTo
		slot7 = slot6
		uv8 = "runAction"
		uv10 = "p"
		uv11 = "panelLeft"
		uv7 = "runAction"

		slot0(slot0, cc.Sequence:create(cc.EaseOut:create(slot6.create(slot7, slot8, cc.p(slot10, slot11)), slot7), cc.CallFunc:create(function ()
			uv0 = "parent"
			slot0 = slot0.parent
			slot0 = slot0.showCardPanel

			slot0(slot0, true)

			uv0 = "parent"
			slot0 = slot0.openAchievementView

			slot0(slot0)

			uv0 = "parent"

			slot0:judgeGameIsOver()
		end), nil))

		uv0 = "panelDown"

		slot0.parent:setType(3)
	end, 0.016666666666666666)
end

function slot2.getDiffCardhash(slot0, slot1)
	slot0.diffCardHash = {}

	for slot5, slot6 in pairs(slot1) do
		if not slot0.lastCards[slot5] then
			slot0.diffCardHash[slot5] = true
		end
	end

	slot0.lastCards = clone(slot1)
end

function slot2.runEndAction(slot0)
	slot0.parent:showCardPanel(false)

	slot1, slot2 = slot0.panelDown:xy()
	slot3, slot4 = slot0.panelLeft:xy()
	slot5, slot6 = slot0.panelTop:xy()
	slot11 = cc.MoveTo
	slot12 = slot11
	uv13 = "parent"
	uv12 = "parent"

	slot0.panelDown:runAction(cc.EaseOut:create(slot11.create(slot12, slot13, cc.p(slot1, slot2 - 300)), slot12))

	slot11 = cc.MoveTo
	slot12 = slot11
	uv13 = "parent"
	uv12 = "parent"

	slot0.panelLeft:runAction(cc.EaseOut:create(slot11.create(slot12, slot13, cc.p(slot3 - 650, slot4)), slot12))

	slot11 = cc.MoveTo
	slot12 = slot11
	uv13 = "parent"
	uv12 = "parent"

	slot0.panelTop:runAction(cc.EaseOut:create(slot11.create(slot12, slot13, cc.p(slot5, slot6 + 400)), slot12))
end

function slot2.getFloorConfig(slot0, slot1)
	slot4 = {}

	for slot9, slot10 in csvPairs(slot0.parent:getBaseInfo().gateSeq) do
		slot11 = csv.brave_challenge.floor[slot10]

		table.insert(slot4, {
			id = slot9,
			firstAward = slot11.firstAward,
			monsterDesc = slot11.monsterDesc,
			name = slot11.name,
			desc = slot11.desc,
			floor = slot11.floor,
			sign = slot1 < slot9 and 3 or slot9 == slot1 and 2 or 1,
			firstPass = slot0.floors:read()[slot11.floor] == 1
		})
	end

	slot0.gateDatas:set(slot4)
end

function slot2.initMonsterEmbattle(slot0, slot1)
	slot4 = {}

	for slot8, slot9 in csvPairs(csv.brave_challenge.monster[slot1].cards) do
		if csv.brave_challenge.cards[slot9] then
			slot11 = csv.cards[slot10.cardID].unitID
			slot12 = csv.unit[slot11]

			for slot17, slot18 in csvPairs(slot2.boss) do
				if slot18 == slot9 then
					-- Nothing
				end
			end

			table.insert(slot4, {
				isBoss = false,
				cardId = slot10.cardID,
				unitId = slot11,
				level = slot10.level,
				star = slot10.star,
				advance = slot10.advance,
				rarity = slot12.rarity,
				attr1 = slot12.natureType,
				attr2 = slot12.natureType2,
				isBoss = true
			})
		end
	end

	table.sort(slot4, function (slot0, slot1)
		if slot0.isBoss ~= slot1.isBoss then
			return slot0.isBoss
		end

		return slot1.advance < slot0.advance
	end)
	slot0.enemyDatas:set(slot4)
end

function slot2.openAchievementView(slot0)
	if slot0.gameInfo:read().pass then
		slot2 = slot0.parent:getBaseInfo()
		slot3 = {
			[slot2.achievementID] = 1
		}
		slot4 = slot0.passTimes:read() == 1

		if slot2.achievementID == 0 then
			slot5 = slot2.gateSeq[table.nums(slot2.gateSeq)]
			slot3 = {}
			slot4 = true
		end

		gGameUI:stackUI("city.activity.brave_challenge.gain_achievement", nil, , {
			itemData = slot3,
			sendQuit = slot0:createHandler("sendQuit"),
			got = slot4,
			lastAnimation = slot2.lastAnimation
		})
	end
end

function slot2.initMonsterInfo(slot0, slot1, slot2)
	beauty.textScroll({
		isRich = true,
		list = slot0.listInfoLineUp,
		strs = string.format(gLanguageCsv.bcGateTip01, csv.brave_challenge.monster[slot2].desc == "" and csv.brave_challenge.floor[slot1].desc or slot4.desc)
	})
end

function slot2.playBadgeEffect(slot0, slot1)
	if slot0.badgeSign then
		slot0.startGenBader = slot1[1] or 0
		slot0.startRateBader = slot1[2] or 0
		slot0.badgeSign = false
		slot0.effectGen = widget.addAnimationByKey(slot0, "effect/xunzhangxuanze.skel", "effectGen", "", 100)

		slot0.effectGen:xy(1270, 635)
		slot0.effectGen:scale(2)

		slot0.effectRate = widget.addAnimationByKey(slot0, "effect/xunzhangxuanze.skel", "effectRate", "", 100)

		slot0.effectRate:xy(1270, 700)
		slot0.effectRate:scale(2)
	else
		if slot0.startGenBader ~= (slot1[1] or 0) then
			slot0.effectGen:play("effect_hou")

			slot0.startGenBader = slot2
		end

		if slot0.startRateBader ~= (slot1[2] or 0) then
			slot0.effectRate:play("effect_hou")

			slot0.startRateBader = slot3
		end
	end
end

function slot2.getNumByType(slot0, slot1)
	slot2 = csv.brave_challenge.badge
	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		for slot12, slot13 in pairs(slot8) do
			if slot3[slot2[slot13].rarity] == nil then
				slot3[slot14.rarity] = 1
			else
				slot3[slot14.rarity] = slot3[slot14.rarity] + 1
			end
		end
	end

	slot0:playBadgeEffect(slot3)
	slot0.genBadge:set(slot3[1] or 0)
	slot0.rateBadge:set(slot3[2] or 0)
end

function slot2.setCardSprite(slot0, slot1)
	slot3 = {}

	for slot7, slot8 in ipairs(slot1) do
		if csv.brave_challenge.cards[slot8] then
			slot3[#slot3 + 1] = {
				csvID = slot8,
				unit_id = csv.cards[slot9.cardID].unitID
			}
		end
	end

	slot0.sign = #slot3 == 0

	slot0.parent:showCardsDeployments(slot3)
end

function slot2.showSelectBadge(slot0, slot1)
	performWithDelay(slot0, function ()
		uv5 = "gGameUI"

		gGameUI:stackUI("city.activity.brave_challenge.select_badge", nil, , slot5)
	end, 0.016666666666666666)
end

function slot2.onShowAward(slot0, slot1, slot2, slot3)
	if itertools.size(slot3.firstAward) ~= 0 then
		gGameUI:showBoxDetail({
			state = 1,
			data = slot3.firstAward,
			content = gLanguageCsv.braveChallengeFirstBox
		})
	end
end

function slot2.onBtnBadge(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.badges:read()) do
		for slot10, slot11 in pairs(slot6) do
			table.insert(slot1, slot11)
		end
	end

	gGameUI:stackUI("city.activity.brave_challenge.badge", nil, , slot1, 1)
end

function slot2.onBtnReady(slot0)
	gGameUI:disableTouchDispatch(nil, false)

	if slot0.sign then
		function ()
			slot0 = gGameUI
			slot0 = slot0.stackUI
			uv6 = "gGameUI"
			slot6 = slot6:createHandler("startFighting")
			uv6 = "gGameUI"

			slot0(slot0, "city.activity.brave_challenge.embattle", nil, {
				full = true
			}, {
				fightCb = slot6,
				newCards = slot6.diffCardHash
			})

			uv0 = "gGameUI"

			slot0.parent:resetPanelPos()
			gGameUI:disableTouchDispatch(nil, true)
		end()
	else
		slot0.parent:runCardAction()

		uv8 = "gGameUI"

		slot0:runAction(cc.Sequence:create(cc.DelayTime:create(slot8), cc.CallFunc:create(slot1), nil))
	end
end

function slot2.startFighting(slot0, slot1, slot2)
	slot0.parent:startFighting(slot1, slot2)
end

function slot2.sendQuit(slot0, slot1)
	uv4 = "gGameApp"

	gGameApp:requestServer(slot4.url("quit"), function (slot0)
		uv1 = "parent"
		slot1 = slot1.parent
		slot1 = slot1.onClose

		slot1(slot1)

		uv1 = "onClose"

		if not slot1 then
			gGameUI:showDialog({
				btnType = 1,
				strs = {
					gLanguageCsv.bcGateTip05
				},
				dialogParams = {
					clickClose = false
				}
			})
		end
	end, slot0.id:read())
end

function slot2.onBtnQuit(slot0)
	gGameUI:showDialog({
		btnType = 2,
		strs = {
			gLanguageCsv.bcGateTip02
		},
		cb = function ()
			uv0 = "sendQuit"

			slot0:sendQuit(false)
		end,
		dialogParams = {
			clickClose = false
		}
	})
end

return slot2
