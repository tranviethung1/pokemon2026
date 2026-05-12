slot0 = cc.load("mvc").ViewBase
slot1 = class("GainWayView", Dialog)
slot2 = {
	gLanguageCsv.mopUp,
	gLanguageCsv.leaveFor,
	gLanguageCsv.notOpen
}
slot3 = {
	MOPUP = 1,
	NOTOPEN = 3,
	LEAVEFOR = 2
}
slot4 = game.SHOP_UNLOCK_KEY
slot1.WAY_TITLE = {
	normal = gLanguageCsv.getplay,
	shop = {
		gLanguageCsv.spaceHandpick,
		gLanguageCsv.spaceGuild,
		gLanguageCsv.spaceFragment,
		gLanguageCsv.spacePvp,
		gLanguageCsv.explorer,
		gLanguageCsv.randomTower,
		gLanguageCsv.craft,
		gLanguageCsv.equipShop,
		gLanguageCsv.unionCombet,
		gLanguageCsv.crossCraft,
		gLanguageCsv.crossArena,
		gLanguageCsv.fishing,
		gLanguageCsv.onlineFight,
		gLanguageCsv.skin,
		gLanguageCsv.crossMine,
		gLanguageCsv.huntingArea,
		gLanguageCsv.crossSupremacyName
	},
	activity = gLanguageCsv.activity,
	gate = gLanguageCsv.mainline,
	endlessTower = gLanguageCsv.endlessTower,
	dispatchTask = gLanguageCsv.dispatch,
	randomTower = gLanguageCsv.randomTower,
	explorerDraw = gLanguageCsv.explorerDraw,
	cloneBattle = gLanguageCsv.clone,
	craft = gLanguageCsv.craft,
	task = gLanguageCsv.task,
	talent = gLanguageCsv.talent,
	fishing = gLanguageCsv.angling,
	gymChallenge = gLanguageCsv.gymChallenge,
	drawCard = {
		diamond = gLanguageCsv.diamondDraw,
		limit = gLanguageCsv.drawLimit,
		gold = gLanguageCsv.goldDraw,
		equip = gLanguageCsv.drawEquip,
		diamondup = gLanguageCsv.diamondUpDrawCard
	},
	activityGate = {
		gold = gLanguageCsv.GoldTranscript,
		exp = gLanguageCsv.expTranscript,
		frag = gLanguageCsv.FragmentTranscript,
		gift = gLanguageCsv.GiftTranscript
	},
	gemDraw = gLanguageCsv.drawGemTitle,
	megaStone = gLanguageCsv.everydayTransform,
	keyStone = gLanguageCsv.everydayTransform,
	zawakeFragExclusive = gLanguageCsv.zawakeFragExchange,
	zawakeFragCurrency = gLanguageCsv.zawakeFragExchange,
	townSupermarket = gLanguageCsv.townSupermarket
}
slot5 = {
	endlessTower = gLanguageCsv.adventure,
	dispatchTask = gLanguageCsv.adventure,
	randomTower = gLanguageCsv.adventure,
	cloneBattle = gLanguageCsv.adventure,
	activityGate = gLanguageCsv.adventure,
	fishing = gLanguageCsv.adventure,
	gym = gLanguageCsv.gymChallenge
}
slot6 = {
	zawakeFragExclusive = gLanguageCsv.zawake,
	zawakeFragCurrency = gLanguageCsv.zawake
}
slot7 = {
	{
		1,
		10,
		50
	},
	{
		1,
		3
	},
	{
		1,
		3,
		10,
		50
	}
}
slot8 = {
	"sweepSelected",
	"sweepSelectedHard",
	"sweepSelectedNomalAndHard"
}
slot1.RESOURCE_FILENAME = "common_gain_way.json"
slot1.RESOURCE_BINDING = {
	["bg.emptyBg"] = "emptyBg",
	cardName = "cardNameText",
	item = "wayItem",
	title = "title",
	title1 = "title1",
	["bg.emptyTxt"] = "emptyTxt",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	num1 = {
		varname = "num1",
		binds = {
			{
				event = "effect",
				data = {
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	num = {
		varname = "num",
		binds = {
			{
				event = "effect",
				data = {
					color = ui.COLORS.NORMAL.DEFAULT
				}
			},
			{
				event = "text",
				idler = bindHelper.self("cardNum")
			}
		}
	},
	numTxt = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.DEFAULT
			}
		}
	},
	list = {
		varname = "wayList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("wayDatas"),
				item = bindHelper.self("wayItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("btn", "btnTitle")

					if matchLanguage({
						"cn",
						"tw"
					}) then
						if #slot3.title / 3 == 2 then
							text.addEffect(slot1:multiget("title", "txt", "btn", "list").title, {
								size = 80
							})
						elseif slot6 == 3 then
							text.addEffect(slot5.title, {
								size = 60
							})
						elseif slot6 == 4 or slot6 == 5 then
							text.addEffect(slot5.title, {
								size = 40
							})
						end
					end

					if matchLanguage({
						"en"
					}) then
						if math.floor(#slot3.title / 3) == 3 then
							text.addEffect(slot5.title, {
								size = 45
							})
						elseif slot6 == 4 then
							text.addEffect(slot5.title, {
								size = 38
							})
						elseif slot6 == 5 then
							text.addEffect(slot5.title, {
								size = 34
							})
						elseif slot6 > 5 then
							text.addEffect(slot5.title, {
								size = 30
							})
						end
					end

					slot5.title:text(slot3.title)
					slot4:text(slot3.btnTitle)
					slot5.txt:text(slot3.txt)

					slot7 = slot5.txt

					adapt.setTextAdaptWithSize(slot7, {
						vertical = "center",
						horizontal = "left",
						size = cc.size(300, 200)
					})

					uv7 = "get"

					if slot3.typ == slot7.LEAVEFOR then
						slot1:get("btn"):loadTextureNormal("common/btn/btn_leave.png")
					else
						slot1:get("btn"):loadTextureNormal("common/btn/btn_normal.png")
					end

					uv7 = "get"

					if slot3.typ ~= slot7.LEAVEFOR then
						uv7 = "get"

						if slot3.typ == slot7.MOPUP then
							cache.setShader(slot5.btn, false, "normal")
							text.addEffect(slot4, {
								color = ui.COLORS.NORMAL.WHITE,
								glow = {
									color = ui.COLORS.GLOW.WHITE
								}
							})
						else
							cache.setShader(slot5.btn, false, "hsl_gray")
							text.deleteAllEffect(slot4)
							text.addEffect(slot4, {
								color = ui.COLORS.DISABLED.WHITE
							})
						end
					end

					uiEasy.createItemsToList(slot0, slot5.list, slot3.dropIds, {
						scale = 1,
						margin = 25
					})
					bind.touch(slot0, slot5.btn, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
					slot5.list:setTouchEnabled(false)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onWayItemClick")
			}
		}
	},
	selectPanel = {
		varname = "selectPanel",
		binds = {
			event = "extend",
			class = "sort_menus",
			props = {
				width = 300,
				data = bindHelper.self("waySelectDatas"),
				locked = bindHelper.self("locked"),
				btnClick = bindHelper.self("onSortMenusBtnClick", true),
				showSelected = bindHelper.self("sweepSelected"),
				onNode = function (slot0)
					slot0:xy(-1100, -500):z(20)
				end
			}
		}
	},
	cardImg = {
		binds = {
			event = "extend",
			class = "icon_key",
			props = {
				data = bindHelper.self("keyData")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3)
	slot0:initModel()

	slot0.cb = slot2
	slot0.key = slot1
	slot0.targetNum = slot3

	slot0:initTopInfo()
	slot0.wayItem:get("list"):setScrollBarEnabled(false)
	slot0.selectPanel:visible(false)

	slot0.sectionCsv = slot0:getSectionCsv()
	slot0.chapterType = 1
	slot0.wayDatas = {}
	slot4 = {}

	slot0.title:text(gLanguageCsv.specialGet)
	slot0.title1:text(gLanguageCsv.specialWay)
	slot0:initWayDatas(slot4)
	slot0:initEmpty()

	if itertools.size(slot4) > 1 then
		slot0.chapterType = 3
	else
		slot0.chapterType = next(slot4) or 1
	end

	uv5 = "initModel"
	slot5 = slot5[slot0.chapterType]
	slot7 = slot0

	slot0.initWaySelectDatas(slot7, slot5)

	uv7 = "cb"
	slot7 = slot7[slot0.chapterType]

	dataEasy.fixSaoDangLocalKey(slot7, slot5)

	uv7 = "cb"
	slot0.sweepSelected = userDefault.getForeverLocalKey(slot7[slot0.chapterType], 1)
	slot0.mopUpNum = slot5[math.min(#slot5, slot0.sweepSelected)]

	slot0:initSweepLocked(slot5)
	Dialog.onCreate(slot0)
end

function slot1.initTopInfo(slot0)
	slot0.keyData = {
		key = slot0.key
	}

	uiEasy.setIconName(slot0.key, nil, {
		node = slot0.cardNameText
	})
	text.deleteAllEffect(slot0.cardNameText)
	idlereasy.when(dataEasy.getListenNumByKey(slot0.key), function (slot0, slot1)
		uv2 = "setNum"

		slot2:setNum(slot1)
	end)
end

function slot1.isShowTargetNum(slot0)
	if tonumber(slot0.targetNum) then
		return tonumber(slot0.targetNum) > 1
	else
		return false
	end
end

function slot1.initWayDatas(slot0, slot1)
	slot3 = dataEasy.getCfgByKey(slot0.key)

	for slot7 = 1, math.huge do
		if not slot3["produceGate" .. slot7] or slot3["produceGate" .. slot7] == "" then
			break
		end

		slot9 = slot3["produceGate" .. slot7]
		uv9 = "key"
		slot9 = slot9.NOTOPEN
		slot11 = nil
		slot12 = ""
		slot13 = {}
		slot14 = gLanguageCsv[string.split(slot9, "-")[1]] or ""
		uv15 = "dataEasy"

		if slot15[slot10] then
			uv15 = "dataEasy"
			slot14 = slot15[slot10]
		end

		uv15 = "getCfgByKey"

		if slot15[slot10] then
			uv15 = "getCfgByKey"
			slot14 = slot15[slot10]
		end

		if #slot8 == 1 and tonumber(slot8[1]) then
			slot11 = tonumber(slot8[1])
			slot12, slot9 = slot0:getGateDescribe(slot11)
			slot10 = "gate"
			slot15 = slot0.gateStar:read()
			slot16, slot17, slot18, slot14 = dataEasy.getChapterInfoByGateID(slot11)

			if slot0:checkCanSweep(slot11) then
				uv20 = "key"
				slot9 = slot20.MOPUP

				slot0.selectPanel:visible(true)

				slot1[slot16] = true
			end

			for slot24, slot25 in csvMapPairs((csv.scene_conf[slot11] or {}).dropIds or {}) do
				table.insert(slot13, {
					key = slot24,
					num = slot25
				})
			end

			slot0.chapterType = slot16
		else
			if type(slot0.WAY_TITLE[slot10]) == "table" and slot8[2] then
				slot12 = slot15[tonumber(slot8[2]) or slot8[2]] or ""
			else
				slot16 = slot15

				if type(slot15) == "table" or slot15 == nil then
					slot16 = gLanguageCsv[slot10]
				end

				slot12 = string.format(gLanguageCsv.acquiringWay, slot16)
			end

			uv16 = "key"
			slot9 = slot16.LEAVEFOR

			if slot10 == "shop" then
				uv17 = "math"

				if slot17[tonumber(slot8[2]) or 1].unlockKey then
					if dataEasy.isUnlock(slot17) then
						uv18 = "math"

						if slot18[slot16].mustHaveUion == true and not slot0.unionId:read() then
							uv18 = "key"
							slot9 = slot18.NOTOPEN
						end
					end
				end
			end
		end

		if slot0:canShow(slot8) then
			uv18 = "huge"

			table.insert(slot0.wayDatas, {
				title = slot14,
				btnTitle = slot18[slot9],
				produceGate = slot3["produceGate" .. slot7],
				typ = slot9,
				txt = slot12,
				gateId = slot11,
				dropIds = slot13,
				id = slot3.id,
				targetNum = slot0.targetNum
			})
		end
	end

	adapt.oneLinePos(slot0.title, slot0.title1, cc.p(10, 0), "left")
end

function slot1.initWaySelectDatas(slot0, slot1)
	slot2 = {}

	for slot6 = 1, #slot1 do
		table.insert(slot2, string.format(gLanguageCsv.sweepManyTimes, slot1[slot6]))
	end

	slot0.waySelectDatas:set(slot2)
end

function slot1.initEmpty(slot0)
	slot2 = #slot0.wayDatas == 0

	slot0.emptyTxt:visible(slot2)
	slot0.emptyBg:visible(slot2)
	slot0.emptyTxt:text(dataEasy.getCfgByKey(slot0.key).produceDesc or "")
	slot0.emptyBg:scale((slot0.emptyTxt:width() + 100) / slot0.emptyBg:width())
end

function slot1.initSweepLocked(slot0, slot1)
	idlereasy.when(slot0.vipLevel, function (slot0, slot1)
		slot4 = 0
		uv6 = "gVipCsv"

		for slot8 = 2, #slot6 do
			uv9 = "gVipCsv"

			if dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.GateSaoDangTimes) < slot9[slot8] then
				uv9 = "gVipCsv"

				if gVipCsv[slot1].saodangCountOpen < slot9[slot8] then
					slot4 = slot8
				end
			end
		end

		uv5 = "saodangCountOpen"

		slot5.locked:set(slot4)
	end)
end

function slot1.getSectionCsv(slot0)
	slot1 = {}

	for slot5, slot6 in csvPairs(csv.world_map) do
		if ({
			cfg = slot6
		}).cfg.chapterType then
			if not slot1[slot7.cfg.chapterType] then
				slot1[slot7.cfg.chapterType] = {}
			end

			slot7.sortIndex = slot5

			table.insert(slot1[slot7.cfg.chapterType], slot7)
		end
	end

	for slot5, slot6 in pairs(slot1) do
		table.sort(slot6, function (slot0, slot1)
			return slot0.sortIndex < slot1.sortIndex
		end)
	end

	return slot1
end

function slot1.canShow(slot0, slot1)
	slot2 = true

	if #slot1 == 1 and tonumber(slot1[1]) then
		slot4, slot5 = dataEasy.getChapterInfoByGateID(tonumber(slot1[1]))

		if slot5 ~= 0 then
			slot2 = slot0.sectionCsv[slot4][slot5] ~= nil
		end
	elseif slot1[1] == "shop" then
		uv4 = "tonumber"

		if slot4[tonumber(slot1[2]) or 1].unlockKey and not dataEasy.isUnlock(slot4) then
			slot2 = false
		end

		if not gShopGainMap[slot0.key] then
			slot2 = false
		end
	elseif slot1[1] == "townSupermarket" then
		slot2 = dataEasy.isTownBuildingUnlock(game.TOWN_BUILDING_ID.SUPERSHOP)
	end

	if slot1[1] == "drawCard" and not gDrawPreviewMap[slot0.key] then
		slot2 = false
	end

	return slot2
end

function slot1.getGateDescribe(slot0, slot1)
	slot2, slot3, slot4, slot5 = dataEasy.getChapterInfoByGateID(slot1)
	uv6 = "dataEasy"
	slot6 = slot6.NOTOPEN
	slot7 = ""

	if slot3 == 0 then
		uv8 = "dataEasy"
		slot6 = slot8.LEAVEFOR

		if slot2 == 1 then
			slot7 = string.format("%s%s", gLanguageCsv.gateStory, gLanguageCsv.gate)
		else
			slot7 = string.format("%s%s", gLanguageCsv.gateDifficult, gLanguageCsv.gate)
		end
	elseif slot0.sectionCsv[slot2][slot3] then
		slot9 = slot8.cfg
		uv9 = "dataEasy"
		slot6 = slot9.LEAVEFOR

		if slot4 ~= 0 then
			slot9 = slot9.name
			slot7 = slot9 .. " " .. slot3 .. "-" .. slot4
			uv9 = "dataEasy"
			slot6 = slot9.NOTOPEN
		end
	end

	return slot7, slot6
end

function slot1.getOtherDescribe(slot0, slot1, slot2)
	return true
end

function slot1.checkCanSweep(slot0, slot1)
	return slot0.gateStar:read()[slot1] and slot2[slot1].star == 3
end

function slot1.initModel(slot0)
	slot0.gateStar = gGameModel.role:getIdler("gate_star")
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.stamina = gGameModel.role:getIdler("stamina")
	slot0.buyHerogateTimes = gGameModel.daily_record:getIdler("buy_herogate_times")
	slot0.gateTimes = gGameModel.daily_record:getIdler("gate_times")
	slot0.unionId = gGameModel.role:getIdler("union_db_id")
	slot0.locked = idler.new(0)
	slot0.waySelectDatas = idlertable.new()
end

function slot1.setNum(slot0, slot1)
	slot0.num:text(slot1)

	if not slot0:isShowTargetNum() then
		slot0.num1:hide()

		return
	end

	slot0.num1:text("/" .. slot0.targetNum):show()
	adapt.oneLinePos(slot0.num, slot0.num1)

	slot2 = ui.COLORS.NORMAL.RED

	if slot0.targetNum <= slot1 then
		slot2 = ui.COLORS.NORMAL.FRIEND_GREEN
	end

	text.addEffect(slot0.num, {
		color = slot2
	})
end

function slot1.onWayItemClick(slot0, slot1, slot2, slot3)
	uv5 = "typ"

	if slot3.typ == slot5.LEAVEFOR then
		slot5 = dataEasy.isZawakeFragment(slot0.key)

		if csv.card_mega_convert[slot3.id] then
			jumpEasy.jumpTo(slot3.produceGate, {
				id = slot3.id,
				num = slot3.targetNum
			})
		elseif slot5 then
			jumpEasy.jumpTo(slot3.produceGate, {
				fragID = slot0.key,
				needNum = slot3.targetNum
			})
		else
			jumpEasy.jumpTo(slot3.produceGate)
		end
	else
		uv5 = "typ"

		if slot3.typ == slot5.MOPUP then
			slot0.gateId = slot3.gateId

			slot0:onSweepBtn()
		end
	end
end

function slot1.onTimesBtnClick(slot0, slot1)
	if gVipCsv[gGameModel.role:read("vip_level")].buyHeroGateTimes <= (slot0.buyHerogateTimes:read()[slot0.gateId] or 0) then
		gGameUI:showTip(gLanguageCsv.herogateBuyMax)

		return
	end

	if slot1 > 0 then
		gGameUI:showTip(gLanguageCsv.haveChallengeTimesUnused)

		return
	end

	gGameUI:showDialog({
		btnType = 2,
		isRich = true,
		content = {
			"#C0x5b545b#" .. string.format(gLanguageCsv.resetNumberEliteLevels1, gCostCsv.herogate_buy_cost[(slot3[slot0.gateId] or 0) + 1]),
			"#C0x5b545b#" .. string.format(gLanguageCsv.resetNumberEliteLevels2, slot3[slot0.gateId] or 0, slot2)
		},
		cb = function ()
			uv4 = "gGameApp"

			gGameApp:requestServer("/game/role/hero_gate/buy", function ()
				gGameUI:showTip(gLanguageCsv.resetSuccess)
			end, slot4.gateId)
		end,
		dialogParams = {
			clickClose = false
		}
	})
end

function slot1.checkSweep(slot0)
	if dataEasy.getStamina() < csv.scene_conf[slot0.gateId].staminaCost then
		gGameUI:stackUI("common.gain_stamina")

		return false
	end

	slot0.curMopUpNum = math.min(slot0.mopUpNum, math.floor(slot2 / slot1))

	if slot0.gateTimes:read()[slot0.gateId] then
		slot4 = csv.scene_conf[slot0.gateId].dayChallengeMax - slot0.gateTimes:read()[slot0.gateId]
	end

	slot5 = slot0.buyHerogateTimes:read()[slot0.gateId] or 0
	slot6, slot7, slot8 = dataEasy.isDoubleHuodong("heroGateTimes")

	if slot6 then
		for slot12, slot13 in pairs(slot7) do
			if slot13.count and slot14 > 0 and slot5 == 0 then
				slot4 = slot4 + slot14
			end
		end
	end

	if slot4 and slot4 <= 0 then
		slot0:onTimesBtnClick(slot4)

		return false
	end

	return true
end

function slot1.onSweepBtn(slot0)
	if not slot0:checkSweep() then
		return
	end

	if slot0.curMopUpNum == 50 then
		sdk.trackEvent("use_raid50")
	end

	slot2 = slot0.roleLv:read()
	slot3 = gGameModel.capture:read("limit_sprites")

	gGameApp:requestServer("/game/saodang", function (slot0)
		slot1 = slot0.view.result

		table.insert(slot1, {
			exp = 0,
			isExtra = true,
			items = slot0.view.extra
		})

		uv8 = "view"
		uv8 = "result"
		slot8 = slot8:createHandler("onSweepBtn")
		uv8 = "result"
		slot9 = slot8
		slot8 = slot8.createHandler(slot9, "checkSweep")
		uv8 = "result"
		slot8 = slot8.targetNum
		uv8 = "result"
		slot8 = slot8.key
		uv8 = "table"
		uv8 = "insert"
		uv8 = "result"
		uv9 = "insert"

		gGameUI:stackUI("city.gate.sweep", nil, , {
			from = "gainWay",
			hasExtra = true,
			sweepData = slot1,
			oldRoleLv = slot8,
			cb = slot8,
			checkCb = slot8,
			targetNum = slot8,
			targetId = slot8,
			oldCapture = slot8,
			gateId = slot8,
			curMopUpNum = slot8.curMopUpNum,
			isDouble = dataEasy.isGateIdDoubleDrop(slot9),
			catchup = slot0.view.catchup
		})
	end, slot0.gateId, slot0.curMopUpNum, slot0.key, slot0.targetNum and slot0.targetNum - dataEasy.getNumByKey(slot0.key))

	return true
end

function slot1.onSortMenusBtnClick(slot0, slot1, slot2, slot3, slot4)
	uv5 = "chapterType"

	if not dataEasy.getSaoDangState(slot5[slot0.chapterType][slot3]).canSaoDang then
		gGameUI:showTip(slot6.tip)

		return
	end

	slot0.mopUpNum = slot5[slot3]
	uv8 = "dataEasy"

	userDefault.setForeverLocalKey(slot8[slot0.chapterType], slot3)
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
