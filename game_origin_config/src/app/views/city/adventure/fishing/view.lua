slot1 = class("FishingView", cc.load("mvc").ViewBase)
slot2 = {
	INSIDE = 1,
	OUTSIDE = 2
}
slot3 = {
	CLOSE = 2,
	SHOWTIP = 1
}
slot4 = {
	BEGAN = 1,
	END = 2
}
slot5 = 220
slot1.RESOURCE_FILENAME = "fishing.json"
slot1.RESOURCE_BINDING = {
	waitPanel = "waitPanel",
	["partner.partnerPos"] = "partnerPos",
	["rightPanel.timesPanel"] = "timesPanel",
	["centerPanel.barPanel.bar"] = "scoreBar",
	["auto.time"] = "txtRefreshTime",
	activityTip = "activityTip",
	["rightPanel.btnThrow"] = "btnThrow",
	["rightPanel.imgTip"] = "imgTip",
	["auto.fish.item"] = "fishItem",
	auto = "auto",
	centerPanel = "centerPanel",
	timer = "timer",
	partner = "partner",
	["txtRank.item"] = "rankItem",
	["centerPanel.fishingPanel"] = "fishingPanel",
	["auto.fish"] = "autoFish",
	["rightPanel.btnTake"] = "btnTake",
	["centerPanel.fishingPanel.bg"] = "fishBg",
	["centerPanel.fishingPanel.line"] = "line",
	leftPanel = "leftPanel",
	["centerPanel.fishingPanel.fish"] = "fish",
	["recordPanel.item"] = "item",
	recordPanel = "recordPanel",
	["centerPanel.fishingPanel.fishhook"] = "fishhook",
	txtRank = "txtRank",
	["auto.award.item"] = "awardItem",
	["timer.txt2"] = {
		varname = "gameEndTimerTxt",
		binds = {
			event = "text",
			idler = bindHelper.self("gameTimer"),
			method = function (slot0)
				return time.getCutDown(slot0).short_clock_str
			end
		}
	},
	["auto.time1"] = {
		varname = "refreshTime",
		binds = {
			event = "text",
			idler = bindHelper.self("deltaTime"),
			method = function (slot0)
				return time.getCutDown(slot0).min_sec_clock
			end
		}
	},
	["auto.fish.list"] = {
		varname = "fishList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("autoFishCfg"),
				item = bindHelper.self("fishItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						event = "extend",
						class = "fish_icon",
						props = {
							onNodeClick = true,
							data = {
								key = slot2,
								num = slot3
							},
							onNode = function (slot0)
								slot0:xy(10, 10)
							end
						}
					})
				end
			}
		}
	},
	["auto.award.list"] = {
		varname = "awardList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("autoAwardCfg"),
				item = bindHelper.self("awardItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.key == "id" then
						slot4 = csv.cards[slot3.val].unitID

						bind.extend(slot0, slot1, {
							class = "card_icon",
							props = {
								unitId = slot4,
								rarity = csv.unit[slot4].rarity,
								star = csv.cards[slot3.val].star
							}
						})
						bind.touch(slot0, slot1, {
							methods = {
								ended = functools.partial(slot0.itemClick, slot1, slot2, slot3)
							}
						})
					else
						bind.extend(slot0, slot1, {
							class = "icon_key",
							props = {
								data = {
									key = slot3.key,
									num = slot3.val
								}
							}
						})
					end
				end
			},
			handlers = {
				itemClick = bindHelper.self("onitemClick")
			}
		}
	},
	["recordPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("fishingRecord"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						event = "extend",
						class = "fish_icon",
						props = {
							onNodeClick = true,
							data = {
								key = slot2,
								num = slot3
							},
							onNode = function (slot0)
								slot0:scale(0.8)
							end
						}
					})
				end
			}
		}
	},
	["txtRank.list"] = {
		varname = "rankList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 10,
				padding = 10,
				data = bindHelper.self("ranksData"),
				item = bindHelper.self("rankItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("rank", "name", "score")

					slot4.rank:text(slot2)
					slot4.name:text(slot3.name)
					slot4.score:text(slot3.point)
				end
			}
		}
	},
	["leftPanel.btnTools"] = {
		varname = "btnTools",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnTools")
			}
		}
	},
	["leftPanel.btnLv"] = {
		varname = "btnLv",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnLv")
			}
		}
	},
	["leftPanel.btnHandbook"] = {
		varname = "btnHandbook",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnHandbook")
			}
		}
	},
	["leftPanel.btnShop"] = {
		varname = "btnShop",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnShop")
			}
		}
	},
	["leftPanel.btnRank"] = {
		varname = "btnRank",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnRank")
			}
		}
	},
	["leftPanel.itemBait"] = {
		varname = "itemBait",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnBait")
			}
		}
	},
	["leftPanel.itemRod"] = {
		varname = "itemRod",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnRod")
			}
		}
	},
	btnRules = {
		varname = "btnRules",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowRule")
			}
		}
	},
	["rightPanel.btnThrow.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 5,
					color = ui.COLORS.OUTLINE.ORANGE
				}
			}
		}
	},
	["rightPanel.btnTake.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 5,
					color = ui.COLORS.OUTLINE.ORANGE
				}
			}
		}
	},
	["leftPanel.btnLv.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["leftPanel.btnHandbook.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["leftPanel.btnShop.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["leftPanel.btnRank.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["leftPanel.btnTools.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["recordPanel.txtRecord"] = {
		varname = "txtRecord",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["rightPanel.timesPanel.surplus"] = {
		varname = "surplus",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["rightPanel.timesPanel.time"] = {
		varname = "time",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["rightPanel.timesPanel.times"] = {
		varname = "times",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["centerPanel.tipPanel.txtKeep"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["centerPanel.tipPanel.txtAnd"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["centerPanel.tipPanel.txtEnd"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["timer.txt1"] = {
		varname = "gameEndTimer",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3)
	slot0.cb = slot3
	slot4 = csv.fishing.scene[slot1]
	slot5 = gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		title = slot4.name,
		subTitle = slot4.titleEn
	})
	slot0.titleBack = slot5
	uv5 = "cb"
	slot5 = slot5.INSIDE
	slot0.skelState = slot5
	uv5 = "csv"
	slot0.autoType = slot5.END

	slot0:initSkel(slot1)
	slot0:initModel()

	slot0.autoFishCfg = idlertable.new({})
	slot0.autoAwardCfg = idlers.newWithMap({})
	slot0.exitType = idler.new("normal")
	slot0.onThrowBtn = idler.new(0)
	slot0.onAutoBtn = idler.new(0)
	slot0.ranksData = idlers.newWithMap({})
	slot0.deltaTime = idler.new(0)
	slot0.gameTimer = idler.new(0)

	if matchLanguage({
		"en"
	}) then
		adapt.setAutoText(slot0.txtRecord, nil, 120)
	else
		slot0.txtRecord:getVirtualRenderer():setLineSpacing(-7)
	end

	slot0.btnRank:visible(slot1 == game.FISHING_GAME)
	slot0.txtRank:visible(slot1 == game.FISHING_GAME)
	slot0.rankList:setTouchEnabled(false)
	slot0.fishingGameSkel:visible(slot1 == game.FISHING_GAME)
	slot0.dasaixiaoren1:visible(slot1 == game.FISHING_GAME)
	slot0.dasaixiaoren2:visible(slot1 == game.FISHING_GAME)
	text.addEffect(slot0.gameEndTimerTxt, {
		outline = {
			color = ui.COLORS.OUTLINE.WHITE
		}
	})

	slot5 = {}

	if slot2 then
		for slot9, slot10 in ipairs(slot2.ranks) do
			if slot9 <= 3 and slot10 then
				table.insert(slot5, slot10)
			end
		end
	end

	slot0.ranksData:update(slot5)

	if slot1 == game.FISHING_GAME then
		slot0:fishingGameTimer()
	end

	slot6 = slot0.fishLevel:read()

	idlereasy.any({
		slot0.fishLevel,
		slot0.fishingRecord,
		slot0.fishingCounter,
		slot0.selectRod,
		slot0.selectBait,
		slot0.selectPartner,
		slot0.items,
		slot0.crossFishingRound
	}, function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
		uv9 = "timer"
		uv11 = "visible"

		slot9.timer:visible(slot11 == game.FISHING_GAME and slot8 == "start")

		slot9 = adapt.oneLineCenterPos
		uv12 = "timer"
		slot12 = slot12.gameEndTimer
		slot12 = slot12.y
		uv12 = "timer"
		slot12 = slot12.gameEndTimer
		uv12 = "timer"

		slot9(cc.p(260, slot12(slot12)), {
			slot12,
			slot12.gameEndTimerTxt
		})

		uv9 = "visible"

		if slot9 ~= game.FISHING_GAME then
			uv9 = "timer"

			slot9:initActivityTip(slot8)
		end

		uv9 = "timer"
		uv10 = "visible"
		slot9.idx = slot10
		uv9 = "timer"
		slot9.nowTimes = gCommonConfigCsv.fishingDailyTimes - slot3
		uv9 = "timer"
		uv11 = "timer"

		slot9.times:text(slot11.nowTimes)

		uv12 = "timer"
		slot12 = slot12.times
		slot12 = slot12.y
		uv12 = "timer"
		slot12 = slot12.surplus
		uv12 = "timer"
		slot12 = slot12.times
		uv12 = "timer"

		adapt.oneLineCenterPos(cc.p(140, slot12(slot12)), {
			slot12,
			slot12,
			slot12.time
		}, cc.p(10, 0))

		slot9 = csv.fishing.level[slot1]
		slot10 = csv.fishing.bait[slot5]

		if slot5 and slot10 then
			uv11 = "timer"
			slot11.baitCount = slot7[slot10.itemId]
			uv11 = "timer"
			slot12 = itertools.map(slot10.scene, function (slot0, slot1)
				return slot1, true
			end)
			slot11.map = slot12
			uv11 = "timer"
			uv12 = "timer"

			if slot11.map[slot12.idx] then
				uv12 = "timer"
				uv13 = "timer"

				bind.extend(slot12, slot13.itemBait, {
					class = "fishtools_icon",
					props = {
						num = true,
						data = {
							typ = 2,
							key = slot10.itemId,
							lock = slot7[slot10.itemId]
						},
						onNode = function (slot0)
							slot0:xy(-4, -4):scale(0.8):z(3)
						end
					}
				})
			end
		end

		slot11 = csv.fishing.rod[slot4]

		if slot4 and slot11 then
			slot12 = bind.extend
			uv13 = "timer"
			uv14 = "timer"

			slot12(slot13, slot14.itemRod, {
				class = "fishtools_icon",
				props = {
					data = {
						typ = 1,
						key = slot11.itemId
					},
					onNode = function (slot0)
						slot0:xy(-4, -4):scale(0.8):z(3)
					end
				}
			})

			uv12 = "timer"

			slot12.diaoyuActionSkel:setSkin(slot11.res)
		end

		uv12 = "timer"

		slot12.partnerPos:get("partner"):visible(slot6 ~= 0)

		if slot6 ~= 0 then
			slot12 = csv.fishing.partner[slot6]
			slot14 = slot12.unitId
			uv14 = "timer"
			slot14 = slot14.partnerPos
			slot15 = slot14

			slot14.removeAllChildren(slot15)

			uv15 = "timer"
			slot14 = widget.addAnimationByKey(slot15.partnerPos, csv.unit[slot14].unitRes, "partner", "standby_loop", 1)
			slot15 = slot14
			slot17 = slot12.scale
			slot14 = slot14.scale(slot15, -slot12.scale, slot17)
			uv15 = "timer"
			slot15 = slot15.partner
			slot16 = slot15
			uv17 = "timer"
			slot17 = slot17.diaoyuActionSkel
			slot18 = slot17
			slot17 = slot17.x(slot18) + 230
			uv18 = "timer"

			slot15.xy(slot16, slot17, slot18.diaoyuActionSkel:y() + 100)

			uv16 = "timer"
			uv17 = "timer"

			bind.touch(slot16, slot17.partner, {
				methods = {
					ended = function ()
						uv0 = "nowTimes"

						if slot0.nowTimes <= 0 then
							gGameUI:showTip(gLanguageCsv.fishNoTimes)
						else
							uv0 = "gGameUI"

							if slot0 ~= nil then
								uv0 = "showTip"

								if slot0 ~= nil then
									uv0 = "nowTimes"
									uv1 = "nowTimes"

									if slot0.map[slot1.idx] ~= true then
										gGameUI:showTip(gLanguageCsv.noBait)
									else
										uv0 = "gLanguageCsv"

										if slot0 ~= nil then
											uv0 = "fishNoTimes"

											if slot0 == nil then
												gGameUI:showTip(gLanguageCsv.noRod)
											else
												uv0 = "gGameUI"

												if slot0 then
													uv0 = "showTip"

													if slot0 then
														uv0 = "map"
														uv1 = "showTip"

														if slot0[slot1.itemId] == nil then
															gGameUI:showTip(gLanguageCsv.noBaitCount)
														else
															uv0 = "nowTimes"
															uv2 = "idx"

															slot0:onPartnerClick(slot2)
														end
													end
												else
													uv0 = "nowTimes"
													uv2 = "idx"

													slot0:onPartnerClick(slot2)
												end
											end
										end
									end
								end
							end
						end
					end
				}
			})
		end

		uv13 = "timer"

		if slot13.idx == game.FISHING_GAME then
			uv13 = "timer"

			if slot13.isAuto then
				uv13 = "timer"

				if slot13.isAuto:read() == true then
					uv13 = "timer"

					slot13.partner:setTouchEnabled(false)
					function ()
						slot0 = 0
						uv1 = "enableSchedule"
						slot1 = slot1.enableSchedule

						slot1(slot1)

						uv1 = "enableSchedule"

						slot1:schedule(function ()
							uv0 = "partner"

							if slot0 == 0 then
								uv0 = "get"
								slot0 = slot0.partner:get("bg")
								slot1 = slot0

								slot0.hide(slot1)

								uv0 = slot1
							else
								uv0 = "partner"

								if slot0 == 1 then
									uv0 = "get"
									slot0 = slot0.partner:get("bg")
									slot0 = slot0.show

									slot0(slot0)

									uv0 = slot0
								end
							end
						end, 5, 0, 7)
					end()
				end
			else
				slot14 = gUnlockCsv.gameAutoFish
				slot13 = dataEasy.isUnlock(slot14)
				uv14 = "timer"
				slot14 = slot14.partner:get("bg")
				slot14 = slot14.visible

				slot14(slot14, slot13)

				uv14 = "timer"

				slot14.partner:setTouchEnabled(slot13)

				if slot13 == true then
					slot12()
				end
			end
		else
			uv13 = "timer"

			if slot13.isAuto then
				uv13 = "timer"

				if slot13.isAuto:read() == true then
					uv13 = "timer"

					slot13.partner:setTouchEnabled(false)
					slot12()
				end
			else
				slot14 = gUnlockCsv.autoFish
				slot13 = dataEasy.isUnlock(slot14)
				uv14 = "timer"
				slot14 = slot14.partner:get("bg")
				slot14 = slot14.visible

				slot14(slot14, slot13)

				uv14 = "timer"

				slot14.partner:setTouchEnabled(slot13)

				if slot13 == true then
					slot12()
				end
			end
		end

		function slot13()
			uv0 = "start"

			if slot0 == "start" then
				uv0 = "onThrowBtn"

				if slot0.onThrowBtn:read() == 0 then
					uv0 = "onThrowBtn"

					if slot0.idx ~= game.FISHING_GAME then
						gGameUI:showDialog({
							fontSize = 40,
							clearFast = true,
							btnType = 2,
							strs = {
								gLanguageCsv.fishGameStartIsFishing
							},
							cb = function ()
								uv0 = "onThrowBtn"
								slot0 = slot0.onThrowBtn
								slot0 = slot0.set
								slot2 = 1

								slot0(slot0, slot2)

								uv0 = "onThrowBtn"
								uv2 = "set"
								uv3 = "set"
								uv4 = "set"
								uv5 = "set"
								uv6 = "onThrow"
								uv7 = "onThrow"
								uv8 = "extraSpeed"
								uv9 = "extraSpeed"

								slot0:onThrow(slot2.extraSpeed, slot3.lowerSpeed, slot4.extraZone, slot5.lowerWait, slot6.lowerRandom, slot7.lowerWait, slot8.timeDown, slot9.fasterSpeed)
							end
						})
					end
				end
			else
				uv0 = "start"

				if slot0 == "closed" then
					uv0 = "onThrowBtn"

					if slot0.idx == game.FISHING_GAME then
						gGameUI:showTip(gLanguageCsv.theContestIsOverCantFishing)
					end
				else
					uv0 = "onThrowBtn"
					uv2 = "read"
					uv3 = "read"
					uv4 = "read"
					uv5 = "read"
					uv6 = "idx"
					uv7 = "idx"
					uv8 = "game"
					uv9 = "game"

					slot0:onThrow(slot2.extraSpeed, slot3.lowerSpeed, slot4.extraZone, slot5.lowerWait, slot6.lowerRandom, slot7.lowerWait, slot8.timeDown, slot9.fasterSpeed)
				end
			end
		end

		uv15 = "timer"
		uv16 = "timer"

		bind.touch(slot15, slot16.btnThrow, {
			methods = {
				ended = function ()
					uv0 = "nowTimes"

					if slot0.nowTimes <= 0 then
						gGameUI:showTip(gLanguageCsv.fishNoTimes)
					else
						uv0 = "gGameUI"

						if slot0 ~= nil then
							uv0 = "showTip"

							if slot0 ~= nil then
								uv0 = "nowTimes"
								uv1 = "nowTimes"

								if slot0.map[slot1.idx] ~= true then
									gGameUI:showTip(gLanguageCsv.noBait)
								else
									uv0 = "gLanguageCsv"

									if slot0 ~= nil then
										uv0 = "fishNoTimes"

										if slot0 == nil then
											gGameUI:showTip(gLanguageCsv.noRod)
										else
											uv0 = "gGameUI"

											if slot0 then
												uv0 = "showTip"

												if slot0 then
													uv0 = "map"
													uv1 = "showTip"

													if slot0[slot1.itemId] == nil then
														gGameUI:showTip(gLanguageCsv.noBaitCount)
													else
														uv0 = "idx"

														slot0()
													end
												end
											else
												uv0 = "idx"

												slot0()
											end
										end
									end
								end
							end
						end
					end
				end
			}
		})

		if slot8 == "closed" then
			uv15 = "timer"
			uv16 = "game"

			if slot15.autoType == slot16.BEGAN then
				uv15 = "timer"

				if slot15.idx == game.FISHING_GAME then
					function ()
						uv0 = "enableSchedule"
						slot0 = slot0:enableSchedule()
						slot0 = slot0.unSchedule

						slot0(slot0, 6000)

						uv0 = "enableSchedule"
						slot0 = slot0:enableSchedule()
						slot0 = slot0.unSchedule

						slot0(slot0, 7000)

						uv0 = "enableSchedule"
						slot0 = slot0.auto
						slot0 = slot0.hide

						slot0(slot0)

						uv0 = "enableSchedule"
						slot0 = slot0.btnThrow
						slot0 = slot0.show

						slot0(slot0)

						uv0 = "enableSchedule"
						slot0 = slot0.autoFishCfg
						slot1 = slot0
						slot0 = slot0.set

						slot0(slot1, {})

						uv0 = "enableSchedule"
						uv1 = "unSchedule"
						slot0.autoType = slot1.END
						slot1 = gUnlockCsv.autoFish
						uv1 = "enableSchedule"
						slot1 = slot1.partner
						slot1 = slot1.setTouchEnabled

						slot1(slot1, dataEasy.isUnlock(slot1))

						uv1 = "enableSchedule"
						slot1 = slot1.fishLevel
						slot2 = slot1
						uv2 = "auto"

						if slot2 < slot1.read(slot2) then
							gGameUI:stackUI("city.adventure.fishing.upgrade")
						end

						gGameUI:showDialog({
							fontSize = 40,
							clearFast = true,
							btnType = 1,
							strs = {
								gLanguageCsv.fishingGameIsOverAutoIsStop
							}
						})
					end()
				end
			end
		end
	end)

	if slot0.isAuto and slot0.isAuto:read() == true then
		slot0:autoFishing()
	end

	slot7 = {
		[slot11] = {
			csvId = slot11,
			speed = slot12.speed,
			escape = slot12.escape,
			randMove = slot12.randMove,
			competitionSpeed = slot12.competitionSpeed,
			competitionEscape = slot12.competitionEscape,
			competitionRandMove = slot12.competitionRandMove,
			time = slot12.time,
			deadTime = slot12.deadTime
		}
	}

	for slot11, slot12 in csvPairs(csv.fishing.fish) do
		-- Nothing
	end

	slot0.fishTabs = idlers.new(slot7)

	slot0.fishTabs:update(slot7)
	slot0.btnTake:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv2 = "ccui"

			slot2:onTake()
		elseif slot1 == ccui.TouchEventType.ended or slot1 == ccui.TouchEventType.canceled then
			uv2 = "ccui"

			slot2:loosen()
		end
	end)
end

function slot1.initModel(slot0)
	slot0.fishLevel = gGameModel.fishing:getIdler("level")
	slot0.fishingRecord = gGameModel.daily_record:getIdler("fishing_record")
	slot0.fishingCounter = gGameModel.daily_record:getIdler("fishing_counter")
	slot0.selectRod = gGameModel.fishing:getIdler("select_rod")
	slot0.selectBait = gGameModel.fishing:getIdler("select_bait")
	slot0.selectPartner = gGameModel.fishing:getIdler("select_partner")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.fishModel = gGameModel.fishing:getIdler("fish")
	slot0.isAuto = gGameModel.fishing:getIdler("is_auto")
	slot0.autoStopped = gGameModel.fishing:getIdler("auto_stopped")
	slot0.autoAward = gGameModel.fishing:getIdler("auto_award")
	slot0.autoWinCounter = gGameModel.fishing:getIdler("auto_win_counter")
	slot0.autoFailCounter = gGameModel.fishing:getIdler("auto_fail_counter")
	slot0.crossFishingRound = gGameModel.role:getIdler("cross_fishing_round")
	slot0.autoStartTime = gGameModel.fishing:getIdler("auto_start_time")
end

function slot1.initSkel(slot0, slot1)
	slot2 = slot0:getResourceNode()
	slot3 = csv.fishing.scene[slot1]

	widget.addAnimationByKey(slot2, slot3.res, "diaoyuBg", "effect_loop", 2):xy(display.sizeInView.width / 2, display.sizeInView.height / 2 - 20):scale(2)

	slot0.diaoyuActionSkel = widget.addAnimationByKey(slot2, "diaoyu/diaoyu.skel", "diaoyu", "daiji_loop", 3)

	slot0.diaoyuActionSkel:anchorPoint(cc.p(0.5, 0.5)):xy(display.sizeInView.width / 2 + slot3.characterPos[1], display.sizeInView.height / 2 + slot3.characterPos[2]):scale(2)
	slot0.diaoyuActionSkel:setSkin("rod_0")
	slot0.waitPanel:xy(slot0.diaoyuActionSkel:x() + 20, slot0.diaoyuActionSkel:y() + 365)
	widget.addAnimationByKey(slot0.partnerPos, "koudai_miaowazhongzi/hero_miaowazhongzi.skel", "partner", "standby_loop", 1):scaleX(-1)

	slot0.fishingGameSkel = widget.addAnimationByKey(slot2, "fishing/diaoyudasai.skel", "diaoyudasai", "effect_loop", 3)
	slot8 = 0.5
	uv8 = "getResourceNode"

	slot0.fishingGameSkel:anchorPoint(cc.p(0.5, slot8)):xy(display.sizeInView.width / 2 - 720, display.sizeInView.height / 2 + slot8):scale(2)

	slot0.dasaixiaoren1 = widget.addAnimationByKey(slot2, "fishing/dasaixiaoren1.skel", "dasaixiaoren1", "effect_loop", 2)

	slot0.dasaixiaoren1:anchorPoint(cc.p(0.5, 0.5)):xy(display.sizeInView.width / 2 + 800, display.sizeInView.height / 2 + 60)

	slot0.dasaixiaoren2 = widget.addAnimationByKey(slot2, "fishing/dasaixiaoren2.skel", "dasaixiaoren2", "effect_loop", 2)

	slot0.dasaixiaoren2:anchorPoint(cc.p(0.5, 0.5)):xy(display.sizeInView.width / 2 + 600, display.sizeInView.height / 2 - 20)
end

function slot1.onThrow(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot0.partner:setTouchEnabled(false)
	itertools.invoke({
		slot0.btnThrow,
		slot0.timesPanel,
		slot0.btnRules,
		slot0.recordPanel,
		slot0.leftPanel,
		slot0.activityTip
	}, "hide")

	slot9 = slot0.diaoyuActionSkel
	slot9 = slot9.play

	slot9(slot9, "effect_paoxian")

	uv9 = "partner"
	slot0.exitType = slot9.SHOWTIP

	gGameApp:requestServer("/game/fishing/once/start", function (slot0)
		uv1 = "fishTab"
		uv2 = "fishTab"
		slot2 = slot2.fishTabs
		slot3 = slot2
		slot2 = slot2.atproxy(slot3, slot0.view.fish)
		slot1.fishTab = slot2
		uv2 = "fishTab"
		slot2 = slot2.fishTab.time[1]
		uv3 = "fishTab"
		slot1 = math.random(slot2, slot3.fishTab.time[2])
		uv2 = "fishTabs"

		if slot2 == 0 then
			uv2 = "fishTabs"

			if not slot2 then
				uv2 = "fishTabs"
				slot2 = slot2 - 1
			end
		end

		uv3 = "atproxy"
		uv4 = "fishTab"

		if slot4.idx == game.FISHING_GAME then
			uv4 = "fishTab"

			if slot4.fishTab.competitionSpeed ~= 0 then
				uv4 = "fishTab"

				if not slot4.fishTab.competitionSpeed then
					uv4 = "fishTab"
					slot4 = slot4.fishTab.speed
				end
			end
		end

		uv5 = "fishTab"

		if slot5.idx == game.FISHING_GAME then
			uv5 = "fishTab"

			if slot5.fishTab.competitionEscape ~= 0 then
				uv5 = "fishTab"

				if not slot5.fishTab.competitionEscape then
					uv5 = "fishTab"
					slot5 = slot5.fishTab.escape
				end
			end
		end

		uv6 = "view"
		uv7 = "fish"
		slot6 = slot6 + slot7
		uv7 = "math"
		uv9 = "random"
		uv10 = "time"
		uv10 = "idx"
		slot9 = slot1 * (1 - (slot9 + slot10 + slot10))
		uv9 = "fishTab"
		uv11 = "game"
		uv12 = "game"

		slot9.fishhook:height(slot11 + slot12 * slot2)

		slot11 = gCommonConfigCsv.fishingLowestWaitTimes
		slot9 = math.max(slot1 - math.ceil(slot9), slot11)
		uv11 = "fishTab"

		performWithDelay(slot11.diaoyuActionSkel, function ()
			uv0 = "waitPanel"
			slot0 = slot0.waitPanel
			slot0 = slot0.show

			slot0(slot0)

			uv0 = "waitPanel"
			slot0 = slot0.diaoyuActionSkel
			slot1 = slot0

			slot0.play(slot1, "dengdai_loop")

			uv1 = "waitPanel"
			uv3 = "show"

			performWithDelay(slot1, function ()
				uv4 = "requestServer"

				gGameApp:requestServer("/game/fishing/once/doing", function (slot0)
					uv1 = "partner"
					slot1 = slot1.partner
					slot1 = slot1.setTouchEnabled

					slot1(slot1, false)

					uv1 = "partner"
					slot1 = slot1.titleBack
					slot1 = slot1.hide

					slot1(slot1)

					uv1 = "partner"
					slot1 = slot1.waitPanel
					slot1 = slot1.hide

					slot1(slot1)

					uv1 = "partner"
					slot1 = slot1.diaoyuActionSkel
					slot2 = slot1
					slot1 = slot1.play
					slot3 = "shougan2_loop"

					slot1(slot2, slot3)

					uv1 = "partner"
					uv2 = "setTouchEnabled"
					slot1.exitType = slot2.CLOSE
					slot1 = itertools.invoke
					uv3 = "partner"
					slot3 = slot3.btnTake
					uv3 = "partner"
					slot3 = slot3.centerPanel
					uv3 = "partner"
					slot3 = slot3.imgTip
					uv3 = "partner"
					slot3 = "show"

					slot1({
						slot3,
						slot3,
						slot3,
						slot3.timesPanel
					}, slot3)

					uv1 = "partner"
					slot1 = slot1.fish
					slot1 = slot1.y
					uv3 = "partner"
					slot3 = slot3.fishBg:height() / 2

					slot1(slot1, slot3)

					uv1 = "partner"
					slot1 = slot1.fishhook
					slot1 = slot1.y
					uv3 = "partner"
					slot3 = slot3.fishBg
					slot4 = slot3

					slot1(slot1, slot3.height(slot4) / 2)

					uv1 = "partner"
					slot1 = slot1.scoreBar
					slot1 = slot1.setPercent
					slot3 = 33.333333333333336

					slot1(slot1, slot3)

					uv1 = "partner"
					slot1 = slot1.angling
					uv3 = "titleBack"
					uv4 = "hide"
					uv5 = "waitPanel"
					uv6 = "diaoyuActionSkel"

					slot1(slot1, slot3, slot4, slot5, slot6)

					uv1 = "partner"
					slot1 = slot1.fishMove
					uv3 = "play"
					uv4 = "partner"

					slot1(slot1, slot3, slot4.fishTab.deadTime)

					uv1 = "partner"
					slot1 = slot1.loosen

					slot1(slot1)

					uv1 = "partner"

					slot1:lineChange()
				end, slot4.view.fish)
			end, slot3)
		end, 3)
	end)
end

function slot1.angling(slot0, slot1, slot2, slot3, slot4)
	slot5 = 0
	slot8 = (slot1 + slot1 * slot3) / 20
	slot9 = (slot2 - slot2 * slot4) / 20

	slot0:enableSchedule()
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
	end, 0.05, 0, 1)
end

function slot1.fishMove(slot0, slot1, slot2)
	slot0:enableSchedule()

	slot3 = slot1
	slot5 = slot0.fishingPanel:height()
	slot6 = slot0.fish:height() / 2
	slot7 = 0 + slot6
	slot8 = slot0.fishBg:height() - slot6 - 130
	slot9 = {
		slot0.fishTab.randMove[1],
		slot0.fishTab.randMove[2]
	}

	if slot0.idx == game.FISHING_GAME and slot0.fishTab.competitionRandMove[1] then
		slot9 = {
			slot0.fishTab.competitionRandMove[1],
			slot0.fishTab.competitionRandMove[2]
		}
	end

	slot10 = 2
	slot11 = slot2
	slot12 = 0

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
	end, 1, 0, 2)
end

function slot1.onTake(slot0)
	slot0:enableSchedule():unSchedule(4)

	slot3 = slot0.fishBg:y() + slot0.fishBg:height() / 2 - slot0.fishhook:height() / 2 - 40
	slot4 = 25

	slot0:schedule(function ()
		uv0 = "fishhook"
		slot0 = slot0.fishhook
		slot1 = slot0
		uv1 = "y"
		slot0 = slot0.y(slot1) + slot1
		uv1 = "fishhook"
		slot1 = slot1.fishhook
		slot2 = slot1
		uv2 = "transition"

		if slot2 <= slot1.y(slot2) then
			uv0 = "transition"
		else
			uv1 = "fishhook"
			slot1 = slot1.fishhook
			slot2 = slot1
			uv2 = "y"
			uv2 = "transition"

			if slot2 < slot1.y(slot2) + slot2 then
				uv1 = "fishhook"
				slot1 = slot1.fishhook
				slot2 = slot1
				uv2 = "transition"

				if slot1.y(slot2) < slot2 then
					uv1 = "fishhook"
					slot1 = slot1.fishhook
					slot2 = slot1
					uv2 = "y"
					uv2 = "fishhook"
					slot2 = slot2.fishhook
					slot3 = slot2
					uv3 = "y"
					uv3 = "transition"
					slot0 = slot1.y(slot2) + slot2 - (slot2.y(slot3) + slot3 - slot3)
				end
			end
		end

		uv2 = "fishhook"
		uv4 = "fishhook"

		transition.executeParallel(slot2.fishhook):moveTo(0.05, slot4.fishhook:x(), slot0, true)
	end, 0.05, 0, 3)
end

function slot1.loosen(slot0)
	slot0:enableSchedule():unSchedule(3)

	slot3 = slot0.fishBg:y() - (slot0.fishBg:height() / 2 - slot0.fishhook:height() / 2 - 40)
	slot4 = 0
	slot5 = -5
	slot6 = -25

	slot0:schedule(function ()
		uv0 = "fishhook"
		uv0 = 0.05
		uv0 = "fishhook"

		if slot0 + 0.05 >= 0.6 then
			uv0 = "y"
			uv1 = "transition"

			if slot1 < slot0 then
				uv0 = "y"
				slot0 = slot0 - 1.5
				uv1 = 0.05
			end
		end

		uv0 = "executeParallel"
		slot0 = slot0.fishhook
		slot1 = slot0
		uv1 = "y"
		slot0 = slot0.y(slot1) + slot1
		uv1 = "executeParallel"
		slot1 = slot1.fishhook
		slot2 = slot1
		uv2 = "moveTo"

		if slot1.y(slot2) <= slot2 then
			uv0 = "moveTo"
		else
			uv1 = "executeParallel"
			slot1 = slot1.fishhook
			slot2 = slot1
			uv2 = "y"
			uv2 = "moveTo"

			if slot1.y(slot2) + slot2 < slot2 then
				uv1 = "executeParallel"
				slot1 = slot1.fishhook
				slot2 = slot1
				uv2 = "moveTo"

				if slot2 < slot1.y(slot2) then
					uv1 = "executeParallel"
					slot1 = slot1.fishhook
					slot2 = slot1
					uv2 = "y"
					uv2 = "executeParallel"
					slot2 = slot2.fishhook
					slot3 = slot2
					uv3 = "y"
					uv3 = "moveTo"
					slot0 = slot1.y(slot2) + slot2 - (slot2.y(slot3) + slot3 - slot3)
				end
			end
		end

		uv2 = "executeParallel"
		uv4 = "executeParallel"

		transition.executeParallel(slot2.fishhook):moveTo(0.05, slot4.fishhook:x(), slot0, true)
	end, 0.05, 0, 4)
end

function slot1.lineChange(slot0)
	slot0:schedule(function ()
		uv0 = "fishBg"
		slot0 = slot0.fishBg
		slot1 = slot0
		slot0 = slot0.height(slot1) / 2
		uv1 = "fishBg"
		slot1 = slot1.fishhook
		slot2 = slot1
		uv2 = "fishBg"

		slot2.line:height(slot0 - 120 + slot0 - slot1.y(slot2) < 67 and 67 or slot0 - 120 + slot0 - slot1)
	end, 0.01, 0, 5)
end

function slot1.finish(slot0, slot1)
	slot0:enableSchedule():unScheduleAll()

	slot4 = "daiji_loop"

	slot0.diaoyuActionSkel:play(slot4)

	uv4 = "enableSchedule"

	slot0.fishhook:height(slot4)

	if slot0.idx == game.FISHING_GAME then
		slot0.partner:setTouchEnabled(dataEasy.isUnlock(gUnlockCsv.gameAutoFish))
		slot0:fishingGameTimer()
	else
		slot0.partner:setTouchEnabled(dataEasy.isUnlock(gUnlockCsv.autoFish))
	end

	itertools.invoke({
		slot0.centerPanel,
		slot0.btnTake,
		slot0.imgTip
	}, "hide")
	itertools.invoke({
		slot0.btnThrow,
		slot0.timesPanel,
		slot0.btnRules,
		slot0.recordPanel,
		slot0.leftPanel,
		slot0.titleBack
	}, "show")

	slot2 = "fail"

	if slot1 then
		slot2 = "win"
	end

	slot5 = slot0.fishModel:read()[slot0.fishTab.csvId] and slot4[slot3].length_max or 0
	slot6 = slot0.fishLevel:read()
	slot7 = gGameModel.fishing:read("point")

	gGameApp:requestServerCustom("/game/fishing/once/end"):params(slot3, slot2):onResponse(function (slot0)
		uv1 = "win"

		if slot1 == "win" then
			uv1 = "idx"

			if slot1.idx == game.FISHING_GAME then
				slot1 = {}

				if slot0.view and slot0.view.top3 then
					for slot5, slot6 in ipairs(slot0.view.top3) do
						table.insert(slot1, slot6)
					end

					uv2 = "idx"

					slot2.ranksData:update(slot1)
				end
			end
		end

		uv1 = "game"
		slot1[1] = true
	end):wait({
		false
	}):doit(function (slot0)
		uv1 = "fishLevel"

		if slot1 then
			uv1 = "read"
			slot1 = slot1.fishLevel
			slot2 = slot1
			uv2 = "gGameUI"

			if slot2 < slot1.read(slot2) then
				uv6 = "read"
				uv10 = "stackUI"
				uv11 = "city.adventure.fishing.upgrade"
				uv12 = "createHandler"

				gGameUI:stackUI("city.adventure.fishing.upgrade", nil, , slot6:createHandler("fishSprite", slot0.view, slot10, slot11, slot12))
			else
				uv1 = "read"
				uv4 = "stackUI"
				uv5 = "city.adventure.fishing.upgrade"
				uv6 = "createHandler"

				slot1:fishSprite(slot0.view, slot4, slot5, slot6)
			end
		else
			gGameUI:showTip(gLanguageCsv.fishLose)
		end
	end)
end

function slot1.fishSprite(slot0, slot1, slot2, slot3, slot4)
	if slot1.award.carddbIDs then
		slot5, slot6, slot7 = dataEasy.mergeRawDate(slot1.award)

		gGameUI:stackUI("common.gain_sprite", {
			cb = slot0:createHandler("fishResult", slot2, slot1.length, slot1.award, slot3, slot4)
		}, {
			full = true
		}, slot5[1])
	else
		slot0:fishResult(slot2, slot1.length, slot1.award, slot3, slot4)
	end
end

function slot1.fishResult(slot0, slot1, slot2, slot3, slot4, slot5)
	gGameUI:stackUI("city.adventure.fishing.result", nil, {
		clickClose = true
	}, slot1, slot2, slot3, slot4, slot0.idx, slot5)
end

function slot1.onBtnLv(slot0)
	gGameUI:stackUI("city.adventure.fishing.level")
end

function slot1.onBtnHandbook(slot0)
	gGameUI:stackUI("city.adventure.fishing.book")
end

function slot1.onBtnShop(slot0)
	uiEasy.goToShop(game.SHOP_INIT.FISHING_SHOP)
end

function slot1.onBtnRank(slot0)
	gGameApp:requestServer("/game/cross/fishing/rank", function (slot0)
		gGameUI:stackUI("city.adventure.fishing.rank", nil, , slot0.view)
	end)
end

function slot1.onBtnTools(slot0)
	gGameUI:stackUI("city.adventure.fishing.bag", nil, , 1, slot0.idx)
end

function slot1.onBtnBait(slot0)
	gGameUI:stackUI("city.adventure.fishing.bag", nil, , 2, slot0.idx)
end

function slot1.onBtnRod(slot0)
	gGameUI:stackUI("city.adventure.fishing.bag", nil, , 1, slot0.idx)
end

function slot1.onPartnerClick(slot0, slot1)
	slot2 = {
		"#C0x5B545B#" .. gLanguageCsv.isAutoFishing,
		"#C0x999999#" .. gLanguageCsv.autoFishCanLose
	}
	slot3 = true

	if slot1 == "start" and slot0.onAutoBtn:read() == 0 and slot0.idx ~= game.FISHING_GAME then
		slot2 = {
			gLanguageCsv.fishGameStartIsAutoFishing
		}
		slot3 = false
	elseif slot1 == "closed" and slot0.idx == game.FISHING_GAME then
		gGameUI:showTip(gLanguageCsv.theContestIsOverCantFishing)

		return
	end

	gGameUI:showDialog({
		fontSize = 40,
		clearFast = true,
		btnType = 2,
		strs = slot2,
		cb = function ()
			uv0 = "onAutoBtn"
			slot0 = slot0.onAutoBtn
			slot0 = slot0.set

			slot0(slot0, 1)

			uv0 = "onAutoBtn"

			slot0:autoFishing("click")
		end,
		isRich = slot3
	})
end

function slot1.autoFishing(slot0, slot1)
	uv2 = "autoType"
	slot0.autoType = slot2.BEGAN

	slot0.auto:show()
	slot0.btnThrow:hide()
	slot0.auto:get("txt"):text(gLanguageCsv.canBackToCity)

	slot2 = slot0.fishLevel:read()

	slot0:enableSchedule()

	if slot1 == "click" then
		slot0.partner:setTouchEnabled(false)
		gGameApp:requestServer("/game/fishing/auto/start")
	else
		gGameApp:requestServer("/game/fishing/main", function (slot0)
			uv1 = "idx"

			if slot1.idx == game.FISHING_GAME then
				slot1 = {}

				if slot0.view and slot0.view.top3 then
					for slot5, slot6 in ipairs(slot0.view.top3) do
						table.insert(slot1, slot6)
					end

					uv2 = "idx"

					slot2.ranksData:update(slot1)
				end
			end
		end)
	end

	slot3 = 0

	idlereasy.when(slot0.autoStartTime, function ()
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
	end)
	slot0.txtRefreshTime:text(gLanguageCsv.nextFishing)
	adapt.oneLinePos(slot0.txtRefreshTime, slot0.refreshTime, cc.p(0, 0), "left")

	if slot1 == "click" then
		function ()
			uv1 = "gCommonConfigCsv"

			slot1:schedule(function ()
				gGameApp:requestServer("/game/fishing/main", function (slot0)
					uv1 = "idx"

					if slot1.idx == game.FISHING_GAME then
						slot1 = {}

						if slot0.view and slot0.view.top3 then
							for slot5, slot6 in ipairs(slot0.view.top3) do
								table.insert(slot1, slot6)
							end

							uv2 = "idx"

							slot2.ranksData:update(slot1)
						end
					end
				end)
			end, gCommonConfigCsv.fishingAutoDuration + 1, 0, 6000)
		end()
	else
		performWithDelay(slot0, function ()
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
		end, slot3 - 1)
	end

	idlereasy.any({
		slot0.autoStopped,
		slot0.autoAward,
		slot0.autoWinCounter,
		slot0.autoFailCounter
	}, function (slot0, slot1, slot2, slot3, slot4)
		slot5 = {}
		uv6 = "auto"
		slot6 = slot6.auto:get("btnOk")
		slot6 = slot6.visible

		slot6(slot6, slot1 == true)

		uv6 = "auto"
		slot6 = slot6.auto:get("btnStop")
		slot6 = slot6.visible

		slot6(slot6, slot1 == false)

		uv6 = "auto"
		slot6 = slot6.auto:get("tipView")
		slot6 = slot6.visible

		slot6(slot6, slot1 == false)

		uv6 = "auto"
		slot6 = slot6.txtRefreshTime
		slot6 = slot6.visible

		slot6(slot6, slot1 == false)

		uv6 = "auto"
		slot6 = slot6.refreshTime
		slot6 = slot6.visible

		slot6(slot6, slot1 == false)

		uv6 = "auto"
		slot6 = slot6.auto:get("tipOver")
		slot7 = slot6
		slot6 = slot6.visible

		if slot1 == true then
			uv8 = "auto"

			if slot8.nowTimes ~= 0 then
				if slot1 == true then
					uv8 = "auto"

					if slot8.baitCount then
						uv8 = "auto"

						if slot8.nowTimes <= 0 then
							slot8 = false
						end
					end
				end
			else
				slot8 = true
			end
		end

		slot6(slot7, slot8)

		uv6 = "auto"
		slot6 = slot6.auto:get("tipOver1")
		slot7 = slot6
		slot6 = slot6.visible

		if slot1 == true then
			uv8 = "auto"

			if not slot8.baitCount then
				uv8 = "auto"

				if slot8.nowTimes <= 0 then
					slot8 = false
				else
					slot8 = true
				end
			end
		end

		slot6(slot7, slot8)

		uv6 = "auto"
		slot6 = slot6.autoFish:get("txt2")
		slot6 = slot6.text

		slot6(slot6, slot3 + slot4)

		uv6 = "auto"
		slot6 = slot6.autoFish:get("txt4")
		slot6 = slot6.text

		slot6(slot6, slot3)

		uv6 = "auto"
		slot6 = slot6.autoFish:get("txt6")
		slot7 = slot6

		slot6.text(slot7, slot4)

		uv7 = "auto"
		slot9 = "txt1"
		uv9 = "auto"
		slot9 = slot9.autoFish:get("txt2")
		uv9 = "auto"
		slot9 = slot9.autoFish:get("txt3")
		uv9 = "auto"
		slot9 = slot9.autoFish:get("txt4")
		uv9 = "auto"
		slot9 = slot9.autoFish:get("txt5")
		uv9 = "auto"
		slot9 = slot9.autoFish:get("txt6")
		uv9 = "auto"

		adapt.oneLinePos(slot7.autoFish:get(slot9), {
			slot9,
			slot9,
			slot9,
			slot9,
			slot9,
			slot9.autoFish:get("txt7")
		}, cc.p(5, 0), "left")

		if slot2.fish then
			uv6 = "auto"

			slot6.autoFishCfg:set(slot2.fish)
		end

		if slot2.type1 then
			for slot9, slot10 in pairs(slot2.type1) do
				table.insert(slot5, {
					key = slot9,
					val = slot10
				})
			end
		end

		if slot2.type2 then
			for slot9, slot10 in pairs(slot2.type2) do
				table.insert(slot5, {
					key = slot9,
					val = slot10
				})
			end
		end

		if slot2.cards then
			for slot9, slot10 in pairs(slot2.cards) do
				table.insert(slot5, {
					key = "id",
					val = slot10.id
				})
			end
		end

		uv6 = "auto"

		slot6.autoAwardCfg:update(slot5)
	end)

	function slot5()
		uv0 = "enableSchedule"
		slot0 = slot0:enableSchedule()
		slot0 = slot0.unSchedule

		slot0(slot0, 6000)

		uv0 = "enableSchedule"
		slot0 = slot0:enableSchedule()
		slot1 = slot0
		slot0 = slot0.unSchedule

		slot0(slot1, 7000)

		uv0 = "enableSchedule"
		uv1 = "unSchedule"
		slot0.autoType = slot1.END
		uv0 = "enableSchedule"
		slot0 = slot0.auto
		slot0 = slot0.hide

		slot0(slot0)

		uv0 = "enableSchedule"
		slot0 = slot0.btnThrow
		slot0 = slot0.show

		slot0(slot0)

		uv0 = "enableSchedule"

		slot0.autoFishCfg:set({})

		slot1 = gUnlockCsv.autoFish
		uv1 = "enableSchedule"
		slot1 = slot1.partner
		slot1 = slot1.setTouchEnabled

		slot1(slot1, dataEasy.isUnlock(slot1))

		uv1 = "enableSchedule"
		slot1 = slot1.fishLevel
		slot2 = slot1
		uv2 = "autoType"

		if slot2 < slot1.read(slot2) then
			gGameUI:stackUI("city.adventure.fishing.upgrade")
		end
	end

	bind.touch(slot0, slot0.auto:get("btnOk"), {
		methods = {
			ended = function ()
				uv3 = "gGameApp"

				gGameApp:requestServer("/game/fishing/auto/end", slot3)
			end
		}
	})
	bind.touch(slot0, slot0.auto:get("btnStop"), {
		methods = {
			ended = function ()
				uv3 = "gGameApp"

				gGameApp:requestServer("/game/fishing/auto/end", slot3)
			end
		}
	})
end

function slot1.onShowRule(slot0)
	slot1 = slot0:createHandler("getRuleContext")

	if slot0.idx == game.FISHING_GAME then
		slot1 = slot0:createHandler("getGameRuleContext")
	end

	gGameUI:stackUI("common.rule", nil, , slot1, {
		width = 1800
	})
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.angling)
		end),
		slot2.noteText(93001, 94000)
	}
end

function slot1.getGameRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.FishingCompetition)
		end),
		slot2.noteText(94001, 95000)
	}
