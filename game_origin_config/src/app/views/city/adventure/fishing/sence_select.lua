slot0 = require("app.views.city.adventure.fishing.tools")
slot1 = class("SenceSelectView", cc.load("mvc").ViewBase)
slot2 = 86400
slot1.RESOURCE_FILENAME = "fishing_main.json"
slot1.RESOURCE_BINDING = {
	btn = "btnItem",
	["right.time.txt1"] = "refreshTimeTxt",
	["right.underRight.btnEnter"] = "btnEnter",
	imgBg = "imgBg",
	["right.underRight.times"] = "times",
	["right.underRight.tip"] = "tip",
	["right.scenePanel.item"] = "item",
	["right.underRight.numTip"] = "numTip",
	["right.underRight.time"] = "time",
	["right.scenePanel"] = "scenePanel",
	right = "right",
	["right.scenePanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("fishShow"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						event = "extend",
						class = "fish_icon",
						props = {
							lock = true,
							onNodeClick = true,
							data = {
								key = slot3
							}
						}
					})
				end
			}
		}
	},
	["right.time.txt2"] = {
		varname = "refreshTime",
		binds = {
			event = "text",
			idler = bindHelper.self("deltaTime"),
			method = function (slot0)
				return time.getCutDown(slot0).str
			end
		}
	},
	["right.underLeft.btnLv"] = {
		varname = "btnLv",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnLv")
			}
		}
	},
	["right.underLeft.btnHandbook"] = {
		varname = "btnHandbook",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnHandbook")
			}
		}
	},
	["right.underLeft.btnShop"] = {
		varname = "btnShop",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnShop")
			}
		}
	},
	["right.underLeft.btnTools"] = {
		varname = "btnTools",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnTools")
			}
		}
	},
	["right.underLeft.btnRank"] = {
		varname = "btnRank",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnRank")
			}
		}
	},
	["right.underRight.btnCatch"] = {
		varname = "btnCatch",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnCatch")
			}
		}
	},
	["left.listview"] = {
		varname = "btnList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				dataOrderCmp = function (slot0, slot1)
					if slot0.sort ~= slot1.sort then
						return slot1.sort < slot0.sort
					end

					return slot0.csvId < slot1.csvId
				end,
				data = bindHelper.self("btnDatas"),
				item = bindHelper.self("btnItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = slot1:get("btnSelected")

					slot1:get("btnNormal"):get("lock"):visible(slot3.myLv < slot3.needLv or slot3.lock == 0)

					if slot2 == game.FISHING_GAME then
						slot4:loadTextureNormal("city/adventure/fishing/tab_dyds.png")
						slot5:loadTextureNormal("city/adventure/fishing/tab_selected_dyds.png")

						if matchLanguage({
							"en"
						}) then
							adapt.setTextScaleWithWidth(slot4:get("textNote"), slot3.name, slot1:width() - 170)
							adapt.setTextScaleWithWidth(slot5:get("textNote"), slot3.name, slot1:width() - 150)
							slot4:get("waiting"):width(220)
							slot5:get("waiting"):width(220)
							slot4:get("waiting.txt"):x(100)
							slot5:get("waiting.txt"):x(100)
						end
					end

					slot5:visible(slot3.selected)
					slot4:visible(not slot3.selected)
					slot4:get("textNote"):text(slot3.name)
					slot5:get("textNote"):text(slot3.name)
					idlereasy.when(gGameModel.role:getIdler("cross_fishing_round"), function (slot0, slot1)
						uv2 = "game"

						if slot2 == game.FISHING_GAME then
							uv2 = "FISHING_GAME"

							if slot2.preTime then
								uv2 = "FISHING_GAME"
								uv3 = "preTime"

								if slot2.preTime >= slot3 then
									slot2 = false

									if false then
										slot2 = false
									end
								else
									slot2 = true
								end
							end
						end

						uv3 = "get"
						slot3 = slot3:get("waiting")
						slot3 = slot3.visible

						slot3(slot3, slot2 and slot1 == "closed")

						uv3 = "waiting"

						slot3:get("waiting"):visible(slot2 and slot1 == "closed")
					end):anonyOnly(slot0)

					if matchLanguage({
						"kr"
					}) then
						slot5:get("waiting"):width(200)
						slot4:get("waiting"):width(200)
						slot5:get("waiting"):x(300)
						slot4:get("waiting"):x(300)
						slot5:get("waiting.txt"):x(100)
						slot4:get("waiting.txt"):x(100)
					end

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
	["right.scenePanel.txt"] = {
		varname = "txtCommon",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["right.underLeft.btnLv.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["right.underLeft.btnHandbook.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["right.underLeft.btnShop.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["right.underLeft.btnTools.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["right.underLeft.btnRank.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	}
}

function slot1.onCreate(slot0)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "FISHING",
		title = gLanguageCsv.angling
	})
	slot0:enableSchedule()
	slot0:initModel()
	slot0:initBgMask()

	slot0.oldLv = slot0.fishLevel:read()

	adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.scenePanel:get("bg"),
			"width"
		},
		{
			slot0.mask1,
			"width"
		},
		{
			slot0.list,
			"width"
		},
		{
			slot0.right:get("tip.bg"),
			"width"
		},
		{
			slot0.right:get("time.bg"),
			"width"
		}
	})

	slot0.showTab = idler.new(slot0.crossFishingRound:read() == "start" and game.FISHING_GAME or 1)
	slot0.fishShow = idlers.new({})
	slot0.deltaTime = idler.new(0)

	for slot5, slot6 in csvPairs(csv.fishing.scene) do
		-- Nothing
	end

	slot0.btnDatas = idlers.newWithMap({
		[slot5] = {
			selected = false,
			myLv = 1,
			sort = 0,
			csvId = slot5,
			name = slot6.name,
			res = slot6.res,
			typ = slot6.type,
			needLv = slot6.needLv,
			priview = slot6.priview,
			lock = slot6.lock
		}
	})

	idlereasy.any({
		slot0.fishLevel,
		slot0.fishCounter,
		slot0.targetCounter,
		slot0.fishingCounter,
		slot0.isAuto,
		slot0.selectScene,
		slot0.crossFishingRound
	}, function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		uv8 = "right"

		slot8.right:get("tip"):visible(slot5)

		for slot11, slot12 in csvPairs(csv.fishing.scene) do
			uv13 = "right"

			slot13.btnDatas:at(slot11):modify(function (slot0)
				uv1 = "myLv"
				slot0.myLv = slot1

				if slot0.typ == 2 then
					uv1 = "typ"
					slot1 = slot1 == "start" and 1 or 0
					slot0.sort = slot1
					uv1 = "sort"
					slot0.preTime = slot1:getFishingGamePreTime()
				end
			end, true)
		end

		slot8 = dataEasy.tryCallFunc
		uv9 = "right"
		slot10 = "filterSortItems"

		slot8(slot9.btnList, slot10, true)

		uv8 = "right"
		slot8.nowCounter = gCommonConfigCsv.fishingDailyTimes - slot4
		uv8 = "right"
		slot8 = slot8.times
		slot9 = slot8
		uv10 = "right"
		slot10 = slot10.nowCounter .. "/" .. gCommonConfigCsv.fishingDailyTimes

		slot8.text(slot9, slot10)

		slot8 = bind.touch
		uv9 = "right"
		uv10 = "right"

		slot8(slot9, slot10.btnEnter, {
			methods = {
				ended = function ()
					uv0 = "onBtnEnter"
					uv2 = "onBtnEnter"
					slot2 = slot2.showTab
					slot3 = slot2
					uv3 = "showTab"

					slot0:onBtnEnter(slot2.read(slot3), slot3)
				end
			}
		})

		uv8 = "right"

		slot8.showTab:addListener(function (slot0, slot1, slot2)
			uv3 = "btnDatas"
			slot3 = slot3.btnDatas
			uv4 = "btnDatas"
			slot4 = slot3.btnDatas:atproxy(slot1)
			slot4.selected = false
			uv4 = "btnDatas"
			slot4.btnDatas:atproxy(slot0).selected = true
			slot4 = {}

			for slot8, slot9 in orderCsvPairs(slot3.atproxy(slot4, slot0).priview) do
				table.insert(slot4, slot9)
			end

			uv5 = "btnDatas"
			slot5 = slot5.fishShow
			slot5 = slot5.update

			slot5(slot5, slot4)

			uv5 = "btnDatas"
			slot5 = slot5.btnEnter
			slot5 = slot5.setTouchEnabled

			slot5(slot5, slot3.needLv <= slot3.myLv)

			uv5 = "btnDatas"
			slot5 = slot5.btnCatch
			slot5 = slot5.setTouchEnabled

			slot5(slot5, slot3.needLv <= slot3.myLv)

			uv5 = "btnDatas"

			slot5.tip:visible(slot3.myLv < slot3.needLv)

			if slot0 == game.FISHING_GAME then
				slot6 = gUnlockCsv.gameCatch
				uv6 = "btnDatas"

				slot6.btnCatch:visible(slot3.needLv <= slot3.myLv and dataEasy.isUnlock(slot6) == true)
			else
				slot6 = gUnlockCsv.catch
				uv6 = "btnDatas"

				slot6.btnCatch:visible(slot3.needLv <= slot3.myLv and dataEasy.isUnlock(slot6) == true)
			end

			uv5 = "btnDatas"
			slot5 = slot5.numTip
			slot5 = slot5.visible

			slot5(slot5, slot3.myLv < slot3.needLv)

			uv5 = "btnDatas"
			slot5 = slot5.numTip
			slot6 = slot5
			slot7 = slot3.needLv

			slot5.text(slot6, slot7)

			uv6 = "btnDatas"
			slot6 = slot6.tip
			uv7 = "btnDatas"

			adapt.oneLinePos(slot6, slot7.numTip, cc.p(0, 0), "left")

			uv6 = "btnDatas"
			slot6 = slot6.btnEnter

			cache.setShader(slot6, false, slot3.needLv <= slot3.myLv and "normal" or "hsl_gray")

			slot5 = cache.setShader
			uv6 = "btnDatas"

			slot5(slot6.btnCatch, false, slot3.needLv <= slot3.myLv and "normal" or "hsl_gray")

			uv5 = "btnDatas"

			slot5.right:get("time"):hide()

			if slot0 == game.FISHING_GAME then
				uv5 = "atproxy"

				if slot5 == "closed" then
					uv5 = "btnDatas"
					uv7 = "btnDatas"

					slot5:fishingGameTimer(slot7.btnDatas:atproxy(game.FISHING_GAME).preTime)
				end
			end

			uv5 = "btnDatas"
			slot5 = slot5.btnTools
			slot5 = slot5.visible

			slot5(slot5, slot3.needLv <= slot3.myLv or slot0 == game.FISHING_GAME)

			uv5 = "btnDatas"
			slot5 = slot5.btnLv
			slot5 = slot5.visible

			slot5(slot5, slot3.needLv <= slot3.myLv or slot0 == game.FISHING_GAME)

			uv5 = "btnDatas"
			slot5 = slot5.btnHandbook
			slot5 = slot5.visible

			slot5(slot5, slot3.needLv <= slot3.myLv or slot0 == game.FISHING_GAME)

			uv5 = "btnDatas"
			slot5 = slot5.btnShop
			slot5 = slot5.visible

			slot5(slot5, slot3.needLv <= slot3.myLv or slot0 == game.FISHING_GAME)

			uv5 = "btnDatas"
			slot5 = slot5.time
			slot5 = slot5.visible

			slot5(slot5, slot3.needLv <= slot3.myLv)

			uv5 = "btnDatas"

			slot5.times:visible(slot3.needLv <= slot3.myLv)

			if slot0 == game.FISHING_GAME then
				uv5 = "atproxy"

				if slot5 == "closed" then
					uv5 = "btnDatas"
					slot5 = slot5.btnEnter
					slot6 = slot5

					slot5.setTouchEnabled(slot6, false)

					slot5 = cache.setShader
					uv6 = "btnDatas"

					slot5(slot6.btnEnter, false, "hsl_gray")

					uv5 = "btnDatas"

					slot5.right:get("tip"):hide()
				end
			else
				uv5 = "btnDatas"

				if slot5.isAuto:read() == true then
					uv5 = "btnDatas"

					slot5.right:get("tip"):show()
				end
			end

			uv5 = "btnDatas"
			slot5 = slot5.scenePanel:get("pos.clippingNode")
			slot6 = slot5.removeAllChildren

			slot6(slot5)

			uv6 = "btnDatas"
			slot6 = slot6.btnRank
			slot6 = slot6.visible

			slot6(slot6, slot0 == game.FISHING_GAME)

			uv6 = "btnDatas"
			slot6 = slot6.right:get("fishingGameTag")
			slot7 = slot6
			slot6 = slot6.visible

			if slot0 == game.FISHING_GAME then
				uv8 = "atproxy"

				if slot8 ~= "start" then
					slot8 = false
				else
					slot8 = true
				end
			end

			slot6(slot7, slot8)
			widget.addAnimationByKey(slot5, slot3.res, "diaoyuBg", "effect_loop", 1):scale(1.5)

			if slot0 == game.FISHING_GAME then
				uv7 = "btnDatas"

				widget.addAnimationByKey(slot7.scenePanel:get("pos.clippingNode.diaoyuBg"), "fishing/diaoyudasai.skel", "diaoyudasai", "effect_loop", 2):xy(-300, 90)
			end
		end)
	end)