end

function slot1.initActivityTip(slot0, slot1)
	if slot1 == nil or slot1 == "closed" then
		slot0.activityTip:hide()
		slot0.activityTip:removeChildByName("gojt")

		return
	end

	widget.addAnimationByKey(slot0.activityTip, "huodongtixing/huodongtixing.skel", "gojt", "effect_loop", 1):alignCenter(slot0.activityTip:size())
	bind.touch(slot0, slot0.activityTip, {
		methods = {
			ended = function ()
				gGameApp:requestServer("/game/fishing/main", function (slot0)
					uv1 = "isAuto"

					if slot1.isAuto:read() == true then
						gGameUI:showTip(gLanguageCsv.switchSenceNeedStopAutoFishing)
					else
						uv1 = "read"

						if slot1 == "closed" then
							uv1 = "isAuto"
							slot1 = slot1.activityTip
							slot1 = slot1.hide

							slot1(slot1)

							uv1 = "isAuto"

							slot1.activityTip:removeChildByName("gojt")
							gGameUI:showDialog({
								fontSize = 50,
								clearFast = true,
								btnType = 1,
								strs = {
									"#C0x5B545B#" .. gLanguageCsv.theContestIsOver
								}
							})

							return
						else
							gGameApp:requestServer("/game/cross/fishing/rank", function (slot0)
								uv1 = "getParent"
								slot1 = slot1:getParent().showTab
								slot2 = slot1
								slot1 = slot1.set

								slot1(slot2, game.FISHING_GAME)

								uv1 = "showTab"
								uv2 = "getParent"

								slot1.onClose(slot2)
								gGameApp:requestServer("/game/fishing/prepare", nil, "scene", game.FISHING_GAME)
								gGameUI:stackUI("city.adventure.fishing.view", nil, {
									full = true
								}, game.FISHING_GAME, slot0.view)
							end)
						end
					end
				end)
			end
		}
	})
	slot0.activityTip:show()