end

function slot1.fishingGameTimer(slot0, slot1)
	slot0:unSchedule(7000)
	slot0.deltaTime:set(0)
	slot0.right:get("time"):hide()

	if not slot1 then
		return
	end

	slot0.deltaTime:set(slot1)

	slot2 = slot0.right:get("time")
	slot3 = slot2
	slot2 = slot2.visible

	if slot1 > 0 then
		uv4 = "unSchedule"

		if slot1 >= slot4 then
			slot4 = false
		else
			slot4 = true
		end
	end

	slot2(slot3, slot4)
	slot0:schedule(function ()
		uv0 = "right"
		uv0 = 1
		uv0 = "right"

		if slot0 - 1 > 0 then
			uv0 = "right"
			uv1 = "get"

			if slot1 < slot0 then
				uv0 = "time"

				slot0.right:get("time"):hide()
			end
		end

		uv0 = "time"
		uv2 = "right"

		slot0.deltaTime:set(slot2)

		uv3 = "time"
		slot3 = slot3.refreshTimeTxt
		slot3 = slot3.y
		uv3 = "time"
		slot3 = slot3.refreshTimeTxt
		uv3 = "time"

		adapt.oneLineCenterPos(cc.p(400, slot3(slot3)), {
			slot3,
			slot3.refreshTime
		})
	end, 1, 0, 7000)
end

function slot1.initModel(slot0)
	slot0.fishLevel = gGameModel.fishing:getIdler("level")
	slot0.fishCounter = gGameModel.fishing:getIdler("fish_counter")
	slot0.targetCounter = gGameModel.fishing:getIdler("target_counter")
	slot0.fishingCounter = gGameModel.daily_record:getIdler("fishing_counter")
	slot0.selectScene = gGameModel.fishing:getIdler("select_scene")
	slot0.isAuto = gGameModel.fishing:getIdler("is_auto")
	slot0.crossFishingRound = gGameModel.role:getIdler("cross_fishing_round")
	slot0.selectRod = gGameModel.fishing:getIdler("select_rod")
	slot0.selectBait = gGameModel.fishing:getIdler("select_bait")
	slot0.items = gGameModel.role:getIdler("items")
end

function slot1.initBgMask(slot0)
	slot0.mask1 = ccui.Scale9Sprite:create()

	slot0.mask1:initWithFile(cc.rect(50, 50, 1, 1), "city/adventure/fishing/mask_dy_bgpre.png")
	slot0.mask1:size(cc.size(1858, 888))

	slot1 = cc.ClippingNode:create(slot0.mask1):setAlphaThreshold(0.1):addTo(slot0.scenePanel:get("pos"), 1, "clippingNode")