end

function slot1.fishingGameTimer(slot0)
	slot2 = time.getNumTimestamp(tonumber(time.getTodayStr()), 23)

	slot0:enableSchedule()
	slot0:schedule(function ()
		uv0 = "time"

		if slot0 - time.getTime() <= 0 then
			uv1 = "getTime"

			slot1.timer:hide()
		end

		uv1 = "getTime"

		slot1.gameTimer:set(slot0)
	end, 1, 0, 8000)
end

function slot1.onitemClick(slot0, slot1, slot2, slot3, slot4)
	gGameUI:showItemDetail(slot2, {
		key = "card",
		num = slot4.val
	})
end

function slot1.onClose(slot0)
	uv2 = "exitType"

	if slot0.exitType == slot2.SHOWTIP then
		gGameUI:showDialog({
			fontSize = 50,
			clearFast = true,
			btnType = 2,
			isRich = true,
			strs = {
				"#C0x5B545B#" .. gLanguageCsv.stopFishingAndExit
			},
			cb = function ()
				uv0 = "addCallbackOnExit"
				slot1 = slot0
				slot0 = slot0.addCallbackOnExit
				uv2 = "addCallbackOnExit"

				slot0(slot1, slot2.cb)

				uv0 = "cb"
				uv1 = "addCallbackOnExit"

				slot0.onClose(slot1)
			end
		})
	else
		slot1 = slot0.addCallbackOnExit

		slot1(slot0, slot0.cb)

		uv1 = "SHOWTIP"

		slot1.onClose(slot0)
	end
end

return slot1