end

function slot1.onSelectClick(slot0, slot1, slot2, slot3)
	if slot3.lock ~= 0 then
		slot0.showTab:set(slot2)
	else
		gGameUI:showTip(gLanguageCsv.pleaseWaitOpen)

		return
	end

	if slot2 == game.FISHING_GAME and slot0.crossFishingRound:read() == "closed" then
		gGameUI:showTip(gLanguageCsv.fishGameNotStart)
	end
end

function slot1.getFishingGamePreTime(slot0)
	if dataEasy.getCrossServiceData("crossfishing", csv.cross.fishing.base[1].servOpenDays) then
		return time.getNumTimestamp(csv.cross.service[slot1].date, 5) - time.getTime()
	end
end

function slot1.onBtnLv(slot0)
	gGameUI:stackUI("city.adventure.fishing.level")
end

function slot1.onBtnHandbook(slot0)
	gGameUI:stackUI("city.adventure.fishing.book")
end

function slot1.onBtnShop(slot0)
	if not gGameUI:goBackInStackUI("city.shop") then
		gGameApp:requestServer("/game/fishing/shop/get", function (slot0)
			gGameUI:stackUI("city.shop", nil, {
				full = true
			}, game.SHOP_INIT.FISHING_SHOP)
		end)
	end
end

function slot1.onBtnTools(slot0)
	if slot0.crossFishingRound:read() == "closed" and slot0.showTab:read() == game.FISHING_GAME then
		gGameUI:showTip(gLanguageCsv.fishGameNotStart)

		return
	end

	if slot0.isAuto:read() == true and slot0.showTab:read() == gGameModel.fishing:read("select_scene") then
		if slot0.showTab:read() == gGameModel.fishing:read("select_scene") then
			gGameUI:stackUI("city.adventure.fishing.bag", nil, , 1, slot0.showTab:read())
		else
			gGameApp:requestServer("/game/fishing/prepare", function (slot0)
				uv7 = "gGameUI"

				gGameUI:stackUI("city.adventure.fishing.bag", nil, , 1, slot7.showTab:read())
			end, "scene", slot0.showTab:read())
		end
	elseif slot0.isAuto:read() == true and slot0.showTab:read() ~= gGameModel.fishing:read("select_scene") then
		gGameUI:stackUI("city.adventure.fishing.auto", nil, {
			clickClose = false,
			blackLayer = true
		}, idx, slot0:createHandler("onOpenView"))
	elseif slot0.isAuto:read() == false then
		if slot0.showTab:read() == gGameModel.fishing:read("select_scene") then
			gGameUI:stackUI("city.adventure.fishing.bag", nil, , 1, slot0.showTab:read())
		else
			gGameApp:requestServer("/game/fishing/prepare", function (slot0)
				uv7 = "gGameUI"

				gGameUI:stackUI("city.adventure.fishing.bag", nil, , 1, slot7.showTab:read())
			end, "scene", slot0.showTab:read())
		end
	end
end

function slot1.onBtnRank(slot0)
	gGameApp:requestServer("/game/cross/fishing/rank", function (slot0)
		gGameUI:stackUI("city.adventure.fishing.rank", nil, , slot0.view)
	end)
end

function slot1.onBtnCatch(slot0)
	if slot0.showTab:read() == game.FISHING_GAME and slot0.crossFishingRound:read() == "closed" then
		gGameUI:showTip(gLanguageCsv.fishGameNotStart)

		return
	end

	slot2 = slot0.selectRod:read()
	slot4 = 0

	if csv.fishing.bait[slot0.selectBait:read()] then
		slot4 = slot0.items:read()[slot3.itemId] == nil and 0 or slot0.items:read()[slot3.itemId]
	end

	slot5 = slot4 < slot0.nowCounter and slot4 or slot0.nowCounter

	if slot2 == 0 then
		gGameUI:showTip(gLanguageCsv.noRod)

		return
	elseif slot1 == 0 then
		gGameUI:showTip(gLanguageCsv.noBait)

		return
	elseif slot1 then
		if not itertools.map(slot3.scene, function (slot0, slot1)
			return slot1, true
		end)[slot0.showTab:read()] then
			gGameUI:showTip(gLanguageCsv.noBait)

			return
		end

		if slot4 == 0 then
			gGameUI:showTip(gLanguageCsv.noBaitCount)

			return
		end
	end

	if slot0.nowCounter <= 0 then
		gGameUI:showTip(gLanguageCsv.fishNoTimes)

		return
	end

	if slot0.isAuto:read() == true then
		gGameUI:stackUI("city.adventure.fishing.auto", nil, {
			clickClose = false,
			blackLayer = true
		}, nil, slot0:createHandler("autoLvUp"))

		return
	end

	if slot0.showTab:read() ~= gGameModel.fishing:read("select_scene") then
		gGameApp:requestServer("/game/fishing/prepare", nil, "scene", slot0.showTab:read())
	end

	slot6 = slot0.fishLevel:read()

	gGameUI:showDialog({
		fontSize = 42,
		clearFast = true,
		btnType = 2,
		isRich = true,
		strs = {
			string.format(gLanguageCsv.catchTip, slot5, slot3.name, slot5)
		},
		cb = function ()
			gGameApp:requestServer("/game/fishing/onekey", function (slot0)
				if slot0.view.fish == nil and slot0.view.award == nil then
					gGameUI:showTip(gLanguageCsv.catchLoseFishRunAway)
				else
					uv7 = "view"
					slot7 = slot7.showTab
					slot8 = slot7
					uv8 = "fish"

					gGameUI:stackUI("city.adventure.fishing.award", nil, {
						clickClose = true,
						blackLayer = true
					}, slot0.view, slot7.read(slot8), slot8)
				end
			end)
		end
	})
end

function slot1.onBtnEnter(slot0, slot1, slot2)
	if slot0.isAuto:read() == true and slot1 == slot2 then
		if slot2 == game.FISHING_GAME then
			gGameApp:requestServer("/game/cross/fishing/rank", function (slot0)
				uv6 = "gGameUI"

				gGameUI:stackUI("city.adventure.fishing.view", nil, {
					full = true
				}, slot6, slot0.view)
			end)
		else
			gGameUI:stackUI("city.adventure.fishing.view", nil, {
				full = true
			}, slot1)
		end
	elseif slot0.isAuto:read() == true and slot1 ~= slot2 then
		gGameUI:stackUI("city.adventure.fishing.auto", nil, {
			clickClose = false,
			blackLayer = true
		}, slot1, slot0:createHandler("fishSprite"))
	elseif slot0.isAuto:read() == false then
		gGameApp:requestServer("/game/fishing/prepare", function (slot0)
			uv1 = "game"

			if slot1 == game.FISHING_GAME then
				gGameApp:requestServer("/game/cross/fishing/rank", function (slot0)
					uv6 = "gGameUI"

					gGameUI:stackUI("city.adventure.fishing.view", nil, {
						full = true
					}, slot6, slot0.view)
				end)
			else
				uv6 = "game"

				gGameUI:stackUI("city.adventure.fishing.view", nil, {
					full = true
				}, slot6)
			end
		end, "scene", slot1)
	end
end

function slot1.autoLvUp(slot0)
	if slot0.oldLv < slot0.fishLevel:read() then
		gGameUI:stackUI("city.adventure.fishing.upgrade")
	end
end

function slot1.fishSprite(slot0)
	if slot0.oldLv < slot0.fishLevel:read() then
		gGameUI:stackUI("city.adventure.fishing.upgrade", nil, , slot0:createHandler("onOpenView"))
	else
		slot0:onOpenView()
	end
end

function slot1.onOpenView(slot0)
	if slot0.showTab:read() == game.FISHING_GAME and slot0.crossFishingRound:read() == "closed" then
		gGameUI:showTip(gLanguageCsv.fishGameNotStart)

		return
	end

	gGameApp:requestServer("/game/fishing/prepare", function (slot0)
		uv1 = "showTab"

		if slot1.showTab:read() == game.FISHING_GAME then
			gGameApp:requestServer("/game/cross/fishing/rank", function (slot0)
				uv6 = "gGameUI"

				gGameUI:stackUI("city.adventure.fishing.view", nil, {
					full = true
				}, slot6.showTab:read(), slot0.view)
			end)

			return
		end

		uv6 = "showTab"

		gGameUI:stackUI("city.adventure.fishing.view", nil, {
			full = true
		}, slot6.showTab:read())
	end, "scene", slot0.showTab:read())
end

return slot1
